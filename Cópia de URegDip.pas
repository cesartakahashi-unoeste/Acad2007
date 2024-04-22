unit URegDip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RxLookup, Mask, DBTables, ppCache,
  ppClass, ppBands, ppComm, ppRelatv, ppProd, ppReport, ppPrnabl, ppStrtch,
  ppRichTx, ppModule, daDatMod, ppDB, ppDBPipe, ppCtrls, DBCtrls,
  ppViewr, ppSubRpt, ppRegion, jpeg, rxMemTable, rxToolEdit,
  rxCurrEdit, Variants, ppBarCode2D, ppParameter, DB, ppRichView, RVStyle,
  ppDesignLayer, ppPDFADevice, ppArchiv, ppDBBDE, ppDsgnDB, ppEndUsr,
  gtXportIntf, gtRBXportIntf, gtClasses3, gtCstDocEng, gtCstPlnEng, gtCstPDFEng,
  gtExPDFEng, gtPDFEng;

type
  TFRegDip = class(TForm)
    Panel1: TPanel;
    SBLocAlu: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    LNomAlu: TLabel;
    LNomHab: TLabel;
    LCopias: TLabel;
    MERA: TCurrencyEdit;
    DBLCBHab: TRxDBLookupCombo;
    RGConsulta: TRadioGroup;
    MECopias: TMaskEdit;
    Panel2: TPanel;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    B_Finaliza: TBitBtn;
    QConsAlu: TQuery;
    Qconscur: TQuery;
    QConsHab: TQuery;
    Qconsccl: TQuery;
    RDiploma: TppReport;
    ppDetailBand1: TppDetailBand;
    ppRichText3: TppRichText;
    RTCidade: TppRichText;
    DSConsAlu: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    RTTitulo: TppRichText;
    QCurso: TQuery;
    MTHab: TMemoryTable;
    MTHabhab_Codigo: TSmallintField;
    MTHabHab_Nome: TStringField;
    DSHab: TDataSource;
    RTAluno: TppRichText;
    ppRichText2: TppRichText;
    ppRichText4: TppRichText;
    QLocalidade: TQuery;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ENome: TEdit;
    Label4: TLabel;
    LTipDoc: TLabel;
    ERG: TEdit;
    Label6: TLabel;
    EEstExp: TEdit;
    DBLCNacional: TDBLookupComboBox;
    Label7: TLabel;
    QNacional: TQuery;
    DSNacional: TDataSource;
    DEDatNas: TDateEdit;
    Label8: TLabel;
    Label26: TLabel;
    ECidade: TEdit;
    DBLCCidade: TDBLookupComboBox;
    DSLocalidade: TDataSource;
    Label9: TLabel;
    DEConclusao: TDateEdit;
    Label10: TLabel;
    DEExped: TDateEdit;
    QPessoa: TQuery;
    QAluHab: TQuery;
    Label11: TLabel;
    ppRichText5: TppRichText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppRichText6: TppRichText;
    ppRichText7: TppRichText;
    ppRichText8: TppRichText;
    Label12: TLabel;
    ENomeImp: TEdit;
    QFunc: TQuery;
    SPACursar: TStoredProc;
    SPACursarexpression: TIntegerField;
    SPACursarexpression_1: TSmallintField;
    SPACursarexpression_2: TIntegerField;
    SPACursarexpression_3: TSmallintField;
    SPACursarexpression_4: TSmallintField;
    SPACursarexpression_5: TStringField;
    SPACursarexpression_6: TSmallintField;
    SPACursarexpression_7: TSmallintField;
    SPACursarexpression_8: TSmallintField;
    SPACursarexpression_9: TStringField;
    RGFormacao: TRadioGroup;
    CB2Via: TCheckBox;
    RT2Via: TppRichText;
    ppRichView1: TppRichView;
    ppRichView2: TppRichView;
    SPConcluinte: TStoredProc;
    QAux: TQuery;
    QGraLet: TQuery;
    Label13: TLabel;
    ECivil: TEdit;
    Label14: TLabel;
    ECivilImp: TEdit;
    ppRichText1: TppRichText;
    Label5: TLabel;
    EOrgExp: TEdit;
    ppRegion2: TppRegion;
    ppRichView3: TppRichView;
    ppRegion3: TppRegion;
    ppLabel1: TppLabel;
    LNome: TppLabel;
    LGrau: TppLabel;
    LCurso2: TppLabel;
    ppLabel2: TppLabel;
    Label15: TLabel;
    EProc: TEdit;
    Label16: TLabel;
    EReg: TEdit;
    Label17: TLabel;
    ELivro: TEdit;
    EFolha: TEdit;
    Label18: TLabel;
    QILivDip: TQuery;
    QNro: TQuery;
    QLivro: TQuery;
    Label19: TLabel;
    DERegistro: TDateEdit;
    Label20: TLabel;
    CENroDipl: TCurrencyEdit;
    QLivFol: TQuery;
    RGImp: TRadioGroup;
    RDiplomaP: TppReport;
    ppDetailBand3: TppDetailBand;
    ppRichView2P: TppRichView;
    RT2ViaP: TppRichText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    RPedP: TppRegion;
    ppShape4: TppShape;
    RVPedP: TppRichView;
    ppRegion2P: TppRegion;
    ppRichView3P: TppRichView;
    ppRegion6: TppRegion;
    ppDetailBand4: TppDetailBand;
    ppRegion4: TppRegion;
    ppRichView4: TppRichView;
    ppLine2: TppLine;
    ppRegion5: TppRegion;
    ppRichView4P: TppRichView;
    ppLine3: TppLine;
    RRegistro: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppDetailBand5: TppDetailBand;
    ppLabel13: TppLabel;
    ppRichView5: TppRichView;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppRegion7: TppRegion;
    ppLine4: TppLine;
    LResp: TppLabel;
    LCargo: TppLabel;
    LCPF: TppLabel;
    ppLabel4: TppLabel;
    LLivro: TppLabel;
    ppShape1: TppShape;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    LNomeCivil: TppLabel;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    LNatural: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    LNacional: TppLabel;
    LRG: TppLabel;
    ppLine13: TppLine;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    LProc: TppLabel;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLabel11: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppDBText9: TppDBText;
    ppLabel15: TppLabel;
    ppDBText10: TppDBText;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    LNomReg: TppLabel;
    LCPFReg: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    Memo1: TMemo;
    Label1: TLabel;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppRichView6: TppRichView;
    CECPF: TCurrencyEdit;
    Label21: TLabel;
    ppLabel32: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel33: TppLabel;
    RTAutRec: TppRichText;
    RTRenov: TppRichText;
    RGSexo: TRadioGroup;
    QTpDoc: TQuery;
    DSTpDoc: TDataSource;
    DBLCBTpDoc: TDBLookupComboBox;
    LTpDoc: TLabel;
    LNomCur: TppLabel;
    RPsi: TppRegion;
    SPsi: TppShape;
    LUniv: TppLabel;
    RTPsi: TppRichText;
    RVPsi: TppRichView;
    RPed: TppRegion;
    ppShape5: TppShape;
    RVPed: TppRichView;
    RTur: TppRegion;
    STur: TppShape;
    RVTur: TppRichView;
    LinTur: TppLine;
    RTurP: TppRegion;
    STurP: TppShape;
    RVTurP: TppRichView;
    LinTurP: TppLine;
    RPsiP: TppRegion;
    SPsiP: TppShape;
    LUnivP: TppLabel;
    RTPsiP: TppRichText;
    RVPsiP: TppRichView;
    RGDefinitivo: TRadioGroup;
    ppPageStyle1: TppPageStyle;
    ppImage2: TppImage;
    ppImage: TppImage;
    RVValidacao: TppRichView;
    RVTitulo: TppRichView;
    RVNacionalidade: TppRichView;
    RVCidade: TppRichView;
    ppRichView1P: TppRichView;
    gtPDFEngine1: TgtPDFEngine;
    gtRBExportInterface1: TgtRBExportInterface;
    ppArchiveReader1: TppArchiveReader;
    procedure MERAEnter(Sender: TObject);
    procedure MERAExit(Sender: TObject);
    procedure DBLCBHabCloseUp(Sender: TObject);
    procedure DBLCBHabDropDown(Sender: TObject);
    procedure DBLCBHabExit(Sender: TObject);
    procedure MECopiasEnter(Sender: TObject);
    procedure MECopiasExit(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure b_okClick(Sender: TObject);
    procedure b_okExit(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure B_FinalizaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCNacionalDropDown(Sender: TObject);
    procedure DBLCNacionalCloseUp(Sender: TObject);
    procedure ECidadeExit(Sender: TObject);
    procedure DBLCCidadeClick(Sender: TObject);
    procedure ENomeExit(Sender: TObject);
    procedure ERGExit(Sender: TObject);
    procedure EEstExpExit(Sender: TObject);
    procedure DEDatNasExit(Sender: TObject);
    procedure DEConclusaoExit(Sender: TObject);
    procedure DEExpedExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SBLocAluClick(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure ENomeImpExit(Sender: TObject);
    procedure RGFormacaoExit(Sender: TObject);
    procedure ECivilExit(Sender: TObject);
    procedure ECivilImpExit(Sender: TObject);
    procedure DERegistroExit(Sender: TObject);
    procedure CENroDiplExit(Sender: TObject);
    procedure RGImpExit(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure CECPFExit(Sender: TObject);
    procedure DBLCNacionalExit(Sender: TObject);
    procedure DBLCBTpDocExit(Sender: TObject);
    procedure ppTitleBand2BeforePrint(Sender: TObject);
    procedure ppImagePrint(Sender: TObject);
    procedure RGConsultaExit(Sender: TObject);
  private
    dtconcl1, dtconcl2, dtcol1, dtcol2:TDateTime;
    Function  Atualiza_Dados:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegDip: TFRegDip;

implementation

Uses UMenupri, UProcs, UConsAlu, QuricolCode, ShlObj;

{$R *.DFM}

Function TFRegDip.Atualiza_Dados:Boolean;
var vdia, vmes, vano:word;
Begin
 Atualiza_Dados:=True;
 Try
   If QILivDip.Eof // registro do diploma
   Then
    Begin
      If MessageDlg('Atenção. Confirma registro do diploma deste aluno ? ',mtConfirmation, [mbYes, mbNo], 0) = mrYes
      Then
       Begin
         Menuprin.Database1.StartTransaction;
         QPessoa.Close;
         QPessoa.ParamByName('nro').AsInteger:=QConsAlu['pes_nro'];
         QPessoa.Open;
         QPessoa.Edit;
         If (Trim(ENome.Text) <> QPessoa['pes_nome']) and (Length(Trim(ENome.Text)) <= 50)
         Then
          Begin
           QPessoa['pes_nome']:=Trim(ENome.Text);
           QPessoa['pes_sacento']:=Tira_Acentos(Trim(ENome.Text));
          End;
         If RGDefinitivo.Visible
         Then
          If RGDefinitivo.ItemIndex = 0
          Then QPessoa['pes_nomedefinitivo']:='S'
          Else QPessoa['pes_nomedefinitivo']:='N';
         If Trim(ECivil.Text) <> NULLToSpace(QPessoa['pes_nomecivil'])
         Then QPessoa['pes_nomecivil']:=Trim(ECivil.Text);
         If RGSexo.ItemIndex + 1 <> QPessoa['pes_sexo']
         Then QPessoa['pes_sexo']:=RGSexo.ItemIndex + 1;
         If (QNacional['nac_codigo'] = Null) or (QNacional['nac_codigo'] = 1) or (QNacional['nac_codigo'] = 9)
         Then
          Begin
            If Trim(ERG.Text) <> QPessoa['pes_rg']
            Then QPessoa['pes_rg']:=Trim(ERG.Text);
          End
         Else
          Begin
            If Trim(ERG.Text) <> QPessoa['pes_docestr']
            Then QPessoa['pes_docestr']:=Trim(ERG.Text);
            If QTpDoc['tde_codigo'] <> QPessoa['tde_codigo']
            Then QPessoa['tde_codigo']:=QTpDoc['tde_codigo'];
          End;
         If Trim(EOrgExp.Text) <> QPessoa['pes_orgexp']
         Then QPessoa['pes_orgexp']:=Trim(EOrgExp.Text);
         If Trim(EEstExp.Text) <> QPessoa['pes_estexp']
         Then QPessoa['pes_estexp']:=Trim(EEstExp.Text);
         If QNacional['nac_codigo'] <> QPessoa['nac_codigo']
         Then QPessoa['nac_codigo']:=QNacional['nac_codigo'];
         If (CECPF.Value <> 0) and (CECPF.Value <> NULLToZero2(QPessoa['pes_cpf']))
         Then QPessoa['pes_cpf']:=CECPF.Value;
         If DEDatNas.Date <> QPessoa['pes_datnas']
         Then QPessoa['pes_datnas']:=DEDatNas.Date;
         If QLocalidade['loc_codigo'] <> QPessoa['pes_locnas']
         Then QPessoa['pes_locnas']:=QLocalidade['loc_codigo'];
         QPessoa.Post;

         QPessoa.Close;
         QPessoa.ParamByName('nro').AsInteger:=QConsAlu['pes_nro'];
         QPessoa.Open;

         DecodeDate(DataSis,vano,vmes,vdia);
         QILivDip.Append;
         QILivDip['alu_ra']:=QConsAlu['alu_ra'];
         QILivDip['hab_codigo']:=qconsccl['hab_codigo'];
         // gera número de registro
         QAux.Close;
         QAux.Sql.Clear;
         QAux.Sql.Add('select max(nrd_numreg) numreg from sca_nroregdiploma');
         QAux.Sql.Add('where nrd_tipo = 0');
         QAux.Open;
         QNro.Close;
         QNro.Sql.Clear;
         QNro.Sql.Add('select * from sca_nroregdiploma');
         QNro.Sql.Add('where nrd_numreg = 0');
         QNro.Open;
         QNro.Append;
         QNro['nrd_numreg']:=NULLToZero(QAux['numreg']) + 1;
         QNro['nrd_tipo']:=0;
         QNro.Post;
         QILivDip['nrd_numreg']:=NULLToZero(QAux['numreg']) + 1;
         QILivDip['nrd_tipo']:=0;
         // gera número do processo
         QAux.Close;
         QAux.Sql.Clear;
         QAux.Sql.Add('select max(npd_numero) numproc from sca_nroprocdipl');
         QAux.Sql.Add('where npd_tipo = 0 and npd_ano =:ano');
         QAux.ParamByName('ano').AsSmallInt:=vano;
         QAux.Open;
         QNro.Close;
         QNro.Sql.Clear;
         QNro.Sql.Add('select * from sca_nroprocdipl');
         QNro.Sql.Add('where npd_numero = 0');
         QNro.Open;
         QNro.Append;
         QNro['npd_numero']:=NULLToZero(QAux['numproc']) + 1;
         QNro['npd_tipo']:=0;
         QNro['npd_ano']:=vano;
         QNro.Post;
         QILivDip['npd_numero']:=NULLToZero(QAux['numproc']) + 1;
         QILivDip['npd_tipo']:=0;
         QILivDip['npd_ano']:=vano;
         // gera número do livro e número da folha
         QLivro.Close;
         QLivro.Sql.Clear;
         QLivro.Sql.Add('select * from sca_livrodiploma');
         QLivro.Sql.Add('where liv_tipo = 0 and liv_dtencerramento is null');
         QLivro.Open;
         If QLivro.Eof
         Then raise EConvertError.Create('Não existe livro em aberto para registro!')
         Else
          Begin
            QAux.Close;
            QAux.Sql.Clear;
            QAux.Sql.Add('select max(ldf_folha) folha from sca_livrodipfol');
            QAux.Sql.Add('where liv_tipo = 0 and liv_numero =:num');
            QAux.ParamByName('num').AsSmallInt:=QLivro['liv_numero'];
            QAux.Open;
            If QLivro['liv_nrofolhas'] = NULLToZero(QAux['folha'])
            Then raise EConvertError.Create('Livro já atingiu o máximo de folhas definido!')
            Else
             Begin
               QLivFol.Close;
               QLivFol.Sql.Clear;
               QLivFol.Sql.Add('select * from sca_livrodipfol');
               QLivFol.Sql.Add('where liv_numero = 0');
               QLivFol.Open;
               QLivFol.Append;
               QLivFol['liv_numero']:=QLivro['liv_numero'];
               QLivFol['liv_tipo']:=0;
               QLivFol['ldf_folha']:=NULLToZero(QAux['folha']) + 1;
               QLivFol.Post;
               QILivDip['liv_numero']:=QLivro['liv_numero'];
               QILivDip['liv_tipo']:=0;
               QILivDip['ldf_folha']:=NULLToZero(QAux['folha']) + 1;
             End;
          End;
         QILivDip['pes_nome']:=QPessoa['pes_nome'];
         If RGDefinitivo.Visible
         Then
          If RGDefinitivo.ItemIndex = 0
          Then QILivDip['pes_nomedefinitivo']:='S'
          Else QILivDip['pes_nomedefinitivo']:='N';
         QILivDip['pes_sacento']:=QPessoa['pes_sacento'];
         QILivDip['pes_datnas']:=QPessoa['pes_datnas'];
         QILivDip['pes_locnas']:=QPessoa['pes_locnas'];
         QILivDip['nac_codigo']:=QPessoa['nac_codigo'];
         If (QNacional['nac_codigo'] = Null) or (QNacional['nac_codigo'] = 1) or (QNacional['nac_codigo'] = 9)
         Then QILivDip['pes_rg']:=QPessoa['pes_rg']
         Else
          Begin
            QILivDip['pes_rg']:=QPessoa['pes_docestr'];
            QILivDip['tde_codigo']:=QPessoa['tde_codigo'];
          End;
         QILivDip['pes_orgexp']:=QPessoa['pes_orgexp'];
         QILivDip['pes_estexp']:=QPessoa['pes_estexp'];
         QILivDip['pes_cpf']:=QPessoa['pes_cpf'];
         QILivDip['pes_sexo']:=QPessoa['pes_sexo'];
         QILivDip['cur_nomediploma']:=QCurso['cur_nomediploma'];
         QILivDip['cur_autndc']:=QCurso['cur_autndc'];
         QILivDip['cur_autdata']:=QCurso['cur_autdata'];

         QAluHab.Close;
         QAluHab.ParambyName('ra').AsFloat:=QConsAlu['alu_ra'];
         QAluHab.ParamByName('codhab').AsInteger:=qconsccl['hab_codigo'];
         QAluHab.Open;
         QAluHab.Edit;
         If DEConclusao.Date <> QAluHab['ahb_conclusao']
         Then QAluHab['ahb_conclusao']:=DEConclusao.Date;
         If DEExped.Date <> QAluHab['ahb_expedicao']
         Then QAluHab['ahb_expedicao']:=DEExped.Date;
         If DERegistro.Date <> QAluHab['ahb_datreg']
         Then QAluHab['ahb_datreg']:=DERegistro.Date;
         If Trim(NULLToSpace(QAluHab['ahb_nrlivro'])) = ''
         Then QAluHab['ahb_nrlivro']:='R-'+FormatFloat('000',QILivDip['liv_numero']);
         If Trim(NULLToSpace(QAluHab['ahb_nrfolha'])) = ''
         Then QAluHab['ahb_nrfolha']:=FormatFloat('000',QILivDip['ldf_folha']);
         QAluHab.Post;

         QILivDip['ahb_conclusao']:=QAluHab['ahb_conclusao'];
         QILivDip['ahb_colacao']:=QAluHab['ahb_colacao'];
         QILivDip['ahb_expedicao']:=QAluHab['ahb_expedicao'];
         QILivDip['ahb_datreg']:=QAluHab['ahb_datreg'];

         If QConsAlu['cur_codigo'] = 13  // Psicologia
         Then
          Begin
            Case StrToInt(DBLCBHab.Value)  of
              1:If QPessoa['pes_sexo'] = 1 // masculino
                Then QILivDip['cur_nomtit']:='Bacharel em Psicologia'
                Else QILivDip['cur_nomtit']:='Bacharela em Psicologia';
              2:If QPessoa['pes_sexo'] = 1 // masculino
                Then QILivDip['cur_nomtit']:='Licenciado'
                Else QILivDip['cur_nomtit']:='Licenciada';
              3:If QPessoa['pes_sexo'] = 1 // masculino
                Then QILivDip['cur_nomtit']:='Psicólogo'
                Else QILivDip['cur_nomtit']:='Psicóloga';
            End;
          End
         Else
          If ((QCurso['fac_codigo'] = 1) and (QCurso['cur_nomtit'] = Null)) or (QCurso['cur_codigo'] = 132) // Faclepp sem título definido ou Educação Física
          Then
           Begin
             If QPessoa['pes_sexo'] = 1 // masculino
             Then QILivDip['cur_nomtit']:='Licenciado'
             Else QILivDip['cur_nomtit']:='Licenciada';
           End
          Else
           If QPessoa['pes_sexo'] = 1 // masculino
           Then QILivDip['cur_nomtit']:=QCurso['cur_nomtit']
           Else QILivDip['cur_nomtit']:=QCurso['cur_nomtitfem'];

         QAux.Close;
         QAux.Sql.Clear;
         QAux.Sql.Add('select * from crp_empresas');
         QAux.Sql.Add('where emp_codigo = 1'); // verificar se eu devo gravar sempre os dados da APEC - Presidente Prudente
         QAux.Open;
         QILivDip['emp_nome']:=QAux['emp_nome'];
         QILivDip['emp_cgc']:=QAux['emp_cgc'];
         QILivDip['fun_responsavel']:=45496; // Nair
         QILivDip['fun_expedicao']:=vcodusu;
         QILivDip['fun_registrado']:=vcodusu;
         QILivDip['ahb_codgra']:=QAluHab['ahb_codgra'];
         QILivDip['pes_nomecivil']:=QPessoa['pes_nomecivil'];
         QILivDip['pes_sexo']:=QPessoa['pes_sexo'];
         QILivDip['cur_autsecao']:=QCurso['cur_autsecao'];
         QILivDip['cur_autpag']:=QCurso['cur_autpag'];
         QILivDip['cur_nautdou']:=QCurso['cur_nautdou'];
         QILivDip['cur_dataportaria']:=QCurso['cur_dataportaria'];
         QILivDip['cur_autdcp']:=QCurso['cur_autdcp'];
         QILivDip['cur_dtrepublicacao']:=QCurso['cur_dtrepublicacao'];
         QILivDip['cur_orgao']:=QCurso['cur_orgao'];
         QILivDip['cur_artigo']:=QCurso['cur_artigo'];
         QILivDip['cur_nrorenov']:=QCurso['cur_nrorenov'];
         QILivDip['cur_datrenov']:=QCurso['cur_datrenov'];
         QILivDip['cur_renovsecao']:=QCurso['cur_renovsecao'];
         QILivDip['cur_renovpag']:=QCurso['cur_renovpag'];
         QILivDip['cur_dtrenvport']:=QCurso['cur_dtrenvport'];
         QILivDip['cur_orgrenov']:=QCurso['cur_orgrenov'];
         QILivDip['cur_procemec']:=QCurso['cur_procemec'];
         QILivDip['cur_nrenovdou']:=QCurso['cur_nrenovdou'];
         If CENroDipl.Value <> 0
         Then QILivDip['itl_nrodiploma']:=CENroDipl.Value
         Else QILivDip['itl_nrodiploma']:=Null;
         If Trim(Memo1.Text) <> ''
         Then QILivDip['itl_obs']:=Memo1.Text
         Else QILivDip['itl_obs']:=Null;
         QILivDip['cur_codenade']:=QCurso['cur_codenade'];

         QAux.Close;
         QAux.Sql.Clear;
         QAux.Sql.Add('select * from sca_caldias');
         QAux.Sql.Add('where cur_codigo =:codcur and cld_periodo =:ano');
         QAux.ParamByName('codcur').AsSmallInt:=QCurso['cur_codigo'];
         QAux.ParamByName('ano').AsSmallInt:=QConsAlu['alu_anoing'];
         QAux.Open;
         If QConsAlu['alu_seming'] = 1
         Then QILivDip['itl_dtingresso']:=QAux['cld_diaini']
         Else QILivDip['itl_dtingresso']:=QAux['cld_inisem2'];

         If QConsAlu['cur_codigo'] = 13 // psicologia
         Then QILivDip['itl_formacao']:=RGFormacao.ItemIndex;
         QILivDip.Post;

         Menuprin.Database1.Commit;
       End;
    End
   Else
    Begin
      QILivDip.Edit;
      If (QILivDip['itl_dtlimitealt'] <> Null) and (QILivDip['itl_dtlimitealt'] >= Pega_Data)
      Then
       Begin
         If (Trim(ENome.Text) <> QILivDip['pes_nome']) and (Length(Trim(ENome.Text)) <= 50)
         Then
          Begin
           QILivDip['pes_nome']:=Trim(ENome.Text);
           QILivDip['pes_sacento']:=Tira_Acentos(Trim(ENome.Text));
          End;
         If RGDefinitivo.Visible
         Then
          If RGDefinitivo.ItemIndex = 0
          Then QILivDip['pes_nomedefinitivo']:='S'
          Else QILivDip['pes_nomedefinitivo']:='N';
         If Trim(ECivil.Text) <> NULLToSpace(QILivDip['pes_nomecivil'])
         Then QILivDip['pes_nomecivil']:=Trim(ECivil.Text);
         If RGSexo.ItemIndex + 1 <> QILivDip['pes_sexo']
         Then
          Begin
            QILivDip['pes_sexo']:=RGSexo.ItemIndex + 1;
            If QConsAlu['cur_codigo'] = 13  // Psicologia
            Then
             Begin
               Case StrToInt(DBLCBHab.Value)  of
                 1:If QILivDip['pes_sexo'] = 1 // masculino
                   Then QILivDip['cur_nomtit']:='Bacharel em Psicologia'
                   Else QILivDip['cur_nomtit']:='Bacharela em Psicologia';
                 2:If QILivDip['pes_sexo'] = 1 // masculino
                   Then QILivDip['cur_nomtit']:='Licenciado'
                   Else QILivDip['cur_nomtit']:='Licenciada';
                 3:If QILivDip['pes_sexo'] = 1 // masculino
                   Then QILivDip['cur_nomtit']:='Psicólogo'
                   Else QILivDip['cur_nomtit']:='Psicóloga';
               End;
             End
            Else
             If ((QCurso['fac_codigo'] = 1) and (QCurso['cur_nomtit'] = Null)) or (QCurso['cur_codigo'] = 132) // Faclepp sem título definido ou Educação Física
             Then
              Begin
                If QILivDip['pes_sexo'] = 1 // masculino
                Then QILivDip['cur_nomtit']:='Licenciado'
                Else QILivDip['cur_nomtit']:='Licenciada';
              End
             Else
              If QILivDip['pes_sexo'] = 1 // masculino
              Then QILivDip['cur_nomtit']:=QCurso['cur_nomtit']
              Else QILivDip['cur_nomtit']:=QCurso['cur_nomtitfem'];
          End;
         If Trim(ERG.Text) <> QILivDip['pes_rg']
         Then QILivDip['pes_rg']:=Trim(ERG.Text);
         If Trim(EOrgExp.Text) <> QILivDip['pes_orgexp']
         Then QILivDip['pes_orgexp']:=Trim(EOrgExp.Text);
         If Trim(EEstExp.Text) <> QILivDip['pes_estexp']
         Then QILivDip['pes_estexp']:=Trim(EEstExp.Text);
         If QNacional['nac_codigo'] <> QILivDip['nac_codigo']
         Then QILivDip['nac_codigo']:=QNacional['nac_codigo'];

         If (QILivDip['nac_codigo'] <> 1) and (QILivDip['nac_codigo'] <> 9)
         Then
          If QTpDoc['tde_codigo'] <> QILivDip['tde_codigo']
          Then QILivDip['tde_codigo']:=QTpDoc['tde_codigo'];

         If (CECPF.Value <> 0) and (CECPF.Value <> NULLToZero2(QILivDip['pes_cpf']))
         Then QILivDip['pes_cpf']:=CECPF.Value;
         If DEDatNas.Date <> QILivDip['pes_datnas']
         Then QILivDip['pes_datnas']:=DEDatNas.Date;
         If QLocalidade['loc_codigo'] <> QILivDip['pes_locnas']
         Then QILivDip['pes_locnas']:=QLocalidade['loc_codigo'];

         If DEConclusao.Date <> QILivDip['ahb_conclusao']
         Then QILivDip['ahb_conclusao']:=DEConclusao.Date;
         If DEExped.Date <> QILivDip['ahb_expedicao']
         Then QILivDip['ahb_expedicao']:=DEExped.Date;
         If DERegistro.Date <> QILivDip['ahb_datreg']
         Then QILivDip['ahb_datreg']:=DERegistro.Date;
       End;
      If CENroDipl.Value <> 0
      Then
       Begin
         If CENroDipl.Value <> QILivDip['itl_nrodiploma']
         Then QILivDip['itl_nrodiploma']:=CENroDipl.Value;
       End
      Else
       If QILivDip['itl_nrodiploma'] <> Null
       Then QILivDip['itl_nrodiploma']:=Null;
      If Trim(Memo1.Text) <> ''
      Then
       Begin
         If Trim(Memo1.Text) <> NULLToSpace(QILivDip['itl_obs'])
         Then QILivDip['itl_obs']:=Memo1.Text;
       End  
      Else
       If QILivDip['itl_obs'] <> Null
       Then QILivDip['itl_obs']:=Null;
      QILivDip.Post;
    End;

  QConsAlu.Close;
  QConsAlu.Sql.Clear;
  QConsAlu.Sql.Add('select a.alu_ra, a.cur_codigo, nac_descricao, nac_descmasc, a.pes_nro, nac_pais, alu_anoing, alu_seming, i.*, tde_sigla');
  QConsAlu.Sql.Add('from sca_alunos a, sca_itenslivdip i, sca_nacionalidade n, outer crp_tpdocestr t');
  QConsAlu.Sql.Add('where a.alu_ra = i.alu_ra and i.hab_codigo =:hab and i.nac_codigo = n.nac_codigo and i.tde_codigo = t.tde_codigo and a.alu_ra =:ra');
  QConsAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
  QConsAlu.ParamByName('hab').AsSmallInt:=StrToInt(DBLCBHab.Value);
  QConsAlu.Open;
  qconsccl.close;
  qconsccl.parambyname('hab').assmallint:=StrToInt(DBLCBHab.Value);
  qconsccl.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
  qconsccl.open;
 Except
  Atualiza_Dados:=False;
  MenuPrin.Database1.Rollback;
 End;
End;

procedure TFRegDip.MERAEnter(Sender: TObject);
begin
//  Limpa(FRegDip);  // tive que tirar pois estava dando erro quando era executado pela solicitação de serviço
  EProc.Clear;
  EReg.Clear;
  ELivro.Clear;
  EFolha.Clear;
  ENome.Clear;
  ENomeImp.Clear;
  ECivil.Clear;
  ECivilImp.Clear;
  RGSexo.ItemIndex:=-1;
  ERG.Clear;
  EOrgExp.Clear;
  EEstExp.Clear;
  CECPF.Clear;
  DEDatNas.Clear;
  ECidade.Clear;
  DEConclusao.Clear;
  DEExped.Clear;
  DERegistro.Clear;
  CENroDipl.Clear;
  Memo1.Clear;
  SBLocAlu.Enabled:=True;
  LNomAlu.Caption:='';
  LNomHab.Caption:='';
  B_Cancela.Enabled:=True;
  B_Ok.Enabled:=False;
  MTHab.EmptyTable;
  QConsAlu.close;
  ENome.Enabled:=True;
  ECivil.Enabled:=True;
  RGSexo.Enabled:=True;
  ERG.Enabled:=True;
  EOrgExp.Enabled:=True;
  EEstExp.Enabled:=True;
  DBLCNacional.Enabled:=True;
  CECPF.Enabled:=True;
  DEDatNas.Enabled:=True;
  ECidade.Enabled:=True;
  DEConclusao.Enabled:=True;
  DEExped.Enabled:=True;
  DERegistro.Enabled:=True;
  CB2Via.Checked:=False;
  RGFormacao.Visible:=False;
  RGDefinitivo.Visible:=False;
  SPConcluinte.Close;
  QILivDip.Close;
  QAux.Close;
  QNro.Close;
  QLivro.Close;
  QLivFol.Close;
//  If FSolServ <> nil // form foi criado
//  Then
//   Begin
//     MERA.Text:=FloatToStr(FSolServ.MTProtServ['alu_ra']);
//     If FSolServ.MTProtServ['srv_tela'] = 'diploma'
//     Then RGImp.ItemIndex:=0
//     Else
//      If FSolServ.MTProtServ['srv_tela'] = 'diploma2'
//      Then RGImp.ItemIndex:=1;
//   End;
end;

procedure TFRegDip.MERAExit(Sender: TObject);
var trcomum, ok:boolean;
begin
  SBLocAlu.Enabled:=False;
  If (not b_finaliza.focused)
  Then
   If MERA.Text <> ''
   Then
    Begin
      QNacional.Close;
      QNacional.Open;
      QTpDoc.Close;
      QTpDoc.Open;

  //    MERA.Text:=Alinha_RA(MERA.Text);
      QConsAlu.Close;
      QConsAlu.Sql.Clear;
      QConsAlu.Sql.Add('select alu_ra,pes_nome,a.cur_codigo,pes_rg,pes_orgexp,pes_estexp,p.pes_cpf,p.nac_codigo,nac_descricao,nac_descmasc,');
      QConsAlu.Sql.Add('       pes_datnas,pes_locnas,a.pes_nro,pes_sexo,nac_pais,alu_anoing,alu_seming, pes_docestr,pes_nomecivil,p.pes_sacento,');
      QConsAlu.Sql.Add('       tde_codigo,pes_nomedefinitivo');
      QConsAlu.Sql.Add('from sca_alunos a, crp_pessoas p, sca_nacionalidade n, sca_cursos c');
      QConsAlu.Sql.Add('where a.pes_nro = p.pes_nro and p.nac_codigo = n.nac_codigo and a.cur_codigo = c.cur_codigo and cur_grapos = 1 and alu_ra = :ra');
      QConsAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
      QConsAlu.open;
      If not QConsAlu.eof
      Then
       Begin
         LNomAlu.Caption:=QConsAlu['pes_nome'];
         If Valida_Usuario(QConsAlu['cur_codigo'],0,0)
         Then
          Begin
            ok:=true;
            If FRegDip.Tag = 1 // registro do diploma
            Then
             Begin
               QLivro.Close;
               QLivro.Sql.Clear;
               QLivro.Sql.Add('select * from sca_livrodiploma');
               QLivro.Sql.Add('where liv_tipo = 0 and liv_dtencerramento is null');
               QLivro.Open;
               If QLivro.Eof
               Then
                Begin
                  MessageDlg('Não existe livro em aberto para registro!',mtError,[mbOk],0);
                  ok:=false;
                End
               Else
                Begin
                  QAux.Close;
                  QAux.Sql.Clear;
                  QAux.Sql.Add('select max(ldf_folha) folha from sca_livrodipfol');
                  QAux.Sql.Add('where liv_tipo = 0 and liv_numero =:num');
                  QAux.ParamByName('num').AsSmallInt:=QLivro['liv_numero'];
                  QAux.Open;
                  If QLivro['liv_nrofolhas'] = NULLToZero(QAux['folha'])
                  Then
                   Begin
                     MessageDlg('Livro nº '+IntToStr(QLivro['liv_numero'])+' já atingiu o máximo de folhas definido!',mtError,[mbOk],0);
                     ok:=false;
                   End;
                End;
             End;
            If ok
            Then
             Begin
               QCurso.Close;
               QCurso.ParamByName('codcur').AsSmallInt:=QConsAlu['cur_codigo'];
               QCurso.Open;
               If ((Trim(NULLToSpace(QCurso['cur_nomtit'])) = '') and ((QCurso['fac_codigo'] = 1) or (QCurso['cur_codigo'] = 132) or (QCurso['cur_codigo'] = 13))) or
                  (Trim(NULLToSpace(QCurso['cur_nomtit'])) <> '')  // Faclepp sem título definido, Educação Física ou Psicologia
               Then
                Begin
                  If QConsAlu['cur_codigo'] <> 13
                  Then
                   Begin
                     qconscur.close;
                     qconscur.parambyname('codcur').assmallint:=QConsAlu['cur_codigo'];
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
                        QConsHab.ParamByName('codcur').AsSmallint:=QConsAlu['cur_codigo'];
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
                        DBLCBHab.SetFocus;
                        DBLCBHab.DropDown;
                      End;
                   End
                  Else
                   Begin
                     MTHab.Append;
                     MTHab['hab_codigo']:=1;
                     MTHab['hab_nome']:='BACHARELADO EM PSICOLOGIA';
                     MTHab.Post;
                     MTHab.Append;
                     MTHab['hab_codigo']:=2;
                     MTHab['hab_nome']:='LICENCIATURA PLENA EM PSICOLOGIA';
                     MTHab.Post;
                     MTHab.Append;
                     MTHab['hab_codigo']:=3;
                     MTHab['hab_nome']:='FORMAÇÃO DE PSICÓLOGO';
                     MTHab.Post;
                     OrderBy(MTHab,['hab_codigo']);
                     DBLCBHab.Value:=MTHab['hab_codigo'];
                     DBLCBHab.SetFocus;
                     DBLCBHab.DropDown;
                   End;
                End
               Else
                Begin
                  MessageDlg('Curso não tem titulação cadastrada!',mtError,[mbOk],0);
                  MERA.SetFocus;
                End;
             End
            Else MERA.SetFocus; 
          End
         Else
          Begin
            If FRegDip.Tag = 1 // registro do diploma
            Then MessageDlg('Usuário não tem permissão de registrar diploma deste aluno!',mtError,[mbOk],0)
            Else MessageDlg('Usuário não tem permissão de emitir diploma deste aluno!',mtError,[mbOk],0);
            LNomAlu.Caption:='';
            MERA.SetFocus;
          End;
       End
      Else
       Begin
         MessageDlg('Registro Acadêmico Inválido !!!',mtError,[mbok],0);
         MERA.Setfocus;
       End;
    End
   Else MERA.SetFocus;
end;

procedure TFRegDip.DBLCBHabCloseUp(Sender: TObject);
begin
 KeyPreview:=True;
end;

procedure TFRegDip.DBLCBHabDropDown(Sender: TObject);
begin
 KeyPreview:=False;
end;

procedure TFRegDip.DBLCBHabExit(Sender: TObject);
var ok:boolean;
begin
  If (not MERA.Focused) and (not B_Cancela.Focused) and (not B_Finaliza.Focused)
  Then
   If not Habilitacao_Valida(StrToInt(DBLCBHab.Value))
   Then
    Begin
      If FRegDip.Tag = 1
      Then messagedlg('Registro de diploma nesta habilitação não pode ser efetuado!',mtinformation,[mbok],0)
      Else messagedlg('Emissão de diploma nesta habilitação não pode ser efetuada!',mtinformation,[mbok],0);
      DBLCBHab.SetFocus;
    End
   Else
    Begin
      QConsHab.Close;
      QConsHab.Sql.Clear;
      QConsHab.Sql.Add('select * from sca_habilitacao');
      QConsHab.Sql.Add('where hab_codigo =:hab');
      QConsHab.ParamByName('hab').AsSmallint:=StrToInt(DBLCBHab.Value);
      QConsHab.Open;
      LNomHab.Caption:=MTHab['hab_nome'];
      qconsccl.close;
      qconsccl.parambyname('hab').assmallint:=StrToInt(DBLCBHab.Value);
      qconsccl.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
      qconsccl.open;
      If qconsccl.eof
      Then
       Begin
         messagedlg('Este aluno não está cadastrado nesta habilitação !',mtinformation,[mbok],0);
         QConsHab.Close;
         qconsccl.close;
         DBLCBHab.SetFocus;
       End
      Else
       Begin
         ok:=false;
         If (qconsccl['ahb_conclusao'] <> Null) and (qconsccl['ahb_conclusao'] < StrToDate('01/01/2001'))
         Then ok:=true
         Else
          Begin
            SPConcluinte.Close;
            SPConcluinte.Params[0].AsFloat:=StrToFloat(Trim(MERA.Text));
            SPConcluinte.Params[1].AsSmallInt:=StrToInt(DBLCBHab.Value);
            SPConcluinte.Open;
            If SPConcluinte['formado'] = 'N' // Aluno não concluiu todas as disciplinas e carga horária de atividade complementar caso haja
            Then MessageDlg('Aluno não concluiu o curso. Registro do diploma não pode ser efetuado!',mtError,[mbOk],0)
            Else
             Begin
               If not Libera_Diploma(StrToFloat(Trim(MERA.Text)), StrToInt(DBLCBHab.Value))
               Then MessageDlg('Aluno tem situação irregular no Enade. Registro do diploma não pode ser efetuado!',mtError,[mbOk],0)
               Else ok:=true;
             End;
          End;
         If ok
         Then
          Begin
            If (qconsccl['ahb_colacao'] = Null)
            Then
             Begin
               MessageDlg('Atenção. Aluno está sem data de colação cadastrada. Registro do diploma não pode ser efetuado!',mtError,[mbOk],0);
               DBLCBHab.SetFocus;
             End
            Else
             Begin
               If (QConsAlu['cur_codigo'] = 13) and (StrToInt(DBLCBHab.Value) = 3) // Formação de Psicólogo
               Then
                Begin
                  RGFormacao.Visible:=True;
                  RGFormacao.ItemIndex:=0;
                End
               Else RGFormacao.Visible:=False;

               QILivDip.Close;
               QILivDip.Sql.Clear;
               QILivDip.Sql.Add('select * from sca_itenslivdip');
               QILivDip.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
               QILivDip.ParamByName('hab').AsSmallint:=StrToInt(DBLCBHab.Value);
               QILivDip.ParamByName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
               QILivDip.Open;
               If not QILivDip.Eof
               Then
                Begin
                  If FRegDip.Tag = 1 // registro do diploma
                  Then MessageDlg('Atenção. Registro do diploma já foi efetuado!',mtInformation,[mbOk],0);
                  EProc.Text:=FormatFloat('0000',QILivDip['npd_numero'])+'/'+IntToStr(QILivDip['npd_ano']);
                  EReg.Text:=FormatFloat('0000',QILivDip['nrd_numreg']);
                  ELivro.Text:=FormatFloat('000',QILivDip['liv_numero']);
                  EFolha.Text:=FormatFloat('000',QILivDip['ldf_folha']);
                  ENome.Text:=NULLToSpace(QILivDip['pes_nome']);
                  If QILivDip['pes_nomedefinitivo'] = 'S'
                  Then RGDefinitivo.ItemIndex:=0
                  Else RGDefinitivo.ItemIndex:=1;
                  If Trim(NULLToSpace(QILivDip['pes_nomecivil'])) = ''
                  Then ECivil.Text:=NULLToSpace(QILivDip['pes_nome'])
                  Else ECivil.Text:=NULLToSpace(QILivDip['pes_nomecivil']);
                  RGSexo.ItemIndex:=QILivDip['pes_sexo'] - 1;
                  If (QILivDip['nac_codigo'] = Null) or (QILivDip['nac_codigo'] = 1) or (QILivDip['nac_codigo'] = 9)
                  Then
                   Begin
                     LTipDoc.Caption:='R.G.';
                     ERG.MaxLength:=18;
                     LTpDoc.Visible:=False;
                     DBLCBTpDoc.Visible:=False;
                   End
                  Else
                   Begin
                     LTipDoc.Caption:='';
                     ERG.MaxLength:=20;
                     DBLCBTpDoc.KeyValue:=QILivDip['tde_codigo'];
                     LTpDoc.Visible:=True;
                     DBLCBTpDoc.Visible:=True;
                   End;
                  
                  ERG.Text:=NULLToSpace(QILivDip['pes_rg']);
                  EOrgExp.Text:=NULLToSpace(QILivDip['pes_orgexp']);
                  EEstExp.Text:=NULLToSpace(QILivDip['pes_estexp']);
                  DBLCNacional.KeyValue:=QILivDip['nac_codigo'];
                  CECPF.Value:=NULLToZero2(QILivDip['pes_cpf']);
                  If QILivDip['pes_datnas'] <> Null
                  Then DEDatNas.Date:=QILivDip['pes_datnas'];
                  If QILivDip['pes_locnas'] <> Null
                  Then
                   Begin
                     QLocalidade.Close;
                     QLocalidade.Sql.Clear;
                     QLocalidade.Sql.Add('select loc_codigo,loc_nome,loc_uf from cep_local where ');
                     QLocalidade.Sql.Add('loc_codigo =:codloc');
                     QLocalidade.ParamByName('codloc').AsInteger:=QILivDip['pes_locnas'];
                     QLocalidade.Open;
                     If QLocalidade['loc_uf'] <> Null
                     Then ECidade.Text:=QLocalidade['loc_nome']+' - '+QLocalidade['loc_uf']
                     Else ECidade.Text:=QLocalidade['loc_nome'];
                   End;
                  If QILivDip['ahb_conclusao'] <> Null
                  Then DEConclusao.Date:=QILivDip['ahb_conclusao'];
                  If QILivDip['ahb_expedicao'] <> Null
                  Then DEExped.Date:=QILivDip['ahb_expedicao'];
                  If QILivDip['ahb_datreg'] <> Null
                  Then DERegistro.Date:=QILivDip['ahb_datreg'];
                  If QILivDip['itl_nrodiploma'] <> Null
                  Then CENroDipl.Value:=QILivDip['itl_nrodiploma'];
                  If QILivDip['itl_obs'] <> Null
                  Then Memo1.Text:=QILivDip['itl_obs'];

                  If (QILivDip['itl_dtlimitealt'] = Null) or ((QILivDip['itl_dtlimitealt'] <> Null) and (QILivDip['itl_dtlimitealt'] < Pega_Data))
                  Then
                   Begin
                     ENome.Enabled:=False;
                     RGDefinitivo.Enabled:=False;
                     ENomeImp.Text:=Trata_Texto(ENome.Text);
                     ECivil.Enabled:=False;
                     ECivilImp.Text:=Trata_Texto(ECivil.Text);
                     RGSexo.Enabled:=False;
                     ERG.Enabled:=False;
                     EOrgExp.Enabled:=False;
                     EEstExp.Enabled:=False;
                     DBLCNacional.KeyValue:=QILivDip['nac_codigo'];
                     DBLCNacional.Enabled:=False;

                     If (QILivDip['nac_codigo'] <> 1) and (QILivDip['nac_codigo'] <> 9)
                     Then
                      Begin
                        DBLCBTpDoc.KeyValue:=QILivDip['tde_codigo'];
                        DBLCBTpDoc.Enabled:=False;
                      End;

                     CECPF.Enabled:=False;
                     DEDatNas.Enabled:=False;
                     ECidade.Enabled:=False;
                     DEConclusao.Enabled:=False;
                     DEExped.Enabled:=False;
                     DERegistro.Enabled:=False;
                     RGFormacao.Enabled:=False;
                     RGFormacao.ItemIndex:=NULLToZero(QILivDip['itl_formacao']);
                     CENroDipl.SetFocus;
                   End
                  Else ENome.SetFocus;
                End
               Else
                Begin
                  ENome.Text:=NULLToSpace(QConsAlu['pes_nome']);
                  If QConsAlu['pes_nomedefinitivo'] = 'S'
                  Then RGDefinitivo.ItemIndex:=0
                  Else RGDefinitivo.ItemIndex:=1;
                  If FRegDip.Tag = 2 // impressão do diploma
                  Then
                   Begin
                     MessageDlg('Registro do diploma ainda não foi efetuado. Impressão não pode ser efetuada!',mtError,[mbOk],0);
                     MERA.SetFocus;
                   End
                  Else
                   Begin
                     ok:=true;
                     If (qconsccl['ahb_expedicao'] <> Null) or (qconsccl['ahb_datreg'] <> Null) or (qconsccl['ahb_dtentrega'] <> Null)
                     Then
                      Begin
                        If MessageDlg('Atenção. Registro do diploma já foi efetuado no modelo antigo. Deseja registrar mesmo assim ? ',mtConfirmation, [mbYes, mbNo], 0) = mrNo
                        Then ok:=false;
                      End;
                     If (QConsAlu['alu_anoing'] = Null) or (QConsAlu['alu_seming'] = Null)
                     Then
                      Begin
                        MessageDlg('Aluno não possui ano/semestre de ingresso definido!',mtError,[mbOk],0);
                        ok:=false;
                      End
                     Else
                      Begin
                        QAux.Close;
                        QAux.Sql.Clear;
                        QAux.Sql.Add('select * from sca_caldias');
                        QAux.Sql.Add('where cur_codigo =:codcur and cld_periodo =:ano');
                        QAux.ParamByName('codcur').AsSmallInt:=QConsAlu['cur_codigo'];
                        QAux.ParamByName('ano').AsSmallInt:=QConsAlu['alu_anoing'];
                        QAux.Open;
                        If QAux.Eof
                        Then
                         Begin
                           MessageDlg('Curso não tem data de início das aulas definido no ano de ingresso deste aluno!',mtError,[mbOk],0);
                           ok:=false;
                         End
                        Else
                         If QConsAlu['alu_seming'] = 1
                         Then
                          Begin
                            If QAux['cld_diaini'] = Null
                            Then
                             Begin
                               MessageDlg('Curso não tem data de início das aulas definido no ano de ingresso deste aluno!',mtError,[mbOk],0);
                               ok:=false;
                             End;
                          End
                         Else
                          If QAux['cld_inisem2'] = Null
                          Then
                           Begin
                             MessageDlg('Curso não tem data de início das aulas definido no ano de ingresso deste aluno!',mtError,[mbOk],0);
                             ok:=false;
                           End;
                      End;
                     If ok
                     Then
                      Begin
                        If Trim(NULLToSpace(QConsAlu['pes_nomecivil'])) = ''
                        Then ECivil.Text:=NULLToSpace(QConsAlu['pes_nome'])
                        Else ECivil.Text:=NULLToSpace(QConsAlu['pes_nomecivil']);
                        RGSexo.ItemIndex:=QConsAlu['pes_sexo'] - 1;
                        If (QConsAlu['nac_codigo'] = Null) or (QConsAlu['nac_codigo'] = 1) or (QConsAlu['nac_codigo'] = 9)
                        Then
                         Begin
                           LTipDoc.Caption:='R.G.';
                           ERG.MaxLength:=18;
                           ERG.Text:=NULLToSpace(QConsAlu['pes_rg']);
                           LTpDoc.Visible:=False;
                           DBLCBTpDoc.Visible:=False;
                         End
                        Else
                         Begin
                           LTipDoc.Caption:='';
                           ERG.MaxLength:=20;
                           ERG.Text:=NULLToSpace(QConsAlu['pes_docestr']);
                           DBLCBTpDoc.KeyValue:=QConsAlu['tde_codigo'];
                           LTpDoc.Visible:=True;
                           DBLCBTpDoc.Visible:=True;
                         End;
                        EOrgExp.Text:=NULLToSpace(QConsAlu['pes_orgexp']);
                        EEstExp.Text:=NULLToSpace(QConsAlu['pes_estexp']);
                        DBLCNacional.KeyValue:=QConsAlu['nac_codigo'];
                        CECPF.Value:=NULLToZero2(QConsAlu['pes_cpf']);
                        If QConsAlu['pes_datnas'] <> Null
                        Then DEDatNas.Date:=QConsAlu['pes_datnas'];
                        If QConsAlu['pes_locnas'] <> Null
                        Then
                         Begin
                           QLocalidade.Close;
                           QLocalidade.Sql.Clear;
                           QLocalidade.Sql.Add('select loc_codigo,loc_nome,loc_uf from cep_local where ');
                           QLocalidade.Sql.Add('loc_codigo =:codloc');
                           QLocalidade.ParamByName('codloc').AsInteger:=QConsAlu['pes_locnas'];
                           QLocalidade.Open;
                           If QLocalidade['loc_uf'] <> Null
                           Then ECidade.Text:=QLocalidade['loc_nome']+' - '+QLocalidade['loc_uf']
                           Else ECidade.Text:=QLocalidade['loc_nome'];
                         End;
                        If qconsccl['ahb_conclusao'] <> Null
                        Then DEConclusao.Date:=qconsccl['ahb_conclusao'];
                        If qconsccl['ahb_expedicao'] <> Null
                        Then DEExped.Date:=qconsccl['ahb_expedicao']
                        Else DEExped.Date:=DataSis;
                        If qconsccl['ahb_datreg'] <> Null
                        Then DERegistro.Date:=qconsccl['ahb_datreg']
                        Else DERegistro.Date:=DataSis;

                        QFunc.Close;
                        QFunc.Sql.Clear;
                        QFunc.Sql.Add('select * from fol_funcionario');
                        QFunc.Sql.Add('where pes_nro =:nro and fun_ativo = "S"');
                        QFunc.ParamByName('nro').AsInteger:=QConsAlu['pes_nro'];
                        QFunc.Open;
                        If not QFunc.Eof
                        Then
                         Begin
                           MessageDlg('Atenção. Este cadastro pertence a um funcionário. Dados pessoais só poderão ser alterados no Depto. Pessoal!',mtInformation,[mbOk],0);
                           ENome.Enabled:=False;
                           ENomeImp.Text:=Trata_Texto(ENome.Text);
                           ECivil.Enabled:=False;
                           ECivilImp.Text:=Trata_Texto(ECivil.Text);
                           RGSexo.Enabled:=False;
                           ERG.Enabled:=False;
                           EOrgExp.Enabled:=False;
                           EEstExp.Enabled:=False;
                           DBLCNacional.KeyValue:=QConsAlu['nac_codigo'];
                           DBLCNacional.Enabled:=False;

                           If (QConsAlu['nac_codigo'] <> 1) and (QConsAlu['nac_codigo'] <> 9)
                           Then
                            Begin
                              DBLCBTpDoc.KeyValue:=QConsAlu['tde_codigo'];
                              DBLCBTpDoc.Enabled:=False;
                            End;

                           CECPF.Enabled:=False;
                           DEDatNas.Enabled:=False;
                           ECidade.Enabled:=False;
                           ENomeImp.SetFocus;
                         End
                        Else ENome.SetFocus;
                      End
                     Else MERA.SetFocus;
                   End;
                End;
             End;
          End
         Else MERA.SetFocus;
       End;
    End;
end;

procedure TFRegDip.MECopiasEnter(Sender: TObject);
begin
  MECopias.Text:='01';
end;

procedure TFRegDip.MECopiasExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not DBLCBHab.Focused) and (not B_Cancela.Focused) and
    (not B_Finaliza.Focused)
 Then
  If MECopias.Text = ''
  Then MECopias.SetFocus;
end;

procedure TFRegDip.b_cancelaClick(Sender: TObject);
begin
 MERA.SetFocus;
end;

procedure TFRegDip.FormActivate(Sender: TObject);
begin
  LCopias.Visible:=FRegDip.Tag = 2;
  MECopias.Visible:=FRegDip.Tag = 2;
  CB2Via.Visible:=FRegDip.Tag = 2;
  RGConsulta.Visible:=FRegDip.Tag = 2;
//  RGImp.Visible:=FRegDip.Tag = 2;
  MTHab.Close;
  MTHab.Open;
  RGConsulta.ItemIndex:=0;
  MERA.SetFocus;
end;

procedure TFRegDip.b_okClick(Sender: TObject);
var vdia, vmes, vano:word;
    vhab:string;
  	OutputStream: TMemoryStream;
  	PDFDevice: TppPDFADevice;
begin
  If Atualiza_Dados
  Then
   Begin
     If QConsAlu['cur_codigo'] = 13  // Psicologia tem que saber o período em que a grade do aluno teve início pois a partir de 2/2006 não deve aparecer mais a habilitação no texto do diploma
     Then
      Begin
        QGraLet.Close;
        QGraLet.ParamByName('codcur').AsSmallInt:=QConsAlu['cur_codigo'];
        QGraLet.ParamByName('codgra').AsSmallInt:=QConsAlu['ahb_codgra'];
        QGraLet.Open;
        If FRegDip.Tag = 2 // impressão do diploma
        Then
         If RGFormacao.ItemIndex = 1 // bacharelado
         Then
          Begin
            QAux.Close;
            QAux.Sql.Clear;
            QAux.Sql.Add('select * from sca_alu_hab');
            QAux.Sql.Add('where alu_ra =:ra and hab_codigo = 1');
            QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
            QAux.Open;
            If (QAux['ahb_conclusao'] <> Null) and (QAux['ahb_colacao'] <> Null)
            Then
             Begin
               dtconcl1:=QAux['ahb_conclusao'];
               dtcol1:=QAux['ahb_colacao'];
             End
            Else
             Begin
               dtconcl1:=0;
               dtcol1:=0;
             End;
          End
         Else
          If RGFormacao.ItemIndex = 2 // bacharelado e licenciatura
          Then
           Begin // bacharelado e licenciatura
             QAux.Close;
             QAux.Sql.Clear;
             QAux.Sql.Add('select * from sca_alu_hab');
             QAux.Sql.Add('where alu_ra =:ra and hab_codigo = 1');
             QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
             QAux.Open;
             If (QAux['ahb_conclusao'] <> Null) and (QAux['ahb_colacao'] <> Null)
             Then
              Begin
                dtconcl1:=QAux['ahb_conclusao'];
                dtcol1:=QAux['ahb_colacao'];
                QAux.Close;
                QAux.Sql.Clear;
                QAux.Sql.Add('select * from sca_alu_hab');
                QAux.Sql.Add('where alu_ra =:ra and hab_codigo = 2');
                QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
                QAux.Open;
                If (QAux['ahb_conclusao'] <> Null) and (QAux['ahb_colacao'] <> Null)
                Then
                 Begin
                   dtconcl2:=QAux['ahb_conclusao'];
                   dtcol2:=QAux['ahb_colacao'];
                 End
                Else
                 Begin
                   dtconcl2:=0;
                   dtcol2:=0;
                 End;
              End
             Else
              Begin
                dtconcl1:=0;
                dtcol1:=0;
              End;
           End;
      End;
     If FRegDip.Tag = 2 // impressão do diploma
     Then
      Begin
        If RGImp.ItemIndex = 0 // papel moeda
        Then
         Begin
           If CB2Via.Checked
           Then RT2Via.Visible:=True
           Else RT2Via.Visible:=False;
           RDiploma.PrinterSetUp.Copies:=StrToInt(Trim(MECopias.Text));
           If RGConsulta.ItemIndex = 0  //Vídeo
           Then
            Begin
              RDiploma.DeviceType:='Screen';
              RDiploma.ShowCancelDialog:=True;
            End
           Else
            Begin
              RDiploma.DeviceType:='Printer';
              RDiploma.ShowCancelDialog:=False;
            End;
           RDiploma.Print;
         End
        Else
         Begin
           QLocalidade.Close;
           QLocalidade.Sql.Clear;
           QLocalidade.Sql.Add('select * from cep_local l, outer cep_estado e');
           QLocalidade.Sql.Add('where l.loc_uf = e.loc_uf and l.loc_codigo =:codloc');
           QLocalidade.ParamByName('codloc').AsInteger:=QConsAlu['pes_locnas'];
           QLocalidade.Open;

           If CB2Via.Checked
           Then
            Begin
              RT2ViaP.Top:=190;
              RT2ViaP.Visible:=True;
            End
           Else
            Begin
              RT2ViaP.Top:=220;
              RT2ViaP.Visible:=False;
            End;
           RDiplomaP.PrinterSetUp.Copies:=StrToInt(Trim(MECopias.Text));
           If RGConsulta.ItemIndex = 0  //Vídeo
           Then
            Begin
              RDiplomaP.DeviceType:='Screen';
              RDiplomaP.AllowPrintToFile := False;
              RDiplomaP.ShowPrintDialog := True;
              RDiplomaP.ShowCancelDialog:=True;
              RDiplomaP.Print;
            End
           Else
            Begin
              RDiplomaP.AllowPrintToFile := True;
              RDiplomaP.ShowPrintDialog := False;
              RDiplomaP.ShowCancelDialog := False;
              RDiplomaP.TextFileName := 'DIPLOMA.PDF';
              RDiplomaP.DeviceType := 'PDFA';
              RDiplomaP.PDFSettings.OpenPDFFile:=True;
              RDiplomaP.Print;

{              RDiplomaP.AllowPrintToFile := True;
              RDiplomaP.AllowPrintToArchive := True;
              RDiplomaP.ShowPrintDialog := False;
              RDiplomaP.ShowCancelDialog := False;
              RDiplomaP.ArchiveFileName := 'DIPLOMA.RAF';
              RDiplomaP.DeviceType := 'ArchiveFile';
              RDiplomaP.PrintReport;

              // Set output file name for the PDF engine
              gtPDFEngine1.FileName := 'Diploma.pdf';

              // Read report
              ppArchiveReader1.ArchiveFileName := 'DIPLOMA.RAF';

              // Generate report
              ppArchiveReader1.PrintToDevices;

              // Export generated report to PDF
              gtRBExportInterface1.RenderDocument(TppReport(ppArchiveReader1));

              // Clean up
              ppArchiveReader1.Reset;}

//              OutputStream := TMemoryStream.Create;
//             	PDFDevice := TppPDFDevice.Create(nil);
//              try
//                PDFDevice.Publisher := RDiplomaP.Publisher;
//                PDFDevice.OutputStream := OutputStream;
//                RDiplomaP.AllowPrintToFile := True;
//                RDiplomaP.ShowPrintDialog := False;
//                RDiplomaP.PrintToDevices;
//                OutputStream.SaveToFile('DIPLOMA.PDF');
//              finally
//                OutputStream.Free;
//                PDFDevice.Free;
//              end;
            End;
         End;
      End
     Else
      Begin
        vhab:='';
        If QConsAlu['cur_codigo'] = 13  // Psicologia
        Then
         Begin
           Case StrToInt(DBLCBHab.Value)  of
             1:vhab:=' - BACHARELADO';
             2:vhab:=' - LICENCIATURA';
           End;
         End
        Else
         If QConsAlu['cur_codigo'] = 16  // Comunicação Social
         Then
          Begin
           If QConsHab['hab_ligacao'] <> 0
           Then vhab:=' COM HAB. EM '+QConsHab['hab_nomhb1'];
          End;

        QAux.Close;
        QAux.Sql.Clear;
//        QAux.Sql.Add('select f.fun_codigo, pes_nome, cgo_descric, pes_cpf');
//        QAux.Sql.Add('from fol_funcionario f, crp_pessoas p, fol_salfun s, fol_cargo c');
//        QAux.Sql.Add('where f.pes_nro = p.pes_nro and f.fun_codigo = s.fun_codigo and f.emp_codigo = s.emp_codigo and');
//        QAux.Sql.Add('      s.cgo_codigo = c.cgo_codigo and  s.emp_codigo = c.emp_codigo and saf_datafin is null and');
//        QAux.Sql.Add('      f.fun_codigo =:matr and f.emp_codigo = 1');
        QAux.Sql.Add('select f.fun_codigo, pes_nome, pes_cpf');
        QAux.Sql.Add('from fol_funcionario f, crp_pessoas p');
        QAux.Sql.Add('where f.pes_nro = p.pes_nro and f.fun_codigo =:matr and f.emp_codigo = 1');
        QAux.ParamByName('matr').AsInteger:=QConsAlu['fun_responsavel'];
        QAux.Open;

        // Termo de Responsabilidade
        DecodeDate(DataSis,vano,vmes,vdia);
        ppRichView5.RichView.Clear;
        ppRichView5.RichView.Style.TextStyles.Items[0].FontName:='Calibri';
        ppRichView5.RichView.Style.TextStyles.Items[0].Size:=12;
        ppRichView5.RichView.Style.TextStyles.Items[0].Color:=clBlack;
        ppRichView5.RichView.Style.TextStyles.Items[0].Style:=[];

        ppRichView5.RichView.Style.TextStyles.Items[1].FontName:='Calibri';
        ppRichView5.RichView.Style.TextStyles.Items[1].Size:=12;
        ppRichView5.RichView.Style.TextStyles.Items[1].Color:=clBlack;
        ppRichView5.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

        ppRichView5.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
        ppRichView5.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;
        ppRichView5.RichView.Style.ParaStyles.Items[0].FirstIndent:=100;

        ppRichView5.RichView.AddNL('Atesto para os devidos fins de direito, a regularidade dos procedimentos realizados para a expedição e registro do Diploma do(a) aluno(a) ',0,0);
        ppRichView5.RichView.AddNL(NULLToSpace(QConsAlu['pes_nome']),1,-1);
        ppRichView5.RichView.AddNL(', constante do processo nº ',0,-1);
        ppRichView5.RichView.AddNL(FormatFloat('0000',QConsAlu['npd_numero'])+'/'+IntToStr(QConsAlu['npd_ano']),1,-1);
        ppRichView5.RichView.AddNL(', na forma da Lei nº 9.394, de 20 de dezembro de 1996, do Decreto nº 9.235',0,-1);
        ppRichView5.RichView.AddNL(', de 15 de dezembro de 2017 e da Portaria do Ministério da Educação nº 1.095 de 25 de outubro de 2018',0,-1);
        ppRichView5.RichView.AddNL(', publicada no DOU nº207, Seção 1, pág. 32, de 26 de outubro de 2018.',0,-1);
        ppRichView5.RichView.AddNL('',0,0);
        ppRichView5.RichView.AddNL('',0,0);
        ppRichView5.RichView.AddNL('Presidente Prudente, '+StrZero(vdia,2)+' de '+Trata_Texto(Mes[vmes])+' de '+IntToStr(vano)+'.',0,0);
//        ppRichView5.RichView.AddNL(QAux['pes_nome'],0,0);
//        ppRichView5.RichView.AddNL(QAux['cgo_descric'],0,0);
//        ppRichView5.RichView.AddNL(Mascara_CPF(QAux['pes_cpf']),0,0);
        ppRichView5.RichView.AddNL('',0,0);
        ppRichView5.RichView.AddNL('',0,0);
        LResp.Caption:=QAux['pes_nome'];
        LCargo.Caption:='CHEFE DO SETOR DE REGISTRO DE DIPLOMAS'; //QAux['cgo_descric'];
        LCPF.Caption:=Mascara_CPF(QAux['pes_cpf']);
        ppRichView5.RichView.Format;

        // Livro de registro
        LLivro.Caption:='Livro: '+FormatFloat('000',QConsAlu['liv_numero'])+'    Folha:'+FormatFloat('000',QConsAlu['ldf_folha']);
        LNomeCivil.Caption:='';
        If (Tira_Acentos(QConsAlu['pes_nome']) <> Tira_Acentos(QConsAlu['pes_nomecivil'])) and (QConsAlu['pes_nomedefinitivo'] = 'N')
        Then LNomeCivil.Caption:=QConsAlu['pes_nomecivil'];
        QAux.Close;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from cep_local l');
        QAux.Sql.Add('where loc_codigo =:codloc');
        QAux.ParamByName('codloc').AsSmallInt:=QConsAlu['pes_locnas'];
        QAux.Open;
        If Trim(NULLToSpace(QAux['loc_uf'])) <> ''
        Then LNatural.Caption:='Natural de: '+QAux['loc_nome']+'-'+QAux['loc_uf']
        Else LNatural.Caption:='Natural de: '+QAux['loc_nome'];
//        If QConsAlu['pes_sexo'] = 1  //Masculino
//        Then LNacional.Caption:='Nacionalidade: '+QConsAlu['nac_descmasc']
//        Else LNacional.Caption:='Nacionalidade: '+QConsAlu['nac_descricao'];
        LNacional.Caption:='Nacionalidade: '+QConsAlu['nac_descricao']; // a Roberta pediu para colocar sempre no feminino - 07/05/2019
        If (QConsAlu['nac_codigo'] = Null) or (QConsAlu['nac_codigo'] = 1) or (QConsAlu['nac_codigo'] = 9)
        Then LRG.Caption:='R.G.: '+NULLToSpace(QConsAlu['pes_rg'])+'-'+QConsAlu['pes_orgexp']+'/'+QConsAlu['pes_estexp']
        Else LRG.Caption:=NULLToSpace(QConsAlu['tde_sigla'])+': '+NULLToSpace(QConsAlu['pes_rg']);
        LNomCur.Caption:=NULLToSpace(QConsAlu['cur_nomediploma'])+vhab;
        LProc.Caption:='Processo: '+FormatFloat('0000',QConsAlu['npd_numero'])+'/'+IntToStr(QConsAlu['npd_ano']);
        Imprime_AutRec(QConsAlu,QConsHab,QCurso,1,2,RTAutRec);
        Imprime_Renovacao(QConsAlu,1,2,RTRenov);

        QAux.Close;
        QAux.Sql.Clear;
        QAux.Sql.Add('select f.fun_codigo, pes_nome, pes_cpf');
        QAux.Sql.Add(' from fol_funcionario f, crp_pessoas p');
        QAux.Sql.Add('where f.pes_nro = p.pes_nro and f.fun_codigo =:matr and f.emp_codigo = 1');
        QAux.ParamByName('matr').AsInteger:=QConsAlu['fun_registrado'];
        QAux.Open;
        LNomReg.Caption:=NULLToSpace(QAux['pes_nome'])+' ';
        LCPFReg.Caption:=Mascara_CPF(NULLToZero2(QAux['pes_cpf']))+' ';

        ppRichView6.RichView.Clear;
        ppRichView6.RichView.Style.TextStyles.Items[0].FontName:='Calibri';
        ppRichView6.RichView.Style.TextStyles.Items[0].Size:=12;
        ppRichView6.RichView.Style.TextStyles.Items[0].Color:=clBlack;
        ppRichView6.RichView.Style.TextStyles.Items[0].Style:=[];

        ppRichView6.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
        ppRichView6.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;
        ppRichView6.RichView.Style.ParaStyles.Items[0].FirstIndent:=0;
        ppRichView6.RichView.AddNL(NULLToSpace(QConsAlu['itl_obs']),0,0);
        ppRichView6.RichView.Format;

        RRegistro.Print;
      End;
   End
  Else MessageDlg('Ocorreu um erro. Registro do Diploma não será efetuado !!!',mtError,[mbok],0);
  MERA.SetFocus;
end;

procedure TFRegDip.b_okExit(Sender: TObject);
begin
 B_Ok.Enabled:=False;
end;

procedure TFRegDip.ppDetailBand1BeforePrint(Sender: TObject);
var vdia,vmes,vano, a, tamfont, vdia2, vmes2, vano2:word;
    licenca, texto, pais:string;
    tamtext,tamrich: single;
begin
 licenca:='';
 If QConsAlu['cur_codigo'] = 13 // Psicologia
 Then
  Begin
   If (NULLToZero(QGraLet['grl_anoinicio']) < 2006) or ((NULLToZero(QGraLet['grl_anoinicio']) = 2006) and (NULLToZero(QGraLet['grl_seminicio']) = 1)) // Psicologia até 1/2006 deve aparecer a habilitação
   Then
    Begin
      Case StrToInt(DBLCBHab.Value)  of
        1:licenca:=' - Bacharelado';
        2:licenca:=' - Licenciatura';
        3:licenca:=' - Formação de Psicólogo';
      End;
    End;
  End
 Else
  If QConsHab['hab_licenca'] <> null
  Then
   Begin
    If QConsAlu['cur_codigo'] = 23  // Pedagogia
    Then
     Begin
      licenca:=' - Plena';
{      Case QConsHab['hab_licenca'] of
        1:licenca:=' - 1º Grau';
        2:licenca:=' - Plena';
        3:licenca:=' - Plena para Licenciados';
      End;}
     End
    Else
     Begin
      Case QConsHab['hab_licenca'] of
        1:licenca:=' - Licenciatura 1º Grau';
        2:licenca:=' - Licenciatura Plena';
        3:licenca:=' - Licenciatura Plena Para Licenciados';
      End;
      If QConsHab['hab_ligacao'] <> 0
      Then
       If QConsAlu['cur_codigo'] = 18 // Educação Artística
       Then licenca:=licenca + ' com Habilitação em '+Trata_Texto(QConsHab['hab_nomhb1'])
       Else licenca:=licenca + ' em '+Trata_Texto(QConsHab['hab_nomhb1']);
     End;
   End;
 ppRichView1.RichView.Clear;
 ppRichView1.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
 ppRichView1.RichView.Style.TextStyles.Items[0].Size:=21;
 ppRichView1.RichView.Style.TextStyles.Items[0].Color:=clBlack;
 ppRichView1.RichView.Style.TextStyles.Items[0].Style:=[];

 ppRichView1.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
 ppRichView1.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

// Utilizado para dar um espaço maior na última linha do parágrafo evitando assim cortar letras como 'f' e 'g'
 ppRichView1.RichView.Style.TextStyles.Items[1].FontName:='Monotype Corsiva';
 ppRichView1.RichView.Style.TextStyles.Items[1].Size:=2;
 ppRichView1.RichView.Style.TextStyles.Items[1].Color:=clBlack;
 ppRichView1.RichView.Style.TextStyles.Items[1].Style:=[];

 ppRichView1.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
 ppRichView1.RichView.Style.ParaStyles.Items[1].LineSpacing:=0;

 DecodeDate(QConsAlu['ahb_conclusao'],vano,vmes,vdia);
 DecodeDate(QConsAlu['ahb_colacao'],vano2,vmes2,vdia2);
 If QConsAlu['cur_codigo'] = 133 // Engenharia Ambiental dar um espaço maior antes da cidade
 Then ppRichView1.RichView.AddNL('',0,0);
 If QConsAlu['cur_codigo'] = 6 // Enfermagem
 Then
  Begin
    If QConsAlu['ahb_conclusao'] <= StrToDate('20/12/2008')
    Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                    'Enfermagem e Obstetrícia em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                    StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
// A Roberta pediu para alterar para conclusão até 20/12/2008, incluindo a colação de grau - 26/06/2019
//    Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
//                                    'Enfermagem e Obstetrícia em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', confere o título de',0,0)
    Else ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                    'Enfermagem em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                    StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);
  End
 Else
  If QConsAlu['cur_codigo'] = 10 // Computação
  Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                  'Ciência da Computação em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                  StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
  Else
   If QConsAlu['cur_codigo'] = 16 // Comunicação Social
   Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                   'Comunicação Social em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                    StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
   Else
    If QConsAlu['cur_codigo'] = 19 // Esquema I
    Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                    'Graduação de Professores da Parte de Formação Esp. do Currículo do Ensino de 2º Grau - Esquema I - Licenciatura Plena em '+StrZero(vdia,2)+
                                    ' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                    StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
    Else
     If QConsAlu['cur_codigo'] = 26 // Sistemas de Informação
     Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                     'Sistemas de Informação em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                     StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
     Else
      If QConsAlu['cur_codigo'] = 112 // Superior de Tecnologia em Informática
      Then
       Begin
        If ((QConsAlu['alu_anoing'] = 2005) and (QConsAlu['alu_seming'] = 1)) or (QConsAlu['alu_anoing'] < 2005)
        Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
                                        'Superior de Tecnologia em Informática - Modalidade: Desenvolvimento Web, em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                        StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
        Else ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
                                        'Superior de Tecnologia em Desenvolvimento Web, da Área Profissional de Informática, em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                        StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);
       End
      Else
       If (QConsAlu['cur_codigo'] = 22) and ((QConsHab['hab_codigo'] = 72) or (QConsHab['hab_codigo'] = 16)) // Letras com habilitação em português/inglês
       Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                       'Letras - Português/Inglês e Respectivas Literaturas - Licenciatura em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                       StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
       Else
        If (QConsAlu['cur_codigo'] = 132) and ((QConsAlu['ahb_codgra'] = 1) or (QConsAlu['ahb_codgra'] = 2) or (QConsAlu['ahb_codgra'] = 6) or
           (QConsAlu['ahb_codgra'] = 7) or (QConsAlu['ahb_codgra'] = 8) or (QConsAlu['ahb_codgra'] = 3)) // Educação Física - Licenciatura nestas grades deve ser impresso somente Educação Física, de acordo com o chamado #4833
        Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                        'Educação Física em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                        StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
        Else
         If QCurso['cur_area'] = 6 // Cursos de Tecnologia
         Then
          Begin
  //         If QCurso['cur_codigo'] = 145 // Superior de Tecnologia em Música
  //         Then ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
  //                                         'Superior de Tecnologia em Música : Linguagens, Produção e Multimeios, em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', confere o título de',0,0);
           ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
                                      Trata_Texto(QConsAlu['cur_nomediploma'])+licenca+' em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                      StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);
          End
         Else ppRichView1.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                         Trata_Texto(QConsAlu['cur_nomediploma'])+licenca+' em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                         StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);

 ppRichView1.RichView.AddNL('',1,1);
 ppRichView1.RichView.Format;

{ If QConsAlu['cur_codigo'] = 13  // Psicologia
 Then
  Begin
   Case StrToInt(DBLCBHab.Value)  of
     1:If QConsAlu['pes_sexo'] = 1  // masculino
       Then RTTitulo.RichText:='Bacharel em Psicologia'
       Else RTTitulo.RichText:='Bacharela em Psicologia';
     2:If QConsAlu['pes_sexo'] = 1  // masculino
       Then RTTitulo.RichText:='Licenciado'
       Else RTTitulo.RichText:='Licenciada';
     3:If QConsAlu['pes_sexo'] = 1  // masculino
       Then RTTitulo.RichText:='Psicólogo'
       Else RTTitulo.RichText:='Psicóloga';
   End;
  End
 Else
  If ((QCurso['fac_codigo'] = 1) and (QCurso['cur_nomtit'] = Null)) or (QCurso['cur_codigo'] = 132) // Faclepp sem título definido ou Educação Física
  Then
   Begin
    If QConsAlu['pes_sexo'] = 1  // masculino
    Then RTTitulo.RichText:='Licenciado'
    Else RTTitulo.RichText:='Licenciada';
   End
  Else
   If QConsAlu['cur_codigo'] = 112 // Superior de Tecnologia em Desenvolvimento Web
   Then
    Begin
     If ((QConsAlu['alu_anoing'] = 2005) and (QConsAlu['alu_seming'] = 1)) or (QConsAlu['alu_anoing'] < 2005)
     Then
      Begin
        If QConsAlu['pes_sexo'] = 1  // masculino
        Then RTTitulo.RichText:='Tecnólogo' // RTTitulo.RichText:='Tecnólogo em Informática' Moisés pediu para deixar somente tecnólogo como nos outros cursos de tecnologia da fipp 09/11/2011
        Else RTTitulo.RichText:='Tecnóloga'; // RTTitulo.RichText:='Tecnólogo em Informática' Moisés pediu para deixar somente tecnólogo como nos outros cursos de tecnologia da fipp 09/11/2011
      End
     Else RTTitulo.RichText:=Trata_Texto(NULLToSpace(QConsAlu['cur_nomtit']));
    End
   Else RTTitulo.RichText:=Trata_Texto(NULLToSpace(QConsAlu['cur_nomtit']));}

 RTTitulo.RichText:=Trata_Texto(NULLToSpace(QConsAlu['cur_nomtit']));

// RTTitulo.Paragraph.Alignment:=taCenter;
 RTTitulo.SelectAll;
 RTTitulo.SelAttributes.Name:='Monotype Corsiva';
 RTTitulo.SelAttributes.Size:=39;
 FRegDip.Font.Name:=RTAluno.SelAttributes.Name;
 FRegDip.Font.Style:=RTAluno.SelAttributes.Style;
 RTAluno.SelAttributes.Size:=42; // 42 para Monotype Corsiva e 46 para CloisterBlack
 FRegDip.Font.Size:=42;
 FRegDip.Font.Name:='Monotype Corsiva';
 tamfont:=42;
 RTAluno.RichText:='a   '+Trim(Nome_Aluno(ENomeImp.Text,ECivilImp.Text,QConsAlu['pes_nomedefinitivo'],false));
 texto:='a   '+Trim(Nome_Aluno(ENomeImp.Text,ECivilImp.Text,QConsAlu['pes_nomedefinitivo'],false));
 RTAluno.SelectAll;
 tamtext:=Canvas.TextWidth(texto);
 tamrich:=RTAluno.Width;
 While tamtext > tamrich do
 Begin
  tamfont:=tamfont - 1;
  FRegDip.Font.Size:=tamfont;
  tamtext := Canvas.TextWidth(texto);
 End;
 RTAluno.SelAttributes.Size:=tamfont;
// *******************************************
 RTAluno.SelStart:=0;
 RTAluno.SelLength:=1;
 RTAluno.SelAttributes.Size:=tamfont - 15;
// *******************************************
 FRegDip.Font.Size:=8;
 FRegDip.Font.Name:='MS Sans Serif';
 FRegDip.Font.Style:=[];
 DBLCBHab.Height:=21;
// RTAluno.Paragraph.Alignment:=taCenter;
 RTAluno.SelectAll;
 RTAluno.SelAttributes.Name:='Monotype Corsiva';
 If (QConsAlu['nac_codigo'] = 1) or (QConsAlu['nac_codigo'] = 9) // Brasileiro ou Brasileiro Naturalizado
 Then
  Begin
    If (QConsAlu['nac_codigo'] = 9) // Brasileiro Naturalizado
    Then
     Begin
       If QConsAlu['pes_sexo'] = 1  //Masculino
       Then ppRichText2.RichText:='RG nº '+QConsAlu['pes_rg']+'-'+NULLToSpace(QConsAlu['pes_orgexp'])+'/'+NULLToSpace(QConsAlu['pes_estexp'])+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descmasc'])
       Else ppRichText2.RichText:='RG nº '+QConsAlu['pes_rg']+'-'+NULLToSpace(QConsAlu['pes_orgexp'])+'/'+NULLToSpace(QConsAlu['pes_estexp'])+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descricao']);
     End
    Else ppRichText2.RichText:='RG nº '+QConsAlu['pes_rg']+'-'+NULLToSpace(QConsAlu['pes_orgexp'])+'/'+NULLToSpace(QConsAlu['pes_estexp'])+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descricao']);
  End
 Else ppRichText2.RichText:=NULLToSpace(QConsAlu['tde_sigla'])+' nº '+QConsAlu['pes_rg']+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descricao']);
// ppRichText2.Paragraph.Alignment:=taCenter;
 ppRichText2.SelectAll;
 ppRichText2.SelAttributes.Name:='Monotype Corsiva';
 ppRichText2.SelAttributes.Size:=21;

 ppRichView2.RichView.Clear;
 ppRichView2.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
 ppRichView2.RichView.Style.TextStyles.Items[0].Size:=21;
 ppRichView2.RichView.Style.TextStyles.Items[0].Color:=clBlack;
 ppRichView2.RichView.Style.TextStyles.Items[0].Style:=[];

 ppRichView2.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
 ppRichView2.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

// Utilizado para dar um espaço maior na última linha do parágrafo evitando assim cortar letras como 'f' e 'g'
 ppRichView2.RichView.Style.TextStyles.Items[1].FontName:='Monotype Corsiva';
 ppRichView2.RichView.Style.TextStyles.Items[1].Size:=2;
 ppRichView2.RichView.Style.TextStyles.Items[1].Color:=clBlack;
 ppRichView2.RichView.Style.TextStyles.Items[1].Style:=[];

 ppRichView2.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
 ppRichView2.RichView.Style.ParaStyles.Items[1].LineSpacing:=0;

 QLocalidade.Close;
 QLocalidade.Sql.Clear;
 QLocalidade.Sql.Add('select * from cep_local l, outer cep_estado e');
 QLocalidade.Sql.Add('where l.loc_uf = e.loc_uf and l.loc_codigo =:codloc');
 QLocalidade.ParamByName('codloc').AsInteger:=QConsAlu['pes_locnas'];
 QLocalidade.Open;

 DecodeDate(QConsAlu['pes_datnas'],vano,vmes,vdia);
 If (QConsAlu['nac_codigo'] = 1) or (QConsAlu['nac_codigo'] = 9) // Brasileiro ou Brasileiro naturalizado
 Then
  Begin
   If not QLocalidade.Eof
   Then
    Begin
     If (QConsAlu['nac_codigo'] = 1) and ((Pos('(',QLocalidade['loc_nome']) <> 0) or (Pos('(',NULLToSpace(QLocalidade['loc_obs'])) <> 0)) // Brasileiro com Cidade de Nascimento no Exterior
     Then
      Begin
       pais:=Trata_Texto(QLocalidade['loc_nome']+' '+NULLToSpace(QLocalidade['loc_obs']));
//       pais:=Copy(pais,1,pos('(',pais))+uppercase(pais[pos('(',pais)+1])+Copy(pais,pos('(',pais)+2,Length(pais));
       pais:=Copy(pais,1,pos('(',pais) - 1)+'- '+uppercase(pais[pos('(',pais)+1])+Copy(pais,(Pos('(',pais)+2),(Pos(')',pais) - Pos('(',pais) - 2));
       If QConsAlu['pes_sexo'] = 1  //Masculino
       Then ppRichView2.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                  ', natural de '+pais+
                                  ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
       Else ppRichView2.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                  ', natural de '+pais+
                                  ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
      End
     Else
      If (QConsAlu['nac_codigo'] <> 9) and (Pos('(',QLocalidade['loc_nome']) = 0) // Não pe brasileiro naturalizado ou Cidade de Nascimento não é do Exterior
      Then
       Begin
        If QConsAlu['pes_sexo'] = 1  //Masculino
        Then
         Begin
           If NULLToSpace(QLocalidade['loc_uf']) <> 'DF' // distrito federal
           Then ppRichView2.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                           ', natural do Estado '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                           ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
           Else ppRichView2.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                           ', natural '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                           ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
         End
        Else
         If NULLToSpace(QLocalidade['loc_uf']) <> 'DF' // distrito federal
         Then ppRichView2.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                         ', natural do Estado '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                         ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
         Else ppRichView2.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                         ', natural '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                         ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
       End
      Else
       Begin
        If (Pos('(',QLocalidade['loc_nome']) <> 0)
        Then pais:=Copy(QLocalidade['loc_nome'],(Pos('(',QLocalidade['loc_nome'])+1),(Pos(')',QLocalidade['loc_nome']) - Pos('(',QLocalidade['loc_nome']) - 1))
        Else pais:=Copy(NULLToSpace(QLocalidade['loc_obs']),(Pos('(',NULLToSpace(QLocalidade['loc_obs']))+1),(Pos(')',NULLToSpace(QLocalidade['loc_obs'])) - Pos('(',NULLToSpace(QLocalidade['loc_obs'])) - 1));
        If QConsAlu['pes_sexo'] = 1  //Masculino
        Then ppRichView2.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                   ', natural do País - '+Trata_Texto(pais)+
                                   ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
        Else ppRichView2.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                   ', natural do País - '+Trata_Texto(pais)+
                                   ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
       End;
    End;
  End
 Else
  If not QLocalidade.Eof
  Then
   Begin
     If (Pos('(',QLocalidade['loc_nome']) <> 0)
     Then pais:=Copy(QLocalidade['loc_nome'],(Pos('(',QLocalidade['loc_nome'])+1),(Pos(')',QLocalidade['loc_nome']) - Pos('(',QLocalidade['loc_nome']) - 1))
     Else pais:=NULLToSpace(QConsAlu['nac_pais']);
     If QConsAlu['pes_sexo'] = 1  //Masculino
     Then ppRichView2.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                ', natural do País - '+Trata_Texto(pais)+
                                ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
     Else ppRichView2.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                ', natural do País - '+Trata_Texto(pais)+
                                ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
   End
  Else
   If QConsAlu['pes_sexo'] = 1  //Masculino
   Then ppRichView2.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                              ', natural do País - '+Trata_Texto(NULLToSpace(QConsAlu['nac_pais']))+
                              ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
   Else ppRichView2.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                              ', natural do País - '+Trata_Texto(NULLToSpace(QConsAlu['nac_pais']))+
                              ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);

 ppRichView2.RichView.AddNL('',1,1);
 ppRichView2.RichView.Format;

 DecodeDate(QConsAlu['ahb_expedicao'],vano,vmes,vdia);
 ppRichText4.RichText:='Presidente Prudente, '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+'.';
 ppRichText4.Paragraph.Alignment:=taRightJustify;
 ppRichText4.SelectAll;
 ppRichText4.SelAttributes.Name:='Monotype Corsiva';
 ppRichText4.SelAttributes.Size:=21;
end;

procedure TFRegDip.B_FinalizaClick(Sender: TObject);
begin
 Close;
end;

procedure TFRegDip.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TFRegDip.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TFRegDip.DBLCNacionalDropDown(Sender: TObject);
begin
 KeyPreview:=False;
end;

procedure TFRegDip.DBLCNacionalCloseUp(Sender: TObject);
begin
 KeyPreview:=True;
end;

procedure TFRegDip.ECidadeExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If ECidade.Text = ''
  Then
   Begin
    Application.MessageBox('Digite as iniciais da Localidade','Informação',mb_iconinformation+mb_ok);
    ECidade.SetFocus;
   End
  Else
   Begin
    If (ECidade.Modified) or (Pos('-',ECidade.Text) = 0)
    Then
     Begin
      QLocalidade.Close;
      QLocalidade.Sql.Clear;
      QLocalidade.Sql.Add('select loc_codigo,loc_nome,loc_uf from cep_local where ');
      QLocalidade.Sql.Add('loc_nome like :nome');
      QLocalidade.ParamByName('nome').AsString:=ECidade.Text+'%';
      QLocalidade.Open;
      If QLocalidade.RecordCount = 1
      Then
       Begin
        If QLocalidade['loc_uf'] <> Null
        Then ECidade.Text:=QLocalidade['loc_nome']+' - '+QLocalidade['loc_uf']
        Else ECidade.Text:=QLocalidade['loc_nome'];
       End
      Else
       If (QLocalidade.RecordCount = 0)
       Then
        Begin
         MessageDlg('Nome de Cidade Inválido!',mtError,[mbOk],0);
         ECidade.SetFocus;
         QLocalidade.Close;
        End
       Else DBLCCidade.DropDown;
     End;
   End;
end;

procedure TFRegDip.DBLCCidadeClick(Sender: TObject);
begin
 If QLocalidade['loc_uf'] <> Null
 Then ECidade.Text:=DBLCCidade.Text+' - '+QLocalidade['loc_uf']
 Else ECidade.Text:=DBLCCidade.Text;
end;

procedure TFRegDip.ENomeExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If Trim(ENome.Text) = ''
  Then ENome.SetFocus
  Else
   Begin
     ENomeImp.Text:=Trata_Texto(ENome.Text);
     RGDefinitivo.Visible:=UpperCase(Tira_Acentos(ENome.Text)) <> UpperCase(Tira_Acentos(ECivil.Text));
   End;
end;

procedure TFRegDip.ERGExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If Trim(ERG.Text) = ''
  Then ERG.SetFocus;
end;

procedure TFRegDip.EEstExpExit(Sender: TObject);
begin
{ If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If Trim(EEstExp.Text) = ''
  Then EEstExp.SetFocus;}
end;

procedure TFRegDip.DEDatNasExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If DEDatNas.Date = 0
  Then DEDatNas.SetFocus;
end;

procedure TFRegDip.DEConclusaoExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If DEConclusao.Date = 0
  Then DEConclusao.SetFocus;
end;

procedure TFRegDip.DEExpedExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If DEExped.Date = 0
  Then DEExped.SetFocus;
end;

procedure TFRegDip.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 QConsAlu.Close;
 QConsCur.Close;
 QConsHab.Close;
 QConsCcl.Close;
 QPessoa.Close;
 QAluHab.Close;
 QCurso.Close;
 QLocalidade.Close;
 QNacional.Close;
 QTpDoc.Close;
 QAux.Close;
 QLivro.Close;
 QNro.Close;
 QILivDip.Close;
end;

procedure TFRegDip.SBLocAluClick(Sender: TObject);
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

procedure TFRegDip.ppTitleBand1BeforeGenerate(Sender: TObject);
var licenca,licenca2,republicacao,secao,protemec,
    linha1,linha2,linha3,linha4:string;
    tam,posnum,vano,vmes,vdia:word;
begin
  ppRichView3.RichView.Clear;
  ppRichView3.RichView.Style.TextStyles.Items[0].FontName:='Arial';
  ppRichView3.RichView.Style.TextStyles.Items[0].Size:=9;
  ppRichView3.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView3.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView3.RichView.Style.TextStyles.Items[1].FontName:='Arial';
  ppRichView3.RichView.Style.TextStyles.Items[1].Size:=5;
  ppRichView3.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView3.RichView.Style.TextStyles.Items[1].Style:=[];

  ppRichView3.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView3.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

  ppRichView3.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView3.RichView.Style.ParaStyles.Items[1].LineSpacing:=10;

  linha1:='';
  linha2:='';
  linha3:='';
  linha4:='';

  licenca:='';
  licenca2:='';
  secao:='';
  protemec:='';
  RPed.Visible:=False; // quadro específico para os cursos 307 - Licenciatura em Pedagogia e 745 - Pedagogia EAD
  RTur.Visible:=False; // turismo
  RPsi.Visible:=False; // psicologia

  If (Trim(NULLToSpace(QConsAlu['cur_procemec'])) <> '')
  Then protemec:=' - Protocolo e-MEC '+QConsAlu['cur_procemec'];
  If (Trim(NULLToSpace(QConsAlu['cur_autsecao'])) <> '') and (Trim(NULLToSpace(QConsAlu['cur_autpag'])) <> '') and
     (Trim(NULLToSpace(QConsAlu['cur_nautdou'])) <> '') and (QConsAlu['cur_dataportaria'] <> Null) and (QConsAlu['cur_autdata'] <> Null)
  Then secao:=', de '+DateToStr(QConsAlu['cur_dataportaria'])+', D.O.U. nº'+QConsAlu['cur_nautdou']+
              ', Seção '+QConsAlu['cur_autsecao']+', pág.'+QConsAlu['cur_autpag']+', de '+DateToStr(QConsAlu['cur_autdata']);

  If (QConsAlu['cur_codigo'] = 20) //Estudos Sociais
  Then
   Begin
    If QConsHab['hab_licenca'] <> null
    Then
     Begin
      Case QConsHab['hab_licenca'] of
        1:Begin
           licenca:=' - licenciatura 1º grau';
           licenca2:=' - lic. 1º grau';
          End;
        2:Begin
           licenca:=' - licenciatura plena';
           licenca2:=' - lic. plena';
          end;
        3:Begin
           licenca:=' - licenciatura plena para licenciados';
           licenca2:=' - lic. plena para licenciados';
          End;
      End;
     End;
    If (QConsHab['hab_ligacao'] <> 0) and (QConsHab['hab_ligacao'] <> Null)
    Then
     Begin
      DecodeDate(QConsAlu['cur_autdata'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsAlu['cur_autndc'] <> Null
      Then
       Begin
        If QConsAlu['cur_autdcp'] = 1
        Then
         Begin
          If vano > 1982
          Then linha2:='Reconhecimento: Portaria n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata'])
          Else linha2:='Autorização: Decreto Lei n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata']);
         End
        Else
         Begin
          If vano > 1982
          Then linha2:='Reconhecimento: Portaria n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata'])
          Else linha2:='Reconhecimento: Decreto Lei n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata']);
         End;
       End;
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      linha1:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca;
      licenca2:=licenca2 + ' com hab. em '+Trata_Texto(QConsHab['hab_nomhb1']);
      linha3:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca2;
      If QConsHab['hab_autdoc'] <> Null
      Then
       Begin
        If QConsHab['hab_autdcp'] = 1
        Then
         Begin
          If vano > 1982
          Then linha4:='Autorização: Portaria n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat'])
          Else linha4:='Autorização: Decreto Lei n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat']);
         End
        Else
         Begin
          If vano > 1982
          Then linha4:='Reconhecimento: Portaria n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat'])
          Else linha4:='Reconhecimento: Decreto Lei n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat']);
         End;
       End;
      
      If linha1 <> ''
      Then ppRichView3.RichView.AddNL(linha1,0,0);
      If linha2 <> ''
      Then ppRichView3.RichView.AddNL(linha2,0,0);
      If linha3 <> ''
      Then ppRichView3.RichView.AddNL(linha3,0,0);
      If linha4 <> ''
      Then ppRichView3.RichView.AddNL(linha4,0,0);
     End
    Else
     Begin
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsHab['hab_autdcp'] = 1
      Then
       Begin
        If vano > 1982
        Then
         Begin
          linha2:='Autorização: Portaria nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End
        Else
         Begin
          linha2:='Autorização: Decreto Lei nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End;
       End
      Else
       Begin
        If vano > 1982
        Then
         Begin
          linha2:='Reconhecimento: Portaria nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End
        Else
         Begin
          linha2:='Reconhecimento: Decreto Lei nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End;
       End;
      If linha1 <> ''
      Then ppRichView3.RichView.AddNL(linha1,0,0);
      If linha2 <> ''
      Then ppRichView3.RichView.AddNL(linha2,0,0);
      If linha3 <> ''
      Then ppRichView3.RichView.AddNL(linha3,0,0);
      If linha4 <> ''
      Then ppRichView3.RichView.AddNL(linha4,0,0);
     End;
    ppRichView3.RichView.AddNL('',1,1);
    ppRichView3.RichView.Format;
   End
  Else
   Begin
    linha4:=Renovacao3(QConsAlu,1,2);
    If linha4 <> ''
    Then linha4:=linha4 + '.';
    If QConsAlu['cur_codigo'] = 13  // Psicologia
    Then
     Begin
      If (NULLToZero(QGraLet['grl_anoinicio']) < 2006) or ((NULLToZero(QGraLet['grl_anoinicio']) = 2006) and (NULLToZero(QGraLet['grl_seminicio']) = 1)) // Psicologia até 1/2006 deve aparecer a habilitação
      Then
       Begin
         Case StrToInt(DBLCBHab.Value)  of
           1:licenca:=' - Bacharelado';
           2:licenca:=' - Licenciatura';
           3:licenca:=' - Formação de Psicólogo';
         End;
       End;
      If (StrToInt(DBLCBHab.Value) = 3) and (RGFormacao.ItemIndex <> 0) // Formação de Psicólogo
      Then
       Begin
         RPsi.Visible:=True;
         RVPsi.RichView.Clear;
         RVPsi.RichView.Style.TextStyles.Items[0].FontName:='Arial';
         RVPsi.RichView.Style.TextStyles.Items[0].Size:=9;
         RVPsi.RichView.Style.TextStyles.Items[0].Color:=clBlack;
         RVPsi.RichView.Style.TextStyles.Items[0].Style:=[];

         RVPsi.RichView.Style.TextStyles.Items[1].FontName:='Arial';
         RVPsi.RichView.Style.TextStyles.Items[1].Size:=9;
         RVPsi.RichView.Style.TextStyles.Items[1].Color:=clBlack;
         RVPsi.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

         RVPsi.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
         RVPsi.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

         RVPsi.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
         RVPsi.RichView.Style.ParaStyles.Items[1].LineSpacing:=150;

         RVPsi.RichView.AddNL('Concluiu o curso de ',0,0);
         If RGFormacao.ItemIndex = 1 // Formação - Bacharelado
         Then
          Begin
            RVPsi.RichView.AddNL('Psicologia - Bacharelado ',1,-1);
            RVPsi.RichView.AddNL('em '+DateToStr(dtconcl1)+' e colou grau em '+DateToStr(dtcol1)+'.',0,-1);
          End
         Else
          If (dtconcl1 = dtconcl2) and (dtcol1 = dtcol2)
          Then
           Begin
             RVPsi.RichView.AddNL('Psicologia - Bacharelado e Licenciatura ',1,-1);
             RVPsi.RichView.AddNL('em '+DateToStr(dtconcl1)+' e colou grau em '+DateToStr(dtcol1)+'.',0,-1);
           End
          Else
           Begin
             RVPsi.RichView.AddNL('Psicologia - Bacharelado ',1,-1);
             RVPsi.RichView.AddNL('em '+DateToStr(dtconcl1)+', colou grau em '+DateToStr(dtcol1)+', ',0,-1);
             RVPsi.RichView.AddNL('Psicologia - Licenciatura ',1,-1);
             RVPsi.RichView.AddNL('em '+DateToStr(dtconcl2)+' e colou grau em '+DateToStr(dtcol2)+'.',0,-1);
           End;
         RVPsi.RichView.Format;
       End;
     End
    Else
     If QConsHab['hab_licenca'] <> null
     Then
      Begin
       If (QConsAlu['cur_codigo'] = 23) // or (QConsAlu['cur_codigo'] = 104) or (QConsAlu['cur_codigo'] = 101) or (QConsAlu['cur_codigo'] = 102) // Pedagogia, Matemática, Ciências Biológicas e Química
       Then
        Begin
          If (QConsAlu['cur_codigo'] = 23) // Pedagogia
          Then licenca:=' - lic. plena'
          Else licenca:=' - Licenciatura';
    {      Case QConsHab['hab_licenca'] of
            1:licenca:=' - 1º GRAU';
            2:licenca:=' - PLENA';
            3:licenca:=' - PLENA PARA LICENCIADOS';
          End;}
        End
       Else
        Begin
         Case QConsHab['hab_licenca'] of
           1:licenca:=' - lic. 1º grau';
           2:licenca:=' - lic. plena';
           3:licenca:=' - lic. plena para licenciados';
         End;
         If QConsHab['hab_ligacao'] <> 0
         Then licenca:=licenca + ' com hab. em '+Trata_Texto(QConsHab['hab_nomhb1']);
        End;
      End;

    If ((QConsHab['hab_ligacao'] <> 0) and (QConsHab['hab_ligacao'] <> Null) and (QConsAlu['cur_codigo'] <> 13)) or (QConsHab['hab_codigo'] = 15) // Diploma pediu para imprimir decreto da habilitação 15 e não a que está cadastrada no curso - 02/03/2011
    Then
     Begin
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsHab['hab_autdoc'] <> Null
      Then
       If QConsHab['cur_codigo'] = 4 // Farmácia
       Then
        Begin
         If QConsHab['hab_autdcp'] = 1
         Then
          Begin
           linha2:='Autorização: Portaria nº '+QConsHab['hab_autdoc'];
           linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
          End
         Else
          Begin
           linha2:='Reconhecimento: Portaria nº '+QConsHab['hab_autdoc'];
           linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
          End;
        End
       Else
        Begin
         If QConsHab['hab_autdcp'] = 1
         Then
          Begin
           If vano > 1982
           Then
            Begin
             linha2:='Autorização: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo']);
             linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
            End
           Else
            Begin
             linha2:='Autorização: Decreto Lei nº '+QConsHab['hab_autdoc'];
             linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
            End;
          End
         Else
          Begin
           If vano > 1982
           Then
            Begin
             If secao = ''
             Then
              Begin
                If (QCurso['cur_area'] = 6) and (QCurso['cur_codigo'] <> 112) and (QConsHab['hab_dataportaria'] <> Null) // Cursos de Tecnologia menos TDW com data da portaria
                Then linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+', de '+DateToStr(QConsHab['hab_dataportaria'])
                Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo']);
                linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+protemec+'.';
              End
             Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+secao+protemec+'.';
            End
           Else
            Begin
             linha2:='Reconhecimento: Decreto Lei nº '+QConsHab['hab_autdoc'];
             linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
            End;
          End;
        End;
     End
    Else
     Begin
      republicacao:='';
      If QConsAlu['cur_dtrepublicacao'] <> Null
      Then republicacao:=' (Republicada em '+DateToStr(QConsAlu['cur_dtrepublicacao'])+')';
      DecodeDate(QConsAlu['cur_autdata'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsAlu['cur_autndc'] <> Null
      Then
       If QConsAlu['cur_codigo'] = 4 // Farmácia
       Then
        Begin
         If QConsAlu['cur_autdcp'] = 1
         Then
          Begin
           linha2:='Autorização: Portaria nº '+QConsAlu['cur_autndc'];
           linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
          End
         Else
          Begin
           linha2:='Reconhecimento: Portaria nº '+QConsAlu['cur_autndc'];
           linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
          End;
        End
       Else
        If QConsAlu['cur_codigo'] = 19  // Esquema I
        Then
         Begin
          linha2:='Reconhecimento: Portaria nº '+QConsAlu['cur_autndc'];
          linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
         End
        Else
 {// marcelo
        If QCurso['cur_codigo'] = 133  // Engenharia Ambiental
        Then
         Begin
          linha2:='Reconhecimento: Portaria Conjunta nº '+QCurso['cur_autndc'];
          linha3:='D.O.U. de '+DateToStr(QCurso['cur_autdata'])+republicacao+'.';
         End
 //
        Else}
         Begin
          If QConsAlu['cur_autdcp'] = 1
          Then
           Begin
            If vano > 1982
            Then
             Begin
              linha2:='Autorização: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo']);
              linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
             End
            Else
             Begin
              linha2:='Autorização: Decreto Lei nº '+QConsAlu['cur_autndc'];
              linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
             End;
           End
          Else
           Begin
            If vano > 1982
            Then
             Begin
 //             If (((QCurso['cur_area'] = 6) and (QCurso['cur_codigo'] <> 112)) or
 //                (QCurso['cur_codigo'] = 132) or (QCurso['cur_codigo'] = 133) or (QCurso['cur_codigo'] = 335) or
 //                (QCurso['cur_codigo'] = 28) or (QCurso['cur_codigo'] = 130) or (QCurso['cur_codigo'] = 227)) and (QCurso['cur_dataportaria'] <> Null) // Cursos de Tecnologia menos TDW com data da portaria ou Educação Física, Engenharia Ambiental, Arquitetura, Ciências Biológicas - Bacharelado
              If secao = ''
              Then
               Begin
                 If (QConsAlu['cur_dataportaria'] <> Null)
                 Then linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+', de '+DateToStr(QConsAlu['cur_dataportaria'])
                 Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo']);
                 linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+protemec+'.';
               End
              Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+secao+protemec+'.';
             End
            Else
             Begin
              linha2:='Reconhecimento: Decreto Lei nº '+QConsAlu['cur_autndc'];
              linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
             End;
           End;
         End;
     End;

 {// Pedido para sair somente nos cursos de tecnologia menos TDW  "Portaria MEC nº"
    If (QCurso['cur_area'] = 6) and (QCurso['cur_codigo'] <> 112) // Cursos de Tecnologia menos TDW
    Then
     Begin
      tam:=Length(linha2);
      posnum:=Pos('nº',linha2);
      linha2:=Copy(linha2,1, posnum-1)+'MEC '+Copy(linha2,posnum,tam-posnum+1);
     End;}

    If QCurso['cur_codigo'] = 6 // Enfermagem
    Then
     Begin
       If QConsAlu['ahb_conclusao'] <= StrToDate('20/12/2008')
       Then linha1:='Curso : Enfermagem e Obstetrícia'
       Else linha1:='Curso : Enfermagem';
     End
    Else
     If QCurso['cur_codigo'] = 10 // Computação
     Then linha1:='Curso : Ciência da Computação'
     Else
      If QCurso['cur_codigo'] = 13 // Psicologia
      Then
       Begin
         If QConsHab['hab_codigo'] = 3 // formação de psicólogo
         Then linha1:='Curso : Psicologia'
         Else linha1:='Curso : Psicologia'+licenca;
       End
      Else
       If QCurso['cur_codigo'] = 16 // Comunicação Social
       Then linha1:='Curso : Comunicação Social'+licenca
       Else
        If QCurso['cur_codigo'] = 19 // Esquema I
        Then linha1:='Curso : Esquema I - Licenciatura Plena'
        Else
         If QCurso['cur_codigo'] = 26 // Sistemas de Informação
         Then linha1:='Curso : Sistemas de Informação'
         Else
          If (QCurso['cur_codigo'] = 22) and ((QConsHab['hab_codigo'] = 72) or (QConsHab['hab_codigo'] = 16)) // Letras com habilitação em português/inglês
          Then linha1:='Curso : Letras - Português/Inglês e Respectivas Literaturas - Licenciatura'
          Else
           If (QCurso['cur_codigo'] = 132) and ((QConsAlu['ahb_codgra'] = 1) or (QConsAlu['ahb_codgra'] = 2) or (QConsAlu['ahb_codgra'] = 6) or
            (QConsAlu['ahb_codgra'] = 7) or (QConsAlu['ahb_codgra'] = 8) or (QConsAlu['ahb_codgra'] = 3)) // Educação Física - Licenciatura nestas grades deve ser impresso somente Educação Física, de acordo com o chamado #4833
           Then linha1:='Curso : Educação Física'
           Else
            If QCurso['cur_area'] = 6 // Cursos de Tecnologia
            Then
             Begin
              If QCurso['cur_codigo'] = 112 // Superior de Tecnologia em Informática
              Then
               Begin
                If ((QConsAlu['alu_anoing'] = 2005) and (QConsAlu['alu_seming'] = 1)) or (QConsAlu['alu_anoing'] < 2005)
                Then linha1:='Curso Superior de Tecnologia em Informática - Modalidade: Desenv. Web'
                Else linha1:='Curso Superior de Tecnologia em Desenvolvimento Web';
               End
              Else linha1:='Curso '+Trata_Texto(QConsAlu['cur_nomediploma']);
             End
            Else
             If (QConsAlu['cur_codigo'] = 4) and (QConsAlu['ahb_codgra'] >= 17) // No curso de Farmácia, a partir da grade 17, deve sair uma resolução no verso do diploma
             Then linha1:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca+' - Resolução nº 2 CNE/CES, de 19/02/2002'
             Else linha1:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca;
    If linha1 <> ''
    Then ppRichView3.RichView.AddNL(linha1,0,0);
    If linha2 <> ''
    Then ppRichView3.RichView.AddNL(linha2,0,0);
    If linha3 <> ''
    Then ppRichView3.RichView.AddNL(linha3,0,0);
    If linha4 <> ''
    Then ppRichView3.RichView.AddNL(linha4,0,0);
    ppRichView3.RichView.AddNL('',1,1);
    ppRichView3.RichView.Format;

    If QConsAlu['cur_codigo'] = 32 // Turismo
    Then
     Begin
       RTur.Visible:=True;
       RVTur.RichView.Clear;
       RVTur.RichView.Style.TextStyles.Items[0].FontName:='Arial';
       RVTur.RichView.Style.TextStyles.Items[0].Size:=9;
       RVTur.RichView.Style.TextStyles.Items[0].Color:=clBlack;
       RVTur.RichView.Style.TextStyles.Items[0].Style:=[fsBold];

       RVTur.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
       RVTur.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

       RVTur.RichView.AddNL('ESTRUTURA CURRICULAR DO CURSO DE TURISMO COM ÊNFASE EM HOTELARIA.',0,0);
       RVTur.RichView.Format;
     End;

    If (QCurso['cur_codigo'] = 307) or (QCurso['cur_codigo'] = 745) // Licenciatura em Pedagogia, Pedagogia EAD
    Then
     Begin
       RPed.Visible:=True;
       RVPed.RichView.Clear;
       RVPed.RichView.Style.TextStyles.Items[0].FontName:='Arial';
       RVPed.RichView.Style.TextStyles.Items[0].Size:=9;
       RVPed.RichView.Style.TextStyles.Items[0].Color:=clBlack;
       RVPed.RichView.Style.TextStyles.Items[0].Style:=[];

       RVPed.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
       RVPed.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

       If qconsccl['ahb_conclusao'] <= StrToDate('19/06/2019') // A Nair solicitou mudança no quadro a partir de 2/2019
       Then
        Begin
          RVPed.RichView.AddNL(' ',0,0);
          RVPed.RichView.AddNL('APTO(A) AO EXERCÍCIO DA DOCÊNCIA NA EDUCAÇÃO INFANTIL, NOS ANOS INICIAIS DO ENSINO FUNDAMENTAL E ÀS OUTRAS ATIVIDADES PREVISTAS ',0,0);
          RVPed.RichView.AddNL('NA RESOLUÇÃO CNE/CP Nº 1 DE 15/05/06, PUBLICADA NO D.O.U. DE 16/05/06.',0,-1);
        End
       Else
        Begin
          RVPed.RichView.AddNL('APTO(A) AO EXERCÍCIO DA DOCÊNCIA NA EDUCAÇÃO INFANTIL, NOS ANOS INICIAIS DO ENSINO FUNDAMENTAL E ÀS OUTRAS ATIVIDADES PREVISTAS ',0,0);
          RVPed.RichView.AddNL('NA RESOLUÇÃO CNE/CP Nº 1 DE 15/05/06, PUBLICADA NO D.O.U. DE 16/05/06 E RESOLUÇÃO CNE/CP Nº 2 DE 01/02/15, PUBLICADA NO D.O.U. DE 03/07/15.',0,-1);
        End;
       RVPed.RichView.Format;
     End;

   // DecodeDate(QConsAlu['ahb_expedicao'],vano,vmes,vdia);
   // LData.Caption:='Em, '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+'.';
   End;

  ppRichView4.RichView.Clear;
  ppRichView4.RichView.Style.TextStyles.Items[0].FontName:='Arial';
  ppRichView4.RichView.Style.TextStyles.Items[0].Size:=9;
  ppRichView4.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView4.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView4.RichView.Style.TextStyles.Items[1].FontName:='Arial';
  ppRichView4.RichView.Style.TextStyles.Items[1].Size:=5;
  ppRichView4.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView4.RichView.Style.TextStyles.Items[1].Style:=[];

  ppRichView4.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView4.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

  ppRichView4.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView4.RichView.Style.ParaStyles.Items[1].LineSpacing:=10;

  ppRichView4.RichView.AddNL('Diploma Registrado sob nº '+FormatFloat('0000',QConsAlu['nrd_numreg']),0,0);
  ppRichView4.RichView.AddNL(', Livro '+FormatFloat('000',QConsAlu['liv_numero']),0,-1);
  ppRichView4.RichView.AddNL(', Fl. '+FormatFloat('000',QConsAlu['ldf_folha']),0,-1);
  ppRichView4.RichView.AddNL(', Processo nº '+FormatFloat('0000',QILivDip['npd_numero'])+'/'+IntToStr(QILivDip['npd_ano']),0,-1);
  ppRichView4.RichView.AddNL(', nos termos da Lei nº 9394/96 - Art. 48 - § 1º.',0,-1);
  DecodeDate(QConsAlu['ahb_datreg'],vano,vmes,vdia);
  ppRichView4.RichView.AddNL('Presidente Prudente, '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+'.',0,0);
  ppRichView4.RichView.AddNL('',1,1);
  ppRichView4.RichView.Format;
