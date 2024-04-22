unit UExtPub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, DBTables, DB, Grids, DBGrids,
  Buttons, RXDBCtrl, lmdclass, ppDB, ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppStrtch,
  ppRichView, ppCache, ppComm, ppRelatv, ppProd, ppReport, RVStyle, jpeg,
  ppDesignLayer, ppParameter, rxMemTable;

type
  TFExtPub = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    B_Sair: TBitBtn;
    QExtrato: TQuery;
    DSExtrato: TDataSource;
    Label4: TLabel;
    CBTipo: TComboBox;
    QAux: TQuery;
    RExtrato: TppReport;
    ppDetailBand2: TppDetailBand;
    ppRichView1: TppRichView;
    ppGroup3: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    PRegistros: TPanel;
    DBGrid1: TRxDBGrid;
    MTReg: TMemoryTable;
    DSReg: TDataSource;
    MTRegliv_numero: TIntegerField;
    MTRegregini: TIntegerField;
    MTRegregfim: TIntegerField;
    MTRegdataini: TDateField;
    MTRegdatafim: TDateField;
    MTRegtotal: TIntegerField;
    QExtLiv: TQuery;
    procedure B_SairClick(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure b_okClick(Sender: TObject);
    procedure b_okExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBTipoEnter(Sender: TObject);
    procedure CBTipoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function InicializaPasta(Pasta : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

const
  C_PASTA_TEMPORARIA = 'C:\SISTEMAS\GED_ACADEMICO';

var
  FExtPub: TFExtPub;

implementation

Uses UMenupri, UProcs, Extensos;

{$R *.DFM}

{ *************************************************************************************************************************************************** }

function TFExtPub.InicializaPasta(Pasta : String) : Boolean;
begin
    Result := True;
    try
        if DirectoryExists(Pasta)
           then begin
                    DeleteDir(Self.Handle,Pasta);
                end;

        if not CreateDir(Pasta)
           then begin
                    Result := False;
                end;
    except
         Result := False;
    end;
end;

{ *************************************************************************************************************************************************** }

procedure TFExtPub.B_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFExtPub.b_cancelaClick(Sender: TObject);
begin
  CBTipo.SetFocus;
end;

procedure TFExtPub.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  QAux.Close;
  QExtrato.Close;
  QExtLiv.Close;
end;

procedure TFExtPub.FormCreate(Sender: TObject);
begin
    { Gerando pasta temporária }
    if not InicializaPasta(C_PASTA_TEMPORARIA)
       then begin
                MessageDlg('Não foi possível gerar a pasta temporária. Verifique as permissões de gravação!',mtInformation,[mbOk],0);
                PostMessage(self.handle,wm_close,0,0);
                Exit;
            end;
end;

procedure TFExtPub.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TFExtPub.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TFExtPub.b_okClick(Sender: TObject);
var vdataini, vdatafim:TDateTime;
    vtotal, vcodexp:integer;
    vreg, vtotext, vurl:string;
    vdia, vmes, vano:word;
begin
  If MessageDlg('Atenção. Confirma Extrato das Informações sobre o Registro de Diplomas no D.O.U. ? ',mtConfirmation, [mbYes, mbNo], 0) = mrYes
  Then
   Begin
     Try
       Menuprin.Database1.StartTransaction;
       MTReg.First;
       vdataini:=MTReg['dataini'];
       vdatafim:=MTReg['datafim'];
       vtotal:=0;
       vreg:='';
       vurl:='';
       While not MTReg.Eof do
       Begin
         If MTReg['dataini'] < vdataini
         Then vdataini:=MTReg['dataini'];
         If MTReg['datafim'] > vdatafim
         Then vdatafim:=MTReg['datafim'];
         vtotal:=vtotal + MTReg['total'];
         If vreg = ''
         Then vreg:='[livro '+FormatFloat('000',MTReg['liv_numero'])+' - '+'registros '+FormatFloat('0000',MTReg['regini'])+' a '+FormatFloat('0000',MTReg['regfim'])+']'
         Else vreg:=vreg + ';[livro '+FormatFloat('000',MTReg['liv_numero'])+' - '+'registros '+FormatFloat('0000',MTReg['regini'])+' a '+FormatFloat('0000',MTReg['regfim'])+']';
         MTReg.Next;
       End;

       QExtrato.Close;
       QExtrato.Sql.Clear;
       QExtrato.Sql.Add('select * from sca_extratopub');
       QExtrato.Sql.Add('where exp_seq = 0');
       QExtrato.Open;
       QExtrato.Append;
       QExtrato['exp_qtdedipreg']:=vtotal;
       QExtrato['fun_inserido']:=vcodusu;
       QExtrato['exp_dtinserido']:=Pega_DataHora;
       QExtrato.Post;
       vcodexp:=QExtrato['exp_seq'];

       QExtrato.Close;
       QExtrato.Sql.Clear;
       QExtrato.Sql.Add('select * from sca_extratopub');
       QExtrato.Sql.Add('where exp_seq =:codexp');
       QExtrato.ParamByName('codexp').AsInteger:=vcodexp;
       QExtrato.Open;
       QExtrato.Edit;
       QExtrato['exp_url']:='www.unoeste.br/registrodiplomas/'+IntToStr(vcodexp);
//       vurl:='www.unoeste.br/registrodiplomas/'+IntToStr(vcodexp)+'.';
       QExtrato.Post;

       QExtLiv.Close;
       QExtLiv.Open;

       MTReg.First;
       While not MTReg.Eof do
       Begin
         QExtLiv.Append;
         QExtLiv['exp_seq']:=vcodexp;
         QExtLiv['liv_numero']:=MTReg['liv_numero'];
         QExtLiv['liv_tipo']:=CBTipo.ItemIndex;
         QExtLiv['epl_numregdipini']:=MTReg['regini'];
         QExtLiv['epl_numregdipfim']:=MTReg['regfim'];
         QExtLiv.Post;

         QAux.Close;
         QAux.Sql.Clear;
         QAux.Sql.Add('update sca_itenslivdip set exp_seq =:codexp');
         QAux.Sql.Add('where liv_numero =:nrlivro and liv_tipo =:tipo and nrd_numreg between :regini and :regfim and srd_codigo <> 2');
         QAux.ParamByName('codexp').AsInteger:=vcodexp;
         QAux.ParamByName('nrlivro').AsSmallInt:=MTReg['liv_numero'];
         QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
         QAux.ParamByName('regini').AsInteger:=MTReg['regini'];
         QAux.ParamByName('regfim').AsInteger:=MTReg['regfim'];
         QAux.ExecSql;

         MTReg.Next;
       End;

       ppRichView1.RichView.Clear;
       ppRichView1.RichView.Style.TextStyles.Items[0].FontName:='Calibri';
       ppRichView1.RichView.Style.TextStyles.Items[0].Size:=11;
       ppRichView1.RichView.Style.TextStyles.Items[0].Color:=clBlack;
       ppRichView1.RichView.Style.TextStyles.Items[0].Style:=[];

       ppRichView1.RichView.Style.TextStyles.Items[1].FontName:='Calibri';
       ppRichView1.RichView.Style.TextStyles.Items[1].Size:=11;
       ppRichView1.RichView.Style.TextStyles.Items[1].Color:=clBlack;
       ppRichView1.RichView.Style.TextStyles.Items[1].Style:=[fsUnderline];

       ppRichView1.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
       ppRichView1.RichView.Style.ParaStyles.Items[0].LineSpacing:=120;
       ppRichView1.RichView.Style.ParaStyles.Items[0].FirstIndent:=0;

       ppRichView1.RichView.Style.ParaStyles.Items[1].Alignment:=rvaCenter;
       ppRichView1.RichView.Style.ParaStyles.Items[1].LineSpacing:=120;
       ppRichView1.RichView.Style.ParaStyles.Items[1].FirstIndent:=0;

{       ppRichView1.RichView.AddNL('UNIVERSIDADE DO OESTE PAULISTA',0,1);
       ppRichView1.RichView.AddNL('ASSOCIAÇÃO PRUDENTINA DE EDUCAÇÃO E CULTURA-APEC',0,1);
       ppRichView1.RichView.AddNL('CNPJ: 44.860.740/0001-73',0,1);
       ppRichView1.RichView.AddNL('EXTRATO DE REGISTRO DE DIPLOMAS',0,1);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('Para fins do disposto no art. 21 da Portaria Mec. Nº 1.095 de 25 de outubro de 2018, ',0,0);
       ppRichView1.RichView.AddNL('esta instituição de Educação Superior informa ',0,-1);
       If vtotal <> 1
       Then
        Begin
          vtotext:=Copy(Extenso(vtotal),1,Pos('REAIS',Extenso(vtotal)) - 1);
          ppRichView1.RichView.AddNL('que foram registrados '+IntToStr(vtotal),0,-1);
          ppRichView1.RichView.AddNL(' ('+vtotext+') ',1,-1);
          ppRichView1.RichView.AddNL('diplomas no período de ',0,-1);
        End
       Else
        Begin
          ppRichView1.RichView.AddNL('que foi registrado 01 ',0,-1);
          ppRichView1.RichView.AddNL('(um) ',1,-1);
          ppRichView1.RichView.AddNL('diploma no período de ',0,-1);
        End;
       ppRichView1.RichView.AddNL(DateToStr(vdataini)+' a '+DateToStr(vdatafim),1,-1);
       ppRichView1.RichView.AddNL(' no(s) seguinte(s) livro(s) de registro e sequências numéricas: ',0,-1);
       ppRichView1.RichView.AddNL(vreg+'.',1,-1);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('A relação dos diplomas registrados poderá ser consultada em até quinze dias, no endereço '+vurl,0,0);
       DecodeDate(QExtrato['exp_dtinserido'],vano,vmes,vdia);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('Presidente Prudente, '+StrZero(vdia,2)+' de '+Trata_Texto(Mes[vmes])+' de '+IntToStr(vano)+'.',0,1);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('ANA CRISTINA DE OLIVEIRA LIMA',0,1);
       ppRichView1.RichView.AddNL('Reitora da Unoeste',0,1);}

       ppRichView1.RichView.AddNL('Mantenedora: Associação Prudentina de Educação e Cultura - APEC - CNPJ: 44.860.740/0001-73',0,1);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('AVISO/REGISTRO DE DIPLOMAS',0,1);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('A Associação Prudentina de Educação e Cultura - APEC, para fins do disposto no art. 21 da Portaria Mec. Nº 1.095 de 25 de outubro de 2018, ',0,0);
       ppRichView1.RichView.AddNL('torna público que a Universidade do Oeste Paulista - UNOESTE, Instituição de Educação Superior, ',0,-1);
       If vtotal <> 1
       Then
        Begin
          vtotext:=Copy(Extenso(vtotal),1,Pos('REAIS',Extenso(vtotal)) - 1);
          ppRichView1.RichView.AddNL('que foram registrados '+IntToStr(vtotal),0,-1);
          ppRichView1.RichView.AddNL(' ('+vtotext+') ',0,-1);
          ppRichView1.RichView.AddNL('diplomas no período de ',0,-1);
        End
       Else
        Begin
          ppRichView1.RichView.AddNL('que foi registrado 01 ',0,-1);
          ppRichView1.RichView.AddNL('(um) ',0,-1);
          ppRichView1.RichView.AddNL('diploma no período de ',0,-1);
        End;
       ppRichView1.RichView.AddNL(DateToStr(vdataini)+' a '+DateToStr(vdatafim),0,-1);
       ppRichView1.RichView.AddNL(' no(s) seguinte(s) livro(s) de registro e sequências numéricas: ',0,-1);
       ppRichView1.RichView.AddNL(vreg+'. ',0,-1);
       ppRichView1.RichView.AddNL('A relação dos diplomas registrados poderá ser consultada em até quinze dias, no endereço ',0,-1);
       ppRichView1.RichView.AddNL(QExtrato['exp_url'],1,-1);
       ppRichView1.RichView.AddNL('.',0,-1);
       DecodeDate(QExtrato['exp_dtinserido'],vano,vmes,vdia);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('Presidente Prudente, '+StrZero(vdia,2)+' de '+Trata_Texto(Mes[vmes])+' de '+IntToStr(vano)+'.',0,1);
       ppRichView1.RichView.AddNL('AUGUSTO CÉSAR DE OLIVEIRA LIMA',0,1);
       ppRichView1.RichView.AddNL('Diretor Geral APEC',0,1);

       Menuprin.Database1.Commit;

       QExtrato.Close;
       QExtrato.Sql.Clear;
       QExtrato.Sql.Add('select * from sca_extratopub');
       QExtrato.Sql.Add('where exp_seq =:codexp');
       QExtrato.ParamByName('codexp').AsInteger:=vcodexp;
       QExtrato.Open;

//       ppRichView1.RichView.Format;

       RExtrato.AllowPrintToFile := True;
       RExtrato.ShowPrintDialog := False;
       RExtrato.ShowCancelDialog := False;
       RExtrato.TextFileName := C_PASTA_TEMPORARIA+'\EXTRATO_'+IntToStr(QExtrato['exp_seq'])+'.PDF';
       RExtrato.DeviceType := 'PDF';

       RExtrato.Print;
     Except
       Menuprin.Database1.RollBack;
       MessageDlg('Ocorreu um erro. Extrato será cancelado!',mtError,[mbOk],0);
     End;
   End;  
  CBTipo.SetFocus;
end;

procedure TFExtPub.b_okExit(Sender: TObject);
begin
  B_Ok.Enabled:=False;
end;

procedure TFExtPub.FormActivate(Sender: TObject);
begin
  CBTipo.ItemIndex:=0;
  CBTipo.SetFocus;
end;

procedure TFExtPub.CBTipoEnter(Sender: TObject);
begin
  Limpa(FExtPub);
  B_Cancela.Enabled:=True;
  B_Ok.Enabled:=False;
  QAux.Close;
  QExtrato.Close;
  QExtLiv.Close;
  MTReg.Close;
  MTReg.EmptyTable;
  MTReg.Open;
end;

procedure TFExtPub.CBTipoExit(Sender: TObject);
var ok:boolean;
begin
 If (not B_Cancela.Focused) and (not B_Sair.Focused)
 Then
  If Trim(CBTipo.Text) = ''
  Then CBTipo.SetFocus
  Else
   Begin
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select * from sca_itenslivdip');
     QAux.Sql.Add('where liv_tipo =:tipo and exp_seq is null and srd_codigo <> 2');
     QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
     QAux.Open;
     If QAux.Eof
     Then
      Begin
        MessageDlg('Não há registros de diplomas sem extrato gerado!',mtError,[mbOk],0);
        CBTipo.SetFocus;
      End
     Else
      Begin
        ok:=true;
        QAux.Close;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from sca_extratopub p, sca_extpublivro l');
        QAux.Sql.Add('where p.exp_seq = l.exp_seq and liv_tipo =:tipo and exp_dtpubdou is null');
        QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
        QAux.Open;
        If not QAux.Eof
        Then
         If MessageDlg('Atenção. Existe um extrato gerado no dia '+DateTimeToStr(QAux['exp_dtinserido'])+' sem dados do Diário Oficial da União cadastrado. Deseja gerar outro extrato mesmo assim ? ',mtConfirmation, [mbYes, mbNo], 0) = mrNo
         Then ok:=false;
        If ok
        Then
         Begin
           QAux.Close;
           QAux.Sql.Clear;
           QAux.Sql.Add('select liv_numero, min(nrd_numreg) regini, max(nrd_numreg) regfim,');
           QAux.Sql.Add('       min(ahb_datreg) dataini, max(ahb_datreg) datafim, count(*) total');
           QAux.Sql.Add('from sca_itenslivdip');
           QAux.Sql.Add('where liv_tipo =:tipo and exp_seq is null and srd_codigo <> 2');
           QAux.Sql.Add('group by 1');
           QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
           QAux.Open;
           While not QAux.Eof do
           Begin
             MTReg.Append;
             MTReg['liv_numero']:=QAux['liv_numero'];
             MTReg['regini']:=QAux['regini'];
             MTReg['regfim']:=QAux['regfim'];
             MTReg['dataini']:=QAux['dataini'];
             MTReg['datafim']:=QAux['datafim'];
             MTReg['total']:=QAux['total'];
             MTReg.Post;
             QAux.Next;
           End;

           B_Ok.Enabled:=True;
           B_Ok.SetFocus;
         End
        Else CBTipo.SetFocus;
      End;
   End;
end;

{
 PSaD.ppiyScreen * PSaD.ppiyDevice
 PSaD.ppixScreen * PSaD.ppixDevice
}
end.
