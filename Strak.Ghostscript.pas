unit Strak.Ghostscript;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Gauges;

type
  aString = ansistring; // string para versão antiga do delphi
  PChar = Pansichar; // pchar para versão antiga do delphi
  PPChar = array of Pansichar; // pchar para versão antiga do delphi

  ThreadExec = class(TThread)
  private
    { Private declarations }
    Fdir: aString;
    FoutPdf: aString;
    Ffiles: Tstrings;
    Fgauge: Tgauge;
  protected
    procedure Execute; override;
  public
  end;

  ThreadExecEx = class(TThread)
  private
    { Private declarations }
    Fdir: aString;
    FinPdf: aString;
    FoutPdf: aString;
    Fgauge: Tgauge;
    Fsize: longint;
  protected
    procedure Execute; override;
  public
  end;

  TGSAPIrevision = packed record
    product: PChar;
    copyright: PChar;
    revision: longint;
    revisiondat: longint;
  end;

  PGSAPIrevision = ^TGSAPIrevision;
  Pgs_main_instance = Pointer;

function JuntaPdfs(dir, outPdf: aString; files: array of aString)
  : Integer; overload;
function JuntaPdfsSize(dir, outPdf: aString; files: array of aString;
  size: longint = 0; gauge: Tgauge = nil): Integer;
function JuntaPdfs(dir, outPdf: aString; files: Tstrings): Integer; overload;
procedure JuntaPdfsProcess(dir, outPdf: aString; files: Tstrings;
  gauge: Tgauge = nil);

function DividirPdf(dir, inPdf, outPdf: aString; size: longint;
  gauge: Tgauge = nil): Integer;

implementation

{ funções e procedure da dll gsdll32.dll }
function gsapi_new_instance(pinstance: Pgs_main_instance;
  caller_handle: Pointer): Integer; stdcall; external 'gsdll32.dll';
function gsapi_init_with_args(pinstance: Pgs_main_instance; argc: Integer;
  argv: PPChar): Integer; stdcall; external 'gsdll32.dll';

function gsapi_run_string_begin(pinstance: Pgs_main_instance;
  user_errors: Integer; pexit_code: Integer): Integer; stdcall;
  external 'gsdll32.dll';
function gsapi_run_string_continue(pinstance: Pgs_main_instance; str: PChar;
  length: Integer; user_errors: Integer; pexit_code: Integer): Integer; stdcall;
  external 'gsdll32.dll';
function gsapi_run_string_end(pinstance: Pgs_main_instance;
  user_errors: Integer; pexit_code: Integer): Integer; stdcall;
  external 'gsdll32.dll';

function gsapi_exit(pinstance: Pgs_main_instance): Integer; stdcall;
  external 'gsdll32.dll';
procedure gsapi_delete_instance(pinstance: Pgs_main_instance); stdcall;
  external 'gsdll32.dll';
function gsapi_set_arg_encoding(pinstance: Pgs_main_instance; ENCODING: Integer)
  : Integer; stdcall; external 'gsdll32.dll';

function JuntaPdfs(dir, outPdf: aString; files: array of aString): Integer;
const
  GS_ARG_ENCODING_LOCAL = 0;
  GS_ARG_ENCODING_UTF8 = 1;
  e_Quit = -990;
var
  code, code1, gsargc, i: Integer;
  gsargvT: array of aString;
  gsargv: PPChar;
  minst: PGSAPIrevision;
begin
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := 'gs';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-dBATCH';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-dNOPAUSE';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-q';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-sDEVICE=pdfwrite';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-sOutputFile=' + dir + outPdf;

  for i := Low(files) to High(files) do
  begin
    setlength(gsargvT, length(gsargvT) + 1);
    gsargvT[high(gsargvT)] := AnsiToUtf8(dir + files[i]);
    // uso AnsiToUtf8 fundamental em delphi recente
  end;
  gsargc := length(gsargvT);

  setlength(gsargv, length(gsargvT));
  for i := Low(gsargvT) to High(gsargvT) do
    gsargv[i] := PChar(gsargvT[i]);

  code := gsapi_new_instance(@minst, nil);
  if (code < 0) then
  begin
    result := 1;
    exit;
  end;

  code := gsapi_set_arg_encoding(minst, GS_ARG_ENCODING_UTF8);

  if (code = 0) then
    code := gsapi_init_with_args(minst, gsargc, @gsargv[0]);

  code1 := gsapi_exit(minst);

  if ((code = 0) or (code = e_Quit)) then
    code := code1;

  gsapi_delete_instance(minst);

  if ((code = 0) or (code = e_Quit)) then
  begin
    result := 0;
    exit;
  end;

  result := 1;