end;

procedure TFRegDip.ENomeImpExit(Sender: TObject);
begin
 If (not ENome.Focused) and (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If Trim(ENomeImp.Text) = ''
  Then ENomeImp.SetFocus
  Else
   If UpperCase(Tira_Acentos(ENome.Text)) <> UpperCase(Tira_Acentos(ENomeImp.Text))
   Then
    Begin
     MessageDlg('Nome social do aluno e nome social a ser impresso devem ser iguais!',mtError,[mbOk],0);
     ENomeImp.SetFocus;
    End;
end;

procedure TFRegDip.RGConsultaExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not DBLCBHab.Focused) and (not B_Cancela.Focused) and
    (not B_Finaliza.Focused) and (not RGFormacao.Visible) and (not CB2Via.Focused)
 Then
  Begin
    B_Ok.Enabled:=True;
    B_Ok.SetFocus;
  End;
end;

procedure TFRegDip.RGFormacaoExit(Sender: TObject);
begin
 If (not MERA.Focused) and (not DBLCBHab.Focused) and (not B_Cancela.Focused) and
    (not B_Finaliza.Focused)
 Then
  If RGFormacao.ItemIndex = 0 // somente formação
  Then
   Begin
     B_Ok.Enabled:=True;
     B_Ok.SetFocus;
   End
  Else
   If RGFormacao.ItemIndex = 1 // bacharelado
   Then
    Begin
      QAux.Close;
      QAux.Sql.Clear;
      QAux.Sql.Add('select * from sca_alu_hab');
      QAux.Sql.Add('where alu_ra =:ra and hab_codigo = 1');
      QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
      QAux.Open;
      If (QAux['ahb_conclusao'] <> Null) and (QAux['ahb_colacao'] <> Null)
      Then
       Begin
         dtconcl1:=QAux['ahb_conclusao'];
         dtcol1:=QAux['ahb_colacao'];
         B_Ok.Enabled:=True;
         B_Ok.SetFocus;
       End
      Else
       Begin
         MessageDlg('Datas de conclusão e colação no Bacharelado devem estar cadastradas!',mtError,[mbOk],0);
         MERA.SetFocus;
       End;
    End
   Else
    Begin // bacharelado e licenciatura
      QAux.Close;
      QAux.Sql.Clear;
      QAux.Sql.Add('select * from sca_alu_hab');
      QAux.Sql.Add('where alu_ra =:ra and hab_codigo = 1');
      QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
      QAux.Open;
      If (QAux['ahb_conclusao'] <> Null) and (QAux['ahb_colacao'] <> Null)
      Then
       Begin
         dtconcl1:=QAux['ahb_conclusao'];
         dtcol1:=QAux['ahb_colacao'];
         QAux.Close;
         QAux.Sql.Clear;
         QAux.Sql.Add('select * from sca_alu_hab');
         QAux.Sql.Add('where alu_ra =:ra and hab_codigo = 2');
         QAux.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
         QAux.Open;
         If (QAux['ahb_conclusao'] <> Null) and (QAux['ahb_colacao'] <> Null)
         Then
          Begin
            dtconcl2:=QAux['ahb_conclusao'];
            dtcol2:=QAux['ahb_colacao'];
            B_Ok.Enabled:=True;
            B_Ok.SetFocus;
          End
         Else
          Begin
            MessageDlg('Datas de conclusão e colação na Licenciatura devem estar cadastradas!',mtError,[mbOk],0);
            MERA.SetFocus;
          End;
       End
      Else
       Begin
         MessageDlg('Datas de conclusão e colação no Bacharelado devem estar cadastradas!',mtError,[mbOk],0);
         MERA.SetFocus;
       End;
    End;
