unit UArGrade;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Buttons, Mask, ExtCtrls,
  Dialogs,Printers, ppDB, ppDBPipe, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppViewR,
  ppStrtch, ppMemo, ppRichTx, ppRichView, RVStyle,
  ppRegion, RxMemDS, jpeg, ppSubRpt, ppDesignLayer, ppParameter, rxToolEdit,
  rxCurrEdit, Variants, ppBarCode2D, UGed_Documentos, Contnrs, RestJsonUtils;

type
  TF_AntGrade = class(TForm)
    ScrollBox: TScrollBox;
    Panel1: TPanel;
    DS_Curso: TDataSource;
    Panel2: TPanel;
    B_Cancela: TBitBtn;
    B_Ok: TBitBtn;
    Q_Curso: TQuery;
    B_Retorna: TBitBtn;
    E_CurCod: TEdit;
    DBE_Cur: TDBEdit;
    B_LocCur: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    E_PerLet: TEdit;
    LPerLet: TLabel;
    RGOrd: TRadioGroup;
    QGrade: TQuery;
    RGrade: TppReport;
    ppHeaderBand3: TppHeaderBand;
    LInst: TppLabel;
    LCab3: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel20: TppLabel;
    LCurso: TppLabel;
    LHoras: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape2: TppShape;
    ppDBText16: TppDBText;
    ppDBPipeline1: TppDBPipeline;
    Q: TQuery;
    DS: TDataSource;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    DBTNOrd: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText4: TppDBText;
    ppLine3: TppLine;
    nord: TSmallintField;
    ppGroup2: TppGroup;
    GHBNOrd: TppGroupHeaderBand;
    GFBNOrd: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    DBTRef: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine4: TppLine;
    ppLine5: TppLine;
    LEndereco: TppLabel;
    LTot: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel18: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel21: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel22: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLine6: TppLine;
    ppLabel23: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLine7: TppLine;
    ppLine8: TppLine;
    Qdis_codigo: TIntegerField;
    Qgra_nordem: TSmallintField;
    Qhab_codigo: TSmallintField;
    Qdis_nomdisc: TStringField;
    Qdep_codigo: TSmallintField;
    Qgra_regime: TSmallintField;
    Qgra_tipaul: TSmallintField;
    Qgra_cont: TSmallintField;
    Qgra_chteor: TSmallintField;
    Qgra_chprat: TSmallintField;
    Qhab_cghor: TSmallintField;
    Qgra_ncteor: TSmallintField;
    Qgra_ncprat: TSmallintField;
    Qhab_nomhb1: TStringField;
    Qgrl_inicio: TSmallintField;
    Qcur_nomcur: TStringField;
    Qgrl_codgra: TSmallintField;
    Qgra_nordem2: TSmallintField;
    Qhab_ligacao: TSmallintField;
    Qdis_controle: TSmallintField;
    ppLine9: TppLine;
    ppMemo1: TppMemo;
    ppLine12: TppLine;
    QObsGrade: TQuery;
    ppLabel41: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel14: TppLabel;
    ppDBCalc8: TppDBCalc;
    Qcer_titulo: TStringField;
    Qcer_modulo: TStringField;
    Qcer_seq: TIntegerField;
    ppGroup4: TppGroup;
    GHBModulo: TppGroupHeaderBand;
    GFBModulo: TppGroupFooterBand;
    ppDBText1: TppDBText;
    LModulo: TppLabel;
    LCHM: TppLabel;
    ppDBCalc9: TppDBCalc;
    RGrade2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    LInst2: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel37: TppLabel;
    LCurso2: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape3: TppShape;
    DBTNOrd2: TppDBText;
    DBTRef2: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    LTot2: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLine13: TppLine;
    ppLine14: TppLine;
    LEndereco2: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppShape4: TppShape;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLine15: TppLine;
    ppGroup5: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText28: TppDBText;
    ppLine16: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppMemo2: TppMemo;
    LHoras2: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppLabel69: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppLabel70: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppLine17: TppLine;
    ppLabel71: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBCalc15: TppDBCalc;
    ppLabel73: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppGroup6: TppGroup;
    GHBModulo2: TppGroupHeaderBand;
    ppDBText29: TppDBText;
    ppLabel74: TppLabel;
    GFBModulo2: TppGroupFooterBand;
    ppLabel75: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppGroup7: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel76: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppGroup8: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    RTHab: TppRichText;
    ppLabel17: TppLabel;
    Qhab_comum: TSmallintField;
    LEstSup: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppLine21: TppLine;
    ppDBText14: TppDBText;
    Qgra_pratviv: TSmallintField;
    ppMemo3: TppMemo;
    Qgrl_chmativ: TSmallintField;
    ppMemo4: TppMemo;
    Qcer_descr: TStringField;
    Qgrl_mascara: TSmallintField;
    Qgrl_nomhab1: TStringField;
    LNum: TLabel;
    CENum: TCurrencyEdit;
    LOu: TLabel;
    DBCLibras: TppDBCalc;
    DBCLibras2: TppDBCalc;
    Qgrl_anoinicio: TSmallintField;
    Qgrl_seminicio: TSmallintField;
    Qgrl_periodo: TSmallintField;
    LCHS: TppLabel;
    LCS: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    Qgra_chteorpres: TSmallintField;
    Qgra_ncteorpres: TSmallintField;
    ppDBCalc14: TppDBCalc;
    LCHT: TppLabel;
    LNCT: TppLabel;
    ppRichView1: TppRichView;
    QCertif: TQuery;
    QComp: TQuery;
    ppRegion1: TppRegion;
    ppShape1: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    LTitCHS: TppLabel;
    LTitCS: TppLabel;
    LCHS2: TppLabel;
    LCS2: TppLabel;
    LCHT2: TppLabel;
    ppDBText33: TppDBText;
    LNCT2: TppLabel;
    ppDBText34: TppDBText;
    ppDBCalc20: TppDBCalc;
    LTitCHS2: TppLabel;
    LTitCS2: TppLabel;
    CBPER: TCheckBox;
    LPER: TppLabel;
    Qgra_per: TStringField;
    LPER2: TppLabel;
    LCert2: TppLabel;
    LCert: TppLabel;
    LCert3: TppLabel;
    MDGrade: TRxMemoryData;
    DSGrade: TDataSource;
    MDGradenord: TSmallintField;
    MDGradedis_codigo: TIntegerField;
    MDGradegra_nordem: TSmallintField;
    MDGradehab_codigo: TSmallintField;
    MDGradedis_nomdisc: TStringField;
    MDGradedep_codigo: TSmallintField;
    MDGradegra_regime: TSmallintField;
    MDGradegra_tipaul: TSmallintField;
    MDGradegra_cont: TSmallintField;
    MDGradegra_chteor: TSmallintField;
    MDGradegra_chprat: TSmallintField;
    MDGradehab_cghor: TSmallintField;
    MDGradegra_ncteor: TSmallintField;
    MDGradegra_ncprat: TSmallintField;
    MDGradehab_nomhb1: TStringField;
    MDGradegrl_inicio: TSmallintField;
    MDGradecur_nomcur: TStringField;
    MDGradegrl_codgra: TSmallintField;
    MDGradegra_nordem2: TSmallintField;
    MDGradehab_ligacao: TSmallintField;
    MDGradedis_controle: TSmallintField;
    MDGradecer_seq: TIntegerField;
    MDGradecer_titulo: TStringField;
    MDGradecer_modulo: TStringField;
    MDGradehab_comum: TSmallintField;
    MDGradegra_pratviv: TSmallintField;
    MDGradegrl_chmativ: TSmallintField;
    MDGradecer_descr: TStringField;
    MDGradegrl_mascara: TSmallintField;
    MDGradegrl_nomhab1: TStringField;
    MDGradegrl_anoinicio: TSmallintField;
    MDGradegrl_seminicio: TSmallintField;
    MDGradegrl_periodo: TSmallintField;
    MDGradegra_chteorpres: TSmallintField;
    MDGradegra_ncteorpres: TSmallintField;
    MDGradegra_per: TStringField;
    MDGradechtot: TSmallintField;
    MDGradechsoma: TSmallintField;
    RMatriz: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppSystemVariable4: TppSystemVariable;
    ppLabel38: TppLabel;
    ppLabel54: TppLabel;
    ppLabel68: TppLabel;
    ppLabel72: TppLabel;
    ppLabel77: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape5: TppShape;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    LPER3: TppLabel;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppLine26: TppLine;
    ppRichView2: TppRichView;
    ppGroup9: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppMemo6: TppMemo;
    DBCHoras: TppDBCalc;
    ppLine30: TppLine;
    DBCHorEad: TppDBCalc;
    ppGroup10: TppGroup;
    GHBModulo3: TppGroupHeaderBand;
    ppDBText48: TppDBText;
    ppLabel115: TppLabel;
    LCert4: TppLabel;
    GFBModulo3: TppGroupFooterBand;
    LCHM2: TppLabel;
    DBCHorMod: TppDBCalc;
    ppGroup11: TppGroup;
    GHBNOrd2: TppGroupHeaderBand;
    ppDBText49: TppDBText;
    LCert5: TppLabel;
    GFBNOrd2: TppGroupFooterBand;
    ppDBCalc30: TppDBCalc;
    ppLabel119: TppLabel;
    ppGroup12: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppDBPipeline2: TppDBPipeline;
    ppImage1: TppImage;
    ppSystemVariable7: TppSystemVariable;
    LIngresso: TppLabel;
    ppDBText50: TppDBText;
    MDGradechhoras: TSmallintField;
    ppLabel15: TppLabel;
    ppDBText30: TppDBText;
    ppShape7: TppShape;
    RTCurso: TppRichText;
    MDGradechhorasead: TSmallintField;
    DBCPratViv: TppDBCalc;
    MDGradechhorasprtviv: TSmallintField;
    Qgrl_convertehs: TStringField;
    MDGradegrl_convertehs: TStringField;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    QPrat: TQuery;
    DSPrat: TDataSource;
    QPratdis_codigo: TIntegerField;
    QPratgra_nordem: TSmallintField;
    QPratdis_nomdisc: TStringField;
    QPratgra_pratviv: TSmallintField;
    QPratchhoras: TSmallintField;
    ppDBPipeline3: TppDBPipeline;
    ppDetailBand4: TppDetailBand;
    QPratcur_codigo: TSmallintField;
    ppGroup13: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel16: TppLabel;
    ppLabel53: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppDBCalc21: TppDBCalc;
    ppShape10: TppShape;
    ppLabel80: TppLabel;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppRegion3: TppRegion;
    ppMemo5: TppMemo;
    Qgrl_converteead: TStringField;
    MDGradegrl_converteead: TStringField;
    CBVigente: TCheckBox;
    QGradAtu: TQuery;
    DSGradAtu: TDataSource;
    QGradAtugrl_codgra: TSmallintField;
    QGradAtucur_codigo: TSmallintField;
    QGradAtuhab_codigo: TSmallintField;
    QGradAtugrt_periodo: TSmallintField;
    QGradAtugrt_fechado: TStringField;
    QGradAtugrt_internet: TStringField;
    QGradAtugrl_codgra_1: TSmallintField;
    QGradAtucur_codigo_1: TSmallintField;
    QGradAtugrl_inicio: TSmallintField;
    QGradAtugrl_chmativ: TSmallintField;
    QGradAtugrl_mascara: TSmallintField;
    QGradAtugrl_nomhab1: TStringField;
    QGradAtugrl_anoinicio: TSmallintField;
    QGradAtugrl_seminicio: TSmallintField;
    QGradAtugrl_periodo: TSmallintField;
    QGradAtugrl_convertehs: TStringField;
    QGradAtugrl_converteead: TStringField;
    QGradAtugrade: TStringField;
    DBLCGrade: TDBLookupComboBox;
    MDGradechsoma2: TSmallintField;
    DBCAulas: TppDBCalc;
    MDGradegra_ce: TSmallintField;
    Qgra_ce: TSmallintField;
    ppLabel89: TppLabel;
    ppDBText47: TppDBText;
    DBCCE: TppDBCalc;
    QGedArea: TQuery;
    ppRegion4: TppRegion;
    BarCode: Tpp2DBarCode;
    ppRegion2: TppRegion;
    ppShape6: TppShape;
    ppLabel98: TppLabel;
    ppLabel94: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    LCT: TppLabel;
    LCP: TppLabel;
    LC: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    LCD: TppLabel;
    ppLabel90: TppLabel;
    ppRegion5: TppRegion;
    RT: TppRichText;
    ppRegion6: TppRegion;
    RT2: TppRichText;
    Qgrl_codvalidacao: TStringField;
    LOriginal1: TppLabel;
    LPortaria1: TppLabel;
    LAssinante1: TppLabel;
    LCargo1: TppLabel;
    LOriginal2: TppLabel;
    LPortaria2: TppLabel;
    LCargo2: TppLabel;
    LAssinante2: TppLabel;
    Qgrl_gradexml: TIntegerField;
    QAux: TQuery;
    Qgrl_gradepdf: TIntegerField;
    QGradesLetivo: TQuery;
    ppRegion7: TppRegion;
    BarCode2: Tpp2DBarCode;
    LOriginal21: TppLabel;
    LPortaria21: TppLabel;
    LAssinante21: TppLabel;
    LCargo21: TppLabel;
    LOriginal22: TppLabel;
    LPortaria22: TppLabel;
    LCargo22: TppLabel;
    LAssinante22: TppLabel;
    ppRegion8: TppRegion;
    BarCode3: Tpp2DBarCode;
    LOriginal31: TppLabel;
    LPortaria31: TppLabel;
    LAssinante31: TppLabel;
    LCargo31: TppLabel;
    LOriginal32: TppLabel;
    LPortaria32: TppLabel;
    LCargo32: TppLabel;
    LAssinante32: TppLabel;
    procedure B_RetornaClick(Sender: TObject);
    procedure E_CurCodExit(Sender: TObject);
    procedure B_LocCurClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure B_CancelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure E_PerLetExit(Sender: TObject);
    procedure QCalcFields(DataSet: TDataSet);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppHeaderBand3BeforePrint(Sender: TObject);
    procedure ppDBCalc1Calc(Sender: TObject);
    procedure ppDBCalc2Calc(Sender: TObject);
    procedure ppDBCalc3Calc(Sender: TObject);
    procedure ppDBCalc4Calc(Sender: TObject);
    procedure ppDBCalc5Calc(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppDBCalc6Calc(Sender: TObject);
    procedure ppDBCalc7Calc(Sender: TObject);
    procedure ppDBCalc8Calc(Sender: TObject);
    procedure GHBModuloBeforePrint(Sender: TObject);
    procedure GHBModuloAfterPrint(Sender: TObject);
    procedure GFBModuloAfterPrint(Sender: TObject);
    procedure ppDBCalc9Calc(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure GHBModulo2AfterPrint(Sender: TObject);
    procedure GHBModulo2BeforePrint(Sender: TObject);
    procedure GFBModulo2AfterPrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand4BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure ppDBCalc10Calc(Sender: TObject);
    procedure ppDBCalc15Calc(Sender: TObject);
    procedure ppDBCalc11Calc(Sender: TObject);
    procedure ppDBCalc16Calc(Sender: TObject);
    procedure ppDBCalc12Calc(Sender: TObject);
    procedure ppDBCalc13Calc(Sender: TObject);
    procedure ppDBCalc18Calc(Sender: TObject);
    procedure ppDBCalc17Calc(Sender: TObject);
    procedure ppDBCalc19Calc(Sender: TObject);
    procedure DBCLibrasCalc(Sender: TObject);
    procedure DBCLibras2Calc(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure GHBNOrdBeforePrint(Sender: TObject);
    procedure GHBModulo3AfterPrint(Sender: TObject);
    procedure GFBModulo3AfterPrint(Sender: TObject);
    procedure GHBModulo3BeforePrint(Sender: TObject);
    procedure GHBNOrd2BeforePrint(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppSummaryBand3BeforePrint(Sender: TObject);
    procedure QPratCalcFields(DataSet: TDataSet);
    procedure CBVigenteClick(Sender: TObject);
    procedure QGradAtuCalcFields(DataSet: TDataSet);
    procedure E_CurCodEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    periodo:string;
    Procedure GeraTXT;
    Procedure Imprime_Matriz;
    function InicializaPasta(Pasta : String) : Boolean;
    Function Recupera_Assinaturas(QGradesLetivo:TQuery;LOri1, LOri2, LPort1, LPort2,
             LAss1, LAss2, LCar1, LCar2:TppLabel; BC:Tpp2DBarCode):integer;
    Procedure Grava_Curriculo(gradepdf:integer);
    { private declarations }
  public
    { public declarations }
  end;

const
  C_PASTA_TEMPORARIA = 'C:\Sistemas\pdf_tmp';

var
  F_AntGrade: TF_AntGrade;

implementation

uses ULocGrad, UMenupri, UProcs, URotinas;

{$R *.DFM}

{ *************************************************************************************************************************************************** }

function TF_AntGrade.InicializaPasta(Pasta : String) : Boolean;
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

Function TF_AntGrade.Recupera_Assinaturas(QGradesLetivo:TQuery;LOri1, LOri2, LPort1, LPort2,
         LAss1, LAss2, LCar1, LCar2:TppLabel; BC:Tpp2DBarCode):integer;
var Assinaturas:TObjectList;
    docAssinaturas:DocAssinaturasViewModel;
    i:word;
    status:integer;
Begin
  LAss1.Caption:='';
  LCar1.Caption:='';
  LAss2.Caption:='';
  LCar2.Caption:='';
  LOri1.Visible:=false;
  LPort1.Visible:=false;
  LOri2.Visible:=false;
  LPort2.Visible:=false;
  status:=0;
  if QGradesLetivo['grl_gradexml'] <> Null then // arquivo xml já foi gerado, verificar se foi assinado
  begin
    Assinaturas:=TObjectList.Create;
    //Assinaturas:=ObterTodasPorDocumento(QItensLivDip['itl_historicoxml']);
    Assinaturas:=ObterTodasPorDocumento(QGradesLetivo['grl_gradexml']);
    if (Assinaturas <> nil) and (Assinaturas.Count <> 0)
    then
     Begin
       for i:=0 to Assinaturas.Count-1 do
       begin
         docAssinaturas:=DocAssinaturasViewModel(Assinaturas.Items[i]);
         if (docAssinaturas.ass_status = 3) then // assinado
         begin
            if docAssinaturas.ass_assinaturarvdd <> null  then
            begin
              case docAssinaturas.ass_assinaturarvdd of
                1:begin // assinatura esquerda
                    LOri1.Visible:=true;
                    LPort1.Visible:=true;
                    QAux.Close;
                    QAux.Sql.Clear;
                    QAux.Sql.Add('select * from crp_usuarios u, crp_pessoas p, outer sca_professor pr');
                    QAux.Sql.Add('where u.pes_nro = p.pes_nro and usr_login = to_char(pr.fun_matr) and usr_id =:id');
                    QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                    QAux.Open;
                    LAss1.Caption:=NULLToSpace(QAux['pes_nome']);
                    QAux.Close;
                    QAux.Sql.Clear;
                    QAux.Sql.Add('select ud.* from sca_usudocxml ud, crp_usuarios u');
                    QAux.Sql.Add('where to_char(ud.fun_matr) = u.usr_login and usr_id =:id and dxm_assinatura =:assinatura');
                    QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                    QAux.ParambyName('assinatura').AsSmallInt:=docAssinaturas.ass_assinaturarvdd;
                    QAux.Open;
                    LCar1.Caption:=NULLToSpace(QAux['dxm_cargo']);
                  end;
                2:begin // assinatura direita
                    LOri2.Visible:=true;
                    LPort2.Visible:=true;
                    QAux.Close;
                    QAux.Sql.Clear;
                    QAux.Sql.Add('select * from crp_usuarios u, crp_pessoas p, outer sca_professor pr');
                    QAux.Sql.Add('where u.pes_nro = p.pes_nro and usr_login = to_char(pr.fun_matr) and usr_id =:id');
                    QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                    QAux.Open;
                    LAss2.Caption:=NULLToSpace(QAux['pes_nome']);
                    QAux.Close;
                    QAux.Sql.Clear;
                    QAux.Sql.Add('select ud.* from sca_usudocxml ud, crp_usuarios u');
                    QAux.Sql.Add('where to_char(ud.fun_matr) = u.usr_login and usr_id =:id and dxm_assinatura =:assinatura');
                    QAux.ParambyName('id').AsInteger:=docAssinaturas.usr_id;
                    QAux.ParambyName('assinatura').AsSmallInt:=docAssinaturas.ass_assinaturarvdd;
                    QAux.Open;
                    LCar2.Caption:=NULLToSpace(QAux['dxm_cargo']);
                  end;
              end;
            end;
         end;
         status:=docAssinaturas.ass_status;
       end;
     End;
    Assinaturas.Free;
  end;
  BC.Data:='https://www.unoeste.br/curriculoescolar/' + NULLToSpace(QGradesLetivo['grl_codvalidacao']);
  result:=status;
End;

Procedure TF_AntGrade.Grava_Curriculo(gradepdf:integer);
var documento, docaux:DocumentosViewModel;
    ListadePastas:TObjectList;
    pastaNova:PastaViewModel;
    pastaEDocumentos, retorno:PastaEDocumentosViewModel;
    arquivoBytes:TArrayByte;
    imagem:ImagensViewModel;
    docbase64:AnsiString;
    gera:boolean;
Begin
  If vGED = 'S'
  Then
   Begin
     gera:=true;
     If gradepdf <> 0
     Then
      If MessageDlg('Atenção. Representação Visual do Currículo Escolar já foi gerado. Deseja gerar novamente ? ',mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then gera:=false;

     If gera
     Then
      Begin
        ListadePastas:=RetornarPastasPorConteudoDoCampo(QGedArea['are_codigo'],22,Q_Curso['cur_codigo']);
        if ListadePastas = nil then
        begin
          pastaNova:=CriarNovaPasta(QGedArea['are_codigo'],vcodusu,Q_Curso);
          ListadePastas:=TObjectList.Create();
          ListadePastas.Add(pastaNova);
        end;

        pastaEDocumentos:=PastaEDocumentosViewModel.Create();
        pastaEDocumentos.Pasta:=PastaViewModel(ListadePastas.Items[0]);

        if gradepdf = 0 then
        begin
          docaux:=DocumentosViewModel.Create();
          docaux:=BuscarDocumentoPorNome(pastaeDocumentos.Pasta.pst_codigo,'CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4),'PDF');
          if docaux <> nil then
             gradepdf:=docaux.doc_codigo;
          docaux.free;
        end;

        documento:=DocumentosViewModel.Create();
        //documento.doc_codigo:=NULLToZero(QItensLivDip['itl_historicopdf']);
        documento.doc_codigo:=gradepdf;
        documento.fun_matr:=vcodusu;
        documento.pst_codigo:=pastaeDocumentos.Pasta.pst_codigo;
        documento.doc_nivelprocesso:='I';
        documento.doc_dataarm:=DelphiDateTimeToISO8601Date(Pega_DataHora);
        documento.doc_extarq :='PDF';
        documento.doc_nomearquivo:='CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4) + '.PDF';
        documento.doc_arquivo:=vPastaServidor + IntToStr(pastaEDocumentos.Pasta.are_codigo) + '\' +
        IntToStr(pastaEDocumentos.Pasta.pst_codigo) + '\pdf\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4) + '.PDF';
        docbase64:=EncodeFile(C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF');
        FileToBytes(C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF', arquivoBytes);
        documento.doc_usanodiploma:='N';
        documento.doc_ativo:='S';
        imagem:=ImagensViewModel.Create();
        imagem.doc_imagemstr:=docbase64;
        documento.doc_tamanho:= Length(arquivoBytes);
        imagem.doc_imagem:=arquivoBytes;

        documento.imagens:=imagem;

        pastaEDocumentos.Documentos.Add(documento);

        retorno:=Atualizar_Documentos_Fluxo_Pasta_PastaValCampo(pastaEDocumentos);

        documento:=BuscarDocumentoPorNome(retorno.Pasta.pst_codigo,'CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4),'PDF');
        QGradesLetivo.Edit;
        QGradesLetivo['grl_gradepdf']:=documento.doc_codigo;
        QGradesLetivo['grl_dtgradepdf']:=Pega_DataHora();
        QGradesLetivo.Post;

        pastaEDocumentos.Free;
        retorno.Free;
        documento.Free;
      End;
   End;
End;

{ *************************************************************************************************************************************************** }

Procedure TF_AntGrade.Imprime_Matriz;
var vnomcur:string;
    ListadePastas, Assinaturas:TObjectList;
    docAssinaturas:DocAssinaturasViewModel;
    pastaNova:PastaViewModel;
    documento, docaux:DocumentosViewModel;
    pastaEDocumentos, retorno:PastaEDocumentosViewModel;
    i:word;
    status:integer;
    arquivoBytes:TArrayByte;
    imagem:ImagensViewModel;
    docbase64:AnsiString;
Begin
  status:=Recupera_Assinaturas(QGradesLetivo, LOriginal1, LOriginal2, LPortaria1, LPortaria2, LAssinante1, LAssinante2, LCargo1, LCargo2, BarCode);
  If (status <> 3) and (vGED = 'S') // arquivo xml ainda não foi totalmente assinado
  Then MessageDlg('Currículo Escolar Digital ainda não foi totalmente assinado. Representação Visual não pode ser gerada!',mtError,[mbok],0)
  Else
   Begin
     MDGrade.Close;
     MDGrade.Open;
     Q.First;
     While not Q.Eof do
     Begin
       MDGrade.Append;
       MDGrade['nord']:=StrToInt(Copy(StrZero(Q['gra_nordem'],4),1,2));
       MDGrade['dis_codigo']:=Q['dis_codigo'];
       If RGOrd.ItemIndex = 0
       Then MDGrade['gra_nordem']:=Q['gra_nordem']
       Else MDGrade['gra_nordem']:=Q['gra_nordem2'];
       MDGrade['hab_codigo']:=Q['hab_codigo'];
       MDGrade['dis_nomdisc']:=Q['dis_nomdisc'];
       MDGrade['dep_codigo']:=Q['dep_codigo'];
       MDGrade['gra_regime']:=Q['gra_regime'];
       MDGrade['dis_codigo']:=Q['dis_codigo'];
       MDGrade['gra_tipaul']:=Q['gra_tipaul'];
       MDGrade['gra_cont']:=Q['gra_cont'];
       MDGrade['gra_chteor']:=Q['gra_chteor'] - Q['gra_chteorpres'];
       MDGrade['gra_chprat']:=Q['gra_chprat'];
       MDGrade['hab_cghor']:=Q['hab_cghor'];
       MDGrade['gra_ncteor']:=Q['gra_ncteor'] - Q['gra_ncteorpres'];
       MDGrade['gra_ncprat']:=Q['gra_ncprat'];
       MDGrade['chtot']:=Q['gra_chteor'] + Q['gra_chprat'];
       If (Q['dis_controle'] = 13) // Libras (Optativa)
       Then MDGrade['chsoma2']:=0
       Else MDGrade['chsoma2']:=Q['gra_chteor'] + Q['gra_chprat'];

       If Q['gra_ncteor'] + Q['gra_ncprat'] = 0
       Then
        Begin
          MDGrade['chhoras']:=Q['gra_chteor'] + Q['gra_chprat'];
          MDGrade['chhorasead']:=Q['gra_chteorpres'];
          If (Q['dis_controle'] = 13) // Libras (Optativa)
          Then MDGrade['chsoma']:=0
          Else MDGrade['chsoma']:=Q['gra_chteor'] + Q['gra_chprat'];
        End
       Else
        Begin
          If (Q_Curso['cur_gradistancia'] = 'S') and (QGradesLetivo['grl_converteead'] = 'N')
          Then
           Begin
             MDGrade['chhoras']:=Q['gra_chteor'] + Q['gra_chprat'];
             MDGrade['chhorasead']:=Q['gra_chteorpres'];
             If (Q['dis_controle'] = 13) // Libras (Optativa)
             Then MDGrade['chsoma']:=0
             Else MDGrade['chsoma']:=Q['gra_chteor'] + Q['gra_chprat'];
           End
          Else
           Begin
             MDGrade['chhoras']:=LongInt(Round((Q['gra_chteor'] + Q['gra_chprat'])*50/60));
             MDGrade['chhorasead']:=LongInt(Round(Q['gra_chteorpres']*50/60));
             If (Q['dis_controle'] = 13) // Libras (Optativa)
             Then MDGrade['chsoma']:=0
             Else MDGrade['chsoma']:=LongInt(Round((Q['gra_chteor'] + Q['gra_chprat'])*50/60));
           End;  
        End;

       MDGrade['hab_nomhb1']:=Q['hab_nomhb1'];
       MDGrade['grl_inicio']:=Q['grl_inicio'];
       MDGrade['cur_nomcur']:=Q['cur_nomcur'];
       MDGrade['grl_codgra']:=Q['grl_codgra'];
       MDGrade['gra_nordem2']:=Q['gra_nordem2'];
       MDGrade['hab_ligacao']:=Q['hab_ligacao'];
       MDGrade['dis_controle']:=Q['dis_controle'];
       MDGrade['cer_seq']:=Q['cer_seq'];
       MDGrade['cer_titulo']:=Q['cer_titulo'];
       MDGrade['cer_modulo']:=Q['cer_modulo'];
       MDGrade['hab_comum']:=Q['hab_comum'];
       MDGrade['gra_pratviv']:=NULLToZero(Q['gra_pratviv']);
       If (Q_Curso['cur_gradistancia'] = 'S') and (Q['grl_converteead'] = 'N')
       Then MDGrade['chhorasprtviv']:=NULLToZero(Q['gra_pratviv'])
       Else MDGrade['chhorasprtviv']:=LongInt(Round(NULLToZero(Q['gra_pratviv'])*50/60));
       MDGrade['grl_chmativ']:=Q['grl_chmativ'];
       MDGrade['cer_descr']:=Q['cer_descr'];
       MDGrade['grl_mascara']:=Q['grl_mascara'];
       MDGrade['grl_nomhab1']:=Q['grl_nomhab1'];
       MDGrade['grl_anoinicio']:=Q['grl_anoinicio'];
       MDGrade['grl_seminicio']:=Q['grl_seminicio'];
       MDGrade['grl_periodo']:=Q['grl_periodo'];
       MDGrade['gra_chteorpres']:=Q['gra_chteorpres'];
       MDGrade['gra_ncteorpres']:=Q['gra_ncteorpres'];
       MDGrade['gra_per']:=Q['gra_per'];
       MDGrade['grl_convertehs']:=Q['grl_convertehs'];
       MDGrade['grl_converteead']:=Q['grl_converteead'];
       MDGrade['gra_ce']:=Q['gra_ce'];
       MDGrade.Post;

       Q.Next;
     End;

     ppGroup11.BreakName:='nord';
     ppGroup10.BreakName:='cer_seq';
     GHBModulo3.Visible:=True;
     GFBModulo3.Visible:=True;
     GHBNOrd2.Visible:=False;
     GFBNOrd2.Visible:=True;
     LCHM2.Caption:='Total do módulo : ';

     If Q_Curso['cur_exibecampus'] = 'S' // exibir o campus para este curso
     Then
      Begin
        If Length(Trim(Q_Curso['Cur_Nome'])) > 20
        Then Define_Tamanho_Fonte(12, 2, 'Times New Roman', 'MATRIZ CURRICULAR DO CURSO: '+Q_Curso['Cur_Nome']+' - CAMPUS '+Q_Curso['cam_descricao'], RTCurso)
        Else Define_Tamanho_Fonte(14, 2, 'Times New Roman', 'MATRIZ CURRICULAR DO CURSO: '+Q_Curso['Cur_Nome']+' - CAMPUS '+Q_Curso['cam_descricao'], RTCurso);
        // LNomCur.Caption:='MATRIZ CURRICULAR DO CURSO: '+Q_Curso['Cur_Nome']+' - CAMPUS '+Q_Curso['cam_descricao']
      End
     Else Define_Tamanho_Fonte(14, 2, 'Times New Roman', 'MATRIZ CURRICULAR DO CURSO: '+Q_Curso['Cur_NomCur'], RTCurso);
          // LNomCur.Caption:='MATRIZ CURRICULAR DO CURSO: '+Q_Curso['Cur_NomCur'];
     If (QGradesLetivo['grl_anoinicio'] <> Null) and (QGradesLetivo['grl_seminicio'] <> Null)
     Then LIngresso.Caption:='Ingresso: '+IntToStr(QGradesLetivo['grl_seminicio'])+'/'+IntToStr(QGradesLetivo['grl_anoinicio'])+periodo+' Nº: '+IntToStr(QGradesLetivo['GrL_CodGra'])
     Else LIngresso.Caption:=vnomcur+'Ano de Ingresso: '+IntToStr(QGradesLetivo['GrL_Inicio'])+periodo+' Nº: '+IntToStr(QGradesLetivo['GrL_CodGra']);

     If ((Q_Curso['cur_codigo'] = 4) and (QGradesLetivo['GrL_CodGra'] >= 17)) or ((Q_Curso['cur_codigo'] = 12) and (QGradesLetivo['GrL_CodGra'] >= 17)) or
        (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)
     Then
      Begin
       ppGroup11.BreakName:='cer_seq';
       ppGroup10.BreakName:='nord';
       GHBModulo3.Visible:=False;
       GFBModulo3.Visible:=True;
       GHBNOrd2.Visible:=True;
       GFBNOrd2.Visible:=False;
       LCHM2.Caption:='Carga horária total : ';
      End;

     ppRichView2.RichView.Clear;
     ppRichView2.RichView.Style.TextStyles.Items[0].FontName:='Arial';
     ppRichView2.RichView.Style.TextStyles.Items[0].Size:=10;
     ppRichView2.RichView.Style.TextStyles.Items[0].Color:=clBlack;
     ppRichView2.RichView.Style.TextStyles.Items[0].Style:=[];

     ppRichView2.RichView.Style.TextStyles.Items[1].FontName:='Arial';
     ppRichView2.RichView.Style.TextStyles.Items[1].Size:=10;
     ppRichView2.RichView.Style.TextStyles.Items[1].Color:=clBlack;
     ppRichView2.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

     ppRichView2.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
     ppRichView2.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;
     ppRichView2.RichView.Style.ParaStyles.Items[0].FirstIndent:=0;

     ppRichView2.RichView.Style.ParaStyles.Items[1].Alignment:=rvaLeft;
     ppRichView2.RichView.Style.ParaStyles.Items[1].LineSpacing:=100;
     ppRichView2.RichView.Style.ParaStyles.Items[1].FirstIndent:=0;

     Q.First;
     QPrat.Close;
     If (Q_Curso['cur_habilitacao'] = 2) or (Q_Curso['cur_habilitacao'] = 5)  // Licenciatura
     Then
      Begin
        QPrat.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
        QPrat.ParamByName('codgra').AsSmallInt:=QGradesLetivo['grl_codgra'];
      End
     Else
      Begin
        QPrat.ParamByName('codcur').AsSmallInt:=0;
        QPrat.ParamByName('codgra').AsSmallInt:=0;
      End;
     QPrat.Open;

     LCT.Caption:='CT - Nº de créditos teóricos (*)';
     LCP.Caption:='CP - Nº de créditos práticos (*)';
     LCD.Caption:='CaD - Nº de créditos a distância (*)';
     LC.Visible:=True;
     If (Q_Curso['cur_gradistancia'] = 'S') and (QGradesLetivo['grl_convertehs'] = 'S') and (QGradesLetivo['grl_converteead'] = 'N')
     Then
      Begin
        LCT.Caption:='CT - Nº de créditos teóricos';
        LCP.Caption:='CP - Nº de créditos práticos';
        LCD.Caption:='CaD - Nº de créditos a distância';
        LC.Visible:=False;
      End;

     RMatriz.AllowPrintToFile := True;
     RMatriz.ShowPrintDialog := False;
     RMatriz.ShowCancelDialog := False;
     RMatriz.TextFileName := C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF';
     RMatriz.DeviceType := 'PDF';
   //     Menuprin.Database1.Connected := False;
     RMatriz.Print;

     Grava_Curriculo(NULLToZero(QGradesLetivo['grl_gradepdf']));

     // Abrindo com a tela maximizada
     OpenPDF(C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF', SW_MAXIMIZE);
   End;
End;

Procedure TF_AntGrade.GeraTXT;
Var VLinha: String;
    ArqTXT: TextFile;
    totch, totest, totfis, vhab, totativ, totconcl:word;
Begin
 totch:=0;
 totest:=0;
 totfis:=0;
 totativ:=0;
 totconcl:=0;
 AssignFile(ArqTXT,'c:\sistemas\'+Q_Curso['cur_ident']+'.txt');
 Rewrite(ArqTXT);
 Writeln(ArqTXT,Trata_Texto(QGrade['Cur_NomCur']));
 Writeln(ArqTXT,Trata_Texto(QGrade['hab_nomhb1']));
 QGrade.First;
 vhab:=QGrade['hab_codigo'];
 While not QGrade.Eof do
 Begin
  If vhab <> QGrade['hab_codigo']
  Then
   Begin
    Writeln(ArqTXT,'Horas : '+StrZero(totch,5));
    Writeln(ArqTXT,'Estagio Supervisionado : '+StrZero(totest,5));
    Writeln(ArqTXT,'Atividades Complementares : '+StrZero(totativ,5));
    Writeln(ArqTXT,'Trabalho de Conclusão de Curso : '+StrZero(totconcl,5));
    Writeln(ArqTXT,'Carga Horaria : '+StrZero((totch+totest+totativ+totconcl),5));
    Writeln(ArqTXT,'Educacao Fisica : '+StrZero(totfis,5));
    Writeln(ArqTXT,'');
    Writeln(ArqTXT,Trata_Texto(QGrade['hab_nomhb1']));
    totch:=0;
    totest:=0;
    totfis:=0;
    totativ:=0;
    totconcl:=0;
    vhab:=QGrade['hab_codigo'];
   End;
  If (QGrade['dis_controle'] <> 8) and (QGrade['dis_controle'] <> 9) and (QGrade['dis_controle'] <> 10) and
     (QGrade['dis_controle'] <> 11) and (QGrade['dis_controle'] <> 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
  Then totch:=totch + QGrade['gra_chteor'] + QGrade['gra_chprat'];
  If (QGrade['dis_controle'] = 9) // Estagio
  Then totest:=totest + QGrade['gra_chteor'] + QGrade['gra_chprat'];
  If (QGrade['dis_controle'] = 8) // Educação Física
  Then totfis:=totfis + QGrade['gra_chteor'] + QGrade['gra_chprat'];
  If (QGrade['dis_controle'] = 10) // Atividades Complementares
  Then totativ:=totativ + QGrade['gra_chteor'] + QGrade['gra_chprat'];
  If (QGrade['dis_controle'] = 11) // Trabalho de Conclusão de Curso
  Then totconcl:=totconcl + QGrade['gra_chteor'] + QGrade['gra_chprat'];
  VLinha:='';
  VLinha:=Trata_Texto(QGrade['dis_nomdisc'])+StrZero(QGrade['gra_chteor'],3)+StrZero(QGrade['gra_chprat'],3)+
          StrZero((QGrade['gra_chteor']+QGrade['gra_chprat']),3);
//  VLinha:=AlinhaEsq(QGrade['dis_nomdisc'],50)+'|'+StrZero(QGrade['gra_chteor'],3)+'|'+StrZero(QGrade['gra_chprat'],3)+'|'+
//          StrZero((QGrade['gra_chteor']+QGrade['gra_chprat']),3);
  Writeln(ArqTXT,VLinha);
  QGrade.Next;
 End;
 Writeln(ArqTXT,'Horas : '+StrZero(totch,5));
 Writeln(ArqTXT,'Estagio Supervisionado : '+StrZero(totest,5));
 Writeln(ArqTXT,'Atividades Complementares : '+StrZero(totativ,5));
 Writeln(ArqTXT,'Trabalho de Conclusão de Curso : '+StrZero(totconcl,5));
 Writeln(ArqTXT,'Total de Carga Horaria : '+StrZero((totch+totest+totativ+totconcl),5));
 Writeln(ArqTXT,'Educacao Fisica : '+StrZero(totfis,5));
 CloseFile(ArqTXT);
End;

procedure TF_AntGrade.B_RetornaClick(Sender: TObject);
begin
  F_AntGrade.Close;
end;

procedure TF_AntGrade.E_CurCodExit(Sender: TObject);
begin
  if (ActiveControl<>B_Retorna) and (ActiveControl<>B_Cancela)then
    if E_CurCod.Text <> '' then
    begin
      if not Pesquisa(Q_Curso,[StrToInt(E_CurCod.Text)]) then
      begin
        MessageDlg('Este Curso não existe...', mtInformation,[mbOk], 0);
        If vexibe = 'S'
        Then E_CurCod.SetFocus;
      end
      else
        If (not Valida_Usuario2(Q_Curso['cur_codigo'])) and (vcodusu <> 65418) // Darcy liberou para que a professora Dayene tenha acesso a todas as grades 
        Then
         Begin
          MessageDlg('Usuário não tem permissão de emitir matriz curricular deste curso!',mtError,[mbOk],0);
          If vexibe = 'S'
          Then E_CurCod.SetFocus;
         End
        Else
         Begin
           QGedArea.Close;
           QGedArea.Sql.Clear;
           QGedArea.Sql.Add('select * from sca_gedarea');
           QGedArea.Sql.Add('where cur_grapos =:grapos and cur_area =:area and cur_gradistancia =:gradistancia and cam_codigo =:campus and');
           QGedArea.Sql.Add('gat_tipo = "C"');
           QGedArea.ParambyName('grapos').AsSmallInt:=Q_Curso['cur_grapos'];
           QGedArea.ParambyName('area').AsSmallInt:=Q_Curso['cur_area'];
           QGedArea.ParambyName('gradistancia').AsString:=Q_Curso['cur_gradistancia'];
           QGedArea.ParambyName('campus').AsSmallInt:=Q_Curso['cam_codigo'];
           QGedArea.Open;
           If QGedArea.Eof
           Then
            Begin
              MessageDlg('Não existe area do currículo escolar definida no GED. Representação Visual do Currículo Escolar não pode ser gerada em formato PDF.',mtError,[mbok],0);
              If vexibe = 'S'
              Then E_CurCod.Setfocus;
            End
           Else
            Begin
              QGradAtu.Close;
              QGradAtu.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
              QGradAtu.Open;
              QGradAtu.First;
              DBLCGrade.KeyValue:=QGradAtu['grl_codgra'];
            End;
         End;
    end
    else
    begin
      MessageDlg('É necessário escolher um Curso...', mtInformation,[mbOk], 0);
      If vexibe = 'S'
      Then E_CurCod.SetFocus;
    end;
end;

procedure TF_AntGrade.B_LocCurClick(Sender: TObject);
begin
  Application.CreateForm(TF_LocGrade, F_LocGrade);
  F_LocGrade.Hide;
  F_LocGrade.ShowModal;
  if vCodGra <> 0 then
  begin
    Pesquisa(Q_Curso,[vGraCur]);
    CBVigente.Checked:=False;
    E_CurCod.Text:=IntToStr(vGraCur);
    E_PerLet.Text:=IntToStr(vGraIni);
  end;
  If vexibe = 'S'
  Then E_CurCod.SetFocus;
end;

procedure TF_AntGrade.B_OkClick(Sender: TObject);
var i:word;
    grade,vnomcur:string;
    status:integer;
begin
  if (E_CurCod.Text <> '') and (((not CBVigente.Checked) and ((E_PerLet.Text<>'') or (CENum.Value <> 0))) or
     ((CBVigente.Checked) and (QGradAtu['grl_codgra'] <> Null))) then
  begin
   If F_AntGrade.Tag = 1
   Then
    Begin
     Q.Close;
     Q.Sql.Clear;
     Q.Sql.Add('Select D.Dis_Codigo, G.Gra_NOrdem, G.Hab_Codigo, D.Dis_NomDisc,');
     Q.Sql.Add('D.Dep_Codigo, G.Gra_Regime, G.Gra_TipAul, G.Gra_Cont,');
     Q.Sql.Add('G.Gra_CHTeor, G.Gra_CHPrat, H.Hab_CgHor, G.Gra_NCTeor,');
{     If (StrToInt(E_CurCod.Text) = 17) and ((CENum.Value = 4) or (StrToInt(E_PerLet.Text) = 1997) or (CENum.Value = 6) or (StrToInt(E_PerLet.Text) = 1998))
     Then Q.Sql.Add('G.Gra_NCPrat, "CIÊNCIAS - HABILITAÇÃO : FÍSICA" Hab_NomHB1, GL.Grl_Inicio, C.Cur_NomCur,')
//     Then Q.Sql.Add('G.Gra_NCPrat, "CIÊNCIAS - LICENCIATURA PLENA  HABILITAÇÃO : FÍSICA" Hab_NomHB1, GL.Grl_Inicio, C.Cur_NomCur,')
//     Then Q.Sql.Add('G.Gra_NCPrat, "CIÊNCIAS - LICENCIATURA DE 1º GRAU" Hab_NomHB1, GL.Grl_Inicio, C.Cur_NomCur,')
     Else Q.Sql.Add('G.Gra_NCPrat, H.Hab_NomHB1, GL.Grl_Inicio, C.Cur_NomCur,');}
     Q.Sql.Add('G.Gra_NCPrat, H.Hab_NomHB1, GL.Grl_Inicio, C.Cur_NomCur,');
     Q.Sql.Add('GL.GRL_CodGra, G.Gra_NOrdem2, H.Hab_Ligacao, D.Dis_Controle,');
     Q.Sql.Add('CE.Cer_Seq, Cer_Titulo, Cer_Modulo, Cer_Descr, Hab_Comum, Gra_PratViv,');
     Q.Sql.Add('grl_chmativ, grl_mascara, grl_nomhab1, grl_anoinicio, grl_seminicio,');
     Q.Sql.Add('grl_periodo, gra_chteorpres, gra_ncteorpres, gra_per, grl_convertehs, grl_converteead,');
     Q.Sql.Add('gra_ce, grl_codvalidacao, grl_gradexml, grl_gradepdf');
     Q.Sql.Add('From SCA_Grades G, SCA_Grades_Letivo GL, SCA_Disciplinas D,');
     Q.Sql.Add('SCA_Habilitacao H, SCA_Cursos C, Outer SCA_Certificacao CE');
     Q.Sql.Add('Where G.Dis_Codigo = D.Dis_Codigo and D.Cur_Codigo = GL.Cur_Codigo');
//     Q.Sql.Add('Where G.Dis_Codigo = D.Dis_Codigo and (D.Cur_Codigo = GL.Cur_Codigo or d.cur_codigo = 992)');
     Q.Sql.Add('and G.Hab_Codigo = H.Hab_Codigo and GL.GrL_CodGra = G.GrL_CodGra');
     Q.Sql.Add('and GL.Cur_Codigo = C.Cur_Codigo and GL.Cur_Codigo = :vCur');
     If CBVigente.Checked
     Then
      Begin
        Q.Sql.Add('and GL.GrL_CodGra =:codgra');
        Q.ParamByName('codgra').AsInteger:=QGradAtu['grl_codgra'];
      End
     Else
      Begin
        If E_Perlet.Text <> ''
        Then
         Begin
          Q.Sql.Add('and GL.GrL_Inicio = (Select Max(GrL_Inicio) From SCA_Grades_Letivo');
          Q.Sql.Add('Where Cur_Codigo = :vCur and GrL_Inicio <=:Vper)');
          Q.ParamByName('vPer').AsInteger:=StrToInt(E_PerLet.Text);
         End
        Else
         Begin
          Q.Sql.Add('and GL.GrL_CodGra =:codgra');
          Q.ParamByName('codgra').AsInteger:=CENum.AsInteger;
         End;
      End;
     Q.Sql.Add('and C.Cur_Codigo = CE.Cur_Codigo and G.Cer_Seq = CE.Cer_Seq');
     Q.Sql.Add('and gra_ativo = 1');
//     Q.Sql.Add('and ((grl_mascara < 8) or (grl_mascara >= 8 and dis_controle <> 13))'); // a partir da máscara 8, não mostrar mais a disciplina de libras
//     Q.Sql.Add('and ((grl_anoinicio is null) or (grl_anoinicio is not null and grl_anoinicio < 2019) or (grl_anoinicio is not null and grl_anoinicio >= 2019 and dis_controle <> 13))'); // a partir das grades com inicio em  2019, não mostrar mais a disciplina de libras optativa
     Q.Sql.Add('and ((grl_convertehs = "N") or (grl_convertehs = "S" and dis_controle <> 13))'); // a partir das grades que converte a carga horária para hora relógio, não mostrar mais a disciplina de libras optativa - 21/05/2019
     If RGOrd.ItemIndex = 0
     Then
      Begin
{       If ((Q_Curso['cur_codigo'] = 23) and (Q['GrL_CodGra'] >= 10) and (Q['GrL_CodGra'] <> 25)) or
          ((Q_Curso['cur_codigo'] = 18) and (Q['GrL_CodGra'] >= 5)) or
          ((Q_Curso['cur_codigo'] >= 101) and (Q_Curso['cur_codigo'] <= 106) and (Q['GrL_CodGra'] >= 3) and (Q['GrL_CodGra'] <> 4)) or
          ((Q_Curso['cur_codigo'] = 22) and (Q['GrL_CodGra'] >= 6)) or
          (Q_Curso['cur_codigo'] = 132)
       Then Q.Sql.Add('Order By Hab_Comum, H.Hab_Ligacao, G.Hab_Codigo, G.Gra_NOrdem, CE.Cer_Seq')
       Else Q.Sql.Add('Order By H.Hab_Ligacao, G.Hab_Codigo, G.Gra_NOrdem, CE.Cer_Seq');}
       Q.Sql.Add('Order By Hab_Comum, H.Hab_Ligacao, G.Hab_Codigo, G.Gra_NOrdem, CE.Cer_Seq');
       DBTNOrd.Visible:=True;
       DBTNOrd2.Visible:=True;
       DBTRef.Visible:=False;
       DBTRef2.Visible:=False;
      End
     Else
      Begin
{       If ((Q_Curso['cur_codigo'] = 23) and (Q['GrL_CodGra'] >= 10) and (Q['GrL_CodGra'] <> 25)) or
          ((Q_Curso['cur_codigo'] = 18) and (Q['GrL_CodGra'] >= 5)) or
          ((Q_Curso['cur_codigo'] >= 101) and (Q_Curso['cur_codigo'] <= 106) and (Q['GrL_CodGra'] >= 3) and (Q['GrL_CodGra'] <> 4)) or
          ((Q_Curso['cur_codigo'] = 22) and (Q['GrL_CodGra'] >= 6)) or
          (Q_Curso['cur_codigo'] = 132)
       Then Q.Sql.Add('Order By Hab_Comum, H.Hab_Ligacao, G.Hab_Codigo, G.Gra_NOrdem2, CE.Cer_Seq')
       Else Q.Sql.Add('Order By H.Hab_Ligacao, G.Hab_Codigo, G.Gra_NOrdem2, CE.Cer_Seq');}
       Q.Sql.Add('Order By Hab_Comum, H.Hab_Ligacao, G.Hab_Codigo, G.Gra_NOrdem2, CE.Cer_Seq');
       DBTNOrd.Visible:=False;
       DBTNOrd2.Visible:=False;
       DBTRef.Visible:=True;
       DBTRef2.Visible:=True;
      End;
     Q.ParamByName('vCur').AsInteger:=StrToInt(E_CurCod.Text);
     Q.Open;
     If Q.Eof
     Then
      Begin
       If E_Perlet.Text <> ''
       Then MessageDlg('Não há matriz curricular para este período ou período anterior!',mtError,[mbOk],0)
       Else MessageDlg('Não há matriz curricular com este número!',mtError,[mbOk],0);
      End
     Else
      Begin
       QGradesLetivo.Close;
       QGradesLetivo.Sql.Clear;
       QGradesLetivo.Sql.Add('select * from sca_grades_letivo');
       QGradesLetivo.Sql.Add('where cur_codigo =:codcur and grl_codgra =:codgra');
       QGradesLetivo.ParamByName('codcur').AsInteger:=Q_Curso['cur_codigo'];
       QGradesLetivo.ParamByName('codgra').AsInteger:=Q['grl_codgra'];
       QGradesLetivo.Open;

       periodo:='';
       If Q['grl_periodo'] <> Null
       Then
        Case Q['grl_periodo'] of
          1:periodo:=' Período: Diurno';
          2:periodo:=' Período: Noturno';
          3:periodo:=' Período: Integral';
          4:periodo:=' Período: Diurno ou Noturno';
          5:periodo:=' Período: Diurno ou Noturno/Diurno';
          6:periodo:=' Período: Matutino';
          7:periodo:=' Período: Vespertino';
          8:periodo:=' Período: Matutino ou Noturno';
          9:periodo:=' Período: Vespertino ou Noturno';
         10:periodo:=' Período: Integral ou Noturno';
        End;
       If (Q['grl_mascara'] = 1) or (Q['grl_mascara'] = 3) or (Q['grl_mascara'] = 4) or
          (Q['grl_mascara'] = 6) or (Q['grl_mascara'] = 8) // Atividades Acadêmico-Científico-Culturais ou Atividades Complementares (incluindo trabalho de curso)
  {     If ((Q_Curso['cur_codigo'] = 23) and (Q['GrL_CodGra'] >= 10) and (Q['GrL_CodGra'] <> 25)) or
          ((Q_Curso['cur_codigo'] = 18) and (Q['GrL_CodGra'] >= 5)) or
          ((Q_Curso['cur_codigo'] >= 101) and (Q_Curso['cur_codigo'] <= 106) and (Q['GrL_CodGra'] >= 3) and (Q['GrL_CodGra'] <> 4)) or
          ((Q_Curso['cur_codigo'] = 22) and (Q['GrL_CodGra'] >= 6)) or
          (Q_Curso['cur_codigo'] = 132)}
       Then
        Begin
//          If (Q['grl_anoinicio'] <> Null) and (Q['grl_anoinicio'] >= 2019) and (Q_Curso['cur_area'] <> 1)
          If (Q['grl_convertehs'] = 'S') // and (Q_Curso['cur_area'] <> 1) - Ricardo pediu para matriz curricular ser igual a da graduação - 20/12/2019
          Then Imprime_Matriz
          Else
           Begin
             status:=Recupera_Assinaturas(QGradesLetivo, LOriginal31, LOriginal32, LPortaria31, LPortaria32, LAssinante31, LAssinante32, LCargo31, LCargo32, BarCode3);
             If (status <> 3) and (vGED = 'S') // arquivo xml ainda não foi totalmente assinado
             Then MessageDlg('Currículo Escolar Digital ainda não foi totalmente assinado. Representação Visual não pode ser gerada!',mtError,[mbok],0)
             Else
              Begin
                If Q_Curso['cur_exibecampus'] = 'S' // exibir o campus para este curso
                Then vnomcur:=Q_Curso['Cur_Nome']+' - CAMPUS '+Q_Curso['cam_descricao']
                Else vnomcur:=Q_Curso['Cur_NomCur'];
                If (Q['grl_anoinicio'] <> Null) and (Q['grl_seminicio'] <> Null)
                Then
                 Begin
                   If (Q_Curso['cur_codigo'] = 683) or (Q_Curso['cur_codigo'] = 684) // O Elias pediu para tirar o ingresso nestes cursos - 25/04/2017
                   Then LCurso2.Caption:=vnomcur+'    Nº: '+IntToStr(Q['GrL_CodGra'])+periodo+'  ('+IntToStr(Q['GrL_Inicio'])+')'
                   Else LCurso2.Caption:=vnomcur+'    Ingresso: '+IntToStr(Q['grl_seminicio'])+'/'+IntToStr(Q['grl_anoinicio'])+' Nº: '+IntToStr(Q['GrL_CodGra'])+periodo+'  ('+IntToStr(Q['GrL_Inicio'])+')';
                 End
                Else LCurso2.Caption:=vnomcur+'    Ano de Ingresso: '+IntToStr(Q['GrL_Inicio'])+' Nº: '+IntToStr(Q['GrL_CodGra'])+periodo;
                LHoras2.Caption:='Horas.................................................:';
                If Q_Curso['cur_area'] = 1 // Ensino Médio
                Then
                 Begin
                   If Q_Curso['cur_pronatec'] = 'S' // Pronatec
                   Then LInst2.Caption:='UNOESTE - CURSOS TÉCNICOS DE NÍVEL MÉDIO'
                   Else LInst2.Caption:='COLÉGIO UNOESTE - Ensino Médio e Profissional';
         //           LEndereco2.Caption:='Rua José Bongiovani, 745 - Cidade Universitária - Pres. Prudente - SP';
                   LEndereco2.Caption:=CampusI;
                 End
                Else
                 Begin
                  LInst2.Caption:='UNOESTE - Universidade do Oeste Paulista';
                  LHoras2.Caption:='Conteúdos Curriculares de Natureza Científico-Cultural:';
        //           LEndereco2.Caption:='Rua José Bongiovani, 700 - Cidade Universitária - CEP 19.050-900 - Pres. Prudente - SP  /Fone: (018) 229-1000   Fax: (018) 229-1013';
                  LEndereco2.Caption:=CampusI;
                 End;
                If Q_Curso['cur_codigo'] = 23 // Pedagogia
                Then
                 Begin
         //         LEstSup.Visible:=True;
         //         ppDBCalc19.Visible:=True;
                  If (Q['GrL_CodGra'] = 10) or (Q['GrL_CodGra'] = 13) or (Q['GrL_CodGra'] = 19) or (Q['GrL_CodGra'] = 22) or (Q['GrL_CodGra'] = 16)
                  Then LEstSup.Caption:='Est. Sup. em Adm. Escolar.............................:'
                  Else
                   If (Q['GrL_CodGra'] = 11) or (Q['GrL_CodGra'] = 20) or (Q['GrL_CodGra'] = 14) or (Q['GrL_CodGra'] = 23) or (Q['GrL_CodGra'] = 17)
                   Then LEstSup.Caption:='Est. Sup. em Ori. Escolar.............................:'
                   Else LEstSup.Caption:='Est. Sup. em Sup. Escolar.............................:';
                 End
                Else
                 Begin
                  LEstSup.Visible:=False;
                  ppDBCalc19.Visible:=False;
                  Desloca(F_AntGrade,10,0.1771,0,0,0);
                 End;

                If NULLToZero(Q['grl_anoinicio']) >= 2015
                Then
                 Begin
                   LCHS2.Caption:='CHaD';
                   LCS2.Caption:='CaD';
                   LTitCHS2.Caption:='CHaD - Carga Horária a Distância   ';
                   LTitCS2.Caption:='CaD - Nº de Créditos a Distância    ';
                 End
                Else
                 Begin
                   LCHS2.Caption:='CHS';
                   LCS2.Caption:='CS';
                   LTitCHS2.Caption:='CHS - Carga Horária Semipresencial   ';
                   LTitCS2.Caption:='CS - Nº de Créditos Semipresenciais   ';
                 End;

                RGrade2.AllowPrintToFile := True;
                RGrade2.ShowPrintDialog := False;
                RGrade2.ShowCancelDialog := False;
                RGrade2.TextFileName := C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF';
                RGrade2.DeviceType := 'PDF';
                RGrade2.Print;
                If Q_Curso['cur_codigo'] <> 23 // Pedagogia
                Then
                 Begin
                  LEstSup.Visible:=True;
                  ppDBCalc19.Visible:=True;
                  Desloca(F_AntGrade,10,0,0.1771,0,0);
                 End;

                Grava_Curriculo(NULLToZero(QGradesLetivo['grl_gradepdf']));

                OpenPDF(C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF', SW_MAXIMIZE);
              End;
           End;
        End
       Else
        Begin
//          If (Q['grl_anoinicio'] <> Null) and (Q['grl_anoinicio'] >= 2019) and (Q_Curso['cur_area'] <> 1)
          If (Q['grl_convertehs'] = 'S') // and (Q_Curso['cur_area'] <> 1) - Ricardo pediu para matriz curricular ser igual a da graduação - 20/12/2019
          Then Imprime_Matriz
          Else
           Begin
             status:=Recupera_Assinaturas(QGradesLetivo, LOriginal21, LOriginal22, LPortaria21, LPortaria22, LAssinante21, LAssinante22, LCargo21, LCargo22, BarCode2);
             If (status <> 3) and (vGED = 'S') // arquivo xml ainda não foi totalmente assinado
             Then MessageDlg('Currículo Escolar Digital ainda não foi totalmente assinado. Representação Visual não pode ser gerada!',mtError,[mbok],0)
             Else
              Begin
                ppGroup2.BreakName:='nord';
                ppGroup4.BreakName:='cer_seq';
                GHBModulo.Visible:=True;
                GFBModulo.Visible:=True;
                GHBNOrd.Visible:=False;
                GFBNOrd.Visible:=True;
                LCHM.Caption:='Carga Horária no Módulo : ';
                If Q_Curso['cur_exibecampus'] = 'S' // exibir o campus para este curso
                Then vnomcur:=Q_Curso['Cur_Nome']+' - CAMPUS '+Q_Curso['cam_descricao']
                Else vnomcur:=Q_Curso['Cur_NomCur'];
                If (Q['grl_anoinicio'] <> Null) and (Q['grl_seminicio'] <> Null)
                Then
                 Begin
                   If (Q_Curso['cur_codigo'] = 683) or (Q_Curso['cur_codigo'] = 684) // O Elias pediu para tirar o ingresso nestes cursos - 25/04/2017
                   Then LCurso.Caption:=vnomcur+'    Nº: '+IntToStr(Q['GrL_CodGra'])+periodo+'  ('+IntToStr(Q['GrL_Inicio'])+')'
                   Else LCurso.Caption:=vnomcur+'    Ingresso: '+IntToStr(Q['grl_seminicio'])+'/'+IntToStr(Q['grl_anoinicio'])+' Nº: '+IntToStr(Q['GrL_CodGra'])+periodo+'  ('+IntToStr(Q['GrL_Inicio'])+')';
                 End
                Else LCurso.Caption:=vnomcur+'    Ano de Ingresso: '+IntToStr(Q['GrL_Inicio'])+' Nº: '+IntToStr(Q['GrL_CodGra'])+periodo;
                LHoras.Caption:='Horas.........................:';
                If Q_Curso['cur_area'] = 1 // Ensino Médio
                Then
                 Begin
                   If Q_Curso['cur_pronatec'] = 'S' // Pronatec
                   Then LInst.Caption:='UNOESTE - CURSOS TÉCNICOS DE NÍVEL MÉDIO'
                   Else LInst.Caption:='COLÉGIO UNOESTE - Ensino Médio e Profissional';
         //           LEndereco.Caption:='Rua José Bongiovani, 745 - Cidade Universitária - Pres. Prudente - SP';
                   LEndereco.Caption:=CampusI;
                 End
                Else
                 Begin
                  LInst.Caption:='UNOESTE - Universidade do Oeste Paulista';
        //           LEndereco.Caption:='Rua José Bongiovani, 700 - Cidade Universitária - CEP 19.050-900 - Pres. Prudente - SP  /Fone: (018) 229-1000   Fax: (018) 229-1013';
                  LEndereco.Caption:=CampusI;
                 End;
                If ((Q_Curso['cur_codigo'] = 4) and (Q['GrL_CodGra'] >= 17)) or ((Q_Curso['cur_codigo'] = 12) and (Q['GrL_CodGra'] >= 17)) or
                   (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)
                Then
                 Begin
                  ppGroup2.BreakName:='cer_seq';
                  ppGroup4.BreakName:='nord';
                  GHBModulo.Visible:=False;
                  GFBModulo.Visible:=True;
                  GHBNOrd.Visible:=True;
                  GFBNOrd.Visible:=False;
                  LCHM.Caption:='Carga Horária Total : ';
                 End;
        {        If (Q_Curso['cur_codigo'] = 17) and ((Q['GrL_CodGra'] = 4) or (Q['GrL_CodGra'] = 6))
                 // Formato da grade tem formato diferente devido a um processo movido contra a apec não podendo haver totalizador por habilitação
                Then
                 Begin
                  ppGroup1.BreakName:='grl_codgra';
                  ppGroup2.BreakName:='grl_codgra';
                 End;}

                ppRichView1.RichView.Clear;
                ppRichView1.RichView.Style.TextStyles.Items[0].FontName:='Arial';
                ppRichView1.RichView.Style.TextStyles.Items[0].Size:=10;
                ppRichView1.RichView.Style.TextStyles.Items[0].Color:=clBlack;
                ppRichView1.RichView.Style.TextStyles.Items[0].Style:=[];

                ppRichView1.RichView.Style.TextStyles.Items[1].FontName:='Arial';
                ppRichView1.RichView.Style.TextStyles.Items[1].Size:=10;
                ppRichView1.RichView.Style.TextStyles.Items[1].Color:=clBlack;
                ppRichView1.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

                ppRichView1.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
                ppRichView1.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;
                ppRichView1.RichView.Style.ParaStyles.Items[0].FirstIndent:=0;

                ppRichView1.RichView.Style.ParaStyles.Items[1].Alignment:=rvaLeft;
                ppRichView1.RichView.Style.ParaStyles.Items[1].LineSpacing:=100;
                ppRichView1.RichView.Style.ParaStyles.Items[1].FirstIndent:=0;

                If NULLToZero(Q['grl_anoinicio']) >= 2015
                Then
                 Begin
                   LCHS.Caption:='CHaD';
                   LCS.Caption:='CaD';
                   LTitCHS.Caption:='CHaD - Carga Horária a Distância   ';
                   LTitCS.Caption:='CaD - Nº de Créditos a Distância    ';
                 End
                Else
                 Begin
                   LCHS.Caption:='CHS';
                   LCS.Caption:='CS';
                   LTitCHS.Caption:='CHS - Carga Horária Semipresencial   ';
                   LTitCS.Caption:='CS - Nº de Créditos Semipresenciais   ';
                 End;

                RGrade.AllowPrintToFile := True;
                RGrade.ShowPrintDialog := False;
                RGrade.ShowCancelDialog := False;
                RGrade.TextFileName := C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF';
                RGrade.DeviceType := 'PDF';
                RGrade.Print;

                Grava_Curriculo(NULLToZero(QGradesLetivo['grl_gradepdf']));

                OpenPDF(C_PASTA_TEMPORARIA+'\CURRICULO_'+StrZero(vcurso,4)+StrZero(vligacao,4)+'.PDF', SW_MAXIMIZE);
              End;
           End;
        End;
      End;
    End;
   Q_Curso.Close;
   E_CurCod.Text:='';
   If vexibe = 'S'
   Then E_CurCod.SetFocus;
  end;
end;

procedure TF_AntGrade.B_CancelaClick(Sender: TObject);
begin
  if (ActiveControl <> B_Retorna) then
  begin
    E_CurCod.Text:='';
    Q_Curso.Close;
    If vexibe = 'S'
    Then E_CurCod.SetFocus;
  end;
end;

procedure TF_AntGrade.FormActivate(Sender: TObject);
begin
//  CBPER.Visible:=(vcodusu = 9308) or (vcodusu = 43065);
  If vexibe = 'S'
  Then E_CurCod.SetFocus;
end;

procedure TF_AntGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Q_Curso.Close;
  Release;
end;

procedure TF_AntGrade.FormCreate(Sender: TObject);
begin
    { Gerando pasta temporária }
    if not InicializaPasta(C_PASTA_TEMPORARIA)
       then begin
                MessageDlg('Não foi possível gerar a pasta temporária. Verifique as permissões de gravação!',mtInformation,[mbOk],0);
                PostMessage(self.handle,wm_close,0,0);
                Exit;
            end;

  If vexibe = 'N'
  Then
   Begin
     CBVigente.Checked:=False;
     E_CurCodEnter(Sender);
     E_CurCod.Text:=IntToStr(vcurso);
     E_CurCodExit(Sender);
     CENum.Value:=vligacao;
     B_OkClick(Sender);
   End;
end;

procedure TF_AntGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TF_AntGrade.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TF_AntGrade.E_PerLetExit(Sender: TObject);
begin
 If RGOrd.ItemIndex = -1
 Then RGOrd.ItemIndex:=0;
end;

procedure TF_AntGrade.QCalcFields(DataSet: TDataSet);
begin
 nord.value:=StrToInt(Copy(StrZero(NULLToZero(Q['gra_nordem']),4),1,2));
end;

procedure TF_AntGrade.ppDetailBand2BeforePrint(Sender: TObject);
begin
 If ppShape2.Brush.Color = clWhite
 Then ppShape2.Brush.Color:=$00F5F5F5
 Else ppShape2.Brush.Color:=clWhite;
 LPER.Visible:=(CBPER.Visible) and (CBPER.Checked) and (Q['gra_per'] = 'S');
 LCHT.Caption:=IntToStr(Q['gra_chteor'] - Q['gra_chteorpres']);
 LNCT.Caption:=IntToStr(Q['gra_ncteor'] - Q['gra_ncteorpres']);
 LTot.Caption:=IntToStr(Q['gra_chteor'] + Q['gra_chprat']);
end;

procedure TF_AntGrade.ppHeaderBand3BeforePrint(Sender: TObject);
begin
 ppShape2.Brush.Color:=$00F5F5F5;
end;

procedure TF_AntGrade.ppDBCalc1Calc(Sender: TObject);
begin
 If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
    (Q['dis_controle'] = 11) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
 Then
  Begin
    ppDBCalc1.Value:=ppDBCalc1.Value - Q['gra_chteor']; // Elias pediu para não somar mais libras optativa em Medicina - 20/05/2019
//    If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015) and (Q['dis_controle'] = 13) // a pedido da Darcy, deve-se somar a carga horária de Libras optativa nas grades de Medicina a partir de 2015
//    Then ppDBCalc1.Value:=ppDBCalc1.Value + Q['gra_chprat']
//    Else ppDBCalc1.Value:=ppDBCalc1.Value - Q['gra_chteor'];
  End
 Else ppDBCalc1.Value:=ppDBCalc1.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc2Calc(Sender: TObject);
begin
 If Q_Curso['cur_area'] = 1 // Ensino Médio
 Then
  Begin
{   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
      (Q['dis_controle'] = 11) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
   Then ppDBCalc2.Value:=ppDBCalc2.Value - Q['gra_chteor']
   Else ppDBCalc2.Value:=ppDBCalc2.Value - Q['gra_chteor'] + (Q['gra_chteor']*50/60) + (Q['gra_chprat']*50/60);}
   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
      (Q['dis_controle'] = 11) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
   Then ppDBCalc2.Value:=ppDBCalc2.Value - Q['gra_chteor']
   Else ppDBCalc2.Value:=ppDBCalc2.Value + Q['gra_chprat'];
  End
 Else
  If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
     (Q['dis_controle'] = 11) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
  Then
   Begin
     ppDBCalc2.Value:=ppDBCalc2.Value - Q['gra_chteor']; // Elias pediu para não somar mais libras optativa em Medicina - 20/05/2019
//     If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015) and (Q['dis_controle'] = 13) // a pedido da Darcy, deve-se somar a carga horária de Libras optativa nas grades de Medicina a partir de 2015
//     Then ppDBCalc2.Value:=ppDBCalc2.Value + Q['gra_chprat']
//     Else ppDBCalc2.Value:=ppDBCalc2.Value - Q['gra_chteor'];
   End
  Else ppDBCalc2.Value:=ppDBCalc2.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc3Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 9 // Estagio
 Then ppDBCalc3.Value:=ppDBCalc3.Value - Q['gra_chteor']
 Else ppDBCalc3.Value:=ppDBCalc3.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc4Calc(Sender: TObject);
begin
 If Q_Curso['cur_area'] = 1 // Ensino Médio
 Then
  Begin
{   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 13) // Educação Física, Libras
   Then ppDBCalc4.Value:=ppDBCalc4.Value - Q['gra_chteor']
   Else
    If (Q['dis_controle'] = 9) // Estágio
    Then ppDBCalc4.Value:=ppDBCalc4.Value + Q['gra_chprat']
    Else ppDBCalc4.Value:=ppDBCalc4.Value - Q['gra_chteor'] + (Q['gra_chteor']*50/60) + (Q['gra_chprat']*50/60);}
   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 13) // Educação Física, Libras
   Then ppDBCalc4.Value:=ppDBCalc4.Value - Q['gra_chteor']
   Else ppDBCalc4.Value:=ppDBCalc4.Value + Q['gra_chprat'];
  End
 Else
  If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 13) // Educação Física, Libras
  Then ppDBCalc4.Value:=ppDBCalc4.Value - Q['gra_chteor']
  Else ppDBCalc4.Value:=ppDBCalc4.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc5Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 8 // Educação Física
 Then ppDBCalc5.Value:=ppDBCalc5.Value - Q['gra_chteor']
 Else ppDBCalc5.Value:=ppDBCalc5.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppGroupFooterBand1BeforePrint(Sender: TObject);
var tottrab,totativ, totgrade:word;
begin
 QObsGrade.Close;
 QObsGrade.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
 QObsGrade.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
 QObsGrade.ParamByName('codhab').AsSmallInt:=Q['hab_codigo'];
 QObsGrade.Open;
 tottrab:=0;
 totativ:=0;
 QObsGrade.First;
 While not QObsGrade.Eof do
 Begin
  If QObsGrade['obg_tipo'] = 1 // Atividades Complementares
  Then totativ:=NULLToZero(QObsGrade['obg_chativ'])
  Else
   If QObsGrade['obg_tipo'] = 3 // Horas trabalho
   Then tottrab:=NULLToZero(QObsGrade['obg_chtrab']);
  QObsGrade.Next;
 End;
 ppMemo4.Text:='';
 ppMemo4.Lines.Add('');
 If (Q['grl_mascara'] = 0) or (Q['grl_mascara'] = 2) or (Q['grl_mascara'] = 7)
 Then
  Begin
    If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015)
    Then ppMemo4.Lines.Add('Horas/Aulas de 50 minutos.............................:'+AlinhaDir2(ppDBCalc2.Text,5)+'     '+AlinhaDir2(IntToStr(Trunc(ppDBCalc2.Value * 50 / 60)),5)+' horas')
    Else ppMemo4.Lines.Add('Horas.................................................:'+AlinhaDir2(ppDBCalc2.Text,5));
  End
 Else ppMemo4.Lines.Add('Horas.................................................:'+AlinhaDir2(IntToStr(Trunc(ppDBCalc2.Value * 50 / 60)),5)+'     '+AlinhaDir2(ppDBCalc2.Text,5));
 If (Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)  // Medicina
 Then
  Begin
    If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015)
    Then ppMemo4.Lines.Add('Estágio Curricular (Internato)........................:'+AlinhaDir2(' ',5)+'     '+AlinhaDir2(ppDBCalc3.Text,5))
    Else ppMemo4.Lines.Add('Estágio Curricular (Internato)........................:'+AlinhaDir2(ppDBCalc3.Text,5));
  End
 Else ppMemo4.Lines.Add('Estágio Supervisionado................................:'+AlinhaDir2(ppDBCalc3.Text,5));
 If ((Q_Curso['fac_codigo'] = 1) and ((Q['GrL_Inicio'] = 2003) or (Q['GrL_Inicio'] = 22003)) and (Q_Curso['cur_codigo'] <> 23) and (Q_Curso['cur_codigo'] <> 22)) or
    (Q['grl_mascara'] = 2) or (Q['grl_mascara'] = 5) or (Q['grl_mascara'] = 7)
 Then
  Begin
    If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015)
    Then ppMemo4.Lines.Add('Atividades Complementares.............................:'+AlinhaDir2(' ',5)+'     '+AlinhaDir2(IntToStr(ppDBCalc6.value+totativ),5))
    Else ppMemo4.Lines.Add('Atividades Complementares.............................:'+AlinhaDir2(IntToStr(ppDBCalc6.value+totativ),5));
  End
 Else ppMemo4.Lines.Add('Atividades Complementares.............................:'+AlinhaDir2(ppDBCalc6.Text,5));
 If ppDBCalc8.Value <> 0
 Then
  If (Q['grl_mascara'] = 7)
  Then ppMemo4.Lines.Add('Trabalho Integrador I,II,III e IV.....................:'+AlinhaDir2(ppDBCalc8.Text,5))
  Else
   If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015)
   Then ppMemo4.Lines.Add('Trabalho de Conclusão de Curso........................:'+AlinhaDir2(' ',5)+'     '+AlinhaDir2(ppDBCalc8.Text,5))
   Else ppMemo4.Lines.Add('Trabalho de Conclusão de Curso........................:'+AlinhaDir2(ppDBCalc8.Text,5));
 If tottrab <> 0
 Then ppMemo4.Lines.Add('Horas Trabalho........................................:'+AlinhaDir2(IntToStr(tottrab),5));
 If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015)
 Then ppMemo4.Lines.Add('                                                               ---------')
 Else ppMemo4.Lines.Add('                                                     ---------');
 totgrade:=0;
 If ((Q_Curso['fac_codigo'] = 1) and ((Q['GrL_Inicio'] = 2003) or (Q['GrL_Inicio'] = 22003)) and (Q_Curso['cur_codigo'] <> 23) and (Q_Curso['cur_codigo'] <> 22)) or
    (Q['grl_mascara'] = 2) or (Q['grl_mascara'] = 5) or (Q['grl_mascara'] = 7)
 Then
  Begin
   If (Q['grl_mascara'] = 2) or (Q['grl_mascara'] = 7)
   Then
    Begin
      If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015)
      Then totgrade:=Trunc(ppDBCalc2.Value * 50 / 60 + ppDBCalc3.Value + ppDBCalc6.Value + ppDBCalc8.Value + tottrab + totativ)
      Else totgrade:=ppDBCalc4.Value+tottrab+totativ;
    End
   Else totgrade:=Trunc(ppDBCalc2.Value * 50 / 60 + ppDBCalc3.Value + ppDBCalc6.Value + ppDBCalc8.Value + tottrab + totativ);
  End
 Else totgrade:=ppDBCalc4.Value+tottrab;

 If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015)
 Then ppMemo4.Lines.Add('Carga Horária.........................................:'+AlinhaDir2(' ',5)+'     '+AlinhaDir2(IntToStr(totgrade),5))
 Else ppMemo4.Lines.Add('Carga Horária.........................................:'+AlinhaDir2(IntToStr(totgrade),5));

 If ppDBCalc14.Value <> 0
 Then
  If (Q_Curso['cur_codigo'] = 12) and (NULLToZero(Q['grl_anoinicio']) < 2015)
  Then ppMemo4.Lines.Add('Carga Horária Semipresencial..........................:'+AlinhaDir2(IntToStr(ppDBCalc14.Value),5)+'  ( '+FormatFloat('#0.0',ppDBCalc14.Value/totgrade*100)+'% )')
  Else
   If (Q_Curso['cur_codigo'] <> 12)
   Then
    If NULLToZero(Q['grl_anoinicio']) >= 2015
    Then ppMemo4.Lines.Add('Carga Horária a Distância.............................:'+AlinhaDir2(IntToStr(ppDBCalc14.Value),5)+'  ( '+FormatFloat('#0.0',ppDBCalc14.Value/totgrade*100)+'% )')
    Else ppMemo4.Lines.Add('Carga Horária Semipresencial..........................:'+AlinhaDir2(IntToStr(ppDBCalc14.Value),5)+'  ( '+FormatFloat('#0.0',ppDBCalc14.Value/totgrade*100)+'% )');

 If (Q_Curso['cur_codigo'] <> 132) and (ppDBCalc5.Value <> 0) // Educação Física - Reitoria solicitou que não exibisse mais se carga horária for igual a zero - 05/06/2017
 Then ppMemo4.Lines.Add('Educação Física.......................................:'+AlinhaDir2(ppDBCalc5.Text,5));
 If DBCLibras.Value <> 0
// Then
//  If ((Q_Curso['cur_codigo'] <> 12) or ((Q_Curso['cur_codigo'] = 12) and (NULLToZero(Q['grl_anoinicio']) < 2015))) and (Q_Curso['cur_codigo'] <> 33) and (Q_Curso['cur_codigo'] <> 34)
  Then ppMemo4.Lines.Add('Libras(Optativa)......................................:'+AlinhaDir2(DBCLibras.Text,5));
 ppMemo4.Lines.Add('');

 ppMemo1.Text:='';
 QObsGrade.First;
 While not QObsGrade.Eof do
 Begin
  If QObsGrade['obg_tipo'] = 0
  Then ppMemo1.Lines.Add(Trim(NULLToSpace(QObsGrade['obg_observ1'])))
  Else
   If (QObsGrade['obg_tipo'] = 1) and (Q_Curso['fac_codigo'] <> 1) and (Q['grl_mascara'] <> 2) and (Q['grl_mascara'] <> 5) and (Q['grl_mascara'] <> 7) // Atividades Complementares
   Then ppMemo1.Lines.Add(Trim(NULLToSpace(QObsGrade['obg_observ1']))+', TOTALIZANDO '+
                          IntToStr(ppDBCalc4.Value+QObsGrade['obg_chativ']+tottrab)+' HORAS.');
  QObsGrade.Next;
 End;
 If ((Q_Curso['fac_codigo'] = 1) and ((Q['GrL_Inicio'] = 2003) or (Q['GrL_Inicio'] = 22003)) and (Q_Curso['cur_codigo'] <> 23) and (Q_Curso['cur_codigo'] <> 22))
 Then ppMemo1.Lines.Add('DAS '+IntToStr(ppDBCalc2.Value)+' HORAS PREVISTAS, '+IntToStr(ppDBCalc7.Value)+' HORAS CONSTITUEM A DIMENSÃO PRÁTICA DOS COMPONENTES CURRICULARES');

{ If Q_Curso['cur_codigo'] = 12  // Medicina
 Then ppLabel21.Caption:='Estágio Curricular (Internato):'
 Else ppLabel21.Caption:='Estágio Supervisionado........:';
 ppMemo1.Text:='';
 QObsGrade.Close;
 QObsGrade.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
 QObsGrade.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
 QObsGrade.ParamByName('codhab').AsSmallInt:=Q['hab_codigo'];
 QObsGrade.Open;
 While not QObsGrade.Eof do
 Begin
  If (QObsGrade['obg_tipo']) = 0
  Then ppMemo1.Lines.Add(Trim(NULLToSpace(QObsGrade['obg_observ1'])))
  Else
   If (QObsGrade['obg_tipo']) = 1 // Atividades Complementares
   Then ppMemo1.Lines.Add(Trim(NULLToSpace(QObsGrade['obg_observ1']))+', TOTALIZANDO '+
                          IntToStr(ppDBCalc4.Value+QObsGrade['obg_chativ']+QObsGrade['obg_chtrab'])+' HORAS.');
  QObsGrade.Next;
 End;
 If ((Q_Curso['fac_codigo'] = 1) and (Q['GrL_Inicio'] = 2003) and (Q_Curso['cur_codigo'] <> 23) and (Q_Curso['cur_codigo'] <> 22))
 Then ppMemo1.Lines.Add('DAS '+IntToStr(ppDBCalc2.Value)+' HORAS PREVISTAS, '+IntToStr(ppDBCalc7.Value)+' HORAS CONSTITUEM A DIMENSÃO PRÁTICA DOS COMPONENTES CURRICULARES');}
end;

procedure TF_AntGrade.ppDBCalc6Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 10 // Atividades Complementares
 Then ppDBCalc6.Value:=ppDBCalc6.Value - Q['gra_chteor']
 Else ppDBCalc6.Value:=ppDBCalc6.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc7Calc(Sender: TObject);
begin
 If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
    (Q['dis_controle'] = 11) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
 Then ppDBCalc7.Value:=ppDBCalc7.Value - Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc8Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 11 // Trabalho de Conclusão de Curso
 Then ppDBCalc8.Value:=ppDBCalc8.Value - Q['gra_chteor']
 Else ppDBCalc8.Value:=ppDBCalc8.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.GHBModuloBeforePrint(Sender: TObject);
begin
 If Q['cer_seq'] = Null
 Then
  Begin
   GHBModulo.Visible:=False;
   GFBModulo.Visible:=False;
  End
 Else LCert.Caption:=NULLToSpace(Q['cer_descr'])+'  ';
end;

procedure TF_AntGrade.GHBModuloAfterPrint(Sender: TObject);
begin
 If (Q_Curso['cur_codigo'] <> 4) and (Q_Curso['cur_codigo'] <> 12) and (Q_Curso['cur_codigo'] <> 33) and (Q_Curso['cur_codigo'] <> 34) // Menos os cursos de farmácia e medicina
 Then GHBModulo.Visible:=True;
end;

procedure TF_AntGrade.GFBModuloAfterPrint(Sender: TObject);
begin
 GFBModulo.Visible:=True;
end;

procedure TF_AntGrade.ppDBCalc9Calc(Sender: TObject);
begin
 If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
    (Q['dis_controle'] = 11) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
 Then
  Begin
    ppDBCalc9.Value:=ppDBCalc9.Value - Q['gra_chteor']; // Elias pediu para não somar mais libras optativa em Medicina - 20/05/2019
//    If ((Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34)) and (NULLToZero(Q['grl_anoinicio']) >= 2015) and (Q['dis_controle'] = 13) // a pedido da Darcy, deve-se somar a carga horária de Libras optativa nas grades de Medicina a partir de 2015
//    Then ppDBCalc9.Value:=ppDBCalc9.Value + Q['gra_chprat']
//    Else ppDBCalc9.Value:=ppDBCalc9.Value - Q['gra_chteor'];
  End
 Else ppDBCalc9.Value:=ppDBCalc9.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppHeaderBand1BeforePrint(Sender: TObject);
begin
 ppShape3.Brush.Color:=$00F5F5F5;
end;

procedure TF_AntGrade.GHBModulo2AfterPrint(Sender: TObject);
begin
 GHBModulo2.Visible:=True;
end;

procedure TF_AntGrade.GHBModulo2BeforePrint(Sender: TObject);
begin
 If Q['cer_seq'] = Null
 Then
  Begin
   GHBModulo2.Visible:=False;
   GFBModulo2.Visible:=False;
  End
 Else LCert3.Caption:=NULLToSpace(Q['cer_descr'])+'  ';
end;

procedure TF_AntGrade.GFBModulo2AfterPrint(Sender: TObject);
begin
 GFBModulo2.Visible:=True;
end;

procedure TF_AntGrade.ppDetailBand1BeforePrint(Sender: TObject);
begin
 If ppShape3.Brush.Color = clWhite
 Then ppShape3.Brush.Color:=$00F5F5F5
 Else ppShape3.Brush.Color:=clWhite;
 LPER2.Visible:=(CBPER.Visible) and (CBPER.Checked) and (Q['gra_per'] = 'S');
 LCHT2.Caption:=IntToStr(NULLToInt(Q['gra_chteor']) - NULLToInt(Q['gra_chteorpres']));
 LNCT2.Caption:=IntToStr(NULLToInt(Q['gra_ncteor']) - NULLToInt(Q['gra_ncteorpres']));
 LTot2.Caption:=IntToStr(NULLToInt(Q['gra_chteor']) + NULLToInt(Q['gra_chprat']));
end;

procedure TF_AntGrade.ppGroupFooterBand4BeforePrint(Sender: TObject);
var totativ, totteor:word;
begin
 QObsGrade.Close;
 QObsGrade.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
 QObsGrade.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
 QObsGrade.ParamByName('codhab').AsSmallInt:=Q['hab_codigo'];
 QObsGrade.Open;
 ppMemo3.Text:='';
 ppMemo3.Lines.Add('');
 If (Q['grl_mascara'] = 1) or (Q['grl_mascara'] = 4) // Atividades Acadêmico-Científico-Culturais
 Then
  Begin
   If Q_Curso['cur_area'] = 1 // Ensino Médio
   Then ppMemo3.Lines.Add('Horas.................................................:'+AlinhaDir2(ppDBCalc10.Text,5))
   Else
    Begin
     If Q['grl_mascara'] = 1
     Then ppMemo3.Lines.Add('Conteúdos Curriculares de Natureza Científico-Cultural:'+AlinhaDir2(ppDBCalc10.Text,5))
     Else ppMemo3.Lines.Add('Conteúdos Curriculares de Natureza Científico-Cultural:'+AlinhaDir2(IntToStr(Trunc(ppDBCalc10.Value * 50 / 60)),5)+'     '+AlinhaDir2(ppDBCalc10.Text,5));
  {   If Q_Curso['cur_codigo'] = 132 // Educação Física
     Then ppMemo3.Lines.Add('Conteúdos Curriculares de Natureza Científico-Cultural:'+AlinhaDir2(ppDBCalc10.Text,5))
     Else
      If (Q_Curso['cur_codigo'] <> 23) and (Q_Curso['cur_codigo'] <> 18) and (Q_Curso['cur_codigo'] <> 101) and
         (Q_Curso['cur_codigo'] <> 102) and (Q_Curso['cur_codigo'] <> 103) and (Q_Curso['cur_codigo'] <> 104) and
         (Q_Curso['cur_codigo'] <> 105) and (Q_Curso['cur_codigo'] <> 106) and (Q_Curso['cur_codigo'] <> 22)
      Then ppMemo3.Lines.Add('Horas/aulas...........................................:'+AlinhaDir2(ppDBCalc10.Text,5))
      Else ppMemo3.Lines.Add('Horas de aulas........................................:'+AlinhaDir2(ppDBCalc10.Text,5));}
    End;
   If ppDBCalc15.Value <> 0
   Then
    If Q['grl_mascara'] = 1
    Then ppMemo3.Lines.Add('Prática Curricular Vivenciada.........................:'+AlinhaDir2(ppDBCalc15.Text,5))
    Else ppMemo3.Lines.Add('Prática Curricular Vivenciada.........................:'+AlinhaDir2(IntToStr(Trunc(ppDBCalc15.Value * 50 / 60)),5)+'     '+AlinhaDir2(ppDBCalc15.Text,5));
   If (Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34) // Medicina
   Then ppMemo3.Lines.Add('Estágio Curricular (Internato)........................:'+AlinhaDir2(ppDBCalc11.Text,5))
   Else ppMemo3.Lines.Add('Estágio Supervisionado................................:'+AlinhaDir2(ppDBCalc11.Text,5));
   If Q_Curso['cur_codigo'] = 23 // Pedagogia
   Then
    Begin
     If (Q['GrL_CodGra'] = 10) or (Q['GrL_CodGra'] = 13) or (Q['GrL_CodGra'] = 19) or (Q['GrL_CodGra'] = 22) or (Q['GrL_CodGra'] = 16)
     Then ppMemo3.Lines.Add('Est. Sup. em Adm. Escolar.............................:'+AlinhaDir2(ppDBCalc19.Text,5))
     Else
      If (Q['GrL_CodGra'] = 11) or (Q['GrL_CodGra'] = 20) or (Q['GrL_CodGra'] = 14) or (Q['GrL_CodGra'] = 23) or (Q['GrL_CodGra'] = 17)
      Then ppMemo3.Lines.Add('Est. Sup. em Ori. Escolar.............................:'+AlinhaDir2(ppDBCalc19.Text,5))
      Else ppMemo3.Lines.Add('Est. Sup. em Sup. Escolar.............................:'+AlinhaDir2(ppDBCalc19.Text,5));
    End;
   If ppDBCalc16.Value <> 0
   Then ppMemo3.Lines.Add('Trabalho de Conclusão de Curso........................:'+AlinhaDir2(ppDBCalc16.Text,5));
   ppMemo3.Lines.Add('                                                     ---------');
   If Q['grl_mascara'] = 1
   Then ppMemo3.Lines.Add('Carga Horária.........................................:'+AlinhaDir2(ppDBCalc12.Text,5))
   Else ppMemo3.Lines.Add('Carga Horária.........................................:'+AlinhaDir2(IntToStr(Trunc(Int(ppDBCalc10.Value * 50 / 60) + Int(ppDBCalc15.Value * 50 / 60) + ppDBCalc11.Value + ppDBCalc19.Value + ppDBCalc16.Value)),5));
   totativ:=0;
   totteor:=0;
   QObsGrade.First;
   While not QObsGrade.Eof do
   Begin
    If (QObsGrade['obg_tipo']) = 1
    Then totativ:=totativ + NULLToZero(QObsGrade['obg_chativ']);
  //  Else
  //   If (QObsGrade['obg_tipo']) = 4
  //   Then totteor:=totteor + NULLToZero(QObsGrade['obg_chativ']);
    QObsGrade.Next;
   End;
  // ppMemo3.Lines.Add('Atividades Teórico-Práticas - Iniciação Científica....:'+AlinhaDir2(IntToStr(totteor),5));
   ppMemo3.Lines.Add('Atividades Acadêmico-Científico-Culturais.............:'+AlinhaDir2(IntToStr(totativ),5));
   ppMemo3.Lines.Add('                                                     ---------');
   If Q['grl_mascara'] = 1
   Then ppMemo3.Lines.Add('Total de Carga Horária................................:'+AlinhaDir2(ppDBCalc12.Value+totativ+totteor,5))
   Else ppMemo3.Lines.Add('Total de Carga Horária................................:'+AlinhaDir2(IntToStr(Trunc(Int(ppDBCalc10.Value * 50 / 60) +
                                                                                               Int(ppDBCalc15.Value * 50 / 60) + ppDBCalc11.Value + ppDBCalc19.Value + ppDBCalc16.Value + totativ + totteor)),5));
   If (Q['grl_mascara'] = 1) and (ppDBCalc20.Value <> 0)
   Then
    If NULLToZero(Q['grl_anoinicio']) >= 2015
    Then ppMemo3.Lines.Add('Carga Horária a Distância.............................:'+AlinhaDir2(IntToStr(ppDBCalc20.Value),5)+'  ( '+FormatFloat('#0.0',ppDBCalc20.Value/(ppDBCalc12.Value+totativ+totteor)*100)+'% )')
    Else ppMemo3.Lines.Add('Carga Horária Semipresencial..........................:'+AlinhaDir2(IntToStr(ppDBCalc20.Value),5)+'  ( '+FormatFloat('#0.0',ppDBCalc20.Value/(ppDBCalc12.Value+totativ+totteor)*100)+'% )');
   If (Q_Curso['cur_codigo'] <> 132) and (ppDBCalc13.Value <> 0) // Educação Física - Reitoria solicitou que não exibisse mais se carga horária for igual a zero - 05/06/2017
   Then ppMemo3.Lines.Add('Educação Física.......................................:'+AlinhaDir2(ppDBCalc13.Text,5));
   If DBCLibras2.Value <> 0
   Then ppMemo3.Lines.Add('Libras(Optativa)......................................:'+AlinhaDir2(DBCLibras2.Text,5));
   ppMemo3.Lines.Add('');
  End
 Else
  Begin
   If Q['grl_mascara'] = 6
   Then ppMemo3.Lines.Add('Horas.................................................:'+AlinhaDir2(IntToStr(Trunc(ppDBCalc10.Value * 50 / 60)),5)+'     '+AlinhaDir2(ppDBCalc10.Text,5))
   Else ppMemo3.Lines.Add('Horas.................................................:'+AlinhaDir2(ppDBCalc10.Text,5));
   If ppDBCalc15.Value <> 0
   Then
    If Q['grl_mascara'] = 6
    Then ppMemo3.Lines.Add('Prática Curricular Vivenciada.........................:'+AlinhaDir2(IntToStr(Trunc(ppDBCalc15.Value * 50 / 60)),5)+'     '+AlinhaDir2(ppDBCalc15.Text,5))
    Else ppMemo3.Lines.Add('Prática Curricular Vivenciada.........................:'+AlinhaDir2(ppDBCalc15.Text,5));
   If Q['grl_mascara'] < 8
   Then
    If (Q_Curso['cur_codigo'] = 12) or (Q_Curso['cur_codigo'] = 33) or (Q_Curso['cur_codigo'] = 34) // Medicina
    Then ppMemo3.Lines.Add('Estágio Curricular (Internato)........................:'+AlinhaDir2(ppDBCalc11.Text,5))
    Else ppMemo3.Lines.Add('Estágio Supervisionado................................:'+AlinhaDir2(ppDBCalc11.Text,5));
   If Q_Curso['cur_codigo'] = 23 // Pedagogia
   Then
    Begin
     If (Q['GrL_CodGra'] = 10) or (Q['GrL_CodGra'] = 13) or (Q['GrL_CodGra'] = 19) or (Q['GrL_CodGra'] = 22) or (Q['GrL_CodGra'] = 16)
     Then ppMemo3.Lines.Add('Est. Sup. em Adm. Escolar.............................:'+AlinhaDir2(ppDBCalc19.Text,5))
     Else
      If (Q['GrL_CodGra'] = 11) or (Q['GrL_CodGra'] = 20) or (Q['GrL_CodGra'] = 14) or (Q['GrL_CodGra'] = 23) or (Q['GrL_CodGra'] = 17)
      Then ppMemo3.Lines.Add('Est. Sup. em Ori. Escolar.............................:'+AlinhaDir2(ppDBCalc19.Text,5))
      Else ppMemo3.Lines.Add('Est. Sup. em Sup. Escolar.............................:'+AlinhaDir2(ppDBCalc19.Text,5));
    End;
   totativ:=0;
   QObsGrade.First;
   While not QObsGrade.Eof do
   Begin
    If (QObsGrade['obg_tipo']) = 1
    Then totativ:=totativ + NULLToZero(QObsGrade['obg_chativ']);
    QObsGrade.Next;
   End;
   If Q_Curso['cur_codigo'] <> 311 // Est. Complementares em Educacao Infantil
   Then
    If ((Q_Curso['cur_codigo'] = 307) and (Q['GrL_CodGra'] = 2)) or (Q['grl_mascara'] = 8)
    Then ppMemo3.Lines.Add('Atividades Complementares.............................:'+AlinhaDir2(IntToStr(totativ),5))
    Else ppMemo3.Lines.Add('Atividades Complementares(incluindo Trabalho de Curso):'+AlinhaDir2(IntToStr(totativ),5));
   If Q['grl_mascara'] < 8
   Then
    If ppDBCalc16.Value <> 0
    Then ppMemo3.Lines.Add('Trabalho de Conclusão de Curso........................:'+AlinhaDir2(ppDBCalc16.Text,5));
   ppMemo3.Lines.Add('                                                     ---------');
   If Q['grl_mascara'] < 8
   Then
    Begin
      If Q['grl_mascara'] = 6
      Then ppMemo3.Lines.Add('Carga Horária.........................................:'+AlinhaDir2(IntToStr(Trunc(Int(ppDBCalc10.Value * 50 / 60) + Int(ppDBCalc15.Value * 50 / 60) + ppDBCalc11.Value + ppDBCalc19.Value + ppDBCalc16.Value + totativ)),5))
      Else ppMemo3.Lines.Add('Carga Horária.........................................:'+AlinhaDir2(ppDBCalc12.Value+totativ,5));
    End
   Else ppMemo3.Lines.Add('Carga Horária.........................................:'+AlinhaDir2(ppDBCalc10.Value+totativ,5)+'     '+AlinhaDir2(IntToStr(Trunc(Int(ppDBCalc10.Value+totativ) * 50 / 60)),5));
   If (Q_Curso['cur_codigo'] <> 132) and (ppDBCalc13.Value <> 0) // Educação Física - Reitoria solicitou que não exibisse mais se carga horária for igual a zero - 05/06/2017
   Then ppMemo3.Lines.Add('Educação Física.......................................:'+AlinhaDir2(ppDBCalc13.Text,5));

   If (DBCLibras2.Value <> 0) and (Q['grl_mascara'] < 8)
   Then ppMemo3.Lines.Add('Libras(Optativa)......................................:'+AlinhaDir2(DBCLibras2.Text,5))
   Else
    Begin
     QGrade.Close;
     QGrade.Sql.Clear;
     QGrade.Sql.Add('select d.dis_codigo, dis_nomdisc, sum(gra_chteor+gra_chprat) totlib from sca_grades g, sca_disciplinas d');
     QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.cur_codigo =:codcur and g.grl_codgra =:codgra and dis_controle = 13');
     QGrade.Sql.Add('group by 1,2');
     QGrade.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
     QGrade.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
     QGrade.Open;
     If NULLToZero(QGrade['totlib']) <> 0
     Then ppMemo3.Lines.Add('Libras(Optativa - '+FormatFloat('00000000',QGrade['dis_codigo'])+')...........................:'+AlinhaDir2(QGrade['totlib'],5));
    End;
   ppMemo3.Lines.Add('');
  End;
 ppMemo2.Text:='';
 QObsGrade.First;
 While not QObsGrade.Eof do
 Begin
  If (QObsGrade['obg_tipo']) = 0
  Then ppMemo2.Lines.Add(Trim(NULLToSpace(QObsGrade['obg_observ1'])));
//  Else
//   If (QObsGrade['obg_tipo']) = 1 // Atividades Complementares
//   Then ppMemo2.Lines.Add(Trim(NULLToSpace(QObsGrade['obg_observ1']))+', TOTALIZANDO '+
//                          IntToStr(ppDBCalc12.Value+QObsGrade['obg_chativ']+QObsGrade['obg_chtrab'])+' HORAS.');
  QObsGrade.Next;
 End;
// If ((Q_Curso['fac_codigo'] = 1) and (Q['GrL_Inicio'] = 2003) and (Q_Curso['cur_codigo'] <> 23) and (Q_Curso['cur_codigo'] <> 22))
// Then ppMemo2.Lines.Add('DAS '+IntToStr(ppDBCalc10.Value)+' HORAS PREVISTAS, '+IntToStr(ppDBCalc15.Value)+' HORAS CONSTITUEM A DIMENSÃO PRÁTICA DOS COMPONENTES CURRICULARES');
end;

procedure TF_AntGrade.ppGroupHeaderBand4BeforePrint(Sender: TObject);
begin
 RTHab.Paragraph.Alignment:=taLeftJustify;
 RTHab.SelectAll;
 RTHab.SelAttributes.Name:='Times New Roman';
 RTHab.SelAttributes.Size:=11;
 RTHab.SelAttributes.Style:=[fsbold];
 If Q_Curso['cur_codigo'] = 23 // Pedagogia
 Then
  Begin
{   If ((Q['GrL_CodGra'] = 10) or (Q['GrL_CodGra'] = 13) or (Q['GrL_CodGra'] = 19) or (Q['GrL_CodGra'] = 22) or (Q['GrL_CodGra'] = 16)) and (Q['Hab_Comum'] = 18)
   Then RTHab.RichText:='Habilitações em Magistério das Disciplinas Pedagógicas do Ensino '+
                        'Médio e Administração Escolar na Educação Básica'
   Else
    If ((Q['GrL_CodGra'] = 11) or (Q['GrL_CodGra'] = 20) or (Q['GrL_CodGra'] = 14) or (Q['GrL_CodGra'] = 23) or (Q['GrL_CodGra'] = 17)) and (Q['Hab_Comum'] = 18)
    Then RTHab.RichText:='Habilitações em Magistério das Disciplinas Pedagógicas do Ensino '+
                         'Médio e Orientação Educacional na Educação Básica'
    Else
     If ((Q['GrL_CodGra'] = 12) or (Q['GrL_CodGra'] = 21) or (Q['GrL_CodGra'] = 15) or (Q['GrL_CodGra'] = 24) or (Q['GrL_CodGra'] = 18)) and (Q['Hab_Comum'] = 18)
     Then RTHab.RichText:='Habilitações em Magistério das Disciplinas Pedagógicas do Ensino '+
                          'Médio e Supervisão Escolar na Educação Básica'
     Else RTHab.RichText:=Q['hab_nomhb1'];}
   If (Q['Hab_Comum'] = 18)
   Then
    Begin
     If Q['grl_nomhab1'] <> Null
     Then RTHab.RichText:=Q['grl_nomhab1']
     Else RTHab.RichText:=Q['hab_nomhb1'];
    End
   Else RTHab.RichText:=Q['hab_nomhb1'];
  End
 Else
  If Q['grl_nomhab1'] <> Null
  Then RTHab.RichText:=Q['grl_nomhab1']
  Else RTHab.RichText:=Q['hab_nomhb1'];
{  If Q_Curso['cur_codigo'] = 18 // Educação Artística
  Then
   Begin
    If (Q['GrL_CodGra'] = 5) and (Q['Hab_Comum'] = 7)
    Then RTHab.RichText:='Licenciatura Plena com Habilitação em Desenho'
    Else
     If (Q['GrL_CodGra'] = 6) and (Q['Hab_Comum'] = 7)
     Then RTHab.RichText:='Licenciatura Plena com Habilitação em Artes Plásticas'
     Else RTHab.RichText:=Q['hab_nomhb1'];
   End
  Else
   If Q_Curso['cur_codigo'] = 22 // Letras
   Then
    Begin
     If (Q['GrL_CodGra'] = 6) or (Q['GrL_CodGra'] = 8)
     Then RTHab.RichText:='Português/Inglês'
     Else
      If (Q['GrL_CodGra'] = 7) or (Q['GrL_CodGra'] = 9)
      Then RTHab.RichText:='Português'
      Else RTHab.RichText:=Q['hab_nomhb1'];
    End
   Else RTHab.RichText:=Q['hab_nomhb1'];}
end;

procedure TF_AntGrade.ppDBCalc10Calc(Sender: TObject);
begin
 If Q_Curso['cur_area'] = 1 // Ensino Médio
 Then
  Begin
{   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
      (Q['dis_controle'] = 11) or (Q['dis_controle'] = 12) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
   Then ppDBCalc10.Value:=ppDBCalc10.Value - Q['gra_chteor']
   Else ppDBCalc10.Value:=ppDBCalc10.Value - Q['gra_chteor'] + (Q['gra_chteor']*50/60);}
   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
      (Q['dis_controle'] = 11) or (Q['dis_controle'] = 12) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
   Then ppDBCalc10.Value:=ppDBCalc10.Value - Q['gra_chteor'];
  End
 Else
  If Q['grl_mascara'] >= 8 // a partir da máscara 8 (2019) deve ser somada a carga horária de estágio e trabalho de conclusão de curso
  Then
   Begin
     If (Q['dis_controle'] = 13) // Libras
     Then ppDBCalc10.Value:=ppDBCalc10.Value - Q['gra_chteor']
     Else
      If Q['gra_tipaul'] = 1 // só teórica
      Then ppDBCalc10.Value:=ppDBCalc10.Value - Q['gra_pratviv']
      Else
       If Q['gra_chprat'] <> Q['gra_pratviv']
       Then
        If Q['gra_pratviv'] = 0
        Then ppDBCalc10.Value:=ppDBCalc10.Value + Q['gra_chprat']
        Else ppDBCalc10.Value:=ppDBCalc10.Value + Q['gra_chprat'] - Q['gra_pratviv'];
   End
  Else
   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
      (Q['dis_controle'] = 11) or (Q['dis_controle'] = 12) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
   Then ppDBCalc10.Value:=ppDBCalc10.Value - Q['gra_chteor']
   Else
    If Q['gra_tipaul'] = 1 // só teórica
    Then ppDBCalc10.Value:=ppDBCalc10.Value - Q['gra_pratviv']
    Else
     If Q['gra_chprat'] <> Q['gra_pratviv']
     Then
      If Q['gra_pratviv'] = 0
      Then ppDBCalc10.Value:=ppDBCalc10.Value + Q['gra_chprat']
      Else ppDBCalc10.Value:=ppDBCalc10.Value + Q['gra_chprat'] - Q['gra_pratviv'];
end;

procedure TF_AntGrade.ppDBCalc15Calc(Sender: TObject);
begin
 If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
    (Q['dis_controle'] = 11) or (Q['dis_controle'] = 12) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
 Then ppDBCalc15.Value:=ppDBCalc15.Value - Q['gra_pratviv'];
end;

procedure TF_AntGrade.ppDBCalc11Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 9 // Estagio
 Then ppDBCalc11.Value:=ppDBCalc11.Value - Q['gra_chteor']
 Else ppDBCalc11.Value:=ppDBCalc11.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc16Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 11 // Trabalho de Conclusão de Curso
 Then ppDBCalc16.Value:=ppDBCalc16.Value - Q['gra_chteor']
 Else ppDBCalc16.Value:=ppDBCalc16.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc12Calc(Sender: TObject);
begin
 If Q_Curso['cur_area'] = 1 // Ensino Médio
 Then
  Begin
{   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 13) // Educação Física, Libras
   Then ppDBCalc12.Value:=ppDBCalc12.Value - Q['gra_chteor']
   Else
    If (Q['dis_controle'] = 9) // Estágio
    Then ppDBCalc12.Value:=ppDBCalc12.Value + Q['gra_chprat']
    Else ppDBCalc12.Value:=ppDBCalc12.Value - Q['gra_chteor'] + (Q['gra_chteor']*50/60) + (Q['gra_chprat']*50/60);}
   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 13) // Educação Física, Libras
   Then ppDBCalc12.Value:=ppDBCalc12.Value - Q['gra_chteor']
   Else ppDBCalc12.Value:=ppDBCalc12.Value + Q['gra_chprat'];
  End
 Else
  If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 13) // Educação Física, Libras
  Then ppDBCalc12.Value:=ppDBCalc12.Value - Q['gra_chteor']
  Else ppDBCalc12.Value:=ppDBCalc12.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc13Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 8 // Educação Física
 Then ppDBCalc13.Value:=ppDBCalc13.Value - Q['gra_chteor']
 Else ppDBCalc13.Value:=ppDBCalc13.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc18Calc(Sender: TObject);