end;

function JuntaPdfs(dir, outPdf: aString; files: Tstrings): Integer;
var
  afiles: array of aString;
  i: Integer;
begin
  setlength(afiles, files.Count);
  for i := 0 to files.Count - 1 do
    afiles[i] := files.Strings[i];
  result := JuntaPdfs(dir, outPdf, afiles);
end;

procedure JuntaPdfsProcess(dir, outPdf: aString; files: Tstrings;
  gauge: Tgauge = nil);
var
  mythread: ThreadExec;
begin
  mythread := ThreadExec.Create(true);
  mythread.Fdir := dir;
  mythread.FoutPdf := outPdf;
  mythread.Ffiles := files;
  mythread.Fgauge := gauge;
  mythread.FreeOnTerminate := true;
  mythread.Resume;
end;

{ ThreadExec }
procedure ThreadExec.Execute;
var
  tmpfiles, afiles: Tstrings;
  tempname: aString;
  i, p, pcount, Mprocess: Integer;
begin
  inherited;
  afiles := Tstringlist.Create;
  tmpfiles := Tstringlist.Create;
  afiles.Text := Ffiles.Text;
  Mprocess := Ffiles.Count;
  if Fgauge <> nil then
    Fgauge.MaxValue := Mprocess;
  p := 0;
  repeat
    tmpfiles.Clear;
    pcount := afiles.Count div 2;
    for i := 0 to pcount - 1 do
    begin
      inc(p);
      tempname := 'file' + formatfloat('0', p) + '.tmp';
      JuntaPdfs(Fdir, tempname, [afiles.Strings[i * 2],
        afiles.Strings[i * 2 + 1]]);
      if pos('.TMP', uppercase(afiles.Strings[i * 2])) <> 0 then
        deletefile(Fdir + afiles.Strings[i * 2]);
      if pos('.TMP', uppercase(afiles.Strings[i * 2 + 1])) <> 0 then
        deletefile(Fdir + afiles.Strings[i * 2 + 1]);
      tmpfiles.Add(tempname);
      if Fgauge <> nil then
        Fgauge.Progress := Mprocess - (afiles.Count - tmpfiles.Count - 1);
    end;
    if afiles.Count mod 2 <> 0 then
      tmpfiles.Add(afiles.Strings[afiles.Count - 1]);
    afiles.Text := tmpfiles.Text;
  until tmpfiles.Count <= 1;
  RenameFile(Fdir + tempname, Fdir + FoutPdf);
  afiles.Free;
  tmpfiles.Free;
end;

function getFileSizeInBytes(const fn: string): Integer;
var
  f: File of byte;
begin
  result := -1;
  if (FileExists(fn)) then
    try
{$I-} AssignFile(f, fn);
      Reset(f); {$I+}
      if (IOResult = 0) then
        result := FileSize(f)
      else
        result := 0;
    finally
{$I-} CloseFile(f); {$I+}
    end;
end;

type
  TarrayaString = array of aString;

procedure GetFiles(dir: String; var files: TarrayaString);
var
  SRec: TSearchRec;
  Res: Integer;
begin
  setlength(files, 0);
  Res := FindFirst(dir + '\*.str', faAnyfile, SRec);
  if Res = 0 then
    try
      while Res = 0 do
      begin
        if (SRec.Attr and faDirectory <> faDirectory) then
        begin
          setlength(files, length(files) + 1);
          files[high(files)] := SRec.Name;
        end;
        Res := FindNext(SRec);
      end;
    finally
      FindClose(SRec)
    end;
