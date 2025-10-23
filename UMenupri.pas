unit UMenupri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Math, IniFiles, Printers, StdCtrls, Mask, DBCtrls,
  ExtCtrls, RXDBCtrl, rxMemTable, Variants, rxToolEdit, rxCurrEdit, RxMemDS,
  ComObj, DB, ValExecDB;

type
  TMenuprin = class(TForm)
    Database1: TDatabase;
    SP_DataSis: TStoredProc;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure MessageHandle(var Msg: TMsg; var Handled: Boolean);
    { Public declarations }
  end;

function  NumImp(VImpr: String): integer;
procedure ImprDef(VImpr: String);
Function  Alinha_Nota(nota:real):string;
function  Alinha_RA(ra:string): string;
Function  Valida_Usuario(codcur,coddis:integer;ra:real): boolean;
Function  Valida_Usuario2(codcur: smallint): boolean;
Procedure Habilita(TF:TForm);
Procedure Desabilita(TF:TForm);
Procedure Limpa(TF:TForm);
Function  Data_Valida(data: string): boolean;
function  Replicate(value: String; qtde: Word): String;
Function  Valida_Wagner(codcur,coddis,ra: integer): boolean;
Function  Mascara_Disc(coddis:integer) : string;
Function  Muda_Impressora(Imp: String):Boolean;
Function  Alinha_Freq(frequencia:real):string;
Procedure Filtra_Unidade(Q:TQuery);
Procedure Consulta_Cursos(Q:TQuery);
Procedure Filtra_Unidade2(Q:TQuery);
Function Consulta_Curso(Q:TQuery;vcodcur:Integer):Boolean;
Function Carrega_UrlApi(banco:string):String;

var
  Menuprin: TMenuprin;
  Mes: Array[1..12] of String;
  vsetor,vcodusu,vtipo,vmatr,vpolo,vEvaldo,vitl_seq, vhdg_seq:Integer;
  vnivel,vunidade,vhab,vcurso, vligacao,vtamfontdisc:word;
  vbanco:string; // P - produção D - desenvolvimento
  vsegundavia:string; // S - sim N - não
  vcompleta:string; // S - histórico escolar completo N - histórico escolar normal
  vexibemensagem:string; // exibir ou não mensagem do programa - messagedlg
  DataSis: TDateTime;
  Desab,Desab2,teste, rvhe:boolean;
  CampusI, CampusII, RACurrency, RAMask, vcabprof, vexibe, vGED, valida_historico,
  tipo_historico, historico_conferencia, EnderecoPrudente, EnderecoJau, EnderecoGuaruja:string;
  vRA:real;
  vPastaServidor:string;
  vRecredenciamento:string;

implementation

uses UProcs, URegDip, URHist8, ULivDipl, URHisPs7, UExtPub, URHist9, URHisPs8, UArGrade,
  URHisto2;

{$R *.DFM}

Function Consulta_Curso(Q:TQuery;vcodcur:Integer):Boolean;
Begin
 Q.Close;
 Q.Sql.Clear;
 Q.Sql.Add('select cur_codigo, cur_nomcur, cur_nomred, c.fac_codigo, fac_nome, fac_facred, cur_ident, set_codigo, ccu_codigo, cur_codgra, cur_area');
 Q.Sql.Add('from sca_cursos c, sca_faculdade f');
 Q.Sql.Add('where c.fac_codigo = f.fac_codigo and (set_codigo is null or set_codigo <> 1053)');
 If (vunidade <> 999) and (vunidade <> 0) // Geral
 Then
  Begin
   If (vnivel = 27) // Coordenador
   Then
    Begin
     Q.Sql.Add('and cur_codigo in (select cur_codigo from sca_cursofunc where fun_codigo =:matr)');
     Q.ParamByName('matr').AsInteger:=vcodusu;
    End
   Else
    If (vsetor = 549) or (vcodusu = 49324) or (vcodusu = 44803) or (vcodusu = 37961) // Secretaria Agrárias ou Wagner,Renato,Evaldo
    Then Q.Sql.Add('and (cam_codigo = 1 or cam_codigo = 4)')
    Else
     If vsetor = 1248 // Secretaria Venceslau
     Then Q.Sql.Add('and cam_codigo = 4')
     Else
      Begin
       Q.Sql.Add('and cam_codigo =:cod');
       Q.ParamByName('cod').AsInteger:=vunidade;
      End;
  End;
 Q.Sql.Add('and c.cur_codigo =:codcur');
 Q.ParamByName('codcur').AsInteger:=vcodcur;
 Q.Open;
 If Q.Eof
 Then Result:=False
 Else Result:=True;
End;

Procedure Filtra_Unidade2(Q:TQuery);
Begin
 If (vunidade <> 999) and (vunidade <> 0)
 Then
  Begin
   Q.Sql.Add('and (cur_codigo is null or cur_codigo in (select cur_codigo from sca_cursos where cam_codigo =:unid))');
   Q.ParamByName('unid').AsInteger:=vunidade;
  End;
End;

Procedure Consulta_Cursos(Q:TQuery);
Begin
 Q.Close;
 Q.Sql.Clear;
// Q.Sql.Add('select cur_codigo, trim(c.cur_nomcur)||decode(c.emp_codigo,1,""," ("||trim(emp_abreviado)||")") cur_nomcur, cur_nomred, c.fac_codigo, fac_nome, fac_facred, cur_ident, c.set_codigo, s.set_descr,');
 Q.Sql.Add('select cur_codigo, cur_nomcur, cur_nomred, c.fac_codigo, fac_nome, fac_facred, cur_ident, c.set_codigo, s.set_descr,');
 Q.Sql.Add('       c.ccu_codigo, cur_codgra, cur_area, cur_nome, fac_completo, cur_tippagto, cur_duracao, s.fun_matr, cur_nomtit, cur_gradistancia,');
 Q.Sql.Add('       cur_durdiurno, cur_periodo, c.cam_codigo, cur_grapos, e.emp_codigo, e.emp_eventual');
 Q.Sql.Add('from sca_cursos c, sca_faculdade f, outer crp_setores s, outer crp_empresas e');