begin
  If Q['grl_mascara'] >= 8 // a partir da máscara 8 (2019) deve ser somada a carga horária de estágio e trabalho de conclusão de curso
  Then
   Begin
     If (Q['dis_controle'] = 13) // Libras
     Then ppDBCalc18.Value:=ppDBCalc18.Value - Q['gra_chteor']
     Else ppDBCalc18.Value:=ppDBCalc18.Value + Q['gra_chprat'];
   End
  Else
   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
      (Q['dis_controle'] = 11) or (Q['dis_controle'] = 12) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
   Then ppDBCalc18.Value:=ppDBCalc18.Value - Q['gra_chteor']
   Else ppDBCalc18.Value:=ppDBCalc18.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc17Calc(Sender: TObject);
begin
  If Q['grl_mascara'] >= 8 // a partir da máscara 8 (2019) deve ser somada a carga horária de estágio e trabalho de conclusão de curso
  Then
   Begin
     If (Q['dis_controle'] = 13) // Libras
     Then ppDBCalc17.Value:=ppDBCalc17.Value - Q['gra_chteor']
     Else ppDBCalc17.Value:=ppDBCalc17.Value + Q['gra_chprat'];
   End
  Else
   If (Q['dis_controle'] = 8) or (Q['dis_controle'] = 9) or (Q['dis_controle'] = 10) or
      (Q['dis_controle'] = 11) or (Q['dis_controle'] = 12) or (Q['dis_controle'] = 13) // Ed. Fisica, Estagio, Atividades Complementares, Trabalho de Conclusão de Curso, Libras
   Then ppDBCalc17.Value:=ppDBCalc17.Value - Q['gra_chteor']
   Else ppDBCalc17.Value:=ppDBCalc17.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppDBCalc19Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 12 // Estagio Adm./Ori./Sup.
 Then ppDBCalc19.Value:=ppDBCalc19.Value - Q['gra_chteor']
 Else ppDBCalc19.Value:=ppDBCalc19.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.DBCLibrasCalc(Sender: TObject);