end;

// margem esquerda original : 245

// margem esquerda para novo formulário do diploma : 260
// diminuir 40 pontos no tamanho dos campos richview e richtext e recuar 40 pontos a imagem do curso de direito

procedure TFRegDip.ECivilExit(Sender: TObject);
begin
  If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
  Then
   If Trim(ECivil.Text) = ''
   Then ECivil.SetFocus
   Else
    Begin
      ECivilImp.Text:=Trata_Texto(ECivil.Text);
      RGDefinitivo.Visible:=UpperCase(Tira_Acentos(ENome.Text)) <> UpperCase(Tira_Acentos(ECivil.Text));
    End;
end;

procedure TFRegDip.ECivilImpExit(Sender: TObject);
begin
  If (not ECivil.Focused) and (not B_Cancela.Focused) and (not B_Finaliza.Focused)
  Then
   If Trim(ECivilImp.Text) = ''
   Then ECivilImp.SetFocus
   Else
    If UpperCase(Tira_Acentos(ECivil.Text)) <> UpperCase(Tira_Acentos(ECivilImp.Text))
    Then
     Begin
      MessageDlg('Nome civil do aluno e nome civil a ser impresso devem ser iguais!',mtError,[mbOk],0);
      ECivilImp.SetFocus;
     End;
end;