// Q.Sql.Add('where c.fac_codigo = f.fac_codigo and (c.set_codigo is null or c.set_codigo <> 1053)');
 Q.Sql.Add('where c.fac_codigo = f.fac_codigo and c.set_codigo = s.set_codigo and c.emp_codigo = e.emp_codigo and cur_sitcur = 1'); // Somente cursos ativos
 If (vnivel = 0) or (vnivel = 1) or (vnivel = 11) or (vnivel = 36) or (vnivel = 44)  // Geral, Pós Graduação, Atribuição Reitoria, Nei (DP)
// Then Q.Sql.Add('and ((cur_area <> 3 and cur_area <> 4 and cur_area <> 5) or (cur_codigo = 115 or cur_codigo = 62 or cur_codigo = 256 or cur_codigo = 997 or cur_codigo = 998 or cur_codigo = 537 or cur_codigo = 538 or cur_codigo = 996))')
 Then Q.Sql.Add('and ((cur_area <> 3 and cur_area <> 4 and cur_area <> 5) or (cur_codigo in (select cur_codigo from sca_cursos where cur_liberatrib = "S")))')
 Else Q.Sql.Add('and cur_area <> 3 and cur_area <> 4 and cur_area <> 5');
 If (vunidade <> 999) and (vunidade <> 0) // Geral
 Then
  Begin
   If (vnivel = 27) or (vnivel = 45) or (vnivel = 46) or (vnivel = 48) or (vnivel = 49) or
      (vnivel = 51) or (vnivel = 52) or (vnivel = 53) or (vnivel = 54) or (vnivel = 56) or
      (vnivel = 61)
      // Coordenador, Flávio Pandur, Secretaria Medicina, Secretaria EAD, Secretaria Polo EAD, Internato, Psicologia, Internato II, Secretaria Faculdade Engenharia, Núcleo de Prática Jurídica, Auxiliar de Coordenação EAD
   Then
    Begin
     If vnivel = 49 // secretaria polo ead
     Then Q.Sql.Add('and cur_codigo in (select cur_codigo from sca_cursos where set_codigo = 1251)')
     Else
      Begin
        Q.Sql.Add('and cur_codigo in (select cur_codigo from sca_cursofunc where fun_codigo =:matr)');
        Q.ParamByName('matr').AsInteger:=vcodusu;
      End;
    End
   Else
    If (vsetor = 549) or (vcodusu = 49324) or
       (vcodusu = 44803) or (vcodusu = vEvaldo) or (vcodusu = 50325) // Secretaria Agrárias ou Wagner,Renato,Evaldo
    Then Q.Sql.Add('and (cam_codigo = 1 or cam_codigo = 4)')
    Else
     If vsetor = 1248 // Secretaria Venceslau
     Then Q.Sql.Add('and cam_codigo = 4')
     Else
      Begin
       Q.Sql.Add('and cam_codigo =:cod');
       Q.ParamByName('cod').AsInteger:=vunidade;
      End;
  End;
 Q.Sql.Add('order by cur_nomcur, cur_codigo');
 Q.Open;
End;

Procedure Filtra_Unidade(Q:TQuery);
Begin
 If (vunidade <> 999) and (vunidade <> 0)
 Then
  Begin
   Q.Sql.Add('and c.cam_codigo =:unid');
   Q.ParamByName('unid').AsInteger:=vunidade;
  End;
End;

procedure TMenuprin.FormCreate(Sender: TObject);
begin
  EnderecoPrudente:='Campus I Rua José Bongiovani, 700 - Cidade Universitária - CEP 19050-920 - Presidente Prudente - SP - Tel: 18 3229-1000 - Campus II - Rodovia Raposo Tavares, KM 572 - Bairro Limoeiro - CEP 19067-175 - Presidente Prudente - SP - Tel: 18 3229-2000';
  EnderecoJau:='Campus Jaú Avenida Antônio de Almeida Pacheco, nº2945, 2ª Zona Industrial - CEP 17213-700 - Jaú - SP';
  EnderecoGuaruja:='Campus Guarujá Rua Albertino Pedro, nº75, Central Park - Enseada - CEP 11441-225 - Guarujá - SP';
  vPastaServidor:='\\10.1.2.37\GED\UNOESTE\';
//  vRecredenciamento:='Recredenciada pela Portaria MEC nº 413 D.O.U. 27/03/17 ';
  vRecredenciamento:='Recredenciada pela Portaria MEC n° 284 D.O.U. 14/04/2025 ';
  vtamfontdisc:=7; // tamanho da fonte do nome da disciplina no histórico escolar
  teste:=false;
  vbanco:='P'; // P - produção D - desenvolvimento
  vGED:='S'; // S - grava documento no GED
  tipo_historico:='F'; // F - Final  P - Parcial
  valida_historico:='S'; // S - exibe o histórico escolar somente se todas as disciplinas tiverem professores
  // deixar o valor de historico_conferencia = 'N' pois esse valor tem que ser o padrão
  historico_conferencia:='N'; // S - gravar o pdf do histórico escolar no atributo hdg_historicoconf
  vhdg_seq:=0;
  vsegundavia:='N';
  vcompleta:='N';
  vexibemensagem:='S';
  // ----------------------------------------------------------------------------------
  FProcs.UrlToken := 'http://localhost:52833/token';
  If (paramcount > 0) or (teste)

  Then
   Begin
     If not FileExists('C:\Sistemas\ACADEMICOCSHARP\gsdll32.dll')
     Then CopyFile('\\10.1.1.8\PRODUCAO\ACADEMICOCSHARP\gsdll32.dll','C:\SISTEMAS\ACADEMICOCSHARP\gsdll32.dll',FALSE);

     if teste then
     begin
       vcodusu:=80026;//77188;
       vtipo:=11;