begin
 If Q['dis_controle'] <> 13 // Libras
 Then DBCLibras.Value:=DBCLibras.Value - Q['gra_chteor']
 Else DBCLibras.Value:=DBCLibras.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.DBCLibras2Calc(Sender: TObject);
begin
 If Q['dis_controle'] <> 13 // Libras
 Then DBCLibras2.Value:=DBCLibras2.Value - Q['gra_chteor']
 Else DBCLibras2.Value:=DBCLibras2.Value + Q['gra_chprat'];
end;

procedure TF_AntGrade.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  ppRichView1.Height:=0.0208;
  ppRichView1.RichView.Clear;

  RT2.Clear;

  QCertif.Close;
  QCertif.Sql.Clear;
  QCertif.Sql.Add('select distinct c.cer_seq, cer_descr, cer_modulo from sca_certificacao c, sca_grades g, sca_competencias co');
  QCertif.Sql.Add('where c.cer_seq = g.cer_seq and c.cur_codigo = g.cur_codigo and c.cer_seq = co.cer_seq and g.grl_codgra = co.grl_codgra and g.grl_codgra =:codgra and c.cur_codigo =:codcur');
  QCertif.Sql.Add('order by cer_modulo');
  QCertif.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
  QCertif.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
  QCertif.Open;
  If not QCertif.Eof
  Then
   Begin
     with RT2 do begin
       SelStart := GetTextLen;
       SelAttributes.Name:= 'Arial';
       SelText := #13#10;
       SelAttributes.Style := [fsBold];
       SelText := 'Competências dos Módulos' + #13#10; //bigger text
       SelText := #13#10;
     end;

     ppRichView1.RichView.AddNL('',0,0);
     ppRichView1.RichView.AddNL('Competências dos Módulos',1,1);
     ppRichView1.RichView.AddNL('',0,0);

     While not QCertif.Eof do
     Begin
       with RT2 do begin
         SelAttributes.Name:= 'Arial';
         SelAttributes.Style := [fsBold];
         SelText := 'Módulo '+NULLToSpace(QCertif['cer_modulo'])+' - '+QCertif['cer_descr'] + #13#10;
       end;

       ppRichView1.RichView.AddNL('Módulo '+NULLToSpace(QCertif['cer_modulo'])+' - '+QCertif['cer_descr'],1,1);
       QComp.Close;
       QComp.Sql.Clear;
       QComp.Sql.Add('select * from sca_competencias');
       QComp.Sql.Add('where cer_seq =:codcer and grl_codgra =:codgra');
       QComp.Sql.Add('order by com_nordem');
       QComp.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
       QComp.ParamByName('codcer').AsInteger:=QCertif['cer_seq'];
       QComp.Open;
       While not QComp.Eof do
       Begin
         with RT2 do begin
           SelAttributes.Name:= 'Arial';
           SelAttributes.Style := [];
           SelText := QComp['com_obs'] + #13#10;
         end;
         
         ppRichView1.RichView.AddNL(QComp['com_obs'],0,0);
         QComp.Next;
       End;
       QCertif.Next;
       with RT2 do begin
         SelAttributes.Name:= 'Arial';
         SelAttributes.Style := [];
         SelText := #13#10;
       end;

       ppRichView1.RichView.AddNL('',0,0);
     End;
   End;

   If QCertif.RecordCount = 0 // não existem competências dos módulos cadastradas
   Then
    Begin
      with RT2 do begin
        SelAttributes.Name:= 'Arial';
        SelAttributes.Style := [];
        SelText := #13#10;
      end;

      ppRichView1.RichView.AddNL('',0,0);
    End;

   QComp.Close;
   QComp.Sql.Clear;
   QComp.Sql.Add('select * from sca_obscompl');
   QComp.Sql.Add('where cur_codigo =:codcur and grl_codgra =:codgra');
   QComp.Sql.Add('order by obc_nordem');
   QComp.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
   QComp.ParamByName('codcur').AsInteger:=Q_Curso['cur_codigo'];
   QComp.Open;
   If not QComp.Eof
   Then
    Begin
      with RT2 do begin
        SelAttributes.Name:= 'Arial';
        SelText := #13#10;
        SelAttributes.Style := [fsBold];
        SelText := 'Competências do Curso' + #13#10; //bigger text
        SelText := #13#10;
      end;

      ppRichView1.RichView.AddNL('Competências do Curso',1,1);
      ppRichView1.RichView.AddNL('',0,0);

      QComp.Close;
      QComp.Sql.Clear;
      QComp.Sql.Add('select * from sca_obscompl');
      QComp.Sql.Add('where cur_codigo =:codcur and grl_codgra =:codgra');
      QComp.Sql.Add('order by obc_nordem');
      QComp.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
      QComp.ParamByName('codcur').AsInteger:=Q_Curso['cur_codigo'];
      QComp.Open;
      While not QComp.Eof do
      Begin
        with RT2 do begin
          SelAttributes.Name:= 'Arial';
          SelAttributes.Style := [];
          SelText := NULLToSpace(QComp['obc_observ1'])+NULLToSpace(QComp['obs_observ2']) + #13#10;
        end;

        ppRichView1.RichView.AddNL(NULLToSpace(QComp['obc_observ1'])+NULLToSpace(QComp['obs_observ2']),0,0);
        QComp.Next;
      End;
    End;

   ppRichView1.RichView.Format;