procedure TFRegDip.DERegistroExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
 Then
  If DERegistro.Date = 0
  Then DERegistro.SetFocus;
end;

procedure TFRegDip.CENroDiplExit(Sender: TObject);
begin
  If (not B_Cancela.Focused)
  Then
   If CENroDipl.Value <> 0
   Then
    Begin
      QAux.Close;
      QAux.Sql.Clear;
      QAux.Sql.Add('select * from sca_itenslivdip');
      QAux.Sql.Add('where itl_nrodiploma =:nro and alu_ra <>:ra');
      QAux.ParamByName('nro').AsInteger:=CENroDipl.AsInteger;
      QAux.ParamByName('ra').AsFloat:=MERA.Value;
      QAux.Open;
      If not QAux.Eof
      Then
       Begin
         MessageDlg('Número de diploma já cadastrado!',mtError,[mbOk],0);
         CENroDipl.SetFocus;
       End;
    End;
end;

procedure TFRegDip.RGImpExit(Sender: TObject);
begin
  If (not MERA.Focused) and (not DBLCBHab.Focused) and (not B_Cancela.Focused) and
     (not B_Finaliza.Focused)
  Then
   Begin
     B_Ok.Enabled:=True;
     B_Ok.SetFocus;
   End;
end;

procedure TFRegDip.ppDetailBand3BeforePrint(Sender: TObject);
var vdia,vmes,vano,a,tamfont, vdia2, vmes2, vano2:word;
    licenca, texto, pais, vtitulo:string;
    tamtext,tamrich: single;
