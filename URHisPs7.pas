unit URHisPs7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, DB, DBTables, Printers, ppDB,
  ppDBPipe, ppBands, ppCtrls, ppClass, ppReport, ppStrtch, ppSubRpt,
  ppPrnabl, ppCache, ppComm, ppProd, ppViewr, ppVar, ppRelatv, ppTypes,
  RxMemDS, ppParameter, ppDesignLayer, rxMemTable, rxToolEdit, Variants, Strak.Ghostscript,
  UGed_Documentos, Contnrs, RestJsonUtils, jpeg;

type
  TFRHisPs7 = class(TForm)
    Panel1: TPanel;
    SBLocAlu: TSpeedButton;
    Label2: TLabel;
    LNomAlu: TLabel;
    MERA: TMaskEdit;
    RGHist: TRadioGroup;
    RGTpHist: TRadioGroup;
    Panel2: TPanel;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    b_finaliza: TBitBtn;
    QObserv: TQuery;
    DSObserv: TDataSource;
    QDadAlu: TQuery;
    Qconsalu: TQuery;
    Qconscur: TQuery;
    Qconshab: TQuery;
    Qconsccl: TQuery;
    DSEquival: TDataSource;
    QEquival: TQuery;
    QConsAdi: TQuery;
    QCurSup: TQuery;
    QNacional: TQuery;
    DSACur1: TDataSource;
    SPACur1: TStoredProc;
    RA: TFloatField;
    SPACur1codhab: TSmallintField;
    SPACur1coddis: TIntegerField;
    SPACur1expression_3: TSmallintField;
    SPACur1expression_4: TSmallintField;
    SPFicha: TStoredProc;
    DSHab: TDataSource;
    MTHab: TMemoryTable;
    MTHabhab_Codigo: TSmallintField;
    MTHabHab_Nome: TStringField;
    QDisciplinas: TQuery;
    QLocalidade: TQuery;
    QObsCompl: TQuery;
    DSObsCompl: TDataSource;
    MTObs: TMemoryTable;
    MTObsobs_codigo: TStringField;
    MTObsobs_observ: TStringField;
    DSObs: TDataSource;
    QRFicha: TQuery;
    QRFichaalu_ra: TFloatField;
    QRFichahab_codigo: TSmallintField;
    QRFichadis_codigo: TIntegerField;
    QRFichahis_sitfin: TStringField;
    QRFichahis_codlan: TSmallintField;
    QRFichahis_anoref: TSmallintField;
    QRFichahis_semref: TSmallintField;
    QRFichahis_sequencia: TSmallintField;
    QRFichagra_nordem: TSmallintField;
    QRFichadis_nomdisc: TStringField;
    QRFichahis_medfin: TFloatField;
    QRFichahis_pfreq: TFloatField;
    QRFichahis_chminima: TSmallintField;
    QRFichagra_cont: TSmallintField;
    QRFichahis_perlet: TSmallintField;
    QRFichahis_medbi1: TFloatField;
    QRFichahis_medbi2: TFloatField;
    QRFichahis_medbi3: TFloatField;
    QRFichahis_medbi4: TFloatField;
    QRFichahis_perano: TStringField;
    qconsccl2: TQuery;
    DSCH: TDataSource;
    MTCH: TMemoryTable;
    MTCHtotch: TSmallintField;
    QConsEq: TQuery;
    DSAdiciona: TDataSource;
    QAdiciona: TQuery;
    QAdicionaadi_nro: TSmallintField;
    QAdicionaalu_ra: TFloatField;
    QAdicionahab_codigo: TSmallintField;
    QAdicionaadi_nomdis: TStringField;
    QAdicionaadi_cghora: TSmallintField;
    QAdicionaadi_medfin: TStringField;
    QAdicionaadi_pfreq: TStringField;
    QAdicionaadi_codobs: TSmallintField;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline5: TppDBPipeline;
    ppDBPipeline9: TppDBPipeline;
    ppField33: TppField;
    ppField34: TppField;
    ppField44: TppField;
    ppField45: TppField;
    ppField46: TppField;
    ppField47: TppField;
    ppDBPipeline8: TppDBPipeline;
    RHistor: TppReport;
    HBHistor: TppHeaderBand;
    DBDisc: TppDetailBand;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    FBHistor: TppFooterBand;
    SBHistor: TppSummaryBand;
    ppShape2: TppShape;
    LCidade2: TppLabel;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppGroup1: TppGroup;
    GHBHistor: TppGroupHeaderBand;
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
    ppLine54: TppLine;
    ppLine66: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    SRObs2: TppSubReport;
    ppChildReport6: TppChildReport;
    TBObs2: TppTitleBand;
    DBObs2: TppDetailBand;
    ppShape51: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppSummaryBand6: TppSummaryBand;
    SRObs: TppSubReport;
    ppChildReport1: TppChildReport;
    TBObs: TppTitleBand;
    DBObs: TppDetailBand;
    SObs: TppShape;
    LNomObs1: TppLabel;
    LNomObs2: TppLabel;
    LCodObs: TppLabel;
    LnObs1: TppLine;
    LnObs2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    SRCH: TppSubReport;
    ppChildReport7: TppChildReport;
    ppDetailBand1: TppDetailBand;
    ppShape14: TppShape;
    LCH: TppLabel;
    ppSummaryBand7: TppSummaryBand;
    SRObsCompl: TppSubReport;
    ppChildReport8: TppChildReport;
    TBObsCompl: TppTitleBand;
    DBObsCompl: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText6: TppDBText;
    SObsCompl: TppShape;
    LnObs4: TppLine;
    LnObs3: TppLine;
    LObsCompl: TppLabel;
    ppSummaryBand8: TppSummaryBand;
    ppLine58: TppLine;
    QRFichahis_disequ: TIntegerField;
    ppLine36: TppLine;
    LCabObs1: TppLabel;
    ppLine38: TppLine;
    ppLine37: TppLine;
    LCabObs2: TppLabel;
    ppLine39: TppLine;
    ppLine40: TppLine;
    LCabObs3: TppLabel;
    ppLine41: TppLine;
    LNomObs3: TppLabel;
    LNomObs4: TppLabel;
    SCab: TppShape;
    ppShape9: TppShape;
    ppShape7: TppShape;
    ppShape4: TppShape;
    LFac: TppLabel;
    LCurso: TppLabel;
    LHab: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    LRA: TppLabel;
    ppLabel7: TppLabel;
    LAluno: TppLabel;
    ppLabel38: TppLabel;
    ppLine60: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppShape33: TppShape;
    ppLabel39: TppLabel;
    LCurSup: TppLabel;
    SRegDiploma: TppShape;
    LRegDiploma: TppLabel;
    LRegDipl: TppLabel;
    SLivro: TppShape;
    LLivro: TppLabel;
    LNLivro: TppLabel;
    SFolha: TppShape;
    LFolha: TppLabel;
    LNFolha: TppLabel;
    ppShape37: TppShape;
    ppLabel43: TppLabel;
    LNProc: TppLabel;
    ppShape38: TppShape;
    ppLabel44: TppLabel;
    LDatReg: TppLabel;
    SLocalReg: TppShape;
    LLocalReg: TppLabel;
    LLocReg: TppLabel;
    ppLabel46: TppLabel;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppShape40: TppShape;
    ppLabel47: TppLabel;
    LDatVest: TppLabel;
    ppLine67: TppLine;
    ppShape44: TppShape;
    ppLabel49: TppLabel;
    LConclusao: TppLabel;
    ppShape45: TppShape;
    ppLabel52: TppLabel;
    LColGra: TppLabel;
    ppShape46: TppShape;
    LExpedicao: TppLabel;
    LExpDipl: TppLabel;
    ppShape47: TppShape;
    LNLivro2: TppLabel;
    ppLabel55: TppLabel;
    ppShape48: TppShape;
    LNFolha2: TppLabel;
    ppLabel57: TppLabel;
    ppShape52: TppShape;
    ppLabel53: TppLabel;
    ppShape49: TppShape;
    ppLabel58: TppLabel;
    LDatReg2: TppLabel;
    ppLine50: TppLine;
    ppLine61: TppLine;
    LPag: TppLabel;
    QRFicAux: TQuery;
    QRFichagra_regime: TSmallintField;
    QRFichahis_codobs: TSmallintField;
    ch: TStringField;
    QAdicionaadi_perlet: TIntegerField;
    QRFichagra_anoter: TStringField;
    QRFichadis_controle: TSmallintField;
    QAdicionaadi_perchar: TStringField;
    ppShape42: TppShape;
    LTpPonto: TppLabel;
    LPontos: TppLabel;
    ppShape43: TppShape;
    ppLabel51: TppLabel;
    LEntidade: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    QCHAtiv: TQuery;
    QGradLet: TQuery;
    QRFichacer_seq: TIntegerField;
    QRFicharfi_horas: TSmallintField;
    QRFichagra_nordem2: TSmallintField;
    QRFichadco_complemento: TStringField;
    nomdisc: TStringField;
    Label10: TLabel;
    DEExp: TDateEdit;
    QRFichadco_periodo: TStringField;
    QAdicionaadi_chreal: TFloatField;
    RGTipo: TRadioGroup;
    LFinal: TppLine;
    MDFicha: TRxMemoryData;
    MDFichaalu_ra: TFloatField;
    MDFichacer_seq: TIntegerField;
    MDFichadis_codigo: TIntegerField;
    MDFichahab_codigo: TSmallintField;
    MDFichach: TFloatField;
    MDFichachmask: TStringField;
    MDFichach2: TFloatField;
    MDFichaperlet: TStringField;
    MDFichasitfin: TStringField;
    MDFichamedfin: TStringField;
    MDFichaobs: TStringField;
    MDFichanomdisc: TStringField;
    DSFicha: TDataSource;
    ppDBText1: TppDBText;
    DBTNomDisc: TppDBText;
    DBTChMin: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    DBCTotAulas: TppDBCalc;
    ppShape16: TppShape;
    LDatNas: TppLabel;
    LLocNas: TppLabel;
    ppShape17: TppShape;
    ppLabel15: TppLabel;
    LNasc: TppLabel;
    ppShape19: TppShape;
    ppLabel14: TppLabel;
    LRG: TppLabel;
    ppShape10: TppShape;
    ppLabel8: TppLabel;
    LOrg: TppLabel;
    ppLabel11: TppLabel;
    ppShape12: TppShape;
    LEst: TppLabel;
    ppLabel10: TppLabel;
    ppShape11: TppShape;
    LCPF: TppLabel;
    ppLabel12: TppLabel;
    ppShape13: TppShape;
    ppLabel13: TppLabel;
    Q: TQuery;
    MDFichatermo: TStringField;
    QEquivalequ_nrodis: TSmallintField;
    QEquivalalu_ra: TFloatField;
    QEquivalhab_codigo: TSmallintField;
    QEquivaldis_codigo: TIntegerField;
    QEquivalequ_nomdis: TStringField;
    QEquivalequ_perlet: TIntegerField;
    QEquivalequ_cghora: TSmallintField;
    QEquivalequ_medfin: TStringField;
    QEquivalequ_pfreq: TStringField;
    QEquivalequ_codobs: TSmallintField;
    QEquivalequ_perchar: TStringField;
    QEquivalequ_cghreal: TFloatField;
    QEquivalfun_matr: TIntegerField;
    QEquivalequ_dtinserido: TDateTimeField;
    QEquivalhr: TFloatField;
    QRFichahis_anomat: TSmallintField;
    QRFichahis_serie: TSmallintField;
    QRFichahis_ncursado: TSmallintField;
    QRFichahis_regesp: TStringField;
    QRFichahis_obrigatorio: TStringField;
    QRFichahis_regime: TSmallintField;
    QRFichahis_user: TStringField;
    QRFichahis_dtinicio: TDateTimeField;
    QRFichahis_dtfim: TDateTimeField;
    QRFichahis_anomatreal: TSmallintField;
    QRFichagra_per: TStringField;
    QRFichagra_chhoras: TSmallintField;
    MDFichahoras: TFloatField;
    QRFichahis_converte: TStringField;
    DBCTotHoras: TppDBCalc;
    MDProf: TRxMemoryData;
    MDProfhis_anoref: TSmallintField;
    MDProfhis_semref: TSmallintField;
    MDProfdis_codigo: TIntegerField;
    MDProfdis_nomdisc: TStringField;
    MDProffun_matr: TIntegerField;
    MDProftit_codigo: TSmallintField;
    MDProfpes_nome: TStringField;
    MDProftit_descricao: TStringField;
    MDProfperiodo: TStringField;
    DSProf: TDataSource;
    ppDBPipeline3: TppDBPipeline;
    SRProf: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine18: TppLine;
    LCabProf: TppLabel;
    ppLine19: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText9: TppDBText;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine22: TppLine;
    QRFichahis_codtur: TStringField;
    QRFichalab_turma: TSmallintField;
    ppLabel9: TppLabel;
    LRA2: TppLabel;
    ppLabel16: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    MDFichachcursando: TFloatField;
    MDFichachacursar: TFloatField;
    MDFichahis_anoref: TSmallintField;
    MDFichahis_semref: TSmallintField;
    MDFichadst_codmestre: TIntegerField;
    MDFichahis_codtur: TStringField;
    MDFichalab_turma: TSmallintField;
    QRFichadst_codmestre: TIntegerField;
    QAux: TQuery;
    QGedArea: TQuery;
    QUsuDoc: TQuery;
    QDocComprob: TQuery;
    LEndereco: TppLabel;
    CBAtualiza: TCheckBox;
    ppShape53: TppShape;
    ppLine55: TppLine;
    LContinua: TppLabel;
    ppImage1: TppImage;
    LEndereco2: TppLabel;
    ppImage2: TppImage;
    LPagina: TppLabel;
    ppLine1: TppLine;
    procedure MERAEnter(Sender: TObject);
    procedure MERAExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBLocAluClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_finalizaClick(Sender: TObject);
    procedure b_okClick(Sender: TObject);
    procedure RGHistExit(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure HBHistorBeforePrint(Sender: TObject);
    procedure GHBHistorBeforePrint(Sender: TObject);
    procedure DBDiscBeforePrint(Sender: TObject);
    procedure DBObsBeforePrint(Sender: TObject);
    procedure DBObsAfterPrint(Sender: TObject);
    procedure DBObsComplBeforePrint(Sender: TObject);
    procedure GHBHistorAfterPrint(Sender: TObject);
    procedure RHistorBeforePrint(Sender: TObject);
    procedure RHistorStartSecondPass(Sender: TObject);
    procedure SBHistorBeforePrint(Sender: TObject);
    procedure TBObsAfterGenerate(Sender: TObject);
    procedure TBObs2AfterGenerate(Sender: TObject);
    procedure TBObsComplAfterGenerate(Sender: TObject);
    procedure QRFichaCalcFields(DataSet: TDataSet);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure FBHistorBeforePrint(Sender: TObject);
    procedure DEExpExit(Sender: TObject);
    procedure RGTipoExit(Sender: TObject);
    procedure QEquivalCalcFields(DataSet: TDataSet);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    NHab: Integer;
    vdia,vmes,vano,diafim,mesfim,vnota1,vnota2,ingresso,codobs:word;
    disp1,disp2,disp4,lancado,cursando1,cursando2,cursou99,cabobs,somou,imp_historico:boolean;
    totcarga,tothoras:real;
    Function  Imprime_Notas:String;
    Function  Soma_Disciplinas(Hab:Integer):Word;
    Function  Total_Paginas:Word;
    function InicializaPasta(Pasta : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

const
  C_PASTA_TEMPORARIA = 'C:\Sistemas\pdf_tmp';
//  C_USUARIO = 'UNOESTE\ged';
//  C_SENHA = 'GED&CPD';
//  TIPO_RECURSO = RESOURCETYPE_ANY;


var
  FRHisPs7: TFRHisPs7;

implementation

Uses UProcs, UConsAlu, Umenupri, URotinas;

{$R *.DFM}

{ *************************************************************************************************************************************************** }

function TFRHisPs7.InicializaPasta(Pasta : String) : Boolean;
begin
{    Result := True;
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
    end;}
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

Function TFRHisPs7.Imprime_Notas:String;
Begin
 Imprime_Notas:='';
 If (QRFicha['his_medbi1'] <> Null) and (QRFicha['his_medbi2'] = Null) and
    (QRFicha['his_medbi3'] = Null) and (QRFicha['his_medbi4'] = Null)
 Then
  Begin
   If vnota1 < 1
   Then vnota1:=1;
   Imprime_Notas:=FormatFloat('#0.0',QRFicha['his_medbi1']);
  End;
 If (QRFicha['his_medbi1'] = Null) and (QRFicha['his_medbi2'] <> Null) and
    (QRFicha['his_medbi3'] = Null) and (QRFicha['his_medbi4'] = Null)
 Then
  Begin
   If vnota1 < 2
   Then vnota1:=2;
   Imprime_Notas:='   /'+FormatFloat('#0.0',QRFicha['his_medbi2']);
  End;
 If (QRFicha['his_medbi1'] = Null) and (QRFicha['his_medbi2'] = Null) and
    (QRFicha['his_medbi3'] <> Null) and (QRFicha['his_medbi4'] = Null)
 Then
  Begin
   If vnota2 < 3
   Then vnota2:=3;
   Imprime_Notas:=FormatFloat('#0.0',QRFicha['his_medbi3']);
  End;
 If (QRFicha['his_medbi1'] = Null) and (QRFicha['his_medbi2'] = Null) and
    (QRFicha['his_medbi3'] = Null) and (QRFicha['his_medbi4'] <> Null)
 Then
  Begin
   If vnota2 < 4
   Then vnota2:=4;
   Imprime_Notas:='   /'+FormatFloat('#0.0',QRFicha['his_medbi4']);
  End;
 If (QRFicha['his_medbi1'] = Null) and (QRFicha['his_medbi2'] = Null) and
    (QRFicha['his_medbi3'] <> Null) and (QRFicha['his_medbi4'] <> Null)
 Then
  Begin
   If vnota2 < 4
   Then vnota2:=4;
   Imprime_Notas:=FormatFloat('#0.0',QRFicha['his_medbi3'])+'/'+FormatFloat('#0.0',QRFicha['his_medbi4']);
  End;
 If (QRFicha['his_medbi1'] <> Null) and (QRFicha['his_medbi2'] <> Null) and
    (QRFicha['his_medbi3'] = Null) and (QRFicha['his_medbi4'] = Null)
 Then
  Begin
   If vnota1 < 2
   Then vnota1:=2;
   Imprime_Notas:=FormatFloat('#0.0',QRFicha['his_medbi1'])+'/'+FormatFloat('#0.0',QRFicha['his_medbi2']);
  End;
 If (QRFicha['his_medbi1'] <> Null) and (QRFicha['his_medbi2'] <> Null) and
    (QRFicha['his_medbi3'] <> Null) and (QRFicha['his_medbi4'] = Null)
 Then
  Begin
   If vnota1 < 3
   Then vnota1:=3;
   Imprime_Notas:=FormatFloat('#0.0',QRFicha['his_medbi1'])+'/'+FormatFloat('#0.0',QRFicha['his_medbi2'])+'/'+
                  FormatFloat('#0.0',QRFicha['his_medbi3']);
  End;
 If (QRFicha['his_medbi1'] <> Null) and (QRFicha['his_medbi2'] <> Null) and
    (QRFicha['his_medbi3'] = Null) and (QRFicha['his_medbi4'] <> Null)
 Then
  Begin
   If vnota1 < 4
   Then vnota1:=4;
   Imprime_Notas:=FormatFloat('#0.0',QRFicha['his_medbi1'])+'/'+FormatFloat('#0.0',QRFicha['his_medbi2'])+'/   /'+
                  FormatFloat('#0.0',QRFicha['his_medbi4']);
  End;
 If (QRFicha['his_medbi1'] <> Null) and (QRFicha['his_medbi2'] <> Null) and
    (QRFicha['his_medbi3'] <> Null) and (QRFicha['his_medbi4'] <> Null)
 Then
  Begin
   If vnota1 < 4
   Then vnota1:=4;
   Imprime_Notas:=FormatFloat('#0.0',QRFicha['his_medbi1'])+'/'+FormatFloat('#0.0',QRFicha['his_medbi2'])+'/'+
                  FormatFloat('#0.0',QRFicha['his_medbi3'])+'/'+FormatFloat('#0.0',QRFicha['his_medbi4']);
  End;
End;

procedure TFRHisPs7.MERAEnter(Sender: TObject);
begin
  MERA.Clear;
  SBLocAlu.Visible:=True;
  LNomAlu.Caption:='';
  qconsalu.close;
//  Q.Close;
  B_Cancela.Enabled:=True;
  B_Ok.Enabled:=False;
  RGTipo.ItemIndex:=0;
  If DEExp.Date = 0
  Then DEExp.Date:=DataSis;
  If vexibe = 'S'
  Then
   Begin
     vitl_seq:=0;
     vhdg_seq:=0;
   End;
//  If vRA <> 0
//  Then MERA.Text:=FloatToStr(vRA);
end;

procedure TFRHisPs7.MERAExit(Sender: TObject);
begin
 If (not b_finaliza.focused)
 Then
  if MERA.text <> ''
  then
   begin
    MERA.Text:=Alinha_RA(MERA.Text);
    qconsalu.close;
    qconsalu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    qconsalu.open;
    if not qconsalu.eof
    then
     begin
      LNomAlu.Caption:=qconsalu['pes_nome'];
      sblocalu.visible:=false;
      QGedArea.Close;
      QGedArea.Sql.Clear;
      QGedArea.Sql.Add('select * from sca_gedarea ga, ged_areas a');
      QGedArea.Sql.Add('where ga.are_codigo = a.are_codigo and cur_grapos =:grapos and cur_area =:area and cur_gradistancia =:gradistancia and cam_codigo =:campus and gat_tipo = "D"');
      QGedArea.ParambyName('grapos').AsSmallInt:=QConsAlu['cur_grapos'];
      QGedArea.ParambyName('area').AsSmallInt:=QConsAlu['cur_area'];
      QGedArea.ParambyName('gradistancia').AsString:=QConsAlu['cur_gradistancia'];
      QGedArea.ParambyName('campus').AsSmallInt:=QConsAlu['cam_codigo'];
      QGedArea.Open;
      If QGedArea.Eof
      Then
       Begin
         imp_historico:=false;
         MessageDlg('Não existe area do diploma definida no GED. Histórico escolar não pode ser gerado em formato PDF.',mtError,[mbok],0);
         If vexibe = 'S'
         Then MERA.Setfocus;
       End
      Else
       Begin
         If (Valida_Usuario(qconsalu['cur_codigo'],0,0))
         Then
          Begin
           If qconsalu['cur_codigo'] <> 13
           Then
            Begin
             imp_historico:=false;
             messagedlg('Aluno não cursa Psicologia !!!',mtError,[mbok],0);
             If vexibe = 'S'
             Then MERA.Setfocus;
            End
           Else
            Begin
             Dados_Grade_Hab(qconsccl);
             qconsccl.parambyname('hab').assmallint:=1;
             qconsccl.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
             qconsccl.open;
             If (qconsccl['ahb_codgra'] >= 20) and (qconsccl['ahb_codgra'] <> 22) and (qconsccl['ahb_codgra'] <> 23)
             Then RGHist.ItemIndex:=2; // Formação de Psicólogo
             If vexibe = 'S'
             Then RGHist.SetFocus;
            End;
          End
         Else
          Begin
           imp_historico:=false;
           MessageDlg('Usuário não tem permissão de emitir histórico escolar deste aluno!',mtError,[mbOk],0);
           LNomAlu.Caption:='';
           If vexibe = 'S'
           Then MERA.Setfocus;
          End;
       End;
     end
    else
     Begin
      imp_historico:=false;
      messagedlg('Registro Acadêmico Inválido !!!',mtError,[mbok],0);
      If vexibe = 'S'
      Then MERA.Setfocus;
     End;
   end
  Else
   If vexibe = 'S'
   Then MERA.Setfocus;
end;

procedure TFRHisPs7.FormActivate(Sender: TObject);
begin
//LRecredenciamento.Caption:=vRecredenciamento;
  If vexibe = 'S'
  Then MERA.SetFocus;
end;

procedure TFRHisPs7.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;  
end;

procedure TFRHisPs7.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TFRHisPs7.SBLocAluClick(Sender: TObject);
begin
 Application.CreateForm(TFConsAlu, FConsAlu);
 FConsAlu.Hide;
 FConsAlu.ShowModal;
 If VRAcad <> 0
 Then
  Begin
   MERA.text:=FloatToStr(VRAcad);
   Panel1.SetFocus;
  End;
 FConsAlu.Free;
end;

procedure TFRHisPs7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRFicha.Close;
  QDadAlu.Close;
  qconsalu.close;
  QNacional.Close;
  SPFicha.Close;
  qconsccl.close;
  QLocalidade.Close;
  QCurSup.Close;
  QEquival.Close;
  QObserv.Close;
  QConsEq.Close;
  QObsCompl.Close;
  QGradLet.Close;
  QCHAtiv.Close;
//  Muda_Impressora('HPA4');
end;

procedure TFRHisPs7.FormCreate(Sender: TObject);
begin
    imp_historico:=true;
    CBAtualiza.Checked:=vGed = 'S';
    { Gerando pasta temporária }
    if not InicializaPasta(C_PASTA_TEMPORARIA)
       then begin
                MessageDlg('Não foi possível gerar a pasta temporária. Verifique as permissões de gravação!',mtInformation,[mbOk],0);
                PostMessage(self.handle,wm_close,0,0);
                Exit;
            end;

//LRecredenciamento.Caption:=vRecredenciamento;
  RGHist.ItemIndex:=0;
  RGTpHist.ItemIndex:=0;
  If vexibe = 'N'
  Then
   Begin
     MERAEnter(Sender);
     MERA.Text:=FloatToStr(vRA);
     MERAExit(Sender);
     RGHist.ItemIndex:=vhab - 1;
     RGHistExit(Sender);
     b_okClick(Sender);
   End;
end;

Function TFRHisPs7.Soma_Disciplinas(Hab:Integer):Word;
var ndisc1:word;
Begin
 ndisc1:=0;
 While not QRFicha.Eof do
 Begin
  If Valida_Disc(QRFicha['dis_codigo'],Hab,qconsccl['ahb_codgra'])
  Then
   Begin
    If (QRFicha['his_codlan'] = 1) or (QRFicha['his_codlan'] = 5) or (QRFicha['his_codlan'] = 11)
    Then ndisc1:=ndisc1 + 1
    Else
     If (QRFicha['his_codlan'] = 2) or (QRFicha['his_codlan'] = 3)
     Then
      Begin
       QEquival.Close;
       QEquival.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
       QEquival.ParamByName('codhab').assmallint:=1;
       If QRFicha['his_disequ'] = Null
       Then QEquival.ParamByName('coddis').asinteger:=QRFicha['dis_codigo']
       Else QEquival.ParamByName('coddis').asinteger:=QRFicha['his_disequ'];
       QEquival.Open;
       If not QEquival.Eof
       Then
        Begin
         QEquival.First;
         While not QEquival.Eof do
         Begin
          ndisc1:=ndisc1 + 1;
          QEquival.Next;
         End;
        End;
      End
     Else
      If (QRFicha['his_codlan'] = 4) or (QRFicha['his_codlan'] = 6)
      Then ndisc1:=ndisc1 + 1;
   End;
  QRFicha.Next;
 End;
 SPACur1.Close;
 SPACur1.Params[0].AsFloat:=StrToFloat(Trim(MERA.Text));
 SPACur1.Params[1].AsSmallInt:=1;
 SPACur1.Open;
 If not SPACur1.Eof
 Then
  Begin
   SPACur1.First;
   While not SPACur1.Eof do
   Begin
    If Valida_Disc(SPACur1coddis.value,Hab,qconsccl['ahb_codgra'])
    Then ndisc1:=ndisc1 + 1;
    SPACur1.Next;
   End;
  End;
 QAdiciona.Close;
 QAdiciona.Sql.Clear;
 QAdiciona.Sql.Add('Select * from sca_adicionais');
 QAdiciona.Sql.Add('where alu_ra =:ra and hab_codigo =:codhab');
 QAdiciona.Sql.Add('order by adi_nro');
 QAdiciona.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 QAdiciona.ParamByName('codhab').assmallint:=1;
 QAdiciona.Open;
 If not QAdiciona.Eof
 Then
  Begin
   QAdiciona.First;
   While not QAdiciona.Eof do
   Begin
    ndisc1:=ndisc1 + 1;
    QAdiciona.Next;
   End;
  End;
 Soma_Disciplinas:=ndisc1;
End;

Function TFRHisPs7.Total_Paginas:Word;
var ndisc,npag:word;
Begin
 ndisc:=0;
 QRFicha.First;
 ndisc:=Soma_Disciplinas(NHab);
 npag:=ndisc div 50;
 If (ndisc mod 50) <> 0
 Then npag:=npag + 1;
 Total_Paginas:=npag;
End;

procedure TFRHisPs7.b_finalizaClick(Sender: TObject);
begin
  Close;
end;

procedure TFRHisPs7.b_okClick(Sender: TObject);
var i,tot: word;
    bacharelado, licenciatura, formacao:boolean;
    grava, assinado:boolean;
    ListaDePastas, Assinaturas:TObjectList;
    pasta:PastaViewModel;
    pastaEDocumentos, retorno:PastaEDocumentosViewModel;
    documento, docaux:DocumentosViewModel;
    pastaNova:PastaViewModel;
    arquivoBytes:TArrayByte;
    imagem:ImagensViewModel;
    docbase64:AnsiString;
    doc_codigo, status:integer;
    docAssinaturas:DocAssinaturasViewModel;
    nomearquivo:string;
begin
 DBTNomDisc.Font.Size:=vtamfontdisc;
 If (vexibe = 'S') or ((vexibe <> 'S') and (imp_historico))
 Then
  Begin
    grava:=false;
    LCabProf.Caption:=vcabprof;
    B_Cancela.Enabled:=False;
    B_Ok.Enabled:=False;
    If vexibe = 'S'
    Then Panel2.SetFocus;
    FRHisPs7.Enabled:=False;
    LEndereco.Font.Color := RGB(0, 107, 52);
    LEndereco2.Font.Color := RGB(0, 107, 52);
    If Libera_Historico(StrToFloat(Trim(MERA.Text)), 1)
    Then
     Begin
       If qconsalu['cam_codigo'] = 1 // Presidente Prudente
       Then
        Begin
          LEndereco.TextAlignment:=taCentered;
          LEndereco.Caption:=EnderecoPrudente;
          LEndereco2.TextAlignment:=taCentered;
          LEndereco2.Caption:=EnderecoPrudente;
        End
       Else
       If qconsalu['cam_codigo'] = 7 // Jaú
       Then
        Begin
          LEndereco.TextAlignment:=taRightJustified;
          LEndereco.Caption:=EnderecoJau;
          LEndereco2.TextAlignment:=taRightJustified;
          LEndereco2.Caption:=EnderecoJau;
        End
       Else
        If qconsalu['cam_codigo'] = 8 // Guarujá
        Then
         Begin
           LEndereco.TextAlignment:=taRightJustified;
           LEndereco.Caption:=EnderecoGuaruja;
           LEndereco2.TextAlignment:=taRightJustified;
           LEndereco2.Caption:=EnderecoGuaruja;
         End;

       Try
         Menuprin.Database1.StartTransaction;
         Dados_Registro(QDadAlu);
         QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         QDadAlu.ParamByName('hab').AsSmallInt:=1;
         QDadAlu.Open;
         If QDadAlu.Eof
         Then
          Begin
            Dados_Aluno(QDadAlu);
            QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
            QDadAlu.Open;
          End;
         Dados_Grade_Hab(qconsccl);
         qconsccl.parambyname('hab').assmallint:=1;
         qconsccl.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         qconsccl.open;
         SPFicha.Close;
         SPFicha.Params[0].AsFloat:=StrToFloat(Trim(MERA.Text));
         SPFicha.Params[1].AsSmallInt:=1;
         If RGTipo.ItemIndex = 0  // Normal
         Then SPFicha.Params[2].AsString:='*'
         Else SPFicha.Params[2].AsString:='R';
         SPFicha.ExecProc;
         SPFicha.Close;
         QRFicha.Close;
         QRFicha.Sql.Clear;
         QRFicha.Sql.Add('Select * from sca_rficha');
         QRFicha.Sql.Add('where alu_ra =:ra and');
         QRFicha.Sql.Add('his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10');
         QRFicha.Sql.Add('order by gra_nordem,his_sequencia');
         QRFicha.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         QRFicha.Open;

         //Carrega_Professores_Historico(StrToFloat(Trim(MERA.Text)),0,MDProf);

         QConsHab.Close;
         QConsHab.Sql.Clear;
         QConsHab.Sql.Add('select * from sca_habilitacao');
         QConsHab.Sql.Add('where hab_codigo = 1');
         QConsHab.Open;
         Total_Atividades(true,QDadAlu,QConsHab,qconsccl,qconsccl2,QGradLet);
       //  RHistor.Language:=lgPortugueseBrazil;
         QAdiciona.Close;
         QAdiciona.Sql.Clear;
         QAdiciona.Sql.Add('Select * from sca_adicionais');
         QAdiciona.Sql.Add('where alu_ra =:ra and hab_codigo =:codhab');
         QAdiciona.Sql.Add('order by adi_nro');
         QAdiciona.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         QAdiciona.ParamByName('codhab').assmallint:=1;
         QAdiciona.Open;
         If RGHist.ItemIndex < 3
         Then
          Begin
            NHab:=RGHist.ItemIndex + 1;
            Dados_Registro(QDadAlu);
            QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
            QDadAlu.ParamByName('hab').AsSmallInt:=NHab;
            QDadAlu.Open;
            If QDadAlu.Eof
            Then
             Begin
               Dados_Aluno(QDadAlu);
               QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
               QDadAlu.Open;
             End;
            Dados_Grade_Hab(qconsccl2);
            qconsccl2.parambyname('hab').assmallint:=NHab;
            qconsccl2.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
            qconsccl2.open;
            If (qconsccl2['ahb_conclusao'] <> Null) and (not Libera_Diploma(StrToFloat(Trim(MERA.Text)), 1))
            Then MessageDlg('Aluno tem data de conclusão e situação irregular no Enade. Emissão de histórico não pode ser efetuada!',mtError,[mbOk],0)
            Else
             Begin
               totcarga:=0;
               tothoras:=0;
               disp1:=false;
               disp2:=false;
               disp4:=false;
               codobs:=0;
               lancado:=false;
               cursando1:=false;cursando2:=false;
               vnota1:=0;vnota2:=0;
               cursou99:=false;
               FBHistor.Height:=0.26;
//             LContinua2.Top:=0.0625;

               Carrega_Historico_Psicologia(QRFicha, QDadAlu, QConsHab, QGradLet, qconsccl2, QCHAtiv, QEquival, QAdiciona, MDFicha, cursando1, cursando2, lancado, disp1, disp2, disp4, cursou99, codobs, vnota1, vnota2, NHab, false);
               Carrega_Professores_Historico_Psicologia(StrToFloat(Trim(MERA.Text)),0,NHab,qconsccl2['ahb_codgra'],MDProf);

               If CBAtualiza.Checked // vGED = 'S'
               Then
                Begin
                  ListadePastas:=RetornarPastasPorConteudoDoCampo(QGedArea['are_codigo'],13,QConsAlu['alu_ra']);
                  if ListadePastas = nil then
                  begin
                    pastaNova:=CriarNovaPasta(QGedArea['are_codigo'],vcodusu,QConsAlu,qconsccl);
                    ListadePastas:=TObjectList.Create();
                    ListadePastas.Add(pastaNova);
                  end;

                  QAux.Close;
                  QAux.Sql.Clear;
                  QAux.Sql.Add('select * from sca_aludoccomprob');
                  QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and dcp_seq = 4');
                  QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                  QAux.ParamByName('hab').AsSmallInt:=NHab;
                  QAux.Open;
                  assinado:=false;
                  doc_codigo:=0;
                  status:=0;
                  if not QAux.Eof then // verificar se o documento já foi assinado
                  begin
                    doc_codigo:=QAux['doc_codigo'];
                    Assinaturas:=TObjectList.Create;
                    Assinaturas:=ObterTodasPorDocumento(QAux['doc_codigo']);
                    if (Assinaturas <> nil) and (Assinaturas.Count <> 0) then
                    begin
                      for i:=0 to Assinaturas.Count-1 do
                      begin
                        docAssinaturas:=DocAssinaturasViewModel(Assinaturas.Items[i]);
                        if (docAssinaturas.ass_status = 3) then // assinado
                           assinado:=true
                        else
                         if (docAssinaturas.ass_status = 4) or (docAssinaturas.ass_status = 6) then // rejeitado ou cancelado
                            assinado:=false;
                        status:=docAssinaturas.ass_status;
                      end;
                    end;

                    Assinaturas.Free;
                  end
                  else // verificar se o documento já existe
                  begin
                     docaux:=DocumentosViewModel.Create();
                     docaux:=BuscarDocumentoPorNome(PastaViewModel(ListadePastas.Items[0]).pst_codigo,'HISTORICO_' + IntToStr(vhab),'PDF');
                     if docaux <> nil then
                        doc_codigo:=docaux.doc_codigo;
                     docaux.free;
                  end;

                  If (status <> 0) and (status <> 4) and (status <> 6) // documento não foi gerado ou não teve assinatura rejeitada ou cancelada
                  Then
                   Begin
                     If MenuPrin.Database1.Intransaction
                     Then MenuPrin.Database1.Rollback;
                     if status = 3 then
                        MessageDlg('Histórico Escolar já foi totalmente assinado. Não pode ser gerado novamente!',mtError,[mbok],0)
                     else MessageDlg('Histórico Escolar já foi gerado. Para gerá-lo novamente, uma assinatura deverá ser cancelada ou rejeitada!',mtError,[mbok],0);
                   End
                  Else
                   Begin
                     RHistor.AllowPrintToFile := True;
                     RHistor.ShowPrintDialog := False;
                     RHistor.ShowCancelDialog := False;
                     RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF';
                     RHistor.DeviceType := 'PDFA';
                     RHistor.Print;

                     pastaEDocumentos:=PastaEDocumentosViewModel.Create();
                     pastaEDocumentos.Pasta:=PastaViewModel(ListadePastas.Items[0]);
                     documento:=DocumentosViewModel.Create();
                     documento.doc_codigo:=doc_codigo; // NULLToZero(QAux['doc_codigo']);
                     documento.fun_matr:=vcodusu;
                     documento.pst_codigo:=pastaeDocumentos.Pasta.pst_codigo;
                     documento.doc_nivelprocesso:='I';
                     documento.doc_dataarm:=DelphiDateTimeToISO8601Date(Pega_DataHora);
                     documento.doc_extarq :='PDF';
                     documento.tdo_seq:=74;
                     documento.aut_seq:=1;
                     documento.loc_seq:=1; // Campus I
                     documento.doc_assunto:=QGedArea['are_descr'];
                     documento.doc_nomearquivo:='HISTORICO_' + IntToStr(vhab) + '.PDF';
                     documento.doc_titulo:='HISTORICO_' + IntToStr(vhab);
                     documento.doc_arquivo:=vPastaServidor + IntToStr(pastaEDocumentos.Pasta.are_codigo) + '\' + IntToStr(pastaEDocumentos.Pasta.pst_codigo) + '\pdf\HISTORICO_' + IntToStr(vhab) + '.PDF';
                     documento.doc_ativo:='S';
                     documento.doc_usanodiploma:='S';
                     imagem:=ImagensViewModel.Create();
                     docbase64:=EncodeFile(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF');
                     imagem.doc_imagemstr:=docbase64;
                     FileToBytes(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF', arquivoBytes);
                     documento.doc_tamanho:= Length(arquivoBytes);
                     imagem.doc_imagem:=arquivoBytes;

                     documento.imagens:=imagem;

                     if (status = 0) or (status = 4) or (status = 6) then // se não tiver fluxo ou rejeitado ou cancelado
                     Begin
                       QUsuDoc.Close;
                       QUsuDoc.Sql.Clear;
                       QUsuDoc.Sql.Add('select * from sca_usudoccomprob u, drh_funcionarios f, ged_certificados c, crp_tipousuario tu, crp_usuarios usr');
                       QUsuDoc.Sql.Add('where u.fun_matr = f.fun_matr and u.cer_id = c.cer_id and u.tpu_seq = tu.tpu_seq and to_char(u.fun_matr) = usr.usr_login and');
                       QUsuDoc.Sql.Add('      u.dcp_seq = 4 order by usd_ordem');
                       QUsuDoc.Open;
                       if not QUsuDoc.Eof then
                       Begin
                         while not QUsuDoc.Eof do
                         Begin
                           docAssinaturas:=DocAssinaturasViewModel.Create();
                           docAssinaturas.ass_data:=DelphiDateTimeToISO8601Date(Pega_DataHora);
                           DocAssinaturas.ass_ordem:=QUsuDoc['usd_ordem'];
                           DocAssinaturas.ass_fluxocompart:=QUsuDoc['usd_compartilhado'];
                           DocAssinaturas.ass_fluxonivel:=QUsuDoc['usd_nivel'];
                           if (QUsuDoc['usd_nivel'] = 1)
                           then
                            begin
                              if (QUsuDoc['usd_ordem'] = 1) or (QUsuDoc['usd_compartilhado'] = 'S')
                              then DocAssinaturas.ass_status:=2
                              else DocAssinaturas.ass_status:=1;
                            end
                           else DocAssinaturas.ass_status:=1;
                           DocAssinaturas.cer_id:=QUsuDoc['cer_id'];
                           DocAssinaturas.doc_codigo:=documento.doc_codigo;
                           DocAssinaturas.tpu_seq:=QUsuDoc['tpu_seq'];
                           DocAssinaturas.usr_id:=QUsuDoc['usr_id'];
                           documento.assinaturas.Add(DocAssinaturas);
                           QUsuDoc.Next;
                         End;
                       End;
                     End;

                     pastaEDocumentos.Documentos.Add(documento);

                     retorno:=Atualizar_Documentos_Fluxo_Pasta_PastaValCampo(pastaEDocumentos);

                     if QAux.Eof then
                     begin
                       QDocComprob.Close;
                       QDocComprob.Sql.Clear;
                       QDocComprob.Sql.Add('select * from sca_aludoccomprob');
                       QDocComprob.Sql.Add('where alu_ra = 0 and hab_codigo = 0');
                       QDocComprob.Open;
                       QDocComprob.Append;
                       QDocComprob['alu_ra']:=StrToFloat(Trim(MERA.Text));
                       QDocComprob['hab_codigo']:=NHab;
                       QDocComprob['dcp_seq']:=4;

                       if doc_codigo <> 0 then
                          QDocComprob['doc_codigo']:=doc_codigo
                       else
                       begin
                         documento:=BuscarDocumentoPorNome(retorno.Pasta.pst_codigo,'HISTORICO_' + IntToStr(vhab),'PDF');
                         QDocComprob['doc_codigo']:=documento.doc_codigo;
                       end;
                       QDocComprob['fun_matr']:=vcodusu;
                       QDocComprob['acp_dtinsercao']:=Pega_DataHora();
                       QDocComprob['acp_dtemissao']:=DEExp.Date;
                       QDocComprob.Post;
                     end
                     else
                     begin
                       QDocComprob.Close;
                       QDocComprob.Sql.Clear;
                       QDocComprob.Sql.Add('select * from sca_aludoccomprob');
                       QDocComprob.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and dcp_seq = 4');
                       QDocComprob.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                       QDocComprob.ParamByName('hab').AsSmallInt:=NHab;
                       QDocComprob.Open;
                       QDocComprob.Edit;
                       QDocComprob['acp_dtinsercao']:=Pega_DataHora();
                       QDocComprob['acp_dtemissao']:=DEExp.Date;
                       QDocComprob.Post;
                     end;

                     QAux.Close;
                     QAux.Sql.Clear;
                     QAux.Sql.Add('update sca_registrodoc set doc_codigo =:doc');
                     If vitl_seq = 0
                     Then
                      Begin
                        QAux.Sql.Add('where itl_seq = (select itl_seq from sca_itenslivdip where alu_ra =:ra and hab_codigo =:hab and srd_codigo <> 2) and');
                        QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                        QAux.ParamByName('hab').AsSmallInt:=NHab;
                      End
                     Else
                      Begin
                        QAux.Sql.Add('where itl_seq =:seq and');
                        QAux.ParamByName('seq').AsInteger:=vitl_seq;
                      End;
                     QAux.Sql.Add('      dcp_seq = 4 and doc_codigo is null');
                     QAux.ParamByName('doc').AsInteger:=documento.doc_codigo;
                     QAux.ExecSQL;

                     pastaEDocumentos.Free;
                     retorno.Free;
                     documento.Free;

                     // Abrindo com a tela minimizada
                     OpenPDF(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF', SW_MINIMIZE);
                     grava:=true;
                   End;
                End
               Else
                Begin
                  RHistor.AllowPrintToFile := True;
                  RHistor.ShowPrintDialog := False;
                  RHistor.ShowCancelDialog := False;
                  RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF';
                  RHistor.DeviceType := 'PDFA';
                  RHistor.Print;

                  // Abrindo com a tela maximizada
                  OpenPDF(C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF', SW_MAXIMIZE);
                End;
             End;
          End
         Else
          Begin
            bacharelado:=false;
            licenciatura:=false;
            formacao:=false;
            NHab:=1;
            Dados_Grade_Hab(qconsccl2);
            qconsccl2.parambyname('hab').assmallint:=NHab;
            qconsccl2.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
            qconsccl2.open;
            If (qconsccl2['ahb_conclusao'] = Null) or ((qconsccl2['ahb_conclusao'] <> Null) and (Libera_Diploma(StrToFloat(Trim(MERA.Text)), 1)))
            Then
             Begin
               QRFicha.First;
               totcarga:=0;
               tothoras:=0;
               disp1:=false;
               disp2:=false;
               disp4:=false;
               codobs:=0;
               lancado:=false;
               cursando1:=false;cursando2:=false;
               vnota1:=0;vnota2:=0;
               cursou99:=false;
               FBHistor.Height:=0.26;
//               LContinua2.Top:=0.0625;

               Carrega_Historico_Psicologia(QRFicha, QDadAlu, QConsHab, QGradLet, qconsccl2, QCHAtiv, QEquival, QAdiciona, MDFicha, cursando1, cursando2, lancado, disp1, disp2, disp4, cursou99, codobs, vnota1, vnota2, NHab, false);
               Carrega_Professores_Historico_Psicologia(StrToFloat(Trim(MERA.Text)),0,NHab,qconsccl2['ahb_codgra'],MDProf);

               RHistor.AllowPrintToFile := True;
               RHistor.ShowPrintDialog := False;
               RHistor.ShowCancelDialog := False;
               If CBAtualiza.Checked // vGED = 'S'
               Then RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICO1_'+Trim(MERA.Text)+'.PDF'
               Else RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICOTEMP1_'+Trim(MERA.Text)+'.PDF';
               RHistor.DeviceType := 'PDFA';
               RHistor.Print;
               bacharelado:=true;
             End;
            If (qconsccl['ahb_codgra'] < 16)
            Then
             Begin
               NHab:=2;
               Dados_Registro(QDadAlu);
               QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
               QDadAlu.ParamByName('hab').AsSmallInt:=NHab;
               QDadAlu.Open;
               If QDadAlu.Eof
               Then
                Begin
                  Dados_Aluno(QDadAlu);
                  QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                  QDadAlu.Open;
                End;
               Dados_Grade_Hab(qconsccl2);
               qconsccl2.parambyname('hab').assmallint:=NHab;
               qconsccl2.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
               qconsccl2.open;
               If (qconsccl2['ahb_conclusao'] = Null) or ((qconsccl2['ahb_conclusao'] <> Null) and (Libera_Diploma(StrToFloat(Trim(MERA.Text)), 1)))
               Then
                Begin
              //    RHistor.ShowPrintDialog:=False;
                  QRFicha.First;
                  totcarga:=0;
                  tothoras:=0;
                  disp1:=false;
                  disp2:=false;
                  disp4:=false;
                  codobs:=0;
                  lancado:=false;
                  cursando1:=false;cursando2:=false;
                  vnota1:=0;vnota2:=0;
                  cursou99:=false;
                  FBHistor.Height:=0.26;
//                  LContinua2.Top:=0.0625;

                  Carrega_Historico_Psicologia(QRFicha, QDadAlu, QConsHab, QGradLet, qconsccl2, QCHAtiv, QEquival, QAdiciona, MDFicha, cursando1, cursando2, lancado, disp1, disp2, disp4, cursou99, codobs, vnota1, vnota2, NHab, false);
                  Carrega_Professores_Historico_Psicologia(StrToFloat(Trim(MERA.Text)),0,NHab,qconsccl2['ahb_codgra'],MDProf);

                  RHistor.AllowPrintToFile := True;
                  RHistor.ShowPrintDialog := False;
                  RHistor.ShowCancelDialog := False;
                  If CBAtualiza.Checked // vGED = 'S'
                  Then RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICO2_'+Trim(MERA.Text)+'.PDF'
                  Else RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICOTEMP2_'+Trim(MERA.Text)+'.PDF';
                  RHistor.DeviceType := 'PDFA';
                  RHistor.Print;
                  licenciatura:=true;
                End;
             End;
            If RGHist.ItemIndex = 4 {Todos os Históricos}
            Then
             Begin
               NHab:=3;
               Dados_Registro(QDadAlu);
               QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
               QDadAlu.ParamByName('hab').AsSmallInt:=NHab;
               QDadAlu.Open;
               If QDadAlu.Eof
               Then
                Begin
                  Dados_Aluno(QDadAlu);
                  QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                  QDadAlu.Open;
                End;
               Dados_Grade_Hab(qconsccl2);
               qconsccl2.parambyname('hab').assmallint:=NHab;
               qconsccl2.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
               qconsccl2.open;
               If (qconsccl2['ahb_conclusao'] = Null) or ((qconsccl2['ahb_conclusao'] <> Null) and (Libera_Diploma(StrToFloat(Trim(MERA.Text)), 1)))
               Then
                Begin
                  QRFicha.First;
                  totcarga:=0;
                  tothoras:=0;
                  disp1:=false;
                  disp2:=false;
                  disp4:=false;
                  codobs:=0;
                  lancado:=false;
                  cursando1:=false;cursando2:=false;
                  vnota1:=0;vnota2:=0;
                  cursou99:=false;
                  FBHistor.Height:=0.26;
//                  LContinua2.Top:=0.0625;

                  Carrega_Historico_Psicologia(QRFicha, QDadAlu, QConsHab, QGradLet, qconsccl2, QCHAtiv, QEquival, QAdiciona, MDFicha, cursando1, cursando2, lancado, disp1, disp2, disp4, cursou99, codobs, vnota1, vnota2, NHab, false);
                  Carrega_Professores_Historico_Psicologia(StrToFloat(Trim(MERA.Text)),0,NHab,qconsccl2['ahb_codgra'],MDProf);

                  RHistor.AllowPrintToFile := True;
                  RHistor.ShowPrintDialog := False;
                  RHistor.ShowCancelDialog := False;
                  If CBAtualiza.Checked // vGED = 'S'
                  Then RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICO3_'+Trim(MERA.Text)+'.PDF'
                  Else RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICOTEMP3_'+Trim(MERA.Text)+'.PDF';
                  RHistor.DeviceType := 'PDFA';
                  RHistor.Print;
                  formacao:=true;
                End;
             End;
            If (bacharelado) and (not licenciatura) and (not formacao)
            Then
             Begin
               If CBAtualiza.Checked // vGED = 'S'
               Then
                Begin
                  nomearquivo:='HISTORICO_1';
                  CopyFile(PChar(C_PASTA_TEMPORARIA+'\HISTORICO1_'+Trim(MERA.Text)+'.PDF'), PChar(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF'), false);
                End
               Else
                Begin
                  nomearquivo:='HISTORICOTEMP_1';
                  CopyFile(PChar(C_PASTA_TEMPORARIA+'\HISTORICOTEMP1_'+Trim(MERA.Text)+'.PDF'), PChar(C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF'), false);
                End;
             End
            Else
             If (bacharelado) and (licenciatura) and (not formacao)
             Then
              Begin
                If CBAtualiza.Checked // vGED = 'S'
                Then
                 Begin
                   nomearquivo:='HISTORICO_12';
                   JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICO_'+Trim(MERA.Text)+'.PDF', ['HISTORICO1_'+Trim(MERA.Text)+'.PDF', 'HISTORICO2_'+Trim(MERA.Text)+'.PDF']);
                 End
                Else
                 Begin
                   nomearquivo:='HISTORICOTEMP_12';
                   JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF', ['HISTORICOTEMP1_'+Trim(MERA.Text)+'.PDF', 'HISTORICOTEMP2_'+Trim(MERA.Text)+'.PDF']);
                 End;
              End
             Else
              If (bacharelado) and (not licenciatura) and (formacao)
              Then
               Begin
                 If CBAtualiza.Checked // vGED = 'S'
                 Then
                  Begin
                    nomearquivo:='HISTORICO_13';
                    JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICO_'+Trim(MERA.Text)+'.PDF', ['HISTORICO1_'+Trim(MERA.Text)+'.PDF', 'HISTORICO3_'+Trim(MERA.Text)+'.PDF']);
                  End
                 Else
                  Begin
                    nomearquivo:='HISTORICOTEMP_13';
                    JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF', ['HISTORICOTEMP1_'+Trim(MERA.Text)+'.PDF', 'HISTORICOTEMP3_'+Trim(MERA.Text)+'.PDF']);
                  End;
               End
              Else
               If (not bacharelado) and (licenciatura) and (not formacao)
               Then
                Begin
                  If CBAtualiza.Checked // vGED = 'S'
                  Then
                   Begin
                     nomearquivo:='HISTORICO_2';
                     CopyFile(PChar(C_PASTA_TEMPORARIA+'\HISTORICO2_'+Trim(MERA.Text)+'.PDF'), PChar(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF'), false);
                   End
                  Else
                   Begin
                     nomearquivo:='HISTORICOTEMP_2';
                     CopyFile(PChar(C_PASTA_TEMPORARIA+'\HISTORICOTEMP2_'+Trim(MERA.Text)+'.PDF'), PChar(C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF'), false);
                   End;
                End
               Else
                If (not bacharelado) and (licenciatura) and (formacao)
                Then
                 Begin
                   If CBAtualiza.Checked // vGED = 'S'
                   Then
                    Begin
                      nomearquivo:='HISTORICO_23';
                      JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICO_'+Trim(MERA.Text)+'.PDF', ['HISTORICO2_'+Trim(MERA.Text)+'.PDF', 'HISTORICO3_'+Trim(MERA.Text)+'.PDF']);
                    End
                   Else
                    Begin
                      nomearquivo:='HISTORICOTEMP_23';
                      JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF', ['HISTORICOTEMP2_'+Trim(MERA.Text)+'.PDF', 'HISTORICOTEMP3_'+Trim(MERA.Text)+'.PDF']);
                    End;
                 End
                Else
                 If (not bacharelado) and (not licenciatura) and (formacao)
                 Then
                  Begin
                    If CBAtualiza.Checked // vGED = 'S'
                    Then
                     Begin
                       nomearquivo:='HISTORICO_3';
                       CopyFile(PChar(C_PASTA_TEMPORARIA+'\HISTORICO3_'+Trim(MERA.Text)+'.PDF'), PChar(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF'), false)
                     End
                    Else
                     Begin
                       nomearquivo:='HISTORICOTEMP_3';
                       CopyFile(PChar(C_PASTA_TEMPORARIA+'\HISTORICOTEMP3_'+Trim(MERA.Text)+'.PDF'), PChar(C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF'), false)
                     End;
                  End
                 Else
                  If (bacharelado) and (licenciatura) and (formacao)
                  Then
                   Begin
                     If CBAtualiza.Checked // vGED = 'S'
                     Then
                      Begin
                        nomearquivo:='HISTORICO_123';
                        JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICO_'+Trim(MERA.Text)+'.PDF', ['HISTORICO1_'+Trim(MERA.Text)+'.PDF', 'HISTORICO2_'+Trim(MERA.Text)+'.PDF', 'HISTORICO3_'+Trim(MERA.Text)+'.PDF']);
                      End
                     Else
                      Begin
                        nomearquivo:='HISTORICOTEMP_123';
                        JuntaPdfs(C_PASTA_TEMPORARIA+'\', 'HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF', ['HISTORICOTEMP1_'+Trim(MERA.Text)+'.PDF', 'HISTORICOTEMP2_'+Trim(MERA.Text)+'.PDF', 'HISTORICOTEMP3_'+Trim(MERA.Text)+'.PDF']);
                      End;
                   End;

            If CBAtualiza.Checked // vGED = 'S'
            Then
             Begin
               ListadePastas:=RetornarPastasPorConteudoDoCampo(QGedArea['are_codigo'],13,QConsAlu['alu_ra']);
               if ListadePastas = nil then
               begin
                 pastaNova:=CriarNovaPasta(QGedArea['are_codigo'],vcodusu,QConsAlu,qconsccl);
                 ListadePastas:=TObjectList.Create();
                 ListadePastas.Add(pastaNova);
               end;

               QAux.Close;
               QAux.Sql.Clear;
               QAux.Sql.Add('select * from sca_aludoccomprob');
               QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and dcp_seq = 4');
               QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
               QAux.ParamByName('hab').AsSmallInt:=NHab;
               QAux.Open;
               assinado:=false;
               doc_codigo:=0;
               status:=0;
               if not QAux.Eof then // verificar se o documento já foi assinado
               begin
                 doc_codigo:=QAux['doc_codigo'];
                 Assinaturas:=TObjectList.Create;
                 Assinaturas:=ObterTodasPorDocumento(QAux['doc_codigo']);
                 if (Assinaturas <> nil) and (Assinaturas.Count <> 0) then
                 begin
                   for i:=0 to Assinaturas.Count-1 do
                   begin
                     docAssinaturas:=DocAssinaturasViewModel(Assinaturas.Items[i]);
                     if (docAssinaturas.ass_status = 3) then // assinado
                        assinado:=true
                     else
                      if (docAssinaturas.ass_status = 4) or (docAssinaturas.ass_status = 6) then // rejeitado ou cancelado
                         assinado:=false;
                     status:=docAssinaturas.ass_status;
                   end;
                 end;
                 Assinaturas.Free;
               end
               else
               begin
                 docaux:=DocumentosViewModel.Create();
                 docaux:=BuscarDocumentoPorNome(PastaViewModel(ListadePastas.Items[0]).pst_codigo,nomearquivo,'PDF');
                 if docaux <> nil then
                    doc_codigo:=docaux.doc_codigo;
                 docaux.free;
               end;

               If (status <> 0) and (status <> 4) and (status <> 6) // documento não foi gerado ou não teve assinatura rejeitada ou cancelada
               Then
                Begin
                  If MenuPrin.Database1.Intransaction
                  Then MenuPrin.Database1.Rollback;
                  if status = 3 then
                     MessageDlg('Histórico Escolar já foi totalmente assinado. Não pode ser gerado novamente!',mtError,[mbok],0)
                  else MessageDlg('Histórico Escolar já foi gerado. Para gerá-lo novamente, uma assinatura deverá ser cancelada ou rejeitada!',mtError,[mbok],0);
                End
               Else
                Begin
                  pastaEDocumentos:=PastaEDocumentosViewModel.Create();
                  pastaEDocumentos.Pasta:=PastaViewModel(ListadePastas.Items[0]);
                  documento:=DocumentosViewModel.Create();
                  documento.doc_codigo:=doc_codigo; // NULLToZero(QAux['doc_codigo']);
                  documento.fun_matr:=vcodusu;
                  documento.pst_codigo:=pastaeDocumentos.Pasta.pst_codigo;
                  documento.doc_nivelprocesso:='I';
                  documento.doc_dataarm:=DelphiDateTimeToISO8601Date(Pega_DataHora);
                  documento.doc_extarq :='PDF';
                  documento.tdo_seq:=74;
                  documento.aut_seq:=1;
                  documento.loc_seq:=1; // Campus I
                  documento.doc_assunto:=QGedArea['are_descr'];
                  documento.doc_nomearquivo:=nomearquivo + '.PDF';
                  documento.doc_titulo:=nomearquivo;
                  documento.doc_arquivo:=vPastaServidor + IntToStr(pastaEDocumentos.Pasta.are_codigo) + '\' + IntToStr(pastaEDocumentos.Pasta.pst_codigo) + '\pdf\' + nomearquivo + '.PDF';
                  documento.doc_ativo:='S';
                  documento.doc_usanodiploma:='S';
                  imagem:=ImagensViewModel.Create();
                  docbase64:=EncodeFile(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF');
                  imagem.doc_imagemstr:=docbase64;
                  FileToBytes(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF', arquivoBytes);
                  documento.doc_tamanho:= Length(arquivoBytes);
                  imagem.doc_imagem:=arquivoBytes;

                  documento.imagens:=imagem;

                  if (status = 0) or (status = 4) or (status = 6) then // se não tiver fluxo ou rejeitado ou cancelado
                  Begin
                    QUsuDoc.Close;
                    QUsuDoc.Sql.Clear;
                    QUsuDoc.Sql.Add('select * from sca_usudoccomprob u, drh_funcionarios f, ged_certificados c, crp_tipousuario tu, crp_usuarios usr');
                    QUsuDoc.Sql.Add('where u.fun_matr = f.fun_matr and u.cer_id = c.cer_id and u.tpu_seq = tu.tpu_seq and to_char(u.fun_matr) = usr.usr_login and');
                    QUsuDoc.Sql.Add('      u.dcp_seq = 4 order by usd_ordem');
                    QUsuDoc.Open;
                    if not QUsuDoc.Eof then
                    Begin
                      while not QUsuDoc.Eof do
                      Begin
                        docAssinaturas:=DocAssinaturasViewModel.Create();
                        docAssinaturas.ass_data:=DelphiDateTimeToISO8601Date(Pega_DataHora);
                        DocAssinaturas.ass_ordem:=QUsuDoc['usd_ordem'];
                        DocAssinaturas.ass_fluxocompart:=QUsuDoc['usd_compartilhado'];
                        DocAssinaturas.ass_fluxonivel:=QUsuDoc['usd_nivel'];
                        if (QUsuDoc['usd_nivel'] = 1)
                        then
                         begin
                           if (QUsuDoc['usd_ordem'] = 1) or (QUsuDoc['usd_compartilhado'] = 'S')
                           then DocAssinaturas.ass_status:=2
                           else DocAssinaturas.ass_status:=1;
                         end
                        else DocAssinaturas.ass_status:=1;
                        DocAssinaturas.cer_id:=QUsuDoc['cer_id'];
                        DocAssinaturas.doc_codigo:=documento.doc_codigo;
                        DocAssinaturas.tpu_seq:=QUsuDoc['tpu_seq'];
                        DocAssinaturas.usr_id:=QUsuDoc['usr_id'];
                        documento.assinaturas.Add(DocAssinaturas);
                        QUsuDoc.Next;
                      End;
                    End;
                  End;

                  pastaEDocumentos.Documentos.Add(documento);

                  retorno:=Atualizar_Documentos_Fluxo_Pasta_PastaValCampo(pastaEDocumentos);

                  if QAux.Eof then
                  begin
                    QDocComprob.Close;
                    QDocComprob.Sql.Clear;
                    QDocComprob.Sql.Add('select * from sca_aludoccomprob');
                    QDocComprob.Sql.Add('where alu_ra = 0 and hab_codigo = 0');
                    QDocComprob.Open;
                    QDocComprob.Append;
                    QDocComprob['alu_ra']:=StrToFloat(Trim(MERA.Text));
                    QDocComprob['hab_codigo']:=NHab;
                    QDocComprob['dcp_seq']:=4;

                    if doc_codigo <> 0 then
                       QDocComprob['doc_codigo']:=doc_codigo
                    else
                    begin
                      documento:=BuscarDocumentoPorNome(retorno.Pasta.pst_codigo,nomearquivo,'PDF');
                      QDocComprob['doc_codigo']:=documento.doc_codigo;
                    end;
                    QDocComprob['fun_matr']:=vcodusu;
                    QDocComprob['acp_dtinsercao']:=Pega_DataHora();
                    QDocComprob['acp_dtemissao']:=DEExp.Date;
                    QDocComprob.Post;
                  end
                  else
                  begin
                    QDocComprob.Close;
                    QDocComprob.Sql.Clear;
                    QDocComprob.Sql.Add('select * from sca_aludoccomprob');
                    QDocComprob.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and dcp_seq = 4');
                    QDocComprob.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                    QDocComprob.ParamByName('hab').AsSmallInt:=NHab;
                    QDocComprob.Open;
                    QDocComprob.Edit;
                    QDocComprob['acp_dtinsercao']:=Pega_DataHora();
                    QDocComprob['acp_dtemissao']:=DEExp.Date;
                    QDocComprob.Post;
                  end;

                  QAux.Close;
                  QAux.Sql.Clear;
                  QAux.Sql.Add('update sca_registrodoc set doc_codigo =:doc');
                  If vitl_seq = 0
                  Then
                   Begin
                     QAux.Sql.Add('where itl_seq = (select itl_seq from sca_itenslivdip where alu_ra =:ra and hab_codigo =:hab and srd_codigo <> 2) and');
                     QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                     QAux.ParamByName('hab').AsSmallInt:=NHab;
                   End
                  Else
                   Begin
                     QAux.Sql.Add('where itl_seq =:seq and');
                     QAux.ParamByName('seq').AsInteger:=vitl_seq;
                   End;
                  QAux.Sql.Add('      dcp_seq = 4 and doc_codigo is null');
                  QAux.ParamByName('doc').AsInteger:=documento.doc_codigo;
                  QAux.ExecSQL;

                  pastaEDocumentos.Free;
                  retorno.Free;
                  documento.Free;

                  // Abrindo com a tela minimizada
                  OpenPDF(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF', SW_MINIMIZE);
                  grava:=true;
                End;
             End
            Else
             Begin
               // Abrindo com a tela maximizada
               OpenPDF(C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF', SW_MAXIMIZE);
             End;
          End;
         QRFicAux.Close;
         QRFicAux.Sql.Clear;
         QRFicAux.Sql.Add('Delete from sca_rficha');
         QRFicAux.Sql.Add('where alu_ra =:ra');
         QRFicAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         QRFicAux.ExecSql;

         If MenuPrin.Database1.Intransaction
         Then Menuprin.Database1.Commit;
       Except
         If MenuPrin.Database1.Intransaction
         Then MenuPrin.Database1.Rollback;
         MessageDlg('Ocorreu um erro durante a execução. Dados ficarão incompletos ou impressão será cancelada!!!',mtError,[mbok],0);
         If Printer.Printing
         Then Printer.EndDoc;
         QRFicAux.Close;
         QRFicAux.Sql.Clear;
         QRFicAux.Sql.Add('Delete from sca_rficha');
         QRFicAux.Sql.Add('where alu_ra =:ra');
         QRFicAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         QRFicAux.ExecSql;
       End;
       If grava
       Then
        If RGHist.ItemIndex < 3
        Then Grava_Historico(StrToFloat(Trim(MERA.Text)),RGHist.ItemIndex + 1,vcodusu,Pega_DataHora)
        Else
         Begin
           Grava_Historico(StrToFloat(Trim(MERA.Text)),1,vcodusu,Pega_DataHora);
           If (qconsccl['ahb_codgra'] < 16)
           Then Grava_Historico(StrToFloat(Trim(MERA.Text)),2,vcodusu,Pega_DataHora);
           If RGHist.ItemIndex = 4  // Todos os Históricos
           Then Grava_Historico(StrToFloat(Trim(MERA.Text)),3,vcodusu,Pega_DataHora);
         End;
     End
    Else MessageDlg('Aluno tem situação no Enade em aberto. Emissão de histórico não pode ser efetuada!',mtError,[mbOk],0);
   { QRFicha.Close;
    QRFicha.Sql.Clear;
    QRFicha.Sql.Add('Delete from sca_rficha');
    QRFicha.Sql.Add('where alu_ra =:ra');
    QRFicha.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    QRFicha.ExecSql;}
    QDadAlu.Close;
    qconsalu.close;
    QNacional.Close;
    SPFicha.Close;
    QRFicha.Close;
    QLocalidade.Close;
    QCurSup.Close;
    QEquival.Close;
    QObsCompl.Close;
    QRFicAux.Close;
    FRHisPs7.Enabled:=True;
    If vexibe = 'S'
    Then MERA.Setfocus;
  End;
end;

procedure TFRHisPs7.RGHistExit(Sender: TObject);
begin
 If (qconsccl['ahb_codgra'] >= 16) and ((RGHist.ItemIndex = 1) or (RGHist.ItemIndex = 3))
 Then
  Begin
   imp_historico:=false;
   MessageDlg('Histórico de Licenciatura não pode ser emitido para este aluno!',mtError,[mbok],0);
   If vexibe = 'S'
   Then RGHist.SetFocus;
  End
 Else
  If (qconsccl['ahb_codgra'] >= 20) and (qconsccl['ahb_codgra'] <> 22) and (qconsccl['ahb_codgra'] <> 23) and (RGHist.ItemIndex <> 2)
  Then
   Begin
    imp_historico:=false;
    MessageDlg('Somente será permitida a emissão de Histórico de Formação para este aluno!',mtError,[mbok],0);
    RGHist.ItemIndex:=2;
    If vexibe = 'S'
    Then RGHist.SetFocus;
   End;
end;

procedure TFRHisPs7.b_cancelaClick(Sender: TObject);
begin
  If vexibe = 'S'
  Then MERA.Setfocus;
end;

procedure TFRHisPs7.HBHistorBeforePrint(Sender: TObject);
begin
 LContinua.Caption:='Continuação do Histórico Escolar de '+QDadAlu['pes_nome']+'   ';
// LFolha2.Caption:='Página : '+IntToStr(RHistor.AbsolutePageNo)+' de '+IntToStr(RHistor.AbsolutePageCount);
 LPagina.Caption:='Página : '+IntToStr(RHistor.AbsolutePageNo)+' de '+IntToStr(RHistor.AbsolutePageCount);
end;

procedure TFRHisPs7.GHBHistorBeforePrint(Sender: TObject);
var hab,rec:string;
    vmesing:word;
begin
 LPag.Caption:=IntToStr(RHistor.AbsolutePageNo)+' de '+IntToStr(RHistor.AbsolutePageCount);
// LFac.Caption:='FACULDADE DE '+NULLToSpace(QDadAlu['fac_nome']);
 LFac.Caption:='';
 LHab.Caption:='';
 rec:='';
{ If (qconsccl['ahb_codgra'] < 20) or (qconsccl['ahb_codgra'] = 22) or (qconsccl['ahb_codgra'] = 23) // A partir da grade 20 não há mais habilitação, com exceção das grades 22 e 23
 Then
  If NHab = 1
  Then LHab.Caption:='HAB.: BACHARELADO EM PSICOLOGIA'
  Else
   If NHab = 2
   Then LHab.Caption:='HAB.: LICENCIATURA PLENA EM PSICOLOGIA'
   Else
    If NHab = 3
    Then LHab.Caption:='HAB.: FORMAÇÃO DE PSICÓLOGO';}
 If QDadAlu['cur_autndc'] <> Null
 Then
  If QDadAlu['cur_autdcp'] = 1
  Then
   Begin
    If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
    Then rec:='AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
    Else rec:='AUT. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
   End
  Else
   Begin
    If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
    Then rec:='REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
    Else rec:='REC. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
   End;
 If (qconsccl['ahb_codgra'] < 20) or (qconsccl['ahb_codgra'] = 22) or (qconsccl['ahb_codgra'] = 23) // A partir da grade 20 não há mais habilitação, com exceção das grades 22 e 23
 Then
  Begin
    If NHab = 1
    Then LFac.Caption:='CURSO : '+NULLToSpace(QDadAlu['cur_nome'])+'     HAB.: BACHARELADO EM PSICOLOGIA'
    Else
     If NHab = 2
     Then LFac.Caption:='CURSO : '+NULLToSpace(QDadAlu['cur_nome'])+'     HAB.: LICENCIATURA PLENA EM PSICOLOGIA'
     Else
      If NHab = 3
      Then LFac.Caption:='CURSO : '+NULLToSpace(QDadAlu['cur_nome'])+'     HAB.: FORMAÇÃO DE PSICÓLOGO';
  End
 Else LFac.Caption:='CURSO : '+NULLToSpace(QDadAlu['cur_nome']);
 LCurso.Caption:=rec;
// LCurso.Caption:='CURSO : '+NULLToSpace(QDadAlu['cur_nome'])+rec;
 LHab.Caption:=Renovacao3(QDadAlu,2,1);
 LRA.Caption:=Mascara_RA(QDadAlu['alu_ra']);
 LAluno.Caption:=Nome_Aluno(QDadAlu['pes_nome'],NULLToSpace(QDadAlu['pes_nomecivil']),QDadAlu['pes_nomedefinitivo'],false);
 If (QDadAlu['nac_codigo'] = Null) or (QDadAlu['nac_codigo'] = 1) or (QDadAlu['nac_codigo'] = 9)
 Then
  Begin
    ppLabel8.caption:='R.G.';
    LRG.Caption:=NULLToSpace(QDadAlu['pes_rg']);
    LOrg.Caption:=NULLToSpace(QDadAlu['pes_orgexp']);
    LEst.Caption:=NULLToSpace(QDadAlu['pes_estexp']);
  End
 Else
  Begin
    ppLabel8.caption:=NULLToSpace(QDadAlu['tde_sigla']);
    LRG.Caption:=NULLToSpace(QDadAlu['pes_docestr']);
    LOrg.Caption:='';
    LEst.Caption:='';
//    LCPF.Caption:='';
  End;
 If QDadAlu['pes_cpf'] <> Null
 Then LCPF.Caption:=Mascara_CPF(QDadAlu['pes_cpf'])
 Else LCPF.Caption:='';
 
// LFolha.Caption:=StrZero(RHistor.AbsolutePageNo,2);
 LDatNas.Caption:='';
 If QDadAlu['pes_datnas'] <> Null
 Then LDatNas.Caption:=DateToStr(QDadAlu['pes_datnas']);
 Imp_Estado_Pais(QDadAlu,ppLabel15,LLocNas);
 LNasc.Caption:=Imp_Nacionalidade(QDadAlu);
{ LTitulo.Caption:=NULLToSpace(QDadAlu['pes_titulo']);
 If QDadAlu['pes_zonael'] <> Null
 Then LZona.Caption:=StrZero(QDadAlu['pes_zonael'],3)
 Else LZona.Caption:='';
 LMunicipio.Caption:='';
 LUF2.Caption:='';
 If QDadAlu['pes_municipio'] <> Null
 Then
  Begin
   QLocalidade.Close;
   QLocalidade.ParamByName('Cod').AsInteger:=QDadAlu['pes_municipio'];
   QLocalidade.Open;
   LMunicipio.Caption:=QLocalidade['loc_nome'];
   LUF2.Caption:=NULLToSpace(QLocalidade['loc_uf']);
  End;}
 Dados_Grade_Hab(qconsccl);
 qconsccl.parambyname('hab').assmallint:=NHab;
 qconsccl.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 qconsccl.open;
 If (qconsccl['ahb_cnting'] = Null) or (qconsccl['ahb_cnting'] = 0) or (NULLToZero(QDadAlu['alu_foring']) = 5)
 Then
  Begin
   If (QDadAlu['alu_foring'] = Null) or (QDadAlu['alu_foring'] = 0)
   Then ingresso:=1
   Else ingresso:=QDadAlu['alu_foring'];
  End
 Else ingresso:=qconsccl['ahb_cnting'];
 If (ingresso = 1) or (ingresso = 3) or (ingresso = 4) or (ingresso = 5)
 Then
  Begin
   Ajusta_Quadro(ppLabel46, ppLabel47, ppLabel51, ppLine64, 1);
   Visivel(FRHisPs7,2);
   Invisivel(FRHisPs7,1);
   Invisivel(FRHisPs7,10);
   Desloca(FRHisPs7,3,0.65,0,0,0);
   Desloca(FRHisPs7,4,0.645,0,0,0);
   SCab.Height:=2.10;
   GHBHistor.Height:=3.32;
   LCurSup.Caption:='**********************************************************************';
   LRegDipl.Caption:='**********';
   LNLivro.Caption:='********';
   LNFolha.Caption:='******';
   LNProc.Caption:='**********************';
   LDatReg.Caption:='*******';
   LLocReg.Caption:='*********************************************************************************';
   LDatVest.Caption:='';
   If ingresso = 5 // PROUNI
   Then
    Begin
     Ajusta_Quadro(ppLabel46, ppLabel47, ppLabel51, ppLine64, 2);
     Imprime_ENEM(QDadAlu,LDatVest);

     LTpPonto.Visible:=False;
     LPontos.Visible:=False;
     ppShape42.Visible:=False;
     LEntidade.Caption:=NULLToSpace(QDadAlu['alu_prouni']);
    End
   Else
    Begin
     If (QDadAlu['alu_inives'] <> Null) and (QDadAlu['alu_fimves'] <> Null)
     Then LDatVest.Caption:=Recupera_Periodo_Vestibular(QDadAlu['alu_inives'],QDadAlu['alu_fimves']);
     If NULLToSpace(QDadAlu['alu_notaenem']) = 'S' // considerar média ENEM
     Then LTpPonto.Caption:='Média ENEM'
     Else LTpPonto.Caption:='Pontos';
     LPontos.Caption:=NULLToSpace(QDadAlu['alu_totpon']);
     LEntidade.Caption:=NULLToSpace(QDadAlu['alu_entidade']);
    End;
  End
 Else
  Begin
    QCurSup.Close;
    QCurSup.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
 //   QCurSup.ParamByName('codhab').AsSmallInt:=qconsccl['hab_codigo'];
    QCurSup.Open;
    Visivel(FRHisPs7,1);
    Invisivel(FRHisPs7,2);
    Invisivel(FRHisPs7,5);

    If (NULLToZero(QDadAlu['alu_anoing']) > 2025) or ((NULLToZero(QDadAlu['alu_anoing']) = 2025) and (NULLToZero(QDadAlu['alu_seming']) = 2) and (NULLToZero(QDadAlu['alu_mesing']) = 10))
    Then
     Begin
       Invisivel(FRHisPs7,10); // campos referentes a entrada por curso superior que irão aparecer a partir dos ingressantes de outubro de 2025
       LRegDiploma.Caption:='Nome da Instituição';
       SRegDiploma.Width:=7.5625;
       LRegDipl.Width:=7.4896;
       LRegDipl.Caption:=NULLToSpace(QCurSup['acs_locreg']);
       LLocalReg.Caption:='Mês e Ano de Ingresso';
       SLocalReg.Left:=0.0729;
       SLocalReg.Width:=1.375;
       LLocalReg.Left:=0.1042;
       LLocReg.Left:=0.1146;
       LLocReg.Width:=1.325;
       vmesing:=NULLToZero(QDadAlu['alu_mesing']);
       If vmesing <> 0
       Then LLocReg.Caption:=Mes[vmesing] + '/' + IntToStr(NULLToZero(QDadAlu['alu_anoing']))
       Else LLocReg.Caption:='';
       LLivro.Visible:=False;
       LNLivro.Visible:=False;
       SLivro.Visible:=False;
       LFolha.Visible:=False;
       LNFolha.Visible:=False;
       SFolha.Visible:=False;
     End
    Else
     Begin
       Visivel(FRHisPs7,10); // campos referentes a entrada por curso superior que não irão aparecer até os ingressantes de julho de 2025
       LRegDiploma.Caption:='Nº Reg. Diploma';
       SRegDiploma.Width:=1.375;
       LRegDipl.Width:=1.3125;
       LLivro.Caption:='Nº do Livro';
       LFolha.Caption:='Nº da Folha';
       LLocalReg.Caption:='Local do Registro';
       SLocalReg.Left:=1.2396;
       LLocalReg.Left:=1.2708;
       SLocalReg.Width:=6.3958;
       LLocReg.Left:=1.2813;
       LLocReg.Width:=6.3125;
       LRegDipl.Caption:=NULLToSpace(QCurSup['acs_nrreg1']);
       LNLivro.Caption:=NULLToSpace(QCurSup['acs_nrlivro']);
       LNFolha.Caption:=NULLToSpace(QCurSup['acs_nrfolha']);
       LNProc.Caption:=NULLToSpace(QCurSup['acs_processo']);
       If QCurSup['acs_datreg'] <> Null
       Then LDatReg.Caption:=DateToStr(QCurSup['acs_datreg'])
       Else LDatReg.Caption:='********';
       LLocReg.Caption:=NULLToSpace(QCurSup['acs_locreg']);
     End;

    ppLine61.Height:=0.9687; // linha lateral direita do quadro de curso superior
    ppLine63.Height:=0.9271; // linha lateral esquerda do quadro de curso superior
    ppLine62.Top:=3.125; // linha inferior do quadro de curso superior
    Desloca(FRHisPs7,4,0,0.063,0,0);
    SCab.Height:=2.78;
    GHBHistor.Height:=3.78;

    LCurSup.Caption:=NULLToSpace(QCurSup['acs_cursup']);
    LDatVest.Caption:='**************';
    LPontos.Caption:='***';
    LEntidade.Caption:='*************************';
  End;

 If qconsccl['ahb_conclusao'] <> Null
 Then LConclusao.Caption:=DateToStr(qconsccl['ahb_conclusao'])
 Else LConclusao.Caption:='********';
 If qconsccl['ahb_colacao'] <> Null
 Then LColGra.Caption:=DateToStr(qconsccl['ahb_colacao'])
 Else LColGra.Caption:='********';
 If qconsccl['ahb_expedicao'] <> Null
 Then LExpDipl.Caption:=DateToStr(qconsccl['ahb_expedicao'])
 Else LExpDipl.Caption:='********';

 // Nair pediu para tirar nº do livro, nº da folha e data do registro 05/07/2013
 ppShape47.Visible:=False;
 ppLabel55.Visible:=False;
 LNLivro2.Visible:=False;

 ppShape48.Visible:=False;
 ppLabel57.Visible:=False;
 LNFolha2.Visible:=False;

 ppShape49.Visible:=False;
 ppLabel58.Visible:=False;
 LDatReg2.Visible:=False;
 Imp_Livro_Folha_DatReg(qconsccl,QDadAlu,LNLivro2,LNFolha2,LDatReg2);
{ If QDadAlu['alu_nrlivro'] <> Null
 Then
  Begin
   If QDadAlu['alu_nrlivro'] <> '0000'
   Then LNLivro2.Caption:=QDadAlu['alu_nrlivro']
   Else LNLivro2.Caption:='****';
  End
 Else LNLivro2.Caption:='';
 If QDadAlu['alu_nrfolha'] <> Null
 Then
  Begin
   If QDadAlu['alu_nrfolha'] <> '00000'
   Then LNFolha2.Caption:=QDadAlu['alu_nrfolha']
   Else LNFolha2.Caption:='*****';
  End
 Else LNFolha2.Caption:='';
 If QDadAlu['alu_datreg'] <> Null
 Then LDatReg2.Caption:=DateToStr(QDadAlu['alu_datreg'])
 Else LDatReg2.Caption:='********';}
end;

procedure TFRHisPs7.DBDiscBeforePrint(Sender: TObject);
begin
{ DBDisc.Visible:=True;
 If Valida_Disc(QRFicha['dis_codigo'],NHab,qconsccl['ahb_codgra'])
 Then
  Begin
   LCodDis.Visible:=True;
   DBTNomDisc.Visible:=True;
   DBTCHMin.Visible:=True;
   LPerLet.Visible:=True;
   LMedFin.Visible:=True;
   LSitFin.Visible:=True;
   LObs.Visible:=True;
   SREquival.Visible:=False;
   LCodDis.Caption:=IntToStr(QRFicha['dis_codigo']);
   LPerLet.Caption:='';
   LMedFin.Caption:='';
   LSitFin.Caption:='';
   LObs.Caption:='';
   If (QRFicha['his_codobs'] <> Null) and (QRFicha['his_sitfin'] <> 'C')
   Then codobs:=QRFicha['his_codobs'];
   If QRFicha['his_perlet'] <> Null
   Then
    If (Length(IntToStr(QRFicha['his_perlet'])) <> 5)
    Then
     If (StrToInt(Copy(IntToStr(QRFicha['his_perlet']),1,2)) <= 20)
     Then
      If QRFicha['his_perlet'] > 1998
      Then cursou99:=true;
   If (QRFicha['his_codlan'] = 1) or (QRFicha['his_codlan'] = 5) or (QRFicha['his_codlan'] = 11)
   Then
    Begin
     If QRFicha['his_sitfin'] = 'C'  // a cursar
     Then
      Begin
       LPerLet.Caption:='*****';
       LMedFin.Caption:='******';
       LSitFin.Caption:='A CURSAR';
      End
     Else
      Begin
       If QRFicha['his_perano'] <> Null
       Then LPerLet.Caption:=QRFicha['his_perano']
       Else
        If QRFicha['his_perlet'] <> Null
        Then
         Begin
          If Length(IntToStr(QRFicha['his_perlet'])) <> 5
          Then
           Begin
            If (StrToInt(Copy(IntToStr(QRFicha['his_perlet']),1,2)) > 20)
            Then LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),1,2)+'/'+Copy(IntToStr(QRFicha['his_perlet']),3,2)+NULLToSpace(QRFicha['dco_periodo'])
            Else
             If QDadAlu['cur_anosem'] = 1
             Then LPerLet.Caption:=IntToStr(QRFicha['his_perlet'])+NULLToSpace(QRFicha['dco_periodo'])
             Else
              If QRFicha['his_perlet'] < 1999
              Then LPerLet.Caption:=IntToStr(QRFicha['his_perlet'])+NULLToSpace(QRFicha['dco_periodo'])
              Else LPerLet.Caption:=IntToStr(QRFicha['his_semref'])+'/'+IntToStr(QRFicha['his_perlet'])+NULLToSpace(QRFicha['dco_periodo'])
           End
          Else
           If QDadAlu['cur_anosem'] = 1
           Then LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),2,4)+NULLToSpace(QRFicha['dco_periodo'])
           Else
            If QDadAlu['fac_codigo'] = 1 // Faclepp
            Then LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),1,1)+'/'+Copy(IntToStr(QRFicha['his_perlet']),2,4)+NULLToSpace(QRFicha['dco_periodo'])
            Else LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),2,4)+NULLToSpace(QRFicha['dco_periodo']);
         End;
       If (QRFicha['his_sitfin'] = 'A') or (QRFicha['his_sitfin'] = 'R')
       Then
        Begin
         If Disc_Sem_Media(QRFicha)
         Then LMedFin.Caption:='******'
         Else
          If QRFicha['his_medfin'] <> Null
          Then LMedFin.Caption:=FormatFloat('#0.0',QRFicha['his_medfin']);
         If QRFicha['his_sitfin'] = 'A'
         Then LSitFin.Caption:='APR'
         Else LSitFin.Caption:='REP';
         If not Educacao_Fisica(QRFicha['dis_controle'],QDadAlu['cur_area'],QDadAlu['cur_codigo'])
         Then
          If not Achou_Disciplina(MTDisc,QRFicha)
          Then totcarga:=totcarga+NULLToZero(QRFicha['his_chminima']);
         If QRFicha['his_codobs'] <> Null
         Then
          If QRFicha['his_codobs'] = 999
          Then LObs.Caption:='(Ø)'
          Else LObs.Caption:='('+IntToStr(QRFicha['his_codobs'])+')';
        End
       Else
        Begin
         If QRFicha['his_semref'] = 1
         Then cursando1:=true
         Else cursando2:=true;
         If Imprime_Notas = ''
         Then
          Begin
           LMedFin.Caption:='******';
           LSitFin.Caption:='CURSANDO';
//           If QRFicha['his_semref'] = 2
//           Then LObs.Caption:='(##)';
          End
         Else
          Begin
           LMedFin.Caption:=Imprime_Notas;
           LSitFin.Caption:='CURSANDO';
           If QRFicha['his_semref'] = 1
           Then LObs.Caption:='(#)'
           Else LObs.Caption:='(##)';
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
         DBTNomDisc.Visible:=False;
         DBTCHMin.Visible:=False;
         LPerLet.Visible:=False;
         LMedFin.Visible:=False;
         LSitFin.Visible:=False;
         LObs.Visible:=False;
         SREquival.Visible:=True;
         QEquival.Close;
         QEquival.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         If QRFicha['his_disequ'] = Null
         Then QEquival.ParamByName('coddis').asinteger:=QRFicha['dis_codigo']
         Else QEquival.ParamByName('coddis').asinteger:=QRFicha['his_disequ'];
         QEquival.Open;
        End
       Else SREquival.Visible:=True;
      End
     Else
      Begin
       If (QRFicha['his_codlan'] = 4) or (QRFicha['his_codlan'] = 6)
       Then
        Begin
         If QRFicha['his_codlan'] = 4
         Then
          Begin
            If (Length(IntToStr(QRFicha['his_perlet'])) = 4) and ((StrToInt(Copy(IntToStr(QRFicha['his_perlet']),1,2)) <= 20)) and (QRFicha['his_perlet'] >= 2015)
            Then
             Begin
               LObs.Caption:='(¤)';
               disp4:=true;
             End
            Else
             Begin
               LObs.Caption:='(*)';
               disp1:=true;
             End;
          End
         Else
          Begin
           disp2:=true;
           LObs.Caption:='(µ)';
          End;
         If QRFicha['his_perlet'] <> Null
         Then
          Begin
           If Length(IntToStr(QRFicha['his_perlet'])) <> 5
           Then
            Begin
             If (StrToInt(Copy(IntToStr(QRFicha['his_perlet']),1,2)) > 20)
             Then LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),1,2)+'/'+Copy(IntToStr(QRFicha['his_perlet']),3,2)
             Else
              If QDadAlu['cur_anosem'] = 1
              Then LPerLet.Caption:=IntToStr(QRFicha['his_perlet'])
              Else
               If QRFicha['his_perlet'] < 1999
               Then LPerLet.Caption:=IntToStr(QRFicha['his_perlet'])
               Else LPerLet.Caption:=IntToStr(QRFicha['his_semref'])+'/'+IntToStr(QRFicha['his_perlet']);
            End
           Else
            If QDadAlu['cur_anosem'] = 1
            Then LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),2,4)
            Else
             If QDadAlu['fac_codigo'] = 1 // Faclepp
             Then LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),1,1)+'/'+Copy(IntToStr(QRFicha['his_perlet']),2,4)
             Else LPerLet.Caption:=Copy(IntToStr(QRFicha['his_perlet']),2,4);
          End;
         LMedFin.Caption:='******';
         LSitFin.Caption:='DIS';
        End;
      End;
    End;
  End
 Else DBDisc.Visible:=False;}
end;

procedure TFRHisPs7.DBObsBeforePrint(Sender: TObject);
var ok:boolean;
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
    ok:=true;
    QConsEq.Close;
    QConsEq.Sql.Clear;
    QConsEq.Sql.Add('Select * from sca_equivalencia');
    QConsEq.Sql.Add('where alu_ra =:ra and equ_codobs =:codobs');
    QConsEq.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    QConsEq.ParamByName('codobs').assmallint:=QObserv['obs_codigo'];
    QConsEq.Open;
    If not QConsEq.Eof
    Then
     Begin
      While not QConsEq.Eof do
      Begin
       If (Valida_Disc(QConsEq['dis_codigo'],NHab,qconsccl['ahb_codgra'])) and (QObserv['hab_codigo'] = NHab)
       Then
        Begin
         ok:=true;
         LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')';
         break;
        End
       Else ok:=false;
       QConsEq.Next;
      End;
     End
    Else
     Begin
      QConsAdi.Close;
      QConsAdi.Sql.Clear;
      QConsAdi.Sql.Add('Select * from sca_adicionais');
      QConsAdi.Sql.Add('where alu_ra =:ra and adi_codobs =:codobs');
      QConsAdi.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
      QConsAdi.ParamByName('codobs').assmallint:=QObserv['obs_codigo'];
      QConsAdi.Open;
      If not QConsAdi.Eof
      Then LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')'
      Else
       If QObserv['hab_codigo'] <> NHab
       Then ok:=false
       Else
        If QObserv['obs_codigo'] = codobs
        Then LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')';
     End;
    If ok
    Then
     Begin
      DBObs.Visible:=True;
      If QObserv['obs_observ1'] <> Null
      Then
       Begin
        If (Length(Trim(QObserv['obs_observ1'])) <= 120) or ((QObserv['obs_ano'] <> Null) and (QObserv['obs_semestre'] <> Null) and (Pos('ENADE',QObserv['obs_observ1'])<> 0))
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
          LNomObs1.Caption:=Divide_Obs(1,QObserv['obs_observ1']);
          LNomObs2.Caption:=Divide_Obs(2,QObserv['obs_observ1']);
         End;
       End;
     End;
   End;
end;

procedure TFRHisPs7.DBObsAfterPrint(Sender: TObject);
begin
 DBObs.Visible:=True;
end;

procedure TFRHisPs7.DBObsComplBeforePrint(Sender: TObject);
begin
 Imp_ObsCompl(QObsCompl,LObsCompl,LNomObs4);
 LNomObs3.Caption:='';
 LNomObs4.Caption:='';
 If not QObsCompl.Eof
 Then
  If Trim(NULLToSpace(QObsCompl['obs_observ2'])) = ''
  Then
   Begin
    SObsCompl.Height:=0.10;
    LnObs3.Height:=0.10;
    LnObs4.Height:=0.10;
    LNomObs3.Visible:=True;
    LNomObs4.Visible:=False;
    LNomObs3.Caption:=NULLToSpace(QObsCompl['obc_observ1']);
   End
  Else
   Begin
    SObsCompl.Height:=0.18;
    LnObs3.Height:=0.18;
    LnObs4.Height:=0.18;
    LNomObs3.Visible:=True;
    LNomObs4.Visible:=True;
    LNomObs3.Caption:=NULLToSpace(QObsCompl['obc_observ1']);
    LNomObs4.Caption:=QObsCompl['obs_observ2'];
   End;
end;

procedure TFRHisPs7.GHBHistorAfterPrint(Sender: TObject);
begin
 If (ingresso = 1) or (ingresso = 3) or (ingresso = 4) or (ingresso = 5)
 Then
  Begin
   Desloca(FRHisPs7,3,0,0.65,0,0);
   Desloca(FRHisPs7,4,0,0.645,0,0);
  End
 Else Desloca(FRHisPs7,4,0.063,0,0,0);
end;

procedure TFRHisPs7.RHistorBeforePrint(Sender: TObject);
begin
{ totcarga:=0;
 tothoras:=0;
 disp1:=false;
 disp2:=false;
 disp4:=false;
 codobs:=0;
 lancado:=false;
 cursando1:=false;cursando2:=false;
 vnota1:=0;vnota2:=0;
 cursou99:=false;
 MTDisc.Close;
 MTDisc.Open;
 MTEquival.Close;
 MTEquival.Open;
 MTAdiciona.Close;
 MTAdiciona.Open;
 FBHistor.Height:=0.26;
 LContinua2.Top:=0.0625;}
end;

procedure TFRHisPs7.RHistorStartSecondPass(Sender: TObject);
begin
{ totcarga:=0;
 tothoras:=0;
 disp1:=false;
 disp2:=false;
 disp4:=false;
 codobs:=0;
 lancado:=false;
 cursando1:=false;cursando2:=false;
 vnota1:=0;vnota2:=0;
 cursou99:=false;
 MTDisc.Close;
 MTDisc.Open;
 MTEquival.Close;
 MTEquival.Open;
 MTAdiciona.Close;
 MTAdiciona.Open;
 FBHistor.Height:=0.26;
 LContinua2.Top:=0.0625;}
end;

procedure TFRHisPs7.SBHistorBeforePrint(Sender: TObject);
begin
 If RHistor.AbsolutePageCount = 1
 Then FBHistor.Height:=0.01
 Else
  Begin
    FBHistor.Height:=0.26;
//    LContinua2.Top:=0.0625;
  End;
end;

procedure TFRHisPs7.TBObsAfterGenerate(Sender: TObject);
begin
 ppLine36.Visible:=True;
 ppLine38.Visible:=True;
 LCabObs1.Visible:=True;
end;

procedure TFRHisPs7.TBObs2AfterGenerate(Sender: TObject);
begin
 ppLine37.Visible:=True;
 ppLine39.Visible:=True;
 LCabObs2.Visible:=True;
end;

procedure TFRHisPs7.TBObsComplAfterGenerate(Sender: TObject);
begin
 ppLine40.Visible:=True;
 ppLine41.Visible:=True;
 LCabObs3.Visible:=True;
end;

procedure TFRHisPs7.QRFichaCalcFields(DataSet: TDataSet);
begin
 If NULLToZero(QRFicha['his_chminima']) <> 0
 Then ch.value:=IntToStr(NULLToZero(QRFicha['his_chminima']))
 Else ch.value:='******';
 nomdisc.value:=Trim(QRFicha['dis_nomdisc']) + NULLToSpace(QRFicha['dco_complemento']);
end;

procedure TFRHisPs7.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
 CabObs:=False;

 MTCH.Close;
 MTCH.Open;
 MTCH.Append;
 MTCH['totch']:=DBCTotAulas.Value;
 MTCH.Post;
 totcarga:=DBCTotAulas.Value;
 tothoras:=DBCTotHoras.Value;

 ppLine36.Visible:=False;
 ppLine38.Visible:=False;
 LCabObs1.Visible:=False;
 DBObs.Visible:=False;
 QObserv.Close;
 QObserv.Sql.Clear;
 QObserv.Sql.Add('Select * from sca_observacoes');
 QObserv.Sql.Add('where alu_ra =:ra');
 QObserv.Sql.Add(' and ((obs_codigo < 90) or (obs_codigo > 99))');
 QObserv.Sql.Add('order by obs_ano, obs_semestre, obs_codigo');
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
   ppLine2.Visible:=False;
   ppLine3.Visible:=True;
   ppLine58.Visible:=False;
  End;

 ppLine37.Visible:=False;
 ppLine39.Visible:=False;
 LCabObs2.Visible:=False;
 DBObs2.Visible:=False;
 MTObs.Close;
 MTObs.Open;
 If disp1
 Then
  Begin
   MTObs.Append;
   MTObs['obs_codigo']:='(*)';
   If qconsccl['ahb_inicio'] <> Null
   Then
    Begin
     If Length(IntToStr(qconsccl['ahb_inicio'])) = 4
     Then
      Begin
       If qconsccl['ahb_inicio'] > 1988
       Then MTObs['obs_observ']:='O(A) ALUNO(A) FOI DISPENSADO(A) DAS AULAS DE EDUCAÇÃO FÍSICA CONFORME LEI N° 7.692 DE 20 DE DEZEMBRO DE 1988.'
       Else MTObs['obs_observ']:='O(A) ALUNO(A) FOI DISPENSADO(A) DAS AULAS DE EDUCAÇÃO FÍSICA CONFORME LEI N° 6.503 DE 13 DE DEZEMBRO DE 1977.';
      End
     Else
      Begin
       If qconsccl['ahb_inicio'] > 88
       Then MTObs['obs_observ']:='O(A) ALUNO(A) FOI DISPENSADO(A) DAS AULAS DE EDUCAÇÃO FÍSICA CONFORME LEI N° 7.692 DE 20 DE DEZEMBRO DE 1988.'
       Else MTObs['obs_observ']:='O(A) ALUNO(A) FOI DISPENSADO(A) DAS AULAS DE EDUCAÇÃO FÍSICA CONFORME LEI N° 6.503 DE 13 DE DEZEMBRO DE 1977.';
      End;
    End
   Else
    Begin
     If StrToInt(Copy(StrZero(qconsccl['alu_ra'],10),4,2)) > 88
     Then MTObs['obs_observ']:='O(A) ALUNO(A) FOI DISPENSADO(A) DAS AULAS DE EDUCAÇÃO FÍSICA CONFORME LEI N° 7.692 DE 20 DE DEZEMBRO DE 1988.'
     Else MTObs['obs_observ']:='O(A) ALUNO(A) FOI DISPENSADO(A) DAS AULAS DE EDUCAÇÃO FÍSICA CONFORME LEI N° 6.503 DE 13 DE DEZEMBRO DE 1977.';
    End;
   MTObs.Post;
  End;
 If disp2
 Then
  Begin
   MTObs.Append;
   MTObs['obs_codigo']:='(µ)';
   MTObs['obs_observ']:='"EDUCAÇÃO FÍSICA - DISPENSADO(A) NOS TERMOS DO PARECER Nº 376/97, DA CÂMARA DE EDUCAÇÃO SUPERIOR DO C.N.E."';
   MTObs.Post;
  End;
 If disp4
 Then
  Begin
   MTObs.Append;
   MTObs['obs_codigo']:='(¤)';
   MTObs['obs_observ']:='"DISPENSADO(A) DE EDUCAÇÃO FÍSICA NOS TERMOS DA LDB - LEI N° 9394 DE 20/12/1996."';
   MTObs.Post;
  End;
 If lancado
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='CARGA HORÁRIA COM "****", ENTENDER: - CARGA HORÁRIA JÁ LANÇADA EM DISPENSA OU EQUIVALÊNCIA DE OUTRA DISCIPLINA.';
   MTObs.Post;
  End;
 If cursando1 or cursando2
 Then
  Begin
   If (cursando1) and (vnota1 <> 0)
   Then
    Begin
     MTObs.Append;
     MTObs['obs_codigo']:='(#)';
     Case vnota1 of
       0:MTObs['obs_observ']:='DISCIPLINA MINISTRADA NO 1º SEMESTRE.';
       1:MTObs['obs_observ']:='NOTA REFERENTE AO 1º BIMESTRE DO CORRENTE SEMESTRE LETIVO.';
       2:MTObs['obs_observ']:='NOTAS REFERENTES AO 1º E 2º BIMESTRES DO CORRENTE SEMESTRE LETIVO.';
//       3:MTObs['obs_observ']:='NOTAS REFERENTES AO 1º, 2º E 3º BIMESTRES DO CORRENTE SEMESTRE LETIVO.';
//       4:MTObs['obs_observ']:='NOTAS REFERENTES AO 1º, 2º, 3º E 4º BIMESTRES DO CORRENTE SEMESTRE LETIVO.';
     End;
     MTObs.Post;
    End;
   If (cursando2) and (vnota2 <> 0)
   Then
    Begin
     MTObs.Append;
     MTObs['obs_codigo']:='(##)';
     Case vnota2 of
//       0:MTObs['obs_observ']:='A DISCIPLINA SERÁ MINISTRADA NO 2º SEMESTRE.';
       3:MTObs['obs_observ']:='NOTA REFERENTE AO 1º BIMESTRE DO CORRENTE SEMESTRE LETIVO.';
       4:MTObs['obs_observ']:='NOTAS REFERENTES AO 1º E 2º BIMESTRES DO CORRENTE SEMESTRE LETIVO.';
     End;
     MTObs.Post;
    End;
  End;
 Carrega_AtivPsi(NULLToZero(QGradLet['totativ']),NHab,QCHAtiv,QDadAlu,qconsccl,MTObs,totcarga,somou);
 If RGTpHist.ItemIndex = 1 {Análise de Currículo}
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='ESTE HISTÓRICO NÃO TEM VALIDADE COMO GUIA DE TRANSFERÊNCIA.';
   MTObs.Post;
  End;
{ If (cursou99) and (QDadAlu['fac_codigo'] <> 1)
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='A PARTIR DO 1º SEMESTRE DE 1999, TODOS OS CURSOS DE GRADUAÇÃO DA UNOESTE TÊM ESTRUTURAÇÃO SERIADA SEMESTRAL.';
   MTObs.Post;
  End;}
 If codobs = 999
 Then
  Begin
   MTObs.Append;
   MTObs['obs_codigo']:='(Ø)';
   MTObs['obs_observ']:='EQUIVALÊNCIA DE DISCIPLINA POR MUDANÇA DE MATRIZ CURRICULAR.';
   MTObs.Post;
  End;
 If RGTipo.ItemIndex = 1 // Histórico Escolar Completo
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='HISTÓRICO ESCOLAR COMPLETO COM OU SEM REPROVAS.';
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
   ppLine2.Visible:=True;
   ppLine3.Visible:=False;
   ppLine58.Visible:=False;
  End;

 ppLine40.Visible:=False;
 ppLine41.Visible:=False;
 LCabObs3.Visible:=False;
 DBObsCompl.Visible:=False;
 QObsCompl.Close;
 QObsCompl.Sql.Clear;
 QObsCompl.Sql.Add('select * from sca_obscompl');
 QObsCompl.Sql.Add('where grl_codgra =:codgra and cur_codigo =:codcur and hab_codigo =:codhab');
 QObsCompl.Sql.Add('order by obc_nordem');
 QObsCompl.ParamByName('codgra').AsSmallInt:=qconsccl['ahb_codgra'];
 QObsCompl.ParamByName('codcur').AsSmallInt:=QDadAlu['cur_codigo'];
 QObsCompl.ParamByName('codhab').AsSmallInt:=1;
 QObsCompl.Open;
 If not QObsCompl.Eof
 Then
  Begin
   If not CabObs
   Then
    Begin
     CabObs:=True;
     ppLine40.Visible:=True;
     ppLine41.Visible:=True;
     LCabObs3.Visible:=True;
    End;
   DBObsCompl.Visible:=True;
   ppLine2.Visible:=False;
   ppLine3.Visible:=False;
   ppLine58.Visible:=True;
  End;
end;

procedure TFRHisPs7.ppDetailBand1BeforePrint(Sender: TObject);
begin
 LCH.Caption:=Exibe_CargaTotal2(totcarga,tothoras,1,NULLToZero(QGradLet['totativ']),nhab,QCHAtiv,QDadAlu,qconsccl)+' ';
end;

procedure TFRHisPs7.FBHistorBeforePrint(Sender: TObject);
begin
// If (RHistor.AbsolutePageNo + 1) mod 2 = 0 // Página Par
// Then LContinua2.Caption:='Continua na página '+StrZero(RHistor.AbsolutePageNo+1,2)+' (Verso)'
// Else LContinua2.Caption:='Continua na página '+StrZero(RHistor.AbsolutePageNo+1,2);
// LContinua2.Caption:='Continua na página '+StrZero(RHistor.AbsolutePageNo+1,2);
 LPagina.Caption:='Página : '+IntToStr(RHistor.AbsolutePageNo)+' de '+IntToStr(RHistor.AbsolutePageCount);
end;

procedure TFRHisPs7.DEExpExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If (DEExp.Date = 0) and (vexibe = 'S')
  Then DEExp.SetFocus;
end;

procedure TFRHisPs7.RGTipoExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  Begin
    B_Ok.Enabled:=True;
    If vexibe = 'S'
    Then B_Ok.SetFocus;
  End;
end;

procedure TFRHisPs7.QEquivalCalcFields(DataSet: TDataSet);
begin
 QEquival['hr']:=Calcula_HorasEquiv(QEquival,QDadAlu,QRFicha);
end;

procedure TFRHisPs7.ppGroupFooterBand2BeforePrint(Sender: TObject);
var vdia,vmes,vano:word;
begin
 DecodeDate(DEExp.Date,vano,vmes,vdia);
 LCidade2.Caption:='P. Prudente, '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano)+' ';
 LRA2.Caption:='R.A. '+Mascara_RA(MDFicha['alu_ra'])+' em '+DEExp.Text;
end;

end.