end;

procedure TF_AntGrade.GHBNOrdBeforePrint(Sender: TObject);
begin
  LCert2.Caption:=NULLToSpace(Q['cer_descr'])+'  ';
end;

procedure TF_AntGrade.GHBModulo3AfterPrint(Sender: TObject);
begin
 If (Q_Curso['cur_codigo'] <> 4) and (Q_Curso['cur_codigo'] <> 12) and (Q_Curso['cur_codigo'] <> 33) and (Q_Curso['cur_codigo'] <> 34) // Menos os cursos de farmácia e medicina
 Then GHBModulo3.Visible:=True;
end;

procedure TF_AntGrade.GFBModulo3AfterPrint(Sender: TObject);
begin
 GFBModulo3.Visible:=True;
end;

procedure TF_AntGrade.GHBModulo3BeforePrint(Sender: TObject);
begin
 If MDGrade['cer_seq'] = Null
 Then
  Begin
   GHBModulo3.Visible:=False;
   GFBModulo3.Visible:=False;
  End
 Else LCert4.Caption:=NULLToSpace(MDGrade['cer_descr'])+'  ';
end;

procedure TF_AntGrade.GHBNOrd2BeforePrint(Sender: TObject);
begin
  LCert5.Caption:=NULLToSpace(MDGrade['cer_descr'])+'  ';