begin
  licenca:='';
  If QConsAlu['cur_codigo'] = 13 // Psicologia
  Then
   Begin
    If (NULLToZero(QGraLet['grl_anoinicio']) < 2006) or ((NULLToZero(QGraLet['grl_anoinicio']) = 2006) and (NULLToZero(QGraLet['grl_seminicio']) = 1)) // Psicologia até 1/2006 deve aparecer a habilitação
    Then
     Begin
       Case StrToInt(DBLCBHab.Value)  of
         1:licenca:=' - Bacharelado';
         2:licenca:=' - Licenciatura';
         3:licenca:=' - Formação de Psicólogo';
       End;
     End;
   End
  Else
   If QConsHab['hab_licenca'] <> null
   Then
    Begin
     If QConsAlu['cur_codigo'] = 23  // Pedagogia
     Then
      Begin
       licenca:=' - Plena';
 {      Case QConsHab['hab_licenca'] of
         1:licenca:=' - 1º Grau';
         2:licenca:=' - Plena';
         3:licenca:=' - Plena para Licenciados';
       End;}
      End
     Else
      Begin
       Case QConsHab['hab_licenca'] of
         1:licenca:=' - Licenciatura 1º Grau';
         2:licenca:=' - Licenciatura Plena';
         3:licenca:=' - Licenciatura Plena Para Licenciados';
       End;
       If QConsHab['hab_ligacao'] <> 0
       Then
        If QConsAlu['cur_codigo'] = 18 // Educação Artística
        Then licenca:=licenca + ' com Habilitação em '+Trata_Texto(QConsHab['hab_nomhb1'])
        Else licenca:=licenca + ' em '+Trata_Texto(QConsHab['hab_nomhb1']);
      End;
    End;
  ppRichView1P.RichView.Clear;
  ppRichView1P.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
  ppRichView1P.RichView.Style.TextStyles.Items[0].Size:=15;
  ppRichView1P.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView1P.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView1P.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView1P.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

 // Utilizado para dar um espaço maior na última linha do parágrafo evitando assim cortar letras como 'f' e 'g'
  ppRichView1P.RichView.Style.TextStyles.Items[1].FontName:='Monotype Corsiva';
  ppRichView1P.RichView.Style.TextStyles.Items[1].Size:=2;
  ppRichView1P.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView1P.RichView.Style.TextStyles.Items[1].Style:=[];

  ppRichView1P.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView1P.RichView.Style.ParaStyles.Items[1].LineSpacing:=0;

  DecodeDate(QConsAlu['ahb_conclusao'],vano,vmes,vdia);
  DecodeDate(QConsAlu['ahb_colacao'],vano2,vmes2,vdia2);
  If QCurso['cur_codigo'] = 133 // Engenharia Ambiental dar um espaço maior antes da cidade
  Then ppRichView1P.RichView.AddNL('',0,0);
  If QCurso['cur_codigo'] = 6 // Enfermagem
  Then
   Begin
     If QConsAlu['ahb_conclusao'] <= StrToDate('20/12/2008')
     Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                      'Enfermagem e Obstetrícia em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                      StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
 // A Roberta pediu para alterar para conclusão até 20/12/2008, incluindo a colação de grau - 26/06/2019
 //    Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
 //                                     'Enfermagem e Obstetrícia em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', confere o título de',0,0)
     Else ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                     'Enfermagem em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                     StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);
   End
  Else
   If QCurso['cur_codigo'] = 10 // Computação
   Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                   'Ciência da Computação em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                   StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
   Else
    If QCurso['cur_codigo'] = 16 // Comunicação Social
    Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                    'Comunicação Social em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                    StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
    Else
     If QCurso['cur_codigo'] = 19 // Esquema I
     Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                     'Graduação de Professores da Parte de Formação Esp. do Currículo do Ensino de 2º Grau - Esquema I - Licenciatura Plena em '+StrZero(vdia,2)+
                                     ' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                     StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
     Else
      If QCurso['cur_codigo'] = 26 // Sistemas de Informação
      Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                      'Sistemas de Informação em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                      StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
      Else
       If QCurso['cur_codigo'] = 112 // Superior de Tecnologia em Informática
       Then
        Begin
         If ((QConsAlu['alu_anoing'] = 2005) and (QConsAlu['alu_seming'] = 1)) or (QConsAlu['alu_anoing'] < 2005)
         Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
                                         'Superior de Tecnologia em Informática - Modalidade: Desenvolvimento Web, em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                         StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
         Else ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
                                         'Superior de Tecnologia em Desenvolvimento Web, da Área Profissional de Informática, em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                         StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);
        End
       Else
        If (QCurso['cur_codigo'] = 22) and ((QConsHab['hab_codigo'] = 72) or (QConsHab['hab_codigo'] = 16)) // Letras com habilitação em português/inglês
        Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                        'Letras - Português/Inglês e Respectivas Literaturas - Licenciatura em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                        StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
        Else
         If (QCurso['cur_codigo'] = 132) and ((QConsAlu['ahb_codgra'] = 1) or (QConsAlu['ahb_codgra'] = 2) or (QConsAlu['ahb_codgra'] = 6) or
            (QConsAlu['ahb_codgra'] = 7) or (QConsAlu['ahb_codgra'] = 8) or (QConsAlu['ahb_codgra'] = 3)) // Educação Física - Licenciatura nestas grades deve ser impresso somente Educação Física, de acordo com o chamado #4833
         Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                         'Educação Física em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                         StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0)
         Else
          If QCurso['cur_area'] = 6 // Cursos de Tecnologia
          Then
           Begin
   //         If QCurso['cur_codigo'] = 145 // Superior de Tecnologia em Música
   //         Then ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
   //                                         'Superior de Tecnologia em Música : Linguagens, Produção e Multimeios, em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', confere o título de',0,0);
            ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso '+
                                       Trata_Texto(QConsAlu['cur_nomediploma'])+licenca+' em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                       StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);
           End
          Else ppRichView1P.RichView.AddNL('                        O Reitor da Universidade do Oeste Paulista, no uso de suas atribuições e tendo em vista a conclusão do Curso de '+
                                          Trata_Texto(QConsAlu['cur_nomediploma'])+licenca+' em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+', e a colação de grau em '+
                                          StrZero(vdia2,2)+' de '+LowerCase(Trata_Texto(Mes[vmes2]))+' de '+IntToStr(vano2)+', confere o título de',0,0);

  ppRichView1P.RichView.AddNL('',1,1);
  ppRichView1P.RichView.AddNL('',1,1);
  ppRichView1P.RichView.AddNL('',1,1);

