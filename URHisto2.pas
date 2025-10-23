unit URHisto2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Buttons, DB, DBTables, Printers,
  RXLookup, rxMemTable, ppBands, ppCtrls, ppPrnabl, ppClass, ppProd,
  ppReport, ppDB, ppComm, ppCache, ppDBPipe, ppStrtch, ppSubRpt, ppRelatv,
  ppModule, daDatMod, ppMemo, ppViewr, ppVar, jpeg, ppRichView, RVStyle,
  rxToolEdit, rxCurrEdit, Variants, ppParameter, ppDesignLayer, ppRichTx;

type
  TFRHisto2 = class(TForm)
    Panel1: TPanel;
    MERA: TCurrencyEdit;
    SBLocAlu: TSpeedButton;
    Label2: TLabel;
    QConsAlu: TQuery;
    LNomAlu: TLabel;
    QLocalidade: TQuery;
    QNacional: TQuery;
    QObserv: TQuery;
    QAdiciona: TQuery;
    QConsEq: TQuery;
    QRFicha: TQuery;
    Panel2: TPanel;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    B_Finaliza: TBitBtn;
    QConsAdi: TQuery;
    ppDBPipeline1: TppDBPipeline;
    RHistEsp: TppReport;
    DBDisc: TppDetailBand;
    ppShape8: TppShape;
    LCodDis: TppLabel;
    DSFicha: TDataSource;
    SCab: TppShape;
    ppShape4: TppShape;
    DBTChMin: TppDBText;
    ppGroup1: TppGroup;
    GHBHistor: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    DSObserv: TDataSource;
    SRObs: TppSubReport;
    ppChildReport1: TppChildReport;
    TBObs: TppTitleBand;
    DBObs: TppDetailBand;
    ppDBPipeline2: TppDBPipeline;
    QObservobs_codigo: TSmallintField;
    QObservobs_observ1: TStringField;
    LNomObs1: TppLabel;
    LNomObs2: TppLabel;
    SREquival: TppSubReport;
    ppChildReport2: TppChildReport;
    TBEquival: TppTitleBand;
    DBEquival: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    LPerLet: TppLabel;
    LMedFin: TppLabel;
    LSitFin: TppLabel;
    LObs: TppLabel;
    ppDBPipeline3: TppDBPipeline;
    LCodDis2: TppLabel;
    LCgHora: TppLabel;
    LPerLet2: TppLabel;
    LSitFin2: TppLabel;
    LObs2: TppLabel;
    ppShape3: TppShape;
    LCidade: TppLabel;
    ppLine3: TppLine;
    LPrograma: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppShape7: TppShape;
    LRA: TppLabel;
    ppLabel7: TppLabel;
    ppShape9: TppShape;
    LAluno: TppLabel;
    ppLabel8: TppLabel;
    ppShape10: TppShape;
    LRG: TppLabel;
    ppShape11: TppShape;
    LEst: TppLabel;
    ppLabel10: TppLabel;
    ppLabel9: TppLabel;
    ppShape12: TppShape;
    LPai: TppLabel;
    ppShape13: TppShape;
    LMae: TppLabel;
    ppLabel12: TppLabel;
    SRAdicional: TppSubReport;
    ppChildReport3: TppChildReport;
    TBAdicionais: TppTitleBand;
    DBAdicionais: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBPipeline4: TppDBPipeline;
    ppDBText2: TppDBText;
    LCodDis3: TppLabel;
    ppShape15: TppShape;
    ppLabel17: TppLabel;
    ppLine4: TppLine;
    ppLabel18: TppLabel;
    ppLine5: TppLine;
    ppLabel19: TppLabel;
    ppLine6: TppLine;
    ppLabel20: TppLabel;
    ppLine7: TppLine;
    ppLabel21: TppLabel;
    ppLine8: TppLine;
    ppLabel22: TppLabel;
    ppLine9: TppLine;
    ppLabel23: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    LPerLet3: TppLabel;
    ppLine30: TppLine;
    ppDBText9: TppDBText;
    ppLine31: TppLine;
    ppLabel26: TppLabel;
    ppLine32: TppLine;
    LObs3: TppLabel;
    ppLine33: TppLine;
    ppDBText10: TppDBText;
    LCodObs: TppLabel;
    MTObs: TMemoryTable;
    DSObs: TDataSource;
    MTObsobs_codigo: TStringField;
    MTObsobs_observ: TStringField;
    ppDBPipeline5: TppDBPipeline;
    SRObs2: TppSubReport;
    ppChildReport6: TppChildReport;
    TBObs2: TppTitleBand;
    DBObs2: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    MTCH: TMemoryTable;
    DSCH: TDataSource;
    MTCHtotch: TSmallintField;
    ppDBPipeline8: TppDBPipeline;
    SRCH: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppShape14: TppShape;
    LTotCH: TppLabel;
    LnObs1: TppLine;
    LnObs2: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    HBHistor: TppHeaderBand;
    ppLine55: TppLine;
    ppLabel13: TppLabel;
    ppShape16: TppShape;
    LDatNas: TppLabel;
    ppShape17: TppShape;
    LLocNas: TppLabel;
    ppLabel15: TppLabel;
    ppShape18: TppShape;
    LUF1: TppLabel;
    ppLabel16: TppLabel;
    ppShape19: TppShape;
    ppLabel14: TppLabel;
    LNasc: TppLabel;
    ppShape24: TppShape;
    ppLabel34: TppLabel;
    LCerTif: TppLabel;
    ppShape25: TppShape;
    ppLabel36: TppLabel;
    LRM: TppLabel;
    ppShape26: TppShape;
    ppLabel37: TppLabel;
    LCSM: TppLabel;
    ppShape27: TppShape;
    ppShape28: TppShape;
    SObs: TppShape;
    MTDisc: TMemoryTable;
    MTDiscmod_seq: TIntegerField;
    MTDischis_perlet: TSmallintField;
    MTDischis_semref: TSmallintField;
    MTEquival: TMemoryTable;
    IntegerField2: TIntegerField;
    MTEquivalequ_nrodis: TSmallintField;
    MTAdiciona: TMemoryTable;
    MTAdicionaadi_nro: TIntegerField;
    LContinua: TppLabel;
    ppShape51: TppShape;
    QEquival: TQuery;
    ppShape52: TppShape;
    ppLabel53: TppLabel;
    ppShape53: TppShape;
    LFolha2: TppLabel;
    ppLine51: TppLine;
    Label1: TLabel;
    MECopias: TMaskEdit;
    SBHistor: TppSummaryBand;
    ppLine36: TppLine;
    ppLine38: TppLine;
    LCabObs1: TppLabel;
    ppLine37: TppLine;
    LCabObs2: TppLabel;
    ppLine39: TppLine;
    LPag: TppLabel;
    QDadAlu: TQuery;
    SPFicha: TStoredProc;
    QCurso: TQuery;
    QRFichaalu_ra: TFloatField;
    QRFichaofc_seq: TIntegerField;
    QRFichamod_seq: TIntegerField;
    QRFichahis_sitfin: TStringField;
    QRFichahis_codlan: TSmallintField;
    QRFichahis_conceito: TStringField;
    QRFichamod_descr: TStringField;
    QRFichahis_chminima: TSmallintField;
    QRFichaofm_controle: TSmallintField;
    QRFichaofm_nordem: TSmallintField;
    QRFichahis_perlet: TSmallintField;
    QRFichahis_semref: TSmallintField;
    QRFichahis_pfreq: TFloatField;
    QRFichahis_nota: TFloatField;
    DSEquival: TDataSource;
    QEquivalequ_nrodis: TSmallintField;
    QEquivalalu_ra: TFloatField;
    QEquivalmod_seq: TIntegerField;
    QEquivalequ_nomdis: TStringField;
    QEquivalequ_perlet: TSmallintField;
    QEquivalequ_cghora: TSmallintField;
    QEquivalequ_conceito: TStringField;
    QEquivalequ_codobs: TSmallintField;
    QEquivalequ_nota: TFloatField;
    DSAdiciona: TDataSource;
    QAdicionaadi_nro: TSmallintField;
    QAdicionaalu_ra: TFloatField;
    QAdicionaadi_nomdis: TStringField;
    QAdicionaadi_perlet: TSmallintField;
    QAdicionaadi_cghora: TSmallintField;
    QAdicionaadi_conceito: TStringField;
    QAdicionaadi_codobs: TSmallintField;
    ppLine40: TppLine;
    QRFichaare_seq: TIntegerField;
    QRFichaare_nome: TStringField;
    ppGroup2: TppGroup;
    GHBArea: TppGroupHeaderBand;
    GFBArea: TppGroupFooterBand;
    ppShape29: TppShape;
    ppDBText6: TppDBText;
    ppShape5: TppShape;
    LTotArea: TppLabel;
    QRFicAux: TQuery;
    QAluMat: TQuery;
    SRMonografia: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand2: TppDetailBand;
    QOfCur: TQuery;
    ppDBPipeline6: TppDBPipeline;
    ppGroup3: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine42: TppLine;
    QAluPos: TQuery;
    QProfessor: TQuery;
    DSProfessor: TDataSource;
    ppDBPipeline7: TppDBPipeline;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField35: TppField;
    ppField36: TppField;
    ppField37: TppField;
    ppField40: TppField;
    ppField41: TppField;
    ppField42: TppField;
    ppField43: TppField;
    ppField44: TppField;
    ppField45: TppField;
    ppField46: TppField;
    ppField47: TppField;
    ppField48: TppField;
    ppField49: TppField;
    ppField51: TppField;
    ppField52: TppField;
    ppField53: TppField;
    ppField54: TppField;
    ppField55: TppField;
    ppField56: TppField;
    ppField57: TppField;
    ppField58: TppField;
    ppField59: TppField;
    ppField60: TppField;
    ppField61: TppField;
    ppField62: TppField;
    ppField63: TppField;
    ppField64: TppField;
    ppField65: TppField;
    ppField66: TppField;
    ppField67: TppField;
    ppField68: TppField;
    ppField69: TppField;
    ppField70: TppField;
    ppField71: TppField;
    ppField72: TppField;
    QProfessoralu_ra: TFloatField;
    QProfessorfun_matr: TIntegerField;
    QProfessorfun_matr_1: TIntegerField;
    QProfessorpes_nome: TStringField;
    QProfessorarc_codigo: TStringField;
    QProfessortit_codigo: TSmallintField;
    QProfessorpro_regime: TSmallintField;
    QProfessorpro_cargoinst: TSmallintField;
    QProfessorpro_progrcapac: TStringField;
    QProfessorpro_anolec: TSmallintField;
    QProfessorpro_anolecuno: TSmallintField;
    QProfessorpro_livtot: TSmallintField;
    QProfessorpro_liv12: TSmallintField;
    QProfessorpro_arttot: TSmallintField;
    QProfessorpro_art12: TSmallintField;
    QProfessorpro_areaestudo: TStringField;
    QProfessorpro_sexo: TSmallintField;
    QProfessorpro_areaodo: TStringField;
    QProfessorpro_titrh: TSmallintField;
    QProfessorpro_totaula: TSmallintField;
    QProfessorpro_ondepos: TSmallintField;
    QProfessorpro_ativacad: TSmallintField;
    QProfessorpro_ativadm: TSmallintField;
    QProfessortit_cursando: TSmallintField;
    ppShape1: TppShape;
    LTurma: TppLabel;
    ppLabel29: TppLabel;
    QProfessorpro_qualifprof: TStringField;
    QProfessoraro_codigo: TStringField;
    QProfessorpro_datatu: TDateField;
    QProfessorpro_datchec: TDateField;
    QProfessorpro_vinculo: TSmallintField;
    QProfessorpro_regtrabalho: TSmallintField;
    QProfessorpro_situacao: TSmallintField;
    RVMono: TppRichView;
    ppLine1: TppLine;
    ppShape6: TppShape;
    RVEquiv: TppRichView;
    QMonografia: TQuery;
    QMonografiaalu_lingua: TSmallintField;
    QMonografiaalu_ra: TFloatField;
    QMonografiaies_seq: TIntegerField;
    QMonografiaalu_sitprof: TStringField;
    QMonografiacur_codigo: TSmallintField;
    QMonografiaalu_datqual: TDateField;
    QMonografiaalu_conqual: TStringField;
    QMonografiaalu_titdis: TStringField;
    QMonografiaalu_datdef: TDateField;
    QMonografiaalu_cursup: TStringField;
    QMonografiaalu_anoconcl: TSmallintField;
    QMonografiaalu_paisres: TStringField;
    QMonografiaalu_escolaridade: TSmallintField;
    QMonografiaalu_passaporte: TStringField;
    QMonografiaalu_email: TStringField;
    QMonografiafun_matr: TIntegerField;
    QMonografiaalu_obs: TStringField;
    QMonografiaalu_condef: TFloatField;
    QMonografiaalu_entidade: TStringField;
    QMonografiaalu_conclusao: TDateField;
    QMonografiaalu_expedicao: TDateField;
    QMonografiaalu_turma: TSmallintField;
    QMonografiaalu_graduacao: TStringField;
    QMonografiaalu_qtdecert: TSmallintField;
    QMonografiaalu_dtultemis: TDateTimeField;
    QMonografiaalu_corresp: TStringField;
    QMonografiaalu_funemis: TIntegerField;
    QMonografiaalu_nrlivro: TStringField;
    QMonografiaalu_nrfolha: TStringField;
    QMonografiaalu_datreg: TDateField;
    DSMonografia: TDataSource;
    LMedFin2: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel1: TppLabel;
    LRA2: TppLabel;
    ppLabel2: TppLabel;
    CBAtualiza: TCheckBox;
    DBRTMod: TppDBRichText;
    QHistoricoDigital: TQuery;
    RTMono: TppRichText;
    ppImage1: TppImage;
    ppImage2: TppImage;
    procedure MERAEnter(Sender: TObject);
    procedure MERAExit(Sender: TObject);
    procedure B_FinalizaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBLocAluClick(Sender: TObject);
    procedure b_okClick(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure GHBHistorBeforePrint(Sender: TObject);
    procedure DBAdicionaisBeforeGenerate(Sender: TObject);
    procedure TBAdicionaisBeforeGenerate(Sender: TObject);
    procedure TBObsBeforeGenerate(Sender: TObject);
    procedure TBObs2BeforeGenerate(Sender: TObject);
    procedure HBHistorBeforePrint(Sender: TObject);
    procedure DBObsBeforePrint(Sender: TObject);
    procedure DBObsAfterPrint(Sender: TObject);
    procedure MECopiasEnter(Sender: TObject);
    procedure MECopiasExit(Sender: TObject);
    procedure DBDiscBeforeGenerate(Sender: TObject);
    procedure DBEquivalBeforeGenerate(Sender: TObject);
    procedure RHistEspStartSecondPass(Sender: TObject);
    procedure RHistEspBeforePrint(Sender: TObject);
    procedure TBObsAfterGenerate(Sender: TObject);
    procedure TBObs2AfterGenerate(Sender: TObject);
    procedure GHBAreaBeforePrint(Sender: TObject);
    procedure GFBAreaBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure CBAtualizaExit(Sender: TObject);
  private
    vdataAtual:string;
    imp_dados, imp_historico:boolean;
    Function  Achou_Equivalencia(tipo:word):Boolean;
    function InicializaPasta(Pasta : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

const
  C_PASTA_TEMPORARIA = 'C:\Sistemas\pdf_tmp';

var
  FRHisto2: TFRHisto2;
  lancado,cabobs,concluiu:boolean;
  totcarga,totarea,totdis,vdiaatu,vmesatu,vanoatu:word;
  totnota:real;

implementation

Uses UMenupri, UConsAlu, UProcs;

{$R *.DFM}

procedure TFRHisto2.MERAEnter(Sender: TObject);
begin
  QMonografia.Close;
  QOfCur.Close;
  MERA.Clear;
  SBLocAlu.Enabled:=True;
  LNomAlu.Caption:='';
  B_Cancela.Enabled:=True;
  B_Ok.Enabled:=False;
end;

procedure TFRHisto2.MERAExit(Sender: TObject);
begin
 SBLocAlu.Enabled:=False;
 If (not b_finaliza.focused)
 Then
  If MERA.Text <> ''
  Then
   Begin
//    MERA.Text:=StrZero(StrToFloat(Trim(MERA.Text)),10);
    QConsAlu.Close;
    QConsAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    QConsAlu.Open;
    If not QConsAlu.Eof
    Then
     Begin
      If QConsAlu['cur_area'] <> 5  // Curso à Distância
      Then
       Begin
         imp_historico:=false;
         if vexibemensagem = 'S' then
            MessageDlg('Aluno não faz curso à distância!',mtError,[mbOk],0);
         If vexibe = 'S'
         Then MERA.SetFocus;
       End
      Else
       If not Valida_Usuario(0,0,QConsAlu['alu_ra'])
       Then
        Begin
          imp_historico:=false;
          if vexibemensagem = 'S' then
             MessageDlg('Usuário não pode emitir histórico escolar deste aluno!',mtError,[mbOk],0);
          If vexibe = 'S'
          Then MERA.SetFocus;
        End
       Else
        Begin
          LNomAlu.Caption:=QConsAlu['pes_nome'];
          QAluPos.Close;
          QAluPos.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
          QAluPos.Open;
          If QAluPos.Eof
          Then
           Begin
             imp_historico:=false;
             if vexibemensagem = 'S' then
                MessageDlg('Cadastro do Aluno (Pós-Graduação) não foi efetuado!',mtError,[mbOk],0);
             If vexibe = 'S'
             Then MERA.SetFocus;
           End
          Else
           If QAluPos['alu_turma'] = Null
           Then
            Begin
              imp_historico:=false;
              if vexibemensagem = 'S' then
                 MessageDlg('Turma do aluno não foi definida!',mtError,[mbOk],0);
              If vexibe = 'S'
              Then MERA.SetFocus;
            End
           Else
            Begin
              QOfCur.Close;
              QOfCur.ParamByName('codcur').AsSmallInt:=QConsAlu['cur_codigo'];
              QOfCur.ParamByName('turma').AsSmallInt:=QAluPos['alu_turma'];
              QOfCur.Open;
            End;
        End;
     End
    Else
     Begin
       imp_historico:=false;
       if vexibemensagem = 'S' then
          MessageDlg('Registro Acadêmico Inválido !!!',mtError,[mbok],0);
       If vexibe = 'S'
       Then MERA.SetFocus;
     End;
   End
  Else
   If vexibe = 'S'
   Then MERA.SetFocus;
end;

procedure TFRHisto2.B_FinalizaClick(Sender: TObject);
begin
  Close;
end;

procedure TFRHisto2.FormActivate(Sender: TObject);
begin
  If vexibe = 'S'
  Then MERA.SetFocus;
end;

procedure TFRHisto2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRFicha.Close;
  QDadAlu.Close;
  QConsAlu.Close;
  QNacional.Close;
  SPFicha.Close;
  QLocalidade.Close;
  QEquival.Close;
  QObserv.Close;
  QConsEq.Close;
  QConsAdi.Close;
  QAluPos.Close;
  QCurso.Close;
  QAluMat.Close;
end;

procedure TFRHisto2.FormCreate(Sender: TObject);
var ErroConexao, NomeArquivoCompletoGED, NomeArquivoTemporario , retorno: String;
begin
    imp_historico:=true;
    CBAtualiza.Checked:=vGed = 'S';
    { Gerando pasta temporária }
    if not InicializaPasta(C_PASTA_TEMPORARIA)
       then begin
                if vexibemensagem = 'S' then
                   MessageDlg('Não foi possível gerar a pasta temporária. Verifique as permissões de gravação!',mtInformation,[mbOk],0);
                PostMessage(self.handle,wm_close,0,0);
                Exit;
            end;
  vdataAtual:=FormatDateTime('yyyy/mm/dd', DataSis);
  vdataAtual:=StringReplace(vdataAtual, '/','-',[rfIgnoreCase,rfReplaceAll]);
  imp_dados:=true;
  If vexibe = 'N'
  Then
   Begin
     MERAEnter(Sender);
     MERA.Text:=FloatToStr(vRA);
     MERAExit(Sender);
     MECopias.Text:='01';
     b_okClick(Sender);
   End;
end;

procedure TFRHisto2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TFRHisto2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TFRHisto2.SBLocAluClick(Sender: TObject);
begin
 Application.CreateForm(TFConsAlu, FConsAlu);
 FConsAlu.Hide;
 FConsAlu.ShowModal;
 If VRAcad <> 0
 Then MERA.Text:=FloatToStr(VRAcad);
 FConsAlu.Free;
end;

procedure TFRHisto2.b_okClick(Sender: TObject);
var j,tot: word;
  Device, Driver, Port: array [0..255] of char;
  DeviceMode: THandle;
begin
  QHistoricoDigital.Close;
  QHistoricoDigital.Sql.Clear;
  QHistoricoDigital.Sql.Add('select * from sca_atestadodigital');
  If vexibe = 'S'
  Then
   Begin
     If vhdg_seq = 0
     Then
      Begin
        QHistoricoDigital.Sql.Add('where alu_ra =:ra and atd_ativo = "S" and dcp_codigo = 21');
        QHistoricoDigital.Sql.Add('order by atd_seq desc');
        QHistoricoDigital.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QHistoricoDigital.Open;
        vhdg_seq:=NULLToZero(QHistoricoDigital['atd_seq']);
      End
     Else
      Begin
        QHistoricoDigital.Sql.Add('where atd_seq =:seq');
        QHistoricoDigital.ParamByName('seq').AsInteger:=vhdg_seq;
        QHistoricoDigital.Open;
      End;
   End
  Else
   Begin
     QHistoricoDigital.Sql.Add('where atd_seq =:seq');
     QHistoricoDigital.ParamByName('seq').AsInteger:=vhdg_seq;
     QHistoricoDigital.Open;
   End;

 B_Cancela.Enabled:=False;
 B_Ok.Enabled:=False;
 If vexibe = 'S'
 Then Panel2.SetFocus;
 DecodeDate(DataSis,vanoatu,vmesatu,vdiaatu);
 QDadAlu.Close;
 QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 QDadAlu.Open;
 QAluMat.Close;
 QAluMat.Sql.Clear;
 QAluMat.Sql.Add('select * from fin_alumat');
 QAluMat.Sql.Add('where alu_ra =:ra');
 QAluMat.Sql.Add('order by amt_ano, amt_semestre');
 QAluMat.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 QAluMat.Open;
 QCurso.Close;
 QCurso.ParamByName('codcur').AsSmallInt:=QConsAlu['cur_codigo'];
 QCurso.Open;
 Try
  SPFicha.Close;
  SPFicha.Params[0].AsFloat:=StrToFloat(Trim(MERA.Text));
  SPFicha.Params[1].AsString:='*';
  SPFicha.ExecProc;
  SPFicha.Close;
  QRFicha.Close;
  QRFicha.Sql.Clear;
  QRFicha.Sql.Add('Select * from spg_rficha');
  QRFicha.Sql.Add('where alu_ra =:ra and his_codlan <> 9');
  QRFicha.Sql.Add('order by ofm_nordem,are_seq');
  QRFicha.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
  QRFicha.Open;
  QRFicAux.Close;
  QRFicAux.Sql.Clear;
  QRFicAux.Sql.Add('Delete from spg_rficha');
  QRFicAux.Sql.Add('where alu_ra =:ra');
  QRFicAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
  QRFicAux.ExecSql;
  lancado:=false;
  concluiu:=true;
  MTDisc.Close;
  MTDisc.Open;
  MTEquival.Close;
  MTEquival.Open;
  MTAdiciona.Close;
  MTAdiciona.Open;

//  Printer.PrinterIndex := Printer.Printers.IndexOf('Microsoft Print to PDF');
//  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
//  Printer.SetPrinter(Device, Driver, C_PASTA_TEMPORARIA+'\HISTORICO_'+IntToStr(vhdg_seq)+'.PDF', 0);

  RHistEsp.PrinterSetUp.Copies:=StrToInt(Trim(MECopias.Text));
  RHistEsp.AllowPrintToFile := True;
  RHistEsp.ShowPrintDialog := False;
  RHistEsp.ShowCancelDialog := False;
  RHistEsp.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICO_'+MERA.Text+'_' + vdataAtual + '.PDF';
  RHistEsp.DeviceType := 'PDFA';
  LTurma.Caption:=IntToStr(NULLToZero(QAluPos['alu_turma']));
{  If QConsAlu['cur_grapos'] = 7 // Extensão
  Then LTitulo.Caption:='PRÓ-REITORIA DE EXTENSÃO E AÇÃO COMUNITÁRIA'
  Else LTitulo.Caption:='PRPPG - PRÓ-REITORIA DE PESQUISA E PÓS-GRADUAÇÃO';}
  RHistEsp.Print;
 Except
  if vexibemensagem = 'S' then
     MessageDlg('Ocorreu um erro durante a execução. Dados ficarão incompletos ou impressão será cancelada!!!',mtError,[mbok],0);
  If Printer.Printing
  Then Printer.EndDoc;
  QRFicAux.Close;
  QRFicAux.Sql.Clear;
  QRFicAux.Sql.Add('Delete from spg_rficha');
  QRFicAux.Sql.Add('where alu_ra =:ra');
  QRFicAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
  QRFicAux.ExecSql;
 End;
{ QRFicha.Close;
 QRFicha.Sql.Clear;
 QRFicha.Sql.Add('Delete from spg_rficha');
 QRFicha.Sql.Add('where alu_ra =:ra');
 QRFicha.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 QRFicha.ExecSql;}
 QDadAlu.Close;
 QConsAlu.Close;
 QNacional.Close;
 SPFicha.Close;
 QRFicha.Close;
 QLocalidade.Close;
 QEquival.Close;
 QConsEq.Close;
 QRFicAux.Close;
 If vexibe = 'S'
 Then MERA.SetFocus;
end;

procedure TFRHisto2.CBAtualizaExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  Begin
   B_Ok.Enabled:=True;
   If vexibe = 'S'
   Then B_Ok.SetFocus;
  End;
end;

procedure TFRHisto2.b_cancelaClick(Sender: TObject);
begin
  If vexibe = 'S'
  Then MERA.SetFocus;
end;

procedure TFRHisto2.GHBHistorBeforePrint(Sender: TObject);
var rec:string;
begin
 LPag.Caption:=IntToStr(RHistEsp.AbsolutePageNo)+' de '+IntToStr(RHistEsp.AbsolutePageCount);
// LFac.Caption:=NULLToSpace(QDadAlu['fac_nome']);
 rec:='';
{ If QDadAlu['cur_autndc'] <> Null
 Then
  If QDadAlu['cur_codigo'] = 4  //Farmacia
  Then
   Begin
    If QDadAlu['cur_autdcp'] = 1
    Then rec:=' - AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U '+DateToStr(QDadAlu['cur_autdata'])
    Else rec:=' - REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U '+DateToStr(QDadAlu['cur_autdata']);
   End
  Else
   Begin
    If QDadAlu['cur_autdcp'] = 1
    Then
     Begin
      If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
      Then rec:=' - AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U '+DateToStr(QDadAlu['cur_autdata'])
      Else rec:=' - AUT. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U '+DateToStr(QDadAlu['cur_autdata']);
     End
    Else
     Begin
      If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
      Then rec:=' - REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U '+DateToStr(QDadAlu['cur_autdata'])
      Else rec:=' - REC. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U '+DateToStr(QDadAlu['cur_autdata']);
     End;
   End;}
// LCurso.Caption:='CURSO : '+NULLToSpace(QDadAlu['cur_nomcur'])+rec;
 LPrograma.Caption:=NULLToSpace(QCurso['cur_programa']);
 LRA.Caption:=Mascara_RA(QConsAlu['alu_ra']);
 LAluno.Caption:=QDadAlu['pes_nome'];
 If (QDadAlu['nac_codigo'] = Null) or (QDadAlu['nac_codigo'] = 1) or (QDadAlu['nac_codigo'] = 9)
 Then
  Begin
    ppLabel8.caption:='R.G.';
    LRG.Caption:=NULLToSpace(QDadAlu['pes_rg']);
//    LOrg.Caption:=NULLToSpace(QDadAlu['pes_orgexp']);
    LEst.Caption:=NULLToSpace(QDadAlu['pes_estexp']);
{    If (QDadAlu['pes_cpf'] <> Null) and (QDadAlu['pes_cpf'] <> 0)
    Then LCPF.Caption:=Mascara_CPF(QDadAlu['pes_cpf'])
    Else LCPF.Caption:='';}
  End
 Else
  Begin
    ppLabel8.caption:=NULLToSpace(QDadAlu['tde_sigla']);
    LRG.Caption:=NULLToSpace(QDadAlu['pes_docestr']);
//    LOrg.Caption:='';
    LEst.Caption:='';
//    LCPF.Caption:='';
  End;
 LPai.Caption:=NULLToSpace(QDadAlu['pes_nompai']);
 LMae.Caption:=NULLToSpace(QDadAlu['pes_nommae']);
 If QDadAlu['pes_datnas'] <> Null
 Then LDatNas.Caption:=DateToStr(QDadAlu['pes_datnas'])
 Else LDatNas.Caption:='';
 If QDadAlu['pes_locnas'] <> Null
 Then
  Begin
   QLocalidade.Close;
   QLocalidade.ParamByName('Cod').AsInteger:=QDadAlu['pes_locnas'];
   QLocalidade.Open;
   LLocNas.Caption:=QLocalidade['loc_nome'];
   LUF1.Caption:=NULLToSpace(QLocalidade['loc_uf']);
  End
 Else
  Begin
   LLocNas.Caption:='';
   LUF1.Caption:='';
  End;
 If QDadAlu['nac_codigo'] <> Null
 Then
  Begin
   QNacional.Close;
   QNacional.ParamByName('Cod').AsInteger:=QDadAlu['nac_codigo'];
   QNacional.Open;
   LNasc.Caption:=QNacional['nac_descricao'];
  End
 Else LNasc.Caption:=''; 
 LCertif.Caption:='';
 LRM.Caption:='';
 LCSM.Caption:='';
 If QDadAlu['pes_sexo'] = 1
 Then
  Begin
   LCertif.Caption:=NULLToSpace(QDadAlu['pes_reserv']);
   If (QDadAlu['pes_regmil'] <> Null) and (QDadAlu['pes_regmil'] <> 0)
   Then LRM.Caption:=IntToStr(QDadAlu['pes_regmil']);
   If (QDadAlu['pes_cirmil'] <> Null) and (QDadAlu['pes_cirmil'] <> 0)
   Then LCSM.Caption:=IntToStr(QDadAlu['pes_cirmil']);
  End;
end;

procedure TFRHisto2.DBAdicionaisBeforeGenerate(Sender: TObject);
begin
 LCodDis3.Caption:='';
 If QAdiciona['adi_nro'] <> Null
 Then LCodDis3.Caption:=StrZero(QAdiciona['adi_nro'],7);
 If QAdiciona['adi_cghora'] <> Null
 Then
  If not Achou_AdicionalPos(MTAdiciona,QAdiciona)
  Then totcarga:=totcarga+QAdiciona['adi_cghora'];
 If QAdiciona['adi_perlet'] <> Null
 Then
  Begin
   If Length(IntToStr(QAdiciona['adi_perlet'])) = 4
   Then
    Begin
     If (StrToInt(Copy(IntToStr(QAdiciona['adi_perlet']),1,2)) > 20)
     Then LPerLet3.Caption:=Copy(IntToStr(QAdiciona['adi_perlet']),1,2)+'/'+Copy(IntToStr(QAdiciona['adi_perlet']),3,2)
     Else LPerLet3.Caption:=IntToStr(QAdiciona['adi_perlet']);
    End
   Else
    If QDadAlu['cur_anosem'] = 1
    Then LPerLet3.Caption:=Copy(IntToStr(QAdiciona['adi_perlet']),2,4)
    Else LPerLet3.Caption:=Copy(IntToStr(QAdiciona['adi_perlet']),1,1)+'/'+Copy(IntToStr(QAdiciona['adi_perlet']),2,4);
  End;
  LObs3.Caption:='';
  If QAdiciona['adi_codobs'] <> Null
  Then
   If (QAdiciona['adi_codobs'] < 90) or (QAdiciona['adi_codobs'] > 99)
   Then LObs3.Caption:='('+IntToStr(QAdiciona['adi_codobs'])+')'
end;

Function TFRHisto2.Achou_Equivalencia(tipo:word):Boolean;
var achou:boolean;
Begin
 Case tipo of
  1:Begin
     achou:=false;
     MTEquival.First;
     While not MTEquival.Eof do
     Begin
      If (QEquival['equ_nrodis'] = MTEquival['equ_nrodis']) and (QEquival['mod_seq'] = MTEquival['mod_seq'])
      Then
       Begin
        achou:=true;
        break;
       End;
      MTEquival.Next;
     End;
     If achou
     Then Achou_Equivalencia:=true
     Else
      Begin
       MTEquival.Append;
       MTEquival['equ_nrodis']:=QEquival['equ_nrodis'];
       MTEquival['mod_seq']:=QEquival['mod_seq'];
       MTEquival.Post;
       Achou_Equivalencia:=False;
      End;
    End;
  2:Begin
     Achou_Equivalencia:=False;
     MTEquival.First;
     While not MTEquival.Eof do
     Begin
      If (QRFicha['mod_seq'] = MTEquival['mod_seq'])
      Then
       Begin
        Achou_Equivalencia:=True;
        break;
       End;
      MTEquival.Next;
     End;
    End;
 End;
End;

procedure TFRHisto2.TBAdicionaisBeforeGenerate(Sender: TObject);
begin
 DBAdicionais.Visible:=False;
 QAdiciona.Close;
 QAdiciona.Sql.Clear;
 QAdiciona.Sql.Add('Select * from spg_adicionais');
 QAdiciona.Sql.Add('where alu_ra =:ra');
 QAdiciona.Sql.Add('order by adi_nro');
 QAdiciona.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 QAdiciona.Open;
 If not QAdiciona.Eof
 Then DBAdicionais.Visible:=True;
end;

procedure TFRHisto2.TBObsBeforeGenerate(Sender: TObject);
begin
{ CabObs:=False;
 ppLine36.Visible:=False;
 ppLine38.Visible:=False;
 LCabObs1.Visible:=False;
 DBObs.Visible:=False;
 QObserv.Close;
 QObserv.Sql.Clear;
 QObserv.Sql.Add('Select distinct obs_codigo,obs_observ1 from spg_observacoes');
 QObserv.Sql.Add('where alu_ra =:ra');
 QObserv.Sql.Add(' and ((obs_codigo < 90) or (obs_codigo > 99))');
 QObserv.Sql.Add('order by obs_codigo');
 QObserv.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 QObserv.Open;
 If not QObserv.Eof
 Then
  Begin
   CabObs:=True;
   ppLine36.Visible:=True;
   ppLine38.Visible:=True;
   LCabObs1.Visible:=True;
   DBObs.Visible:=True;
  End;}
end;

procedure TFRHisto2.TBObs2BeforeGenerate(Sender: TObject);
begin
 ppLine37.Visible:=False;
 ppLine39.Visible:=False;
 LCabObs2.Visible:=False;
 DBObs2.Visible:=False;
 MTObs.Close;
 MTObs.Open;
 If lancado
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='CARGA HORÁRIA COM "***", ENTENDER: - CARGA HORÁRIA JÁ LANÇADA EM DISPENSA OU EQUIVALÊNCIA DE OUTRA DISCIPLINA.';
   MTObs.Post;
  End;
 MTObs.First;
 If MTObs.RecordCount <> 0
 Then
  Begin
   If not CabObs
   Then
    Begin
     CabObs:=True;
     ppLine37.Visible:=True;
     ppLine39.Visible:=True;
     LCabObs2.Visible:=True;
    End;
   DBObs2.Visible:=True;
  End;
end;

procedure TFRHisto2.HBHistorBeforePrint(Sender: TObject);
begin
 LContinua.Caption:='Continuação do Histórico Escolar de '+QDadAlu['pes_nome'];
// LFolha2.Caption:='Folha:'+StrZero(RHistor.AbsolutePageNo,2)+' ';
end;

procedure TFRHisto2.DBObsBeforePrint(Sender: TObject);
begin
 DBObs.Visible:=False;
 LCodObs.Caption:='';
 LNomObs1.Caption:='';
 LNomObs2.Caption:='';
 If not QObserv.Eof
 Then
  If (QObserv['obs_codigo'] < 90) or (QObserv['obs_codigo'] > 99)
  Then
   Begin
    DBObs.Visible:=True;
    QConsEq.Close;
    QConsEq.Sql.Clear;
    QConsEq.Sql.Add('Select * from spg_equivalencia');
    QConsEq.Sql.Add('where alu_ra =:ra and equ_codobs =:codobs');
    QConsEq.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    QConsEq.ParamByName('codobs').assmallint:=QObserv['obs_codigo'];
    QConsEq.Open;
    If not QConsEq.Eof
    Then LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')'
    Else
     Begin
      QConsAdi.Close;
      QConsAdi.Sql.Clear;
      QConsAdi.Sql.Add('Select * from spg_adicionais');
      QConsAdi.Sql.Add('where alu_ra =:ra and adi_codobs =:codobs');
      QConsAdi.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
      QConsAdi.ParamByName('codobs').assmallint:=QObserv['obs_codigo'];
      QConsAdi.Open;
      If not QConsAdi.Eof
      Then LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')';
     End;
    If QObserv['obs_observ1'] <> Null
    Then
     Begin
      If Length(Trim(QObserv['obs_observ1'])) <= 120
      Then
       Begin
        SObs.Height:=0.10;
        LnObs1.Height:=0.10;
        LnObs2.Height:=0.10;
        LNomObs1.Visible:=True;
        LNomObs2.Visible:=False;
        LNomObs1.Caption:=QObserv['obs_observ1'];
       End
      Else
       Begin
        SObs.Height:=0.18;
        LnObs1.Height:=0.18;
        LnObs2.Height:=0.18;
        LNomObs1.Visible:=True;
        LNomObs2.Visible:=True;
        LNomObs1.Caption:=Copy(QObserv['obs_observ1'],1,120);
        LNomObs2.Caption:=Copy(QObserv['obs_observ1'],121,90);
       End;
     End;
   End;
end;

procedure TFRHisto2.DBObsAfterPrint(Sender: TObject);
begin
 DBObs.Visible:=True;
end;

procedure TFRHisto2.MECopiasEnter(Sender: TObject);
begin
  MECopias.Text:='02';
end;

procedure TFRHisto2.MECopiasExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If MECopias.Text = ''
  Then
   If vexibe = 'S'
   Then MECopias.SetFocus;
end;

procedure TFRHisto2.DBDiscBeforeGenerate(Sender: TObject);
var vsem:word;
begin
 LCodDis.Visible:=True;
 DBRTMod.Visible:=True;
 DBTCHMin.Visible:=True;
 LPerLet.Visible:=True;
 LMedFin.Visible:=True;
 LSitFin.Visible:=True;
 LObs.Visible:=True;
 SREquival.Visible:=False;
 LCodDis.Caption:=StrZero(QRFicha['mod_seq'],7);
 LPerLet.Caption:='';
 LMedFin.Caption:='';
 LSitFin.Caption:='';
 LObs.Caption:='';
 If (QRFicha['his_codlan'] = 1) or (QRFicha['his_codlan'] = 5) or (QRFicha['his_codlan'] = 11)
 Then
  Begin
   If not Achou_DisciplinaPos(MTDisc,QRFicha)
   Then
    Begin
     totcarga:=totcarga+QRFicha['his_chminima'];
     totarea:=totarea+QRFicha['his_chminima'];
     totnota:=totnota+QRFicha['his_nota'];
     totdis:=totdis + 1;
    End;
   QAluMat.Close;
   QAluMat.Sql.Clear;
   QAluMat.Sql.Add('select * from fin_alumat');
   QAluMat.Sql.Add('where amt_ano =:ano and amt_semestre =:semestre and alu_ra =:ra');
   QAluMat.ParamByName('ano').AsSmallInt:=QRFicha['his_perlet'];
   QAluMat.ParamByName('semestre').AsSmallInt:=QRFicha['his_semref'];
   QAluMat.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
   QAluMat.Open;
   If QAluMat.Eof
   Then
    Begin
     concluiu:=false;
     LPerLet.Caption:='*****';
     LMedFin.Caption:='******';
     LSitFin.Caption:='A CURSAR';
    End
   Else
    Begin
     If vmesatu < 7
     Then vsem:=1
     Else vsem:=2;
     If (QRFicha['his_perlet'] > vanoatu) or ((QRFicha['his_perlet'] = vanoatu) and (QRFicha['his_semref'] > vsem))
     Then
      Begin
       concluiu:=false;
       LPerLet.Caption:='*****';
       LMedFin.Caption:='******';
       LSitFin.Caption:='A CURSAR';
      End
     Else
      If QRFicha['his_sitfin'] = 'C'  // a cursar
      Then
       Begin
        concluiu:=false;
        LPerLet.Caption:='*****';
        LMedFin.Caption:='******';
        LSitFin.Caption:='A CURSAR';
       End
      Else
       Begin
        If QRFicha['his_perlet'] <> Null
        Then LPerLet.Caption:=IntToStr(QRFicha['his_semref'])+'/'+IntToStr(QRFicha['his_perlet']);
        If QRFicha['his_sitfin'] = 'A'
        Then
         Begin
          If (QRFicha['ofm_controle'] = 3) or (QRFicha['ofm_controle'] = 4)
          Then LMedFin.Caption:='******'
          Else
           If (QRFicha['ofm_controle'] = 1) or (QRFicha['ofm_controle'] = 2)
           Then LMedFin.Caption:=QRFicha['his_conceito']
           Else
            If QRFicha['his_nota'] <> Null
            Then LMedFin.Caption:=FormatFloat('#0.00',QRFicha['his_nota']);
          LSitFin.Caption:='APR';
         End
        Else
         Begin
          concluiu:=false;
          LMedFin.Caption:='******';
          LSitFin.Caption:='CURSANDO';
         End;
       End;
    End;
  End
 Else
  Begin
   If (QRFicha['his_codlan'] = 2) or (QRFicha['his_codlan'] = 3)
   Then
    Begin
     If not Achou_Equivalencia(2)
     Then
      Begin
       LCodDis.Visible:=False;
       DBRTMod.Visible:=False;
       DBTCHMin.Visible:=False;
       LPerLet.Visible:=False;
       LMedFin.Visible:=False;
       LSitFin.Visible:=False;
       LObs.Visible:=False;
       SREquival.Visible:=True;
       QEquival.Close;
       QEquival.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
       QEquival.ParamByName('coddis').asinteger:=QRFicha['mod_seq'];
       QEquival.Open;
      End
     Else SREquival.Visible:=True;
    End;
  End;
end;

procedure TFRHisto2.DBEquivalBeforeGenerate(Sender: TObject);
begin
 LCodDis2.Caption:=StrZero(QRFicha['mod_seq'],7);
 RVEquiv.RichView.Clear;
 RVEquiv.RichView.Style.TextStyles.Items[0].FontName:='Arial';
 RVEquiv.RichView.Style.TextStyles.Items[0].Size:=7;
 RVEquiv.RichView.Style.TextStyles.Items[0].Color:=clBlack;
 RVEquiv.RichView.Style.TextStyles.Items[0].Style:=[];
 RVEquiv.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
 RVEquiv.RichView.Add(QEquival['equ_nomdis'],0);
 RVEquiv.RichView.Format;

 If (QEquival['equ_cghora'] <> Null) and (QEquival['equ_cghora'] <> 0)
 Then
  Begin
   LCgHora.Caption:=IntToStr(QEquival['equ_cghora']);
   If not Achou_Equivalencia(1)
   Then
    Begin
     totcarga:=totcarga+QEquival['equ_cghora'];
     totarea:=totarea+QEquival['equ_cghora'];
     totnota:=totnota+QEquival['equ_nota'];
     totdis:=totdis + 1;
    End;
  End
 Else
  Begin
   LCgHora.Caption:='****';
   lancado:=true;
  End;

 If (QRFicha['ofm_controle'] = 3) or (QRFicha['ofm_controle'] = 4)
 Then LMedFin2.Caption:='******'
 Else
  If (QRFicha['ofm_controle'] = 1) or (QRFicha['ofm_controle'] = 2)
  Then LMedFin2.Caption:=QEquival['equ_conceito']
  Else
   If QRFicha['his_nota'] <> Null
   Then LMedFin2.Caption:=FormatFloat('#0.00',QEquival['equ_nota']);

 If QEquival['equ_perlet'] <> Null
 Then
  Begin
   If Length(IntToStr(QEquival['equ_perlet'])) <> 5
   Then
    Begin
     If (StrToInt(Copy(IntToStr(QEquival['equ_perlet']),1,2)) > 20)
     Then LPerLet2.Caption:=Copy(IntToStr(QEquival['equ_perlet']),1,2)+'/'+Copy(IntToStr(QEquival['equ_perlet']),3,2)
     Else LPerLet2.Caption:=IntToStr(QEquival['equ_perlet']);
    End
   Else
    If QDadAlu['cur_anosem'] = 1
    Then LPerLet2.Caption:=Copy(IntToStr(QEquival['equ_perlet']),2,4)
    Else
     If NULLToZero(QDadAlu['fac_codigo']) = 1 //Faclepp
     Then LPerLet2.Caption:=Copy(IntToStr(QEquival['equ_perlet']),1,1)+'/'+Copy(IntToStr(QEquival['equ_perlet']),2,4)
     Else
      If Length(IntToStr(QRFicha['his_perlet'])) = 5
      Then LPerLet2.Caption:=Copy(IntToStr(QEquival['equ_perlet']),2,4)
      Else
       If (QRFicha['his_perlet'] < 1999)
       Then LPerLet2.Caption:=Copy(IntToStr(QEquival['equ_perlet']),2,4)
       Else LPerLet2.Caption:=Copy(IntToStr(QEquival['equ_perlet']),1,1)+'/'+Copy(IntToStr(QEquival['equ_perlet']),2,4);
  End;

 LObs2.Caption:='';
 If QEquival['equ_codobs'] <> Null
 Then
  If (QEquival['equ_codobs'] < 90) or (QEquival['equ_codobs'] > 99)
  Then LObs2.Caption:='('+IntToStr(QEquival['equ_codobs'])+')';
end;

procedure TFRHisto2.RHistEspStartSecondPass(Sender: TObject);
begin
  totcarga:=0;
  totnota:=0;
  totdis:=0;
  lancado:=false;
  concluiu:=true;
  MTDisc.Close;
  MTDisc.Open;
  MTEquival.Close;
  MTEquival.Open;
  MTAdiciona.Close;
  MTAdiciona.Open;
end;

procedure TFRHisto2.RHistEspBeforePrint(Sender: TObject);
begin
  totcarga:=0;
  totnota:=0;
  totdis:=0;
  lancado:=false;
  concluiu:=true;
  MTDisc.Close;
  MTDisc.Open;
  MTEquival.Close;
  MTEquival.Open;
  MTAdiciona.Close;
  MTAdiciona.Open;
//  FBHistor.Height:=0.81;
//  LCidade.Top:=0.3125;
//  ppLine3.Top:=0.4375;
end;

procedure TFRHisto2.TBObsAfterGenerate(Sender: TObject);
begin
 ppLine36.Visible:=True;
 ppLine38.Visible:=True;
 LCabObs1.Visible:=True;
end;

procedure TFRHisto2.TBObs2AfterGenerate(Sender: TObject);
begin
 ppLine37.Visible:=True;
 ppLine39.Visible:=True;
 LCabObs2.Visible:=True;
end;

{Códigos de Lançamento do Histórico
1:Normal
2,3:Dispensa Normal
4,6:Dispensa Ed. Física
5:Reymi
8:Exclusão de Disc. A Cursar
9:Exclusão Lógica de Disc. Cursada
10:Acerto efetuado em disciplinas do curso de Comunicação Social
11:Transferência de Notas de uma disc. p/ outra (FACLEPP)}

procedure TFRHisto2.GHBAreaBeforePrint(Sender: TObject);
begin
 totarea:=0;
 If QRFicha['are_seq'] = Null
 Then GHBArea.Visible:=False
 Else GHBArea.Visible:=True;
end;

procedure TFRHisto2.GFBAreaBeforePrint(Sender: TObject);
begin
 If GHBArea.Visible
 Then
  Begin
   GFBArea.Visible:=True;
   LTotArea.Caption:='Total : '+IntToStr(totarea);
  End
 Else GFBArea.Visible:=False;
end;

procedure TFRHisto2.ppGroupFooterBand1BeforePrint(Sender: TObject);
var chmono:word;
    texto:string; 
begin
  chmono:=0;

  QMonografia.Close;
  If QConsAlu['cur_grapos'] = 3 // Especialização
  Then
   Begin
     If QOfCur['ofc_tccobrigatorio'] = 'S' // quando o TCC é obrigatório
     Then QMonografia.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text))
     Else
      If (NULLToSpace(QAluPos['alu_titdis']) <> '') and (QAluPos['alu_condef'] >= 6) // quando o aluno fez o TCC mesmo não sendo obrigatório
      Then QMonografia.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text))
      Else QMonografia.ParambyName('ra').AsFloat:=0;
   End
  Else QMonografia.ParambyName('ra').AsFloat:=0;
  QMonografia.Open;

  If not QMonografia.Eof
  Then
   Begin
     RTMono.Clear;
     RTMono.Font.Name:='Arial';
     RTMono.Font.Size:=8;
     RTMono.Font.Color:=clBlack;
     RTMono.Font.Style:=[];
     texto:='';
     texto:='Tema da Monografia : '+NULLToSpace(QMonografia['alu_titdis']) + #13;
     texto:=texto + 'Nota da Monografia : '+FormatFloat('#0.00',QMonografia['alu_condef']) + #13;
     texto:=texto + 'Orientador(es) :' + #13;