//       vRA:=132017610; // 121824950; // 1100304371
//         vRA:=131914626;
       vRA:=7131500070;
       vhab:=1;
       //vhab:=3;
       //vcurso:=292;//12;
       vcurso:=713;
       vligacao:=0;
       vbanco:='P'; // P - produção D - desenvolvimento
       vGED:='S'; // S - grava documento no GED
       //vitl_seq:=15510; //13253;
       vitl_seq:=0;
       valida_historico:='S'; // S - exibe o histórico escolar somente se todas as disciplinas tiverem professores
       tipo_historico:='F';
       vhdg_seq:=0;
       historico_conferencia:='N'; // S - gravar o pdf do histórico escolar no atributo hdg_historicoconf
       vsegundavia:='N';
       vcompleta:='N';
       vexibemensagem:='S';
     end
     else
     begin
       vcodusu:=StrToInt(paramstr(1));
       vtipo:=StrToInt(paramstr(2));
       vRA:=StrToFloat(paramstr(3));
       vhab:=StrToInt(paramstr(4));
       vcurso:=StrToInt(paramstr(5));
       vligacao:=StrToInt(paramstr(6));
       vbanco:=paramstr(7);
       vGED:=paramstr(8);
       vitl_seq:=StrToInt(paramstr(9));
       valida_historico:=paramstr(10);
       tipo_historico:=paramstr(11);
       vhdg_seq:=StrToInt(paramstr(12));
       if paramcount >= 13
       then historico_conferencia:=paramstr(13)
       else historico_conferencia:='N';
       if paramcount >= 14
       then vsegundavia:=paramstr(14)
       else vsegundavia:='N';
       if paramcount >= 15
       then vcompleta:=paramstr(15)
       else vcompleta:='N';
       if paramcount >= 16
       then vexibemensagem:=paramstr(16)
       else vexibemensagem:='S';
     end;

     vsetor:=41;
     vunidade:=1;
//     vcabprof:='Professores : Nome e titulação do docente por disciplina, em atendimento ao Artigo 17 da Portaria MEC nº 1095/2018. ';
//     vcabprof:='Docente e Titulação = exibido para componentes curriculares cursados a partir do primeiro semestre de 2019, início de vigência da Portaria MEC 1.095/2018. ';
     vcabprof:='Docente e Titulação = exibido nos termos da Portaria MEC 1.095/2018. ';
     If (vcodusu <> 0) and (vbanco = 'P')
     Then
      Begin
        ConectarDB(DataBase1, vcodusu);
        //Database1.Connected:=False;
        //Database1.AliasName:='unoeste';
        //Database1.Params.Values['SERVER NAME']:='serv_prd';
        //Database1.Params.Values['DATABASE NAME']:='unoeste';
        //Database1.Params.Values['USER NAME']:='u_'+StrZero(vcodusu,6);
        //Database1.Params.Values['PASSWORD']:=IntToStr(Trunc(vcodusu/7)*11);
        //Database1.Connected:=True;
      End
     Else
      Begin
        Database1.Connected:=False;
        //Database1.AliasName:='unodes';
        Database1.Params.Values['SERVER NAME']:='serv_des';
        Database1.Params.Values['DATABASE NAME']:='unodes';
        Database1.Params.Values['USER NAME']:='informix';
        Database1.Params.Values['PASSWORD']:='Infx_123';
        Database1.Connected:=True;
        vcodusu:=43065;
      End;

     FProcs.UrlApi := Carrega_UrlApi(vbanco);

     Desab:=False;
     Desab2:=False;
     Mes[1]:='JANEIRO';
     Mes[2]:='FEVEREIRO';
     Mes[3]:='MARÇO';
     Mes[4]:='ABRIL';
     Mes[5]:='MAIO';
     Mes[6]:='JUNHO';
     Mes[7]:='JULHO';
     Mes[8]:='AGOSTO';
     Mes[9]:='SETEMBRO';
     Mes[10]:='OUTUBRO';
     Mes[11]:='NOVEMBRO';
     Mes[12]:='DEZEMBRO';
     CampusI:='RUA JOSÉ BONGIOVANI, 700 - FONE:(018)3229-1000(PABX) - CIDADE UNIVERSITÁRIA - CEP 19050-900 - PRESIDENTE PRUDENTE - SP';
     CampusII:='RODOVIA RAPOSO TAVARES, KM 572 - BAIRRO LIMOEIRO - CEP 19067-175 - PRESIDENTE PRUDENTE - SP';
     RACurrency:='000'+''''+'.'+''''+'00'+''''+'.'+''''+'0000'+''''+'.'+''''+'0';
     RAMask:='!999.99.9999.9;0;_';
     vEvaldo:=37961;
     SP_DataSis.Active:=True;
     DataSis:=SP_DataSis['(expression)'];
     SP_DataSis.Active:=False;
     Case vtipo of
       1:Begin  // Extrato Registro Diploma
           Application.CreateForm(TFExtPub, FExtPub);
           FExtPub.ShowModal;
           FExtPub.Free;
         End;
       2:Begin
           {Application.CreateForm(TFRegDip, FRegDip);
           FRegDip.Tag:=2;
           FRegDip.Caption:='Impressão do Diploma';
           FRegDip.ShowModal;
           FRegDip.Free;}
         End;
       3:Begin  // Histórico Escolar
           vexibe:='N';
           if vcurso = 13 then
           begin
             Application.CreateForm(TFRHisPs7, FRHisPs7);
             FRHisPs7.Free;
           end
           else
           begin
             Application.CreateForm(TFRHist8, FRHist8);
             FRHist8.Tag:=0;
             FRHist8.Free;
           end;
         End;
       4:Begin  // Histórico Escolar
           vexibe:='S';
           if vcurso = 13 then
           begin
             Application.CreateForm(TFRHisPs7, FRHisPs7);
             FRHisPs7.ShowModal;
             FRHisPs7.Free;
           end
           else
           begin
             Application.CreateForm(TFRHist8, FRHist8);
             FRHist8.Tag:=0;
             FRHist8.ShowModal;
             FRHist8.Free;
           end;
         End;
       5:Begin  // Histórico Escolar (RVHE)
           vexibe:='N';
           rvhe:=true;
           if vcurso = 13 then
           begin
             Application.CreateForm(TFRHisPs8, FRHisPs8);
             If tipo_historico = 'F'
             Then FRHisPs8.Caption:='Emissão de Histórico Escolar Final (RVHE)'
             Else FRHisPs8.Caption:='Emissão de Histórico Escolar Parcial (RVHE)';
             FRHisPs8.Free;
           end
           else
           begin
             Application.CreateForm(TFRHist9, FRHist9);
             If tipo_historico = 'F'
             Then FRHist9.Caption:='Emissão de Histórico Escolar Final (RVHE)'
             Else FRHist9.Caption:='Emissão de Histórico Escolar Parcial (RVHE)';
             FRHist9.Free;
           end;
         End;
       6:Begin  // Histórico Escolar (RVHE)
           vexibe:='S';
           rvhe:=true;
           if vcurso = 13 then
           begin
             Application.CreateForm(TFRHisPs8, FRHisPs8);
             If tipo_historico = 'F'
             Then FRHisPs8.Caption:='Emissão de Histórico Escolar Final (RVHE)'
             Else FRHisPs8.Caption:='Emissão de Histórico Escolar Parcial (RVHE)';
             FRHisPs8.ShowModal;
             FRHisPs8.Free;
           end
           else
           begin
             Application.CreateForm(TFRHist9, FRHist9);
             If tipo_historico = 'F'
             Then FRHist9.Caption:='Emissão de Histórico Escolar Final (RVHE)'
             Else FRHist9.Caption:='Emissão de Histórico Escolar Parcial (RVHE)';
             FRHist9.ShowModal;
             FRHist9.Free;
           end;
         End;
       7:Begin  // Histórico Escolar Novo - somente para Nair assinar
           vexibe:='N';
           rvhe:=false;
           if vcurso = 13 then
           begin
             Application.CreateForm(TFRHisPs8, FRHisPs8);
             FRHisPs8.Free;
           end
           else
           begin
             Application.CreateForm(TFRHist9, FRHist9);
             FRHist9.Free;
           end;
         End;
       8:Begin  // Histórico Escolar Novo - somente para Nair assinar
           vexibe:='S';
           rvhe:=false;
           if vcurso = 13 then
           begin
             Application.CreateForm(TFRHisPs8, FRHisPs8);
             FRHisPs8.ShowModal;
             FRHisPs8.Free;
           end
           else
           begin
             Application.CreateForm(TFRHist9, FRHist9);
             FRHist9.ShowModal;
             FRHist9.Free;
           end;
         End;
       9:Begin  // Matriz Curricular
           vexibe:='N';
           Application.CreateForm(TF_AntGrade, F_AntGrade);
           F_AntGrade.Caption:='Configura Relatório';
           F_AntGrade.Tag:=1;
         End;
      10:Begin  // histórico escolar lato sensu EAD
           vexibe:='S';
           Application.CreateForm(TFRHisto2, FRHisto2);
           FRHisto2.ShowModal;
           FRHisto2.Free;
         End;
      11:Begin  // histórico escolar lato sensu EAD
           vexibe:='N';
           Application.CreateForm(TFRHisto2, FRHisto2);
           FRHisto2.Free;
         End;
     End;
   End;
  Application.Terminate;