//  ppRichView1P.RichView.Format;

  RVTitulo.RichView.Clear;
  RVTitulo.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
  RVTitulo.RichView.Style.TextStyles.Items[0].Size:=30;
  RVTitulo.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  RVTitulo.RichView.Style.TextStyles.Items[0].Style:=[];

  RVTitulo.RichView.Style.ParaStyles.Items[0].Alignment:=rvaCenter;
  RVTitulo.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

  RVTitulo.RichView.Style.TextStyles.Items[1].FontName:='Monotype Corsiva';
  RVTitulo.RichView.Style.TextStyles.Items[1].Size:=33;
  RVTitulo.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  RVTitulo.RichView.Style.TextStyles.Items[1].Style:=[];

  RVTitulo.RichView.Style.ParaStyles.Items[1].Alignment:=rvaCenter;
  RVTitulo.RichView.Style.ParaStyles.Items[1].LineSpacing:=100;

  RVTitulo.RichView.Style.TextStyles.Items[2].FontName:='Monotype Corsiva';
  RVTitulo.RichView.Style.TextStyles.Items[2].Size:=2;
  RVTitulo.RichView.Style.TextStyles.Items[2].Color:=clBlack;
  RVTitulo.RichView.Style.TextStyles.Items[2].Style:=[];

  vtitulo:='';
  If QConsAlu['cur_codigo'] = 13  // Psicologia
  Then
   Begin
    Case StrToInt(DBLCBHab.Value)  of
      1:If QConsAlu['pes_sexo'] = 1  // masculino
        Then vtitulo:='Bacharel em Psicologia'
        Else vtitulo:='Bacharela em Psicologia';
      2:If QConsAlu['pes_sexo'] = 1  // masculino
        Then vtitulo:='Licenciado'
        Else vtitulo:='Licenciada';
      3:If QConsAlu['pes_sexo'] = 1  // masculino
        Then vtitulo:='Psicólogo'
        Else vtitulo:='Psicóloga';
    End;
   End
  Else
   If ((QCurso['fac_codigo'] = 1) and (QCurso['cur_nomtit'] = Null)) or (QCurso['cur_codigo'] = 132) // Faclepp sem título definido ou Educação Física
   Then
    Begin
     If QConsAlu['pes_sexo'] = 1  // masculino
     Then vtitulo:='Licenciado'
     Else vtitulo:='Licenciada';
    End
   Else
    If QConsAlu['cur_codigo'] = 112 // Superior de Tecnologia em Desenvolvimento Web
    Then
     Begin
      If ((QConsAlu['alu_anoing'] = 2005) and (QConsAlu['alu_seming'] = 1)) or (QConsAlu['alu_anoing'] < 2005)
      Then
       Begin
         If QConsAlu['pes_sexo'] = 1  // masculino
         Then vtitulo:='Tecnólogo' // vtitulo:='Tecnólogo em Informática' Moisés pediu para deixar somente tecnólogo como nos outros cursos de tecnologia da fipp 09/11/2011
         Else vtitulo:='Tecnóloga'; // vtitulo:='Tecnólogo em Informática' Moisés pediu para deixar somente tecnólogo como nos outros cursos de tecnologia da fipp 09/11/2011
       End
      Else vtitulo:=Trata_Texto(NULLToSpace(QConsAlu['cur_nomtit']));
     End
    Else vtitulo:=Trata_Texto(NULLToSpace(QConsAlu['cur_nomtit']));

  RVTitulo.RichView.AddNL(vtitulo,0,0);
  RVTitulo.RichView.AddNL('a   '+Trim(Nome_Aluno(ENomeImp.Text,ECivilImp.Text,QConsAlu['pes_nomedefinitivo'],false)),1,1);
  RVTitulo.RichView.AddNL('',2,0);

