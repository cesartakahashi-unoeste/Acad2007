unit UInscrit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, CurrEdit, Db, DBTables,
  DBCtrls, ComCtrls, RxDBComb, ppBands, ppClass, ppVar, ppRichView,
  ppCtrls, ppStrtch, ppRegion, jpeg, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, RxLookup, RVStyle, ppBarCod,
  LMDCustomComponent, LMDGlobalHotKey, txtradev, ComObj, Printers, RXDBCtrl,
  Psock, NMsmtp;

type
  TFInscrit = class(TForm)
    Panel2: TPanel;
    b_altera: TBitBtn;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    B_Sair: TBitBtn;
    Panel1: TPanel;
    QInscrito: TQuery;
    DSInscrito: TDataSource;
    Q_localidade: TQuery;
    DS_localidade: TDataSource;
    QPessoa: TQuery;
    DSPessoa: TDataSource;
    PageControl1: TPageControl;
    PG_Cad: TTabSheet;
    PG_End: TTabSheet;
    GB_Endereco: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label9: TLabel;
    LC_Cidade: TDBLookupComboBox;
    DBERua: TDBEdit;
    DBECEP: TDBEdit;
    E_Cidade: TEdit;
    DBEFone: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBECPF: TDBEdit;
    DBERG: TDBEdit;
    Label4: TLabel;
    DBRGSexo: TDBRadioGroup;
    Label28: TLabel;
    DBCBEstCiv: TRxDBComboBox;
    Label23: TLabel;
    DBEBairro: TDBEdit;
    Label6: TLabel;
    Label12: TLabel;
    DBEEstExp: TDBEdit;
    Label14: TLabel;
    DBLCBNac: TDBLookupComboBox;
    QNac: TQuery;
    DSNac: TDataSource;
    Label15: TLabel;
    DBECelular: TDBEdit;
    QPessoapes_nro: TIntegerField;
    QPessoaloc_codigo: TIntegerField;
    QPessoanac_codigo: TSmallintField;
    QPessoapes_nome: TStringField;
    QPessoapes_sexo: TSmallintField;
    QPessoapes_estciv: TSmallintField;
    QPessoapes_datnas: TDateField;
    QPessoapes_locnas: TIntegerField;
    QPessoapes_rg: TStringField;
    QPessoapes_orgexp: TStringField;
    QPessoapes_estexp: TStringField;
    QPessoapes_cpf: TFloatField;
    QPessoapes_titulo: TStringField;
    QPessoapes_zonael: TSmallintField;
    QPessoapes_sessao: TSmallintField;
    QPessoapes_municipio: TIntegerField;
    QPessoapes_reserv: TStringField;
    QPessoapes_regmil: TSmallintField;
    QPessoapes_cirmil: TSmallintField;
    QPessoapes_rua: TStringField;
    QPessoapes_bairro: TStringField;
    QPessoapes_cep: TStringField;
    QPessoapes_telefone: TStringField;
    QPessoapes_nrodoc: TStringField;
    QPessoapes_tipdoc: TSmallintField;
    QPessoapes_nompai: TStringField;
    QPessoapes_nommae: TStringField;
    QPessoapes_guerra: TStringField;
    QPessoapes_sacento: TStringField;
    QPessoapes_cnpj: TStringField;
    QPessoapes_tipo: TSmallintField;
    QPessoapes_natdocmil: TSmallintField;
    QPessoapes_falecido: TStringField;
    QPessoapes_ministerio: TSmallintField;
    QPessoaorg_codigo: TIntegerField;
    QPessoapes_docestr: TStringField;
    QPessoapes_nomecpf: TStringField;
    QPessoapes_celular: TStringField;
    QInscritoins_seq: TIntegerField;
    QInscritopes_nro: TIntegerField;
    QInscritoins_dtexprg: TDateField;
    QInscritoins_dtexptitulo: TDateField;
    QInscritoins_dtemireserv: TDateField;
    QInscritoins_nomeconjuge: TStringField;
    QInscritoins_cursup: TStringField;
    QInscritoins_anoinicio: TSmallintField;
    QInscritoins_anoconcl: TSmallintField;
    QInscritoins_entidade: TStringField;
    QInscritoloc_codigo: TIntegerField;
    QInscritoins_profissao: TStringField;
    QInscritoins_empresa: TStringField;
    QInscritoins_fonecom: TStringField;
    QInscritoins_faxcom: TStringField;
    QInscritoins_dtinscricao: TDateField;
    QInscritoins_confirmado: TStringField;
    QInscritoins_matriculado: TDateTimeField;
    QInscritoprc_seq: TIntegerField;
    QInscritobpg_boleto: TIntegerField;
    QInscritoofc_seq: TIntegerField;
    QInscritoins_boletomatr: TIntegerField;
    QInscritoins_ra: TFloatField;
    QInscritoins_diavencto: TSmallintField;
    Qemail: TQuery;
    DSemail: TDataSource;
    Qemailpes_nro: TIntegerField;
    Qemaileml_seq: TIntegerField;
    Qemaileml_principal: TStringField;
    Qemaileml_ativo: TStringField;
    Qemaileml_email: TStringField;
    Qemaileml_dtultimaatual: TDateField;
    Qemaileml_sistema: TStringField;
    QAux: TQuery;
    QFunc: TQuery;
    ppDBPipeline1: TppDBPipeline;
    RContrato2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppRegion2: TppRegion;
    LCidade2: TppLabel;
    ppLabel5: TppLabel;
    LContratado: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel7: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppShape2: TppShape;
    ppRichView2: TppRichView;
    ppLabel8: TppLabel;
    LContrato2: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    BContrato: TBitBtn;
    QCurso: TQuery;
    DSCurso: TDataSource;
    QOfCur: TQuery;
    DSOfCur: TDataSource;
    QOfCurofc_seq: TIntegerField;
    QOfCurcla_serie: TSmallintField;
    QOfCurcur_codigo: TSmallintField;
    QOfCurcla_ident: TStringField;
    QOfCurofc_dtinicio: TDateField;
    QOfCurofc_dttermino: TDateField;
    QOfCurofc_cargahor: TSmallintField;
    QOfCurofc_nrovagas: TSmallintField;
    QOfCurofc_iniinscr: TDateField;
    QOfCurofc_fiminscr: TDateField;
    QOfCurofc_presencial: TStringField;
    QOfCurccu_codigo: TIntegerField;
    QOfCurpes_responsavel: TIntegerField;
    QOfCurofc_dtbiblioteca: TDateField;
    QOfCurofc_descricao: TStringField;
    QOfCurcur_responsavel: TSmallintField;
    QOfCurcur_polo: TSmallintField;
    QOfCurpol_codigo: TSmallintField;
    QOfCurofc_valoresp: TFloatField;
    QOfCurofc_valormest: TFloatField;
    QOfCurofc_valordoutor: TFloatField;
    QOfCurfun_responsavel: TIntegerField;
    QOfCuremp_responsavel: TSmallintField;
    QOfCurofc_valorcoord: TFloatField;
    QOfCurperiodo: TStringField;
    PInscr: TPanel;
    Label1: TLabel;
    DBLCCurso: TDBLookupComboBox;
    Label2: TLabel;
    DBLCTurma: TDBLookupComboBox;
    CECPF: TCurrencyEdit;
    Label3: TLabel;
    B_LocIns: TSpeedButton;
    DBText3: TDBText;
    QPlanosPagto: TQuery;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    DBEProfis: TDBEdit;
    Label10: TLabel;
    DBCBDia: TRxDBComboBox;
    QBolPagto: TQuery;
    QInscritoins_nrodoc: TStringField;
    QInscritoplp_seq: TIntegerField;
    ppImage1: TppImage;
    LCurso2: TppLabel;
    LPeriodo2: TppLabel;
    QContrato: TQuery;
    DSContrato: TDataSource;
    QContr: TQuery;
    QNroContr: TQuery;
    Eemail: TEdit;
    RMatr: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel2: TppLabel;
    ppImage2: TppImage;
    ppLine1: TppLine;
    ppDetailBand2: TppDetailBand;
    ppLabel30: TppLabel;
    ppL_Faculdade: TppLabel;
    ppL_Curso: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppL_RA: TppLabel;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppLine4: TppLine;
    ppLabel9: TppLabel;
    ppLine6: TppLine;
    ppLabel19: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine9: TppLine;
    ppLabel20: TppLabel;
    ppLine10: TppLine;
    LSexo: TppLabel;
    ppLabel21: TppLabel;
    ppLine11: TppLine;
    LMunicipio: TppLabel;
    ppLabel23: TppLabel;
    ppLine12: TppLine;
    LEstado: TppLabel;
    ppLabel22: TppLabel;
    ppLine13: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppShape1: TppShape;
    ppLine14: TppLine;
    ppLabel26: TppLabel;
    ppShape3: TppShape;
    ppLabel27: TppLabel;
    ppLine15: TppLine;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel31: TppLabel;
    ppLine16: TppLine;
    ppLabel32: TppLabel;
    LCidade: TppLabel;
    LEmissao: TppLabel;
    Linha1: TppLine;
    ppLine20: TppLine;
    Linha2: TppLine;
    LAgencia1: TppLabel;
    ppLabel37: TppLabel;
    ppLine22: TppLine;
    ppLabel38: TppLabel;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLabel42: TppLabel;
    ppL_DataVenc: TppLabel;
    ppL_BlqNumero2: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppL_NroDocumento: TppLabel;
    LEspecieDoc1: TppLabel;
    ppLabel46: TppLabel;
    ppL_DtDocumento: TppLabel;
    ppLabel48: TppLabel;
    LCedente1: TppLabel;
    ppLine30: TppLine;
    ppL_Valor: TppLabel;
    ppLabel50: TppLabel;
    ppLabel49: TppLabel;
    ppLabel51: TppLabel;
    ppLine31: TppLine;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLabel55: TppLabel;
    ppLine34: TppLine;
    ppLine35: TppLine;
    Linha3: TppLine;
    ppLine39: TppLine;
    Linha4: TppLine;
    LAgencia2: TppLabel;
    ppLine41: TppLine;
    ppLabel59: TppLabel;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLine45: TppLine;
    LLocal: TppLabel;
    ppL_DataVenc2: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    LCedente2: TppLabel;
    ppLine49: TppLine;
    ppL_DtDocumento2: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLine50: TppLine;
    ppLabel78: TppLabel;
    ppL_NroDocumento2: TppLabel;
    ppLine46: TppLine;
    LEspecieDoc2: TppLabel;
    ppLine47: TppLine;
    ppLabel64: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppL_BlqNumero3: TppLabel;
    ppLine48: TppLine;
    ppLabel69: TppLabel;
    LCarteira: TppLabel;
    LEspecie: TppLabel;
    ppLabel72: TppLabel;
    ppLabel74: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppL_Valor2: TppLabel;
    ppLine51: TppLine;
    ppLabel81: TppLabel;
    ppLine52: TppLine;
    ppLabel82: TppLabel;
    ppLine53: TppLine;
    ppLabel83: TppLabel;
    ppLine54: TppLine;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLine56: TppLine;
    ppLine55: TppLine;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppDBText7: TppDBText;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    BarCode: TppBarCode;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    Label13: TLabel;
    DBLCPlanos: TDBLookupComboBox;
    DSPlanosPagto: TDataSource;
    QPlanosPagtoplp_seq: TIntegerField;
    QPlanosPagtoplp_anoing: TSmallintField;
    QPlanosPagtocur_codigo: TSmallintField;
    QPlanosPagtoplp_mesing: TSmallintField;
    QPlanosPagtoplp_nparcelas: TSmallintField;
    QPlanosPagtoplp_vrmatricula: TFloatField;
    QPlanosPagtoplp_vrparcela: TFloatField;
    QPlanosPagtoplp_vrtotal: TFloatField;
    QPlanosPagtoplp_percmulta: TFloatField;
    QPlanosPagtoplp_percmora: TFloatField;
    QPlanosPagtoplp_ativo: TStringField;
    QPlanosPagtoplano: TStringField;
    ppL_LinhaDig: TppLabel;
    ppL_Desc: TppLabel;
    ppL_Mens3: TppLabel;
    ppL_RA2: TppLabel;
    ppL_NroInscr: TppLabel;
    ppLabel92: TppLabel;
    ppLabel6: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    LMDGlobalHotKey1: TLMDGlobalHotKey;
    QEndLocal: TQuery;
    DSEndLocal: TDataSource;
    PG_EndLocal: TTabSheet;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    LC_Cidade2: TDBLookupComboBox;
    DBERua2: TDBEdit;
    DBECEP2: TDBEdit;
    E_Cidade2: TEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBECelular2: TDBEdit;
    Eemail2: TEdit;
    QInscritoins_interessado: TStringField;
    QInscritoins_obs: TStringField;
    QInscritopol_codigo: TSmallintField;
    QInscritoins_temaprojeto: TStringField;
    QInscritoins_linhapesquisa: TStringField;
    QInscritoins_excluido: TStringField;
    QInscritoins_status: TStringField;
    QInscritoins_raend: TFloatField;
    QEndLocalalu_ra: TFloatField;
    QEndLocalloc_codigo: TIntegerField;
    QEndLocalend_locrua: TStringField;
    QEndLocalend_locbai: TStringField;
    QEndLocalend_loccep: TStringField;
    QEndLocalend_locfone: TStringField;
    LRua: TppLabel;
    LFone: TppLabel;
    LCEP: TppLabel;
    DEDatNas: TDBDateEdit;
    Label25: TLabel;
    NMSMTP1: TNMSMTP;
    PG_Jur: TTabSheet;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    LC_CidadeP: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBECEPP: TDBEdit;
    E_CidadeP: TEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label31: TLabel;
    DBENome: TDBEdit;
    QPesJur: TQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    DateField1: TDateField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    StringField5: TStringField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    IntegerField4: TIntegerField;
    StringField6: TStringField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    SmallintField8: TSmallintField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    SmallintField9: TSmallintField;
    SmallintField10: TSmallintField;
    StringField17: TStringField;
    SmallintField11: TSmallintField;
    IntegerField5: TIntegerField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    DSPesJur: TDataSource;
    Label33: TLabel;
    Q_LocalidadeJ: TQuery;
    DS_LocalidadeP: TDataSource;
    CECNPJ: TEdit;
    DBTNomAlu: TppDBText;
    LSacado: TppLabel;
    QInscritoins_selecionado: TStringField;
    QInscritoins_funselecao: TIntegerField;
    QInscritoins_dtselecao: TDateTimeField;
    QInscritoloc_codigomestrado: TIntegerField;
    QInscritoins_curmestrado: TStringField;
    QInscritoins_anoiniciomestr: TSmallintField;
    QInscritoins_anoconclmestr: TSmallintField;
    QInscritoins_entidademestr: TStringField;
    QInscritoins_dtvencbolmatri: TDateField;
    QInscritoins_depfisica: TStringField;
    QInscritopes_juridico: TIntegerField;
    ppRegion1: TppRegion;
    ppLabel47: TppLabel;
    ppLabel73: TppLabel;
    ppLabel96: TppLabel;
    ppLine59: TppLine;
    ppRegion3: TppRegion;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLine60: TppLine;
    ppRegion5: TppRegion;
    ppLabel104: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppRegion4: TppRegion;
    ppLabel95: TppLabel;
    LEmpresa: TppLabel;
    ppLine57: TppLine;
    ppRegion6: TppRegion;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppRegion7: TppRegion;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel112: TppLabel;
    ppRegion8: TppRegion;
    ppLabel113: TppLabel;
    Label34: TppLabel;
    Label35: TppLabel;
    LDocAlu: TppLabel;
    LNomAlu: TppLabel;
    LNacAlu: TppLabel;
    ppLabel114: TppLabel;
    LEstCiv: TppLabel;
    ppLabel116: TppLabel;
    LRG: TppLabel;
    ppLabel118: TppLabel;
    LCPF: TppLabel;
    ppRegion9: TppRegion;
    ppLabel115: TppLabel;
    LRuaAlu: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppRegion10: TppRegion;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel117: TppLabel;
    ppLabel119: TppLabel;
    LCidAlu: TppLabel;
    LUFAlu: TppLabel;
    LCEPAlu: TppLabel;
    LFoneAlu: TppLabel;
    ppRegion11: TppRegion;
    ppLine58: TppLine;
    ppLine61: TppLine;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel140: TppLabel;
    Santander1: TppImage;
    Santander2: TppImage;
    ppL_DtProc: TppLabel;
    QOfCurofc_dtvencimento: TDateField;
    RContrato: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppImage5: TppImage;
    ppLine17: TppLine;
    ppLabel33: TppLabel;
    ppLabel45: TppLabel;
    ppLabel56: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppRegion13: TppRegion;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLine37: TppLine;
    ppShape4: TppShape;
    ppRichView1: TppRichView;
    ppLabel147: TppLabel;
    LContrato: TppLabel;
    LCurso: TppLabel;
    LPeriodo: TppLabel;
    ppRegion14: TppRegion;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLine62: TppLine;
    ppRegion19: TppRegion;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    LNomAlu2: TppLabel;
    LNacAlu2: TppLabel;
    ppLabel175: TppLabel;
    LEstCiv2: TppLabel;
    ppLabel177: TppLabel;
    LRG2: TppLabel;
    ppLabel179: TppLabel;
    LCPF2: TppLabel;
    ppRegion20: TppRegion;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    LRuaAlu2: TppLabel;
    ppLabel186: TppLabel;
    LCidAlu2: TppLabel;
    LUFAlu2: TppLabel;
    LCEPAlu2: TppLabel;
    LFoneAlu2: TppLabel;
    ppRegion21: TppRegion;
    ppLabel191: TppLabel;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppRegion22: TppRegion;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppLabel202: TppLabel;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    LRA: TppLabel;
    QAluno: TQuery;
    QOfCurofc_nvagasmatr: TSmallintField;
    QOfCurofc_dtsuficling: TDateField;
    QOfCurofc_dtplanoproj: TDateField;
    QOfCurofc_dtqualif: TDateField;
    QOfCurofc_dtdefesadisser: TDateField;
    QOfCurofc_pergrat: TFloatField;
    QOfCurofc_tipofalta: TSmallintField;
    QOfCurofc_monografia: TSmallintField;
    QOfCurofc_pagseguro: TStringField;
    QOfCurofc_diascarencia: TSmallintField;
    QOfCurofc_inicioimediato: TStringField;
    QOfCurofc_institucional: TStringField;
    QOfCurofc_inadimplencia: TFloatField;
    QOfCurofc_evasao: TFloatField;
    QOfCurofc_gastosdocente: TFloatField;
    QOfCurofc_deslocdocente: TFloatField;
    QOfCurofc_taxconversao: TFloatField;
    QOfCurofc_numalunos: TSmallintField;
    QOfCurofc_percdesvio: TFloatField;
    QOfCurofc_iesdeid: TStringField;
    QOfCurofc_assinaturaiesd: TStringField;
    QOfCurofc_semalunos: TStringField;
    QOfCurofc_chativ: TSmallintField;
    QOfCurcra_seq: TIntegerField;
    QOfCurofc_dialimitebolsa: TSmallintField;
    SPGeraRA: TStoredProc;
    SPGeraRAalu_ra: TStringField;
    QOfCurofc_datatcc: TDateField;
    QOfCurofc_vrdesconto: TFloatField;
    QOfCurofc_diadesconto: TSmallintField;
    procedure b_cancelaClick(Sender: TObject);
    procedure B_SairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure b_okClick(Sender: TObject);
    procedure b_alteraClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure E_CidadeExit(Sender: TObject);
    procedure LC_CidadeClick(Sender: TObject);
    procedure B_LocInsClick(Sender: TObject);
    procedure PG_CadExit(Sender: TObject);
    procedure CECPFEnter(Sender: TObject);
    procedure CECPFExit(Sender: TObject);
    procedure PageControl1Exit(Sender: TObject);
    procedure DBECPFExit(Sender: TObject);
    procedure BContratoClick(Sender: TObject);
    procedure DBLCCursoEnter(Sender: TObject);
    procedure QOfCurCalcFields(DataSet: TDataSet);
    procedure DBLCTurmaEnter(Sender: TObject);
    procedure DBLCCursoExit(Sender: TObject);
    procedure DBLCTurmaExit(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure EemailExit(Sender: TObject);
    procedure QPlanosPagtoCalcFields(DataSet: TDataSet);
    procedure DBLCPlanosEnter(Sender: TObject);
    procedure LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_Cidade2Exit(Sender: TObject);
    procedure LC_Cidade2Click(Sender: TObject);
    procedure Eemail2Exit(Sender: TObject);
    procedure DBCBDiaExit(Sender: TObject);
    procedure E_CidadePExit(Sender: TObject);
    procedure CECNPJEnter(Sender: TObject);
    procedure CECNPJExit(Sender: TObject);
    procedure LC_CidadePClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
  private
    PDFCreator: OleVariant;
    optUseAutosave, optUseAutoSaveDirectory, optAutosaveFormat,
    optPDFColorsColorModel: Integer;
    optAutosaveDirectory, optAutosaveFilename, vbairro, vuf, vtipbol: String;
    Texto: TStringList;
    vdiaini, vmesini, vmesfim, vanoini, vanofim:word;
    vranovo:boolean;
    Procedure Grava_Inscrito;
    procedure StorePDFOptions;
    procedure SetPDFOptions(const filename: String);
    procedure RestorePDFOptions;
    Function Gera_Boleto:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

//  function CalcularBoleto(datadocumento, datavencimento, valor, documento, nossonumero, zeravalorbarra: WideString; out linhadigitavel, localpagamento, codigobarras, codigobancocomdigito, descricaocarteira, especiedoc, especie, agenciacodigocedente, numerobancario: WideString): Boolean; stdcall; external 'boleto.dll';

procedure BoletoGeral(
usuario, senha, ip, nome, cpf, endereco, bairro, cep, cidade, uf, mensagens,
empresa, bloqueto, datavencimento, valor, datadesconto, valordesconto,
baixarnovencimento, boletointerno, tipoambiente: WideString;
out codigobancocomdigito, linhadigitavel, localpagamento, beneficiario,
agenciacodigocedente, datadocumento, numerodocumento, especiedocumento,
dataprocessamento, nossonumero, nossonumerosemdv, carteira, especie,
codigobarras, erro, codigobanco, codigoagencia, contacorrente, codigocedente,
ncarteira, codigoespecie, aceite, nomecedente, cnpjcedente, enderecocedente,
bairrocedente, cepcedente, cidadecedente, ufcedente,
sacado, mensagensret, instrucoes, mensagem, result: WideString); stdcall; external 'C:\Sistemas\boleto.dll';

var
  FInscrit: TFInscrit;

implementation

Uses URotinas, UMenupri, Extensos, Ext, UConsIns, md5;

{$R *.DFM}

Function TFInscrit.Gera_Boleto:Boolean;
var vRA, L_digit, CBarra, vDig : String;
    dia, mes, ano, parcela, diav : word;
    datavencto : TDateTime;
    linhadigitavel, localpagamento, codigobarras, codigobancocomdigito, descricaocarteira, especiedocumento, especie,
    agenciacodigocedente, numerobancario, beneficiario, datadocumento, numerodocumento, dataprocessamento, nossonumero,
    nossonumerosemdv,carteira, erro, codigobanco, codigoagencia, contacorrente, codigocedente, ncarteira,
    codigoespecie, aceite,nomecedente, cnpjcedente, enderecocedente, bairrocedente, cepcedente, cidadecedente, ufcedente,
    sacado, mensagensret, instrucoes, mensagem, resultado, datadesconto, valordesconto : WideString;
Begin
  Result:=False;
  ppL_Desc.Visible:=False;
  datadesconto:='';
  valordesconto:='0';
  ppL_RA2.Caption := 'R.A.: ' + Mascara_RA(QContrato['ins_ra']);
  If (QCurso['cur_grapos'] = 4) or (QCurso['cur_grapos'] = 5) // mestrado e doutorado
  Then datavencto:=QOfCur['ofc_dtvencimento'] // foi criado um novo atributo para a data de vencimento do requerimento de matrícula - 11/03/2015
  Else
   Begin
     datavencto:=QOfCur['ofc_fiminscr']; // foi definido como data de vencimento da matrícula o último dia de matrícula na turma selecionada (ofc_fiminscr da tabela spg_ofertacur)- 24/08/2011
     If NULLToZero2(QOfCur['ofc_vrdesconto']) > 0
     Then
      Begin
        valordesconto:=FormatFloat('0.00',QOfCur['ofc_vrdesconto']);
        DecodeDate(datavencto,ano,mes,dia);
        If dia <> 10
        Then datadesconto:=DateToStr(EncodeDate(ano,mes,10))
        Else datadesconto:=DateToStr(datavencto);
        ppL_Desc.Visible:=True;
        ppl_Desc.Caption:='Até o dia '+datadesconto+' conceder desconto de R$'+valordesconto;
      End;
   End;

  BoletoGeral(Menuprin.Database1.Params.Values['USER NAME'],
              Menuprin.Database1.Params.Values['PASSWORD'],'10.1.1.6',
              QContrato['pes_nome'], FloatToStr(QContrato['pes_cpf']), LRua.Caption,
              vbairro, LCep.Caption, LMunicipio.Caption,
              vuf,'','1', IntToStr(QContrato['ins_boletomatr']),
              DateToStr(datavencto), QPlanosPagto['plp_vrmatricula'], datadesconto, valordesconto, 'N',
              vtipbol,'P', codigobancocomdigito,linhadigitavel, localpagamento,
              beneficiario, agenciacodigocedente, datadocumento,
              numerodocumento, especiedocumento, dataprocessamento, nossonumero,
              nossonumerosemdv, carteira, especie, codigobarras, erro,
              codigobanco, codigoagencia, contacorrente, codigocedente,
              ncarteira, codigoespecie, aceite, nomecedente, cnpjcedente,
              enderecocedente, bairrocedente, cepcedente, cidadecedente,
              ufcedente, sacado, mensagensret, instrucoes, mensagem, resultado);
//  CalcularBoleto(DateToStr(DataSis), DateToStr(datavencto), QPlanosPagto['plp_vrmatricula'], FloatToStr(QContrato['ins_ra']), IntToStr(QContrato['ins_boletomatr']), '1', linhadigitavel, localpagamento, codigobarras, codigobancocomdigito, descricaocarteira, especiedoc, especie, agenciacodigocedente, numerobancario);
//  Calc_Barra(QContrato['ins_boletomatr'],QPlanosPagto['plp_vrmatricula'],datavencto,L_Digit,CBarra);

  If resultado = '1'
  Then
   Begin
     ppL_DataVenc.Caption := DateToStr(datavencto);
     ppL_DataVenc2.Caption := DateToStr(datavencto);
     ppL_BlqNumero2.Caption := nossonumero; //FormatFloat('0000000000000',QContrato['ins_boletomatr']);
     ppL_BlqNumero3.Caption := nossonumero;// FormatFloat('0000000000000',QContrato['ins_boletomatr']);
     ppL_NroDocumento.Caption := FormatFloat('0000000000000',QContrato['ins_boletomatr']); // FormatFloat('0000000000',QContrato['ins_ra']);
     ppL_NroDocumento2.Caption := FormatFloat('0000000000000',QContrato['ins_boletomatr']); //FormatFloat('0000000000',QContrato['ins_ra']);
     ppL_DtDocumento.Caption := DateToStr(date);
     ppL_DtDocumento2.Caption := DateToStr(date);
     ppL_DtProc.Caption := DateToStr(date);
     ppL_Valor.Caption := FormatFloat('##,##0.00',QPlanosPagto['plp_vrmatricula']);
     ppL_Valor2.Caption := FormatFloat('##,##0.00',QPlanosPagto['plp_vrmatricula']);
     ppL_NroInscr.Caption := 'Nº Inscr.: ' +StrZero(QContrato['ins_seq'],6);
   //  ppL_LinhaDig.Caption := L_digit;
   //  vDig:=Copy(L_digit,20,1);
   //  LCedente1.Caption:='1299/2700758/'+vDig;
   //  LCedente2.Caption:='1299/2700758/'+vDig;
   //  BarCode.Data := Cbarra;
     LLocal.Caption:=localpagamento;
     ppL_LinhaDig.Caption := linhadigitavel;
     LCedente1.Caption:=agenciacodigocedente;
     LCedente2.Caption:=agenciacodigocedente;
     BarCode.Data := codigobarras;
     LEspecieDoc1.Caption:=especiedocumento;
     LEspecieDoc2.Caption:=especiedocumento;
     LEspecie.Caption:=especie;
     LCarteira.Caption:=descricaocarteira;
     Result:=True;
   End
  Else MessageDlg(erro,mtError,[mbOk],0);
End;

Procedure TFInscrit.Grava_Inscrito;
var vSeqRA:word;
    vRA:string;
    vSeqBloq, vSeq:integer;
Begin
  Try
    Menuprin.Database1.StartTransaction;
    If QInscrito['ins_ra'] = Null
    Then
     Begin
       If not vranovo
       Then vRA:=StrZero(QAluno['alu_ra'],11)
       Else
        Begin
{          QAux.Close;
          QAux.RequestLive:=True;
          QAux.Sql.Clear;
          QAux.Sql.Add('select * from sca_cursos');
          QAux.Sql.Add('where cur_codigo =:codcur');
          QAux.ParamByName('codcur').AsInteger:=QCurso['cur_codigo'];
          QAux.Open;
          vSeqRA:=NULLToZero(QAux['Cur_SeqAlu']);
          If vSeqRA < 9999
          Then Inc(vSeqRA)
          Else vSeqRA:=1;
          QAux.Edit;
          QAux['Cur_SeqAlu']:=vSeqRA;
          QAux.Post;
          vRA:=StrZero(QCurso['Cur_Codigo'],4)+Copy(IntToStr(QPlanosPagto['plp_anoing']),3,2)+StrZero(vSeqRA,4);
          vRA:=vRA+IntToStr(Calcula_DV_RA(vRA));}

          SPGeraRA.Close;
          SPGeraRA.Params[0].AsSmallInt:=QCurso['cur_codigo'];
          SPGeraRA.Params[1].AsSmallInt:=QPlanosPagto['plp_anoing'];
          If QPlanosPagto['plp_mesing'] <= 6
          Then SPGeraRA.Params[2].AsSmallInt:=1
          Else SPGeraRA.Params[2].AsSmallInt:=2;
          SPGeraRA.Open;
          vRA:=SPGeraRA['alu_ra'];
        End;

       QAux.Close;
       QAux.RequestLive:=True;
       QAux.Sql.Clear;
       QAux.Sql.Add('select * from fin_bloquetos');
       QAux.Sql.Add('where blq_codigo = 2'); // ensino a distância
       QAux.Open;
       vSeqBloq:=QAux['Blq_Numero'];
       Inc(vSeqBloq); //incrementa bloqueto
       QAux.Edit;
       QAux['BLQ_Numero']:=vSeqBloq;
       QAux.Post;

       QInscrito['ofc_seq']:=QOfCur['ofc_seq'];
       QInscrito['ins_matriculado']:=Pega_DataHora;
       QInscrito['ins_ra']:=StrToFloat(vRA);
       QInscrito['ins_boletomatr']:=vSeqBloq;
       QInscrito['plp_seq']:=QPlanosPagto['plp_seq'];
     End;

    QPessoa.Post;
    If Trim(CECNPJ.Text) <> ''
    Then
     Begin
       If (QPesJur.State = dsInsert) or (QPesJur.State = dsEdit)
       Then
        Begin
          If QPesJur['pes_tipo'] = Null
          Then QPesJur['pes_tipo']:=1;
          QPesJur['pes_sacento']:=Tira_Acentos(QPesJur['pes_nome']);
          QPesJur.Post;
        End;
       QInscrito['pes_juridico']:=QPesJur['pes_nro'];
     End
    Else
     If QInscrito['pes_juridico'] <> Null
     Then QInscrito['pes_juridico']:=Null;

    If QInscrito['ofc_seq'] = Null
    Then QInscrito['ofc_seq']:=QOfCur['ofc_seq'];
    If QInscrito['plp_seq'] = Null
    Then QInscrito['plp_seq']:=QPlanosPagto['plp_seq'];
    QInscrito.Post;
    If (QInscrito['ins_raend'] <> Null)
    Then
     Begin
       If QEndLocal.State = dsEdit
       Then QEndLocal.Post;
       If Trim(Eemail2.Text) <> ''
       Then
        Begin
          If not Qemail.Eof
          Then
           Begin
             vSeq:=Qemail['eml_seq'];
             Qemail.Edit;
             Qemail['eml_email']:=Eemail2.Text;
             Qemail['eml_dtultimaatual']:=DataSis;
             Qemail['eml_sistema']:='P';
             Qemail['eml_ativo']:='S';
             Qemail['eml_principal']:='S';
             Qemail.Post;
           End
          Else
           Begin
             Qemail.Insert;
             Qemail['pes_nro']:=QPessoa['pes_nro'];
             Qemail['eml_email']:=Eemail2.Text;
             Qemail['eml_dtultimaatual']:=DataSis;
             Qemail['eml_sistema']:='P';
             Qemail['eml_ativo']:='S';
             Qemail['eml_principal']:='S';
             Qemail.Post;
             vSeq:=Qemail['eml_seq'];
           End;

          Qemail.Close;
          Qemail.RequestLive:=False;
          Qemail.Sql.Clear;
          Qemail.Sql.Add('update crp_email set eml_sistema = "P", eml_dtultimaatual = today, eml_principal = "N"');
          Qemail.Sql.Add('where pes_nro =:nro and eml_seq <>:seq');
          Qemail.ParamByName('nro').AsInteger:=QPessoa['pes_nro'];
          Qemail.ParamByName('seq').AsInteger:=vSeq;
          Qemail.ExecSql;
        End;
     End
    Else
     Begin
       If Trim(Eemail.Text) <> ''
       Then
        Begin
          If not Qemail.Eof
          Then
           Begin
             vSeq:=Qemail['eml_seq'];
             Qemail.Edit;
             Qemail['eml_email']:=Eemail.Text;
             Qemail['eml_dtultimaatual']:=DataSis;
             Qemail['eml_sistema']:='P';
             Qemail['eml_ativo']:='S';
             Qemail['eml_principal']:='S';
             Qemail.Post;
           End
          Else
           Begin
             Qemail.Insert;
             Qemail['pes_nro']:=QPessoa['pes_nro'];
             Qemail['eml_email']:=Eemail.Text;
             Qemail['eml_dtultimaatual']:=DataSis;
             Qemail['eml_sistema']:='P';
             Qemail['eml_ativo']:='S';
             Qemail['eml_principal']:='S';
             Qemail.Post;
             vSeq:=Qemail['eml_seq'];
           End;

          Qemail.Close;
          Qemail.RequestLive:=False;
          Qemail.Sql.Clear;
          Qemail.Sql.Add('update crp_email set eml_sistema = "P", eml_dtultimaatual = today, eml_principal = "N"');
          Qemail.Sql.Add('where pes_nro =:nro and eml_seq <>:seq');
          Qemail.ParamByName('nro').AsInteger:=QPessoa['pes_nro'];
          Qemail.ParamByName('seq').AsInteger:=vSeq;
          Qemail.ExecSql;
        End;
     End;

    Menuprin.Database1.Commit;
  Except
    Menuprin.Database1.RollBack;
    MessageDlg('Ocorreu um erro. Cadastro será cancelado!',mtError,[mbOk],0);
  End;
End;

procedure TFInscrit.b_cancelaClick(Sender: TObject);
begin
 PInscr.Enabled:=True;
 QPessoa.Cancel;
 QInscrito.Cancel;
 QEndLocal.Cancel;
 If (QCurso['cur_codigo'] <> Null) and (QOfCur['ofc_seq'] <> Null) and (not QPlanosPagto.Eof)
 Then CECPF.SetFocus
 Else DBLCCurso.SetFocus;
end;

procedure TFInscrit.B_SairClick(Sender: TObject);
begin
 Close;
end;

procedure TFInscrit.FormActivate(Sender: TObject);
begin
//  ShowMessage('0010891218'+IntToStr(Calcula_DV_RA('0010891218')));
//  ShowMessage('0816170020'+IntToStr(Calcula_DV_RA('0816170020')));
  QCurso.Close;
  QCurso.Open;
  If QCurso['cur_codigo'] <> Null
  Then DBLCCurso.KeyValue:=QCurso['cur_codigo'];
  DBLCCurso.SetFocus;
end;

procedure TFInscrit.b_okClick(Sender: TObject);
var municipio, estado, vnomcur:string;
    vdia,vmes,vano:word;
    vcodcur, voferta, vplano, vinscr:integer;
    vra2:real;
begin
  B_Ok.Enabled:=False;
  If (QInscrito.State = DsEdit)
  Then Grava_Inscrito;
  If QInscrito['ins_ra'] <> Null
  Then
   Begin
     vra2:=QInscrito['ins_ra'];
     PG_Cad.Enabled:=False;
     PG_End.Enabled:=False;
     PG_EndLocal.Enabled:=False;
     PG_Jur.Enabled:=False;
     QContrato.Close;
     QContrato.Sql.Clear;
     QContrato.Sql.Add('select * from crp_pessoas p, spg_inscricao i,  outer sca_nacionalidade n');
     QContrato.Sql.Add('where i.pes_nro = p.pes_nro and p.nac_codigo = n.nac_codigo and ins_seq =:seq');
     QContrato.ParamByName('seq').AsInteger:=QInscrito['ins_seq'];
     QContrato.Open;
     ppL_Faculdade.Caption:=NULLToSpace(QCurso['fac_completo']);
     If (QCurso['cur_grapos'] <> 4) and (QCurso['cur_grapos'] <> 5) // mestrado e doutorado o contrato é diferente
     Then ppL_Curso.Caption:='Curso : '+NULLToSpace(QCurso['cur_programa'])
     Else ppL_Curso.Caption:='Curso : '+NULLToSpace(QCurso['cur_nome']);
     ppL_RA.Caption:='Registro Acadêmico : '+Mascara_RA(QContrato['ins_ra']);
     LSexo.Caption:='';
     municipio:='';
     estado:='';
     vbairro:='';
     vuf:='';
     If (QInscrito['ins_raend'] <> Null)
     Then
      Begin
        QEndLocal.Close;
        QEndLocal.ParamByName('ra').AsFloat:=QInscrito['ins_raend'];
        QEndLocal.Open;
        LRua.Caption:=NULLToSpace(QEndLocal['end_locrua']);
        LFone.Caption:=NULLToSpace(QEndLocal['end_locfone']);
        LCEP.Caption:=NULLToSpace(QEndLocal['end_loccep']);
        vbairro:=NULLToSpace(QEndLocal['end_locbai']);
        If QEndLocal['loc_codigo'] <> Null
        Then
         Begin
           QAux.Close;
           QAux.RequestLive:=False;
           QAux.Sql.Clear;
           QAux.Sql.Add('select * from cep_local l, cep_estado e');
           QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
           QAux.ParamByName('codloc').AsInteger:=QEndLocal['loc_codigo'];
           QAux.Open;
           If not QAux.Eof
           Then
            Begin
              municipio:=NULLToSpace(QAux['loc_nome']);
              estado:=NULLToSpace(QAux['est_descr']);
              vuf:=NULLToSpace(QAux['loc_uf']);
            End;
         End;
      End
     Else
      Begin
        LRua.Caption:=NULLToSpace(QPessoa['pes_rua']);
        LFone.Caption:=NULLToSpace(QPessoa['pes_telefone']);
        LCEP.Caption:=NULLToSpace(QPessoa['pes_cep']);
        vbairro:=NULLToSpace(QPessoa['pes_bairro']);
        If QContrato['loc_codigo'] <> Null
        Then
         Begin
           QAux.Close;
           QAux.RequestLive:=False;
           QAux.Sql.Clear;
           QAux.Sql.Add('select * from cep_local l, cep_estado e');
           QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
           QAux.ParamByName('codloc').AsInteger:=QContrato['loc_codigo'];
           QAux.Open;
           If not QAux.Eof
           Then
            Begin
              municipio:=NULLToSpace(QAux['loc_nome']);
              estado:=NULLToSpace(QAux['est_descr']);
              vuf:=NULLToSpace(QAux['loc_uf']);
            End;
         End;
      End;
     If QContrato['pes_sexo'] = 1
     Then LSexo.Caption:='Masculino'
     Else
      If QContrato['pes_sexo'] = 2
      Then LSexo.Caption:='Feminino';
     LMunicipio.Caption:=municipio;
     LEstado.Caption:=estado;
     DecodeDate(DataSis,vano,vmes,vdia);
     LCidade.Caption:='Presidente Prudente, '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano);
     LEmissao.Caption:='Emissão: '+FormatDateTime('dd/mm/yyyy hh:mm:ss',Pega_DataHora)+ ' ';

     If QContrato['pes_juridico'] <> Null
     Then
      Begin
        DBTNomAlu.Visible:=True;
        QPesJur.Close;
        QPesJur.Sql.Clear;
        QPesJur.Sql.Add('select * from crp_pessoas where pes_nro =:nro');
        QPesJur.ParamByName('nro').AsInteger:=QContrato['pes_juridico'];
        QPesJur.Open;
        If not QPesJur.Eof
        Then LSacado.Caption:=QPesJur['pes_nome']+' - CNPJ : '+QPesJur['pes_cnpj'];
      End
     Else
      Begin
        DBTNomAlu.Visible:=False;
        LSacado.Text:=QContrato['pes_nome'];
      End;

     vtipbol:='N';
     If MessageDlg('Emitir requerimento de matrícula para pagamento apenas na TESOURARIA?',mtConfirmation, [mbYes, mbNo], 0) = mrYes
     Then vtipbol:='S';

     Santander1.Visible:=vtipbol='N';
     Santander2.Visible:=vtipbol='N';
     LAgencia1.Visible:=vtipbol='N';
     LAgencia2.Visible:=vtipbol='N';
     Linha1.Visible:=vtipbol='N';
     Linha2.Visible:=vtipbol='N';
     Linha3.Visible:=vtipbol='N';
     Linha4.Visible:=vtipbol='N';

     If Gera_Boleto
     Then
      Begin
        vcodcur:=QCurso['cur_codigo'];
        voferta:=QOfCur['ofc_seq'];
        vplano:=QPlanosPagto['plp_seq'];
        vnomcur:=NULLToSpace(QCurso['cur_nome']);
        vinscr:=QInscrito['ins_seq'];
        If ((QInscrito['ins_raend'] <> Null) and (Trim(Eemail2.Text) <> '')) or
           ((QInscrito['ins_raend'] = Null) and (Trim(Eemail.Text) <> ''))
        Then
         If MessageDlg('Deseja enviar uma cópia do requerimento de matrícula para o aluno por email?',mtConfirmation, [mbYes, mbNo], 0) = mrYes
         Then
          Begin
            Try
              RMatr.AllowPrintToFile := True;
              RMatr.ShowPrintDialog := False;
              RMatr.ShowCancelDialog := False;
              RMatr.TextFileName := 'BOLETO.PDF';
              RMatr.DeviceType := 'PDFFile';
              Menuprin.Database1.Connected := False;
              RMatr.Print;
              Menuprin.Database1.Connected := True;

              QInscrito.Close;
              QInscrito.Sql.Clear;
              QInscrito.Sql.Add('select * from spg_inscricao');
              QInscrito.Sql.Add('where ins_seq =:seq');
              QInscrito.ParamByName('seq').AsInteger:=vinscr;
              QInscrito.Open;

              { Servidor SMTP }
              NMSMTP1.Host := 'mail.unoeste.br';

              { Porta SMTP }
              NMSMTP1.Port := 25;

              { Nome de login do usuário }
              NMSMTP1.UserID := 'posgrad@unoeste.br';

              { Conecta ao servidor }
              NMSMTP1.Connect;

              { Se ocorrer algum erro durante a conexão com o servidor, avise! }
              If not NMSMTP1.Connected
              Then raise Exception.Create('Erro de conexão')
              Else
               Begin
                 with NMSMTP1.PostMessage do begin
                 { Seu e-mail }
       //          FromAddress := LowerCase(NULLToSpace(QCursoFunc['fun_email']));
                 FromAddress := 'posgrad@unoeste.br';

                 { Seu nome }
                 FromName := 'Secretaria da Pró-Reitoria de Pesquisa e Pós-Graduação da Unoeste';

                 { E-mail do destinatário }
                 ToAddress.Clear;
                 ToCarbonCopy.Clear;

                 If (QInscrito['ins_raend'] <> Null)
                 Then ToAddress.Add(Trim(Eemail2.Text))
                 Else ToAddress.Add(Trim(Eemail.Text));