end;

function NumImp(VImpr: String): integer;
Var I: integer;
    X: String;
Begin
 I:=0;
 While (I<Printer.Printers.Count-1) And (Printer.Printers[I]<>VImpr) do
   I:=I+1;
 X:=Printer.Printers[I];
 If X<>VImpr Then
    NumImp:=Printer.PrinterIndex
 Else
    NumImp:=I;
End;

procedure ImprDef(VImpr: String);
Var IniFile: TIniFile;
    TempStr1, TempStr2: string;
Begin
  With Printer do
  Begin
    PrinterIndex:=NumImp(VImpr);
    TempStr1:=Printers[PrinterIndex];
    {Condição para quando estiver usando o tradutor do DELPHI}
    If Pos('on',TempStr1)<>0 Then
       System.Delete(TempStr1,Pos(' on ',TempStr1),Length(TempStr1))
    Else
       System.Delete(TempStr1,Pos(' em ',TempStr1),Length(TempStr1));
    IniFile:=TIniFile.Create('Win.ini');
    try
      TempStr2:=IniFile.ReadString('Devices', TempStr1, '');
      IniFile.WriteString('Windows','device',TempStr1 + ','+ TempStr2);
    finally
      IniFile.Free;
    end;
  End;
End;

procedure TMenuprin.MessageHandle(var Msg: TMsg; var Handled: Boolean);
begin
   with Msg do
      if ((((Desab) and (wparam<>83) and (wparam<>78)) or ((Desab2) and (wparam<>79))) and (message=wm_keydown)) then
      begin
         Handled:=True;
      end;
{  with Msg do
  begin
      if ((Assigned(Screen.ActiveForm)) and (Screen.ActiveForm.ActiveControl is TWincontrol) and
          not(Screen.ActiveControl is TScrollingWinControl) and
          (Message=WM_KEYDOWN) and (wparam=VK_RETURN) and
          (KeyDataToShiftState(wparam)=[])) then
         if not(Screen.ActiveForm.ActiveControl is TButton) then
            if not(Screen.ActiveForm.ActiveControl is TCustomGrid) then
               if not(Screen.ActiveForm.ActiveControl is TCustomMemo) then
               begin
                  Handled:=True;
                  Screen.ActiveForm.ActiveControl.Perform(WM_KEYDOWN, VK_RETURN, 0);
                  Screen.ActiveForm.Perform(WM_NEXTDLGCTL, 0, 0);
               end;
      if ((((Desab) and (wparam<>83) and (wparam<>78)) or ((Desab2) and (wparam<>79))) and (message=wm_keydown)) then
      begin
         Handled:=True;
      end;
  end;}
end;

function Pesquisa(TQ: TQuery; Valores: Array of Variant): Boolean;
var
   i: Word;
begin
   with TQ do
   begin
      Close;
      for i:=Low(Valores) to High(Valores) do
         Params[i].Value:=Valores[i];
      Open;
      if EOF then
         Pesquisa:=False
      else
         Pesquisa:=True;
   end;
end;

Function Alinha_Nota(nota:real):string;
Begin
 If Length(FormatFloat('#0.0',nota)) = 3
 Then Alinha_Nota:=' '+FormatFloat('#0.0',nota)
 Else Alinha_Nota:=FormatFloat('#0.0',nota);
End;