//  RVTitulo.RichView.Format;
  
  RVNacionalidade.RichView.Clear;
  RVNacionalidade.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
  RVNacionalidade.RichView.Style.TextStyles.Items[0].Size:=15;
  RVNacionalidade.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  RVNacionalidade.RichView.Style.TextStyles.Items[0].Style:=[];

  RVNacionalidade.RichView.Style.ParaStyles.Items[0].Alignment:=rvaCenter;
  RVNacionalidade.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

  RVNacionalidade.RichView.Style.TextStyles.Items[1].FontName:='Monotype Corsiva';
  RVNacionalidade.RichView.Style.TextStyles.Items[1].Size:=2;
  RVNacionalidade.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  RVNacionalidade.RichView.Style.TextStyles.Items[1].Style:=[];

  RVNacionalidade.RichView.Style.ParaStyles.Items[1].Alignment:=rvaCenter;
  RVNacionalidade.RichView.Style.ParaStyles.Items[1].LineSpacing:=0;

  RVNacionalidade.RichView.AddNL('',1,1);
  RVNacionalidade.RichView.AddNL('',1,1);

  If (QConsAlu['nac_codigo'] = 1) or (QConsAlu['nac_codigo'] = 9) // Brasileiro ou Brasileiro Naturalizado
  Then
   Begin
     If (QConsAlu['nac_codigo'] = 9) // Brasileiro Naturalizado
     Then
      Begin
        If QConsAlu['pes_sexo'] = 1  //Masculino
        Then RVNacionalidade.RichView.AddNL('RG nº '+QConsAlu['pes_rg']+'-'+NULLToSpace(QConsAlu['pes_orgexp'])+'/'+NULLToSpace(QConsAlu['pes_estexp'])+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descmasc']),0,0)
        Else RVNacionalidade.RichView.AddNL('RG nº '+QConsAlu['pes_rg']+'-'+NULLToSpace(QConsAlu['pes_orgexp'])+'/'+NULLToSpace(QConsAlu['pes_estexp'])+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descricao']),0,0);
      End
     Else RVNacionalidade.RichView.AddNL('RG nº '+QConsAlu['pes_rg']+'-'+NULLToSpace(QConsAlu['pes_orgexp'])+'/'+NULLToSpace(QConsAlu['pes_estexp'])+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descricao']),0,0);
   End
  Else RVNacionalidade.RichView.AddNL(NULLToSpace(QConsAlu['tde_sigla'])+' nº '+QConsAlu['pes_rg']+'          nacionalidade: '+Trata_Texto(QConsAlu['nac_descricao']),0,0);

//  RVNacionalidade.RichView.Format;

  ppRichView2P.RichView.Clear;
  ppRichView2P.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
  ppRichView2P.RichView.Style.TextStyles.Items[0].Size:=15;
  ppRichView2P.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView2P.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView2P.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView2P.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

 // Utilizado para dar um espaço maior na última linha do parágrafo evitando assim cortar letras como 'f' e 'g'
  ppRichView2P.RichView.Style.TextStyles.Items[1].FontName:='Monotype Corsiva';
  ppRichView2P.RichView.Style.TextStyles.Items[1].Size:=2;
  ppRichView2P.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView2P.RichView.Style.TextStyles.Items[1].Style:=[];

  ppRichView2P.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView2P.RichView.Style.ParaStyles.Items[1].LineSpacing:=0;

  DecodeDate(QConsAlu['pes_datnas'],vano,vmes,vdia);
  If (QConsAlu['nac_codigo'] = 1) or (QConsAlu['nac_codigo'] = 9) // Brasileiro ou Brasileiro naturalizado
  Then
   Begin
    If not QLocalidade.Eof
    Then
     Begin
      If (QConsAlu['nac_codigo'] = 1) and ((Pos('(',QLocalidade['loc_nome']) <> 0) or (Pos('(',NULLToSpace(QLocalidade['loc_obs'])) <> 0)) // Brasileiro com Cidade de Nascimento no Exterior
      Then
       Begin
        pais:=Trata_Texto(QLocalidade['loc_nome']+' '+NULLToSpace(QLocalidade['loc_obs']));
 //       pais:=Copy(pais,1,pos('(',pais))+uppercase(pais[pos('(',pais)+1])+Copy(pais,pos('(',pais)+2,Length(pais));
        pais:=Copy(pais,1,pos('(',pais) - 1)+'- '+uppercase(pais[pos('(',pais)+1])+Copy(pais,(Pos('(',pais)+2),(Pos(')',pais) - Pos('(',pais) - 2));
        If QConsAlu['pes_sexo'] = 1  //Masculino
        Then ppRichView2P.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                   ', natural de '+pais+
                                   ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
        Else ppRichView2P.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                   ', natural de '+pais+
                                   ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
       End
      Else
       If (QConsAlu['nac_codigo'] <> 9) and (Pos('(',QLocalidade['loc_nome']) = 0) // Não pe brasileiro naturalizado ou Cidade de Nascimento não é do Exterior
       Then
        Begin
         If QConsAlu['pes_sexo'] = 1  //Masculino
         Then
          Begin
            If NULLToSpace(QLocalidade['loc_uf']) <> 'DF' // distrito federal
            Then ppRichView2P.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                            ', natural do Estado '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                            ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
            Else ppRichView2P.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                            ', natural '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                            ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
          End
         Else
          If NULLToSpace(QLocalidade['loc_uf']) <> 'DF' // distrito federal
          Then ppRichView2P.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                          ', natural do Estado '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                          ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
          Else ppRichView2P.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                          ', natural '+QLocalidade['est_preposicao']+' '+Trata_Texto(QLocalidade['est_descr'])+
                                          ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
        End
       Else
        Begin
         If (Pos('(',QLocalidade['loc_nome']) <> 0)
         Then pais:=Copy(QLocalidade['loc_nome'],(Pos('(',QLocalidade['loc_nome'])+1),(Pos(')',QLocalidade['loc_nome']) - Pos('(',QLocalidade['loc_nome']) - 1))
         Else pais:=Copy(NULLToSpace(QLocalidade['loc_obs']),(Pos('(',NULLToSpace(QLocalidade['loc_obs']))+1),(Pos(')',NULLToSpace(QLocalidade['loc_obs'])) - Pos('(',NULLToSpace(QLocalidade['loc_obs'])) - 1));
         If QConsAlu['pes_sexo'] = 1  //Masculino
         Then ppRichView2P.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                    ', natural do País - '+Trata_Texto(pais)+
                                    ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
         Else ppRichView2P.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                    ', natural do País - '+Trata_Texto(pais)+
                                    ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
        End;
     End;
   End
  Else
   If not QLocalidade.Eof
   Then
    Begin
      If (Pos('(',QLocalidade['loc_nome']) <> 0)
      Then pais:=Copy(QLocalidade['loc_nome'],(Pos('(',QLocalidade['loc_nome'])+1),(Pos(')',QLocalidade['loc_nome']) - Pos('(',QLocalidade['loc_nome']) - 1))
      Else pais:=NULLToSpace(QConsAlu['nac_pais']);
      If QConsAlu['pes_sexo'] = 1  //Masculino
      Then ppRichView2P.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                 ', natural do País - '+Trata_Texto(pais)+
                                 ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
      Else ppRichView2P.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                                 ', natural do País - '+Trata_Texto(pais)+
                                 ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);
    End
   Else
    If QConsAlu['pes_sexo'] = 1  //Masculino
    Then ppRichView2P.RichView.AddNL('nascido em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                               ', natural do País - '+Trata_Texto(NULLToSpace(QConsAlu['nac_pais']))+
                               ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0)
    Else ppRichView2P.RichView.AddNL('nascida em '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+
                               ', natural do País - '+Trata_Texto(NULLToSpace(QConsAlu['nac_pais']))+
                               ' e outorga-lhe o presente Diploma, a fim de que possa gozar de todos os direitos e prerrogativas legais.',0,0);

  ppRichView2P.RichView.AddNL('',1,1);
//  ppRichView2P.RichView.Format;

  RVCidade.RichView.Clear;
  RVCidade.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
  RVCidade.RichView.Style.TextStyles.Items[0].Size:=15;
  RVCidade.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  RVCidade.RichView.Style.TextStyles.Items[0].Style:=[];

  RVCidade.RichView.Style.ParaStyles.Items[0].Alignment:=rvaRight;
  RVCidade.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

  DecodeDate(QConsAlu['ahb_expedicao'],vano,vmes,vdia);
  RVCidade.RichView.AddNL('Presidente Prudente, '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+'.',0,0);

//  RVCidade.RichView.Format;
  
  RVValidacao.RichView.Clear;
  RVValidacao.RichView.Style.TextStyles.Items[0].FontName:='Monotype Corsiva';
  RVValidacao.RichView.Style.TextStyles.Items[0].Size:=10;
  RVValidacao.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  RVValidacao.RichView.Style.TextStyles.Items[0].Style:=[];

  RVValidacao.RichView.Style.ParaStyles.Items[0].Alignment:=rvaRight;
  RVValidacao.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

  RVValidacao.RichView.AddNL('https://diplomas.unoeste.br',0,0);
  RVValidacao.RichView.AddNL('Código de Validação',0,0);
  RVValidacao.RichView.AddNL(QILivDip['itl_codigovalidacao'],0,0);
//  RVValidacao.RichView.Format;
end;

procedure TFRegDip.ppImagePrint(Sender: TObject);
begin
  ppImage.Picture.LoadFromFile('c:\sistemas\qrcode.bmp');
end;

procedure TFRegDip.ppTitleBand2BeforeGenerate(Sender: TObject);
var licenca,licenca2,renov,republicacao,secao,
    linha1,linha2,linha3,linha4:string;
    tam,posnum,vano,vmes,vdia:word;
begin
  ppRichView3P.RichView.Clear;
  ppRichView3P.RichView.Style.TextStyles.Items[0].FontName:='Arial';
  ppRichView3P.RichView.Style.TextStyles.Items[0].Size:=9;
  ppRichView3P.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView3P.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView3P.RichView.Style.TextStyles.Items[1].FontName:='Arial';
  ppRichView3P.RichView.Style.TextStyles.Items[1].Size:=5;
  ppRichView3P.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView3P.RichView.Style.TextStyles.Items[1].Style:=[];

  ppRichView3P.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView3P.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

  ppRichView3P.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView3P.RichView.Style.ParaStyles.Items[1].LineSpacing:=10;

  linha1:='';
  linha2:='';
  linha3:='';
  linha4:='';

  licenca:='';
  licenca2:='';
  secao:='';
  RPedP.Visible:=False; // quadro específico para os cursos 307 - Licenciatura em Pedagogia e 745 - Pedagogia EAD
  RTurP.Visible:=False; // turismo
  RPsiP.Visible:=False; // psicologia

  If (Trim(NULLToSpace(QConsAlu['cur_autsecao'])) <> '') and (Trim(NULLToSpace(QConsAlu['cur_autpag'])) <> '') and
     (Trim(NULLToSpace(QConsAlu['cur_nautdou'])) <> '') and (QConsAlu['cur_dataportaria'] <> Null) and (QConsAlu['cur_autdata'] <> Null)
  Then secao:=', de '+DateToStr(QConsAlu['cur_dataportaria'])+', D.O.U. nº'+QConsAlu['cur_nautdou']+
              ', Seção '+QConsAlu['cur_autsecao']+', pág.'+QConsAlu['cur_autpag']+', de '+DateToStr(QConsAlu['cur_autdata'])+'.';

  If (QConsAlu['cur_codigo'] = 20) //Estudos Sociais
  Then
   Begin
    If QConsHab['hab_licenca'] <> null
    Then
     Begin
      Case QConsHab['hab_licenca'] of
        1:Begin
           licenca:=' - licenciatura 1º grau';
           licenca2:=' - lic. 1º grau';
          End;
        2:Begin
           licenca:=' - licenciatura plena';
           licenca2:=' - lic. plena';
          end;
        3:Begin
           licenca:=' - licenciatura plena para licenciados';
           licenca2:=' - lic. plena para licenciados';
          End;
      End;
     End;
    If (QConsHab['hab_ligacao'] <> 0) and (QConsHab['hab_ligacao'] <> Null)
    Then
     Begin
      DecodeDate(QConsAlu['cur_autdata'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsAlu['cur_autndc'] <> Null
      Then
       Begin
        If QConsAlu['cur_autdcp'] = 1
        Then
         Begin
          If vano > 1982
          Then linha2:='Reconhecimento: Portaria n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata'])
          Else linha2:='Autorização: Decreto Lei n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata']);
         End
        Else
         Begin
          If vano > 1982
          Then linha2:='Reconhecimento: Portaria n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata'])
          Else linha2:='Reconhecimento: Decreto Lei n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata']);
         End;
       End;
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      linha1:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca;
      licenca2:=licenca2 + ' com hab. em '+Trata_Texto(QConsHab['hab_nomhb1']);
      linha3:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca2;
      If QConsHab['hab_autdoc'] <> Null
      Then
       Begin
        If QConsHab['hab_autdcp'] = 1
        Then
         Begin
          If vano > 1982
          Then linha4:='Autorização: Portaria n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat'])
          Else linha4:='Autorização: Decreto Lei n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat']);
         End
        Else
         Begin
          If vano > 1982
          Then linha4:='Reconhecimento: Portaria n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat'])
          Else linha4:='Reconhecimento: Decreto Lei n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat']);
         End;
       End;
      
      If linha1 <> ''
      Then ppRichView3P.RichView.AddNL(linha1,0,0);
      If linha2 <> ''
      Then ppRichView3P.RichView.AddNL(linha2,0,0);
      If linha3 <> ''
      Then ppRichView3P.RichView.AddNL(linha3,0,0);
      If linha4 <> ''
      Then ppRichView3P.RichView.AddNL(linha4,0,0);
     End
    Else
     Begin
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsHab['hab_autdcp'] = 1
      Then
       Begin
        If vano > 1982
        Then
         Begin
          linha2:='Autorização: Portaria nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End
        Else
         Begin
          linha2:='Autorização: Decreto Lei nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End;
       End
      Else
       Begin
        If vano > 1982
        Then
         Begin
          linha2:='Reconhecimento: Portaria nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End
        Else
         Begin
          linha2:='Reconhecimento: Decreto Lei nº '+QConsHab['hab_autdoc'];
          linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
         End;
       End;
      If linha1 <> ''
      Then ppRichView3P.RichView.AddNL(linha1,0,0);
      If linha2 <> ''
      Then ppRichView3P.RichView.AddNL(linha2,0,0);
      If linha3 <> ''
      Then ppRichView3P.RichView.AddNL(linha3,0,0);
      If linha4 <> ''
      Then ppRichView3P.RichView.AddNL(linha4,0,0);
     End;
    ppRichView3P.RichView.AddNL('',1,1);