end;

procedure TF_AntGrade.ppDetailBand3BeforePrint(Sender: TObject);
begin
  LPER3.Visible:=(CBPER.Visible) and (CBPER.Checked) and (MDGrade['gra_per'] = 'S');
end;

procedure TF_AntGrade.ppGroupFooterBand2BeforePrint(Sender: TObject);
var tottrab,totativ, totgrade, totce:word;
    chparcial, chtotal:string;
begin
  Q.First;
  QObsGrade.Close;
  QObsGrade.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
  QObsGrade.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
  QObsGrade.ParamByName('codhab').AsSmallInt:=Q['hab_codigo'];
  QObsGrade.Open;
  tottrab:=0;
  totativ:=0;
  totce:=0;
  QObsGrade.First;
  While not QObsGrade.Eof do
  Begin
   If QObsGrade['obg_tipo'] = 1 // Atividades Complementares
   Then
    Begin
      totativ:=NULLToZero(QObsGrade['obg_chativ']);
      totce:=NULLToZero(QObsGrade['obg_ce']);
    End
   Else
    If QObsGrade['obg_tipo'] = 3 // Horas trabalho
    Then tottrab:=NULLToZero(QObsGrade['obg_chtrab']);
   QObsGrade.Next;
  End;

  chparcial:='';
  chtotal:='';
  If vnivel = 16 // diploma
  Then
   Begin
     chparcial:=' ('+DBCAulas.Text+')';
     chtotal:=' ('+IntToStr(DBCAulas.Value+totativ)+')';
   End;

  ppMemo5.Text:='';
  ppMemo5.Lines.Add('');
  If (Q_Curso['cur_habilitacao'] = 2) or (Q_Curso['cur_habilitacao'] = 5)  // Licenciatura
  Then ppMemo5.Lines.Add('Carga horária parcial *...............................:'+AlinhaDir2(DBCHoras.Text,5)+chparcial)
  Else ppMemo5.Lines.Add('Carga horária parcial.................................:'+AlinhaDir2(DBCHoras.Text,5)+chparcial);
  If (totce = 0)
  Then ppMemo5.Lines.Add('Atividades complementares.............................:'+AlinhaDir2(IntToStr(totativ),5))
  Else ppMemo5.Lines.Add('Atividades complementares.............................:'+AlinhaDir2(IntToStr(totativ),5) + '  CE Ativ.Complementares:'+AlinhaDir2(IntToStr(totce),5));
  ppMemo5.Lines.Add('Carga horária total do curso..........................:'+AlinhaDir2(IntToStr(DBCHoras.Value+totativ),5)+chtotal);
  If (Q_Curso['cur_habilitacao'] = 2) or (Q_Curso['cur_habilitacao'] = 5)  // Licenciatura
  Then
   Begin
     If DBCPratViv.Value <> 0
     Then
      Begin
        ppMemo5.Lines.Add('');
        ppMemo5.Lines.Add('* Incluídas as '+IntToStr(DBCPratViv.Value)+' horas de prática curricular vivenciada');
      End;
   End
  Else
   Begin
     QGrade.Close;
     QGrade.Sql.Clear;
     QGrade.Sql.Add('select d.dis_codigo, dis_nomdisc, sum(gra_chteor+gra_chprat) totlib from sca_grades g, sca_disciplinas d');
     QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.cur_codigo =:codcur and g.grl_codgra =:codgra and dis_controle = 13');
     QGrade.Sql.Add('group by 1,2');
     QGrade.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
     QGrade.ParamByName('codgra').AsSmallInt:=Q['GrL_CodGra'];
     QGrade.Open;
     If NULLToZero(QGrade['totlib']) <> 0
     Then
      Begin
        ppMemo5.Lines.Add('');
        ppMemo5.Lines.Add('Componente curricular optativo');
        If (Q_Curso['cur_gradistancia'] = 'S') and (Q['grl_converteead'] = 'N')
        Then ppMemo5.Lines.Add('        Língua Brasileira de Sinais - Libras('+FormatFloat('00000000',QGrade['dis_codigo'])+'):'+AlinhaDir2(IntToStr(QGrade['totlib']),5))
        Else ppMemo5.Lines.Add('        Língua Brasileira de Sinais - Libras('+FormatFloat('00000000',QGrade['dis_codigo'])+'):'+AlinhaDir2(IntToStr(LongInt(Round(QGrade['totlib']*50/60))),5));
      End;
   End;
  If DBCHorEad.Value <> 0
  Then
   Begin
     ppMemo5.Lines.Add('');
     ppMemo5.Lines.Add('Carga horária a distância.............................:'+AlinhaDir2(DBCHorEad.Text,5)+' ('+FormatFloat('#0.00',DBCHorEad.Value*100/(DBCHoras.Value+totativ))+'%)');
   End;
  If DBCCE.Value+totce <> 0
  Then
   Begin
     ppMemo5.Lines.Add('');
     If (Q_Curso['cur_gradistancia'] = 'S') and (Q['grl_converteead'] = 'N')
     Then ppMemo5.Lines.Add('Curricularização da Extensão..........................:'+AlinhaDir2(FormatFloat('#0.0',totce + (DBCCE.Value*20)),7)+' ('+FormatFloat('#0.00',(totce + (DBCCE.Value*20))*100/(DBCHoras.Value+totativ))+'%)  ('+DBCCE.Text+' créditos)')
     Else ppMemo5.Lines.Add('Curricularização da Extensão..........................:'+AlinhaDir2(FormatFloat('#0.0',totce + (DBCCE.Value*20*50/60)),7)+' ('+FormatFloat('#0.00',(totce + (DBCCE.Value*20*50/60))*100/(DBCHoras.Value+totativ))+'%)  ('+DBCCE.Text+' créditos)');
   End;
  ppMemo5.Lines.Add('');

  ppMemo6.Text:='';
  QObsGrade.First;
  While not QObsGrade.Eof do
  Begin
    If QObsGrade['obg_tipo'] = 0
    Then ppMemo6.Lines.Add(Trim(NULLToSpace(QObsGrade['obg_observ1'])));
    QObsGrade.Next;
  End;
