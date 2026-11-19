unit URHist9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Buttons, DB, DBTables, Printers,
  RXLookup, RxMemDS, ppBands, ppCtrls, ppPrnabl, ppClass, ppProd,
  ppReport, ppDB, ppComm, ppCache, ppDBPipe, ppStrtch, ppSubRpt, ppRelatv,
  ppModule, daDatMod, ppMemo, ppViewr, ppVar, ppTypes, rxToolEdit, rxCurrEdit,
  ppRegion, ppRichView, RVStyle, ppParameter, ppDesignLayer, rxMemTable, Variants,
  UGed_Documentos, Contnrs, RestClient, RestJsonUtils, IdCoderMIME, Strak.Ghostscript,
  jpeg, gtpngimage, ppBarCode2D;

type
  TFRHist9 = class(TForm)
    Panel1: TPanel;
    MERA: TCurrencyEdit;
    SBLocAlu: TSpeedButton;
    QDadAlu: TQuery;
    Label2: TLabel;
    Label3: TLabel;
    Qconsalu: TQuery;
    Qconscur: TQuery;
    Qconsccl: TQuery;
    QCurSup: TQuery;
    LNomAlu: TLabel;
    SPACur1: TStoredProc;
    QLocalidade: TQuery;
    QNacional: TQuery;
    QObserv: TQuery;
    RA: TFloatField;
    SPACur1codhab: TSmallintField;
    SPACur1coddis: TIntegerField;
    SPACur1expression_3: TSmallintField;
    SPACur1expression_4: TSmallintField;
    QDocComprob: TQuery;
    QAdiciona: TQuery;
    QConsEq: TQuery;
    SPFicha: TStoredProc;
    QRFicha: TQuery;
    QObsCompl: TQuery;
    Panel2: TPanel;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    B_Finaliza: TBitBtn;
    CBEmissao: TCheckBox;
    DBLCBHab: TRxDBLookupCombo;
    MTHab: TMemoryTable;
    MTHabhab_Codigo: TSmallintField;
    MTHabHab_Nome: TStringField;
    LNomHab: TLabel;
    QConsAdi: TQuery;
    Qconshab: TQuery;
    DSHab: TDataSource;
    RGHist: TRadioGroup;
    ppDBPipeline1: TppDBPipeline;
    RHistor: TppReport;
    DBDisc: TppDetailBand;
    DBTNomDisc: TppDBText;
    FBHistor: TppFooterBand;
    DSFicha2: TDataSource;
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
    SCab: TppShape;
    LFac: TppLabel;
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
    LNomObs1: TppLabel;
    LNomObs2: TppLabel;
    LCurso: TppLabel;
    LHab: TppLabel;
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
    DSAdiciona: TDataSource;
    QAdicionaadi_nro: TSmallintField;
    QAdicionaalu_ra: TFloatField;
    QAdicionahab_codigo: TSmallintField;
    QAdicionaadi_nomdis: TStringField;
    QAdicionaadi_cghora: TSmallintField;
    QAdicionaadi_medfin: TStringField;
    QAdicionaadi_pfreq: TStringField;
    QAdicionaadi_codobs: TSmallintField;
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
    DSACur1: TDataSource;
    SPACur2: TStoredProc;
    IntegerField1: TIntegerField;
    SmallintField1: TSmallintField;
    SPACur2coddis: TIntegerField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    DSACur2: TDataSource;
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
    ppDetailBand1: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppShape14: TppShape;
    LCH: TppLabel;
    LnObs1: TppLine;
    LnObs2: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    HBHistor: TppHeaderBand;
    ppLabel13: TppLabel;
    ppShape16: TppShape;
    LDatNas: TppLabel;
    DSObsCompl: TDataSource;
    ppDBPipeline9: TppDBPipeline;
    SRObsCompl: TppSubReport;
    ppChildReport8: TppChildReport;
    SObs: TppShape;
    TBObsCompl: TppTitleBand;
    DBObsCompl: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    SObsCompl: TppShape;
    LnObs4: TppLine;
    LnObs3: TppLine;
    ppDBText6: TppDBText;
    LObsCompl: TppLabel;
    ppDBText7: TppDBText;
    ppLine58: TppLine;
    ppLine54: TppLine;
    ppLabel38: TppLabel;
    ppLine60: TppLine;
    ppLine61: TppLine;
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
    ppLine66: TppLine;
    ppShape40: TppShape;
    ppLabel47: TppLabel;
    LDatVest: TppLabel;
    ppLine67: TppLine;
    ppShape43: TppShape;
    LEntidade: TppLabel;
    ppLabel51: TppLabel;
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
    ppShape49: TppShape;
    ppLabel58: TppLabel;
    LDatReg2: TppLabel;
    ppShape51: TppShape;
    QEquival: TQuery;
    DSEquival: TDataSource;
    ppShape52: TppShape;
    ppLabel53: TppLabel;
    qconsccl2: TQuery;
    ppLine50: TppLine;
    QRFichatermo: TIntegerField;
    SBHistor: TppSummaryBand;
    LCidade2: TppLabel;
    QRFichahis_disequ: TIntegerField;
    ppLine36: TppLine;
    ppLine38: TppLine;
    LCabObs1: TppLabel;
    ppLine37: TppLine;
    LCabObs2: TppLabel;
    ppLine39: TppLine;
    ppLine40: TppLine;
    LCabObs3: TppLabel;
    ppLine41: TppLine;
    LNomObs3: TppLabel;
    LNomObs4: TppLabel;
    LPag: TppLabel;
    QAux: TQuery;
    QGradLet: TQuery;
    QCHAtiv: TQuery;
    QRFichagra_regime: TSmallintField;
    QRFichahis_codobs: TSmallintField;
    ch: TStringField;
    QAluHabEq: TQuery;
    QAdicionaadi_perlet: TIntegerField;
    ppShape20: TppShape;
    LDatConcl: TppLabel;
    ppLabel5: TppLabel;
    ppShape6: TppShape;
    LIngresso: TppLabel;
    ppLabel2: TppLabel;
    ppShape5: TppShape;
    LQualif: TppLabel;
    LTitQua: TppLabel;
    QRFichagra_anoter: TStringField;
    QRFichadis_controle: TSmallintField;
    QAdicionaadi_perchar: TStringField;
    QRFichacer_seq: TIntegerField;
    QCertif: TQuery;
    ppGroup2: TppGroup;
    GHBMod: TppGroupHeaderBand;
    GFBMod: TppGroupFooterBand;
    ppShape29: TppShape;
    LModulo: TppLabel;
    LNomMod: TppLabel;
    ppShape21: TppShape;
    LTotMod: TppLabel;
    ppLabel4: TppLabel;
    QRFicharfi_horas: TSmallintField;
    QAdicionahr: TSmallintField;
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
    LCompl: TppLabel;
    RGOrd: TRadioGroup;
    ppShape19: TppShape;
    LNasc: TppLabel;
    ppLabel14: TppLabel;
    ppShape17: TppShape;
    LLocNas: TppLabel;
    ppLabel15: TppLabel;
    ppShape42: TppShape;
    LTpPonto: TppLabel;
    LPontos: TppLabel;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    QEquivalequ_cghreal: TFloatField;
    QEquivalhr: TFloatField;
    LTotEst: TppLabel;
    QRFichagra_nordem2: TSmallintField;
    QRFichadco_complemento: TStringField;
    nomdisc: TStringField;
    Label10: TLabel;
    DEExp: TDateEdit;
    RGTipo: TRadioGroup;
    QRFichadco_periodo: TStringField;
    QAdicionaadi_chreal: TFloatField;
    LFinal: TppLine;
    MDFicha: TRxMemoryData;
    DSFicha: TDataSource;
    MDFichacer_seq: TIntegerField;
    MDFichadis_codigo: TIntegerField;
    MDFichahab_codigo: TSmallintField;
    MDFichach: TFloatField;
    MDFichaperlet: TStringField;
    MDFichasitfin: TStringField;
    MDFichaobs: TStringField;
    MDFichamedfin: TStringField;
    MDFichach2: TFloatField;
    MDFichanomdisc: TStringField;
    MDFichaalu_ra: TFloatField;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    MDFichachmask: TStringField;
    DBCTotAulas: TppDBCalc;
    DBCTotAulas2: TppDBCalc;
    DBCTotMod: TppDBCalc;
    DBCTotMod2: TppDBCalc;
    ppShape12: TppShape;
    LOrg: TppLabel;
    ppLabel11: TppLabel;
    LCPF: TppLabel;
    ppShape13: TppShape;
    ppLabel12: TppLabel;
    MDFichatermo: TStringField;
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
    ppRegion1: TppRegion;
    SRProf: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine18: TppLine;
    LCabProf: TppLabel;
    ppLine19: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText9: TppDBText;
    ppLine21: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppLine22: TppLine;
    QRFichahis_codtur: TStringField;
    ppDBPipeline3: TppDBPipeline;
    ppLine20: TppLine;
    MDProf: TRxMemoryData;
    DSProf: TDataSource;
    MDProfdis_codigo: TIntegerField;
    MDProfdis_nomdisc: TStringField;
    MDProffun_matr: TIntegerField;
    MDProftit_codigo: TSmallintField;
    MDProfpes_nome: TStringField;
    MDProftit_descricao: TStringField;
    MDProfhis_anoref: TSmallintField;
    MDProfhis_semref: TSmallintField;
    MDProfperiodo: TStringField;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    QRFichalab_turma: TSmallintField;
    ppRichView1: TppRichView;
    ppGroup3: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    MDFichachcursando: TFloatField;
    MDFichachacursar: TFloatField;
    MeuRest: TRestClient;
    QUsuDoc: TQuery;
    MDFichahis_anoref: TSmallintField;
    MDFichahis_semref: TSmallintField;
    MDFichadst_codmestre: TIntegerField;
    MDFichahis_codtur: TStringField;
    MDFichalab_turma: TSmallintField;
    QRFichadst_codmestre: TIntegerField;
    QGedArea: TQuery;
    LEndereco: TppLabel;
    CBAtualiza: TCheckBox;
    QItensLivDip: TQuery;
    QAdicionaadi_nomeprof: TStringField;
    QAdicionaadi_cpf: TFloatField;
    QAdicionatit_codigo: TSmallintField;
    QAdicionacur_anosem: TSmallintField;
    QAdicionatit_descricao: TStringField;
    LOriginal1: TppLabel;
    LPortaria1: TppLabel;
    LAssinante1: TppLabel;
    LCargo1: TppLabel;
    LOriginal2: TppLabel;
    LPortaria2: TppLabel;
    LCargo2: TppLabel;
    LAssinante2: TppLabel;
    ppShape2: TppShape;
    QAdicionatitulacao: TStringField;
    QHistoricoDigital: TQuery;
    CBValida: TCheckBox;
    ppRegion2: TppRegion;
    BarCode: Tpp2DBarCode;
    Memo: TppMemo;
    LCodVal: TppLabel;
    LHistorico: TppLabel;
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
    procedure B_FinalizaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBLocAluClick(Sender: TObject);
    procedure b_okClick(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure DBLCBHabExit(Sender: TObject);
    procedure DBLCBHabCloseUp(Sender: TObject);
    procedure DBLCBHabDropDown(Sender: TObject);
    procedure GHBHistorBeforePrint(Sender: TObject);
    procedure DBObsComplBeforePrint(Sender: TObject);
    procedure HBHistorBeforePrint(Sender: TObject);
    procedure GHBHistorAfterPrint(Sender: TObject);
    procedure DBObsBeforePrint(Sender: TObject);
    procedure DBObsAfterPrint(Sender: TObject);
    procedure RHistorStartSecondPass(Sender: TObject);
    procedure RHistorBeforePrint(Sender: TObject);
    procedure SBHistorBeforePrint(Sender: TObject);
    procedure TBObsAfterGenerate(Sender: TObject);
    procedure TBObs2AfterGenerate(Sender: TObject);
    procedure TBObsComplAfterGenerate(Sender: TObject);
    procedure QRFichaCalcFields(DataSet: TDataSet);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure GHBModBeforePrint(Sender: TObject);
    procedure GHBModAfterPrint(Sender: TObject);
    procedure GFBModBeforePrint(Sender: TObject);
    procedure GFBModAfterPrint(Sender: TObject);
    procedure QAdicionaCalcFields(DataSet: TDataSet);
    procedure QEquivalCalcFields(DataSet: TDataSet);
    procedure FBHistorBeforePrint(Sender: TObject);
    procedure DEExpExit(Sender: TObject);
    procedure RGTipoExit(Sender: TObject);
    procedure DBObs2BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBAtualizaClick(Sender: TObject);
  private
    vdia,vmes,vano,diafim,mesfim,vnota1,vnota2,ingresso,codobs:word;
    disp1,disp2,unico,lancado,cursando1,cursando2,cursou99,cabobs,prat_ens,disp3,disp4,imp_dados,imp_historico,achou_registro:boolean;
    totcarga,totcarga2,totmod,totmod2,totest,tothoras,percent_pres:real;
    historicoxml, historicopdf:integer;
    codvalhistorico, vdataAtual:string;
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
  FRHist9: TFRHist9;

implementation

Uses UMenupri, UProcs, UConsAlu, RestUtils, URotinas;

{$R *.DFM}

{ *************************************************************************************************************************************************** }

function TFRHist9.InicializaPasta(Pasta : String) : Boolean;
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

procedure TFRHist9.MERAEnter(Sender: TObject);
begin
  MERA.Clear;
  SBLocAlu.Enabled:=True;
  LNomAlu.Caption:='';
  LNomHab.Caption:='';
  CBEmissao.Visible:=False;
  B_Cancela.Enabled:=True;
  B_Ok.Enabled:=False;
  MTHab.EmptyTable;
  if vcompleta = 'S'
  then RGTipo.ItemIndex:=1
  else RGTipo.ItemIndex:=0;
  QConsAlu.Close;
  If vhdg_seq <> 0
  Then
   Begin
     QHistoricoDigital.Close;
     QHistoricoDigital.Sql.Clear;
     QHistoricoDigital.Sql.Add('select * from sca_historicodigital');
     QHistoricoDigital.Sql.Add('where hdg_seq =:seq');
     QHistoricoDigital.ParamByName('seq').AsInteger:=vhdg_seq;
     QHistoricoDigital.Open;
     If not QHistoricoDigital.Eof
     Then DEExp.Date:=QHistoricoDigital['hdg_dthistoricoxml']
     Else DEExp.Date:=DataSis;
   End
  Else
   If DEExp.Date = 0
   Then DEExp.Date:=DataSis;
  If vexibe = 'S'
  Then
   Begin
     vitl_seq:=0;
     vhdg_seq:=0;
   End;
end;

procedure TFRHist9.MERAExit(Sender: TObject);
var trcomum:boolean;
begin
 SBLocAlu.Enabled:=False;
 If (not b_finaliza.focused)
 Then
  If MERA.Text <> ''
  Then
   Begin
//    MERA.Text:=Alinha_RA(MERA.Text);
    qconsalu.close;
    qconsalu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    qconsalu.open;
    If not qconsalu.eof
    Then
     Begin
      LNomAlu.Caption:=qconsalu['pes_nome'];
      QGedArea.Close;
      QGedArea.Sql.Clear;
      QGedArea.Sql.Add('select * from sca_gedarea ga, ged_areas a');
      QGedArea.Sql.Add('where ga.are_codigo = a.are_codigo and cur_grapos =:grapos and cur_area =:area and cur_gradistancia =:gradistancia and cam_codigo =:campus and');
      If tipo_historico = 'F' // histórico escolar final do diploma
      Then QGedArea.Sql.Add('gat_tipo = "D"')
      Else QGedArea.Sql.Add('gat_tipo = "P"');
      QGedArea.ParambyName('grapos').AsSmallInt:=QConsAlu['cur_grapos'];
      QGedArea.ParambyName('area').AsSmallInt:=QConsAlu['cur_area'];
      QGedArea.ParambyName('gradistancia').AsString:=QConsAlu['cur_gradistancia'];
      QGedArea.ParambyName('campus').AsSmallInt:=QConsAlu['cam_codigo'];
      QGedArea.Open;
      If QGedArea.Eof
      Then
       Begin
         imp_historico:=false;
         if vexibemensagem = 'S' then
            MessageDlg('Não existe area do diploma definida no GED. Representação Visual do Histórico Escolar não pode ser gerada em formato PDF.',mtError,[mbok],0);
         If vexibe = 'S'
         Then MERA.Setfocus;
       End
      Else
       Begin
         If QConsAlu['cur_codigo'] <> 13 // Psicologia
         Then
          Begin
   //        If Valida_Usuario(qconsalu['cur_codigo'],0,0)
   //        Then
   //         Begin
             qconscur.close;
             qconscur.parambyname('codcur').assmallint:=qconsalu['cur_codigo'];
             qconscur.open;
             If qconscur.eof
             Then
              Begin
               QConsHab.Close;
               QConsHab.Sql.Clear;
               QConsHab.Sql.Add('select * from sca_habilitacao');
               QConsHab.Sql.Add('where hab_codigo = 1');
               QConsHab.Open;
               MTHab.Append;
               MTHab['hab_codigo']:=QConsHab['hab_codigo'];
               MTHab['hab_nome']:=QConsHab['hab_nomhb1'];
               MTHab.Post;
               DBLCBHab.Value:=MTHab['hab_codigo'];
               DBLCBHab.OnExit(Sender);
              End
             Else
              Begin
               trcomum:=false;
               QConsHab.Close;
               QConsHab.Sql.Clear;
               QConsHab.Sql.Add('select * from sca_habilitacao');
               QConsHab.Sql.Add('where cur_codigo =:codcur');
               QConsHab.Sql.Add('order by hab_codigo');
               QConsHab.ParamByName('codcur').AsSmallint:=qconsalu['cur_codigo'];
               QConsHab.Open;
               QConsHab.First;
               While not QConsHab.Eof do
               Begin
                 MTHab.Append;
                 If QConsHab['hab_ligacao'] = 1
                 Then trcomum:=true;
                 MTHab['hab_codigo']:=QConsHab['hab_codigo'];
                 MTHab['hab_nome']:=QConsHab['hab_nomhb1'];
                 MTHab.Post;
                 QConsHab.Next;
               End;
               If trcomum
               Then
                Begin
                 QConsHab.Close;
                 QConsHab.Sql.Clear;
                 QConsHab.Sql.Add('select * from sca_habilitacao');
                 QConsHab.Sql.Add('where hab_codigo = 1');
                 QConsHab.Open;
                 MTHab.Append;
                 MTHab['hab_codigo']:=QConsHab['hab_codigo'];
                 MTHab['hab_nome']:=QConsHab['hab_nomhb1'];
                 MTHab.Post;
                End;
               OrderBy(MTHab,['hab_codigo']);
               DBLCBHab.Value:=MTHab['hab_codigo'];
               If vexibe = 'S'
               Then
                Begin
                  DBLCBHab.SetFocus;
                  DBLCBHab.DropDown;
                End;
              End;
   //         End
   //        Else
   //         Begin
   //          MessageDlg('Usuário não tem permissão de emitir histórico escolar deste aluno!',mtError,[mbOk],0);
   //          MERA.SetFocus;
   //         End;
          End
         Else
          Begin
           imp_historico:=false;
           if vexibemensagem = 'S' then
              MessageDlg('Emissão da Representação Visual do Histórico de Psicologia não pode ser efetuada neste módulo!',mtError,[mbOk],0);
           If vexibe = 'S'
           Then MERA.SetFocus;
          End;
       End;
     End
    Else
     Begin
       imp_historico:=false;
       if vexibemensagem = 'S' then
          messagedlg('Registro Acadêmico Inválido !!!',mtError,[mbok],0);
       If vexibe = 'S'
       Then MERA.Setfocus;
     End;
   End
  Else
   If vexibe = 'S'
   Then MERA.SetFocus;
end;

procedure TFRHist9.B_FinalizaClick(Sender: TObject);
begin
  Close;
end;

procedure TFRHist9.FormActivate(Sender: TObject);
begin
//  LRecredenciamento.Caption:=vRecredenciamento;
  If vexibe = 'S'
  Then MERA.SetFocus;
end;

procedure TFRHist9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Muda_Impressora('HPA4');
  QRFicha.Close;
  QDadAlu.Close;
  qconsalu.close;
  qconscur.close;
  QNacional.Close;
  SPFicha.Close;
  qconsccl.close;
  qconsccl2.close;
  qconshab.close;
  QLocalidade.Close;
  QCurSup.Close;
  QEquival.Close;
  QObserv.Close;
  QConsEq.Close;
  QObsCompl.Close;
  QConsAdi.Close;
  QGradLet.Close;
  QCHAtiv.Close;
  QAluHabEq.Close;
end;

procedure TFRHist9.FormCreate(Sender: TObject);
var ErroConexao, NomeArquivoCompletoGED, NomeArquivoTemporario , retorno: String;
begin
    imp_historico:=true;
    CBAtualiza.Checked:=vGed = 'S';
    CBValida.Checked:=valida_historico = 'S';
    { Gerando pasta temporária }
    if not InicializaPasta(C_PASTA_TEMPORARIA)
       then begin
                if vexibemensagem = 'S' then
                   MessageDlg('Não foi possível gerar a pasta temporária. Verifique as permissões de gravação!',mtInformation,[mbOk],0);
                PostMessage(self.handle,wm_close,0,0);
                Exit;
            end;
            
//    if (ParamStr(1) = '') or (ParamStr(2) = '') {or (Paramstr(3) = '')} then
//      begin
//        MessageDlg('Esta aplicação depende dos parâmetros de inicialização (RA, Matrícula e CPF)!!!',MtInformation,[MbOk],0);
//        PostMessage(self.handle,wm_close,0,0);
//        Exit;
//      end;
//    RA := StrToFloat(OnlyNumber(ParamStr(1)));
//    Matricula := StrToInt(OnlyNumber(ParamStr(2)));
//    if (Paramstr(3) <> '') then
//      CPF:=StrToFloat(OnlyNumber(ParamStr(3)));

    { Verificando se usuário possui permissão de acesso: tabela ged_usu_area, are_codigo = 22 }
//    retorno:=AreasPermitidasPorUsuario(Matricula);

//    if (retorno <> '')
//       then begin
//                MessageDlg(retorno,mtError,[mbOk],0);
//                PostMessage(self.handle,wm_close,0,0);
//                Exit;
//            end;

//  LRecredenciamento.Caption:=vRecredenciamento;
  vdataAtual:=FormatDateTime('yyyy/mm/dd', DataSis);
  vdataAtual:=StringReplace(vdataAtual, '/','-',[rfIgnoreCase,rfReplaceAll]);
  imp_dados:=true;
  MTHab.Close;
  MTHab.Open;
  RGHist.ItemIndex:=0;
  Habilita_Ordem(RGOrd,vcodusu);
  If vexibe = 'N'
  Then
   Begin
     CBEmissao.Checked:=vligacao <> 0;
     MERAEnter(Sender);
     MERA.Text:=FloatToStr(vRA);
     MERAExit(Sender);
     DBLCBHab.Value:=IntToStr(vhab);
     DBLCBHabExit(Sender);
     b_okClick(Sender);
   End;
end;

procedure TFRHist9.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TFRHist9.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TFRHist9.SBLocAluClick(Sender: TObject);
begin
 Application.CreateForm(TFConsAlu, FConsAlu);
 FConsAlu.Hide;
 FConsAlu.ShowModal;
 If VRAcad <> 0
 Then
  Begin
   MERA.Text:=FloatToStr(VRAcad);
   Panel1.SetFocus;
  End;
 FConsAlu.Free;
end;

procedure TFRHist9.b_okClick(Sender: TObject);
var i,j,tot: word;
    grava, assinado, erro:boolean;
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
begin
 percent_pres:=0;
 DBTNomDisc.Font.Size:=vtamfontdisc;
 LAssinante1.Caption:='';
 LCargo1.Caption:='';
 LAssinante2.Caption:='';
 LCargo2.Caption:='';
 LOriginal1.Visible:=false;
 LPortaria1.Visible:=false;
 LOriginal2.Visible:=false;
 LPortaria2.Visible:=false;

 If (CBAtualiza.Checked) or (CBValida.Checked)
 Then valida_historico:='S'
 Else valida_historico:='N';

 achou_registro:=false;
 historicoxml:=0;
 historicopdf:=0;
 codvalhistorico:='';
 If (vexibe = 'S') or ((vexibe <> 'S') and (imp_historico))
 Then
  Begin
    If tipo_historico = 'F' // histórico escolar final do registro do diploma
    Then
     Begin
       QItensLivDip.Close;
       QItensLivDip.Sql.Clear;
       QItensLivDip.Sql.Add('select * from sca_itenslivdip');
       If vexibe = 'S'
       Then
        Begin
          If vitl_seq = 0
          Then
           Begin
             QItensLivDip.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and srd_codigo <> 2');
             QItensLivDip.Sql.Add('order by itl_seq desc');
             QItensLivDip.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
             QItensLivDip.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
             QItensLivDip.Open;
             vitl_seq:=NULLToZero(QItensLivDip['itl_seq']);
           End
          Else
           Begin
             QItensLivDip.Sql.Add('where itl_seq =:seq');
             QItensLivDip.ParamByName('seq').AsInteger:=vitl_seq;
             QItensLivDip.Open;
           End;
        End
       Else
        Begin
          QItensLivDip.Sql.Add('where itl_seq =:seq');
          QItensLivDip.ParamByName('seq').AsInteger:=vitl_seq;
          QItensLivDip.Open;
        End;
       achou_registro:=not QItensLivDip.Eof;
       historicoxml:=NULLToZero(QItensLivDip['itl_historicoxml']);
       historicopdf:=NULLToZero(QItensLivDip['itl_historicopdf']);
       codvalhistorico:=NULLToSpace(QItensLivDip['itl_codvalhistorico']);
     End
    Else
     Begin
       QHistoricoDigital.Close;
       QHistoricoDigital.Sql.Clear;
       QHistoricoDigital.Sql.Add('select * from sca_historicodigital');
       If vexibe = 'S'
       Then
        Begin
          If vhdg_seq = 0
          Then
           Begin
             QHistoricoDigital.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and hdg_ativo = "S"');
             QHistoricoDigital.Sql.Add('order by hdg_seq desc');
             QHistoricoDigital.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
             QHistoricoDigital.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
             QHistoricoDigital.Open;
             vhdg_seq:=NULLToZero(QHistoricoDigital['hdg_seq']);
           End
          Else
           Begin
             QHistoricoDigital.Sql.Add('where hdg_seq =:seq');
             QHistoricoDigital.ParamByName('seq').AsInteger:=vhdg_seq;
             QHistoricoDigital.Open;
           End;
        End
       Else
        Begin
          QHistoricoDigital.Sql.Add('where hdg_seq =:seq');
          QHistoricoDigital.ParamByName('seq').AsInteger:=vhdg_seq;
          QHistoricoDigital.Open;
        End;
       achou_registro:=not QHistoricoDigital.Eof;
       historicoxml:=NULLToZero(QHistoricoDigital['hdg_historicoxml']);
       If historico_conferencia = 'S'
       Then historicopdf:=NULLToZero(QHistoricoDigital['hdg_historicoconf'])
       Else historicopdf:=NULLToZero(QHistoricoDigital['hdg_historicopdf']);
       codvalhistorico:=NULLToSpace(QHistoricoDigital['hdg_codvalidacao']);
     End;

    grava:=false;
    LCabProf.Caption:=vcabprof;
    B_Cancela.Enabled:=False;
    B_Ok.Enabled:=False;
    If vexibe = 'S'
    Then Panel2.SetFocus;
    unico:=true;
    disp3:=false;

    //Carrega_Ficha_Escolar(109800699,1);
    Dados_Registro(QDadAlu);
    QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    QDadAlu.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
    QDadAlu.Open;
    If QDadAlu.Eof
    Then
     Begin
       Dados_Aluno(QDadAlu);
       QDadAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
       QDadAlu.Open;
     End;
    If CBEmissao.Checked
    Then unico:=false;
    FRHist9.Enabled:=False;
    Try
      Menuprin.Database1.StartTransaction;
      If not unico
      Then
       Begin
        QAdiciona.Close;
        QAdiciona.Sql.Clear;
        QAdiciona.Sql.Add('Select *, decode(a.tit_codigo,5,"DOUTOR",10,"DOUTOR",t.tit_descricao) titulacao from sca_adicionais a, sca_alunos al, sca_cursos c, outer sca_titulacao t');
        QAdiciona.Sql.Add('where a.tit_codigo = t.tit_codigo and a.alu_ra = al.alu_ra and al.cur_codigo = c.cur_codigo and');
        QAdiciona.Sql.Add('      a.alu_ra =:ra and (hab_codigo =:hab1 or hab_codigo =:hab2)');
        QAdiciona.Sql.Add('order by hab_codigo,adi_nro');
        QAdiciona.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QAdiciona.ParamByName('hab1').assmallint:=StrToInt(DBLCBHab.Value);
        QAdiciona.ParamByName('hab2').assmallint:=qconshab['hab_ligacao'];
        QAdiciona.Open;

        QAluHabEq.Close;
        QAluHabEq.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QAluHabEq.ParamByName('codhab').AsSmallInt:=StrToInt(DBLCBHab.Value);
        QAluHabEq.Open;
        If not QAluHabEq.Eof
        Then disp3:=true;
        qconsccl2.close;
        qconsccl2.parambyname('hab').assmallint:=qconshab['hab_ligacao'];
        qconsccl2.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        qconsccl2.open;
        SPFicha.Close;
        SPFicha.Params[0].AsFloat:=StrToFloat(Trim(MERA.Text));
        SPFicha.Params[1].AsSmallInt:=qconshab['hab_ligacao'];
        If RGTipo.ItemIndex = 0  // Normal
        Then SPFicha.Params[2].AsString:='*'
        Else SPFicha.Params[2].AsString:='R';
        SPFicha.ExecProc;
        SPFicha.Close;
        SPFicha.Params[0].AsFloat:=StrToFloat(Trim(MERA.Text));
        SPFicha.Params[1].AsSmallInt:=StrToInt(DBLCBHab.Value);
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
        If RGOrd.ItemIndex = 0
        Then QRFicha.Sql.Add('order by hab_codigo,gra_nordem,his_sequencia')
        Else QRFicha.Sql.Add('order by gra_nordem2,hab_codigo,his_sequencia');
        QRFicha.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QRFicha.Open;
        Total_Atividades(unico,QDadAlu,QConsHab,qconsccl,qconsccl2,QGradLet);

        if vsegundavia = 'N' then
           Carrega_Professores_Historico_Geral(StrToFloat(Trim(MERA.Text)),QDadAlu['cur_codigo'],RGOrd.ItemIndex,MDProf,QAdiciona,valida_historico,StrToInt(DBLCBHab.Value));

        QAux.Close;
        QAux.Sql.Clear;
        QAux.Sql.Add('Delete from sca_rficha');
        QAux.Sql.Add('where alu_ra =:ra');
        QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QAux.ExecSql;
       End
      Else
       Begin
        QAdiciona.Close;
        QAdiciona.Sql.Clear;
        QAdiciona.Sql.Add('Select *, decode(a.tit_codigo,5,"DOUTOR",10,"DOUTOR",t.tit_descricao) titulacao from sca_adicionais a, sca_alunos al, sca_cursos c, outer sca_titulacao t');
        QAdiciona.Sql.Add('where a.tit_codigo = t.tit_codigo and a.alu_ra = al.alu_ra and al.cur_codigo = c.cur_codigo and');
        QAdiciona.Sql.Add('      a.alu_ra =:ra and hab_codigo =:codhab');
        QAdiciona.Sql.Add('order by adi_nro');
        QAdiciona.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QAdiciona.ParamByName('codhab').assmallint:=StrToInt(DBLCBHab.Value);
        QAdiciona.Open;

        SPFicha.Close;
        SPFicha.Params[0].AsFloat:=StrToFloat(Trim(MERA.Text));
        SPFicha.Params[1].AsSmallInt:=StrToInt(DBLCBHab.Value);
        If RGTipo.ItemIndex = 0  // Normal
        Then SPFicha.Params[2].AsString:='*'
        Else SPFicha.Params[2].AsString:='R';
        SPFicha.ExecProc;
        SPFicha.Close;
        QRFicha.Close;
        QRFicha.Sql.Clear;
        QRFicha.Sql.Add('Select * from sca_rficha');
        QRFicha.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and');
        QRFicha.Sql.Add('his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10');
        If RGOrd.ItemIndex = 0
        Then QRFicha.Sql.Add('order by gra_nordem,his_sequencia')
        Else QRFicha.Sql.Add('order by gra_nordem2,his_sequencia');
        QRFicha.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QRFicha.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
        QRFicha.Open;
        Total_Atividades(unico,QDadAlu,QConsHab,qconsccl,qconsccl2,QGradLet);

        If (QConsAlu['cur_codigo'] = 975) and (qconsccl['ahb_conclusao'] <> Null) // se o aluno concluiu o curso de Biomedicina EAD, é necessário adicionar uma observação com o percentual de carga horária presencial
        Then percent_pres:=Calcula_Percentual_BioEAD(StrToFloat(Trim(MERA.Text)),StrToInt(DBLCBHab.Value),NULLToZero(QGradLet['totativ']));

        if vsegundavia = 'N' then
           Carrega_Professores_Historico_Geral(StrToFloat(Trim(MERA.Text)),QDadAlu['cur_codigo'],RGOrd.ItemIndex,MDProf,QAdiciona,valida_historico,StrToInt(DBLCBHab.Value));

        QAux.Close;
        QAux.Sql.Clear;
        QAux.Sql.Add('Delete from sca_rficha');
        QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
        QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
        QAux.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
        QAux.ExecSql;
       End;
      totcarga:=0;
      tothoras:=0;
      totcarga2:=0;
      totest:=0;
      disp1:=false;
      disp2:=false;
      disp4:=false;
      codobs:=0;
      lancado:=false;
      cursando1:=false;cursando2:=false;
      vnota1:=0;vnota2:=0;
      cursou99:=false;
    //  prat_ens:=false;
      FBHistor.Height:=0.26;
//      LContinua2.Top:=0.0625;
      If QDadAlu['cur_area'] = 1 // Ensino Médio
      Then RHistor.PrinterSetUp.MarginBottom:=0.12
      Else RHistor.PrinterSetUp.MarginBottom:=0.25;
    //  RHistor.Language:=lgPortugueseBrazil;
      Carrega_Historico(QRFicha, QDadAlu, QConsHab, QAluHabEq, QGradLet, qconsccl, QCHAtiv, QEquival, QAdiciona, MDFicha,
                        disp3, cursando1, cursando2, lancado, disp1, disp2, disp4, cursou99, imp_dados, codobs, vnota1, vnota2, totest, false, false);

      LEndereco.Font.Color := RGB(0, 107, 52);
      LEndereco2.Font.Color := RGB(0, 107, 52);
      If (qconsalu['cam_codigo'] = 1) or (qconsalu['cam_codigo'] = 4) // Presidente Prudente ou Venceslau
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

      If rvhe
      Then
       Begin
         If ((CBAtualiza.Checked) and (achou_registro)) or (historico_conferencia = 'S') // (not QItensLivDip.Eof) // vGED = 'S' e retornou o registro do aluno
         Then
          Begin
            ListadePastas:=RetornarPastasPorConteudoDoCampo(QGedArea['are_codigo'],13,QConsAlu['alu_ra']);
            if ListadePastas = nil then
            begin
              pastaNova:=CriarNovaPasta(QGedArea['are_codigo'],vcodusu,QConsAlu,qconsccl);
              ListadePastas:=TObjectList.Create();
              ListadePastas.Add(pastaNova);
            end;

            assinado:=false;
            doc_codigo:=0;
            status:=0;
            if (historicoxml <> 0) then // QItensLivDip['itl_historicoxml'] <> null then // arquivo xml já foi gerado, verificar se foi assinado
            begin
              Assinaturas:=TObjectList.Create;
              //Assinaturas:=ObterTodasPorDocumento(QItensLivDip['itl_historicoxml']);
              Assinaturas:=ObterTodasPorDocumento(historicoxml);
              if (Assinaturas <> nil) and (Assinaturas.Count <> 0)
              then
               Begin
                 for i:=0 to Assinaturas.Count-1 do
                 begin
                   docAssinaturas:=DocAssinaturasViewModel(Assinaturas.Items[i]);
                   if (docAssinaturas.ass_status = 3) and (tipo_historico = 'F') then // assinado e histórico final (apresentação das assinaturas é diferente do histórico parcial)
                   begin
                      if docAssinaturas.ass_assinaturarvdd <> null  then
                      begin
                        case docAssinaturas.ass_assinaturarvdd of
                          1:begin // assinatura esquerda
                              LOriginal1.Visible:=true;
                              LPortaria1.Visible:=true;
                              QAux.Close;
                              QAux.Sql.Clear;
                              QAux.Sql.Add('select * from crp_usuarios u, crp_pessoas p, outer sca_professor pr');
                              QAux.Sql.Add('where u.pes_nro = p.pes_nro and usr_login = to_char(pr.fun_matr) and usr_id =:id');
                              QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                              QAux.Open;
                              LAssinante1.Caption:=NULLToSpace(QAux['pes_nome']);
                              QAux.Close;
                              QAux.Sql.Clear;
                              QAux.Sql.Add('select ud.* from sca_usudocxml ud, crp_usuarios u');
                              QAux.Sql.Add('where to_char(ud.fun_matr) = u.usr_login and usr_id =:id and dxm_assinatura =:assinatura');
                              QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                              QAux.ParambyName('assinatura').AsSmallInt:=docAssinaturas.ass_assinaturarvdd;
                              QAux.Open;
                              LCargo1.Caption:=NULLToSpace(QAux['dxm_cargo']);
                            end;
                          2:begin // assinatura direita
                              LOriginal2.Visible:=true;
                              LPortaria2.Visible:=true;
                              QAux.Close;
                              QAux.Sql.Clear;
                              QAux.Sql.Add('select * from crp_usuarios u, crp_pessoas p, outer sca_professor pr');
                              QAux.Sql.Add('where u.pes_nro = p.pes_nro and usr_login = to_char(pr.fun_matr) and usr_id =:id');
                              QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                              QAux.Open;
                              LAssinante2.Caption:=NULLToSpace(QAux['pes_nome']);
                              QAux.Close;
                              QAux.Sql.Clear;
                              QAux.Sql.Add('select ud.* from sca_usudocxml ud, crp_usuarios u');
                              QAux.Sql.Add('where to_char(ud.fun_matr) = u.usr_login and usr_id =:id and dxm_assinatura =:assinatura');
                              QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                              QAux.ParambyName('assinatura').AsSmallInt:=docAssinaturas.ass_assinaturarvdd;
                              QAux.Open;
                              LCargo2.Caption:=NULLToSpace(QAux['dxm_cargo']);
                            end;
                        end;
                      end;
                      assinado:=true;
                   end
                   else
                    if (docAssinaturas.ass_status = 4) or (docAssinaturas.ass_status = 6) then // rejeitado ou cancelado
                       assinado:=false;
                   status:=docAssinaturas.ass_status;
                 end;
               End;
              Assinaturas.Free;
            end;

            If (status <> 3) and (historico_conferencia = 'N') // arquivo xml ainda não foi totalmente assinado
            Then
             Begin
               If MenuPrin.Database1.Intransaction
               Then MenuPrin.Database1.Rollback;
               if vexibemensagem = 'S' then
                  MessageDlg('Histórico Escolar Digital do(a) aluno(a) '+QDadAlu['pes_nome']+ ' ainda não foi totalmente assinado. Representação Visual não pode ser gerada!',mtError,[mbok],0);
             End
            Else
             Begin
               RHistor.AllowPrintToFile := True;
               RHistor.ShowPrintDialog := False;
               RHistor.ShowCancelDialog := False;
               If tipo_historico = 'F' // histórico escolar final do registro do diploma
               Then RHistor.TextFileName := C_PASTA_TEMPORARIA+'\RVHE_'+IntToStr(vitl_seq)+'.PDF'
               Else
                If historico_conferencia = 'S'
                Then RHistor.TextFileName := C_PASTA_TEMPORARIA+'\RVHECONFERENCIA_'+vdataAtual+'.PDF'
                Else RHistor.TextFileName := C_PASTA_TEMPORARIA+'\RVHEPARCIAL_'+IntToStr(vhdg_seq)+'.PDF';
               RHistor.DeviceType := 'PDFA';
           //     Menuprin.Database1.Connected := False;
               RHistor.Print;
               grava:=true;

               pastaEDocumentos:=PastaEDocumentosViewModel.Create();
               pastaEDocumentos.Pasta:=PastaViewModel(ListadePastas.Items[0]);

               if historicopdf = 0 then
               begin
                 docaux:=DocumentosViewModel.Create();
                 If (tipo_historico = 'F')
                 Then docaux:=BuscarDocumentoPorNome(pastaeDocumentos.Pasta.pst_codigo,'RVHE_' + IntToStr(vitl_seq),'PDF')
                 else
                  If historico_conferencia = 'S'
                  Then docaux:=BuscarDocumentoPorNome(pastaeDocumentos.Pasta.pst_codigo,'RVHECONFERENCIA_'+vdataAtual,'PDF')
                  Else docaux:=BuscarDocumentoPorNome(pastaeDocumentos.Pasta.pst_codigo,'RVHEPARCIAL_' + IntToStr(vhdg_seq),'PDF');
                 if docaux <> nil then
                    historicopdf:=docaux.doc_codigo;
                 docaux.free;
               end;

               documento:=DocumentosViewModel.Create();
               //documento.doc_codigo:=NULLToZero(QItensLivDip['itl_historicopdf']);
               documento.doc_codigo:=historicopdf;
               documento.fun_matr:=vcodusu;
               documento.pst_codigo:=pastaeDocumentos.Pasta.pst_codigo;
               documento.doc_nivelprocesso:='I';
               documento.doc_dataarm:=DelphiDateTimeToISO8601Date(Pega_DataHora);
               documento.doc_extarq:='PDF';
               documento.tdo_seq:=74;
               documento.aut_seq:=1;
               documento.loc_seq:=1; // Campus I
               documento.doc_assunto:=NULLToSpace(QGedArea['are_descr']);
               If tipo_historico = 'F' // histórico escolar final do registro do diploma
               Then
                Begin
                  documento.doc_nomearquivo:='RVHE_' + IntToStr(vitl_seq) + '.PDF';
                  documento.doc_titulo:='RVHE_' + IntToStr(vitl_seq);
                  documento.doc_arquivo:=vPastaServidor + IntToStr(pastaEDocumentos.Pasta.are_codigo) + '\' +
                  IntToStr(pastaEDocumentos.Pasta.pst_codigo) + '\pdf\RVHE_' + IntToStr(vitl_seq) + '.PDF';
                  docbase64:=EncodeFile(C_PASTA_TEMPORARIA+'\RVHE_'+IntToStr(vitl_seq)+'.PDF');
                  FileToBytes(C_PASTA_TEMPORARIA+'\RVHE_'+IntToStr(vitl_seq)+'.PDF', arquivoBytes);
                  documento.doc_usanodiploma:='S';
                End
               Else
                If historico_conferencia = 'S'
                Then
                 Begin
                   documento.doc_nomearquivo:='RVHECONFERENCIA_'+vdataAtual+'.PDF';
                   documento.doc_titulo:='RVHECONFERENCIA_'+vdataAtual;
                   documento.doc_arquivo:=vPastaServidor + IntToStr(pastaEDocumentos.Pasta.are_codigo) + '\' +
                   IntToStr(pastaEDocumentos.Pasta.pst_codigo) + '\pdf\RVHECONFERENCIA_'+vdataAtual+'.PDF';
                   docbase64:=EncodeFile(C_PASTA_TEMPORARIA+'\RVHECONFERENCIA_'+vdataAtual+'.PDF');
                   FileToBytes(C_PASTA_TEMPORARIA+'\RVHECONFERENCIA_'+vdataAtual+'.PDF', arquivoBytes);
                   documento.doc_usanodiploma:='N';
                 End
                Else
                 Begin
                   documento.doc_nomearquivo:='RVHEPARCIAL_' + IntToStr(vhdg_seq) + '.PDF';
                   documento.doc_titulo:='RVHEPARCIAL_' + IntToStr(vhdg_seq);
                   documento.doc_arquivo:=vPastaServidor + IntToStr(pastaEDocumentos.Pasta.are_codigo) + '\' +
                   IntToStr(pastaEDocumentos.Pasta.pst_codigo) + '\pdf\RVHEPARCIAL_' + IntToStr(vhdg_seq) + '.PDF';
                   docbase64:=EncodeFile(C_PASTA_TEMPORARIA+'\RVHEPARCIAL_'+IntToStr(vhdg_seq)+'.PDF');
                   FileToBytes(C_PASTA_TEMPORARIA+'\RVHEPARCIAL_'+IntToStr(vhdg_seq)+'.PDF', arquivoBytes);
                   documento.doc_usanodiploma:='N';
                 End;
               documento.doc_ativo:='S';
               imagem:=ImagensViewModel.Create();
               imagem.doc_imagemstr:=docbase64;
               documento.doc_tamanho:= Length(arquivoBytes);
               imagem.doc_imagem:=arquivoBytes;

               documento.imagens:=imagem;

   {            if (status = 0) or (status = 4) or (status = 6) then // se não tiver fluxo ou rejeitado ou cancelado
               Begin
                 QUsuDoc.Close;
                 QUsuDoc.Sql.Clear;
                 QUsuDoc.Sql.Add('select * from sca_usudocxml u, drh_funcionarios f, ged_certificados c, crp_tipousuario tu, crp_usuarios usr');
                 QUsuDoc.Sql.Add('where u.fun_matr = f.fun_matr and u.cer_id = c.cer_id and u.tpu_seq = tu.tpu_seq and to_char(u.fun_matr) = usr.usr_login and');
                 QUsuDoc.Sql.Add('      u.dxm_codigo = 1 order by dxm_ordem');
                 QUsuDoc.Open;
                 if not QUsuDoc.Eof then
                 Begin
                   while not QUsuDoc.Eof do
                   Begin
                     docAssinaturas:=DocAssinaturasViewModel.Create();
                     docAssinaturas.ass_data:=DelphiDateTimeToISO8601Date(Pega_DataHora);
                     DocAssinaturas.ass_ordem:=QUsuDoc['dxm_ordem'];
                     DocAssinaturas.ass_fluxocompart:=QUsuDoc['dxm_compartilhado'];
                     DocAssinaturas.ass_fluxonivel:=QUsuDoc['dxm_nivel'];
                     if (QUsuDoc['dxm_nivel'] = 1)
                     then
                      begin
                        if (QUsuDoc['dxm_ordem'] = 1) or (QUsuDoc['dxm_compartilhado'] = 'S')
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
               End;}

               pastaEDocumentos.Documentos.Add(documento);

               retorno:=Atualizar_Documentos_Fluxo_Pasta_PastaValCampo(pastaEDocumentos);

               if (tipo_historico = 'F') then
               begin
                 documento:=BuscarDocumentoPorNome(retorno.Pasta.pst_codigo,'RVHE_' + IntToStr(vitl_seq),'PDF');
                 If (achou_registro)
                 Then
                  Begin
                    QItensLivDip.Edit;
                    QItensLivDip['itl_historicopdf']:=documento.doc_codigo;
                    QItensLivDip['itl_dthistoricopdf']:=Pega_DataHora();
                    QItensLivDip.Post;
                  End;
               end
               else
                If historico_conferencia = 'S'
                Then documento:=BuscarDocumentoPorNome(retorno.Pasta.pst_codigo,'RVHECONFERENCIA_'+vdataAtual,'PDF')
                Else documento:=BuscarDocumentoPorNome(retorno.Pasta.pst_codigo,'RVHEPARCIAL_' + IntToStr(vhdg_seq),'PDF');

               QHistoricoDigital.Close;
               QHistoricoDigital.Sql.Clear;
               QHistoricoDigital.Sql.Add('select * from sca_historicodigital');
               QHistoricoDigital.Sql.Add('where hdg_historicoxml =:doc');
               //QHistoricoDigital.ParambyName('doc').AsInteger:=QItensLivDip['itl_historicoxml'];
               QHistoricoDigital.ParambyName('doc').AsInteger:=historicoxml;
               QHistoricoDigital.Open;
               if not QHistoricoDigital.Eof then
               begin
                 QAux.Close;
                 QAux.Sql.Clear;
                 QAux.Sql.Add('update sca_historicodigital set hdg_ativo = "N"');
                 QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and hdg_seq <>:seq and hdg_diploma = "N"');
                 QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                 QAux.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
                 QAux.ParamByName('seq').AsInteger:=QHistoricoDigital['hdg_seq'];
                 QAux.ExecSQL;

                 QHistoricoDigital.Edit;
                 If historico_conferencia = 'S'
                 Then
                  Begin
                    QHistoricoDigital['hdg_historicoconf']:=documento.doc_codigo;
                    QHistoricoDigital['hdg_dthistoricoconf']:=Pega_DataHora();
                    QHistoricoDigital['fun_historicoconf']:=vcodusu;
                  End
                 Else
                  Begin
                    QHistoricoDigital['hdg_historicopdf']:=documento.doc_codigo;
                    QHistoricoDigital['hdg_dthistoricopdf']:=Pega_DataHora();
                    QHistoricoDigital['fun_historicopdf']:=vcodusu;
                  End;
                 QHistoricoDigital.Post;
               end;

               pastaEDocumentos.Free;
               retorno.Free;
               documento.Free;

               // Abrindo com a tela minimizada
               If vexibemensagem = 'S'
               Then
                If tipo_historico = 'F' // histórico escolar final do registro do diploma
                Then OpenPDF(C_PASTA_TEMPORARIA+'\RVHE_'+IntToStr(vitl_seq)+'.PDF', SW_MINIMIZE)
                Else
                 If historico_conferencia = 'S'
                 Then OpenPDF(C_PASTA_TEMPORARIA+'\RVHECONFERENCIA_'+vdataAtual+'.PDF', SW_MINIMIZE)
                 Else OpenPDF(C_PASTA_TEMPORARIA+'\RVHEPARCIAL_'+IntToStr(vhdg_seq)+'.PDF', SW_MINIMIZE);
             End;
          End
         Else
          Begin
            if achou_registro then // not QItensLivDip.Eof then
            begin
              if (historicoxml <> 0) then // QItensLivDip['itl_historicoxml'] <> null then // arquivo xml já foi gerado, verificar se foi assinado
              begin
                Assinaturas:=TObjectList.Create;
                //Assinaturas:=ObterTodasPorDocumento(QItensLivDip['itl_historicoxml']);
                Assinaturas:=ObterTodasPorDocumento(historicoxml);
                if (Assinaturas <> nil) and (Assinaturas.Count <> 0)
                then
                 Begin
                   for i:=0 to Assinaturas.Count-1 do
                   begin
                     docAssinaturas:=DocAssinaturasViewModel(Assinaturas.Items[i]);
                     if (docAssinaturas.ass_status = 3) and (tipo_historico = 'F') then // assinado e histórico final (apresentação das assinaturas é diferente do histórico parcial)
                     begin
                        if docAssinaturas.ass_assinaturarvdd <> null  then
                        begin
                          case docAssinaturas.ass_assinaturarvdd of
                            1:begin // assinatura esquerda
                                LOriginal1.Visible:=true;
                                LPortaria1.Visible:=true;
                                QAux.Close;
                                QAux.Sql.Clear;
                                QAux.Sql.Add('select * from crp_usuarios u, crp_pessoas p, outer sca_professor pr');
                                QAux.Sql.Add('where u.pes_nro = p.pes_nro and usr_login = to_char(pr.fun_matr) and usr_id =:id');
                                QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                                QAux.Open;
                                LAssinante1.Caption:=NULLToSpace(QAux['pes_nome']);
                                QAux.Close;
                                QAux.Sql.Clear;
                                QAux.Sql.Add('select ud.* from sca_usudocxml ud, crp_usuarios u');
                                QAux.Sql.Add('where to_char(ud.fun_matr) = u.usr_login and usr_id =:id and dxm_assinatura =:assinatura');
                                QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                                QAux.ParambyName('assinatura').AsSmallInt:=docAssinaturas.ass_assinaturarvdd;
                                QAux.Open;
                                LCargo1.Caption:=NULLToSpace(QAux['dxm_cargo']);
                              end;
                            2:begin // assinatura direita
                                LOriginal2.Visible:=true;
                                LPortaria2.Visible:=true;
                                QAux.Close;
                                QAux.Sql.Clear;
                                QAux.Sql.Add('select * from crp_usuarios u, crp_pessoas p, outer sca_professor pr');
                                QAux.Sql.Add('where u.pes_nro = p.pes_nro and usr_login = to_char(pr.fun_matr) and usr_id =:id');
                                QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                                QAux.Open;
                                LAssinante2.Caption:=NULLToSpace(QAux['pes_nome']);
                                QAux.Close;
                                QAux.Sql.Clear;
                                QAux.Sql.Add('select ud.* from sca_usudocxml ud, crp_usuarios u');
                                QAux.Sql.Add('where to_char(ud.fun_matr) = u.usr_login and usr_id =:id and dxm_assinatura =:assinatura');
                                QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                                QAux.ParambyName('assinatura').AsSmallInt:=docAssinaturas.ass_assinaturarvdd;
                                QAux.Open;
                                LCargo2.Caption:=NULLToSpace(QAux['dxm_cargo']);
                              end;
                          end;
                        end;
                     end;
                   end;
                 End;
                Assinaturas.Free;
              end;
            end;

            RHistor.AllowPrintToFile := True;
            RHistor.ShowPrintDialog := False;
            RHistor.ShowCancelDialog := False;
            If tipo_historico = 'F' // histórico escolar final do registro do diploma
            Then RHistor.TextFileName := C_PASTA_TEMPORARIA+'\RVHETEMP_'+IntToStr(vitl_seq)+'.PDF'
            Else
             If historico_conferencia = 'S'
             Then RHistor.TextFileName := C_PASTA_TEMPORARIA+'\RVHECONFERENCIATEMP_'+vdataAtual+'.PDF'
             Else RHistor.TextFileName := C_PASTA_TEMPORARIA+'\RVHEPARCIALTEMP_'+IntToStr(vhdg_seq)+'.PDF';
            RHistor.DeviceType := 'PDFA';
        //     Menuprin.Database1.Connected := False;
            RHistor.Print;

            // Abrindo com a tela maximizada
            If vexibemensagem = 'S'
            Then
             If tipo_historico = 'F' // histórico escolar final do registro do diploma
             Then OpenPDF(C_PASTA_TEMPORARIA+'\RVHETEMP_'+IntToStr(vitl_seq)+'.PDF', SW_MAXIMIZE)
             Else
              If historico_conferencia = 'S'
              Then OpenPDF(C_PASTA_TEMPORARIA+'\RVHECONFERENCIATEMP_'+vdataAtual+'.PDF', SW_MAXIMIZE)
              Else OpenPDF(C_PASTA_TEMPORARIA+'\RVHEPARCIALTEMP_'+IntToStr(vhdg_seq)+'.PDF', SW_MAXIMIZE);
          End;
       End
      Else
       Begin
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
            QAux.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
            QAux.Open;
            assinado:=false;
            doc_codigo:=0;
            status:=0;
            if not QAux.Eof then // documento foi gerado, verificar se foi assinado
            begin
              doc_codigo:=QAux['doc_codigo'];
              Assinaturas:=TObjectList.Create;
              Assinaturas:=ObterTodasPorDocumento(QAux['doc_codigo']);
              if (Assinaturas <> nil) and (Assinaturas.Count <> 0)
              then
               Begin
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
               End;
              Assinaturas.Free;
            end
            else // verificar se o documento já existe
            begin
               docaux:=DocumentosViewModel.Create();
               docaux:=BuscarDocumentoPorNome(PastaViewModel(ListadePastas.Items[0]).pst_codigo,'HISTORICODC_' + IntToStr(vitl_seq),'PDF');
               if docaux <> nil then
                  doc_codigo:=docaux.doc_codigo;
               docaux.free;
            end;

            If (status <> 0) and (status <> 4) and (status <> 6) // documento não foi gerado ou não teve assinatura rejeitada ou cancelada
            Then
             Begin
               If MenuPrin.Database1.Intransaction
               Then MenuPrin.Database1.Rollback;
               if vexibemensagem = 'S' then
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
           //     Menuprin.Database1.Connected := False;
               RHistor.Print;
               grava:=true;

               pastaEDocumentos:=PastaEDocumentosViewModel.Create();
               pastaEDocumentos.Pasta:=PastaViewModel(ListadePastas.Items[0]);
               documento:=DocumentosViewModel.Create();
               documento.doc_codigo:=doc_codigo; // NULLToZero(QAux['doc_codigo']);
               documento.fun_matr:=vcodusu;
               documento.pst_codigo:=pastaeDocumentos.Pasta.pst_codigo;
               documento.doc_nivelprocesso:='I';
               documento.doc_dataarm:=DelphiDateTimeToISO8601Date(Pega_DataHora);
               documento.doc_extarq :='PDF';
               documento.doc_nomearquivo:='HISTORICODC_' + IntToStr(vitl_seq) + '.PDF';
               documento.doc_titulo:='HISTORICODC_' + IntToStr(vitl_seq);
               documento.doc_arquivo:=vPastaServidor + IntToStr(pastaEDocumentos.Pasta.are_codigo) + '\' + IntToStr(pastaEDocumentos.Pasta.pst_codigo) + '\pdf\HISTORICODC_' + IntToStr(vitl_seq) + '.PDF';
               documento.doc_ativo:='S';
               documento.doc_usanodiploma:='S';
               documento.tdo_seq:=74;
               documento.aut_seq:=1;
               documento.loc_seq:=1; // Campus I
               documento.doc_assunto:=NULLToSpace(QGedArea['are_descr']);
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
                     DocAssinaturas.ass_notificavel:='N';
                     documento.assinaturas.Add(DocAssinaturas);
                     QUsuDoc.Next;
                   End;
                 End;
               End;

               pastaEDocumentos.Documentos.Add(documento);

               retorno:=Atualizar_Documentos_Fluxo_Pasta_PastaValCampo(pastaEDocumentos);

               if QAux.Eof then
               begin
                 if doc_codigo = 0 then
                 begin
                   documento:=BuscarDocumentoPorNome(retorno.Pasta.pst_codigo,'HISTORICODC_' + IntToStr(vitl_seq),'PDF');
                   if documento <> nil then
                      doc_codigo:=documento.doc_codigo;
                 end;
                 if doc_codigo <> 0 then
                 begin
                   QDocComprob.Close;
                   QDocComprob.Sql.Clear;
                   QDocComprob.Sql.Add('select * from sca_aludoccomprob');
                   QDocComprob.Sql.Add('where alu_ra = 0 and hab_codigo = 0');
                   QDocComprob.Open;
                   QDocComprob.Append;
                   QDocComprob['alu_ra']:=StrToFloat(Trim(MERA.Text));
                   QDocComprob['hab_codigo']:=StrToInt(DBLCBHab.Value);
                   QDocComprob['dcp_seq']:=4;
                   QDocComprob['doc_codigo']:=doc_codigo;
                   QDocComprob['fun_matr']:=vcodusu;
                   QDocComprob['acp_dtinsercao']:=Pega_DataHora();
                   QDocComprob['acp_dtemissao']:=DEExp.Date;
                   QDocComprob.Post;
                 end
                 else
                  if vexibemensagem = 'S' then
                     MessageDlg('Ocorreu um erro na geração do documento comprobatório (histórico escolar) do(a) aluno(a) '+QDadAlu['pes_nome']+ '!',mtError,[mbok],0)
               end
               else
               begin
                 QDocComprob.Close;
                 QDocComprob.Sql.Clear;
                 QDocComprob.Sql.Add('select * from sca_aludoccomprob');
                 QDocComprob.Sql.Add('where alu_ra =:ra and hab_codigo =:hab and dcp_seq = 4');
                 QDocComprob.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                 QDocComprob.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
                 QDocComprob.Open;
                 if doc_codigo = 0 then
                    doc_codigo:=QDocComprob['doc_codigo'];
                 QDocComprob.Edit;
                 QDocComprob['acp_dtinsercao']:=Pega_DataHora();
                 QDocComprob['acp_dtemissao']:=DEExp.Date;
                 QDocComprob.Post;
               end;

               if doc_codigo <> 0 then
               begin
                 QAux.Close;
                 QAux.Sql.Clear;

                 QAux.Sql.Add('update sca_registrodoc set doc_codigo =:doc');
                 If vitl_seq = 0
                 Then
                  Begin
                    QAux.Sql.Add('where itl_seq = (select itl_seq from sca_itenslivdip where alu_ra =:ra and hab_codigo =:hab and srd_codigo <> 2) and');
                    QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                    QAux.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
                  End
                 Else
                  Begin
                    QAux.Sql.Add('where itl_seq =:seq and');
                    QAux.ParamByName('seq').AsInteger:=vitl_seq;
                  End;
                 QAux.Sql.Add('      dcp_seq = 4 and doc_codigo is null');
                 QAux.ParamByName('doc').AsInteger:=doc_codigo;
                 QAux.ExecSQL;

                 pastaEDocumentos.Free;
                 retorno.Free;
                 documento.Free;

                 // Abrindo com a tela minimizada
                 If vexibemensagem = 'S'
                 Then OpenPDF(C_PASTA_TEMPORARIA+'\HISTORICO_'+Trim(MERA.Text)+'.PDF', SW_MINIMIZE);
               end;
             End;
          End
         Else
          Begin
            RHistor.AllowPrintToFile := True;
            RHistor.ShowPrintDialog := False;
            RHistor.ShowCancelDialog := False;
            RHistor.TextFileName := C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF';
            RHistor.DeviceType := 'PDFA';
        //     Menuprin.Database1.Connected := False;
            RHistor.Print;

            // Abrindo com a tela maximizada
            If vexibemensagem = 'S'
            Then OpenPDF(C_PASTA_TEMPORARIA+'\HISTORICOTEMP_'+Trim(MERA.Text)+'.PDF', SW_MAXIMIZE);
          End;
       End;

      If MenuPrin.Database1.Intransaction
      Then Menuprin.Database1.Commit;
    Except
      On E: Exception do
      Begin
        If MenuPrin.Database1.Intransaction
        Then MenuPrin.Database1.Rollback;
        if vexibemensagem = 'S' then
           if rvhe then
              MessageDlg('Ocorreu um erro na emissão da Representação Visual do Histórico Escolar do(a) aluno(a) '+QDadAlu['pes_nome']+ '. Detalhes : ' + E.Message,mtError,[mbok],0)
           else MessageDlg('Ocorreu um erro na emissão do Histórico Escolar do(a) aluno(a) '+QDadAlu['pes_nome']+ '. Detalhes : ' + E.Message,mtError,[mbok],0);
        If Printer.Printing
        Then Printer.EndDoc;
        If not unico
        Then
         Begin
          QAux.Close;
          QAux.Sql.Clear;
          QAux.Sql.Add('Delete from sca_rficha');
          QAux.Sql.Add('where alu_ra =:ra');
          QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
          QAux.ExecSql;
         End
        Else
         Begin
          QAux.Close;
          QAux.Sql.Clear;
          QAux.Sql.Add('Delete from sca_rficha');
          QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
          QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
          QAux.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
          QAux.ExecSql;
         End;
      End;
    End;
    if grava then
      Grava_Historico(StrToFloat(Trim(MERA.Text)),StrToInt(DBLCBHab.Value),vcodusu,Pega_DataHora);
    QDadAlu.Close;
    qconsalu.close;
    qconscur.close;
    QNacional.Close;
    SPFicha.Close;
    QRFicha.Close;
    qconsccl.close;
    qconsccl2.close;
    qconshab.close;
    QLocalidade.Close;
    QCurSup.Close;
    QEquival.Close;
    QConsEq.Close;
    QAux.Close;
    FRHist9.Enabled:=True;
    If vexibe = 'S'
    Then MERA.SetFocus;
  End;
end;

procedure TFRHist9.CBAtualizaClick(Sender: TObject);
begin
  If CBAtualiza.Checked
  Then
   Begin
     CBValida.Visible:=false;
     CBValida.Checked:=true;
   End
  Else
   Begin
     CBValida.Visible:=true;
     CBValida.Checked:=false;
   End;
end;

procedure TFRHist9.b_cancelaClick(Sender: TObject);
begin
 If vexibe = 'S'
 Then MERA.SetFocus;
end;

procedure TFRHist9.DBLCBHabExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  Begin
   QConsHab.Close;
   QConsHab.Sql.Clear;
   QConsHab.Sql.Add('select * from sca_habilitacao');
   QConsHab.Sql.Add('where hab_codigo =:hab');
   QConsHab.ParamByName('hab').AsSmallint:=StrToInt(DBLCBHab.Value);
   QConsHab.Open;
   LNomHab.Caption:=QConsHab['hab_nomhb1'];
   Dados_Grade_Hab(qconsccl);
   qconsccl.parambyname('hab').assmallint:=StrToInt(DBLCBHab.Value);
   qconsccl.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
   qconsccl.open;
   If qconsccl.eof
   Then
    Begin
     imp_historico:=false;
     if vexibemensagem = 'S' then
        messagedlg('Este aluno não está cadastrado nesta habilitação !',mtinformation,[mbok],0);
     QConsHab.Close;
     qconsccl.close;
     If vexibe = 'S'
     Then DBLCBHab.SetFocus;
    End
   Else
    If not Libera_Historico(StrToFloat(Trim(MERA.Text)), StrToInt(DBLCBHab.Value))
    Then
     Begin
      imp_historico:=false;
      if vexibemensagem = 'S' then
         MessageDlg('Aluno(a) '+QConsAlu['pes_nome']+ ' tem situação no Enade em aberto. Emissão da Representação Visual do Histórico Escolar não pode ser efetuada!',mtError,[mbOk],0);
      If vexibe = 'S'
      Then MERA.SetFocus;
     End
    Else
     If (qconsccl['ahb_conclusao'] <> Null) and (not Libera_Diploma(StrToFloat(Trim(MERA.Text)), StrToInt(DBLCBHab.Value)))
     Then
      Begin
        imp_historico:=false;
        if vexibemensagem = 'S' then
           If QConsAlu['cur_pronatec'] = 'S'
           Then MessageDlg('Aluno(a) '+QConsAlu['pes_nome']+ ' não tem dados do ensino médio cadastrados. Emissão da Representação Visual do Histórico Escolar não pode ser efetuada!',mtError,[mbOk],0)
           Else MessageDlg('Aluno(a) '+QConsAlu['pes_nome']+ ' tem data de conclusão e situação irregular no Enade. Emissão da Representação Visual do Histórico Escolar não pode ser efetuada!',mtError,[mbOk],0);
        If vexibe = 'S'
        Then MERA.SetFocus;
      End
     Else
      Begin
       If (QConsHab['hab_ligacao'] <> 0) and (QConsHab['hab_ligacao'] <> Null)
       Then
        Begin
         CBEmissao.Visible:=True;
         If vexibe = 'S'
         Then CBEmissao.SetFocus;
        End
       Else
        Begin
         CBEmissao.Checked:=False;
         CBEmissao.Visible:=False;
         If vexibe = 'S'
         Then DEExp.SetFocus;
        End;
      End;
  End;
end;

procedure TFRHist9.DBLCBHabCloseUp(Sender: TObject);
begin
 KeyPreview:=True;
end;

procedure TFRHist9.DBLCBHabDropDown(Sender: TObject);
begin
 KeyPreview:=False;
end;

procedure TFRHist9.GHBHistorBeforePrint(Sender: TObject);
var licenca,rec,rec2:string;
    vmesing:word;
begin
 LPag.Caption:=IntToStr(RHistor.AbsolutePageNo)+' de '+IntToStr(RHistor.AbsolutePageCount);
 Imp_Fac_Aut_Rec3(qconshab,QDadAlu,qconsccl,licenca,rec,rec2,LFac,LHab,LCurso,LTpPonto);
 If QDadAlu['cur_area'] = 1 // Ensino Médio
 Then LCurso.Caption:=Imp_Curso_Hist(QDadAlu,QConsHab,licenca,rec)
 Else LFac.Caption:=Imp_Curso_Hist(QDadAlu,QConsHab,licenca,'');
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
// LTitulo.Caption:=NULLToSpace(QDadAlu['pes_titulo']);
// If QDadAlu['pes_zonael'] <> Null
// Then LZona.Caption:=StrZero(QDadAlu['pes_zonael'],3)
// Else LZona.Caption:='';
// LMunicipio.Caption:='';
// LUF2.Caption:='';
// If QDadAlu['pes_municipio'] <> Null
// Then
//  Begin
//   QLocalidade.Close;
//   QLocalidade.ParamByName('Cod').AsInteger:=QDadAlu['pes_municipio'];
//   QLocalidade.Open;
//   LMunicipio.Caption:=QLocalidade['loc_nome'];
//   LUF2.Caption:=NULLToSpace(QLocalidade['loc_uf']);
//  End;
 If (qconsccl['ahb_cnting'] = Null) or (qconsccl['ahb_cnting'] = 0) or (NULLToZero(QDadAlu['alu_foring']) = 5)
 Then
  Begin
   If (QDadAlu['alu_foring'] = Null) or (QDadAlu['alu_foring'] = 0)
   Then ingresso:=1
   Else ingresso:=QDadAlu['alu_foring'];
  End
 Else ingresso:=qconsccl['ahb_cnting'];
 If QDadAlu['cur_area'] = 1 // Ensino Médio
 Then
  Begin
   Invisivel(FRHist9,2);
   Invisivel(FRHist9,1);
   Invisivel(FRHist9,10);
   Visivel(FRHist9,5);
   Desloca(FRHist9,3,1.1,0,0,0);
   Desloca(FRHist9,4,1.1,0,0,0);
   Desloca(FRHist9,5,1.1,0,0,0);
   SCab.Height:=1.65;
   GHBHistor.Height:=3.17;
  End
 Else
  If (ingresso = 1) or (ingresso = 3) or (ingresso = 4) or (ingresso = 5)
  Then
   Begin
    Ajusta_Quadro(ppLabel46, ppLabel47, ppLabel51, ppLine64, 1);
    Visivel(FRHist9,2);
    Invisivel(FRHist9,1);
    Invisivel(FRHist9,10);
    Invisivel(FRHist9,5);
    Desloca(FRHist9,3,0.65,0,0,0);
    Desloca(FRHist9,4,0.645,0,0,0);
    Desloca(FRHist9,5,0.65,0,0,0);
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
    If ingresso = 5 // ENEM
    Then
     Begin
      Ajusta_Quadro(ppLabel46, ppLabel47, ppLabel51, ppLine64, 2);
      Imprime_ENEM(QDadAlu,LDatVest);

//      If QDadAlu['cur_gradistancia'] = 'S' // A pedido da Nair, foi retirada a pontuação também para os cursos de graduação a distância - 18/06/2020
//      Then LPontos.Caption:=NULLToSpace(QDadAlu['alu_totpon'])
//      Else
//       Begin
         LTpPonto.Visible:=False;
         LPontos.Visible:=False;
         ppShape42.Visible:=False;
//       End;
      LEntidade.Caption:=NULLToSpace(QDadAlu['alu_prouni']);
     End
    Else
     Begin
      If (QDadAlu['alu_inives'] <> Null) and (QDadAlu['alu_fimves'] <> Null)
      Then LDatVest.Caption:=Recupera_Periodo_Vestibular(QDadAlu['alu_inives'],QDadAlu['alu_fimves']);
      LPontos.Caption:=NULLToSpace(QDadAlu['alu_totpon']);
      LEntidade.Caption:=NULLToSpace(QDadAlu['alu_entidade']);
     End; 
   End
  Else
   Begin
    QCurSup.Close;
    QCurSup.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    QCurSup.ParamByName('codhab').AsSmallInt:=qconsccl['hab_codigo'];
    QCurSup.Open;

    Visivel(FRHist9,1);
    Invisivel(FRHist9,2);
    Invisivel(FRHist9,5);

    If (NULLToZero(QDadAlu['alu_anoing']) > 2025) or ((NULLToZero(QDadAlu['alu_anoing']) = 2025) and (NULLToZero(QDadAlu['alu_seming']) = 2) and (NULLToZero(QDadAlu['alu_mesing']) = 10))
    Then
     Begin
       Invisivel(FRHist9,10); // campos referentes a entrada por curso superior que irão aparecer a partir dos ingressantes de outubro de 2025
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
       Visivel(FRHist9,10); // campos referentes a entrada por curso superior que não irão aparecer até os ingressantes de julho de 2025
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
    Desloca(FRHist9,4,0,0.063,0,0);
    SCab.Height:=2.78;
    GHBHistor.Height:=3.78;

    LCurSup.Caption:=NULLToSpace(QCurSup['acs_cursup']);
    LDatVest.Caption:='**************';
    LPontos.Caption:='***';
    LEntidade.Caption:='*************************';
   End;

 If (((NULLToZero(QDadAlu['fac_codigo']) = 1) or (QDadAlu['cur_codigo'] = 4)) and (qconshab['hab_ligacao'] <> 0)
    and (qconshab['hab_ligacao'] <> Null) and unico) or (QDadAlu['cur_codigo'] = 311)
 Then LExpedicao.Caption:='Exp. Apostila'
 Else LExpedicao.Caption:='Exp. Diploma';
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
 If QDadAlu['cur_area'] = 1 // Ensino Medio
 Then Imp_Qualif_Hab(qconsccl,QDadAlu,qconshab,LTitQua,LQualif,LIngresso,LDatConcl);
//---------------------------- Utilizado para emissão de histórico escolar sem dados do aluno
 If not imp_dados
 Then Esconde_Dados(FRHist9);
//----------------------------
end;

procedure TFRHist9.DBObsComplBeforePrint(Sender: TObject);
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

procedure TFRHist9.HBHistorBeforePrint(Sender: TObject);
begin
// If RHistor.AbsolutePageNo mod 2 = 0
// Then HBHistor.PrintPosition:=0
// Else HBHistor.PrintPosition:=1;
 LContinua.Caption:='Continuação do Histórico Escolar de '+QDadAlu['pes_nome']+'   ';
// LFolha2.Caption:='Página : '+IntToStr(RHistor.AbsolutePageNo)+' de '+IntToStr(RHistor.AbsolutePageCount);
end;

procedure TFRHist9.GHBHistorAfterPrint(Sender: TObject);
begin
 If QDadAlu['cur_area'] = 1 // Ensino Médio
 Then
  Begin
   Desloca(FRHist9,3,0,1.1,0,0);
   Desloca(FRHist9,4,0,1.1,0,0);
   Desloca(FRHist9,5,0,1.1,0,0);
  End
 Else
  If (ingresso = 1) or (ingresso = 3) or (ingresso = 4) or (ingresso = 5)
  Then
   Begin
    Desloca(FRHist9,3,0,0.65,0,0);
    Desloca(FRHist9,4,0,0.645,0,0);
    Desloca(FRHist9,5,0,0.65,0,0);
   End
  Else Desloca(FRHist9,4,0.063,0,0,0);
end;

procedure TFRHist9.DBObsBeforePrint(Sender: TObject);
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
    QConsEq.Sql.Add('Select * from sca_equivalencia');
    QConsEq.Sql.Add('where alu_ra =:ra and equ_codobs =:codobs');
    If unico
    Then
     Begin
      QConsEq.Sql.Add('and hab_codigo =:codhab');
      QConsEq.ParamByName('codhab').assmallint:=StrToInt(DBLCBHab.Value);
     End
    Else
     Begin
      QConsEq.Sql.Add('and (hab_codigo =:hab1 or hab_codigo =:hab2)');
      QConsEq.ParamByName('hab1').assmallint:=StrToInt(DBLCBHab.Value);
      QConsEq.ParamByName('hab2').assmallint:=qconshab['hab_ligacao'];
     End;
    QConsEq.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
    QConsEq.ParamByName('codobs').assmallint:=QObserv['obs_codigo'];
    QConsEq.Open;
    If not QConsEq.Eof
    Then LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')'
    Else
     Begin
      QConsAdi.Close;
      QConsAdi.Sql.Clear;
      QConsAdi.Sql.Add('Select * from sca_adicionais');
      QConsAdi.Sql.Add('where alu_ra =:ra and adi_codobs =:codobs');
      If unico
      Then
       Begin
        QConsAdi.Sql.Add('and hab_codigo =:codhab');
        QConsAdi.ParamByName('codhab').assmallint:=StrToInt(DBLCBHab.Value);
       End
      Else
       Begin
        QConsAdi.Sql.Add('and (hab_codigo =:hab1 or hab_codigo =:hab2)');
        QConsAdi.ParamByName('hab1').assmallint:=StrToInt(DBLCBHab.Value);
        QConsAdi.ParamByName('hab2').assmallint:=qconshab['hab_ligacao'];
       End;
      QConsAdi.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
      QConsAdi.ParamByName('codobs').assmallint:=QObserv['obs_codigo'];
      QConsAdi.Open;
      If not QConsAdi.Eof
      Then LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')'
      Else
       If QObserv['obs_codigo'] = codobs
       Then LCodObs.Caption:='('+IntToStr(QObserv['obs_codigo'])+')';
     End;
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
//---------------------------- Utilizado para emissão de histórico escolar sem dados do aluno
 If not imp_dados
 Then
  Begin
//   Esconde_Dados(FRHist9);
   DBObs.Visible:=False;
  End; 
//----------------------------
end;

procedure TFRHist9.DBObsAfterPrint(Sender: TObject);
begin
 DBObs.Visible:=True;
end;

procedure TFRHist9.RHistorStartSecondPass(Sender: TObject);
begin
{  totcarga:=0;
  tothoras:=0;
  totcarga2:=0;
  totest:=0;
  disp1:=false;
  disp2:=false;
  disp4:=false;
  codobs:=0;
  lancado:=false;
  cursando1:=false;cursando2:=false;
  vnota1:=0;vnota2:=0;
  cursou99:=false;
//  prat_ens:=false;
  MTDisc.Close;
  MTDisc.Open;
  MTEquival.Close;
  MTEquival.Open;
  MTAdiciona.Close;
  MTAdiciona.Open;
  FBHistor.Height:=0.26;
  LContinua2.Top:=0.0625;}
end;

procedure TFRHist9.RHistorBeforePrint(Sender: TObject);
begin
{  totcarga:=0;
  tothoras:=0;
  totcarga2:=0;
  totest:=0;
  disp1:=false;
  disp2:=false;
  disp4:=false;
  codobs:=0;
  lancado:=false;
  cursando1:=false;cursando2:=false;
  vnota1:=0;vnota2:=0;
  cursou99:=false;
//  prat_ens:=false;
  MTDisc.Close;
  MTDisc.Open;
  MTEquival.Close;
  MTEquival.Open;
  MTAdiciona.Close;
  MTAdiciona.Open;
  FBHistor.Height:=0.26;
  LContinua2.Top:=0.0625;}
end;

procedure TFRHist9.SBHistorBeforePrint(Sender: TObject);
begin
  Recupera_Assinantes(QDadAlu['cur_codigo'],historicoxml,Memo, tipo_historico);

  BarCode.Data:='';
//  If (Trim(NULLToSpace(QItensLivDip['itl_codvalhistorico'])) <> '') and (rvhe) // and (valida_historico = 'S')
//  Then BarCode.Data:='https://www.unoeste.br/historicoescolar/' + QItensLivDip['itl_codvalhistorico'];
  If (codvalhistorico <> '') and (rvhe) // and (valida_historico = 'S')
  Then
   Begin
     BarCode.Data:='https://www.unoeste.br/historicoescolar/' + codvalhistorico;
     LCodVal.Caption:='Código de verificação: ' + codvalhistorico;
     LHistorico.Caption:='Histórico escolar digital: https://www.unoeste.br/historicoescolar/' + codvalhistorico;
   End;
  If RHistor.AbsolutePageCount = 1
  Then FBHistor.Height:=0.01
  Else
   Begin
     FBHistor.Height:=0.26;
//     LContinua2.Top:=0.0625;
   End;
end;

procedure TFRHist9.TBObsAfterGenerate(Sender: TObject);
begin
 ppLine36.Visible:=True;
 ppLine38.Visible:=True;
 LCabObs1.Visible:=True;
end;

procedure TFRHist9.TBObs2AfterGenerate(Sender: TObject);
begin
 ppLine37.Visible:=True;
 ppLine39.Visible:=True;
 LCabObs2.Visible:=True;
end;

procedure TFRHist9.TBObsComplAfterGenerate(Sender: TObject);
begin
 ppLine40.Visible:=True;
 ppLine41.Visible:=True;
 LCabObs3.Visible:=True;
end;

procedure TFRHist9.QRFichaCalcFields(DataSet: TDataSet);
begin
 If NULLToZero(QRFicha['his_chminima']) <> 0
 Then ch.value:=IntToStr(NULLToZero(QRFicha['his_chminima']))
 Else ch.value:='******';
 nomdisc.value:=Trim(QRFicha['dis_nomdisc']) + NULLToSpace(QRFicha['dco_complemento']);
end;

procedure TFRHist9.ppGroupFooterBand1BeforePrint(Sender: TObject);
var somou:boolean;
begin
 CabObs:=False;

 MTCH.Close;
 MTCH.Open;
 MTCH.Append;
 MTCH['totch']:=DBCTotAulas.Value;
 MTCH.Post;
 totcarga:=DBCTotAulas.Value;
 totcarga2:=DBCTotAulas2.Value;
 tothoras:=DBCTotHoras.Value;

 ppLine36.Visible:=False;
 ppLine38.Visible:=False;
 LCabObs1.Visible:=False;
 DBObs.Visible:=False;
 QObserv.Close;
 QObserv.Sql.Clear;
 If unico
 Then
  Begin
   QObserv.Sql.Add('Select distinct obs_codigo,obs_observ1,obs_ano,obs_semestre from sca_observacoes');
   QObserv.Sql.Add('where alu_ra =:ra and hab_codigo =:codhab');
   QObserv.Sql.Add(' and ((obs_codigo < 90) or (obs_codigo > 99))');
   QObserv.Sql.Add('order by obs_ano, obs_semestre, obs_codigo');
   QObserv.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
   QObserv.ParamByName('codhab').assmallint:=StrToInt(DBLCBHab.Value);
  End
 Else
  Begin
   QObserv.Sql.Add('Select distinct obs_codigo,obs_observ1,obs_ano,obs_semestre from sca_observacoes');
   QObserv.Sql.Add('where alu_ra =:ra and (hab_codigo =:hab1 or hab_codigo =:hab2)');
   QObserv.Sql.Add(' and ((obs_codigo < 90) or (obs_codigo > 99))');
   QObserv.Sql.Add('order by obs_ano, obs_semestre, obs_codigo');
   QObserv.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
   QObserv.ParamByName('hab1').assmallint:=StrToInt(DBLCBHab.Value);
   QObserv.ParamByName('hab2').assmallint:=qconshab['hab_ligacao'];
  End;
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
 Carrega_Observacoes(MTObs,disp1,disp2,disp3,disp4,lancado,cursando1,cursando2,vnota1,vnota2,codobs,RGHist.ItemIndex,RGTipo.ItemIndex,qconsccl,QDadAlu,QAluHabEq,percent_pres);
 Carrega_Atividades(NULLToZero(QGradLet['totativ']),QCHAtiv,QDadAlu,qconsccl,MTObs,totcarga,somou);
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
 If unico
 Then
  Begin
   QObsCompl.Sql.Add('select * from sca_obscompl');
   QObsCompl.Sql.Add('where grl_codgra =:codgra and cur_codigo =:codcur and hab_codigo =:codhab');
   QObsCompl.Sql.Add('order by obc_nordem');
   QObsCompl.ParamByName('codgra').AsSmallInt:=qconsccl['ahb_codgra'];
   QObsCompl.ParamByName('codcur').AsSmallInt:=QDadAlu['cur_codigo'];
   QObsCompl.ParamByName('codhab').AsSmallInt:=StrToInt(DBLCBHab.Value);
  End
 Else
  Begin
   QObsCompl.Sql.Add('select * from sca_obscompl');
   QObsCompl.Sql.Add('where grl_codgra =:codgra and cur_codigo =:codcur and (hab_codigo =:hab1 or hab_codigo =:hab2)');
   QObsCompl.Sql.Add('order by hab_codigo,obc_nordem');
   QObsCompl.ParamByName('codgra').AsSmallInt:=qconsccl2['ahb_codgra'];
   QObsCompl.ParamByName('codcur').AsSmallInt:=QDadAlu['cur_codigo'];
   QObsCompl.ParamByName('hab1').AsSmallInt:=StrToInt(DBLCBHab.Value);
   QObsCompl.ParamByName('hab2').AsSmallInt:=qconshab['hab_ligacao'];
  End;
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

  ppRegion1.Visible:=False;
  If (QDadAlu['cur_pronatec'] = 'S') and (QDadAlu['alu_anoing'] >= 2016) // Antes o ano de início era 2017. A pedido do Ricardo, foi alterado para 2016 - 19/12/2019
  Then
   Begin
     ppRegion1.Height:=0.4271;
     ppRichView1.Height:=0.3229;
     ppRichView1.RichView.Clear;
     ppRichView1.RichView.Style.TextStyles.Items[0].FontName:='Arial';
     ppRichView1.RichView.Style.TextStyles.Items[0].Size:=8;
     ppRichView1.RichView.Style.TextStyles.Items[0].Color:=clBlack;
     ppRichView1.RichView.Style.TextStyles.Items[0].Style:=[];

     ppRichView1.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
     ppRichView1.RichView.Style.ParaStyles.Items[0].LineSpacing:=60;

//     Carrega_Portaria_Tecnico(ppRichView1, QDadAlu);
     Carrega_Portaria_Tecnico(ppRichView1, QDadAlu,0,0);
     ppRichView1.RichView.Format;
     ppRegion1.Visible:=True;
   End;
end;

procedure TFRHist9.ppDetailBand1BeforePrint(Sender: TObject);
begin
// Carrega_Atividades(NULLToZero(QGradLet['totativ']),QCHAtiv,QDadAlu,qconsccl,MTObs,totcarga,somou);
 LTotEst.Visible:=False;
 If QDadAlu['cur_area'] = 6 // Cursos de Tecnologia
 Then
  Begin
   LCH.AutoSize:=True;
   LCH.Caption:=Equivalente_Horas2(1,QDadAlu['cur_codigo'],qconsccl['hab_codigo'],qconsccl['ahb_codgra'],QDadAlu['alu_anoing'],totcarga,totcarga2,tothoras,QDadAlu['alu_ra'],qconsccl,QDadAlu)+' ';
  End
 Else
  Begin
//   LCH.AutoSize:=False;
//   LCH.Width:=0.6771;
   LCH.Caption:=Exibe_CargaTotal2(totcarga,tothoras,1,NULLToZero(QGradLet['totativ']),qconsccl['hab_codigo'],QCHAtiv,QDadAlu,qconsccl)+' ';
   If QDadAlu['cur_area'] = 1 // Ensino Médio
   Then
    Begin
     If totest = 0 // a pedido do Evaldo, foi tirado o total de carga horária de estágio quando não tiver carga horária - 23/09/2016
     Then LTotEst.Visible:=False
     Else
      Begin
        LTotEst.Visible:=True;
        LTotEst.Caption:='Total da Carga Horária de Estágio : '+Exibe_CargaTotal(totest,3,NULLToZero(QGradLet['totativ']),qconsccl['hab_codigo'],QCHAtiv,QDadAlu,qconsccl);
      End;
    End;
  End;
//---------------------------- Utilizado para emissão de histórico escolar sem dados do aluno
 If not imp_dados
 Then
  Begin
   Esconde_Dados(FRHist9);
   LCH.Caption:='Total da Carga Horária Cumprida : ';
  End; 
//----------------------------
end;

procedure TFRHist9.GHBModBeforePrint(Sender: TObject);
begin
 totmod:=0;
 totmod2:=0;
 LModulo.Caption:='';
 LNomMod.Caption:='';
 If MDFicha['cer_seq'] = Null
 Then
  Begin
   GHBMod.Visible:=False;
   GFBMod.Visible:=False;
  End
 Else
  Begin
   QCertif.Close;
   QCertif.ParamByName('mod').AsInteger:=MDFicha['cer_seq'];
   QCertif.Open;
   If QDadAlu['cur_area'] = 6 // Cursos de Tecnologia
   Then
    Begin
     LModulo.Caption:='Módulo '+NULLToSpace(QCertif['cer_modulo']);
     If qconsccl['grl_convertehs'] = 'S'
     Then ppLabel4.Caption:='Total de Aulas Cumpridas no Módulo :'
     Else ppLabel4.Caption:='Carga Horária Cumprida no Módulo :';
    End
   Else
    Begin
     LModulo.Caption:=NULLToSpace(QCertif['cer_modulo']);
     If qconsccl['grl_convertehs'] = 'S'
     Then ppLabel4.Caption:='Total de Aulas Cumpridas :'
     Else ppLabel4.Caption:='Carga Horária Cumprida :';
    End;
   LNomMod.Caption:=NULLToSpace(QCertif['cer_descr']);
   GHBMod.Visible:=True;
   GFBMod.Visible:=True;
  End;
end;

procedure TFRHist9.GHBModAfterPrint(Sender: TObject);
begin
 GHBMod.Visible:=True;
end;

procedure TFRHist9.GFBModBeforePrint(Sender: TObject);
begin
// LTotMod.Caption:=Exibe_CargaTotal(totmod,3,NULLToZero(QGradLet['totativ']),qconsccl['hab_codigo'],QCHAtiv,QDadAlu,qconsccl);
 LTotMod.Caption:=Exibe_CargaTotal(DBCTotMod.Value,3,NULLToZero(QGradLet['totativ']),qconsccl['hab_codigo'],QCHAtiv,QDadAlu,qconsccl);
 If QDadAlu['cur_area'] = 6 // Cursos de Tecnologia
 Then
  Begin
   LCompl.Visible:=True;
//   LCompl.Caption:=Equivalente_Horas(2,QDadAlu['cur_codigo'],qconsccl['hab_codigo'],qconsccl['ahb_codgra'],QDadAlu['alu_anoing'],0,totmod2,QDadAlu['alu_ra']);
   LCompl.Caption:=Equivalente_Horas(2,QDadAlu['cur_codigo'],qconsccl['hab_codigo'],qconsccl['ahb_codgra'],QDadAlu['alu_anoing'],0,DBCTotMod2.Value,QDadAlu['alu_ra']);
  End
 Else LCompl.Visible:=False;
end;

procedure TFRHist9.GFBModAfterPrint(Sender: TObject);
begin
 GFBMod.Visible:=True;
end;

procedure TFRHist9.QAdicionaCalcFields(DataSet: TDataSet);
//var perlet,semref:word;
begin
 QAdiciona['hr']:=Calcula_HorasEquiv2(QAdiciona,QDadAlu,QRFicha);
{ If QAdiciona['adi_cghora'] <> Null
 Then
  If QDadAlu['cur_area'] = 6
  Then
   Begin
    semref:=1;
    If Length(IntToStr(QAdiciona['adi_perlet'])) = 4
    Then perlet:=QAdiciona['adi_perlet']
    Else
     Begin
      perlet:=StrToInt(Copy(IntToStr(QAdiciona['adi_perlet']),2,4));
      semref:=StrToInt(Copy(IntToStr(QAdiciona['adi_perlet']),1,1));
     End;
    QAdiciona['hr']:=HoraRelogio(perlet,semref,QDadAlu['cur_codigo'],QDadAlu['alu_periodo'],QAdiciona['adi_cghora'])
   End
  Else QAdiciona['hr']:=QAdiciona['adi_cghora'];}
end;

procedure TFRHist9.QEquivalCalcFields(DataSet: TDataSet);
begin
 QEquival['hr']:=Calcula_HorasEquiv(QEquival,QDadAlu,QRFicha);
end;

procedure TFRHist9.FBHistorBeforePrint(Sender: TObject);
begin
// If (RHistor.AbsolutePageNo + 1) mod 2 = 0 // Página Par
// Then LContinua2.Caption:='Continua na página '+StrZero(RHistor.AbsolutePageNo+1,2)+' (Verso)'
// Else LContinua2.Caption:='Continua na página '+StrZero(RHistor.AbsolutePageNo+1,2);
// LContinua2.Caption:='Continua na página '+StrZero(RHistor.AbsolutePageNo+1,2);
 LPagina.Caption:='Página : '+IntToStr(RHistor.AbsolutePageNo)+' de '+IntToStr(RHistor.AbsolutePageCount);
end;

procedure TFRHist9.DEExpExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If (DEExp.Date = 0) and (vexibe = 'S')
  Then DEExp.SetFocus;
end;

procedure TFRHist9.RGTipoExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not DBLCBHab.Focused) and (not CBEmissao.Focused) and
    (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  Begin
   B_Ok.Enabled:=True;
   If vexibe = 'S'
   Then B_Ok.SetFocus;
  End;
end;

procedure TFRHist9.DBObs2BeforePrint(Sender: TObject);
begin
//---------------------------- Utilizado para emissão de histórico escolar sem dados do aluno
 If not imp_dados
 Then Esconde_Dados(FRHist9);
//----------------------------
end;

procedure TFRHist9.ppGroupFooterBand2BeforePrint(Sender: TObject);
var vdia,vmes,vano:word;
begin
  DecodeDate(DEExp.Date,vano,vmes,vdia);
  If (qconsalu['cam_codigo'] = 1) or (qconsalu['cam_codigo'] = 4) // Presidente Prudente ou Venceslau
  Then LCidade2.Caption:='P. Prudente, '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano)+' '
  Else
  If qconsalu['cam_codigo'] = 7 // Jaú
  Then LCidade2.Caption:='Jaú, '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano)+' '
  Else
   If qconsalu['cam_codigo'] = 8 // Guarujá
   Then LCidade2.Caption:='Guarujá, '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano)+' ';
  //LRA2.Caption:='R.A. '+Mascara_RA(MDFicha['alu_ra'])+' em '+DEExp.Text;
end;

end.