//    ppRichView3P.RichView.Format;
   End
  Else
   Begin
    linha4:=Renovacao3(QConsAlu,1,2);
    If linha4 <> ''
    Then linha4:=linha4 + '.';
    If QConsAlu['cur_codigo'] = 13  // Psicologia
    Then
     Begin
      If (NULLToZero(QGraLet['grl_anoinicio']) < 2006) or ((NULLToZero(QGraLet['grl_anoinicio']) = 2006) and (NULLToZero(QGraLet['grl_seminicio']) = 1)) // Psicologia até 1/2006 deve aparecer a habilitação
      Then
       Begin
         Case StrToInt(DBLCBHab.Value)  of
           1:licenca:=' - Bacharelado';
           2:licenca:=' - Licenciatura';
           3:licenca:=' - Formação de Psicólogo';
         End;
       End;
      If (StrToInt(DBLCBHab.Value) = 3) and (RGFormacao.ItemIndex <> 0) // Formação de Psicólogo
      Then
       Begin
         RPsiP.Visible:=True;
         RVPsiP.RichView.Clear;
         RVPsiP.RichView.Style.TextStyles.Items[0].FontName:='Arial';
         RVPsiP.RichView.Style.TextStyles.Items[0].Size:=9;
         RVPsiP.RichView.Style.TextStyles.Items[0].Color:=clBlack;
         RVPsiP.RichView.Style.TextStyles.Items[0].Style:=[];

         RVPsiP.RichView.Style.TextStyles.Items[1].FontName:='Arial';
         RVPsiP.RichView.Style.TextStyles.Items[1].Size:=9;
         RVPsiP.RichView.Style.TextStyles.Items[1].Color:=clBlack;
         RVPsiP.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

         RVPsiP.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
         RVPsiP.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

         RVPsiP.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
         RVPsiP.RichView.Style.ParaStyles.Items[1].LineSpacing:=150;

         RVPsiP.RichView.AddNL('Concluiu o curso de ',0,0);
         If RGFormacao.ItemIndex = 1 // Formação - Bacharelado
         Then
          Begin
            RVPsiP.RichView.AddNL('Psicologia - Bacharelado ',1,-1);
            RVPsiP.RichView.AddNL('em '+DateToStr(dtconcl1)+' e colou grau em '+DateToStr(dtcol1)+'.',0,-1);
          End
         Else
          If (dtconcl1 = dtconcl2) and (dtcol1 = dtcol2)
          Then
           Begin
             RVPsiP.RichView.AddNL('Psicologia - Bacharelado e Licenciatura ',1,-1);
             RVPsiP.RichView.AddNL('em '+DateToStr(dtconcl1)+' e colou grau em '+DateToStr(dtcol1)+'.',0,-1);
           End
          Else
           Begin
             RVPsiP.RichView.AddNL('Psicologia - Bacharelado ',1,-1);
             RVPsiP.RichView.AddNL('em '+DateToStr(dtconcl1)+', colou grau em '+DateToStr(dtcol1)+', ',0,-1);
             RVPsiP.RichView.AddNL('Psicologia - Licenciatura ',1,-1);
             RVPsiP.RichView.AddNL('em '+DateToStr(dtconcl2)+' e colou grau em '+DateToStr(dtcol2)+'.',0,-1);
           End;
//         RVPsiP.RichView.Format;
       End;
     End
    Else
     If QConsHab['hab_licenca'] <> null
     Then
      Begin
       If (QConsAlu['cur_codigo'] = 23) // or (QConsAlu['cur_codigo'] = 104) or (QConsAlu['cur_codigo'] = 101) or (QConsAlu['cur_codigo'] = 102) // Pedagogia, Matemática, Ciências Biológicas e Química
       Then
        Begin
          If (QConsAlu['cur_codigo'] = 23) // Pedagogia
          Then licenca:=' - lic. plena'
          Else licenca:=' - Licenciatura';
    {      Case QConsHab['hab_licenca'] of
            1:licenca:=' - 1º GRAU';
            2:licenca:=' - PLENA';
            3:licenca:=' - PLENA PARA LICENCIADOS';
          End;}
        End
       Else
        Begin
         Case QConsHab['hab_licenca'] of
           1:licenca:=' - lic. 1º grau';
           2:licenca:=' - lic. plena';
           3:licenca:=' - lic. plena para licenciados';
         End;
         If QConsHab['hab_ligacao'] <> 0
         Then licenca:=licenca + ' com hab. em '+Trata_Texto(QConsHab['hab_nomhb1']);
        End;
      End;

    If ((QConsHab['hab_ligacao'] <> 0) and (QConsHab['hab_ligacao'] <> Null) and (QConsAlu['cur_codigo'] <> 13)) or (QConsHab['hab_codigo'] = 15) // Diploma pediu para imprimir decreto da habilitação 15 e não a que está cadastrada no curso - 02/03/2011
    Then
     Begin
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsHab['hab_autdoc'] <> Null
      Then
       If QConsHab['cur_codigo'] = 4 // Farmácia
       Then
        Begin
         If QConsHab['hab_autdcp'] = 1
         Then
          Begin
           linha2:='Autorização: Portaria nº '+QConsHab['hab_autdoc'];
           linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
          End
         Else
          Begin
           linha2:='Reconhecimento: Portaria nº '+QConsHab['hab_autdoc'];
           linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
          End;
        End
       Else
        Begin
         If QConsHab['hab_autdcp'] = 1
         Then
          Begin
           If vano > 1982
           Then
            Begin
             linha2:='Autorização: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo']);
             linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
            End
           Else
            Begin
             linha2:='Autorização: Decreto Lei nº '+QConsHab['hab_autdoc'];
             linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
            End;
          End
         Else
          Begin
           If vano > 1982
           Then
            Begin
             If secao = ''
             Then
              Begin
                If (QCurso['cur_area'] = 6) and (QCurso['cur_codigo'] <> 112) and (QConsHab['hab_dataportaria'] <> Null) // Cursos de Tecnologia menos TDW com data da portaria
                Then linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+', de '+DateToStr(QConsHab['hab_dataportaria'])
                Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo']);
                linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
              End
             Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+secao;
            End
           Else
            Begin
             linha2:='Reconhecimento: Decreto Lei nº '+QConsHab['hab_autdoc'];
             linha3:='D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+'.';
            End;
          End;
        End;
     End
    Else
     Begin
      republicacao:='';
      If QConsAlu['cur_dtrepublicacao'] <> Null
      Then republicacao:=' (Republicada em '+DateToStr(QConsAlu['cur_dtrepublicacao'])+')';
      DecodeDate(QConsAlu['cur_autdata'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsAlu['cur_autndc'] <> Null
      Then
       If QConsAlu['cur_codigo'] = 4 // Farmácia
       Then
        Begin
         If QConsAlu['cur_autdcp'] = 1
         Then
          Begin
           linha2:='Autorização: Portaria nº '+QConsAlu['cur_autndc'];
           linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
          End
         Else
          Begin
           linha2:='Reconhecimento: Portaria nº '+QConsAlu['cur_autndc'];
           linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
          End;
        End
       Else
        If QConsAlu['cur_codigo'] = 19  // Esquema I
        Then
         Begin
          linha2:='Reconhecimento: Portaria nº '+QConsAlu['cur_autndc'];
          linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
         End
        Else
 {// marcelo
        If QCurso['cur_codigo'] = 133  // Engenharia Ambiental
        Then
         Begin
          linha2:='Reconhecimento: Portaria Conjunta nº '+QCurso['cur_autndc'];
          linha3:='D.O.U. de '+DateToStr(QCurso['cur_autdata'])+republicacao+'.';
         End
 //
        Else}
         Begin
          If QConsAlu['cur_autdcp'] = 1
          Then
           Begin
            If vano > 1982
            Then
             Begin
              linha2:='Autorização: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo']);
              linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
             End
            Else
             Begin
              linha2:='Autorização: Decreto Lei nº '+QConsAlu['cur_autndc'];
              linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
             End;
           End
          Else
           Begin
            If vano > 1982
            Then
             Begin
 //             If (((QCurso['cur_area'] = 6) and (QCurso['cur_codigo'] <> 112)) or
 //                (QCurso['cur_codigo'] = 132) or (QCurso['cur_codigo'] = 133) or (QCurso['cur_codigo'] = 335) or
 //                (QCurso['cur_codigo'] = 28) or (QCurso['cur_codigo'] = 130) or (QCurso['cur_codigo'] = 227)) and (QCurso['cur_dataportaria'] <> Null) // Cursos de Tecnologia menos TDW com data da portaria ou Educação Física, Engenharia Ambiental, Arquitetura, Ciências Biológicas - Bacharelado
              If secao = ''
              Then
               Begin
                 If (QConsAlu['cur_dataportaria'] <> Null)
                 Then linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+', de '+DateToStr(QConsAlu['cur_dataportaria'])
                 Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo']);
                 linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
               End
              Else linha2:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+secao;
             End
            Else
             Begin
              linha2:='Reconhecimento: Decreto Lei nº '+QConsAlu['cur_autndc'];
              linha3:='D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+'.';
             End;
           End;
         End;
     End;

 {// Pedido para sair somente nos cursos de tecnologia menos TDW  "Portaria MEC nº"
    If (QCurso['cur_area'] = 6) and (QCurso['cur_codigo'] <> 112) // Cursos de Tecnologia menos TDW
    Then
     Begin
      tam:=Length(linha2);
      posnum:=Pos('nº',linha2);
      linha2:=Copy(linha2,1, posnum-1)+'MEC '+Copy(linha2,posnum,tam-posnum+1);
     End;}

    If QCurso['cur_codigo'] = 6 // Enfermagem
    Then
     Begin
       If QConsAlu['ahb_conclusao'] <= StrToDate('20/12/2008')
       Then linha1:='Curso : Enfermagem e Obstetrícia'
       Else linha1:='Curso : Enfermagem';
     End
    Else
     If QCurso['cur_codigo'] = 10 // Computação
     Then linha1:='Curso : Ciência da Computação'
     Else
      If QCurso['cur_codigo'] = 13 // Psicologia
      Then
       Begin
         If QConsHab['hab_codigo'] = 3 // formação de psicólogo
         Then linha1:='Curso : Psicologia'
         Else linha1:='Curso : Psicologia'+licenca;
       End  
      Else
       If QCurso['cur_codigo'] = 16 // Comunicação Social
       Then linha1:='Curso : Comunicação Social'+licenca
       Else
        If QCurso['cur_codigo'] = 19 // Esquema I
        Then linha1:='Curso : Esquema I - Licenciatura Plena'
        Else
         If QCurso['cur_codigo'] = 26 // Sistemas de Informação
         Then linha1:='Curso : Sistemas de Informação'
         Else
          If (QCurso['cur_codigo'] = 22) and ((QConsHab['hab_codigo'] = 72) or (QConsHab['hab_codigo'] = 16)) // Letras com habilitação em português/inglês
          Then linha1:='Curso : Letras - Português/Inglês e Respectivas Literaturas - Licenciatura'
          Else
           If (QCurso['cur_codigo'] = 132) and ((QConsAlu['ahb_codgra'] = 1) or (QConsAlu['ahb_codgra'] = 2) or (QConsAlu['ahb_codgra'] = 6) or
              (QConsAlu['ahb_codgra'] = 7) or (QConsAlu['ahb_codgra'] = 8) or (QConsAlu['ahb_codgra'] = 3)) // Educação Física - Licenciatura nestas grades deve ser impresso somente Educação Física, de acordo com o chamado #4833
           Then linha1:='Curso : Educação Física'
           Else
            If QCurso['cur_area'] = 6 // Cursos de Tecnologia
            Then
             Begin
              If QCurso['cur_codigo'] = 112 // Superior de Tecnologia em Informática
              Then
               Begin
                If ((QConsAlu['alu_anoing'] = 2005) and (QConsAlu['alu_seming'] = 1)) or (QConsAlu['alu_anoing'] < 2005)
                Then linha1:='Curso Superior de Tecnologia em Informática - Modalidade: Desenv. Web'
                Else linha1:='Curso Superior de Tecnologia em Desenvolvimento Web';
               End
              Else linha1:='Curso '+Trata_Texto(QConsAlu['cur_nomediploma']);
             End
            Else
             If (QCurso['cur_codigo'] = 4) and (QConsAlu['ahb_codgra'] >= 17) // No curso de Farmácia, a partir da grade 17, deve sair uma resolução no verso do diploma
             Then linha1:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca+' - Resolução nº 2 CNE/CES, de 19/02/2002'
             Else linha1:='Curso : '+Trata_Texto(QConsAlu['cur_nomediploma'])+licenca;
    If linha1 <> ''
    Then ppRichView3P.RichView.AddNL(linha1,0,0);
    If linha2 <> ''
    Then ppRichView3P.RichView.AddNL(linha2,0,0);
    If linha3 <> ''
    Then ppRichView3P.RichView.AddNL(linha3,0,0);
    If linha4 <> ''
    Then ppRichView3P.RichView.AddNL(linha4,0,0);
    ppRichView3P.RichView.AddNL('',1,1);
//    ppRichView3P.RichView.Format;

    If QCurso['cur_codigo'] = 32 // Turismo
    Then
     Begin
       RTurP.Visible:=True;
       RVTurP.RichView.Clear;
       RVTurP.RichView.Style.TextStyles.Items[0].FontName:='Arial';
       RVTurP.RichView.Style.TextStyles.Items[0].Size:=9;
       RVTurP.RichView.Style.TextStyles.Items[0].Color:=clBlack;
       RVTurP.RichView.Style.TextStyles.Items[0].Style:=[fsBold];

       RVTurP.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
       RVTurP.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

       RVTurP.RichView.AddNL('ESTRUTURA CURRICULAR DO CURSO DE TURISMO COM ÊNFASE EM HOTELARIA.',0,0);
//       RVTurP.RichView.Format;
     End;

    If (QCurso['cur_codigo'] = 307) or (QCurso['cur_codigo'] = 745) // Licenciatura em Pedagogia, Pedagogia EAD
    Then
     Begin
       RPedP.Visible:=True;
       RVPedP.RichView.Clear;
       RVPedP.RichView.Style.TextStyles.Items[0].FontName:='Arial';
       RVPedP.RichView.Style.TextStyles.Items[0].Size:=9;
       RVPedP.RichView.Style.TextStyles.Items[0].Color:=clBlack;
       RVPedP.RichView.Style.TextStyles.Items[0].Style:=[];

       RVPedP.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
       RVPedP.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

       If qconsccl['ahb_conclusao'] <= StrToDate('19/06/2019') // A Nair solicitou mudança no quadro a partir de 2/2019
       Then
        Begin
          RVPedP.RichView.AddNL(' ',0,0);
          RVPedP.RichView.AddNL('APTO(A) AO EXERCÍCIO DA DOCÊNCIA NA EDUCAÇÃO INFANTIL, NOS ANOS INICIAIS DO ENSINO FUNDAMENTAL E ÀS OUTRAS ATIVIDADES PREVISTAS ',0,0);
          RVPedP.RichView.AddNL('NA RESOLUÇÃO CNE/CP Nº 1 DE 15/05/06, PUBLICADA NO D.O.U. DE 16/05/06.',0,-1);
        End
       Else
        Begin
          RVPedP.RichView.AddNL('APTO(A) AO EXERCÍCIO DA DOCÊNCIA NA EDUCAÇÃO INFANTIL, NOS ANOS INICIAIS DO ENSINO FUNDAMENTAL E ÀS OUTRAS ATIVIDADES PREVISTAS ',0,0);
          RVPedP.RichView.AddNL('NA RESOLUÇÃO CNE/CP Nº 1 DE 15/05/06, PUBLICADA NO D.O.U. DE 16/05/06 E RESOLUÇÃO CNE/CP Nº 2 DE 01/02/15, PUBLICADA NO D.O.U. DE 03/07/15.',0,-1);
        End;
//       RVPedP.RichView.Format;
     End;

   // DecodeDate(qconsccl['ahb_expedicao'],vano,vmes,vdia);
   // LData.Caption:='Em, '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+'.';
   End;

  ppRichView4P.RichView.Clear;
  ppRichView4P.RichView.Style.TextStyles.Items[0].FontName:='Arial';
  ppRichView4P.RichView.Style.TextStyles.Items[0].Size:=9;
  ppRichView4P.RichView.Style.TextStyles.Items[0].Color:=clBlack;
  ppRichView4P.RichView.Style.TextStyles.Items[0].Style:=[];

  ppRichView4P.RichView.Style.TextStyles.Items[1].FontName:='Arial';
  ppRichView4P.RichView.Style.TextStyles.Items[1].Size:=5;
  ppRichView4P.RichView.Style.TextStyles.Items[1].Color:=clBlack;
  ppRichView4P.RichView.Style.TextStyles.Items[1].Style:=[];

  ppRichView4P.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
  ppRichView4P.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;

  ppRichView4P.RichView.Style.ParaStyles.Items[1].Alignment:=rvaJustify;
  ppRichView4P.RichView.Style.ParaStyles.Items[1].LineSpacing:=10;

  ppRichView4P.RichView.AddNL('Diploma Registrado sob nº '+FormatFloat('0000',QConsAlu['nrd_numreg']),0,0);
  ppRichView4P.RichView.AddNL(', Livro '+FormatFloat('000',QConsAlu['liv_numero']),0,-1);
  ppRichView4P.RichView.AddNL(', Fl. '+FormatFloat('000',QConsAlu['ldf_folha']),0,-1);
  ppRichView4P.RichView.AddNL(', Processo nº '+FormatFloat('0000',QILivDip['npd_numero'])+'/'+IntToStr(QILivDip['npd_ano']),0,-1);
  ppRichView4P.RichView.AddNL(', nos termos da Lei nº 9394/96 - Art. 48 - § 1º.',0,-1);
  DecodeDate(QConsAlu['ahb_datreg'],vano,vmes,vdia);
  ppRichView4P.RichView.AddNL('Presidente Prudente, '+StrZero(vdia,2)+' de '+LowerCase(Trata_Texto(Mes[vmes]))+' de '+IntToStr(vano)+'.',0,0);
  ppRichView4P.RichView.AddNL('',1,1);
//  ppRichView4P.RichView.Format;
end;

procedure TFRegDip.ppTitleBand2BeforePrint(Sender: TObject);
var bmp:TBitmap;
begin
  bmp := TQRCode.GetBitmapImage('http://www.unoeste.br/');
  bmp.SaveToFile('c:\sistemas\qrcode.bmp');
  bmp.Free;
end;

procedure TFRegDip.Memo1Exit(Sender: TObject);
begin
  If (not B_Cancela.Focused)
  Then
   If FRegDip.Tag = 1 // registro do diploma
   Then
    Begin
      B_Ok.Enabled:=True;
      B_Ok.SetFocus;
    End;
end;

procedure TFRegDip.CECPFExit(Sender: TObject);
begin
  If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
  Then
   If CECPF.Value <> 0
   Then
    Begin
      If not CPF(StrZero(CECPF.Value,11))
      Then
       Begin
         MessageDlg('CPF inválido!',mtError,[mbOk],0);
         CECPF.SetFocus;
       End;
    End
   Else CECPF.SetFocus;
end;

procedure TFRegDip.DBLCNacionalExit(Sender: TObject);
begin
  If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
  Then
   If (QNacional['nac_codigo'] = Null) or (QNacional['nac_codigo'] = 1) or (QNacional['nac_codigo'] = 9)
   Then
    Begin
      LTipDoc.Caption:='R.G.';
      ERG.MaxLength:=18;
      LTpDoc.Visible:=False;
      DBLCBTpDoc.Visible:=False;
    End
   Else
    Begin
      LTipDoc.Caption:='';
      ERG.MaxLength:=20;
      LTpDoc.Visible:=True;
      DBLCBTpDoc.Visible:=True;
    End;
end;

procedure TFRegDip.DBLCBTpDocExit(Sender: TObject);
begin
  If (not B_Cancela.Focused) and (not B_Finaliza.Focused)
  Then
   If Trim(DBLCBTpDoc.Text) = ''
   Then DBLCBTpDoc.SetFocus;
end;

end.