Function Alinha_Freq(frequencia:real):string;
Begin
 If Length(FormatFloat('#0.0',frequencia)) = 3
 Then Alinha_Freq:='  '+FormatFloat('#0.0',frequencia)
 Else
  If Length(FormatFloat('#0.0',frequencia)) = 4
  Then Alinha_Freq:=' '+FormatFloat('#0.0',frequencia)
  Else Alinha_Freq:=FormatFloat('#0.0',frequencia);
End;

function NULLToZero(Value: Variant): integer;
begin
   if (VarType(Value)<>VarNULL) then
      NULLToZero:=Value
   else
      NullToZero:=0;
end;

function Alinha_RA(ra:string): string;
var s:string;
Begin
  s:=StrZero(StrToInt(Trim(ra)),10);
  Alinha_RA:=s;
End;

Function Valida_Usuario(codcur,coddis:integer;ra:real): boolean;
var QCurso:TQuery;
Begin
 QCurso:=TQuery.Create(Menuprin);
 QCurso.DatabaseName:='unoeste';
 If codcur <> 0
 Then
  Begin
   QCurso.Close;
   QCurso.Sql.Clear;
   QCurso.Sql.Add('select fac_codigo,set_codigo,cam_codigo from sca_cursos');
   QCurso.Sql.Add('where cur_codigo =:codcur');
   QCurso.ParamByName('codcur').AsSmallInt:=codcur;
   QCurso.Open;
   If (vnivel = 8) or (vnivel = 27) or
      (vnivel = 29) or (vnivel = 43) or
      (vnivel = 33) or (vnivel = 36) or
      (vnivel = 19) or (vnivel = 35) or
      (vnivel = 37) or (vnivel = 39) or
      (vnivel = 40) or (vnivel = 42) or
      (vnivel = 44) or (vnivel = 45) or
      (vnivel = 46) or (vnivel = 47) or
      (vnivel = 48) or (vnivel = 50) or
      (vnivel = 51) or (vnivel = 52) or
      (vnivel = 53) or (vnivel = 54) or
      (vnivel = 55) or (vnivel = 56)
    // Diretores, Atividades Complementares, Coordenadores, Paulo - Veterinária, Ocorrências do Aluno, Cadastro de Alunos - Cursos de Extensão, Gisele e Graziella,
    // Secretarias EAD, Secretaria FIPP II, Internato, Psicologia, Internato II, Secretaria Faculdade Engenharia, Consulta Informações Gerais do Aluno, Núcleo de Prática Jurídica
   Then Valida_Usuario:=Valida_Usuario2(codcur)
   Else
    If ((vnivel = 10) and (QCurso['fac_codigo'] <> 10)) or
       ((vnivel = 25) and (QCurso['fac_codigo'] <> 12))
//       ((vnivel = 40) and (codcur <> 13)) // FIPP, Medicina, Psicologia
    Then Valida_Usuario:=false
    Else
     If (QCurso['set_codigo'] <> vsetor) or (QCurso['cam_codigo'] <> vunidade)
     Then Valida_Usuario:=false
     Else Valida_Usuario:=true;
  End
 Else
  If coddis <> 0
  Then
   Begin
    QCurso.Close;
    QCurso.Sql.Clear;
    QCurso.Sql.Add('select c.cur_codigo,fac_codigo,set_codigo,cam_codigo from sca_cursos c,sca_disciplinas d');
    QCurso.Sql.Add('where c.cur_codigo = d.cur_codigo and d.dis_codigo =:coddis');
    QCurso.ParamByName('coddis').AsInteger:=coddis;
    QCurso.Open;
    If (vnivel = 8) or (vnivel = 27) or
       (vnivel = 29) or (vnivel = 43) or
       (vnivel = 33) or (vnivel = 36) or
       (vnivel = 19) or (vnivel = 35) or
       (vnivel = 37) or (vnivel = 39) or
       (vnivel = 40) or (vnivel = 42) or
       (vnivel = 44) or (vnivel = 45) or
       (vnivel = 46) or (vnivel = 47) or
       (vnivel = 48) or (vnivel = 50) or
       (vnivel = 51) or (vnivel = 52) or
       (vnivel = 53) or (vnivel = 54) or
       (vnivel = 55) or (vnivel = 56)
    // Diretores, Atividades Complementares, Coordenadores, Paulo - Veterinária, Ocorrências do Aluno, Cadastro de Alunos - Cursos de Extensão, Gisele e Graziella,
    // Secretarias EAD, Secretaria FIPP II, Internato, Psicologia, Internato II, Secretaria Faculdade Engenharia, Consulta Informações Gerais do Aluno, Núcleo de Prática Jurídica
    Then Valida_Usuario:=Valida_Usuario2(QCurso['cur_codigo'])
    Else
     If ((vnivel = 10) and (QCurso['fac_codigo'] <> 10)) or
        ((vnivel = 25) and (QCurso['fac_codigo'] <> 12))
//        ((vnivel = 40) and (QCurso['cur_codigo'] <> 13)) // FIPP, Medicina, Psicologia
     Then Valida_Usuario:=false
     Else
      If (QCurso['set_codigo'] <> vsetor) or (QCurso['cam_codigo'] <> vunidade)
      Then Valida_Usuario:=false
      Else Valida_Usuario:=true;
   End
  Else
   Begin
    QCurso.Close;
    QCurso.Sql.Clear;
    QCurso.Sql.Add('select c.cur_codigo,fac_codigo,set_codigo,cam_codigo from sca_cursos c,sca_alunos a');
    QCurso.Sql.Add('where c.cur_codigo = a.cur_codigo and a.alu_ra =:ra');
    QCurso.ParambyName('ra').AsFloat:=ra;
    QCurso.Open;
    If (vnivel = 8) or (vnivel = 27) or
       (vnivel = 29) or (vnivel = 43) or
       (vnivel = 33) or (vnivel = 36) or
       (vnivel = 19) or (vnivel = 35) or
       (vnivel = 37) or (vnivel = 39) or
       (vnivel = 40) or (vnivel = 42) or
       (vnivel = 44) or (vnivel = 45) or
       (vnivel = 46) or (vnivel = 47) or
       (vnivel = 48) or (vnivel = 50) or
       (vnivel = 51) or (vnivel = 52) or
       (vnivel = 53) or (vnivel = 54) or
       (vnivel = 55) or (vnivel = 56)
    // Diretores, Atividades Complementares, Coordenadores, Paulo - Veterinária, Ocorrências do Aluno, Cadastro de Alunos - Cursos de Extensão, Gisele e Graziella,
    // Secretarias EAD, Secretaria FIPP II, Internato, Psicologia, Internato II, Secretaria Faculdade Engenharia, Consulta Informações Gerais do Aluno, Núcleo de Prática Jurídica
    Then Valida_Usuario:=Valida_Usuario2(QCurso['cur_codigo'])
    Else
     If ((vnivel = 10) and (QCurso['fac_codigo'] <> 10)) or
        ((vnivel = 25) and (QCurso['fac_codigo'] <> 12))