//                 ToAddress.Add('cesartakahashi@gmail.com');
//                 If CBCopia.Checked
//                 Then ToCarbonCopy.Add('posgrad@unoeste.br');

                 { Assunto da mensagem }
                 Subject := 'Requerimento de Matrícula';

                 { Corpo da mensagem }
                 Body.Clear;
                 Body.Add('Olá '+QContrato['pes_nome']);
                 Body.Add(''); { Linha em branco }
                 Body.Add('Segue anexo a cópia do requerimento de matrícula do curso de '+vnomcur+' para que seja efetuado o seu pagamento.');
                 Body.Add(''); { Linha em branco }
                 Body.Add('Atenciosamente,');
                 Body.Add(''); { Linha em branco }
                 Body.Add('Secretaria da Pró-Reitoria de Pesquisa e Pós-Graduação da Unoeste');
                 Body.Add('posgrad@unoeste.br');
                 Body.Add('Endereço para correspondência:');
                 Body.Add('UNOESTE - Campus II - Bloco B1');
                 Body.Add('Rodovia Raposo Tavares, km 572 - Bairro Limoeiro');
                 Body.Add('Presidente Prudente - SP');
                 Body.Add('CEP: 19067-175');
                 { Anexar arquivos(Se não quiser anexar arquivos, apague as 3 linhas seguintes) }

                 Attachments.Clear;

                 // Endereço do anexo
                 If FileExists('BOLETO.PDF')
                 Then Attachments.Add('BOLETO.PDF');

                 end;

                 { Manda o e-mail }
                 NMSMTP1.SendMail;

                 { Disconecta do servidor }
                 NMSMTP1.Disconnect;

                 MessageDlg('O email foi encaminhado com sucesso!',mtInformation,[mbOk],0);
               End;
            Except
              MessageDlg('Ocorreu um erro no envio do email!',mtError,[mbOk],0);
            End;
          End;

        RMatr.AllowPrintToFile := False;
        RMatr.ShowPrintDialog := True;
        RMatr.ShowCancelDialog := True;
        RMatr.DeviceType := 'Screen';
        Menuprin.Database1.Connected := False;
        RMatr.Print;
        Menuprin.Database1.Connected := True;

        QCurso.Close;
        QCurso.Open;
        DBLCCurso.KeyValue:=vcodcur;
        QOfCur.Close;
        QOfCur.ParamByName('codcur').AsSmallInt:=QCurso['cur_codigo'];
        QOfCur.Open;
        DBLCTurma.KeyValue:=voferta;
        DecodeDate(QOfCur['ofc_dtinicio'],vano,vmes,vdia);
        QPlanosPagto.Close;
        QPlanosPagto.Sql.Clear;
        QPlanosPagto.Sql.Add('select * from fin_planospagto');
        If vmes <> 12
        Then
         Begin
           If vmes = 1
           Then
            Begin
              QPlanosPagto.Sql.Add('where cur_codigo =:codcur and ((plp_anoing =:ano and plp_mesing =:mes) or (plp_anoing =:ano and plp_mesing =:mes2) or');
              QPlanosPagto.Sql.Add('     (plp_anoing =:ano and plp_mesing =:mes3) or (plp_anoing =:ano2 and plp_mesing =:mes4))');
              QPlanosPagto.ParamByName('ano2').AsSmallInt:=vano - 1;
              QPlanosPagto.ParamByName('mes4').AsSmallInt:=12;
            End
           Else
            Begin
              QPlanosPagto.Sql.Add('where cur_codigo =:codcur and plp_anoing =:ano and (plp_mesing =:mes or plp_mesing =:mes2 or plp_mesing =:mes3 or plp_mesing =:mes4)');
              QPlanosPagto.ParamByName('mes4').AsSmallInt:=vmes - 1;
            End;
           QPlanosPagto.ParamByName('mes2').AsSmallInt:=vmes + 1;
           QPlanosPagto.ParamByName('mes3').AsSmallInt:=vmes + 2; // foi necessário procurar um plano no mês seguinte pois existem cursos oferecidos nesta situação
         End
        Else
         Begin
           QPlanosPagto.Sql.Add('where cur_codigo =:codcur and ((plp_anoing =:ano and plp_mesing =:mes) or (plp_anoing =:ano2 and plp_mesing =:mes2) or');
           QPlanosPagto.Sql.Add('     (plp_anoing =:ano2 and plp_mesing =:mes3) or (plp_anoing =:ano and plp_mesing =:mes4))');
           QPlanosPagto.ParamByName('ano2').AsSmallInt:=vano + 1;
           QPlanosPagto.ParamByName('mes2').AsSmallInt:=1;
           QPlanosPagto.ParamByName('mes3').AsSmallInt:=2;  // foi necessário procurar um plano no mês seguinte pois existem cursos oferecidos nesta situação
           QPlanosPagto.ParamByName('mes4').AsSmallInt:=11;  // foi necessário procurar um plano no mês seguinte pois existem cursos oferecidos nesta situação
         End;

        QPlanosPagto.Sql.Add('order by plp_anoing, plp_mesing, plp_nparcelas');
        QPlanosPagto.ParamByName('codcur').AsSmallInt:=QOfCur['cur_codigo'];
        QPlanosPagto.ParamByName('ano').AsSmallInt:=vano;
        QPlanosPagto.ParamByName('mes').AsSmallInt:=vmes;
        QPlanosPagto.Open;
        DBLCPlanos.KeyValue:=vplano;

        QInscrito.Close;
        QInscrito.Sql.Clear;
        QInscrito.Sql.Add('select * from spg_inscricao');
        QInscrito.Sql.Add('where ins_ra =:ra');
        QInscrito.ParamByName('ra').AsFloat:=vra2;
        QInscrito.Open;

        BContrato.Enabled:=True;
        BContrato.SetFocus;
      End
     Else
      Begin
        MessageDlg('Ocorreu um erro na geração do boleto!',mtError,[mbOk],0);
        BContrato.Enabled:=True;
        BContrato.SetFocus;
      End;
   End
  Else
   Begin
     PInscr.Enabled:=True;
     CECPF.SetFocus;
   End;