//     RTMono.RichText:='Tema da Monografia : '+NULLToSpace(QMonografia['alu_titdis']);
//     RTMono.RichText:='Nota da Monografia : '+FormatFloat('#0.00',QMonografia['alu_condef']);
//     RTMono.RichText:='Orientador(es) :';
     QProfessor.Close;
     QProfessor.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
     QProfessor.Open;
     While not QProfessor.Eof do
     Begin
       texto:=texto + NULLToSpace(QProfessor['pes_nome']) + #13;
//       RTMono.RichText:=NULLToSpace(QProfessor['pes_nome']);
       QProfessor.Next;
     End;
     RTMono.RichText:=texto;
     chmono:=NULLToZero(QOfCur['ofc_monografia']);
   End;

  MTCH.Close;
  MTCH.Open;
  MTCH.Append;
  MTCH['totch']:=totcarga+chmono;
  MTCH.Post;
  LTotCH.Caption:='Carga Horária Total do Curso : '+IntToStr(totcarga+chmono);

  CabObs:=False;
  ppLine36.Visible:=False;
  ppLine38.Visible:=False;
  LCabObs1.Visible:=False;
  DBObs.Visible:=False;
  QObserv.Close;
  QObserv.Sql.Clear;
  QObserv.Sql.Add('Select distinct obs_codigo,obs_observ1 from spg_observacoes');
  QObserv.Sql.Add('where alu_ra =:ra');
  QObserv.Sql.Add(' and ((obs_codigo < 90) or (obs_codigo > 99))');
  QObserv.Sql.Add('order by obs_codigo');
  QObserv.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
  QObserv.Open;
  If not QObserv.Eof
  Then
   Begin
    CabObs:=True;
    ppLine36.Visible:=True;
    ppLine38.Visible:=True;
    LCabObs1.Visible:=True;
    DBObs.Visible:=True;
   End;
end;

procedure TFRHisto2.ppGroupFooterBand3BeforePrint(Sender: TObject);
var vdia,vmes,vano:word;
begin
 DecodeDate(Date,vano,vmes,vdia);
 LCidade.Caption:='P. Prudente, '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano);
 LRA2.Caption:='R.A. '+Mascara_RA(QConsAlu['alu_ra'])+' em '+DateToStr(Date);
{ If RHistor.AbsolutePageNo = RHistor.AbsolutePageCount
 Then
  Begin
   FBHistor.Visible:=False;
   SBHistor.Visible:=True;
  End
 Else FBHistor.Visible:=True;}
end;

{ *************************************************************************************************************************************************** }

function TFRHisto2.InicializaPasta(Pasta : String) : Boolean;
begin
    Result := True;
    try
        if not DirectoryExists(Pasta)
           then begin
                   if not CreateDir(Pasta)
                      then begin
                               Result := False;
                           end;
                end;
    except
         Result := False;
    end;
end;

{ *************************************************************************************************************************************************** }

end.