//        ((vnivel = 40) and (QCurso['cur_codigo'] <> 13)) // FIPP, Medicina, Psicologia
     Then Valida_Usuario:=false
     Else
      If (QCurso['set_codigo'] <> vsetor) or (QCurso['cam_codigo'] <> vunidade)
      Then Valida_Usuario:=false
      Else Valida_Usuario:=true;
   End;
 If vcodusu = 0
 Then Valida_Usuario:=true;
 If (vsetor = 41) and (vunidade = 1)
 Then Valida_Usuario:=true;
 If (vsetor = 549) // Secretaria II
 Then
  Begin
   If codcur <> 0
   Then
    Begin
     QCurso.Close;
     QCurso.Sql.Clear;
     QCurso.Sql.Add('select set_codigo,cam_codigo from sca_cursos');
     QCurso.Sql.Add('where cur_codigo =:codcur');
     QCurso.ParamByName('codcur').AsSmallInt:=codcur;
     QCurso.Open;
     If (QCurso['set_codigo'] <> vsetor) and (QCurso['set_codigo'] <> 1248) // Secretaria Pres. Venceslau
     Then Valida_Usuario:=false
     Else Valida_Usuario:=true;
    End
   Else
    If coddis <> 0
    Then
     Begin
      QCurso.Close;
      QCurso.Sql.Clear;
      QCurso.Sql.Add('select set_codigo,cam_codigo from sca_cursos c,sca_disciplinas d');
      QCurso.Sql.Add('where c.cur_codigo = d.cur_codigo and d.dis_codigo =:coddis');
      QCurso.ParamByName('coddis').AsInteger:=coddis;
      QCurso.Open;
      If (QCurso['set_codigo'] <> vsetor) and (QCurso['set_codigo'] <> 1248) // Secretaria Pres. Venceslau
      Then Valida_Usuario:=false
      Else Valida_Usuario:=true;
     End
    Else
     Begin
      QCurso.Close;
      QCurso.Sql.Clear;
      QCurso.Sql.Add('select set_codigo,cam_codigo from sca_cursos c,sca_alunos a');
      QCurso.Sql.Add('where c.cur_codigo = a.cur_codigo and a.alu_ra =:ra');
      QCurso.ParambyName('ra').AsFloat:=ra;
      QCurso.Open;
      If (QCurso['set_codigo'] <> vsetor) and (QCurso['set_codigo'] <> 1248) // Secretaria Pres. Venceslau
      Then Valida_Usuario:=false
      Else Valida_Usuario:=true;
     End;
  End;
 If (vsetor = 1248) // Venceslau
 Then
  Begin
   If codcur <> 0
   Then
    Begin
     QCurso.Close;
     QCurso.Sql.Clear;
     QCurso.Sql.Add('select set_codigo,cam_codigo from sca_cursos');
     QCurso.Sql.Add('where cur_codigo =:codcur');
     QCurso.ParamByName('codcur').AsSmallInt:=codcur;
     QCurso.Open;
     If (QCurso['set_codigo'] <> vsetor) // Secretaria Pres. Venceslau
     Then Valida_Usuario:=false
     Else Valida_Usuario:=true;
    End
   Else
    If coddis <> 0
    Then
     Begin
      QCurso.Close;
      QCurso.Sql.Clear;
      QCurso.Sql.Add('select set_codigo,cam_codigo from sca_cursos c,sca_disciplinas d');
      QCurso.Sql.Add('where c.cur_codigo = d.cur_codigo and d.dis_codigo =:coddis');
      QCurso.ParamByName('coddis').AsInteger:=coddis;
      QCurso.Open;
      If (QCurso['set_codigo'] <> vsetor) // Secretaria Pres. Venceslau
      Then Valida_Usuario:=false
      Else Valida_Usuario:=true;
     End
    Else
     Begin
      QCurso.Close;
      QCurso.Sql.Clear;
      QCurso.Sql.Add('select set_codigo,cam_codigo from sca_cursos c,sca_alunos a');
      QCurso.Sql.Add('where c.cur_codigo = a.cur_codigo and a.alu_ra =:ra');
      QCurso.ParambyName('ra').AsFloat:=ra;
      QCurso.Open;
      If (QCurso['set_codigo'] <> vsetor) // Secretaria Pres. Venceslau
      Then Valida_Usuario:=false
      Else Valida_Usuario:=true;
     End;
  End;
 If vunidade = 999 // Geral
 Then Valida_Usuario:=true;

// If (vcodusu = vEvaldo) and (QCurso['set_codigo'] = 549) and (Libera_Evaldo)
// Then Valida_Usuario:=true;

 If (vnivel = 5) or (vnivel = 14) or // Secretarias I e II, Digitadores das Secretarias I e II
    (vnivel = 15) or (vnivel = 30)
 Then
  If ((QCurso['set_codigo'] = 44) or (QCurso['set_codigo'] = 549) or (QCurso['set_codigo'] = 1255) or (QCurso['set_codigo'] = 1256)) and (vunidade = 1) // Curso da secretaria I, II, Jaú ou Guarujá
  Then Valida_Usuario:=true;

 QCurso.Close;
 QCurso.Destroy;
End;