end;

function JuntaPdfsSize(dir, outPdf: aString; files: array of aString;
  size: longint = 0; gauge: Tgauge = nil): Integer;
Type
  TList = array of aString;
var
  Lists: array of TList;
  i, p: Integer;
  listIndex, tam: longint;
  nome: aString;
begin
  if pos('.PDF', uppercase(outPdf)) = 0 then
    outPdf := outPdf + '.pdf';
  outPdf := StringReplace(outPdf, '.pdf', '%var%.pdf', [rfIgnoreCase]);

  setlength(Lists, length(Lists) + 1);
  listIndex := 0;
  tam := 0;

  for i := low(files) to high(files) do
  begin
    if tam + getFileSizeInBytes(dir + files[i]) <= size then
    begin
      setlength(Lists[listIndex], length(Lists[listIndex]) + 1);
      Lists[listIndex][high(Lists[listIndex])] := files[i];
      tam := tam + getFileSizeInBytes(dir + files[i]);
    end
    else
    begin
      setlength(Lists, length(Lists) + 1);
      inc(listIndex);
      setlength(Lists[listIndex], length(Lists[listIndex]) + 1);
      Lists[listIndex][high(Lists[listIndex])] := files[i];
      tam := getFileSizeInBytes(dir + files[i]);
    end;
  end;

  if gauge <> nil then
  begin
    gauge.MaxValue := length(Lists) * 2;
    gauge.Progress := length(Lists);
  end;

  for i := low(Lists) to high(Lists) do
  begin
    nome := StringReplace(outPdf, '%var%', formatfloat('00000', i), []);
    JuntaPdfs(dir, nome, Lists[i]);
    for p := Low(Lists[i]) to High(Lists[i]) do
      deletefile(dir + Lists[i][p]);
    if gauge <> nil then
      gauge.Progress := gauge.Progress + 1;
  end;

end;

function DividirPdf(dir, inPdf, outPdf: aString; size: longint;
  gauge: Tgauge = nil): Integer;
var
  mythread: ThreadExecEx;
begin
  mythread := ThreadExecEx.Create(true);
  mythread.Fdir := dir;
  mythread.FinPdf := inPdf;
  mythread.FoutPdf := outPdf;
  mythread.Fsize := size;
  mythread.Fgauge := gauge;
  mythread.FreeOnTerminate := true;
  mythread.Resume;
end;

procedure ThreadExecEx.Execute;
const
  GS_ARG_ENCODING_LOCAL = 0;
  GS_ARG_ENCODING_UTF8 = 1;
  e_Quit = -990;
var
  code, code1, gsargc, i: Integer;
  gsargvT: array of aString;
  gsargv: PPChar;
  minst: PGSAPIrevision;
  files: TarrayaString;
begin
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := 'gs';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-dBATCH';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-dNOPAUSE';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-sDEVICE=pdfwrite';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := '-dFirstPage=1';
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := AnsiToUtf8('-sOutputFile=' + Fdir +
    StringReplace(FoutPdf, '.pdf', '%05d.str', [rfIgnoreCase]));
  setlength(gsargvT, length(gsargvT) + 1);
  gsargvT[high(gsargvT)] := AnsiToUtf8(Fdir + FinPdf);
  gsargc := length(gsargvT);
  setlength(gsargv, length(gsargvT));
  for i := Low(gsargvT) to High(gsargvT) do
    gsargv[i] := PChar(gsargvT[i]);
  code := gsapi_new_instance(@minst, nil);

  if (code < 0) then
    exit;

  code := gsapi_set_arg_encoding(minst, GS_ARG_ENCODING_UTF8);

  if (code = 0) then
    code := gsapi_init_with_args(minst, gsargc, @gsargv[0]);

  code1 := gsapi_exit(minst);

  if ((code = 0) or (code = e_Quit)) then
    code := code1;

  gsapi_delete_instance(minst);

  GetFiles(Fdir, files);
  JuntaPdfsSize(Fdir, FoutPdf, files, Fsize, Fgauge);
end;

end.
