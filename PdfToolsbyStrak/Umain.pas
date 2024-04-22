unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.ExtCtrls, Vcl.Samples.Gauges, StdCtrls, Gauges, Controls, ExtCtrls,
  FileCtrl, Classes;

type
  TForm3 = class(TForm)
    Button1: TButton;
    DirectoryListBox1: TDirectoryListBox;
    Edit1: TEdit;
    DriveComboBox1: TDriveComboBox;
    Button3: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ListBox2: TListBox;
    Gauge1: TGauge;
    Panel2: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Edit2: TEdit;
    procedure DirectoryListBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Strak.Ghostscript;

procedure FindFiles(StartDir, FileMask: string; FilesList: Tstrings);
var
  SR: TSearchRec;
  IsFound: Boolean;
  i: integer;
begin
  if StartDir[length(StartDir)] <> '\' then
    StartDir := StartDir + '\';

  FilesList.Clear;
  IsFound := FindFirst(StartDir + FileMask, faAnyFile - faDirectory, SR) = 0;
  while IsFound do
  begin
    FilesList.Add( { StartDir + } SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin

  if Edit2.Text <> '' then
  begin
    if pos('.PDF', uppercase(Edit2.Text)) = 0 then
      Edit2.Text := Edit2.Text + '.pdf';
    case ComboBox1.ItemIndex of
      0: // 500kb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          500 * 1024, Gauge1);
      1: // 1 mb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          1024 * 1024 * 1, Gauge1);
      2: // 2mb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          1024 * 1024 * 2, Gauge1);
      3: // 5mb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          1024 * 1024 * 5, Gauge1);
      4: // 10mb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          1024 * 1024 * 10, Gauge1);
      5: // 20mb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          1024 * 1024 * 20, Gauge1);
      6: // 30 mb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          1024 * 1024 * 30, Gauge1);
      7: // 50 mb
        DividirPdf(DirectoryListBox1.Directory + '\',
          ListBox1.Items.Strings[ListBox1.ItemIndex], Edit2.Text,
          1024 * 1024 * 50, Gauge1);
    end;
    JuntaPdfsProcess(DirectoryListBox1.Directory + '\', Edit1.Text,
      ListBox2.Items, Gauge1);
  end;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    if pos('.PDF', uppercase(Edit1.Text)) = 0 then
      Edit1.Text := Edit1.Text + '.pdf';
    JuntaPdfsProcess(DirectoryListBox1.Directory + '\', Edit1.Text,
      ListBox2.Items, Gauge1);
  end;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    ListBox2.Items.Add(ListBox1.Items[ListBox1.ItemIndex]);
    DirectoryListBox1Click(Sender);
  end;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  if ListBox2.ItemIndex <> -1 then
  begin
    ListBox2.Items.Delete(ListBox2.ItemIndex);
    DirectoryListBox1Click(Sender);
  end;
end;

procedure TForm3.Button6Click(Sender: TObject);
var
  i: longint;
begin
  for i := 0 to ListBox1.Items.Count - 1 do
    ListBox2.Items.Add(ListBox1.Items[i]);
  DirectoryListBox1Click(Sender);
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  ListBox2.Clear;
  DirectoryListBox1Click(Sender);
end;

procedure TForm3.Button8Click(Sender: TObject);
var
  temp: string;
begin
  if ListBox2.ItemIndex > 0 then
  begin
    temp := ListBox2.Items[ListBox2.ItemIndex - 1];
    ListBox2.Items[ListBox2.ItemIndex - 1] := ListBox2.Items
      [ListBox2.ItemIndex];
    ListBox2.Items[ListBox2.ItemIndex] := temp;
    ListBox2.ItemIndex := ListBox2.ItemIndex - 1;
    DirectoryListBox1Click(Sender);
  end;
end;

procedure TForm3.Button9Click(Sender: TObject);
var
  temp: string;
begin
  if ListBox2.ItemIndex < ListBox2.Items.Count - 1 then
  begin
    temp := ListBox2.Items[ListBox2.ItemIndex + 1];
    ListBox2.Items[ListBox2.ItemIndex + 1] := ListBox2.Items
      [ListBox2.ItemIndex];
    ListBox2.Items[ListBox2.ItemIndex] := temp;
    ListBox2.ItemIndex := ListBox2.ItemIndex + 1;
    DirectoryListBox1Click(Sender);
  end;
end;

procedure TForm3.DirectoryListBox1Change(Sender: TObject);
begin
  DirectoryListBox1Click(Sender);
end;

procedure TForm3.DirectoryListBox1Click(Sender: TObject);
var
  i: longint;
begin
  FindFiles(DirectoryListBox1.Directory, '*.pdf', ListBox1.Items);
  for i := ListBox1.Items.Count - 1 downto 0 do
    if ListBox2.Items.IndexOf(ListBox1.Items[i]) <> -1 then
      ListBox1.Items.Delete(i);
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  DirectoryListBox1Click(Sender);
end;

end.

  gs - dBATCH - dNOPAUSE - sDEVICE = pdfwrite - dFirstPage = 2 - dLastPage = 2 -
  sOutputFile = page2.pdf