end;

procedure TF_AntGrade.ppSummaryBand3BeforePrint(Sender: TObject);
begin
  ppRichView2.Height:=0.0208;
  ppRichView2.RichView.Clear;

  RT.Clear;
{  with RT do begin //move caret to end
    SelStart := GetTextLen; //add one unformatted line
    SelText := 'This is the first line' + #13#10; //add some normal font text
    SelText := 'Formatted lines in RichEdit' + #13#10; //bigger text
    SelAttributes.Size := 13; //add bold + red
    SelAttributes.Style := [fsBold]; SelAttributes.Color := clRed; SelText := 'About'; //only bold
    SelAttributes.Color := clWindowText; SelText := ' Delphi '; //add italic + blue
    SelAttributes.Style := [fsItalic]; SelAttributes.Color := clBlue; SelText := 'Programming'; //new line
    SelText := #13#10; //add normal again
    SelAttributes.Size := 8; SelAttributes.Color := clGreen; SelText := 'think of AddFormattedLine custom procedure...';
  end;}

  QCertif.Close;
  QCertif.Sql.Clear;
  QCertif.Sql.Add('select distinct c.cer_seq, cer_descr, cer_modulo from sca_certificacao c, sca_grades g, sca_competencias co');
  QCertif.Sql.Add('where c.cer_seq = g.cer_seq and c.cur_codigo = g.cur_codigo and c.cer_seq = co.cer_seq and g.grl_codgra = co.grl_codgra and g.grl_codgra =:codgra and c.cur_codigo =:codcur');
  QCertif.Sql.Add('order by cer_modulo');
  QCertif.ParamByName('codgra').AsSmallInt:=MDGrade['GrL_CodGra'];
  QCertif.ParamByName('codcur').AsSmallInt:=Q_Curso['cur_codigo'];
  QCertif.Open;
  If not QCertif.Eof
  Then
   Begin
     with RT do begin
       SelStart := GetTextLen;
       SelAttributes.Name:= 'Arial';
       SelText := #13#10;
       SelAttributes.Style := [fsBold];
       SelText := 'Competências dos Módulos' + #13#10; //bigger text
       SelText := #13#10;
     end;

     ppRichView2.RichView.AddNL('',0,0);
     ppRichView2.RichView.AddNL('Competências dos Módulos',1,1);
     ppRichView2.RichView.AddNL('',0,0);

     While not QCertif.Eof do
     Begin
       with RT do begin
         SelAttributes.Name:= 'Arial';
         SelAttributes.Style := [fsBold];
         SelText := 'Módulo '+NULLToSpace(QCertif['cer_modulo'])+' - '+QCertif['cer_descr'] + #13#10;
       end;

       ppRichView2.RichView.AddNL('Módulo '+NULLToSpace(QCertif['cer_modulo'])+' - '+QCertif['cer_descr'],1,1);
       QComp.Close;
       QComp.Sql.Clear;
       QComp.Sql.Add('select * from sca_competencias');
       QComp.Sql.Add('where cer_seq =:codcer and grl_codgra =:codgra');
       QComp.Sql.Add('order by com_nordem');
       QComp.ParamByName('codgra').AsSmallInt:=MDGrade['GrL_CodGra'];
       QComp.ParamByName('codcer').AsInteger:=QCertif['cer_seq'];
       QComp.Open;
       While not QComp.Eof do
       Begin
         with RT do begin
           SelAttributes.Name:= 'Arial';
           SelAttributes.Style := [];
           SelText := QComp['com_obs'] + #13#10;
         end;

         ppRichView2.RichView.AddNL(QComp['com_obs'],0,0);
         QComp.Next;
       End;
       QCertif.Next;
       with RT do begin
         SelAttributes.Name:= 'Arial';
         SelAttributes.Style := [];
         SelText := #13#10;
       end;

       ppRichView2.RichView.AddNL('',0,0);
     End;
   End;

   If QCertif.RecordCount = 0 // não existem competências dos módulos cadastradas
   Then
    Begin
      with RT do begin
        SelAttributes.Name:= 'Arial';
        SelAttributes.Style := [];
        SelText := #13#10;
      end;
      ppRichView2.RichView.AddNL('',0,0);
    End;

   QComp.Close;
   QComp.Sql.Clear;
   QComp.Sql.Add('select * from sca_obscompl');
   QComp.Sql.Add('where cur_codigo =:codcur and grl_codgra =:codgra');
   QComp.Sql.Add('order by obc_nordem');
   QComp.ParamByName('codgra').AsSmallInt:=MDGrade['GrL_CodGra'];
   QComp.ParamByName('codcur').AsInteger:=Q_Curso['cur_codigo'];
   QComp.Open;
   If not QComp.Eof
   Then
    Begin
      with RT do begin
        SelAttributes.Name:= 'Arial';
        SelText := #13#10;
        SelAttributes.Style := [fsBold];
        SelText := 'Competências do Curso' + #13#10; //bigger text
        SelText := #13#10;
      end;

      ppRichView2.RichView.AddNL('Competências do Curso',1,1);
      ppRichView2.RichView.AddNL('',0,0);

      QComp.Close;
      QComp.Sql.Clear;
      QComp.Sql.Add('select * from sca_obscompl');
      QComp.Sql.Add('where cur_codigo =:codcur and grl_codgra =:codgra');
      QComp.Sql.Add('order by obc_nordem');
      QComp.ParamByName('codgra').AsSmallInt:=MDGrade['GrL_CodGra'];
      QComp.ParamByName('codcur').AsInteger:=Q_Curso['cur_codigo'];
      QComp.Open;
      While not QComp.Eof do
      Begin
         with RT do begin
           SelAttributes.Name:= 'Arial';
           SelAttributes.Style := [];
           SelText := NULLToSpace(QComp['obc_observ1'])+NULLToSpace(QComp['obs_observ2']) + #13#10;
         end;

        ppRichView2.RichView.AddNL(NULLToSpace(QComp['obc_observ1'])+NULLToSpace(QComp['obs_observ2']),0,0);
        QComp.Next;
      End;
    End;

   ppRichView2.RichView.Format;