Function Valida_Usuario2(codcur: smallint): boolean;
var QCursoFunc:TQuery;
Begin
 If (vnivel = 8) or (vnivel = 19) or
    (vnivel = 27) or (vnivel = 43) or
    (vnivel = 29) or (vnivel = 33) or
    (vnivel = 35) or (vnivel = 36) or
    (vnivel = 37) or (vnivel = 39) or
    (vnivel = 40) or (vnivel = 42) or
    (vnivel = 44) or (vnivel = 45) or
    (vnivel = 46) or (vnivel = 47) or
    (vnivel = 48) or (vnivel = 50) or
    (vnivel = 51) or (vnivel = 52) or
    (vnivel = 53) or (vnivel = 54) or
    (vnivel = 55) or (vnivel = 56)
    // Diretores, Atividades Complementares, Coordenadores, Paulo - Veterinária, Ocorrências do Aluno, Cadastro de Alunos - Cursos de Extensão, Gisele e Graziella,
    // Secretarias EAD, Secretaria FIPP II, Internato, Psicologia, Internato II, Secretaria Faculdade Engenharia, Consulta Informações Gerais do Aluno, Núcleo de Prática Jurídica
 Then
  Begin
   QCursoFunc:=TQuery.Create(Menuprin);
   QCursoFunc.DatabaseName:='unoeste';
   QCursoFunc.Close;
   QCursoFunc.Sql.Clear;
   QCursoFunc.Sql.Add('select * from sca_cursofunc');
   QCursoFunc.Sql.Add('where fun_codigo =:matr');
   QCursoFunc.ParamByName('matr').AsInteger:=vcodusu;
   QCursoFunc.Open;
   QCursoFunc.First;
   While (not QCursoFunc.Eof) and (QCursoFunc['cur_codigo'] <> codcur) do
    QCursoFunc.Next;
   If QCursoFunc.Eof
   Then Valida_Usuario2:=false
   Else Valida_Usuario2:=true;
   QCursoFunc.Close;
   QCursoFunc.Destroy;
  End
 Else
  If not Valida_Usuario(codcur,0,0)
  Then Valida_Usuario2:=false
  Else Valida_Usuario2:=true;
End;

Function Valida_Wagner(codcur,coddis,ra: integer): boolean;
var QCurso:TQuery;
Begin
 If (vcodusu = 49324) or (vcodusu = 44803) or (vcodusu = 37961) // Matrícula do Wagner, Renato, Evaldo
 Then
  Begin
   QCurso:=TQuery.Create(Menuprin);
   QCurso.DatabaseName:='unoeste';
   If codcur <> 0
   Then
    Begin
     QCurso.Close;
     QCurso.Sql.Clear;
     QCurso.Sql.Add('select set_codigo from sca_cursos');
     QCurso.Sql.Add('where cur_codigo =:codcur');
     QCurso.ParamByName('codcur').AsSmallInt:=codcur;
     QCurso.Open;
     If (QCurso['set_codigo'] = 549) or (QCurso['set_codigo'] = 1247) or (QCurso['set_codigo'] = 1248) // Secretaria Agrárias
     Then Valida_Wagner:=true
     Else Valida_Wagner:=false;
    End
   Else
    If coddis <> 0
    Then
     Begin
      QCurso.Close;
      QCurso.Sql.Clear;
      QCurso.Sql.Add('select c.set_codigo from sca_cursos c,sca_disciplinas d');
      QCurso.Sql.Add('where c.cur_codigo = d.cur_codigo and d.dis_codigo =:coddis');
      QCurso.ParamByName('coddis').AsInteger:=coddis;
      QCurso.Open;
      If (QCurso['set_codigo'] = 549) or (QCurso['set_codigo'] = 1247) or (QCurso['set_codigo'] = 1248) // Secretaria Agrárias
      Then Valida_Wagner:=true
      Else Valida_Wagner:=false;
     End
    Else
     Begin
      QCurso.Close;
      QCurso.Sql.Clear;
      QCurso.Sql.Add('select c.set_codigo from sca_cursos c,sca_alunos a');
      QCurso.Sql.Add('where c.cur_codigo = a.cur_codigo and a.alu_ra =:ra');
      QCurso.ParambyName('ra').AsFloat:=ra;
      QCurso.Open;
      If (QCurso['set_codigo'] = 549) or (QCurso['set_codigo'] = 1247) or (QCurso['set_codigo'] = 1248) // Secretaria Agrárias
      Then Valida_Wagner:=true
      Else Valida_Wagner:=false;
     End;
   QCurso.Close;
   QCurso.Destroy;
  End
 Else Valida_Wagner:=false;
End;

Procedure Habilita(TF:TForm);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount -1 do
  Begin
    If (Components[I] is TEdit) Then
       If TEdit(Components[I]).Tag = 0 Then
          TEdit(Components[I]).Enabled:=True;
    If (Components[I] is TMaskEdit) Then
       If TMaskEdit(Components[I]).Tag = 0 Then
          TMaskEdit(Components[I]).Enabled:=True;
    If (Components[I] is TDBEdit) Then
       If TDBEdit(Components[I]).Tag = 0 Then
          TDBEdit(Components[I]).Enabled:=True;
    If (Components[I] is TRadioButton) Then
       If TRadioButton(Components[I]).Tag = 0 Then
          TRadioButton(Components[I]).Enabled:=True;
    If (Components[I] is TDBRadioGroup) Then
       If TDBRadioGroup(Components[I]).Tag = 0 Then
          TDBRadioGroup(Components[I]).Enabled:=True;
    If (Components[I] is TRadioGroup) Then
       If TRadioGroup(Components[I]).Tag = 0 Then
          TRadioGroup(Components[I]).Enabled:=True;
    If (Components[I] is TComboBox) Then
       If TComboBox(Components[I]).Tag = 0 Then
          TComboBox(Components[I]).Enabled:=True;
    If (Components[I] is TDBComboBox) Then
       If TDBComboBox(Components[I]).Tag = 0 Then
          TDBComboBox(Components[I]).Enabled:=True;
    If (Components[I] is TDBLookUpComboBox) Then
       If TDBLookUpComboBox(Components[I]).Tag = 0 Then
          TDBLookUpComboBox(Components[I]).Enabled:=True;
    If (Components[I] is TCurrencyEdit) Then
       If TCurrencyEdit(Components[I]).Tag = 0 Then
          TCurrencyEdit(Components[I]).Enabled:=True;
    If (Components[I] is TCheckBox) Then
       If TCheckBox(Components[I]).Tag = 0 Then
          TCheckBox(Components[I]).Enabled:=True;
    If (Components[I] is TDateEdit) Then
       If TDateEdit(Components[I]).Tag = 0 Then
          TDateEdit(Components[I]).Enabled:=True;
    If (Components[I] is TDBDateEdit) Then
       If TDBDateEdit(Components[I]).Tag = 0 Then
          TDBDateEdit(Components[I]).Enabled:=True;
  End;