end;

procedure TFInscrit.b_alteraClick(Sender: TObject);
begin
  PageControl1.ActivePage:=PG_Cad;
  PInscr.Enabled:=False;
  B_Altera.Enabled:=False;
  B_Ok.Enabled:=True;
  BContrato.Enabled:=False;
  QPessoa.Edit;
  QInscrito.Edit;
  If Trim(CECNPJ.Text) <> ''
  Then QPesJur.Edit;
  If QInscrito['ins_diavencto'] = null
  Then QInscrito['ins_diavencto']:=10; // deixar o dia de vencimento como padrão dia 10 segundo conversa com Flávio dia 17/08/2011
  If not QFunc.Eof // inscrito se trata de um funcionário
  Then
   Begin
     MessageDlg('Atenção. Inscrição é de um funcionário ativo. Alterações de dados pessoais deverão ser efetuadas no Departamento Pessoal!',mtInformation,[mbOk],0);
     PG_Cad.Enabled:=True;
     PG_End.TabVisible:=True;
     GroupBox1.Enabled:=False;
     GroupBox2.Enabled:=True;
     DBCBDia.SetFocus;
   End
  Else
   Begin
     If (QInscrito['ins_raend'] <> Null)
     Then
      Begin
        QEndLocal.Edit;
        PG_EndLocal.TabVisible:=True;
        PG_EndLocal.Enabled:=True;
      End
     Else
      Begin
        PG_End.TabVisible:=True;
        PG_End.Enabled:=True;
      End;
     PG_Cad.Enabled:=True;
     GroupBox1.Enabled:=True;
     GroupBox2.Enabled:=True;
     DBECPF.SetFocus;
   End;
  PG_Jur.Enabled:=True;
end;

procedure TFInscrit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var Resp:Integer;
begin
  B_Sair.SetFocus;
  If (QInscrito.State = DsEdit) and (QInscrito.Modified)
  Then
   Begin
    resp := Application.MessageBox('Deseja gravar as alterações antes de sair?','Confirma',mb_iconquestion + mb_YesNoCancel);
    If (resp = IdYes) or (resp = IdNo)
    Then
     Begin
      If (resp = IdYes)
      Then Grava_Inscrito
      Else
       Begin
         QPessoa.Cancel;
         QInscrito.Cancel;
         QEndLocal.Cancel;
       End;
     End
    Else canclose:=False;
   End;
  If canclose
  Then
   Begin
     QInscrito.Close;
     QPessoa.Close;
     QEndLocal.Close;
   End
end;

procedure TFInscrit.E_CidadeExit(Sender: TObject);
begin
  If (ActiveControl<>B_Cancela) and (ActiveControl<> B_OK)
      and (ActiveControl<>B_Sair) then
    if E_Cidade.Text = '' then
    begin
      MessageDlg('Digite as iniciais da Localidade',mtInformation,[mbOk],0);
      E_Cidade.Setfocus;
    end
    else
    begin
      If E_Cidade.Modified Then
      Begin
        Q_Localidade.Close;
        Q_Localidade.SQL.Clear;
        Q_Localidade.SQL.Add('select loc_codigo,loc_nome,loc_uf from cep_local where loc_nome like :nome');
        Pesquisa(Q_Localidade,[E_Cidade.Text+'%']);
        if Q_Localidade.RecordCount = 1 then
        begin
          QPessoa['loc_codigo']:=Q_Localidade['loc_codigo'];
          E_Cidade.Text:=Q_Localidade['loc_nome']+' - '+Q_Localidade['loc_uf'];
          DBECEP.SetFocus;
        end
        else
          If (Q_Localidade.RecordCount = 0) Then
          Begin
            MessageDlg('Nome de Cidade Inválido!',mtInformation,[mbOk],0);
            Q_Localidade.Close;
            E_Cidade.SetFocus;
          End
          Else LC_Cidade.DropDown;
      end;
    end;
end;

procedure TFInscrit.LC_CidadeClick(Sender: TObject);
begin
  E_Cidade.Text:=LC_Cidade.Text+' - '+Q_Localidade['loc_uf'];
end;

procedure TFInscrit.B_LocInsClick(Sender: TObject);
begin
  Application.CreateForm(TFConsIns, FConsIns);
  FConsIns.ENome.Text:='';
  FConsIns.Hide;
  FConsIns.ShowModal;
  If VCPF <> 0
  Then CECPF.Value:=VCPF;
end;

procedure TFInscrit.PG_CadExit(Sender: TObject);
begin
{  If ((QInscrito.State = dsInsert) or (QInscrito.State = dsEdit)) and (not B_cancela.Focused)
  Then
   If PG_End.TabVisible
   Then
    Begin
      PageControl1.ActivePage := PG_End;
      If PG_End.Enabled // liberado para alteração o endereço do inscrito por não se tratar de um funcionário
      Then DBERua.SetFocus;
    End
   Else
    If PG_EndLocal.TabVisible
    Then
     Begin
       PageControl1.ActivePage := PG_EndLocal;
       DBERua2.SetFocus;
     End;}
end;

procedure TFInscrit.CECPFEnter(Sender: TObject);
begin
 Limpa(FInscrit);
 Q_Localidade.Close;
 Q_LocalidadeJ.Close;
 QPessoa.Close;
 QEndLocal.Close;
 b_Altera.Enabled:=False;
 B_Ok.Enabled:=False;
 BContrato.Enabled:=False;
 PG_Cad.Enabled:=False;
 PG_End.Enabled:=False;
 PG_End.TabVisible:=False;
 PG_EndLocal.Enabled:=False;
 PG_EndLocal.TabVisible:=False;
 PG_Jur.Enabled:=False;
 PageControl1.ActivePage:=PG_Cad;
 QInscrito.Close;
 QNac.Close;
 QBolPagto.Close;
 QAluno.Close;
 B_LocIns.Enabled:=True;
 vranovo:=true;
 CECPF.SelectAll;
end;

procedure TFInscrit.CECPFExit(Sender: TObject);
var vdia,vmes,vano:word;
    pagou:boolean;
begin
  B_LocIns.Enabled:=False;
  If (not DBLCCurso.Focused) and (not DBLCTurma.Focused) and (not B_Cancela.Focused) and (not B_Sair.Focused) and
     (QInscrito.State <> dsEdit) Then
  begin
    If CECPF.Value <> 0
    Then
     Begin
       QAux.Close;
       QAux.RequestLive:=False;
       QAux.Sql.Clear;
       QAux.Sql.Add('select bpg_boleto, ofc_seq, i.pes_nro, ins_seq, plp_seq, ins_status from spg_inscricao i, crp_pessoas p, spg_propostacurso pc');
//       QAux.Sql.Add('where i.pes_nro = p.pes_nro and i.prc_seq = pc.prc_seq and pc.cur_codigo =:codcur and pes_cpf =:cpf and bpg_boleto is not null and ins_status = "N" and (ins_excluido <> "1" or ins_excluido is null)');
       QAux.Sql.Add('where i.pes_nro = p.pes_nro and i.prc_seq = pc.prc_seq and pc.cur_codigo =:codcur and pes_cpf =:cpf and bpg_boleto is not null and (ins_excluido <> "1" or ins_excluido is null)');
       QAux.Sql.Add('order by bpg_boleto desc');
       QAux.ParamByName('codcur').AsSmallInt:=NULLToZero(QCurso['cur_codigo']);
       QAux.ParamByName('cpf').AsFloat:=CECPF.Value;
       QAux.Open;
       If QAux.Eof
       Then
        Begin
          MessageDlg('Não existe inscrição efetuada para o C.P.F. informado ou matrícula já foi confirmada!',mtError,[mbOk],0);
          CECPF.SetFocus;
        End
       Else
        Begin
          pagou:=false;
          While not QAux.Eof do
          Begin
            QBolPagto.Close;
            QBolPagto.Sql.Clear;
            QBolPagto.Sql.Add('select * from fin_bolpagto');
            QBolPagto.Sql.Add('where bpg_boleto =:boleto');
            QBolPagto.ParamByName('boleto').AsInteger:=NULLToZero(QAux['bpg_boleto']);
            QBolPagto.Open;
            If QBolPagto['bpg_dtpagamento'] <> Null
            Then
             Begin
               pagou:=true;
               break;
             End;
            QAux.Next;
          End;
          If not pagou
          Then
           Begin
             MessageDlg('Inscrição não foi paga. Matrícula não pode ser efetuada!',mtError,[mbOk],0);
             CECPF.Setfocus;
           End
          Else
           Begin
             If (QAux['ofc_seq'] <> Null) and (QOfCur['ofc_seq'] <> QAux['ofc_seq'])
             Then
              Begin
                MessageDlg('Matrícula já foi efetuada por este inscrito em outra turma!',mtError,[mbOk],0);
                DBLCTurma.KeyValue:=QAux['ofc_seq'];
                DBLCTurma.SetFocus;
              End
             Else
              Begin
                If (QAux['plp_seq'] <> Null) and (QAux['plp_seq'] <> QPlanosPagto['plp_seq'])
                Then DBLCPlanos.KeyValue:=QAux['plp_seq'];
                
                QFunc.Close;
                QFunc.Sql.Clear;
                QFunc.Sql.Add('select * from fol_funcionario f, crp_empresas e');
                QFunc.Sql.Add('where f.emp_codigo = e.emp_codigo and pes_nro =:nro and emp_bloqueiaaluno = "S"');
                QFunc.ParamByName('nro').AsInteger:=QAux['pes_nro'];
                QFunc.Open;

                QNac.Open;
                QPessoa.Close;
                QPessoa.Sql.Clear;
                QPessoa.Sql.Add('select * from crp_pessoas');
                QPessoa.Sql.Add('where pes_nro =:nro');
                QPessoa.ParamByName('nro').AsInteger:=QAux['pes_nro'];
                QPessoa.Open;

                Qemail.Close;
                Qemail.RequestLive:=True;
                Qemail.Sql.Clear;
                Qemail.Sql.Add('select * from crp_email');
                Qemail.Sql.Add('where pes_nro =:nro and eml_principal = "S" and eml_ativo = "S"');
                Qemail.ParamByName('nro').AsInteger:=QAux['pes_nro'];
                Qemail.Open;

                QInscrito.Close;
                QInscrito.Sql.Clear;
                QInscrito.Sql.Add('select * from spg_inscricao');
                QInscrito.Sql.Add('where ins_seq =:seq');
                QInscrito.ParamByName('seq').AsInteger:=QAux['ins_seq'];
                QInscrito.Open;
                If (QInscrito['ins_raend'] <> Null)
                Then
                 Begin
                   If not Qemail.Eof
                   Then Eemail2.Text:=NULLToSpace(Qemail['eml_email']);
                   PG_EndLocal.TabVisible:=True;
                   QEndLocal.Close;
                   QEndLocal.ParamByName('ra').AsFloat:=QInscrito['ins_raend'];
                   QEndLocal.Open;
                   If QEndLocal['loc_codigo'] <> null
                   Then
                    Begin
                      Q_Localidade.Close;
                      Q_Localidade.SQL.Clear;
                      Q_Localidade.SQL.Add('select loc_codigo,loc_nome,loc_uf from cep_local where loc_codigo = :vCod');
                      if Pesquisa(Q_Localidade,[QEndLocal['loc_codigo']]) then
                        E_Cidade2.Text:=Q_Localidade['Loc_Nome']+' - '+Q_Localidade['loc_uf'];
                    End;
                 End
                Else
                 Begin
                   If not Qemail.Eof
                   Then Eemail.Text:=NULLToSpace(Qemail['eml_email']);
                   PG_End.TabVisible:=True;
                   If QPessoa['loc_codigo'] <> null
                   Then
                    Begin
                      Q_Localidade.Close;
                      Q_Localidade.SQL.Clear;
                      Q_Localidade.SQL.Add('select loc_codigo,loc_nome,loc_uf from cep_local where loc_codigo = :vCod');
                      if Pesquisa(Q_Localidade,[QPessoa['loc_codigo']]) then
                        E_Cidade.Text:=Q_Localidade['Loc_Nome']+' - '+Q_Localidade['loc_uf'];
                    End;
                 End;

                If (QInscrito['pes_juridico'] <> Null)
                Then
                 Begin
                   QPesJur.Close;
                   QPesJur.Sql.Clear;
                   QPesJur.Sql.Add('select * from crp_pessoas where pes_nro =:nro');
                   QPesJur.ParamByName('nro').AsInteger:=QInscrito['pes_juridico'];
                   QPesJur.Open;
                   If not QPesJur.Eof
                   Then CECNPJ.Text:=QPesJur['pes_cnpj'];
                 End;

                If QInscrito['ins_ra'] <> Null
                Then
                 Begin
                   BContrato.Enabled:=True;
//                   If (QCurso['cur_grapos'] <> 4) and (QCurso['cur_grapos'] <> 5) // mestrado e doutorado não é para gerar o contrato pelo sistema por enquanto
//                   Then BContrato.Enabled:=True;
                   If (QAux['ins_status'] = 'S') // inscrição já foi confirmada, podendo somente emitir o contrato
                   Then BContrato.SetFocus
                   Else
                    Begin
                      B_Altera.Enabled:=True;
                      B_Ok.Enabled:=True;
                      B_Ok.SetFocus;
                    End;
                 End
                Else
                 Begin
                   vranovo:=true;
                   If (QCurso['cur_grapos'] = 4) or (QCurso['cur_grapos'] = 5) // mestrado e doutorado
                   Then
                    Begin
                      QAluno.Close;
                      QAluno.Sql.Clear;
                      QAluno.Sql.Add('select * from sca_alunos a, crp_pessoas p');
                      QAluno.Sql.Add('where a.pes_nro = p.pes_nro and pes_cpf =:cpf and cur_codigo =:codcur');
                      QAluno.Sql.Add('order by alu_anoing desc, alu_seming desc');
                      QAluno.ParamByName('cpf').AsFloat:=CECPF.Value;
                      QAluno.ParamByName('codcur').AsSmallInt:=QCurso['cur_codigo'];
                      QAluno.Open;
                      If not QAluno.Eof
                      Then
                       If MessageDlg('Aluno já possui R.A. '+Mascara_RA(QAluno['alu_ra'])+'. Deseja utilizar o mesmo?',mtConfirmation, [mbYes, mbNo], 0) = mrYes
                       Then vranovo:=false;
                    End;
                   If (QAux['ins_status'] <> 'S') // inscrição ainda não foi confirmada
                   Then
                    Begin
                      B_Altera.Enabled:=True;
                      B_Altera.SetFocus;
                    End;
                 End;
              End;
           End;
        End;
     End
    Else CECPF.SetFocus;
  End;
end;

procedure TFInscrit.PageControl1Exit(Sender: TObject);
begin
  If (not B_Cancela.Focused) and (not B_Sair.Focused) and
     (QInscrito.State = dsEdit) and (B_Ok.Enabled)
  Then B_Ok.SetFocus;
end;

procedure TFInscrit.DBECPFExit(Sender: TObject);
begin
  If (QPessoa.State = dsEdit)
  Then
   If QPessoa['pes_cpf'] = 0
   Then DBECPF.SetFocus
   Else
    If NULLToZero2(QPessoa['pes_cpf']) <> 0
    Then
     If not CPF(StrZero(QPessoa['pes_cpf'],11))
     Then
      Begin
        MessageDlg('CPF Inválido!',mtError,[mbOk],0);
        QPessoa['pes_cpf']:=null;
        DBECPF.SetFocus;
      End;
end;

procedure TFInscrit.BContratoClick(Sender: TObject);
var ok:boolean;
    municipio, estado:string;
begin
  ok:=true;
  QContr.Close;
  QContr.Sql.Clear;
  QContr.Sql.Add('select * from spg_contrato');
  QContr.Sql.Add('where con_tipo = 8 and ofc_seq =:seq and alu_ra =:ra');
  QContr.ParamByName('seq').AsInteger:=QOfCur['ofc_seq'];
  QContr.ParamByName('ra').AsFloat:=QInscrito['ins_ra'];
  QContr.Open;
  If QContr.Eof
  Then
   Begin
     Try
       Menuprin.Database1.StartTransaction;
       QAux.Close;
       QAux.RequestLive:=False;
       QAux.Sql.Clear;
       QAux.Sql.Add('select max(con_seq) nrcontrato from spg_nrocontrato');
       QAux.Sql.Add('where con_tipo = 8'); // pegar o último número de contrato do aluno
       QAux.Open;
       QNroContr.Close;
       QNroContr.Sql.Clear;
       QNroContr.Sql.Add('select * from spg_nrocontrato');
       QNroContr.Open;
       QNroContr.Insert;
       QNroContr['con_seq']:=NULLToZero(QAux['nrcontrato']) + 1;
       QNroContr['con_tipo']:=8;
       QNroContr.Post;
       QContr.Close;
       QContr.Sql.Clear;
       QContr.Sql.Add('select * from spg_contrato');
       QContr.Open;
       QContr.Insert;
       QContr['con_seq']:=QNroContr['con_seq'];
       QContr['con_tipo']:=QNroContr['con_tipo'];
       QContr['con_data']:=Pega_DataHora;
       QContr['ofc_seq']:=QOfCur['ofc_seq'];
       QContr['alu_ra']:=QInscrito['ins_ra'];
       QContr.Post;
       Menuprin.Database1.Commit;
     Except
       Menuprin.Database1.RollBack;
       ok:=false;
       MessageDlg('Ocorreu um erro na emissão do contrato. Emissão não será efetuada!',mtError,[mbOk],0);
     End;
   End;

  If ok
  Then
   Begin
     QContrato.Close;
     QContrato.Sql.Clear;
     QContrato.Sql.Add('select * from crp_pessoas p, spg_inscricao i,  outer sca_nacionalidade n');
     QContrato.Sql.Add('where i.pes_nro = p.pes_nro and p.nac_codigo = n.nac_codigo and ins_seq =:seq');
     QContrato.ParamByName('seq').AsInteger:=QInscrito['ins_seq'];
     QContrato.Open;

     Qemail.Close;
     Qemail.RequestLive:=True;
     Qemail.Sql.Clear;
     Qemail.Sql.Add('select * from crp_email');
     Qemail.Sql.Add('where pes_nro =:nro and eml_principal = "S" and eml_ativo = "S"');
     Qemail.ParamByName('nro').AsInteger:=QContrato['pes_nro'];
     Qemail.Open;

     If (QCurso['cur_grapos'] <> 4) and (QCurso['cur_grapos'] <> 5) // mestrado e doutorado o contrato é diferente
     Then
      Begin
        LCurso2.Caption:='Curso : '+QCurso['cur_programa'];
        Decodedate(QOfCur['ofc_dtinicio'],vanoini,vmesini,vdiaini);
        Decodedate(QOfCur['ofc_dttermino'],vanofim,vmesfim,vdiaini);
        LPeriodo2.Caption:='Período : '+Mes[vmesini]+'/'+IntToStr(vanoini)+' a '+Mes[vmesfim]+'/'+IntToStr(vanofim);

   {     RContrato2.AllowPrintToFile := True;
        RContrato2.ShowPrintDialog := False;
        RContrato2.TextFileName := 'CONTRATO.PDF';
        RContrato2.DeviceType := 'PDFFile';}

   {     RContrato2.DeviceType := 'Printer';
        RContrato2.PrinterSetUp.PrinterName := 'PDFCreator';
        RContrato2.ShowCancelDialog := False;
        RContrato2.ShowPrintDialog := False;
        RContrato2.PrinterSetup.DocumentName:=QContrato['pes_sacento']+' - '+Mascara_RA(QContrato['ins_ra']);

        PDFCreator := CreateOLEObject('PDFCreator.clsPDFCreator');

        PDFCreator.cStart('/NoProcessingAtStartup');

        StorePDFOptions;
        SetPDFOptions('c:\temp\teste.pdf');

        PDFCreator.cPrinterStop := true;}

        ppRegion1.Visible:=False;
        ppRegion2.Visible:=False;
        ppRegion3.Visible:=False;
        ppRegion4.Visible:=False;
        ppRegion5.Visible:=False;
        ppRegion6.Visible:=False;
        ppRegion7.Visible:=False;
        ppRegion8.Visible:=False;
        ppRegion9.Visible:=False;
        ppRegion10.Visible:=False;
        ppRegion11.Visible:=False;

        If QContrato['pes_juridico'] = Null
        Then ppRegion2.Visible:=True
        Else
         Begin
           QPesJur.Close;
           QPesJur.Sql.Clear;
           QPesJur.Sql.Add('select * from crp_pessoas where pes_nro =:nro');
           QPesJur.ParamByName('nro').AsInteger:=QContrato['pes_juridico'];
           QPesJur.Open;
           LEmpresa.Caption:=QPesJur['pes_nome']+' - CNPJ : '+QPesJur['pes_cnpj'];
           LNomAlu.Caption:=QContrato['pes_nome'];
           LNacAlu.Caption:=NULLToSpace(QContrato['nac_descricao']);
           LEstCiv.Caption:='';
           Case NULLToZero(QContrato['pes_estciv']) of
             1:LEstCiv.Caption:='solteiro(a)';
             2:LEstCiv.Caption:='casado(a)';
             3:LEstCiv.Caption:='viuvo(a)';
             4:LEstCiv.Caption:='divorciado(a)';
             5:LEstCiv.Caption:='desquitado(a)';
           End;
           LRG.Caption:=QContrato['pes_rg'];
           LCPF.Caption:=Mascara_CPF(QContrato['pes_cpf']);
           municipio:='';
           estado:='';
           If (QContrato['ins_raend'] <> Null)
           Then
            Begin
              QEndLocal.Close;
              QEndLocal.ParamByName('ra').AsFloat:=QContrato['ins_raend'];
              QEndLocal.Open;
              LRuaAlu.Caption:=NULLToSpace(QEndLocal['end_locrua'])+' - '+NULLToSpace(QEndLocal['end_locbai']);
              LFoneAlu.Caption:=NULLToSpace(QEndLocal['end_locfone']);
              LCEPAlu.Caption:=NULLToSpace(QEndLocal['end_loccep']);
              If QEndLocal['loc_codigo'] <> Null
              Then
               Begin
                 QAux.Close;
                 QAux.RequestLive:=False;
                 QAux.Sql.Clear;
                 QAux.Sql.Add('select * from cep_local l, cep_estado e');
                 QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
                 QAux.ParamByName('codloc').AsInteger:=QEndLocal['loc_codigo'];
                 QAux.Open;
                 If not QAux.Eof
                 Then
                  Begin
                    municipio:=NULLToSpace(QAux['loc_nome']);
                    estado:=NULLToSpace(QAux['est_descr']);
                  End;
               End;
            End
           Else
            Begin
              LRuaAlu.Caption:=NULLToSpace(QContrato['pes_rua'])+' - '+NULLToSpace(QContrato['pes_bairro']);
              LFoneAlu.Caption:=NULLToSpace(QPessoa['pes_telefone']);
              LCEPAlu.Caption:=NULLToSpace(QPessoa['pes_cep']);
              If QContrato['loc_codigo'] <> Null
              Then
               Begin
                 QAux.Close;
                 QAux.RequestLive:=False;
                 QAux.Sql.Clear;
                 QAux.Sql.Add('select * from cep_local l, cep_estado e');
                 QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
                 QAux.ParamByName('codloc').AsInteger:=QContrato['loc_codigo'];
                 QAux.Open;
                 If not QAux.Eof
                 Then
                  Begin
                    municipio:=NULLToSpace(QAux['loc_nome']);
                    estado:=NULLToSpace(QAux['est_descr']);
                  End;
               End;
            End;
           LCidAlu.Caption:=municipio;
           LUFAlu.Caption:=estado;

           ppRegion1.Visible:=True;
           ppRegion3.Visible:=True;
           ppRegion4.Visible:=True;
           ppRegion5.Visible:=True;
           ppRegion6.Visible:=True;
           ppRegion7.Visible:=True;
           ppRegion8.Visible:=True;
           ppRegion9.Visible:=True;
           ppRegion10.Visible:=True;
           ppRegion11.Visible:=True;
         End;
        RContrato2.PrinterSetup.DocumentName:=QContrato['pes_sacento']+' - '+Mascara_RA(QContrato['ins_ra']);