end;

procedure TF_AntGrade.QPratCalcFields(DataSet: TDataSet);
begin
  If (Q_Curso['cur_gradistancia'] = 'S') and (Q['grl_converteead'] = 'N')
  Then QPrat['chhoras']:=NULLToZero(QPrat['gra_pratviv'])
  Else QPrat['chhoras']:=LongInt(Round(NULLToZero(QPrat['gra_pratviv'])*50/60));
end;

procedure TF_AntGrade.CBVigenteClick(Sender: TObject);
begin
  DBLCGrade.Visible:=CBVigente.Checked;
  LPerLet.Visible:=not CBVigente.Checked;
  E_PerLet.Visible:=not CBVigente.Checked;
  LOu.Visible:=not CBVigente.Checked;
  LNum.Visible:=not CBVigente.Checked;
  CENum.Visible:=not CBVigente.Checked;
end;

procedure TF_AntGrade.QGradAtuCalcFields(DataSet: TDataSet);
var vgrade, vperiodo:string;
begin
  vperiodo:='';
  If QGradAtu['grl_periodo'] <> Null
  Then
   Case QGradAtu['grl_periodo'] of
     1:vperiodo:=' - Período: Diurno';
     2:vperiodo:=' - Período: Noturno';
     3:vperiodo:=' - Período: Integral';
     4:vperiodo:=' - Período: Diurno ou Noturno';
     5:vperiodo:=' - Período: Diurno ou Noturno/Diurno';
     6:vperiodo:=' - Período: Matutino';
     7:vperiodo:=' - Período: Vespertino';
     8:vperiodo:=' - Período: Matutino ou Noturno';
     9:vperiodo:=' - Período: Vespertino ou Noturno';
    10:vperiodo:=' - Período: Integral ou Noturno';
   End;

  vgrade:='Grade nº '+IntToStr(QGradAtu['grl_codgra']);
  If (QGradAtu['grl_anoinicio'] <> Null) and (QGradAtu['grl_seminicio'] <> Null)
  Then vgrade:=vgrade + ' - Ingresso: '+IntToStr(QGradAtu['grl_seminicio'])+'/'+IntToStr(QGradAtu['grl_anoinicio'])+vperiodo
  Else vgrade:=vgrade + ' - Ano de Ingresso: '+IntToStr(QGradAtu['GrL_Inicio'])+vperiodo;
  QGradAtu['grade']:=vgrade;