End;

Procedure Desabilita(TF:TForm);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount -1 do
  Begin
    If (Components[I] is TEdit) Then
       If TEdit(Components[I]).Tag = 0 Then
          TEdit(Components[I]).Enabled:=False;
    If (Components[I] is TMaskEdit) Then
       If TMaskEdit(Components[I]).Tag = 0 Then
          TMaskEdit(Components[I]).Enabled:=False;
    If (Components[I] is TDBEdit) Then
       If TDBEdit(Components[I]).Tag = 0 Then
          TDBEdit(Components[I]).Enabled:=False;
    If (Components[I] is TRadioButton) Then
       If TRadioButton(Components[I]).Tag = 0 Then
          TRadioButton(Components[I]).Enabled:=False;
    If (Components[I] is TDBRadioGroup) Then
       If TDBRadioGroup(Components[I]).Tag = 0 Then
          TDBRadioGroup(Components[I]).Enabled:=False;
    If (Components[I] is TRadioGroup) Then
       If TRadioGroup(Components[I]).Tag = 0 Then
          TRadioGroup(Components[I]).Enabled:=False;
    If (Components[I] is TComboBox) Then
       If TComboBox(Components[I]).Tag = 0 Then
          TComboBox(Components[I]).Enabled:=False;
    If (Components[I] is TDBComboBox) Then
       If TDBComboBox(Components[I]).Tag = 0 Then
          TDBComboBox(Components[I]).Enabled:=False;
    If (Components[I] is TDBLookUpComboBox) Then
       If TDBLookUpComboBox(Components[I]).Tag = 0 Then
          TDBLookUpComboBox(Components[I]).Enabled:=False;
    If (Components[I] is TCurrencyEdit) Then
       If TCurrencyEdit(Components[I]).Tag = 0 Then
          TCurrencyEdit(Components[I]).Enabled:=False;
    If (Components[I] is TCheckBox) Then
       If TCheckBox(Components[I]).Tag = 0 Then
          TCheckBox(Components[I]).Enabled:=False;
    If (Components[I] is TDateEdit) Then
       If TDateEdit(Components[I]).Tag = 0 Then
          TDateEdit(Components[I]).Enabled:=False;
    If (Components[I] is TDBDateEdit) Then
       If TDBDateEdit(Components[I]).Tag = 0 Then
          TDBDateEdit(Components[I]).Enabled:=False;
  End;
End;

Procedure Limpa(TF:TForm);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount - 1 do
  Begin
    If (Components[I] is TEdit) Then
      TEdit(Components[I]).Text:='';
    If (Components[I] is TDBEdit) Then
      TDBEdit(Components[I]).Text:='';
    If (Components[I] is TMaskEdit) Then
      TMaskEdit(Components[I]).Clear;
    If (Components[I] is TComboBox) Then
      TComboBox(Components[I]).Text:='';
    If (Components[I] is TDBRadioGroup) Then
      TDBRadioGroup(Components[I]).Value:='';
    If (Components[I] is TRadioGroup) and (TRadioGroup(Components[I]).Tag = 0) Then
      TRadioGroup(Components[I]).ItemIndex:=-1;
    If (Components[I] is TDateEdit) Then
      TDateEdit(Components[I]).Text:='';
    If (Components[I] is TCurrencyEdit) Then
      TCurrencyEdit(Components[I]).Text:='';
  End;
End;

Function Data_Valida(data: string): boolean;
Var dataux:TDateTime;
Begin
 Data_Valida:=True;
 Try
  dataux:=StrToDate(Trim(data));
 Except
  Data_Valida:=false;
 End;
End;

function Replicate(value: String; qtde: Word): String;
begin
   if (Length(value)>=qtde) then
      Replicate:=Copy(value,1,qtde)
   else
      Replicate:=Replicate(value+value,qtde);
end;

function NULLToSpace(Value: Variant): String;
begin
   if (VarType(Value)<>VarNULL) then
      NULLToSpace:=Value
   else
      NullToSpace:='';
end;

Function Mascara_Disc(coddis:integer) : string;
var aux:string;
Begin
 aux:='';
// aux:=Copy(StrZero(coddis,6),1,2)+'.'+Copy(StrZero(coddis,6),3,3)+'.'+Copy(StrZero(coddis,6),6,1);
 aux:=Copy(StrZero(coddis,7),1,3)+'.'+Copy(StrZero(coddis,7),4,3)+'.'+Copy(StrZero(coddis,7),7,1);
 Mascara_Disc:=aux;
End;

Function Muda_Impressora(Imp: String):Boolean;
Var i: Integer;
Begin
 Muda_Impressora:=False;
 I:=0;
 While (I<Printer.Printers.Count-1) do
 Begin
  If Pos(Imp,Printer.Printers[I]) > 0
  Then
   Begin
    Muda_Impressora:=True;
    Printer.PrinterIndex:=I;
    Break;
   End;
  I:=I+1;
 End;
End;

function Arred(Value: Currency; Prec: Word): Currency;
begin
   if (Prec>0) then
   begin
      Value:=Value*Power(10,Prec);
      Value:=Int(Round(Value));
      Value:=Value/Power(10,Prec);
   end;
   Arred:=Value;
end;

Function Carrega_UrlApi(banco:string):String;
Begin
  If banco = 'P'
  Then Result := 'http://10.1.2.27:9095' // 'http://10.1.15.116/Unoeste.WebApi.Ged'
  Else Result := 'http://10.1.2.27:9096'; //http://10.1.15.116:9095';
End;

end.