//        DeviceExportToFile(RContrato2, edfPDF, 'teste.pdf');

        RContrato2.Print;
      End
     Else
      Begin
        LRA.Caption:='R.A. : '+Mascara_RA(QContrato['ins_ra']);
        LCurso.Caption:='CURSO DE PÓS-GRADUAÇÃO STRICTO SENSU / '+QCurso['cur_nome'];
        DecodeDate(QOfCur['ofc_dtinicio'],vanoini,vmesini,vdiaini);
        If vmesini <= 6
        Then Decodedate(EncodeDate(vanoini,06,30),vanofim,vmesfim,vdiaini)
        Else Decodedate(EncodeDate(vanoini,12,31),vanofim,vmesfim,vdiaini);
        LPeriodo.Caption:='Período : '+Mes[vmesini]+'/'+IntToStr(vanoini)+' a '+Mes[vmesfim]+'/'+IntToStr(vanofim);

        LNomAlu2.Caption:=QContrato['pes_nome'];
        LNacAlu2.Caption:=NULLToSpace(QContrato['nac_descricao']);
        LEstCiv2.Caption:='';
        Case NULLToZero(QContrato['pes_estciv']) of
          1:LEstCiv2.Caption:='solteiro(a)';
          2:LEstCiv2.Caption:='casado(a)';
          3:LEstCiv2.Caption:='viuvo(a)';
          4:LEstCiv2.Caption:='divorciado(a)';
          5:LEstCiv2.Caption:='desquitado(a)';
        End;
        LRG2.Caption:=QContrato['pes_rg'];
        LCPF2.Caption:=Mascara_CPF(QContrato['pes_cpf']);
        municipio:='';
        estado:='';
        If (QContrato['ins_raend'] <> Null)
        Then
         Begin
           QEndLocal.Close;
           QEndLocal.ParamByName('ra').AsFloat:=QContrato['ins_raend'];
           QEndLocal.Open;
           LRuaAlu2.Caption:=NULLToSpace(QEndLocal['end_locrua'])+' - '+NULLToSpace(QEndLocal['end_locbai']);
           LFoneAlu2.Caption:=NULLToSpace(QEndLocal['end_locfone']);
           LCEPAlu2.Caption:=NULLToSpace(QEndLocal['end_loccep']);
           If QEndLocal['loc_codigo'] <> Null
           Then
            Begin
              QAux.Close;
              QAux.RequestLive:=False;
              QAux.Sql.Clear;
              QAux.Sql.Add('select * from cep_local l, cep_estado e');
              QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
              QAux.ParamByName('codloc').AsInteger:=QEndLocal['loc_codigo'];
              QAux.Open;
              If not QAux.Eof
              Then
               Begin
                 municipio:=NULLToSpace(QAux['loc_nome']);
                 estado:=NULLToSpace(QAux['est_descr']);
               End;
            End;
         End
        Else
         Begin
           LRuaAlu2.Caption:=NULLToSpace(QContrato['pes_rua'])+' - '+NULLToSpace(QContrato['pes_bairro']);
           LFoneAlu2.Caption:=NULLToSpace(QPessoa['pes_telefone']);
           LCEPAlu2.Caption:=NULLToSpace(QPessoa['pes_cep']);
           If QContrato['loc_codigo'] <> Null
           Then
            Begin
              QAux.Close;
              QAux.RequestLive:=False;
              QAux.Sql.Clear;
              QAux.Sql.Add('select * from cep_local l, cep_estado e');
              QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
              QAux.ParamByName('codloc').AsInteger:=QContrato['loc_codigo'];
              QAux.Open;
              If not QAux.Eof
              Then
               Begin
                 municipio:=NULLToSpace(QAux['loc_nome']);
                 estado:=NULLToSpace(QAux['est_descr']);
               End;
            End;
         End;
        LCidAlu2.Caption:=municipio;
        LUFAlu2.Caption:=estado;

//        ppRegion13.Visible:=False;
//        ppRegion14.Visible:=False;
//        ppRegion19.Visible:=False;
//        ppRegion20.Visible:=False;
//        ppRegion21.Visible:=False;
//        ppRegion22.Visible:=False;

//        If QContrato['pes_juridico'] = Null
//        Then ppRegion12.Visible:=True
//        Else
//         Begin
//           ppRegion13.Visible:=True;
//           ppRegion14.Visible:=True;
//           ppRegion19.Visible:=True;
//           ppRegion20.Visible:=True;
//           ppRegion21.Visible:=True;
//           ppRegion22.Visible:=True;

//         End;
        RContrato.PrinterSetup.DocumentName:=QContrato['pes_sacento']+' - '+Mascara_RA(QContrato['ins_ra']);

        RContrato.Print;
      End;

{     PDFCreator.cPrinterStop := false;

     RestorePDFOptions;
     VarClear(PDFCreator);}

     If (QContr['con_impresso'] = Null) or (QContr['con_impresso'] = 'N')
     Then
      If MessageDlg('Confirma emissão do contrato?',mtConfirmation, [mbYes, mbNo], 0) = mrYes
      Then
       Begin
         Try
           Menuprin.Database1.StartTransaction;
           QAux.Close;
           QAux.RequestLive:=True;
           QAux.Sql.Clear;
           QAux.Sql.Add('select * from spg_contrato');
           QAux.Sql.Add('where con_tipo = 8 and ofc_seq =:seq and con_seq =:nrcontr and alu_ra =:ra');
           QAux.ParamByName('seq').AsInteger:=QOfCur['ofc_seq'];
           QAux.ParamByName('nrcontr').AsInteger:=QContr['con_seq'];
           QAux.ParamByName('ra').AsFloat:=QInscrito['ins_ra'];
           QAux.Open;
           QAux.Edit;
           QAux['con_impresso']:='S';
           QAux['con_texto']:=Texto.Text;
           QAux['con_codseg']:=MD5Print(MD5String(Texto.Text));
           Texto.Free;
           QAux.Post;
           Menuprin.Database1.Commit;
         Except
           Menuprin.Database1.RollBack;
           MessageDlg('Ocorreu um erro na confirmação do contrato. Confirmação não foi efetuada!',mtError,[mbOk],0);
         End;
       End;
   End;

  PInscr.Enabled:=True;
  CECPF.SetFocus;
end;

procedure TFInscrit.DBLCCursoEnter(Sender: TObject);
begin
 Limpa(FInscrit);
 Q_Localidade.Close;
 QPessoa.Close;
 QEndLocal.Close;
 b_Altera.Enabled:=False;
 B_Ok.Enabled:=False;
 BContrato.Enabled:=False;
 PG_Cad.Enabled:=False;
 PG_End.Enabled:=False;
 PG_End.TabVisible:=False;
 PG_EndLocal.Enabled:=False;
 PG_EndLocal.TabVisible:=False;
 PG_Jur.Enabled:=False;
 PageControl1.ActivePage:=PG_Cad;
 QInscrito.Close;
 QNac.Close;
 QOfCur.Close;
 QPlanosPagto.Close;
 QBolPagto.Close;
 QAluno.Close;
 vranovo:=true;
end;

procedure TFInscrit.QOfCurCalcFields(DataSet: TDataSet);
begin
 If (QOfCur['ofc_dtinicio'] <> Null) and (QOfCur['ofc_dttermino'] <> Null)
 Then QOfCur['periodo']:='Período : '+DateToStr(QOfCur['ofc_dtinicio'])+ ' a '+DateToStr(QOfCur['ofc_dttermino'])
end;

procedure TFInscrit.DBLCTurmaEnter(Sender: TObject);
begin
 Q_Localidade.Close;
 QPessoa.Close;
 QEndLocal.Close;
 B_Altera.Enabled:=False;
 B_Ok.Enabled:=False;
 BContrato.Enabled:=False;
 PG_Cad.Enabled:=False;
 PG_End.Enabled:=False;
 PG_End.TabVisible:=False;
 PG_EndLocal.Enabled:=False;
 PG_EndLocal.TabVisible:=False;
 PG_Jur.Enabled:=False;
 PageControl1.ActivePage:=PG_Cad;
 QInscrito.Close;
 QNac.Close;
 QPlanosPagto.Close;
 QBolPagto.Close;
 CECPF.Clear;
end;

procedure TFInscrit.DBLCCursoExit(Sender: TObject);
begin
  If (not B_Sair.Focused)
  Then
   If QCurso['cur_codigo'] <> Null
   Then
    Begin
      QOfCur.Close;
      QOfCur.ParamByName('codcur').AsSmallInt:=QCurso['cur_codigo'];
      QOfCur.Open;
      If QOfCur['ofc_seq'] <> Null
      Then
       Begin
         If NULLToSpace(QCurso['cur_programa']) <> ''
         Then
          Begin
            DBLCTurma.KeyValue:=QOfCur['ofc_seq'];
            DBLCTurma.SetFocus;
          End
         Else
          Begin
            MessageDlg('Programa do curso não foi definido!',mtError,[mbOk],0);
            DBLCCurso.SetFocus;
          End;
       End
      Else
       Begin
         MessageDlg('Não existe oferta de curso cadastrada para este curso!',mtError,[mbOk],0);
         DBLCCurso.SetFocus;
       End;
    End
   Else DBLCCurso.SetFocus;
end;

procedure TFInscrit.DBLCTurmaExit(Sender: TObject);
var vdia,vmes,vano:word;
begin
  If (not DBLCCurso.Focused) and (not B_Cancela.Focused) and (not B_Sair.Focused)
  Then
   Begin
     DecodeDate(QOfCur['ofc_dtinicio'],vano,vmes,vdia);
     QPlanosPagto.Close;
     QPlanosPagto.Sql.Clear;
     QPlanosPagto.Sql.Add('select * from fin_planospagto');
     If vmes <> 12
     Then
      Begin
        If vmes = 1
        Then
         Begin
           QPlanosPagto.Sql.Add('where cur_codigo =:codcur and ((plp_anoing =:ano and plp_mesing =:mes) or (plp_anoing =:ano and plp_mesing =:mes2) or');
           QPlanosPagto.Sql.Add('     (plp_anoing =:ano and plp_mesing =:mes3) or (plp_anoing =:ano2 and plp_mesing =:mes4))');
           QPlanosPagto.ParamByName('ano2').AsSmallInt:=vano - 1;
           QPlanosPagto.ParamByName('mes4').AsSmallInt:=12;
         End
        Else
         Begin
           QPlanosPagto.Sql.Add('where cur_codigo =:codcur and plp_anoing =:ano and (plp_mesing =:mes or plp_mesing =:mes2 or plp_mesing =:mes3 or plp_mesing =:mes4)');
           QPlanosPagto.ParamByName('mes4').AsSmallInt:=vmes - 1;
         End;
        QPlanosPagto.ParamByName('mes2').AsSmallInt:=vmes + 1;
        QPlanosPagto.ParamByName('mes3').AsSmallInt:=vmes + 2; // foi necessário procurar um plano no mês seguinte pois existem cursos oferecidos nesta situação
      End
     Else
      Begin
        QPlanosPagto.Sql.Add('where cur_codigo =:codcur and ((plp_anoing =:ano and plp_mesing =:mes) or (plp_anoing =:ano2 and plp_mesing =:mes2) or');
        QPlanosPagto.Sql.Add('     (plp_anoing =:ano2 and plp_mesing =:mes3) or (plp_anoing =:ano and plp_mesing =:mes4))');
        QPlanosPagto.ParamByName('ano2').AsSmallInt:=vano + 1;
        QPlanosPagto.ParamByName('mes2').AsSmallInt:=1;
        QPlanosPagto.ParamByName('mes3').AsSmallInt:=2;  // foi necessário procurar um plano no mês seguinte pois existem cursos oferecidos nesta situação
        QPlanosPagto.ParamByName('mes4').AsSmallInt:=11;  // foi necessário procurar um plano no mês seguinte pois existem cursos oferecidos nesta situação
      End;
      
     QPlanosPagto.Sql.Add('order by plp_anoing, plp_mesing, plp_nparcelas');
     QPlanosPagto.ParamByName('codcur').AsSmallInt:=QOfCur['cur_codigo'];
     QPlanosPagto.ParamByName('ano').AsSmallInt:=vano;
     QPlanosPagto.ParamByName('mes').AsSmallInt:=vmes;
     QPlanosPagto.Open;
     If QPlanosPagto.Eof
     Then
      Begin
        MessageDlg('Não há plano de pagamento cadastrado para este curso neste período!',mtError,[mbOk],0);
        DBLCTurma.SetFocus;
      End
     Else
      Begin
        DBLCPlanos.KeyValue:=QPlanosPagto['plp_seq'];
        If (QCurso['cur_grapos'] = 4) or (QCurso['cur_grapos'] = 5) // mestrado e doutorado
        Then
         If QOfCur['ofc_dtvencimento'] = Null
         Then
          Begin
            MessageDlg('Data de vencimento da matrícula não foi definida para esta turma!',mtError,[mbOk],0);
            DBLCTurma.SetFocus;
          End;
      End;
   End;
end;

procedure TFInscrit.ppDetailBand1BeforePrint(Sender: TObject);
var estciv, cpf, municipio, estado, uf, email, telefones, munjur, ufjur, ramal, rua, bairro, cep:string;
    ordem, vdia, vmes, vano:word;
begin
  estciv:='';
  Case NULLToZero(QContrato['pes_estciv']) of
    1:estciv:='solteiro(a)';
    2:estciv:='casado(a)';
    3:estciv:='viuvo(a)';
    4:estciv:='divorciado(a)';
    5:estciv:='desquitado(a)';
  End;

  cpf:='';
  If NULLToZero2(QContrato['pes_cpf']) <> 0
  Then cpf:=Mascara_CPF(QContrato['pes_cpf']);

  rua:='';
  bairro:='';
  cep:='';
  municipio:='';
  estado:='';
  uf:='';
  telefones:='';
  If QContrato['ins_raend'] <> Null
  Then
   Begin
     QEndLocal.Close;
     QEndLocal.ParamByName('ra').AsFloat:=QContrato['ins_raend'];
     QEndLocal.Open;
     rua:=NULLToSpace(QEndLocal['end_locrua']);
     bairro:=NULLToSpace(QEndLocal['end_locbai']);
     cep:=NULLToSpace(QEndLocal['end_loccep']);
     If QEndLocal['loc_codigo'] <> Null
     Then
      Begin
        QAux.Close;
        QAux.RequestLive:=False;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from cep_local l, cep_estado e');
        QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
        QAux.ParamByName('codloc').AsInteger:=QEndLocal['loc_codigo'];
        QAux.Open;
        If not QAux.Eof
        Then
         Begin
           municipio:=NULLToSpace(QAux['loc_nome']);
           estado:=NULLToSpace(QAux['est_preposicao'])+' '+NULLToSpace(QAux['est_descr']);
           uf:=NULLToSpace(QAux['loc_uf']);
         End;
      End;
     If QEndLocal['end_locfone'] <> Null
     Then
      Begin
        telefones:=', fone '+QEndLocal['end_locfone'];
        If QContrato['pes_celular'] <> Null
        Then telefones:=telefones + ', e celular '+QContrato['pes_celular'];
      End
     Else
      If QContrato['pes_celular'] <> Null
      Then telefones:=', celular '+QContrato['pes_celular'];
   End
  Else
   Begin
     rua:=NULLToSpace(QContrato['pes_rua']);
     bairro:=NULLToSpace(QContrato['pes_bairro']);
     cep:=NULLToSpace(QContrato['pes_cep']);
     If QContrato['loc_codigo'] <> Null
     Then
      Begin
        QAux.Close;
        QAux.RequestLive:=False;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from cep_local l, cep_estado e');
        QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
        QAux.ParamByName('codloc').AsInteger:=QContrato['loc_codigo'];
        QAux.Open;
        If not QAux.Eof
        Then
         Begin
           municipio:=NULLToSpace(QAux['loc_nome']);
           estado:=NULLToSpace(QAux['est_preposicao'])+' '+NULLToSpace(QAux['est_descr']);
           uf:=NULLToSpace(QAux['loc_uf']);
         End;
      End;
     If QContrato['pes_telefone'] <> Null
     Then
      Begin
        telefones:=', fone '+QContrato['pes_telefone'];
        If QContrato['pes_celular'] <> Null
        Then telefones:=telefones + ', e celular '+QContrato['pes_celular'];
      End
     Else
      If QContrato['pes_celular'] <> Null
      Then telefones:=', celular '+QContrato['pes_celular'];
   End;

  email:='';
  If Qemail['eml_email'] <> Null
  Then email:=', e-mail '+Qemail['eml_email'];

  ppRichView2.RichView.Clear;
  ppRichView2.RichView.Style.TextStyles.Items[0].FontName:='Arial';
  ppRichView2.RichView.Style.TextStyles.Items[0].Size:=11;
  ppRichView2.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView2.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView2.RichView.Style.TextStyles.Items[1].FontName:='Arial';
  ppRichView2.RichView.Style.TextStyles.Items[1].Size:=11;
  ppRichView2.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView2.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

  ppRichView2.RichView.Style.TextStyles.Items[2].FontName:='Arial';
  ppRichView2.RichView.Style.TextStyles.Items[2].Size:=11;
  ppRichView2.RichView.Style.TextStyles.Items[2].Color:=clBlack;
  ppRichView2.RichView.Style.TextStyles.Items[2].Style:=[fsBold, fsUnderline];

  ppRichView2.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView2.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;
  ppRichView2.RichView.Style.ParaStyles.Items[0].FirstIndent:=0;

  ppRichView2.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView2.RichView.Style.ParaStyles.Items[1].LineSpacing:=100;
  ppRichView2.RichView.Style.ParaStyles.Items[1].FirstIndent:=0;
  ppRichView2.RichView.Style.ParaStyles.Items[1].LeftIndent:=20;