end;

procedure TF_AntGrade.E_CurCodEnter(Sender: TObject);
begin
  QGradAtu.Close;
  Q_Curso.Close;
  Q.Close;
  QGedArea.Close;
  QAux.Close;
end;

end.

{ ppDBCalc2 - Horas/Aulas
  ppDBCalc7 - Carga Horária Práticas
  ppDBCalc3 - Estágio Supervisionado
  ppDBCalc6 - Atividades Complementares
  ppDBCalc8 - Trabalho de Conclusão de Curso
  ppDBCalc4 - Total de Carga Horária
  ppDBCalc5 - Educação Física
  ppDBCalc14 - Carga horária semipresencial
}

{ Tipos de Máscara da Grade
  0,2,5,7: A diferença está no formato de exibição das atividades complementares. No caso do tipo 2 e 5 a única diferença está na conversão para hora-relógio das aulas normais. No tipo 2 para 7 a diferença está na texto de trabalho de conclusão de curso para trabalho integrador.
  1,3,4,6: No tipo 1,4 é exibido Atividades Acadêmico-Científico-Culturais e no tipo 3,6 Atividades Complementares (incluindo Trabalho de Curso) além de outras diferenças de nomenclatura
  4,5,6: Converte horas aulas para horas relógio

  Delphi 2007 - ReportBuilder
  PreviewFormSettings - SinglePageOnly = True;
  }