//  ppRichView2.RichView.Style.ParaStyles.Items[1].Alignment:=rvaLeft;
//  ppRichView2.RichView.Style.ParaStyles.Items[1].LineSpacing:=100;
//  ppRichView2.RichView.Style.ParaStyles.Items[1].FirstIndent:=120;

  ppRichView2.RichView.Style.ParaStyles.Items[2].Alignment:=rvaCenter;
  ppRichView2.RichView.Style.ParaStyles.Items[2].LineSpacing:=100;
  ppRichView2.RichView.Style.ParaStyles.Items[2].FirstIndent:=0;

  ppRichView2.RichView.AddNL('Pelo presente instrumento particular, as partes a seguir nomeadas, de comum acordo, celebram entre si ',0,0);
  ppRichView2.RichView.AddNL('CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS',1,-1);
  ppRichView2.RichView.AddNL(', de um lado a ',0,-1);
  ppRichView2.RichView.AddNL('ASSOCIAÇÃO PRUDENTINA DE EDUCAÇÃO E CULTURA - APEC',1,-1);
  ppRichView2.RichView.AddNL(', pessoa jurídica de direito privado, inscrita no CNPJ/MF sob nº 44.860.740/0001-73, ',0,-1);
  ppRichView2.RichView.AddNL('sediada na cidade de Presidente Prudente/SP à Rua José Bongiovani nº 700, cidade universitária, CEP 19050-900, ',0,-1);
  ppRichView2.RichView.AddNL('fone/fax (18) 3229-1000 ramal 1010, neste ato representado legalmente por seu Diretor Geral, ',0,-1);
  ppRichView2.RichView.AddNL('AUGUSTO CESAR DE OLIVEIRA LIMA, CPF 778.941.548-49',1,-1);
  ppRichView2.RichView.AddNL(', doravante denominada de ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE',1,-1);

  ppRichView2.RichView.AddNL(', e, de outro lado, ',0,-1);
  ppRichView2.RichView.AddNL(QContrato['pes_nome'],1,-1);
  ppRichView2.RichView.AddNL(', '+LowerCase(NULLToSpace(QContrato['nac_descmasc']))+'(a), '+estciv+', '+NULLToSpace(QContrato['ins_profissao']),0,-1);
  ppRichView2.RichView.AddNL(', inscrito(a) regularmente no CPF/MF sob nº '+cpf+', portador(a) do RG/SSP-'+NULLToSpace(QContrato['pes_estexp'])+' de nº '+NULLToSpace(QContrato['pes_rg']),0,-1);
  ppRichView2.RichView.AddNL(', residente e domiciliado(a) à '+rua+', '+bairro+', município de '+municipio,0,-1);
  ppRichView2.RichView.AddNL(', Estado '+estado+', CEP '+cep+email+telefones,0,-1);
  ppRichView2.RichView.AddNL(', doravante denominado ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A)',1,-1);
  ppRichView2.RichView.AddNL(', o qual reger-se-á pelas cláusulas e condições abaixo:',0,-1);

  LContratado.Caption:=QContrato['pes_nome'];

  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA PRIMEIRA',2,0);
  ppRichView2.RichView.AddNL('Pelo presente instrumento, a ',0,0);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('obriga-se a ministrar o curso denominado ',0,-1);
  ppRichView2.RichView.AddNL(NULLToSpace(QCurso['cur_programa']),1,-1);
  ppRichView2.RichView.AddNL(' através de aulas e demais atividade curriculares, elaborado em conformidade com a legislação em vigor ao ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('de acordo com o plano de ensino para o período compreendido entre o mês de '+Mes[vmesini]+' de '+IntToStr(vanoini)+' e o mês de '+Mes[vmesfim],0,-1);
  ppRichView2.RichView.AddNL(' de '+IntToStr(vanofim)+', em regime de semestralidade letiva, pelo que o presente contrato vincula as partes para o',0,-1);
  If vmesini <= 6
  Then ppRichView2.RichView.AddNL(' 1º semestre de '+IntToStr(vanoini),0,-1)
  Else ppRichView2.RichView.AddNL(' 2º semestre de '+IntToStr(vanoini),0,-1);
  ppRichView2.RichView.AddNL(', dependendo os demais períodos de rematrícula mediante aditivo contratual.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView2.RichView.AddNL('O CONTRATANTE fica devidamente cientificado que a prestação dos serviços educacionais é contratada por semestre letivo e que a rematrícula, ',0,-1);
  ppRichView2.RichView.AddNL('a cada semestre, é ato indispensável que estabelece o vínculo de aluno com a Instituição de Ensino.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo segundo - ',1,0);
//  ppRichView2.RichView.AddNL('O não pagamento de qualquer das mensalidades na data de vencimento implicará na imediata e automática constituição do CONTRATANTE em mora, ',0,-1);
//  ppRichView2.RichView.AddNL('independentemente de interpelação judicial ou extrajudicial para tal fim, ficando facultado à CONTRATADA não renovar a matrícula do aluno em débito, ',0,-1);
//  ppRichView2.RichView.AddNL('nos termos do artigo 5º, da lei 9.870/1999.',0,-1);
  ppRichView2.RichView.AddNL('O não pagamento de qualquer das mensalidades na data de vencimento implicará no imediato e automático cancelamento de qualquer desconto que o CONTRATANTE tenha ou venha a ter, ',0,-1);
  ppRichView2.RichView.AddNL('também implicará na constituição do CONTRATANTE em mora, independentemente de interpelação judicial ou extrajudicial para tal fim, ficando facultado à CONTRATADA não renovar a matrícula do aluno em débito, ',0,-1);
  ppRichView2.RichView.AddNL('nos termos do artigo 5º, da lei 9.870/1999.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView2.RichView.AddNL('A rematrícula não será realizada se houver dívidas do CONTRATANTE perante a CONTRATADA, ainda que seja proveniente de contrato anterior, ',0,-1);
  ppRichView2.RichView.AddNL('ou mesmo de débito extracontratual.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA SEGUNDA',2,0);
  ppRichView2.RichView.AddNL('As aulas serão ministradas, regularmente, nas dependências da ',0,0);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('ou em outros locais pela mesma indicada, em dias e horários a serem estipulados.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA TERCEIRA',2,0);
  ppRichView2.RichView.AddNL('A matrícula do ',0,0);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('formaliza-se-á junto à ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE',1,-1);
  ppRichView2.RichView.AddNL(', após a entrega do presente instrumento devidamente assinado e da FICHA DE INSCRIÇÃO DO CANDIDATO, que fica, desde logo, fazendo parte integrante do presente, ',0,-1);
  ppRichView2.RichView.AddNL('além dos documentos abaixo relacionados que deverão ser apresentados no original para autenticação presencial da cópia, ',0,-1);
  ppRichView2.RichView.AddNL('dependendo ainda da análise do currículo do mesmo, e, efetiva-se pelo pagamento da primeira mensalidade, conforme cláusula sexta e, observando-se o prazo de inscrição.',0,-1);
  ppRichView2.RichView.AddNL('a) Currículo',0,1);
  ppRichView2.RichView.AddNL('b) Certificado de Curso Superior',0,1);
  ppRichView2.RichView.AddNL('c) Histórico Escolar do Curso Superior',0,1);
  ppRichView2.RichView.AddNL('d) CPF',0,1);
  ppRichView2.RichView.AddNL('e) RG',0,1);
  ppRichView2.RichView.AddNL('f) 1 foto 3x4',0,1);
  ppRichView2.RichView.AddNL('g) Comprovante de Residência',0,1);
  ppRichView2.RichView.AddNL('h) Cópia da carteira do conselho de classe (no caso de cursos destinados às categorias específicas este documento é exigido).',0,1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView2.RichView.AddNL('A falta do preenchimento de qualquer dos requisitos contidos no presente contrato isenta a ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('de qualquer vinculação com o ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A);',1,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView2.RichView.AddNL('A tolerância de atraso na entrega da documentação exigida não implica na dispensa da mesma, ',0,-1);
  ppRichView2.RichView.AddNL('ficando o Aluno desde já ciente de que a apresentação da documentação exigida é pressuposto para obtenção  do certificado da pós -graduação.',1,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView2.RichView.AddNL('O ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('contratante declara que se responsabiliza, sob as penas da lei, pela autenticidade e veracidade dos documentos especificados nesta cláusula, ',0,-1);
  ppRichView2.RichView.AddNL('que foram por ele entregues À ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE.',1,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA QUARTA',2,0);
  ppRichView2.RichView.AddNL('É de inteira responsabilidade da ',0,0);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('o planejamento e a prestação dos serviços de ensino, fixação do currículo, com a respectiva carga horária, designação de professores, orientação didática, ',0,-1);
  ppRichView2.RichView.AddNL('bem como determinação de datas para provas de aproveitamento, além de outras providências que as atividades docentes e discentes exigirem, ',0,-1);
  ppRichView2.RichView.AddNL('a exclusivo critério da mesma, tudo de acordo com a legislação vigente, sem qualquer ingerência do ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A).',1,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView2.RichView.AddNL('As aulas serão ministradas nas salas de aula ou locais indicados pela CONTRATADA, tendo em vista a natureza do conteúdo e da técnica pedagógica pertinente.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView2.RichView.AddNL('O CONTRATANTE SE DECLARA CIENTE E NESTE ATO MANIFESTA SEU ACEITE, QUE AS DISCIPLINAS INTEGRANTES DA GRADE CURRICULAR DO CURSO CONTRATADO ',0,-1);
  ppRichView2.RichView.AddNL('PODERÃO SER OFERTADAS NA MODALIDADE SEMIPRESENCIAL, COM BASE NO ARTIGO 81, DA LEI 9.394/96 C/C A PORTARIA MEC N. 4.059/2004, E NOS LIMITES DESTA.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView2.RichView.AddNL('A ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('poderá promover o agrupamento de turmas, alteração de horário de aulas e do calendário acadêmico, assim como outras medidas julgadas necessárias, ',0,-1);
  ppRichView2.RichView.AddNL('sem entretanto, ferir as disposições legais pertinentes.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA QUINTA',2,0);
  ppRichView2.RichView.AddNL('O ',0,0);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('declara conhecer e obriga-se a acolher o Regimento Interno da Unoeste, as Normas Financeiras, O Regulamento da Pós-Graduação e demais obrigações ',0,-1);
  ppRichView2.RichView.AddNL('constantes na legislação aplicável à área de ensino superior e, ainda, as emanadas de outras fontes legais, desde que regulem supletivamente a matéria, ',0,-1);
  ppRichView2.RichView.AddNL('bem como eventuais decisões da ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('inerentes à espécie, as quais se integram reciprocamente.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA SEXTA',2,0);
  ppRichView2.RichView.AddNL('A presente contratação implica disponibilização dos serviços ao ',0,0);
  ppRichView2.RichView.AddNL('ALUNO(A)',1,-1);
  ppRichView2.RichView.AddNL(', obrigando-se ao pagamento da totalidade da mesma. Pelos serviços a serem prestados, o ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('obriga-se a pagar o valor abaixo indicado, de acordo com o curso em que está matriculado, da forma a seguir especificada:',0,-1);
  ppRichView2.RichView.AddNL('               curso: ',0,0);
  ppRichView2.RichView.AddNL(NULLToSpace(QCurso['cur_programa']),1,-1);
  ppRichView2.RichView.AddNL('               valor do contrato: ',0,0);
  ppRichView2.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrtotal']),1,-1);
  ppRichView2.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrtotal'])+').',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView2.RichView.AddNL('O valor acima indicado será pago em ',0,-1);
  If QPlanosPagto['plp_nparcelas'] = 1
  Then
   Begin
     ppRichView2.RichView.AddNL('01 (UMA) parcela única, no valor de ',0,-1);
     ppRichView2.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela']),1,-1);
     ppRichView2.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrparcela'])+').',0,-1);
   End
  Else
   If QPlanosPagto['plp_vrmatricula'] = QPlanosPagto['plp_vrparcela']
   Then
    Begin
      ppRichView2.RichView.AddNL(StrZero(QPlanosPagto['plp_nparcelas'],2),1,-1);
      ppRichView2.RichView.AddNL(' ('+Trim(Exts(QPlanosPagto['plp_nparcelas']))+') parcelas mensais, iguais e sucessivas, vincendas todo dia ',0,-1);
      ppRichView2.RichView.AddNL(StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês calendário, no valor de ',0,-1);
      ppRichView2.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela']),1,-1);
      ppRichView2.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.',0,-1);
    End
   Else
    Begin
      ppRichView2.RichView.AddNL('01 (UMA) parcela no valor de ',0,-1);
      ppRichView2.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrmatricula']),1,-1);
      ppRichView2.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrmatricula'])+') referente a matrícula, e ',0,-1);
      ppRichView2.RichView.AddNL(StrZero(QPlanosPagto['plp_nparcelas'] - 1,2),1,-1);
      ppRichView2.RichView.AddNL(' ('+Trim(Exts(QPlanosPagto['plp_nparcelas'] - 1))+') parcelas mensais, iguais e sucessivas, vincendas todo dia ',0,-1);
      ppRichView2.RichView.AddNL(StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês calendário, no valor de ',0,-1);
      ppRichView2.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela']),1,-1);
      ppRichView2.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.',0,-1);
    End;
    
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView2.RichView.AddNL('Quaisquer pagamentos vinculados ao presente instrumento efetuados em cheque apenas serão considerados quitados após sua efetiva compensação, ',0,-1);
  ppRichView2.RichView.AddNL('ainda que tal condição não conste do recibo, eis que recebidos em caráter ',0,-1);
  ppRichView2.RichView.AddNL('pro solvendo.',1,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView2.RichView.AddNL('Na hipótese de a ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('aceitar, a seu exclusivo critério, pagamentos antecipados, estes não quitarão eventuais acréscimos que venham a ser posteriormente apurados, ',0,-1);
  ppRichView2.RichView.AddNL('desde que legalmente aplicáveis.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView2.RichView.AddNL('O pagamento integral e antecipado do valor ora estipulado concederá ao ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('um desconto equivalente a 5% (cinco por cento). Tal pagamento, entretanto, não implicará de nenhuma forma quitação de eventuais acréscimos ',0,-1);
  ppRichView2.RichView.AddNL('que venham a ser posteriormente apurados, nos termos da legislação pertinente.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo quinto - ',1,0);
  ppRichView2.RichView.AddNL('A quitação de parcela posterior não implica a quitação das anteriores.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo sexto - ',1,0);
  ppRichView2.RichView.AddNL('Havendo cheques que não tenham sido regularmente compensados, apenas poderá ser efetuada a quitação destes, bem como o pagamento subseqüente, ',0,-1);
  ppRichView2.RichView.AddNL('em dinheiro (espécie) ou cheque administrativo.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo sétimo - ',1,0);
  ppRichView2.RichView.AddNL('Eventuais ajustes referentes a descontos ou acréscimos no preço contratado em razão de, exemplificativamente, bolsas, abonos, serão efetuados, ',0,-1);
  ppRichView2.RichView.AddNL('em conformidade com o presente, dentro do período letivo correspondente.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo oitavo - ',1,0);
  ppRichView2.RichView.AddNL('Não será considerado ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('aquele cuja matrícula não houver sido efetuada em conformidade com o presente contrato, o que leva a inexistência de relação de ensino entre as partes, ',0,-1);
  ppRichView2.RichView.AddNL('sendo vedado ao mesmo assistir aula e/ou frequentar as dependências da ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE.',1,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA SÉTIMA',2,0);
  ppRichView2.RichView.AddNL('As partes declaram que os valores acima indicados foram calculados de acordo com a atual situação econômica vigente no país, ',0,0);
  ppRichView2.RichView.AddNL('representando o equilíbrio econômico entre as partes. Assim, a fim de manter tal equilíbrio, e desde que legalmente permitido, ',0,-1);
  ppRichView2.RichView.AddNL('os valores das parcelas mensais poderão ser alterados no caso de comprovado aumento de custos e/ou redução das receitas da ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE.',1,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA OITAVA',2,0);
  ppRichView2.RichView.AddNL('Os valores previstos nas cláusulas anteriores incluem, exclusivamente, a prestação de serviços decorrentes do currículo acadêmico regular. ',0,0);
  ppRichView2.RichView.AddNL('Todas as demais atividades prestadas pela ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('serão cobradas à parte, inclusive disciplinas de dependência e/ou adaptação, materiais utilizados nos cursos e outros, ',0,-1);
  ppRichView2.RichView.AddNL('ainda que destinados a trabalhos de conclusão de curso. As atividades extracurriculares também terão seu valor fixado à parte pela ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE',1,-1);
  ppRichView2.RichView.AddNL(', sendo certo que não terão caráter obrigatório.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA NONA',2,0);
  ppRichView2.RichView.AddNL('O vencimento da mensalidade dar-se-á no dia '+StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês.',0,0);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView2.RichView.AddNL('Na hipótese de atraso do pagamento, o valor devido será acrescido de 2% (dois por cento) de multa.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView2.RichView.AddNL('Na hipótese de atraso no pagamento superior a 30 (trinta) dias, o débito, acrescido da multa de 2% supra referida, ',0,-1);
  ppRichView2.RichView.AddNL('será corrigido monetariamente de acordo com o índice de variação do IGP-M/FGV, ',0,-1);
  ppRichView2.RichView.AddNL('e o total acrescido de juros de mora à razão de 0,07% (zero vírgula zero sete por cento) para cada dia de atraso, até o dia do efetivo pagamento.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView2.RichView.AddNL('O ALUNO(A) fica obrigado, após o pagamento da matricula, a emitir o boleto da mensalidade pelo Sistema Acadêmico ou deverá efetuar o referido pagamento junto à Tesouraria da ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE',1,-1);
  ppRichView2.RichView.AddNL(', ou em local por ela indicado, não se considerando a falta de recebimento do boleto como escusa pela mora no adimplemento da obrigação.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView2.RichView.AddNL('Em caso de inadimplência, a ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('poderá optar:',0,-1);
  ppRichView2.RichView.AddNL('a) pela rescisão contratual, independente da exigibilidade do débito vencido e do devido no mês da efetivação;',0,1);
  ppRichView2.RichView.AddNL('b) pela emissão de Letra de Câmbio, a ser sacada contra o ',0,1);
  ppRichView2.RichView.AddNL('ALUNO(A)',1,-1);
  ppRichView2.RichView.AddNL(', pelo valor da(s) parcela(s) vencida(s) acrescida(s) das penalidades acima estabelecidas;',0,-1);
  ppRichView2.RichView.AddNL('c) a falta do pagamento de duas parcelas, consecutivas ou não, autoriza a ',0,1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('a inscrever o ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A)',1,-1);
  ppRichView2.RichView.AddNL(', como inadimplente, em cadastros de proteção ao crédito.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo quinto - ',1,0);
  ppRichView2.RichView.AddNL('Na hipótese de a ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL(' ser obrigada a efetuar cobrança de seus créditos, o devedor ',0,-1);
  ppRichView2.RichView.AddNL('ficará sujeito ao pagamento de honorários de advogado, a razão de 10% (dez por cento), se extrajudicial, e 20% (vinte por cento), se judicial.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo sexto - ',1,0);
  ppRichView2.RichView.AddNL('A ausência do ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('às aulas, seja por que motivo for,  não o isentará do pagamento das mensalidades e tampouco dar-lhe-á direito à restituição das parcelas pagas.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA DÉCIMA',2,0);
  ppRichView2.RichView.AddNL('O presente contrato vincula as partes para o período mencionado na cláusula primeira, e poderá ser rescindido nas seguintes hipóteses:',0,0);
  ppRichView2.RichView.AddNL('a) pelo ',0,1);
  ppRichView2.RichView.AddNL('ALUNO(A)',1,-1);
  ppRichView2.RichView.AddNL(', por desistência formal;',0,-1);
  ppRichView2.RichView.AddNL('b) pela ',0,1);
  ppRichView2.RichView.AddNL('UNOESTE;',1,-1);
  ppRichView2.RichView.AddNL('c) por desligamento nos termos do Regimento Escolar;',0,1);
  ppRichView2.RichView.AddNL('d) por inadimplência, desde que legalmente permitido.',0,1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView2.RichView.AddNL('É facultado a ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('a rescisão do presente instrumento por insuficiência de alunos matriculados, até a data de início do curso, hipótese em que será restituído ao ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('a integra do valor por ele pago.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView2.RichView.AddNL('Caso o ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('venha a rescindir o contrato entre 30 e 180 dias a partir da data de assinatura do contrato, ',0,-1);
  ppRichView2.RichView.AddNL('pagará o valor da mensalidade do mês corrente (mês que o aluno vier a solicitar o cancelamento) e, a fim de manter o equilíbrio econômico e financeiro da ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE',1,-1);
  ppRichView2.RichView.AddNL(', será aplicada multa contratual no valor de 10% (dez por cento) calculado sobre o valor total do contrato.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView2.RichView.AddNL('Caso o ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('venha a rescindir este instrumento após o prazo de seis meses da data de assinatura do contrato, ',0,-1);
  ppRichView2.RichView.AddNL('pagará o valor da mensalidade do mês corrente (mês em que o aluno vier a solicitar o cancelamento).',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView2.RichView.AddNL('O ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('que, antes do início das aulas requerer desistência ou cancelamento da matrícula, ',0,-1);
  ppRichView2.RichView.AddNL('receberá a devolução de 70% (setenta por cento) do valor pago, no prazo de 30 (trinta) dias após a formalização do respectivo pedido junto à Secretaria da Pós-Graduação.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo quinto - ',1,0);
  ppRichView2.RichView.AddNL('Após o início das aulas, são devidas as mensalidades que vencerem-se até o mês em que for requerido o cancelamento, ',0,-1);
  ppRichView2.RichView.AddNL('uma vez que os serviços ficam disponibilizados ao aluno.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo sexto - ',1,0);
  ppRichView2.RichView.AddNL('O cancelamento deverá ser sempre requerido formalmente junto à Secretaria da Pós-Graduação da ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE',1,-1);
  ppRichView2.RichView.AddNL(', sob pena de manterem-se as obrigações do aluno, especialmente as referentes ao pagamento do valor ora contratado.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo sétimo - ',1,0);
  ppRichView2.RichView.AddNL('Serão pagos emolumentos para a expedição de:',0,-1);
  ppRichView2.RichView.AddNL('a) cópia de documentos',0,1);
  ppRichView2.RichView.AddNL('b) atestados',0,1);
  ppRichView2.RichView.AddNL('c) declarações',0,1);
  ppRichView2.RichView.AddNL('d) certidões',0,1);
  ppRichView2.RichView.AddNL('e) segunda via do boleto de cobrança',0,1);
  ppRichView2.RichView.AddNL('f) 2ª via de documentos ou carteirinha de estudante.',0,1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo oitavo - ',1,0);
  ppRichView2.RichView.AddNL('Para a expedição de qualquer desses documentos enumerados no parágrafo anterior, o ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('deverá apresentar o comprovante de pagamento do respectivo emolumento.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA DÉCIMA-PRIMEIRA',2,0);
  ppRichView2.RichView.AddNL('O ',0,0);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('deverá tratar com urbanidade e polidez a todos (colegas, professores, funcionários, etc.), bem como acatar, cumprir todas as instruções, disposições, ',0,-1);
  ppRichView2.RichView.AddNL('recomendações e avisos acerca do uso e manuseio de máquinas, ferramentas, aparelhos e instrumentos nas oficinas, laboratórios, estúdios e demais estruturas oferecidas pela ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('no horário escolar e fora dele.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('Parágrafo único - ',1,0);
  ppRichView2.RichView.AddNL('O descumprimento do disposto na cláusula supra, implicará na exclusiva responsabilidade civil e penal ao ',0,-1);
  ppRichView2.RichView.AddNL('ALUNO(A)',1,-1);
  ppRichView2.RichView.AddNL(', bem como a exclusão e a isenção de quaisquer responsabilidade da ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE',1,-1);
  ppRichView2.RichView.AddNL(', seus diretores, professores, funcionários e prepostos em geral.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA DÉCIMA-SEGUNDA',2,0);
  ppRichView2.RichView.AddNL('O ',0,0);
  ppRichView2.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView2.RichView.AddNL('declara sob as penas da lei estarem corretos os dados cadastrais retro, obrigando-se a comunicar à ',0,-1);
  ppRichView2.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView2.RichView.AddNL('qualquer alteração em até, no máximo, 30 dias da mesma.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA DÉCIMA-TERCEIRA',2,0);
  ppRichView2.RichView.AddNL('Quaisquer alterações dos termos e condições do presente contrato deverão ser objeto de termos aditivos, ',0,0);
  ppRichView2.RichView.AddNL('que dele ficarão fazendo parte integrante para todos os efeitos e direitos, por comum acordo dos partícipes.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('CLÁUSULA DÉCIMA-QUARTA',2,0);
  ppRichView2.RichView.AddNL('Para dirimir as dúvidas e controvérsias decorrentes dessa parceria, que não puderem ser resolvidas amigavelmente pelas partes, ',0,0);
  ppRichView2.RichView.AddNL('fica eleito o foro cível da Comarca de Presidente Prudente, Estado de São Paulo, com renúncia de qualquer outro, por mais privilegiado que seja.',0,-1);
  ppRichView2.RichView.AddNL(' ',0,0);
  ppRichView2.RichView.AddNL('E, por estarem assim justas e acordadas, as partes firmam o presente Contrato de Prestação de Serviços Educacionais em duas (02) vias de igual teor e idêntico valor jurídico, ',0,0);
  ppRichView2.RichView.AddNL('que depois lido e achado conforme, vai assinado pelas partes convenentes e pelas testemunhas abaixo qualificadas, para que se produza seus efeitos legais.',0,-1);

  LContrato2.Caption:='Nº Contrato : '+StrZero(QContr['con_seq'],4);
  DecodeDate(QContr['con_data'],vano,vmes,vdia);
  LCidade2.Caption:='Presidente  Prudente(SP),  '+StrZero(vdia,2)+'  de  '+Trata_Texto(Mes[vmes])+'  de  '+IntToStr(vano)+'.';
  ppRichView2.RichView.Format;

  Texto:=TStringList.Create;
  Texto.Clear;

  Texto.Add('CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS');
  Texto.Add(LCurso2.Caption);
  Texto.Add(LPeriodo2.Caption);
  Texto.Add(LContrato2.Caption);
  Texto.Add('');
  Texto.Add('Pelo presente instrumento particular, as partes a seguir nomeadas, de comum acordo, celebram entre si CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS'+
            ', de um lado a ASSOCIAÇÃO PRUDENTINA DE EDUCAÇÃO E CULTURA - APEC, pessoa jurídica de direito privado, inscrita no CNPJ/MF sob nº 44.860.740/0001-73, '+
            'sediada na cidade de Presidente Prudente/SP à Rua José Bongiovani nº 700, cidade universitária, CEP 19050-900, fone/fax (18) 3229-1000 ramal 1010, '+
            'neste ato representado legalmente por seu Diretor Geral, AUGUSTO CESAR DE OLIVEIRA LIMA, CPF 778.941.548-49, doravante denominada de '+
            'UNOESTE, e, de outro lado, '+QContrato['pes_nome']+', '+LowerCase(NULLToSpace(QContrato['nac_descmasc']))+'(a), '+estciv+', '+NULLToSpace(QContrato['ins_profissao'])+
            ', inscrito(a) regularmente no CPF/MF sob nº '+cpf+', portador(a) do RG/SSP-'+NULLToSpace(QContrato['pes_estexp'])+' de nº '+NULLToSpace(QContrato['pes_rg'])+', residente e domiciliado(a) à '+rua+', '+bairro+', município de '+municipio+
            ', Estado '+estado+', CEP '+cep+email+telefones+', doravante denominado ALUNO(A), o qual reger-se-á pelas cláusulas e condições abaixo:');
  Texto.Add('');
  Texto.Add('CLÁUSULA PRIMEIRA');
  If vmesini <= 6
  Then Texto.Add('Pelo presente instrumento, a UNOESTE obriga-se a ministrar o curso denominado '+NULLToSpace(QCurso['cur_programa'])+' através de aulas e demais atividade curriculares, elaborado em conformidade com a legislação em vigor ao '+
                 'ALUNO(A) de acordo com o plano de ensino para o período compreendido entre o mês de '+Mes[vmesini]+' de '+IntToStr(vanoini)+' e o mês de '+Mes[vmesfim]+' de '+IntToStr(vanofim)+', em regime de semestralidade letiva, '+
                 'pelo que o presente contrato vincula as partes para o 1º semestre de '+IntToStr(vanoini)+', dependendo os demais períodos de rematrícula mediante aditivo contratual.')
  Else Texto.Add('Pelo presente instrumento, a UNOESTE obriga-se a ministrar o curso denominado '+NULLToSpace(QCurso['cur_programa'])+' através de aulas e demais atividade curriculares, elaborado de conformidade com a legislação em vigor ao '+
                 'ALUNO(A) de acordo com o plano de ensino para o período compreendido entre o mês de '+Mes[vmesini]+' de '+IntToStr(vanoini)+' e o mês de '+Mes[vmesfim]+' de '+IntToStr(vanofim)+', em regime de semestralidade letiva, '+
                 'pelo que o presente contrato vincula as partes para o 2º semestre de '+IntToStr(vanoini)+', dependendo os demais períodos de rematrícula mediante aditivo contratual.');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - O CONTRATANTE fica devidamente cientificado que a prestação dos serviços educacionais é contratada por semestre letivo e que a rematrícula, a cada semestre, '+
            'é ato indispensável que estabelece o vínculo de aluno com a Instituição de Ensino.');
  Texto.Add('');
//  Texto.Add('Parágrafo segundo - O não pagamento de qualquer das mensalidades na data de vencimento implicará na imediata e automática constituição do CONTRATANTE em mora, independentemente de interpelação judicial ou extrajudicial para tal fim, '+
//            'ficando facultado à CONTRATADA não renovar a matrícula do aluno em débito, nos termos do artigo 5º, da lei 9.870/1999.');
  Texto.Add('Parágrafo segundo - O não pagamento de qualquer das mensalidades na data de vencimento implicará no imediato e automático cancelamento de qualquer desconto que o CONTRATANTE tenha ou venha a ter, '+
            'também implicará na constituição do CONTRATANTE em mora, independentemente de interpelação judicial ou extrajudicial para tal fim, '+
            'ficando facultado à CONTRATADA não renovar a matrícula do aluno em débito, nos termos do artigo 5º, da lei 9.870/1999.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - A rematrícula não será realizada se houver dívidas do CONTRATANTE perante a CONTRATADA, ainda que seja proveniente de contrato anterior, ou mesmo de débito extracontratual.');
  Texto.Add('');
  Texto.Add('CLÁUSULA SEGUNDA');
  Texto.Add('As aulas serão ministradas, regularmente, nas dependências da UNOESTE ou em outros locais pela mesma indicada, em dias e horários a serem estipulados.');
  Texto.Add('');
  Texto.Add('CLÁUSULA TERCEIRA');
  Texto.Add('A matrícula do ALUNO(A) formaliza-se-á junto à UNOESTE, após a entrega do presente instrumento devidamente assinado e da FICHA DE INSCRIÇÃO DO CANDIDATO, que fica, desde logo, fazendo parte integrante do presente, '+
            'além dos documentos abaixo relacionados que deverão ser apresentados no original para autenticação presencial da cópia, dependendo ainda da análise do currículo do mesmo, e, '+
            'efetiva-se pelo pagamento da primeira mensalidade, conforme cláusula sexta e, observando-se o prazo de inscrição.');
  Texto.Add('a) Currículo');
  Texto.Add('b) Certificado de Curso Superior');
  Texto.Add('c) Histórico Escolar do Curso Superior');
  Texto.Add('d) CPF');
  Texto.Add('e) RG');
  Texto.Add('f) 1 foto 3x4');
  Texto.Add('g) Comprovante de Residência');
  Texto.Add('h) Cópia da carteira do conselho de classe (no caso de cursos destinados às categorias específicas este documento é exigido).');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - A falta do preenchimento de qualquer dos requisitos contidos no presente contrato isenta a UNOESTE de qualquer vinculação com o ALUNO(A).');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - A tolerância de atraso na entrega da documentação exigida não implica na dispensa da mesma, ficando o ALUNO desde já ciente de que a apresentação da documentação exigida é pressuposto para obtenção do certificado da pós-graduação.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - O ALUNO(A) contratante declara que se responsabiliza, sob as penas da lei, pela autenticidade e veracidade dos documentos especificados nesta cláusula, que foram por ele entregues À UNOESTE.');
  Texto.Add('');
  Texto.Add('CLÁUSULA QUARTA');
  Texto.Add('É de inteira responsabilidade da UNOESTE o planejamento e a prestação dos serviços de ensino, fixação do currículo, com a respectiva carga horária, designação de professores, orientação didática, '+
            'bem como determinação de datas para provas de aproveitamento, além de outras providências que as atividades docentes e discentes exigirem, a exclusivo critério da mesma, tudo de acordo com a legislação vigente, sem qualquer ingerência do ALUNO(A).');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - As aulas serão ministradas nas salas de aula ou locais indicados pela CONTRATADA, tendo em vista a natureza do conteúdo e da técnica pedagógica pertinente.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - O CONTRATANTE SE DECLARA CIENTE E NESTE ATO MANIFESTA SEU ACEITE, QUE AS DISCIPLINAS INTEGRANTES DA GRADE CURRICULAR DO CURSO CONTRATADO '+
            'PODERÃO SER OFERTADAS NA MODALIDADE SEMIPRESENCIAL, COM BASE NO ARTIGO 81, DA LEI 9.394/96 C/C A PORTARIA MEC N. 4.059/2004, E NOS LIMITES DESTA.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - A UNOESTE poderá promover o agrupamento de turmas, alteração de horário de aulas e do calendário acadêmico, assim como outras medidas julgadas necessárias, sem entretanto, ferir as disposições legais pertinentes.');
  Texto.Add('');
  Texto.Add('CLÁUSULA QUINTA');
  Texto.Add('O ALUNO(A) declara conhecer e obriga-se a acolher o Regimento Interno da Unoeste, as Normas Financeiras, O Regulamento da Pós-Graduação e demais obrigações constantes na legislação aplicável à área de ensino superior e, '+
            'ainda, as emanadas de outras fontes legais, desde que regulem supletivamente a matéria, bem como eventuais decisões da UNOESTE inerentes à espécie, as quais se integram reciprocamente.');
  Texto.Add('');
  Texto.Add('CLÁUSULA SEXTA');
  Texto.Add('A presente contratação implica disponibilização dos serviços ao ALUNO(A), obrigando-se ao pagamento da totalidade da mesma. Pelos serviços a serem prestados, '+
            'o ALUNO(A) obriga-se a pagar o valor abaixo indicado, de acordo com o curso em que está matriculado, da forma a seguir especificada:');
  Texto.Add('               curso: '+NULLToSpace(QCurso['cur_programa']));
  Texto.Add('               valor do contrato: R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrtotal'])+' ('+Extenso(QPlanosPagto['plp_vrtotal'])+').');
  Texto.Add('');
  If QPlanosPagto['plp_nparcelas'] = 1
  Then Texto.Add('Parágrafo primeiro - O valor acima indicado será pago em 01 (UMA) parcela única, no valor de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+' ('+Extenso(QPlanosPagto['plp_vrparcela'])+').')
  Else
   If QPlanosPagto['plp_vrmatricula'] = QPlanosPagto['plp_vrparcela']
   Then
    Begin
      Texto.Add('Parágrafo primeiro - O valor acima indicado será pago em '+StrZero(QPlanosPagto['plp_nparcelas'],2)+' ('+Trim(Exts(QPlanosPagto['plp_nparcelas']))+') parcelas mensais, iguais e sucessivas, vincendas todo dia '+
                StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês calendário, no valor de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.');
    End
   Else
    Begin
      Texto.Add('Parágrafo primeiro - O valor acima indicado será pago em 01 (UMA) parcela no valor de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrmatricula'])+' ('+Extenso(QPlanosPagto['plp_vrmatricula'])+') referente a matrícula, e '+
                StrZero(QPlanosPagto['plp_nparcelas'] - 1,2)+' ('+Trim(Exts(QPlanosPagto['plp_nparcelas'] - 1))+') parcelas mensais, iguais e sucessivas, vincendas todo dia '+StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês calendário, no valor de '+
                'R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.');
    End;

  Texto.Add('');
  Texto.Add('Parágrafo segundo - Quaisquer pagamentos vinculados ao presente instrumento efetuados em cheque apenas serão considerados quitados após sua efetiva compensação, ainda que tal condição não conste do recibo, eis que recebidos em caráter pro solvendo.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - Na hipótese de a UNOESTE aceitar, a seu exclusivo critério, pagamentos antecipados, estes não quitarão eventuais acréscimos que venham a ser posteriormente apurados, desde que legalmente aplicáveis.');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - O pagamento integral e antecipado do valor ora estipulado concederá ao ALUNO(A) um desconto equivalente a 5% (cinco por cento). Tal pagamento, entretanto, não implicará de nenhuma forma quitação de eventuais acréscimos '+
            'que venham a ser posteriormente apurados, nos termos da legislação pertinente.');
  Texto.Add('');
  Texto.Add('Parágrafo quinto - A quitação de parcela posterior não implica a quitação das anteriores.');
  Texto.Add('');
  Texto.Add('Parágrafo sexto - Havendo cheques que não tenham sido regularmente compensados, apenas poderá ser efetuada a quitação destes, bem como o pagamento subseqüente, em dinheiro (espécie) ou cheque administrativo.');
  Texto.Add('');
  Texto.Add('Parágrafo sétimo - Eventuais ajustes referentes a descontos ou acréscimos no preço contratado em razão de, exemplificativamente, bolsas, abonos, serão efetuados, em conformidade com o presente, dentro do período letivo correspondente.');
  Texto.Add('');
  Texto.Add('Parágrafo oitavo - Não será considerado ALUNO(A) aquele cuja matrícula não houver sido efetuada em conformidade com o presente contrato, o que leva a inexistência de relação de ensino entre as partes, '+
            'sendo vedado ao mesmo assistir aula e/ou frequentar as dependências da UNOESTE.');
  Texto.Add('');
  Texto.Add('CLÁUSULA SÉTIMA');
  Texto.Add('As partes declaram que os valores acima indicados foram calculados de acordo com a atual situação econômica vigente no país, representando o equilíbrio econômico entre as partes. Assim, a fim de manter tal equilíbrio, e desde que legalmente permitido, '+
            'os valores das parcelas mensais poderão ser alterados no caso de comprovado aumento de custos e/ou redução das receitas da UNOESTE.');
  Texto.Add('');
  Texto.Add('CLÁUSULA OITAVA');
  Texto.Add('Os valores previstos nas cláusulas anteriores incluem, exclusivamente, a prestação de serviços decorrentes do currículo acadêmico regular. Todas as demais atividades prestadas pela UNOESTE serão cobradas à parte, '+
            'inclusive disciplinas de dependência e/ou adaptação, materiais utilizados nos cursos e outros, ainda que destinados a trabalhos de conclusão de curso. As atividades extracurriculares também terão seu valor fixado à parte pela '+
            'UNOESTE, sendo certo que não terão caráter obrigatório.');
  Texto.Add('');
  Texto.Add('CLÁUSULA NONA');
  Texto.Add('O vencimento da mensalidade dar-se-á no dia '+StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês.');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - Na hipótese de atraso do pagamento, o valor devido será acrescido de 2% (dois por cento) de multa.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - Na hipótese de atraso no pagamento superior a 30 (trinta) dias, o débito, acrescido da multa de 2% supra referida, será corrigido monetariamente de acordo com o índice de variação do IGP-M/FGV, '+
            'e o total acrescido de juros de mora à razão de 0,07% (zero vírgula zero sete por cento) para cada dia de atraso, até o dia do efetivo pagamento.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - O ALUNO(A) fica obrigado, após o pagamento da matricula, a emitir o boleto da mensalidade pelo Sistema Acadêmico ou deverá efetuar o referido pagamento junto à Tesouraria da UNOESTE'+
            ', ou em local por ela indicado, não se considerando a falta de recebimento do boleto como escusa pela mora no adimplemento da obrigação.');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - Em caso de inadimplência, a UNOESTE poderá optar:');
  Texto.Add('a) pela rescisão contratual, independente da exigibilidade do débito vencido e do devido no mês da efetivação;');
  Texto.Add('b) pela emissão de Letra de Câmbio, a ser sacada contra o ALUNO(A), pelo valor da(s) parcela(s) vencida(s) acrescida(s) das penalidades acima estabelecidas;');
  Texto.Add('c) a falta do pagamento de duas parcelas, consecutivas ou não, autoriza a UNOESTE a inscrever o ALUNO(A), como inadimplente, em cadastros de proteção ao crédito.');
  Texto.Add('');
  Texto.Add('Parágrafo quinto - Na hipótese de a UNOESTE ser obrigada a efetuar cobrança de seus créditos, o devedor ficará sujeito ao pagamento de honorários de advogado, a razão de 10% (dez por cento), se extrajudicial, e 20% (vinte por cento), se judicial.');
  Texto.Add('');
  Texto.Add('Parágrafo sexto - A ausência do ALUNO(A) às aulas, seja por que motivo for,  não o isentará do pagamento das mensalidades e tampouco dar-lhe-á direito à restituição das parcelas pagas.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA');
  Texto.Add('O presente contrato vincula as partes para o período mencionado na cláusula primeira, e poderá ser rescindido nas seguintes hipóteses:');
  Texto.Add('a) pelo ALUNO(A), por desistência formal;');
  Texto.Add('b) pela UNOESTE;');
  Texto.Add('c) por desligamento nos termos do Regimento Escolar;');
  Texto.Add('d) por inadimplência, desde que legalmente permitido.');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - É facultado a UNOESTE a rescisão do presente instrumento por insuficiência de alunos matriculados, até a data de início do curso, hipótese em que será restituído ao ALUNO(A) a integra do valor por ele pago.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - Caso o ALUNO(A) venha a rescindir o contrato entre 30 e 180 dias a partir da data de assinatura do contrato, pagará o valor da mensalidade do mês corrente (mês que o aluno vier a solicitar o cancelamento) e, '+
            'a fim de manter o equilíbrio econômico e financeiro da UNOESTE, será aplicada multa contratual no valor de 10% (dez por cento) calculado sobre o valor total do contrato.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - Caso o ALUNO(A) venha a rescindir este instrumento após o prazo de seis meses da data de assinatura do contrato, pagará o valor da mensalidade do mês corrente (mês em que o aluno vier a solicitar o cancelamento).');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - O ALUNO(A) que, antes do início das aulas requerer desistência ou cancelamento da matrícula, receberá a devolução de 70% (setenta por cento) do valor pago, '+
            'no prazo de 30 (trinta) dias após a formalização do respectivo pedido junto à Secretaria da Pós-Graduação.');
  Texto.Add('');
  Texto.Add('Parágrafo quinto - Após o início das aulas, são devidas as mensalidades que vencerem-se até o mês em que for requerido o cancelamento, uma vez que os serviços ficam disponibilizados ao aluno.');
  Texto.Add('');
  Texto.Add('Parágrafo sexto - O cancelamento deverá ser sempre requerido formalmente junto à Secretaria da Pós-Graduação da UNOESTE, sob pena de manterem-se as obrigações do aluno, especialmente as referentes ao pagamento do valor ora contratado.');
  Texto.Add('');
  Texto.Add('Parágrafo sétimo - Serão pagos emolumentos para a expedição de:');
  Texto.Add('a) cópia de documentos');
  Texto.Add('b) atestados');
  Texto.Add('c) declarações');
  Texto.Add('d) certidões');
  Texto.Add('e) segunda via do boleto de cobrança');
  Texto.Add('f) 2ª via de documentos ou carteirinha de estudante.');
  Texto.Add('');
  Texto.Add('Parágrafo oitavo - Para a expedição de qualquer desses documentos enumerados no parágrafo anterior, o ALUNO(A) deverá apresentar o comprovante de pagamento do respectivo emolumento.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-PRIMEIRA');
  Texto.Add('O ALUNO(A) deverá tratar com urbanidade e polidez a todos (colegas, professores, funcionários, etc.), bem como acatar, cumprir todas as instruções, disposições, '+
            'recomendações e avisos acerca do uso e manuseio de máquinas, ferramentas, aparelhos e instrumentos nas oficinas, laboratórios, estúdios e demais estruturas oferecidas pela UNOESTE no horário escolar e fora dele.');
  Texto.Add('');
  Texto.Add('Parágrafo único - O descumprimento do disposto na cláusula supra, implicará na exclusiva responsabilidade civil e penal ao ALUNO(A), bem como a exclusão e a isenção de quaisquer responsabilidade da UNOESTE'+
            ', seus diretores, professores, funcionários e prepostos em geral.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-SEGUNDA');
  Texto.Add('O ALUNO(A) declara sob as penas da lei estarem corretos os dados cadastrais retro, obrigando-se a comunicar à UNOESTE qualquer alteração em até, no máximo, 30 dias da mesma.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-TERCEIRA');
  Texto.Add('Quaisquer alterações dos termos e condições do presente contrato deverão ser objeto de termos aditivos, que dele ficarão fazendo parte integrante para todos os efeitos e direitos, por comum acordo dos partícipes.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-QUARTA');
  Texto.Add('Para dirimir as dúvidas e controvérsias decorrentes dessa parceria, que não puderem ser resolvidas amigavelmente pelas partes, '+
            'fica eleito o foro cível da Comarca de Presidente Prudente, Estado de São Paulo, com renúncia de qualquer outro, por mais privilegiado que seja.');
  Texto.Add('');
  Texto.Add('E, por estarem assim justas e acordadas, as partes firmam o presente Contrato de Prestação de Serviços Educacionais em duas (02) vias de igual teor e idêntico valor jurídico, '+
            'que depois lido e achado conforme, vai assinado pelas partes convenentes e pelas testemunhas abaixo qualificadas, para que se produza seus efeitos legais.');
  Texto.Add('');
  Texto.Add(LCidade2.Caption);
end;

procedure TFInscrit.EemailExit(Sender: TObject);
begin
 If (not B_Cancela.Focused)
 Then
  If Trim(Eemail.Text) <> ''
  Then
   If not VerifEmail(Trim(Eemail.Text))
   Then Eemail.SetFocus;
end;

procedure TFInscrit.QPlanosPagtoCalcFields(DataSet: TDataSet);
var vmesing:word;
begin
 vmesing:=QPlanosPagto['plp_mesing'];
 If QPlanosPagto['plp_nparcelas'] = 1
 Then QPlanosPagto['plano']:='Parcela única de R$'+FormatFloat('###,##0.00',QPlanosPagto['plp_vrmatricula'])+'  (Início:'+Mes[vmesing]+'/'+IntToStr(QPlanosPagto['plp_anoing'])+')'
 Else
  If QPlanosPagto['plp_vrmatricula'] <> QPlanosPagto['plp_vrparcela']
  Then QPlanosPagto['plano']:='Matrícula de R$'+FormatFloat('###,##0.00',QPlanosPagto['plp_vrmatricula'])+' + '+StrZero(QPlanosPagto['plp_nparcelas'] - 1,2)+' parcela(s) de R$'+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+'  (Início:'+Mes[vmesing]+'/'+IntToStr(QPlanosPagto['plp_anoing'])+')'
  Else QPlanosPagto['plano']:=StrZero(QPlanosPagto['plp_nparcelas'],2)+' parcelas de R$'+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+'  (Início:'+Mes[vmesing]+'/'+IntToStr(QPlanosPagto['plp_anoing'])+')';
end;

procedure TFInscrit.DBLCPlanosEnter(Sender: TObject);
begin
 Q_Localidade.Close;
 QPessoa.Close;
 QEndLocal.Close;
 b_Altera.Enabled:=False;
 B_Ok.Enabled:=False;
 BContrato.Enabled:=False;
 PG_Cad.Enabled:=False;
 PG_End.Enabled:=False;
 PG_End.TabVisible:=False;
 PG_EndLocal.Enabled:=False;
 PG_EndLocal.TabVisible:=False;
 PG_Jur.Enabled:=False;
 PageControl1.ActivePage:=PG_Cad;
 QInscrito.Close;
 QNac.Close;
 QBolPagto.Close;                         
 CECPF.Clear;
end;

procedure TFInscrit.LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If B_LocIns.Enabled
 Then B_LocIns.Click;
end;

procedure TFInscrit.E_Cidade2Exit(Sender: TObject);
begin
  If (ActiveControl<>B_Cancela) and (ActiveControl<> B_OK)
      and (ActiveControl<>B_Sair) then
    if E_Cidade2.Text = '' then
    begin
      MessageDlg('Digite as iniciais da Localidade',mtInformation,[mbOk],0);
      E_Cidade2.Setfocus;
    end
    else
    begin
      If E_Cidade2.Modified Then
      Begin
        Q_Localidade.Close;
        Q_Localidade.SQL.Clear;
        Q_Localidade.SQL.Add('select loc_codigo,loc_nome,loc_uf from cep_local where loc_nome like :nome');
        Pesquisa(Q_Localidade,[E_Cidade2.Text+'%']);
        if Q_Localidade.RecordCount = 1 then
        begin
          QEndLocal['loc_codigo']:=Q_Localidade['loc_codigo'];
          E_Cidade2.Text:=Q_Localidade['loc_nome']+' - '+Q_Localidade['loc_uf'];
          DBECEP2.SetFocus;
        end
        else
          If (Q_Localidade.RecordCount = 0) Then
          Begin
            MessageDlg('Nome de Cidade Inválido!',mtInformation,[mbOk],0);
            Q_Localidade.Close;
            E_Cidade2.SetFocus;
          End
          Else LC_Cidade2.DropDown;
      end;
    end;
end;

procedure TFInscrit.LC_Cidade2Click(Sender: TObject);
begin
  E_Cidade2.Text:=LC_Cidade2.Text+' - '+Q_Localidade['loc_uf'];
end;

procedure TFInscrit.Eemail2Exit(Sender: TObject);
begin
 If (not B_Cancela.Focused)
 Then
  If Trim(Eemail2.Text) <> ''
  Then
   If not VerifEmail(Trim(Eemail2.Text))
   Then Eemail2.SetFocus;
end;

procedure TFInscrit.DBCBDiaExit(Sender: TObject);
begin
  If (not B_Cancela.Focused)
  Then
  If DBCBDia.ItemIndex = -1
  Then DBCBDia.SetFocus;
end;

procedure TFInscrit.StorePDFOptions;
begin
  // save the current options to put back when we're finished.
  optUseAutosave := PDFCreator.cOption['UseAutosave'];
  optUseAutosaveDirectory := PDFCreator.cOption['UseAutosaveDirectory'];
  optAutosaveDirectory := PDFCreator.cOption['AutosaveDirectory'];
  optAutosaveFilename := PDFCreator.cOption['AutosaveFilename'];
  optAutosaveFormat := PDFCreator.cOption['AutosaveFormat'];
  optPDFColorsColorModel := PDFCreator.cOption['PDFColorsColorModel'];
end;

procedure TFInscrit.SetPDFOptions(const filename: String);
begin
  // set the options we want, auto-save PDF with specific filename
  PDFCreator.cOption('UseAutosave') := 1;
  PDFCreator.cOption('UseAutosaveDirectory') := 1;
  PDFCreator.cOption('AutosaveDirectory') := ExtractFilePath(filename);
  PDFCreator.cOption('AutosaveFilename') := ExtractFileName(filename);
  PDFCreator.cOption('AutosaveFormat') := 0; // PDF format
  PDFCreator.cOption('PDFColorsColorModel') := 0; // RGB format

  PDFCreator.cSaveOptions;
end;

procedure TFInscrit.RestorePDFOptions;
begin
  // reset user's options
  PDFCreator.cOption('UseAutosave') := optUseAutosave;
  PDFCreator.cOption('UseAutosaveDirectory') := optUseAutosaveDirectory;
  PDFCreator.cOption('AutosaveDirectory') := optAutosaveDirectory;
  PDFCreator.cOption('AutosaveFilename') := optAutosaveFilename;
  PDFCreator.cOption('AutosaveFormat') := optAutosaveFormat;
  PDFCreator.cOption('PDFColorsColorModel') := optPDFColorsColorModel;

  PDFCreator.cSaveOptions;

  Sleep(100);
end;

procedure TFInscrit.E_CidadePExit(Sender: TObject);
begin
  If (ActiveControl<>B_Cancela) and (ActiveControl<> B_OK)
      and (ActiveControl<>B_Sair) then
    if E_CidadeP.Text = '' then
       QPesJur['loc_codigo']:=Null
    else
    begin
      If E_CidadeP.Modified Then
      Begin
        Q_LocalidadeJ.Close;
        Q_LocalidadeJ.SQL.Clear;
        Q_Localidadej.SQL.Add('select loc_codigo,loc_nome,loc_uf from cep_local where loc_nome like :nome');
        Pesquisa(Q_LocalidadeJ,[E_CidadeP.Text+'%']);
        if Q_LocalidadeJ.RecordCount = 1 then
        begin
          QPesJur['loc_codigo']:=Q_LocalidadeJ['loc_codigo'];
          E_CidadeP.Text:=Q_LocalidadeJ['loc_nome']+' - '+Q_LocalidadeJ['loc_uf'];
          DBECEPP.SetFocus;
        end
        else
          If (Q_LocalidadeJ.RecordCount = 0) Then
          Begin
            MessageDlg('Nome de Cidade Inválido!',mtInformation,[mbOk],0);
            Q_LocalidadeJ.Close;
            E_CidadeP.SetFocus;
          End
          Else LC_CidadeP.DropDown;
      end;
    end;
end;

procedure TFInscrit.CECNPJEnter(Sender: TObject);
begin
  QPesJur.Close;
  Q_LocalidadeJ.Close;
end;

procedure TFInscrit.CECNPJExit(Sender: TObject);
begin
  If Trim(CECNPJ.Text) <> ''
  Then
   Begin
     If not CNPJ(CECNPJ.Text)
     Then
      Begin
        MessageDlg('CNPJ Inválido!',mtError,[mbOk],0);
        CECNPJ.SetFocus;
      End
     Else
      Begin
        QPesJur.Close;
        QPesJur.Sql.Clear;
        QPesJur.Sql.Add('select * from crp_pessoas where pes_cnpj =:cnpj');
        QPesJur.ParamByName('cnpj').AsString:=CECNPJ.Text;
        QPesJur.Open;
        If QPesJur.Eof
        Then
         Begin
           QPesJur.Insert;
           QPesJur['pes_cnpj']:=CECNPJ.Text;
           QPesJur['pes_tipo']:=1;
         End
        Else QPesJur.Edit;
      End;
   End;
end;

procedure TFInscrit.LC_CidadePClick(Sender: TObject);
begin
  E_CidadeP.Text:=LC_CidadeP.Text+' - '+Q_LocalidadeJ['loc_uf'];
end;

procedure TFInscrit.FormCreate(Sender: TObject);
var
  base: String;
begin
  try
    base := ExtractFilePath(Application.ExeName);
    CopyFile('\\betha1\producao\boleto.dll', PChar(base + 'boleto.dll'), false);
  except

  end;
end;

procedure TFInscrit.ppDetailBand3BeforePrint(Sender: TObject);
var estciv, cpf, municipio, estado, uf, email, telefones, munjur, ufjur, ramal, rua, bairro, cep:string;
    ordem, vdia, vmes, vano:word;
begin
  estciv:='';
  Case NULLToZero(QContrato['pes_estciv']) of
    1:estciv:='solteiro(a)';
    2:estciv:='casado(a)';
    3:estciv:='viuvo(a)';
    4:estciv:='divorciado(a)';
    5:estciv:='desquitado(a)';
  End;

  cpf:='';
  If NULLToZero2(QContrato['pes_cpf']) <> 0
  Then cpf:=Mascara_CPF(QContrato['pes_cpf']);

  rua:='';
  bairro:='';
  cep:='';
  municipio:='';
  estado:='';
  uf:='';
  telefones:='';
  If QContrato['ins_raend'] <> Null
  Then
   Begin
     QEndLocal.Close;
     QEndLocal.ParamByName('ra').AsFloat:=QContrato['ins_raend'];
     QEndLocal.Open;
     rua:=NULLToSpace(QEndLocal['end_locrua']);
     bairro:=NULLToSpace(QEndLocal['end_locbai']);
     cep:=NULLToSpace(QEndLocal['end_loccep']);
     If QEndLocal['loc_codigo'] <> Null
     Then
      Begin
        QAux.Close;
        QAux.RequestLive:=False;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from cep_local l, cep_estado e');
        QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
        QAux.ParamByName('codloc').AsInteger:=QEndLocal['loc_codigo'];
        QAux.Open;
        If not QAux.Eof
        Then
         Begin
           municipio:=NULLToSpace(QAux['loc_nome']);
           estado:=NULLToSpace(QAux['est_preposicao'])+' '+NULLToSpace(QAux['est_descr']);
           uf:=NULLToSpace(QAux['loc_uf']);
         End;
      End;
     If QEndLocal['end_locfone'] <> Null
     Then
      Begin
        telefones:=', fone '+QEndLocal['end_locfone'];
        If QContrato['pes_celular'] <> Null
        Then telefones:=telefones + ', e celular '+QContrato['pes_celular'];
      End
     Else
      If QContrato['pes_celular'] <> Null
      Then telefones:=', celular '+QContrato['pes_celular'];
   End
  Else
   Begin
     rua:=NULLToSpace(QContrato['pes_rua']);
     bairro:=NULLToSpace(QContrato['pes_bairro']);
     cep:=NULLToSpace(QContrato['pes_cep']);
     If QContrato['loc_codigo'] <> Null
     Then
      Begin
        QAux.Close;
        QAux.RequestLive:=False;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from cep_local l, cep_estado e');
        QAux.Sql.Add('where l.loc_uf = e.loc_uf and loc_codigo =:codloc');
        QAux.ParamByName('codloc').AsInteger:=QContrato['loc_codigo'];
        QAux.Open;
        If not QAux.Eof
        Then
         Begin
           municipio:=NULLToSpace(QAux['loc_nome']);
           estado:=NULLToSpace(QAux['est_preposicao'])+' '+NULLToSpace(QAux['est_descr']);
           uf:=NULLToSpace(QAux['loc_uf']);
         End;
      End;
     If QContrato['pes_telefone'] <> Null
     Then
      Begin
        telefones:=', fone '+QContrato['pes_telefone'];
        If QContrato['pes_celular'] <> Null
        Then telefones:=telefones + ', e celular '+QContrato['pes_celular'];
      End
     Else
      If QContrato['pes_celular'] <> Null
      Then telefones:=', celular '+QContrato['pes_celular'];
   End;

  email:='';
  If Qemail['eml_email'] <> Null
  Then email:=', e-mail '+Qemail['eml_email'];

  ppRichView1.RichView.Clear;
  ppRichView1.RichView.Style.TextStyles.Items[0].FontName:='Arial';
  ppRichView1.RichView.Style.TextStyles.Items[0].Size:=11;
  ppRichView1.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView1.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView1.RichView.Style.TextStyles.Items[1].FontName:='Arial';
  ppRichView1.RichView.Style.TextStyles.Items[1].Size:=11;
  ppRichView1.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView1.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

  ppRichView1.RichView.Style.TextStyles.Items[2].FontName:='Arial';
  ppRichView1.RichView.Style.TextStyles.Items[2].Size:=11;
  ppRichView1.RichView.Style.TextStyles.Items[2].Color:=clBlack;
  ppRichView1.RichView.Style.TextStyles.Items[2].Style:=[fsBold, fsUnderline];

  ppRichView1.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView1.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;
  ppRichView1.RichView.Style.ParaStyles.Items[0].FirstIndent:=0;

  ppRichView1.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView1.RichView.Style.ParaStyles.Items[1].LineSpacing:=100;
  ppRichView1.RichView.Style.ParaStyles.Items[1].FirstIndent:=0;
  ppRichView1.RichView.Style.ParaStyles.Items[1].LeftIndent:=20;

  ppRichView1.RichView.Style.ParaStyles.Items[2].Alignment:=rvaJustify;
  ppRichView1.RichView.Style.ParaStyles.Items[2].LineSpacing:=100;
  ppRichView1.RichView.Style.ParaStyles.Items[2].FirstIndent:=100;

//  ppRichView1.RichView.Style.ParaStyles.Items[1].Alignment:=rvaLeft;
//  ppRichView1.RichView.Style.ParaStyles.Items[1].LineSpacing:=100;
//  ppRichView1.RichView.Style.ParaStyles.Items[1].FirstIndent:=120;

  ppRichView1.RichView.Style.ParaStyles.Items[2].Alignment:=rvaCenter;
  ppRichView1.RichView.Style.ParaStyles.Items[2].LineSpacing:=100;
  ppRichView1.RichView.Style.ParaStyles.Items[2].FirstIndent:=0;

  ppRichView1.RichView.AddNL('Pelo presente instrumento particular de ',0,0);
  ppRichView1.RichView.AddNL('CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS',1,-1);
  ppRichView1.RichView.AddNL(', de um lado a ',0,-1);
  ppRichView1.RichView.AddNL('ASSOCIAÇÃO PRUDENTINA DE EDUCAÇÃO E CULTURA - APEC',1,-1);
  ppRichView1.RichView.AddNL(', mantenedora da ',0,-1);
  ppRichView1.RichView.AddNL('UNIVERSIDADE DO OESTE PAULISTA - UNOESTE',1,-1);
  ppRichView1.RichView.AddNL(', pessoa jurídica de direito privado, inscrita no CNPJ/MF sob nº 44.860.740/0001-73, ',0,-1);
  ppRichView1.RichView.AddNL('sediada na cidade de Presidente Prudente/SP à Rua José Bongiovani nº 700, cidade universitária, CEP 19050-900, ',0,-1);
  ppRichView1.RichView.AddNL('fone/fax (18) 3229-1000 ramal 1010, neste ato representado legalmente por seu Diretor Geral, ',0,-1);
  ppRichView1.RichView.AddNL('AUGUSTO CESAR DE OLIVEIRA LIMA, CPF 778.941.548-49',1,-1);
  ppRichView1.RichView.AddNL(', doravante denominada de ',0,-1);
  ppRichView1.RichView.AddNL('UNOESTE',1,-1);

  ppRichView1.RichView.AddNL(', e de outro, o aluno (a) ao final qualificado (a) e/ou seu representante legal,',0,-1);
  ppRichView1.RichView.AddNL(QContrato['pes_nome'],1,-1);
  ppRichView1.RichView.AddNL(', '+LowerCase(NULLToSpace(QContrato['nac_descmasc']))+'(a), '+estciv+', '+NULLToSpace(QContrato['ins_profissao']),0,-1);
  ppRichView1.RichView.AddNL(', inscrito(a) regularmente no CPF/MF sob nº '+cpf+', portador(a) do RG/SSP-'+NULLToSpace(QContrato['pes_estexp'])+' de nº '+NULLToSpace(QContrato['pes_rg']),0,-1);
  ppRichView1.RichView.AddNL(', residente e domiciliado(a) à '+rua+', '+bairro+', município de '+municipio,0,-1);
  ppRichView1.RichView.AddNL(', Estado '+estado+', CEP '+cep+email+telefones,0,-1);
  ppRichView1.RichView.AddNL(', doravante denominado ',0,-1);
  ppRichView1.RichView.AddNL('ALUNO(A)',1,-1);
  ppRichView1.RichView.AddNL(', têm justo e contratado o seguinte:',0,-1);

  LContratado.Caption:=QContrato['pes_nome'];

  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA PRIMEIRA. ',1,0);
  ppRichView1.RichView.AddNL('O presente contrato é celebrado com respaldo legal dos artigos 205, 206, 207 e 209 da Constituição Federal; ',0,-1);
  ppRichView1.RichView.AddNL('Artigos 43 e seguintes da Lei 9.394/96 - LDB e nos termos da Lei nº 8.078/90.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA SEGUNDA. ',1,0);
  ppRichView1.RichView.AddNL('Por força do presente instrumento, a ',0,-1);
  ppRichView1.RichView.AddNL('UNOESTE ',1,-1);
  ppRichView1.RichView.AddNL('obriga-se a ministrar o curso denominado ',0,-1);
  ppRichView1.RichView.AddNL(NULLToSpace(QCurso['cur_nome']),1,-1);
  ppRichView1.RichView.AddNL(', por meio de aulas e demais atividade curriculares ao ',0,-1);
  ppRichView1.RichView.AddNL('ALUNO(A) ',1,-1);
  ppRichView1.RichView.AddNL('de acordo com o plano de ensino para o período compreendido entre o mês de '+Mes[vmesini]+' de '+IntToStr(vanoini)+' e o mês de '+Mes[vmesfim],0,-1);
  ppRichView1.RichView.AddNL(' de '+IntToStr(vanofim)+', o qual se encontra à disposição do ALUNO no site http://www.unoeste.br, ',0,-1);
  ppRichView1.RichView.AddNL('ou na Secretaria Geral de Pós-Graduação Stricto Sensu vinculada à Pró-Reitoria de Pesquisa e Pós-Graduação - PRPPG da UNOESTE, ',0,-1);
  ppRichView1.RichView.AddNL('em regime de semestralidade letiva, pelo que o presente contrato vincula as partes para o',0,-1);
  If vmesini <= 6
  Then ppRichView1.RichView.AddNL(' 1º semestre de '+IntToStr(vanoini),0,-1)
  Else ppRichView1.RichView.AddNL(' 2º semestre de '+IntToStr(vanoini),0,-1);
  ppRichView1.RichView.AddNL(', dependendo os demais períodos de rematrícula mediante aditivo contratual.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO fica devidamente cientificado que a prestação dos serviços educacionais é contratada por semestre letivo e que a rematrícula, ',1,-1);
  ppRichView1.RichView.AddNL('a cada semestre, é ato indispensável que estabelece o vínculo entre as partes.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView1.RichView.AddNL('O não pagamento de qualquer das mensalidades na data de vencimento implicará na imediata e automática constituição do ALUNO(A) em mora, ',1,-1);
  ppRichView1.RichView.AddNL('independentemente de interpelação judicial ou extrajudicial para tal fim, ficando facultado à CONTRATADA não renovar a matrícula do aluno em débito, ',1,-1);
  ppRichView1.RichView.AddNL('nos termos do artigo 5º, da lei 9.870/1999.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView1.RichView.AddNL('A rematrícula não será realizada se houver dívidas do ALUNO(A) perante a CONTRATADA, ainda que proveniente de contrato ou aditivo anterior, ',1,-1);
  ppRichView1.RichView.AddNL('débitos referentes a outros serviços, ou mesmo de relação extracontratual.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView1.RichView.AddNL('As rematrículas podem ser feitas por meio físico (papel) ou por meio eletrônico. Por meio eletrônico, a rematrícula será efetuada mediante a ',1,-1);
  ppRichView1.RichView.AddNL('utilização de senha eletrônica pessoal (código secreto previamente convencionado entre as partes como forma de reconhecimento), cadastrada junto à Universidade. ',1,-1);
  ppRichView1.RichView.AddNL('Assim, o ALUNO(A) desde já, para todos os efeitos legais, reconhece como válidas e verdadeiras as operações assim realizadas, ',1,-1);
  ppRichView1.RichView.AddNL('sendo as senhas de uso pessoal e intransferível e não devem ser repassadas a terceiros. A Universidade não se responsabiliza por eventuais prejuízos ',1,-1);
  ppRichView1.RichView.AddNL('decorrentes da quebra de sigilo das senhas eletrônicas decorrentes de manipulação ou controle inadequado por parte do ALUNO(A).',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA TERCEIRA. ',1,0);
  ppRichView1.RichView.AddNL('As aulas serão ministradas nas dependências da UNOESTE, ou em outros locais pela mesma indicada, em dias e horários estipulados no calendário escolar.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA QUARTA. ',1,0);
  ppRichView1.RichView.AddNL('A matrícula do ALUNO(A) formalizar-se-á junto à UNOESTE, após a entrega do presente instrumento devidamente assinado e da FICHA DE INSCRIÇÃO DO CANDIDATO, ',0,-1);
  ppRichView1.RichView.AddNL('que fica desde logo fazendo parte integrante do presente, além dos documentos abaixo relacionados que deverão ser apresentados no original ',0,-1);
  ppRichView1.RichView.AddNL('para autenticação presencial da cópia, dependendo ainda da análise do currículo do mesmo, e, efetiva-se pelo pagamento da primeira mensalidade, ',0,-1);
  ppRichView1.RichView.AddNL('conforme cláusula sexta e, observando-se o prazo de inscrição.',0,-1);
  ppRichView1.RichView.AddNL('a) Currículum Vitae / Curriculum Lattes - documentado;',0,0);
  ppRichView1.RichView.AddNL('b) Cópia do Diploma ou Certificado de conclusão de Graduação (Bacharelado ou Licenciatura Plena);',0,0);
  ppRichView1.RichView.AddNL('c) Cópia do Diploma ou Certificado de conclusão do Curso de Mestrado (para o Doutorado)',0,0);
  ppRichView1.RichView.AddNL('d) Cópia do Histórico Escolar do Curso de Graduação;',0,0);
  ppRichView1.RichView.AddNL('e) Cópia do Histórico Escolar do Curso de Mestrado (para o Doutorado);',0,0);
  ppRichView1.RichView.AddNL('f) Cópia do CPF',0,0);
  ppRichView1.RichView.AddNL('g) Cópia do RG',0,0);
  ppRichView1.RichView.AddNL('h) 02 fotos 3x4 recentes;',0,0);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Certificados de conclusão somente serão aceitos, com a entrega do protocolo de requerimento do diploma.',0,0);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView1.RichView.AddNL('A falta do preenchimento de qualquer dos requisitos contidos no presente contrato isenta a UNOESTE de qualquer vinculação com o ALUNO(A).',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView1.RichView.AddNL('A tolerância de atraso na entrega da documentação não implica na sua dispensa, ',1,-1);
  ppRichView1.RichView.AddNL('ficando o Aluno desde já ciente de que a apresentação da documentação exigida é pressuposto para obtenção do certificado de conclusão, diploma e titulação.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO(A) declara que se responsabiliza, sob as penas da lei, que autentica a veracidade dos documentos ali especificados que foram por ele entregues.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);

  ppRichView1.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView1.RichView.AddNL('É CONDIÇÃO DE VALIDADE DA MATRÍCULA NO CURSO DE PÓS-GRADUAÇÃO STRICTU SENSU OBJETO DESTE CONTRATO, ',0,-1);
  ppRichView1.RichView.AddNL('A CONFIRMAÇÃO DA CONCLUSÃO DO CURSO DE GRADUAÇÃO PELO PRETENSO ALUNO(A), ',0,-1);
  ppRichView1.RichView.AddNL('MEDIANTE APRESENTAÇÃO DO CERTIFICADO DE CONCLUSÃO DE CURSO GRADUAÇÃO OU DIPLOMA DEVIDAMENTE EMITIDOS PELA INSTITUIÇÃO DE ENSINO RESPONSÁVEL.',0,-1);

  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA QUINTA. ',1,0);
  ppRichView1.RichView.AddNL('É de inteira responsabilidade da UNOESTE o planejamento e a prestação dos serviços de ensino e pesquisa, fixação do currículo, ',0,-1);
  ppRichView1.RichView.AddNL('com a respectiva carga horária, designação de professores, orientação didática, bem como determinação de datas de aproveitamento, ',0,-1);
  ppRichView1.RichView.AddNL('além de outras providências que as atividades docentes e discentes exigirem, a exclusivo critério da mesma, tudo de acordo com a legislação vigente, sem qualquer ingerência do ALUNO(A).',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView1.RichView.AddNL('As aulas serão ministradas nas salas de aula ou locais indicados pela CONTRATADA, tendo em vista a natureza do conteúdo e a técnica pedagógica.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO(A) se declara ciente e manifesta seu aceite que as disciplinas integrantes da grade curricular do curso contratado poderão ser ofertadas na modalidade semipresencial, ',1,-1);
  ppRichView1.RichView.AddNL('de acordo com o artigo 81, da lei 9.394/96 c/c a Portaria MEC MEC N- 4.059/2004, nos limites desta.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA SEXTA. ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO(A) declara conhecer e obriga-se a acolher o Regimento Interno da Unoeste, as Normas Financeiras, o Regimento da Pós-Graduação ',0,-1);
  ppRichView1.RichView.AddNL('e demais obrigações constantes na legislação aplicável à área de ensino superior de pós-graduação e, ainda, as emanadas de outras fontes legais, ',0,-1);
  ppRichView1.RichView.AddNL('desde que regulem supletivamente a matéria, bem como eventuais decisões da UNOESTE inerentes à espécie, as quais se integram reciprocamente.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA SÉTIMA. ',1,0);
  ppRichView1.RichView.AddNL('A presente contratação implica disponibilização dos serviços ao ALUNO(A), obrigando-se ao pagamento da totalidade da mesma. ',0,-1);
  ppRichView1.RichView.AddNL('Pelos serviços a serem prestados, o ALUNO(A) obriga-se a pagar o valor abaixo indicado, de acordo com o curso em que está matriculado, da forma a seguir especificada:',0,-1);
  ppRichView1.RichView.AddNL('a) Curso : ',0,0);
  ppRichView1.RichView.AddNL(NULLToSpace(QCurso['cur_nome']),1,-1);
  ppRichView1.RichView.AddNL('b) Valor de contrato de ',0,0);
  ppRichView1.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrtotal']),1,-1);
  ppRichView1.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrtotal'])+')',0,-1);
  ppRichView1.RichView.AddNL(', sendo que este valor indicado será pago em ',0,-1);
  If QPlanosPagto['plp_nparcelas'] = 1
  Then
   Begin
     ppRichView1.RichView.AddNL('01 (UMA) parcela única, no valor de ',0,0);
     ppRichView1.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela']),1,-1);
     ppRichView1.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrparcela'])+').',0,-1);
   End
  Else
   If QPlanosPagto['plp_vrmatricula'] = QPlanosPagto['plp_vrparcela']
   Then
    Begin
      ppRichView1.RichView.AddNL(StrZero(QPlanosPagto['plp_nparcelas'],2),1,-1);
      ppRichView1.RichView.AddNL(' ('+Trim(Exts(QPlanosPagto['plp_nparcelas']))+') parcelas mensais, iguais e sucessivas, vincendas todo dia ',0,-1);
      ppRichView1.RichView.AddNL(StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês calendário, no valor de ',0,-1);
      ppRichView1.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela']),1,-1);
      ppRichView1.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.',0,-1);
    End
   Else
    Begin
      ppRichView1.RichView.AddNL('01 (UMA) parcela no valor de ',0,-1);
      ppRichView1.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrmatricula']),1,-1);
      ppRichView1.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrmatricula'])+') referente a matrícula, e ',0,-1);
      ppRichView1.RichView.AddNL(StrZero(QPlanosPagto['plp_nparcelas'] - 1,2),1,-1);
      ppRichView1.RichView.AddNL(' ('+Trim(Exts(QPlanosPagto['plp_nparcelas'] - 1))+') parcelas mensais, iguais e sucessivas, vincendas todo dia ',0,-1);
      ppRichView1.RichView.AddNL(StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês calendário, no valor de ',0,-1);
      ppRichView1.RichView.AddNL('R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela']),1,-1);
      ppRichView1.RichView.AddNL(' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.',0,-1);
    End;

  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView1.RichView.AddNL('Quaisquer pagamentos vinculados ao presente instrumento efetuados em cheque apenas serão considerados quitados após sua efetiva compensação, ',0,-1);
  ppRichView1.RichView.AddNL('ainda que tal condição não conste do recibo, eis que recebidos em caráter pro solvendo.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView1.RichView.AddNL('Na hipótese de a UNOESTE aceitar pagamentos antecipados, estes não quitarão eventuais acréscimos que venham a ser posteriormente apurados.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView1.RichView.AddNL('A quitação de parcela posterior não implica a quitação das anteriores, permanecendo com o ALUNO(A) o ônus da prova de seus pagamentos.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView1.RichView.AddNL('Havendo cheques que não tenham sido regularmente compensados, o débito restará em aberto e apenas poderá ser efetuada a quitação destes, ',1,-1);
  ppRichView1.RichView.AddNL('bem como o pagamento subsequente, em dinheiro (espécie), ou cheque administrativo.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo quinto - ',1,0);
  ppRichView1.RichView.AddNL('Não será considerado ALUNO(A) aquele cuja matrícula não houver sido efetuada em conformidade com o presente contrato, ',0,-1);
  ppRichView1.RichView.AddNL('o que leva a inexistência de relação de ensino entre as partes, sendo vedado ao mesmo assistir aula e/ou frequentar as dependências da UNOESTE.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo sexto - ',1,0);
  ppRichView1.RichView.AddNL('Em caso de pagamentos mensais efetuados até o dia 06 de cada mês correspondente ao vencimento, será concedido ao ALUNO(A) um desconto especial ',0,-1);
  ppRichView1.RichView.AddNL('de pontualidade de 2% (dois por cento). Esta condição incide apenas nos casos do ALUNO(A) que efetuam pagamento integral, ',0,-1);
  ppRichView1.RichView.AddNL('deixando de valer para aquele ALUNO(A) que já possui algum tipo de benefício por desconto, bolsa ou outro qualquer. Tal pagamento, entretanto, ',0,-1);
  ppRichView1.RichView.AddNL('não implicará de nenhuma forma quitação de eventuais acréscimos que venham a ser posteriormente apurados.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA OITAVA. ',1,0);
  ppRichView1.RichView.AddNL('Na hipótese de atraso do pagamento, o valor devido será acrescido de 2% (dois por cento) de multa e o valor será corrigido monetariamente ',1,-1);
  ppRichView1.RichView.AddNL('de acordo com o índice de variação do IGP-M/FGV, sem prejuízo de acréscimo de juros de mora à razão de 0,07% (zero vírgula zero sete por cento) ',1,-1);
  ppRichView1.RichView.AddNL('para cada dia de atraso, até o dia do pagamento.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO(A) fica obrigado, após o pagamento da matricula, a emitir o boleto da mensalidade pelo Sistema Acadêmico, ',0,-1);
  ppRichView1.RichView.AddNL('ou deverá efetuar o referido pagamento junto à Tesouraria da UNOESTE, não se considerando a falta de recebimento do boleto como escusa pela mora no adimplemento da obrigação.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView1.RichView.AddNL('Em caso de inadimplência, a UNOESTE poderá optar: ',0,-1);
  ppRichView1.RichView.AddNL('a) pela rescisão contratual, independente da exigibilidade do débito vencido e do devido no mês da efetivação;',0,0);
  ppRichView1.RichView.AddNL('b) pela emissão de Letra de Câmbio, a ser sacada contra o ALUNO(A), pelo valor da(s) parcela(s) vencida(s) acrescida(s) das penalidades acima estabelecidas;',0,0);
  ppRichView1.RichView.AddNL('c) a falta do pagamento de duas parcelas, consecutivas ou não, autoriza a UNOESTE a inscrever o ALUNO(A), como inadimplente, em cadastros de proteção ao crédito.',0,0);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView1.RichView.AddNL('Na hipótese de a UNOESTE ser obrigada a efetuar cobrança de seus créditos via advogado, o devedor ficará sujeito ao pagamento de honorários de advogado, ',0,-1);
  ppRichView1.RichView.AddNL('a razão de 10% (dez por cento), se extrajudicial, e 20% (vinte por cento), se judicial.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView1.RichView.AddNL('A ausência do ALUNO(A) às aulas, seja por que motivo for, não o isentará do pagamento das mensalidades e tampouco dar-lhe-á direito à restituição das parcelas pagas.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA NONA. ',1,0);
  ppRichView1.RichView.AddNL('Os valores previstos na cláusula sétima incluem exclusivamente a prestação de serviços decorrentes do currículo acadêmico regular. ',1,-1);
  ppRichView1.RichView.AddNL('Todas as demais atividades prestadas pela UNOESTE serão cobradas a parte, e as atividades extracurriculares também terão seu valor fixado à parte pela UNOESTE, ',1,-1);
  ppRichView1.RichView.AddNL('sendo certo que não terão caráter obrigatório. Igualmente, serviços individualizados, como segunda via de documentos, declarações, atestados, carteirinha de estudante, ',1,-1);
  ppRichView1.RichView.AddNL('etc. não estão incluídos no valor da mensalidade e serão cobrados a parte.',1,-1);

  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA DÉCIMA. ',1,0);
  ppRichView1.RichView.AddNL('As partes declaram que os valores acima indicados foram calculados de acordo com a atual situação econômica vigente no país, ',0,-1);
  ppRichView1.RichView.AddNL('representando o equilíbrio econômico da época da celebração do contrato. Assim, a fim de manter tal equilíbrio os valores das parcelas mensais ',0,-1);
  ppRichView1.RichView.AddNL('poderão ser alterados no caso de comprovado aumento de custos e/ou redução das receitas da UNOESTE.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA DÉCIMA-PRIMEIRA. ',1,0);
  ppRichView1.RichView.AddNL('O presente contrato vincula as partes para o período mencionado na cláusula primeira, e poderá ser rescindido nas seguintes hipóteses:',0,-1);
  ppRichView1.RichView.AddNL('a) pelo ALUNO(A), por desistência formal;',0,0);
  ppRichView1.RichView.AddNL('b) pela UNOESTE:',0,0);
  ppRichView1.RichView.AddNL('b.1) por desligamento nos termos do Regimento Escolar;',0,0);
  ppRichView1.RichView.AddNL('b.2) por inadimplência.',0,0);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo primeiro - ',1,0);
  ppRichView1.RichView.AddNL('É facultado à UNOESTE a rescisão do presente instrumento por insuficiência de alunos matriculados, até a data de início do curso, ',1,-1);
  ppRichView1.RichView.AddNL('hipótese em que será restituído ao ALUNO(A) a integra do valor por ele pago.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo segundo - ',1,0);
  ppRichView1.RichView.AddNL('Caso o ALUNO(A) venha a rescindir o contrato entre 30 e 180 dias a partir da adesão ao mesmo, pagará o valor da mensalidade do mês corrente ',1,-1);
  ppRichView1.RichView.AddNL('(mês que o aluno vier a solicitar o cancelamento) e a fim de manter o equilíbrio econômico e financeiro da UNOESTE, ',1,-1);
  ppRichView1.RichView.AddNL('será aplicada multa contratual no valor de 10% (dez por cento) calculado sobre o valor total do contrato.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo terceiro - ',1,0);
  ppRichView1.RichView.AddNL('Caso o ALUNO(A)  venha a rescindir este instrumento após o prazo de seis meses da data de assinatura do contrato, ',1,-1);
  ppRichView1.RichView.AddNL('pagará o valor da mensalidade do mês corrente (mês em que o aluno vier a solicitar o cancelamento).',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo quarto - ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO(A) que antes do início das aulas requerer desistência ou cancelamento da matrícula receberá a devolução de 70% (setenta por cento) do valor pago, ',1,-1);
  ppRichView1.RichView.AddNL('no prazo de 30 (trinta) dias após a formalização do respectivo pedido junto à Secretaria da Pós-Graduação.',1,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo quinto - ',1,0);
  ppRichView1.RichView.AddNL('Após o início das aulas são devidas as mensalidades que se vencerem até o mês em que for requerido o cancelamento, uma vez que os serviços ficam disponibilizados.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('Parágrafo sexto - ',1,0);
  ppRichView1.RichView.AddNL('O cancelamento deverá ser sempre requerido formalmente junto à Secretaria Geral de Pós-Graduação Stricto Sensu da UNOESTE, ',0,-1);
  ppRichView1.RichView.AddNL('sob pena de manterem-se as obrigações do ALUNO(A), especialmente as referentes ao pagamento do valor ora contratado.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA DÉCIMA-SEGUNDA. ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO(A) deverá tratar com urbanidade a todos, bem como acatar todas as instruções, disposições, recomendações e avisos acerca do uso e manuseio de máquinas, ',0,-1);
  ppRichView1.RichView.AddNL('ferramentas, aparelhos e instrumentos  eventualmente utilizados em laboratórios e demais estruturas oferecidas pela UNOESTE no horário escolar e fora dele, ',0,-1);
  ppRichView1.RichView.AddNL('sendo de sua exclusiva responsabilidade a reparação de quaisquer danos causados à UNOESTE, seus diretores, professores, funcionários, prepostos em geral, ou a terceiros.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA DÉCIMA-TERCEIRA. ',1,0);
  ppRichView1.RichView.AddNL('O ALUNO(A) declara sob as penas da lei estarem corretos os dados cadastrais fornecidos no REQUERIMENTO DE MATRÍCULA, ',0,-1);
  ppRichView1.RichView.AddNL('obrigando-se a comunicar à UNOESTE qualquer alteração em até, no máximo, 30 dias da mesma.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA DÉCIMA-QUARTA. ',1,0);
  ppRichView1.RichView.AddNL('Após o prazo regulamentar de cada curso, independentemente do modelo ou plano de pagamento escolhido, é facultado à UNOESTE ',0,-1);
  ppRichView1.RichView.AddNL('cobrar a parte pelas atividades de ensino e pesquisa prestadas e/ou considerar períodos de rematrícula adicionais, ',0,-1);
  ppRichView1.RichView.AddNL('todos mediante aditivo contratual até o término ou conclusão do curso pelo ALUNO(A).',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA DÉCIMA-QUINTA. ',1,0);
  ppRichView1.RichView.AddNL('Caso ALUNO(A) venha a se afastar temporariamente de suas atividades acadêmicas, ',0,-1);
  ppRichView1.RichView.AddNL('por instrumento de trancamento ou qualquer outro mecanismo previsto nos respectivos regulamentos de curso, ',0,-1);
  ppRichView1.RichView.AddNL('o seu retorno dar-se-á somente por meio da efetivação de rematrícula, valendo-se as condições comerciais e financeiras vigentes pela UNOESTE do momento do retorno.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL('CLÁUSULA DÉCIMA-SEXTA. ',1,0);
  ppRichView1.RichView.AddNL('Para dirimir dúvidas e controvérsias decorrentes deste contrato fica eleito pelos contratantes o foro da Comarca de Presidente Prudente/SP.',0,-1);
  ppRichView1.RichView.AddNL(' ',0,0);
  ppRichView1.RichView.AddNL(' ',0,0);
  DecodeDate(QContr['con_data'],vano,vmes,vdia);
  ppRichView1.RichView.AddNL('Presidente  Prudente(SP),  '+StrZero(vdia,2)+'  de  '+Trata_Texto(Mes[vmes])+'  de  '+IntToStr(vano)+'.',0,0);

  LContrato.Caption:='Nº Contrato : '+StrZero(QContr['con_seq'],4);
//  LCidade.Caption:='Presidente  Prudente(SP),  '+StrZero(vdia,2)+'  de  '+Trata_Texto(Mes[vmes])+'  de  '+IntToStr(vano)+'.';
  ppRichView1.RichView.Format;

  Texto:=TStringList.Create;
  Texto.Clear;

  Texto.Add(LRA.Caption);
  Texto.Add('CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS');
  Texto.Add(LCurso.Caption);
  Texto.Add(LPeriodo.Caption);
  Texto.Add(LContrato.Caption);
  Texto.Add('');
  Texto.Add('Pelo presente instrumento particular de CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS, de um lado a '+
            'ASSOCIAÇÃO PRUDENTINA DE EDUCAÇÃO E CULTURA - APEC, mantenedora da UNIVERSIDADE DO OESTE PAULISTA - UNOESTE'+
            ', pessoa jurídica de direito privado, inscrita no CNPJ/MF sob nº 44.860.740/0001-73, sediada na cidade de '+
            'Presidente Prudente/SP à Rua José Bongiovani nº 700, cidade universitária, CEP 19050-900, fone/fax (18) 3229-1000 ramal 1010, '+
            'neste ato representado legalmente por seu Diretor Geral, AUGUSTO CESAR DE OLIVEIRA LIMA, CPF 778.941.548-49'+
            ', doravante denominada de UNOESTE, e de outro, o aluno (a) ao final qualificado (a) e/ou seu representante legal,'+QContrato['pes_nome']+
            ', '+LowerCase(NULLToSpace(QContrato['nac_descmasc']))+'(a), '+estciv+', '+NULLToSpace(QContrato['ins_profissao'])+
            ', inscrito(a) regularmente no CPF/MF sob nº '+cpf+', portador(a) do RG/SSP-'+NULLToSpace(QContrato['pes_estexp'])+
            ' de nº '+NULLToSpace(QContrato['pes_rg'])+', residente e domiciliado(a) à '+rua+', '+bairro+', município de '+municipio+
            ', Estado '+estado+', CEP '+cep+email+telefones+', doravante denominado ALUNO(A), têm justo e contratado o seguinte:');

  Texto.Add('');
  Texto.Add('CLÁUSULA PRIMEIRA. O presente contrato é celebrado com respaldo legal dos artigos 205, 206, 207 e 209 da Constituição Federal; '+
            'Artigos 43 e seguintes da Lei 9.394/96 - LDB e nos termos da Lei nº 8.078/90.');
  Texto.Add('');
  If vmesini <= 6
  Then Texto.Add('CLÁUSULA SEGUNDA. Por força do presente instrumento, a UNOESTE obriga-se a ministrar o curso denominado '+NULLToSpace(QCurso['cur_nome'])+
                 ', por meio de aulas e demais atividade curriculares ao ALUNO(A) de acordo com o plano de ensino para o período '+
                 'compreendido entre o mês de '+Mes[vmesini]+' de '+IntToStr(vanoini)+' e o mês de '+Mes[vmesfim]+
                 ' de '+IntToStr(vanofim)+', o qual se encontra à disposição do ALUNO no site http://www.unoeste.br, '+
                 'ou na Secretaria Geral de Pós-Graduação Stricto Sensu vinculada à Pró-Reitoria de Pesquisa e Pós-Graduação - PRPPG da UNOESTE, '+
                 'em regime de semestralidade letiva, pelo que o presente contrato vincula as partes para o 1º semestre de '+IntToStr(vanoini)+
                 ', dependendo os demais períodos de rematrícula mediante aditivo contratual.')
  Else Texto.Add('CLÁUSULA SEGUNDA. Por força do presente instrumento, a UNOESTE obriga-se a ministrar o curso denominado '+NULLToSpace(QCurso['cur_nome'])+
                 ', por meio de aulas e demais atividade curriculares ao ALUNO(A) de acordo com o plano de ensino para o período '+
                 'compreendido entre o mês de '+Mes[vmesini]+' de '+IntToStr(vanoini)+' e o mês de '+Mes[vmesfim]+
                 ' de '+IntToStr(vanofim)+', o qual se encontra à disposição do ALUNO no site http://www.unoeste.br, '+
                 'ou na Secretaria Geral de Pós-Graduação Stricto Sensu vinculada à Pró-Reitoria de Pesquisa e Pós-Graduação - PRPPG da UNOESTE, '+
                 'em regime de semestralidade letiva, pelo que o presente contrato vincula as partes para o 2º semestre de '+IntToStr(vanoini)+
                 ', dependendo os demais períodos de rematrícula mediante aditivo contratual.');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - O ALUNO fica devidamente cientificado que a prestação dos serviços educacionais é contratada por semestre letivo e que a rematrícula, '+
            'a cada semestre, é ato indispensável que estabelece o vínculo entre as partes.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - O não pagamento de qualquer das mensalidades na data de vencimento implicará na imediata e automática constituição do ALUNO(A) em mora, '+
            'independentemente de interpelação judicial ou extrajudicial para tal fim, ficando facultado à CONTRATADA não renovar a matrícula do aluno em débito, '+
            'nos termos do artigo 5º, da lei 9.870/1999.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - A rematrícula não será realizada se houver dívidas do ALUNO(A) perante a CONTRATADA, ainda que proveniente de contrato ou aditivo anterior, '+
            'débitos referentes a outros serviços, ou mesmo de relação extracontratual.');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - As rematrículas podem ser feitas por meio físico (papel) ou por meio eletrônico. Por meio eletrônico, a rematrícula será efetuada mediante a '+
            'utilização de senha eletrônica pessoal (código secreto previamente convencionado entre as partes como forma de reconhecimento), cadastrada junto à Universidade. '+
            'Assim, o ALUNO(A) desde já, para todos os efeitos legais, reconhece como válidas e verdadeiras as operações assim realizadas, '+
            'sendo as senhas de uso pessoal e intransferível e não devem ser repassadas a terceiros. A Universidade não se responsabiliza por eventuais prejuízos '+
            'decorrentes da quebra de sigilo das senhas eletrônicas decorrentes de manipulação ou controle inadequado por parte do ALUNO(A).');
  Texto.Add('');
  Texto.Add('CLÁUSULA TERCEIRA. As aulas serão ministradas nas dependências da UNOESTE, ou em outros locais pela mesma indicada, em dias e horários estipulados no calendário escolar.');
  Texto.Add('');
  Texto.Add('CLÁUSULA QUARTA. A matrícula do ALUNO(A) formalizar-se-á junto à UNOESTE, após a entrega do presente instrumento devidamente assinado e da FICHA DE INSCRIÇÃO DO CANDIDATO, '+
            'que fica desde logo fazendo parte integrante do presente, além dos documentos abaixo relacionados que deverão ser apresentados no original '+
            'para autenticação presencial da cópia, dependendo ainda da análise do currículo do mesmo, e, efetiva-se pelo pagamento da primeira mensalidade, '+
            'conforme cláusula sexta e, observando-se o prazo de inscrição.');
  Texto.Add('a) Currículum Vitae / Curriculum Lattes - documentado;');
  Texto.Add('b) Cópia do Diploma ou Certificado de conclusão de Graduação (Bacharelado ou Licenciatura Plena);');
  Texto.Add('c) Cópia do Diploma ou Certificado de conclusão do Curso de Mestrado (para o Doutorado)');
  Texto.Add('d) Cópia do Histórico Escolar do Curso de Graduação;');
  Texto.Add('e) Cópia do Histórico Escolar do Curso de Mestrado (para o Doutorado);');
  Texto.Add('f) Cópia do CPF');
  Texto.Add('g) Cópia do RG');
  Texto.Add('h) 02 fotos 3x4 recentes;');
  Texto.Add('');
  Texto.Add('Certificados de conclusão somente serão aceitos, com a entrega do protocolo de requerimento do diploma.');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - A falta do preenchimento de qualquer dos requisitos contidos no presente contrato isenta a UNOESTE de qualquer vinculação com o ALUNO(A).');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - A tolerância de atraso na entrega da documentação não implica na sua dispensa, '+
            'ficando o Aluno desde já ciente de que a apresentação da documentação exigida é pressuposto para obtenção do certificado de conclusão, diploma e titulação.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - O ALUNO(A) declara que se responsabiliza, sob as penas da lei, que autentica a veracidade dos documentos ali especificados que foram por ele entregues.');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - É CONDIÇÃO DE VALIDADE DA MATRÍCULA NO CURSO DE PÓS-GRADUAÇÃO STRICTU SENSU OBJETO DESTE CONTRATO, '+
            'A CONFIRMAÇÃO DA CONCLUSÃO DO CURSO DE GRADUAÇÃO PELO PRETENSO ALUNO(A), '+
            'MEDIANTE APRESENTAÇÃO DO CERTIFICADO DE CONCLUSÃO DE CURSO GRADUAÇÃO OU DIPLOMA DEVIDAMENTE EMITIDOS PELA INSTITUIÇÃO DE ENSINO RESPONSÁVEL.');
  Texto.Add('');
  Texto.Add('CLÁUSULA QUINTA. É de inteira responsabilidade da UNOESTE o planejamento e a prestação dos serviços de ensino e pesquisa, fixação do currículo, '+
            'com a respectiva carga horária, designação de professores, orientação didática, bem como determinação de datas de aproveitamento, '+
            'além de outras providências que as atividades docentes e discentes exigirem, a exclusivo critério da mesma, tudo de acordo com a legislação vigente, sem qualquer ingerência do ALUNO(A).');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - As aulas serão ministradas nas salas de aula ou locais indicados pela CONTRATADA, tendo em vista a natureza do conteúdo e a técnica pedagógica.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - O ALUNO(A) se declara ciente e manifesta seu aceite que as disciplinas integrantes da grade curricular do curso contratado poderão ser ofertadas na modalidade semipresencial, '+
            'de acordo com o artigo 81, da lei 9.394/96 c/c a Portaria MEC MEC N- 4.059/2004, nos limites desta.');
  Texto.Add('');
  Texto.Add('CLÁUSULA SEXTA. O ALUNO(A) declara conhecer e obriga-se a acolher o Regimento Interno da Unoeste, as Normas Financeiras, o Regimento da Pós-Graduação '+
            'e demais obrigações constantes na legislação aplicável à área de ensino superior de pós-graduação e, ainda, as emanadas de outras fontes legais, '+
            'desde que regulem supletivamente a matéria, bem como eventuais decisões da UNOESTE inerentes à espécie, as quais se integram reciprocamente.');
  Texto.Add('');
  Texto.Add('CLÁUSULA SÉTIMA. A presente contratação implica disponibilização dos serviços ao ALUNO(A), obrigando-se ao pagamento da totalidade da mesma. '+
            'Pelos serviços a serem prestados, o ALUNO(A) obriga-se a pagar o valor abaixo indicado, de acordo com o curso em que está matriculado, da forma a seguir especificada:');
  Texto.Add('a) Curso : '+(NULLToSpace(QCurso['cur_nome'])));
  If QPlanosPagto['plp_nparcelas'] = 1
  Then
   Begin
     Texto.Add('b) Valor de contrato de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrtotal'])+' ('+Extenso(QPlanosPagto['plp_vrtotal'])+')'+
               ', sendo que este valor indicado será pago em 01 (UMA) parcela única, no valor de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+
               ' ('+Extenso(QPlanosPagto['plp_vrparcela'])+').');
   End
  Else
   If QPlanosPagto['plp_vrmatricula'] = QPlanosPagto['plp_vrparcela']
   Then
    Begin
      Texto.Add('b) Valor de contrato de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrtotal'])+' ('+Extenso(QPlanosPagto['plp_vrtotal'])+')'+
                ', sendo que este valor indicado será pago em '+StrZero(QPlanosPagto['plp_nparcelas'],2)+' ('+Trim(Exts(QPlanosPagto['plp_nparcelas']))+
                ') parcelas mensais, iguais e sucessivas, vincendas todo dia '+StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+' de cada mês calendário, no valor de '+
                'R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.');
    End
   Else
    Begin
      Texto.Add('b) Valor de contrato de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrtotal'])+' ('+Extenso(QPlanosPagto['plp_vrtotal'])+')'+
                ', sendo que este valor indicado será pago em 01 (UMA) parcela no valor de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrmatricula'])+
                ' ('+Extenso(QPlanosPagto['plp_vrmatricula'])+') referente a matrícula, e '+StrZero(QPlanosPagto['plp_nparcelas'] - 1,2)+
                ' ('+Trim(Exts(QPlanosPagto['plp_nparcelas'] - 1))+') parcelas mensais, iguais e sucessivas, vincendas todo dia '+StrZero(NULLToZero(QInscrito['ins_diavencto']),2)+
                ' de cada mês calendário, no valor de R$ '+FormatFloat('###,##0.00',QPlanosPagto['plp_vrparcela'])+' ('+Extenso(QPlanosPagto['plp_vrparcela'])+') cada uma.');
    End;

  Texto.Add('');
  Texto.Add('Parágrafo primeiro - Quaisquer pagamentos vinculados ao presente instrumento efetuados em cheque apenas serão considerados quitados após sua efetiva compensação, '+
            'ainda que tal condição não conste do recibo, eis que recebidos em caráter pro solvendo.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - Na hipótese de a UNOESTE aceitar pagamentos antecipados, estes não quitarão eventuais acréscimos que venham a ser posteriormente apurados.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - A quitação de parcela posterior não implica a quitação das anteriores, permanecendo com o ALUNO(A) o ônus da prova de seus pagamentos.');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - Havendo cheques que não tenham sido regularmente compensados, o débito restará em aberto e apenas poderá ser efetuada a quitação destes, '+
            'bem como o pagamento subsequente, em dinheiro (espécie), ou cheque administrativo.');
  Texto.Add('');
  Texto.Add('Parágrafo quinto - Não será considerado ALUNO(A) aquele cuja matrícula não houver sido efetuada em conformidade com o presente contrato, '+
            'o que leva a inexistência de relação de ensino entre as partes, sendo vedado ao mesmo assistir aula e/ou frequentar as dependências da UNOESTE.');
  Texto.Add('');
  Texto.Add('Parágrafo sexto - Em caso de pagamentos mensais efetuados até o dia 06 de cada mês correspondente ao vencimento, será concedido ao ALUNO(A) um desconto especial '+
            'de pontualidade de 2% (dois por cento). Esta condição incide apenas nos casos do ALUNO(A) que efetuam pagamento integral, '+
            'deixando de valer para aquele ALUNO(A) que já possui algum tipo de benefício por desconto, bolsa ou outro qualquer. Tal pagamento, entretanto, '+
            'não implicará de nenhuma forma quitação de eventuais acréscimos que venham a ser posteriormente apurados.');
  Texto.Add('');
  Texto.Add('CLÁUSULA OITAVA. Na hipótese de atraso do pagamento, o valor devido será acrescido de 2% (dois por cento) de multa e o valor será corrigido monetariamente '+
            'de acordo com o índice de variação do IGP-M/FGV, sem prejuízo de acréscimo de juros de mora à razão de 0,07% (zero vírgula zero sete por cento) '+
            'para cada dia de atraso, até o dia do pagamento.');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - O ALUNO(A) fica obrigado, após o pagamento da matricula, a emitir o boleto da mensalidade pelo Sistema Acadêmico, '+
            'ou deverá efetuar o referido pagamento junto à Tesouraria da UNOESTE, não se considerando a falta de recebimento do boleto como escusa pela mora no adimplemento da obrigação.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - Em caso de inadimplência, a UNOESTE poderá optar: ');
  Texto.Add('a) pela rescisão contratual, independente da exigibilidade do débito vencido e do devido no mês da efetivação;');
  Texto.Add('b) pela emissão de Letra de Câmbio, a ser sacada contra o ALUNO(A), pelo valor da(s) parcela(s) vencida(s) acrescida(s) das penalidades acima estabelecidas;');
  Texto.Add('c) a falta do pagamento de duas parcelas, consecutivas ou não, autoriza a UNOESTE a inscrever o ALUNO(A), como inadimplente, em cadastros de proteção ao crédito.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - Na hipótese de a UNOESTE ser obrigada a efetuar cobrança de seus créditos via advogado, o devedor ficará sujeito ao pagamento de honorários de advogado, '+
            'a razão de 10% (dez por cento), se extrajudicial, e 20% (vinte por cento), se judicial.');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - A ausência do ALUNO(A) às aulas, seja por que motivo for, não o isentará do pagamento das mensalidades e tampouco dar-lhe-á direito à restituição das parcelas pagas.');
  Texto.Add('');
  Texto.Add('CLÁUSULA NONA. Os valores previstos na cláusula sétima incluem exclusivamente a prestação de serviços decorrentes do currículo acadêmico regular. '+
            'Todas as demais atividades prestadas pela UNOESTE serão cobradas a parte, e as atividades extracurriculares também terão seu valor fixado à parte pela UNOESTE, '+
            'sendo certo que não terão caráter obrigatório. Igualmente, serviços individualizados, como segunda via de documentos, declarações, atestados, carteirinha de estudante, '+
            'etc. não estão incluídos no valor da mensalidade e serão cobrados a parte.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA. As partes declaram que os valores acima indicados foram calculados de acordo com a atual situação econômica vigente no país, '+
            'representando o equilíbrio econômico da época da celebração do contrato. Assim, a fim de manter tal equilíbrio os valores das parcelas mensais '+
            'poderão ser alterados no caso de comprovado aumento de custos e/ou redução das receitas da UNOESTE.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-PRIMEIRA. O presente contrato vincula as partes para o período mencionado na cláusula primeira, e poderá ser rescindido nas seguintes hipóteses:');
  Texto.Add('a) pelo ALUNO(A), por desistência formal;');
  Texto.Add('b) pela UNOESTE:');
  Texto.Add('b.1) por desligamento nos termos do Regimento Escolar;');
  Texto.Add('b.2) por inadimplência.');
  Texto.Add('');
  Texto.Add('Parágrafo primeiro - É facultado à UNOESTE a rescisão do presente instrumento por insuficiência de alunos matriculados, até a data de início do curso, '+
            'hipótese em que será restituído ao ALUNO(A) a integra do valor por ele pago.');
  Texto.Add('');
  Texto.Add('Parágrafo segundo - Caso o ALUNO(A) venha a rescindir o contrato entre 30 e 180 dias a partir da adesão ao mesmo, pagará o valor da mensalidade do mês corrente '+
            '(mês que o aluno vier a solicitar o cancelamento) e a fim de manter o equilíbrio econômico e financeiro da UNOESTE, '+
            'será aplicada multa contratual no valor de 10% (dez por cento) calculado sobre o valor total do contrato.');
  Texto.Add('');
  Texto.Add('Parágrafo terceiro - Caso o ALUNO(A)  venha a rescindir este instrumento após o prazo de seis meses da data de assinatura do contrato, '+
            'pagará o valor da mensalidade do mês corrente (mês em que o aluno vier a solicitar o cancelamento).');
  Texto.Add('');
  Texto.Add('Parágrafo quarto - O ALUNO(A) que antes do início das aulas requerer desistência ou cancelamento da matrícula receberá a devolução de 70% (setenta por cento) do valor pago, '+
            'no prazo de 30 (trinta) dias após a formalização do respectivo pedido junto à Secretaria da Pós-Graduação.');
  Texto.Add('');
  Texto.Add('Parágrafo quinto - Após o início das aulas são devidas as mensalidades que se vencerem até o mês em que for requerido o cancelamento, uma vez que os serviços ficam disponibilizados.');
  Texto.Add('');
  Texto.Add('Parágrafo sexto - O cancelamento deverá ser sempre requerido formalmente junto à Secretaria Geral de Pós-Graduação Stricto Sensu da UNOESTE, '+
            'sob pena de manterem-se as obrigações do ALUNO(A), especialmente as referentes ao pagamento do valor ora contratado.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-SEGUNDA. O ALUNO(A) deverá tratar com urbanidade a todos, bem como acatar todas as instruções, disposições, recomendações e avisos acerca do uso e manuseio de máquinas, '+
            'ferramentas, aparelhos e instrumentos  eventualmente utilizados em laboratórios e demais estruturas oferecidas pela UNOESTE no horário escolar e fora dele, '+
            'sendo de sua exclusiva responsabilidade a reparação de quaisquer danos causados à UNOESTE, seus diretores, professores, funcionários, prepostos em geral, ou a terceiros.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-TERCEIRA. O ALUNO(A) declara sob as penas da lei estarem corretos os dados cadastrais fornecidos no REQUERIMENTO DE MATRÍCULA, '+
            'obrigando-se a comunicar à UNOESTE qualquer alteração em até, no máximo, 30 dias da mesma.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-QUARTA. Após o prazo regulamentar de cada curso, independentemente do modelo ou plano de pagamento escolhido, é facultado à UNOESTE '+
            'cobrar a parte pelas atividades de ensino e pesquisa prestadas e/ou considerar períodos de rematrícula adicionais, '+
            'todos mediante aditivo contratual até o término ou conclusão do curso pelo ALUNO(A).');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-QUINTA. Caso ALUNO(A) venha a se afastar temporariamente de suas atividades acadêmicas, '+
            'por instrumento de trancamento ou qualquer outro mecanismo previsto nos respectivos regulamentos de curso, '+
            'o seu retorno dar-se-á somente por meio da efetivação de rematrícula, valendo-se as condições comerciais e financeiras vigentes pela UNOESTE do momento do retorno.');
  Texto.Add('');
  Texto.Add('CLÁUSULA DÉCIMA-SEXTA. Para dirimir dúvidas e controvérsias decorrentes deste contrato fica eleito pelos contratantes o foro da Comarca de Presidente Prudente/SP.');
  Texto.Add('');
  Texto.Add('');
  DecodeDate(QContr['con_data'],vano,vmes,vdia);
  Texto.Add('Presidente  Prudente(SP),  '+StrZero(vdia,2)+'  de  '+Trata_Texto(Mes[vmes])+'  de  '+IntToStr(vano)+'.');
end;

end.
