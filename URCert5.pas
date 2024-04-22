unit URCert5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBTables, DB, Printers, ppBands,
  ppClass, ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppProd, ppDB,
  ppComm, ppCache, ppDBPipe, ppViewr, ppVar, ppRelatv, ppRegion, ppRichView,
  ppRichTx, RVStyle, RxMemDS, rxMemTable, rxToolEdit, rxCurrEdit, Variants,
  ppCtrls, ppParameter, Controls, ppDesignLayer;

type
  TFRCert5 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    LSerie: TLabel;
    MESerie: TMaskEdit;
    LTurma: TLabel;
    ETurma: TEdit;
    Label4: TLabel;
    ECurso: TEdit;
    Label5: TLabel;
    EHabilitacao: TEdit;
    QClasses: TQuery;
    Label6: TLabel;
    MEAnoRef: TMaskEdit;
    RGSem: TRadioGroup;
    Panel2: TPanel;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    B_Finaliza: TBitBtn;
    QDadAlu: TQuery;
    Qconsalu: TQuery;
    Qconscur: TQuery;
    Qconshab: TQuery;
    Qconsccl: TQuery;
    MTHab: TMemoryTable;
    MTHabhab_Codigo: TSmallintField;
    MTHabHab_Nome: TStringField;
    DSHab: TDataSource;
    SPFicha: TStoredProc;
    QEquival: TQuery;
    DSEquival: TDataSource;
    QLocalidade: TQuery;
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
    DSFicha: TDataSource;
    QAdiciona: TQuery;
    QAdicionaadi_nro: TSmallintField;
    QAdicionaalu_ra: TFloatField;
    QAdicionahab_codigo: TSmallintField;
    QAdicionaadi_nomdis: TStringField;
    QAdicionaadi_cghora: TSmallintField;
    QAdicionaadi_medfin: TStringField;
    QAdicionaadi_pfreq: TStringField;
    QAdicionaadi_codobs: TSmallintField;
    DSAdiciona: TDataSource;
    qconsccl2: TQuery;
    QMatricula: TQuery;
    QRFichahis_disequ: TIntegerField;
    CBEmissao: TCheckBox;
    QGradLet: TQuery;
    QRFichagra_regime: TSmallintField;
    QRFichahis_codobs: TSmallintField;
    ch: TStringField;
    QAdicionaadi_perlet: TIntegerField;
    QRFichagra_anoter: TStringField;
    QRFichadis_controle: TSmallintField;
    QAdicionaadi_perchar: TStringField;
    QRFichacer_seq: TIntegerField;
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
    QRFicharfi_horas: TSmallintField;
    QEquivalequ_cghreal: TFloatField;
    QEquivalhr: TFloatField;
    CECurso: TCurrencyEdit;
    CBAluno: TCheckBox;
    MERA: TCurrencyEdit;
    LRA: TLabel;
    ENome: TEdit;
    BLocAlu: TSpeedButton;
    RCertif: TppReport;
    ppDetailBand2: TppDetailBand;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppLine43: TppLine;
    ppRichView1: TppRichView;
    ppLabel27: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBPipeline6: TppDBPipeline;
    DSAlunos: TDataSource;
    QNacional: TQuery;
    MTObs: TMemoryTable;
    MTObsobs_codigo: TStringField;
    MTObsobs_observ: TStringField;
    QCHAtiv: TQuery;
    ppRichView2: TppRichView;
    MDAlunos: TRxMemoryData;
    MDAlunosalu_ra: TFloatField;
    MDAlunospes_nome: TStringField;
    MDAlunospes_rg: TStringField;
    MDAlunospes_estexp: TStringField;
    MDAlunospes_datnas: TDateField;
    MDAlunosloc_nome: TStringField;
    MDAlunosestado: TStringField;
    MDAlunosnacionalidade: TStringField;
    MDAlunosahb_conclusao: TDateField;
    MDAlunostotcarga: TFloatField;
    MDAlunostotcarga2: TFloatField;
    MDAlunostotativ: TSmallintField;
    MDAlunossomou: TBooleanField;
    MDAlunosconclusao: TStringField;
    Label1: TLabel;
    DEData1: TDateEdit;
    MDAlunoshab_codigo: TSmallintField;
    MDAlunosahb_codgra: TSmallintField;
    MDAlunosativalu: TSmallintField;
    CBFrase: TCheckBox;
    MDAlunoscla_serie: TSmallintField;
    QAdicionaadi_chreal: TFloatField;
    SPConcluinte: TStoredProc;
    MDAlunosahb_colacao: TDateField;
    MDAlunoscolacao: TStringField;
    MDAlunosalu_anoing: TSmallintField;
    MDAlunosalu_seming: TSmallintField;
    MDAlunosnac_codigo: TSmallintField;
    MDAlunospes_docestr: TStringField;
    QEnade: TQuery;
    RGImp: TRadioGroup;
    QGraLet: TQuery;
    CB2Via: TCheckBox;
    L2Via: TppLabel;
    ppFooterBand1: TppFooterBand;
    LRA2: TppLabel;
    QCurAux: TQuery;
    MDAlunospes_nomecivil: TStringField;
    MDAlunospes_nomedefinitivo: TStringField;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    procedure MESerieExit(Sender: TObject);
    procedure ETurmaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MEAnoRefExit(Sender: TObject);
    procedure MEAnoRefEnter(Sender: TObject);
    procedure B_FinalizaClick(Sender: TObject);
    procedure b_okClick(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure CBEmissaoExit(Sender: TObject);
    procedure QRFichaCalcFields(DataSet: TDataSet);
    procedure QAdicionaCalcFields(DataSet: TDataSet);
    procedure QEquivalCalcFields(DataSet: TDataSet);
    procedure CECursoExit(Sender: TObject);
    procedure CBAlunoClick(Sender: TObject);
    procedure BLocAluClick(Sender: TObject);
    procedure MERAExit(Sender: TObject);
    procedure b_okExit(Sender: TObject);
    procedure MERAEnter(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure DEData1Exit(Sender: TObject);
    procedure CBFraseExit(Sender: TObject);
    procedure CB2ViaExit(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);
  private
    vdia,vmes,vano:word;
    unico,cursando,somou:boolean;
    totcarga,totcarga2:real;
    Mes: Array[1..12] of String;
    lic:string;
    Procedure Soma_CH;
    Procedure Soma_CHPsi;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCert5: TFRCert5;

implementation

uses UMenupri, UProcs, UConsAlu;

{$R *.DFM}

Procedure TFRCert5.Soma_CHPsi;
var vdia,vmes,vano:word;
Begin
 cursando:=false;
 If QMatricula['cla_serie'] > 8 // Formação de Psicólogo
 Then
  Begin
   QRFicha.First;
   While not QRFicha.Eof do
   Begin
    If QRFicha['his_sitfin'] = 'A'
    Then
     Begin
      If Valida_Disc(QRFicha['dis_codigo'],3,qconsccl['ahb_codgra'])
      Then
       If (QRFicha['his_codlan'] = 1) or (QRFicha['his_codlan'] = 5) or (QRFicha['his_codlan'] = 11)
       Then
        Begin
         If QRFicha['his_sitfin'] = 'A'
         Then
          Begin
           If not Educacao_Fisica(QRFicha['dis_controle'],QDadAlu['cur_area'],QDadAlu['cur_codigo'])
           Then
            Begin
             totcarga:=totcarga+NULLToZero(QRFicha['his_chminima']);
             totcarga2:=totcarga2+NULLToZero(QRFicha['rfi_horas']);
            End;
          End;
        End
       Else
        Begin
         If (QRFicha['his_codlan'] = 2) or (QRFicha['his_codlan'] = 3)
         Then
          Begin
           QEquival.Close;
           QEquival.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
           If QRFicha['his_disequ'] = Null
           Then QEquival.ParamByName('coddis').asinteger:=QRFicha['dis_codigo']
           Else QEquival.ParamByName('coddis').asinteger:=QRFicha['his_disequ'];
           QEquival.Open;
           While not QEquival.Eof do
           Begin
            If (NULLToZero(QEquival['equ_cghora']) <> 0) or (NULLToZero2(QEquival['equ_cghreal']) <> 0)
            Then
             Begin
              If not Educacao_Fisica(QRFicha['dis_controle'],QDadAlu['cur_area'],QDadAlu['cur_codigo'])
              Then
               Begin
                If NULLToZero(QEquival['equ_cghora']) <> 0
                Then totcarga:=totcarga+QEquival['equ_cghora']
                Else totcarga:=totcarga+QEquival['equ_cghreal'];
                totcarga2:=totcarga2+QEquival['hr'];
               End;
             End;
            QEquival.Next;
           End;
          End;
        End;
     End
    Else
     If Valida_Disc(QRFicha['dis_codigo'],3,qconsccl['ahb_codgra'])
     Then
      Begin
       cursando:=true;
       break;
      End;
    QRFicha.Next;
   End;
  End
 Else
  Begin
   QRFicha.First;
   While not QRFicha.Eof do
   Begin
    If QRFicha['his_sitfin'] = 'A'
    Then
     Begin
      If Valida_Disc(QRFicha['dis_codigo'],1,qconsccl['ahb_codgra'])
      Then
       If (QRFicha['his_codlan'] = 1) or (QRFicha['his_codlan'] = 5) or (QRFicha['his_codlan'] = 11)
       Then
        Begin
         If QRFicha['his_sitfin'] = 'A'
         Then
          Begin
           If not Educacao_Fisica(QRFicha['dis_controle'],QDadAlu['cur_area'],QDadAlu['cur_codigo'])
           Then
            Begin
             totcarga:=totcarga+NULLToZero(QRFicha['his_chminima']);
             totcarga2:=totcarga2+NULLToZero(QRFicha['rfi_horas']);
            End;
          End;
        End
       Else
        Begin
         If (QRFicha['his_codlan'] = 2) or (QRFicha['his_codlan'] = 3)
         Then
          Begin
           QEquival.Close;
           QEquival.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
           If QRFicha['his_disequ'] = Null
           Then QEquival.ParamByName('coddis').asinteger:=QRFicha['dis_codigo']
           Else QEquival.ParamByName('coddis').asinteger:=QRFicha['his_disequ'];
           QEquival.Open;
           While not QEquival.Eof do
           Begin
            If (NULLToZero(QEquival['equ_cghora']) <> 0) or (NULLToZero2(QEquival['equ_cghreal']) <> 0)
            Then
             Begin
              If not Educacao_Fisica(QRFicha['dis_controle'],QDadAlu['cur_area'],QDadAlu['cur_codigo'])
              Then
               Begin
                If NULLToZero(QEquival['equ_cghora']) <> 0
                Then totcarga:=totcarga+QEquival['equ_cghora']
                Else totcarga:=totcarga+QEquival['equ_cghreal'];
                totcarga2:=totcarga2+QEquival['hr'];
               End;
             End;
            QEquival.Next;
           End;
          End;
        End;
     End
    Else
     If Valida_Disc(QRFicha['dis_codigo'],1,qconsccl['ahb_codgra'])
     Then
      Begin
       cursando:=true;
       break;
      End;
    QRFicha.Next;
   End;
  End;
 If not cursando
 Then
  Begin
   QAdiciona.Close;
   QAdiciona.Sql.Clear;
   If unico
   Then
    Begin
     QAdiciona.Sql.Add('Select * from sca_adicionais');
     QAdiciona.Sql.Add('where alu_ra =:ra and hab_codigo =:codhab');
     QAdiciona.Sql.Add('order by adi_nro');
     QAdiciona.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
     QAdiciona.ParamByName('codhab').assmallint:=QClasses['hab_codigo'];
    End
   Else
    Begin
     QAdiciona.Sql.Add('Select * from sca_adicionais');
     QAdiciona.Sql.Add('where alu_ra =:ra and (hab_codigo =:hab1 or hab_codigo =:hab2)');
     QAdiciona.Sql.Add('order by hab_codigo,adi_nro');
     QAdiciona.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
     QAdiciona.ParamByName('hab1').assmallint:=QClasses['hab_codigo'];
     QAdiciona.ParamByName('hab2').assmallint:=QConsHab['hab_ligacao'];
    End;
   QAdiciona.Open;
   If not QAdiciona.Eof
   Then
    Begin
     While not QAdiciona.Eof do
     Begin
      If (QAdiciona['adi_cghora'] <> Null) or (QAdiciona['adi_chreal'] <> Null)
      Then
       If QAdiciona['adi_cghora'] <> Null
       Then totcarga:=totcarga+QAdiciona['adi_cghora']
       Else totcarga:=totcarga+QAdiciona['adi_chreal'];
       totcarga2:=totcarga2+QAdiciona['hr'];
      QAdiciona.Next;
     End;
    End;
   If qconsccl['ahb_conclusao'] <> Null // O aluno deve ter data de conclusão cadastrada
   Then
    Begin
     If (NULLToZero(QGradLet['totativ']) = 0) or ((NULLToZero(QGradLet['totativ']) <> 0) and ((somou) or (NULLToZero(qconsccl['ahb_anoconcl']) < NULLToZero(QDadAlu['cur_anoativ'])))) or
        ((NULLToZero(QGradLet['totativ']) <> 0) and (QDadAlu['cur_area'] = 6) and (NULLToZero(QCHAtiv['totcarga']) >= NULLToZero(QGradLet['totativ']))) or
        ((qconscur['cur_codigo'] = 13) and (QMatricula['cla_serie'] <= 8))
        // Para se emitir o certificado a grade do aluno não deve possuir atividades complementares a cumprir ou
        // caso possua deve ter sido somado a carga horária total ou se for da área de tecnologia verificar se o aluno cumpriu toda a carga horária ou
        // se for curso de psicologia e termo for <= 8 não se deve somar a carga horária de atividades complementares podendo se emitir o certificado independente do aluno ter cumprido toda a carga horária
     Then
      Begin
       MDAlunos.Append;
       MDAlunos['alu_ra']:=QMatricula['alu_ra'];
       MDAlunos['pes_nome']:=QDadAlu['pes_nome'];
       MDAlunos['pes_nomecivil']:=QDadAlu['pes_nomecivil'];
       MDAlunos['pes_rg']:=QDadAlu['pes_rg'];
       MDAlunos['pes_estexp']:=QDadAlu['pes_estexp'];
       MDAlunos['pes_datnas']:=QDadAlu['pes_datnas'];
       MDAlunos['pes_nomedefinitivo']:=QDadAlu['pes_nomedefinitivo'];
       If QDadAlu['pes_locnas'] <> Null
       Then
        Begin
         QLocalidade.Close;
         QLocalidade.Sql.Clear;
         QLocalidade.Sql.Add('select * from cep_local l, outer cep_estado e');
         QLocalidade.Sql.Add('where l.loc_uf = e.loc_uf and l.loc_codigo =:codloc');
         QLocalidade.ParamByName('codloc').AsInteger:=QDadAlu['pes_locnas'];
         QLocalidade.Open;
         If (Pos('(',NULLToSpace(QLocalidade['loc_nome'])) <> 0) // Cidade de Nascimento no Exterior
         Then MDAlunos['loc_nome']:=Copy(QLocalidade['loc_nome'],(Pos('(',QLocalidade['loc_nome'])+1),(Pos(')',QLocalidade['loc_nome']) - Pos('(',QLocalidade['loc_nome']) - 1))
         Else
          Begin
           MDAlunos['loc_nome']:=Trata_Acento(NULLToSpace(QLocalidade['loc_nome']),2);
           If QLocalidade['loc_uf'] <> Null
           Then
            If QLocalidade['loc_uf'] <> 'DF'
            Then MDAlunos['estado']:=', Estado '+NULLToSpace(QLocalidade['est_preposicao'])+' '+Trata_Texto(NULLToSpace(QLocalidade['est_descr']))
            Else MDAlunos['estado']:=', '+Trata_Texto(NULLToSpace(QLocalidade['est_descr']));
          End;
        End;
       If QDadAlu['nac_codigo'] <> Null
       Then
        Begin
          MDAlunos['nacionalidade']:=Imp_Nacionalidade(QDadAlu);
          MDAlunos['nac_codigo']:=QDadAlu['nac_codigo'];
        End;
       MDAlunos['pes_docestr']:=NULLToSpace(QDadAlu['pes_docestr']);

       MDAlunos['ahb_conclusao']:=qconsccl['ahb_conclusao'];
       DecodeDate(qconsccl['ahb_conclusao'],vano,vmes,vdia);
       MDAlunos['conclusao']:=StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano);
       If qconscur['cur_area'] <> 1 // no ensino médio, não tem a data de colação
       Then
        Begin
          MDAlunos['ahb_colacao']:=qconsccl['ahb_colacao'];
          DecodeDate(qconsccl['ahb_colacao'],vano,vmes,vdia);
          MDAlunos['colacao']:=StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano);
        End;  

       MDAlunos['totcarga']:=totcarga;
       MDAlunos['totcarga2']:=totcarga2;
       MDAlunos['totativ']:=NULLToZero(QGradLet['totativ']);
       If QCHAtiv.Active
       Then MDAlunos['ativalu']:=NULLToZero(QCHAtiv['totcarga']);
       If QMatricula['cla_serie'] <= 8 // Bacharelado não soma atividades complementares
       Then somou:=false;
       MDAlunos['somou']:=somou;
       MDAlunos['hab_codigo']:=qconsccl['hab_codigo'];
       MDAlunos['ahb_codgra']:=qconsccl['ahb_codgra'];
       MDAlunos['cla_serie']:=QMatricula['cla_serie'];
       MDAlunos['alu_anoing']:=QMatricula['alu_anoing'];
       MDAlunos['alu_seming']:=QMatricula['alu_seming'];
       MDAlunos.Post;
      End;
    End;
  End;
End;

Procedure TFRCert5.Soma_CH;
var vdia,vmes,vano:word;
Begin
 cursando:=false;
 QRFicha.First;
 While not QRFicha.Eof do
 Begin
  If QRFicha['his_sitfin'] = 'A'
  Then
   Begin
    If (QRFicha['his_codlan'] = 1) or (QRFicha['his_codlan'] = 5) or (QRFicha['his_codlan'] = 11)
    Then
     Begin
      If QRFicha['his_sitfin'] = 'A'
      Then
       Begin
        If not Educacao_Fisica(QRFicha['dis_controle'],QDadAlu['cur_area'],QDadAlu['cur_codigo'])
        Then
         Begin
          totcarga:=totcarga+NULLToZero(QRFicha['his_chminima']);
          totcarga2:=totcarga2+NULLToZero(QRFicha['rfi_horas']);
         End;
       End;
     End
    Else
     Begin
      If (QRFicha['his_codlan'] = 2) or (QRFicha['his_codlan'] = 3)
      Then
       Begin
        QEquival.Close;
        QEquival.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
        If QRFicha['his_disequ'] = Null
        Then QEquival.ParamByName('coddis').asinteger:=QRFicha['dis_codigo']
        Else QEquival.ParamByName('coddis').asinteger:=QRFicha['his_disequ'];
        QEquival.Open;
        While not QEquival.Eof do
        Begin
         If (NULLToZero(QEquival['equ_cghora']) <> 0) or (NULLToZero2(QEquival['equ_cghreal']) <> 0)
         Then
          Begin
           If not Educacao_Fisica(QRFicha['dis_controle'],QDadAlu['cur_area'],QDadAlu['cur_codigo'])
           Then
            Begin
             If NULLToZero(QEquival['equ_cghora']) <> 0
             Then totcarga:=totcarga+QEquival['equ_cghora']
             Else totcarga:=totcarga+QEquival['equ_cghreal'];
             totcarga2:=totcarga2+QEquival['hr'];
            End;
          End;
         QEquival.Next;
        End;
       End;
     End;
   End
  Else
   Begin
    cursando:=true;
    break;
   End;
  QRFicha.Next;
 End;
 If not cursando
 Then
  Begin
   QAdiciona.Close;
   QAdiciona.Sql.Clear;
   If unico
   Then
    Begin
     QAdiciona.Sql.Add('Select * from sca_adicionais');
     QAdiciona.Sql.Add('where alu_ra =:ra and hab_codigo =:codhab');
     QAdiciona.Sql.Add('order by adi_nro');
     QAdiciona.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
     QAdiciona.ParamByName('codhab').assmallint:=QClasses['hab_codigo'];
    End
   Else
    Begin
     QAdiciona.Sql.Add('Select * from sca_adicionais');
     QAdiciona.Sql.Add('where alu_ra =:ra and (hab_codigo =:hab1 or hab_codigo =:hab2)');
     QAdiciona.Sql.Add('order by hab_codigo,adi_nro');
     QAdiciona.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
     QAdiciona.ParamByName('hab1').assmallint:=QClasses['hab_codigo'];
     QAdiciona.ParamByName('hab2').assmallint:=QConsHab['hab_ligacao'];
    End;
   QAdiciona.Open;
   If not QAdiciona.Eof
   Then
    Begin
     While not QAdiciona.Eof do
     Begin
      If (QAdiciona['adi_cghora'] <> Null) or (QAdiciona['adi_chreal'] <> Null)
      Then
       If QAdiciona['adi_cghora'] <> Null
       Then totcarga:=totcarga+QAdiciona['adi_cghora']
       Else totcarga:=totcarga+QAdiciona['adi_chreal'];
       totcarga2:=totcarga2+QAdiciona['hr'];
      QAdiciona.Next;
     End;
    End;
   If qconsccl['ahb_conclusao'] <> Null // O aluno deve ter data de conclusão cadastrada 
   Then
    Begin
     If (NULLToZero(QGradLet['totativ']) = 0) or ((NULLToZero(QGradLet['totativ']) <> 0) and ((somou) or (NULLToZero(qconsccl['ahb_anoconcl']) < NULLToZero(QDadAlu['cur_anoativ'])))) or
        ((NULLToZero(QGradLet['totativ']) <> 0) and (QDadAlu['cur_area'] = 6) and (NULLToZero(QCHAtiv['totcarga']) >= NULLToZero(QGradLet['totativ'])))
        // Para se emitir o certificado a grade do aluno não deve possuir atividades complementares a cumprir ou
        // caso possua deve ter sido somado a carga horária total ou se for da área de tecnologia verificar se o aluno cumpriu toda a carga horária
     Then
      Begin
       MDAlunos.Append;
       MDAlunos['alu_ra']:=QMatricula['alu_ra'];
       MDAlunos['pes_nome']:=QDadAlu['pes_nome'];
       MDAlunos['pes_nomecivil']:=QDadAlu['pes_nomecivil'];
       MDAlunos['pes_rg']:=QDadAlu['pes_rg'];
       MDAlunos['pes_estexp']:=QDadAlu['pes_estexp'];
       MDAlunos['pes_datnas']:=QDadAlu['pes_datnas'];
       MDAlunos['pes_nomedefinitivo']:=QDadAlu['pes_nomedefinitivo'];
       If QDadAlu['pes_locnas'] <> Null
       Then
        Begin
         QLocalidade.Close;
         QLocalidade.Sql.Clear;
         QLocalidade.Sql.Add('select * from cep_local l, outer cep_estado e');
         QLocalidade.Sql.Add('where l.loc_uf = e.loc_uf and l.loc_codigo =:codloc');
         QLocalidade.ParamByName('codloc').AsInteger:=QDadAlu['pes_locnas'];
         QLocalidade.Open;
         If (Pos('(',NULLToSpace(QLocalidade['loc_nome'])) <> 0) // Cidade de Nascimento no Exterior
         Then MDAlunos['loc_nome']:=Copy(QLocalidade['loc_nome'],(Pos('(',QLocalidade['loc_nome'])+1),(Pos(')',QLocalidade['loc_nome']) - Pos('(',QLocalidade['loc_nome']) - 1))
         Else
          Begin
           MDAlunos['loc_nome']:=Trata_Acento(NULLToSpace(QLocalidade['loc_nome']),2);
           If QLocalidade['loc_uf'] <> Null
           Then
            If QLocalidade['loc_uf'] <> 'DF'
            Then MDAlunos['estado']:=', Estado '+NULLToSpace(QLocalidade['est_preposicao'])+' '+Trata_Texto(NULLToSpace(QLocalidade['est_descr']))
            Else MDAlunos['estado']:=', '+Trata_Texto(NULLToSpace(QLocalidade['est_descr']));
          End;
        End;
       If QDadAlu['nac_codigo'] <> Null
       Then
        Begin
         MDAlunos['nacionalidade']:=Imp_Nacionalidade(QDadAlu);
         MDAlunos['nac_codigo']:=QDadAlu['nac_codigo'];
        End;
       MDAlunos['pes_docestr']:=NULLToSpace(QDadAlu['pes_docestr']);

       MDAlunos['ahb_conclusao']:=qconsccl['ahb_conclusao'];
       DecodeDate(qconsccl['ahb_conclusao'],vano,vmes,vdia);
       MDAlunos['conclusao']:=StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano);
       If qconscur['cur_area'] <> 1 // no ensino médio, não tem a data de colação
       Then
        Begin
          MDAlunos['ahb_colacao']:=qconsccl['ahb_colacao'];
          DecodeDate(qconsccl['ahb_colacao'],vano,vmes,vdia);
          MDAlunos['colacao']:=StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano);
        End;  

       MDAlunos['totcarga']:=totcarga;
       MDAlunos['totcarga2']:=totcarga2;
       MDAlunos['totativ']:=NULLToZero(QGradLet['totativ']);
       If QCHAtiv.Active
       Then MDAlunos['ativalu']:=NULLToZero(QCHAtiv['totcarga']);
       MDAlunos['somou']:=somou;
       MDAlunos['hab_codigo']:=qconsccl['hab_codigo'];
       MDAlunos['ahb_codgra']:=qconsccl['ahb_codgra'];
       MDAlunos['alu_anoing']:=QMatricula['alu_anoing'];
       MDAlunos['alu_seming']:=QMatricula['alu_seming'];
       MDAlunos.Post;
      End;
    End;
  End;
End;

procedure TFRCert5.MESerieExit(Sender: TObject);
begin
  If (not MEAnoRef.Focused) and (not CECurso.Focused) and (not CBAluno.Focused) and (not B_Cancela.Focused) and (not b_finaliza.focused)
  Then
   If MESerie.Text = ''
   Then MESerie.SetFocus;
end;

procedure TFRCert5.ETurmaExit(Sender: TObject);
begin
 If (not MEAnoRef.Focused) and (not CECurso.Focused) and (not MESerie.Focused)
    and (not B_Cancela.Focused) and (not b_finaliza.focused)
 Then
  If ETurma.Text <> ''
  Then
   Begin
    QClasses.Close;
    QClasses.ParamByName('codcur').AsInteger:=CECurso.AsInteger;
    QClasses.ParamByName('Serie').AsSmallInt:=StrToInt(Trim(MESerie.Text));
    QClasses.ParamByName('Turma').AsString:=ETurma.Text;
    QClasses.Open;
    If not QClasses.Eof
    Then
     Begin
      EHabilitacao.Text:='';
      qconshab.close;
      qconshab.parambyname('hab').assmallint:=QClasses['hab_codigo'];
      qconshab.open;
      If not qconshab.eof
      Then EHabilitacao.Text:=qconshab['hab_nomhb1'];
      QMatricula.Close;
      QMatricula.Sql.Clear;
      QMatricula.Sql.Add('Select a.alu_ra,p.pes_nome,p.pes_sacento,f.cla_serie,f.cla_turma,alu_anoing,alu_seming,pes_nomecivil');
      QMatricula.Sql.Add('from fin_alumat f,sca_alunos a,crp_pessoas p');
      QMatricula.Sql.Add('where a.alu_ra = f.alu_ra and a.pes_nro = p.pes_nro and');
      QMatricula.Sql.Add('cur_codigo =:codcur and cla_serie =:serie and cla_turma =:turma');
      QMatricula.Sql.Add('and amt_ano =:ano and amt_semestre =:semestre and (sia_codigo = 1 or sia_codigo = 7)');
      QMatricula.Sql.Add('order by pes_sacento');
      QMatricula.ParamByName('codcur').AsInteger:=CECurso.AsInteger;
      QMatricula.ParamByName('Serie').AsSmallInt:=StrToInt(Trim(MESerie.Text));
      QMatricula.ParamByName('Turma').AsString:=ETurma.Text;
      QMatricula.ParamByName('ano').AsSmallInt:=StrToInt(Trim(MEAnoRef.Text));
      QMatricula.ParamByName('semestre').AsSmallInt:=RGSem.ItemIndex + 1;
      QMatricula.Open;
      If QMatricula.Eof
      Then
       Begin
        messagedlg('Não há certificados de conclusao a serem emitidos !!!',mtError,[mbok],0);
        MEAnoRef.Setfocus;
       End
      Else
       Begin
         If (qconshab['hab_ligacao'] <> 0) and (qconshab['hab_ligacao'] <> Null)
         Then
          Begin
            CBEmissao.Visible:=True;
  //          CBEmissao.SetFocus;
            CBFrase.SetFocus; // Nair pediu para disponiblizar a opção de tirar a frase de registro de diploma - 09/12/2016
          End
         Else
          Begin
            CBEmissao.Checked:=False;
            CBEmissao.Visible:=False;
            B_Ok.Enabled:=True;
//            B_Ok.SetFocus;
            CBFrase.SetFocus; // Nair pediu para disponiblizar a opção de tirar a frase de registro de diploma - 09/12/2016
          End;
       End;
     End
    Else
     Begin
      messagedlg('Esta Classe não existe !!!',mtError,[mbok],0);
      MEAnoRef.Setfocus;
     End;
   End
  Else ETurma.SetFocus;
end;

procedure TFRCert5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRFicha.Close;
  QDadAlu.Close;
  qconsalu.close;
  qconscur.close;
  SPFicha.Close;
  qconsccl.close;
  qconsccl2.close;
  qconshab.close;
  QLocalidade.Close;
  QEquival.Close;
  QClasses.Close;
  QMatricula.Close;
  QGradLet.Close;
  QNacional.Close;
  QCHAtiv.Close;
end;

procedure TFRCert5.FormActivate(Sender: TObject);
begin
 Mes[1]:='janeiro';
 Mes[2]:='fevereiro';
 Mes[3]:='março';
 Mes[4]:='abril';
 Mes[5]:='maio';
 Mes[6]:='junho';
 Mes[7]:='julho';
 Mes[8]:='agosto';
 Mes[9]:='setembro';
 Mes[10]:='outubro';
 Mes[11]:='novembro';
 Mes[12]:='dezembro';
 DEData1.Date:=DataSis;
 MEAnoRef.SetFocus;
end;

procedure TFRCert5.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TFRCert5.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TFRCert5.MEAnoRefExit(Sender: TObject);
begin
 If (not b_finaliza.focused)
 Then
  If MEAnoRef.Text <> ''
  Then
   Begin
    If Length(Trim(MEAnoRef.Text)) <> 4
    Then
     Begin
      MessageDlg('Ano Incompleto!',mtError,[mbOk],0);
      MEAnoRef.SetFocus;
     End;
   End
  Else MEAnoRef.SetFocus; 
end;

procedure TFRCert5.MEAnoRefEnter(Sender: TObject);
var vdia,vmes,vano:word;
begin
// Limpa(FRCert5); // tive que tirar pois estava dando erro quando era executado pela solicitação de serviço
 DecodeDate(DataSis,vano,vmes,vdia);
 If MEAnoRef.Text = ''
 Then MEAnoRef.Text:=IntToStr(vano);
 If RGSem.ItemIndex = -1
 Then
  If vmes <= 6
  Then RGSem.ItemIndex:=0
  Else RGSem.ItemIndex:=1;
 CECurso.Clear;
 ECurso.Clear;
 MERA.Clear;
 ENome.Clear;
 MESerie.Clear;
 ETurma.Clear;
 EHabilitacao.Clear;
 CBEmissao.Visible:=False;
 B_Cancela.Enabled:=True;
 B_Ok.Enabled:=False;
 QDadAlu.Close;
 qconsalu.close;
 qconscur.close;
 SPFicha.Close;
 QRFicha.Close;
 qconsccl.close;
 qconsccl2.close;
 qconshab.close;
 QLocalidade.Close;
 QEquival.Close;
 QClasses.Close;
 QMatricula.Close;
 SPConcluinte.Close;
end;

procedure TFRCert5.B_FinalizaClick(Sender: TObject);
begin
 Close;
end;

procedure TFRCert5.b_okClick(Sender: TObject);
var concluiu:boolean;
    codhab:word;
begin
 unico:=true;
 If CBEmissao.Checked
 Then unico:=false;
 B_Cancela.Enabled:=False;
 B_Ok.Enabled:=False;
 Panel2.SetFocus;
{ If qconscur['cur_campus'] = 1 // Campus I
 Then LCampus.Caption:=CampusI
 Else LCampus.Caption:=CampusII;}
 MDAlunos.Close;
 MDAlunos.Open;

 L2Via.Visible:=CB2Via.Checked;
 
 Try
   QMatricula.First;
   While not QMatricula.Eof do
   Begin
     concluiu:=true;
     SPConcluinte.Close;
     SPConcluinte.Params[0].AsFloat:=QMatricula['alu_ra'];
     SPConcluinte.Params[1].AsSmallInt:=QClasses['hab_codigo'];
     SPConcluinte.Open;
     If SPConcluinte['formado'] = 'N' // Aluno não concluiu todas as disciplinas e carga horária de atividade complementar caso haja
     Then concluiu:=false
     Else
      If not unico
      Then
       Begin
         SPConcluinte.Close;
         SPConcluinte.Params[0].AsFloat:=QMatricula['alu_ra'];
         SPConcluinte.Params[1].AsSmallInt:=qconshab['hab_ligacao'];
         SPConcluinte.Open;
         If SPConcluinte['formado'] = 'N' // Aluno não concluiu todas as disciplinas e carga horária de atividade complementar caso haja
         Then concluiu:=false;
       End;
     If concluiu
     Then
      Begin
        If CECurso.Value = 13 // psicologia
        Then
         Begin
           If QMatricula['cla_serie'] > 8 // Formação de Psicólogo
           Then codhab:=3
           Else codhab:=1;
         End
        Else codhab:=QClasses['hab_codigo'];
        If Libera_Diploma(QMatricula['alu_ra'], codhab)
        Then
         Begin
           MTObs.Close;
           MTObs.Open;
           Dados_Grade_Hab(qconsccl);
           If qconscur['cur_codigo'] = 13 // Psicologia
           Then
            Begin
             If QMatricula['cla_serie'] > 8 // Formação de Psicólogo
             Then qconsccl.parambyname('hab').assmallint:=3
             Else qconsccl.parambyname('hab').assmallint:=1;
            End
           Else qconsccl.parambyname('hab').assmallint:=QClasses['hab_codigo'];
           qconsccl.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
           qconsccl.open;
           Dados_Aluno(QDadAlu);
           QDadAlu.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
           QDadAlu.Open;
           If not unico
           Then
            Begin
             qconsccl2.close;
             qconsccl2.parambyname('hab').assmallint:=qconshab['hab_ligacao'];
             qconsccl2.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
             qconsccl2.open;
             SPFicha.Close;
             SPFicha.Params[0].AsFloat:=QMatricula['alu_ra'];
             SPFicha.Params[1].AsSmallInt:=qconshab['hab_ligacao'];
             SPFicha.Params[2].AsString:='*';
             SPFicha.ExecProc;
             SPFicha.Close;
             SPFicha.Params[0].AsFloat:=QMatricula['alu_ra'];
             SPFicha.Params[1].AsSmallInt:=QClasses['hab_codigo'];
             SPFicha.Params[2].AsString:='*';
             SPFicha.ExecProc;
             SPFicha.Close;
             QRFicha.Close;
             QRFicha.Sql.Clear;
             QRFicha.Sql.Add('Select * from sca_rficha');
             QRFicha.Sql.Add('where alu_ra =:ra and');
             QRFicha.Sql.Add('his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10');
             QRFicha.Sql.Add('order by hab_codigo,gra_nordem,his_sequencia');
             QRFicha.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
             QRFicha.Open;
             totcarga:=0;
             totcarga2:=0;
             Total_Atividades(unico,QDadAlu,QConsHab,qconsccl,qconsccl2,QGradLet);
             Carrega_Atividades(NULLToZero(QGradLet['totativ']),QCHAtiv,QDadAlu,qconsccl,MTObs,totcarga,somou);
             Soma_CH;
             QRFicha.Close;
             QRFicha.Sql.Clear;
             QRFicha.Sql.Add('Delete from sca_rficha');
             QRFicha.Sql.Add('where alu_ra =:ra');
             QRFicha.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
             QRFicha.ExecSql;
             QRFicha.Close;
            End
           Else
            Begin
             SPFicha.Close;
             SPFicha.Params[0].AsFloat:=QMatricula['alu_ra'];
             SPFicha.Params[1].AsSmallInt:=QClasses['hab_codigo'];
             SPFicha.Params[2].AsString:='*';
             SPFicha.ExecProc;
             SPFicha.Close;
             QRFicha.Close;
             QRFicha.Sql.Clear;
             QRFicha.Sql.Add('Select * from sca_rficha');
             QRFicha.Sql.Add('where alu_ra =:ra and');
             If qconscur['cur_codigo'] <> 13 // Pscologia
             Then
              Begin
               QRFicha.Sql.Add('hab_codigo =:hab and');
               QRFicha.ParamByName('hab').AsSmallInt:=QClasses['hab_codigo'];
              End;
             QRFicha.Sql.Add('his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10');
             QRFicha.Sql.Add('order by gra_nordem,his_sequencia');
             QRFicha.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
             QRFicha.Open;
             totcarga:=0;
             totcarga2:=0;
             Total_Atividades(unico,QDadAlu,QConsHab,qconsccl,qconsccl2,QGradLet);
             Carrega_Atividades(NULLToZero(QGradLet['totativ']),QCHAtiv,QDadAlu,qconsccl,MTObs,totcarga,somou);
             If qconscur['cur_codigo'] = 13 // Psicologia
             Then Soma_CHPsi
             Else Soma_CH;
             QRFicha.Close;
             QRFicha.Sql.Clear;
             QRFicha.Sql.Add('Delete from sca_rficha');
             If qconscur['cur_codigo'] = 13 // Psicologia
             Then QRFicha.Sql.Add('where alu_ra =:ra')
             Else
              Begin
               QRFicha.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
               QRFicha.ParamByName('hab').AsSmallInt:=QClasses['hab_codigo'];
              End;
             QRFicha.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
             QRFicha.ExecSql;
             QRFicha.Close;
            End;
         End;
      End;
     QMatricula.Next;
   End;

   ppRichView2.RichView.Clear;
   ppRichView2.RichView.Style.TextStyles.Items[0].FontName:='Times New Roman';
   ppRichView2.RichView.Style.TextStyles.Items[0].Size:=14;
   ppRichView2.RichView.Style.TextStyles.Items[0].Color:=clBlack;
   ppRichView2.RichView.Style.TextStyles.Items[0].Style:=[fsbold];

   ppRichView2.RichView.Style.TextStyles.Items[1].FontName:='Times New Roman';
   ppRichView2.RichView.Style.TextStyles.Items[1].Size:=11; //12; alterei para 11 pois algumas faculdades não estavam cabendo em uma linha
   ppRichView2.RichView.Style.TextStyles.Items[1].Color:=clBlack;
   ppRichView2.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

   ppRichView2.RichView.Style.TextStyles.Items[2].FontName:='Times New Roman';
   ppRichView2.RichView.Style.TextStyles.Items[2].Size:=10;
   ppRichView2.RichView.Style.TextStyles.Items[2].Color:=clBlack;
   ppRichView2.RichView.Style.TextStyles.Items[2].Style:=[fsbold];

   ppRichView2.RichView.Style.TextStyles.Items[3].FontName:='Times New Roman';
   ppRichView2.RichView.Style.TextStyles.Items[3].Size:=8;
   ppRichView2.RichView.Style.TextStyles.Items[3].Color:=clBlack;
   ppRichView2.RichView.Style.TextStyles.Items[3].Style:=[];

   ppRichView2.RichView.Style.ParaStyles.Items[0].Alignment:=rvaCenter;
   ppRichView2.RichView.Style.ParaStyles.Items[0].LineSpacing:=100;

   If qconscur['cur_area'] = 1 // ensino médio
   Then ppRichView2.RichView.AddNL('UNOESTE - CURSOS TÉCNICOS DE NÍVEL MÉDIO',1,0)
   Else
    If qconscur['cur_gradistancia'] = 'S' // graduação a distância não é para imprimir a faculdade porque aparece 'EDUCAÇÃO A DISTÂNCIA'
    Then ppRichView2.RichView.AddNL(' ',1,0)
    Else ppRichView2.RichView.AddNL(NULLToSpace(qconscur['fac_completo']),1,0);
   lic:='';
   If qconscur['fac_codigo'] = 1 // faclepp
   Then
    Begin
      If QConsHab['hab_licenca'] <> null
      Then
       Begin
        Case QConsHab['hab_licenca'] of
          1:lic:=' - LICENCIATURA  1º  GRAU';
          2:lic:=' - LICENCIATURA'; // ' - Licenciatura  Plena';
          3:lic:=' - LICENCIATURA  PLENA  PARA  LICENCIADOS';
          4:If qconscur['cur_semgrau'] = 'S' // (qconscur['cur_codigo'] <> 307) and (qconscur['cur_codigo'] <> 130) and (qconscur['cur_codigo'] <> 335) and (qconscur['cur_codigo'] <> 311) and (qconscur['cur_codigo'] <> 227) // Licenciatura em Pedagogia, Ciências Biológicas - Bacharelado, Química - Bacharelado, Filosofia já possuem o grau acadêmico no nome do curso
            Then
             Begin
               If qconscur['cur_habilitacao'] = 1
               Then lic:= ' - BACHARELADO'
               Else
                If qconscur['cur_habilitacao'] = 2
                Then lic:= ' - LICENCIATURA';
             End
            Else
             If (qconscur['cur_codigo'] = 311) // Estudos Complementares em Educação Infantil
             Then lic:=' - Licenciatura  com  Habilitação  em  Educação  Infantil, conforme  Artigo  12  da  Resolução  CNE nº 1, de  15/05/2006'
             Else
              If (qconscur['cur_codigo'] = 307) // Licenciatura em Pedagogia
              Then lic:=' - LICENCIATURA (Exercício da Docência na Educação Infantil, nos Anos Iniciais do Ensino Fundamental e às Outras Atividades Previstas na Resolução CNE/CP Nº 1 de 15/05/06, Publicada no D.O.U. de 16/05/06)';
        End;
       End;
    End
   Else
    If qconscur['cur_codigo'] = 132 // Educação Física
    Then lic:=' - LICENCIATURA';
   If (qconscur['cur_area'] = 6) or (qconscur['cur_area'] = 1) // Cursos de tecnologia ou ensino médio
   Then ppRichView2.RichView.AddNL('CURSO '+qconscur['cur_nome'],0,0)
   Else
    If (qconscur['cur_codigo'] = 22)// and (QConsHab['hab_codigo'] = 72) // Letras com habilitação em português/inglês
    Then ppRichView2.RichView.AddNL('CURSO DE LETRAS - PORTUGUÊS/INGLÊS E RESPECTIVAS LITERATURAS - LICENCIATURA',0,0)
    Else
     If (qconscur['cur_codigo'] = 311) or (qconscur['cur_codigo'] = 307) // Estudos Complementares em Educação Infantil ou Pedagogia
     Then ppRichView2.RichView.AddNL('CURSO DE PEDAGOGIA - LICENCIATURA',0,0)
     Else ppRichView2.RichView.AddNL('CURSO DE '+qconscur['cur_nome']+lic,0,0);
     
   If (qconscur['cur_codigo'] = 311) // Estudos Complementares em Educação Infantil
   Then
    Begin
      QCurAux.Close;
      QCurAux.ParamByName('codcur').AsInteger:=307; // pegar os dados do reconhecimento de pedagogia
      QCurAux.Open;
      ppRichView2.RichView.AddNL(Imp_Reconhecimento(QCurAux,qconshab,2),3,0);
      ppRichView2.RichView.AddNL(Trata_Texto(Renovacao(QCurAux['cur_codigo'],1)),3,0);
    End
   Else
    Begin
      ppRichView2.RichView.AddNL(Imp_Reconhecimento(qconscur,qconshab,2),3,0);
      If (qconscur['cur_pronatec'] = 'S') and (QMatricula['alu_anoing'] >= 2016) // Antes o ano de início era 2017. A pedido do Ricardo, foi alterado para 2016 - 19/12/2019
      Then
       Begin
         ppRichView2.RichView.AddNL('Curso de acordo com a Portaria nº401, de 10 de maio de 2016.',3,0);
         ppRichView2.RichView.AddNL('Publicado no D.O.U. nº89, de 11 de maio de 2016, Seção 1, página 41.',3,0);
         If (QMatricula['alu_anoing'] >= 2019)
         Then
          Begin
            ppRichView2.RichView.AddNL('Curso de acordo com a portaria nº 1.717, de 08 de Outubro de 2019.',3,0);
            ppRichView2.RichView.AddNL('Publicado no D.O.U, de 09 de Outubro de 2019, Edição 196, Seção1, Página 37.',3,0);
          End;
       End
      Else ppRichView2.RichView.AddNL(Trata_Texto(Renovacao(qconscur['cur_codigo'],1)),3,0);
    End;

   If qconscur['cur_area'] <> 1 // ensino médio não mostrar habilitação
   Then
    If (qconshab['hab_ligacao'] <> 0) // Habilitação específica
    Then
     If qconscur['cur_codigo'] = 4 // Farmácia
     Then ppRichView2.RichView.AddNL('Habilitação : FARMACÊUTICO-BIOQUÍMICO',2,0)
     Else ppRichView2.RichView.AddNL('Habilitação : '+qconshab['hab_nomhb1']+NULLToSpace(qconshab['hab_nomhb2']),2,0);

   ppRichView2.RichView.Format;

   If MDAlunos.RecordCount > 0
   Then RCertif.Print
   Else
    If CBAluno.Checked
    Then MessageDlg('Aluno não concluiu todas as disciplinas ou data de conclusão não foi cadastrada!',mtError,[mbOk],0)
    Else MessageDlg('Não há alunos que concluiram todas as disciplinas ou datas de conclusão não foram cadastradas ou alunos estão com situação no Enade em aberto!',mtError,[mbOk],0);

 Except
  If CBAluno.Checked
  Then
   If not unico
   Then
    Begin
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Delete from sca_rficha');
     QRFicha.Sql.Add('where alu_ra =:ra');
     QRFicha.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
     QRFicha.ExecSql;
     QRFicha.Close;
    End
   Else
    Begin
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Delete from sca_rficha');
     If qconscur['cur_codigo'] = 13 // Psicologia
     Then QRFicha.Sql.Add('where alu_ra =:ra')
     Else
      Begin
       QRFicha.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
       QRFicha.ParamByName('hab').AsSmallInt:=QClasses['hab_codigo'];
      End;
     QRFicha.ParambyName('ra').AsFloat:=QMatricula['alu_ra'];
     QRFicha.ExecSql;
     QRFicha.Close;
    End;
  MessageDlg('Ocorreu um erro na emissão do(s) certificado(s) de conclusão!',mtError,[mbOk],0);
 End;
 If CBAluno.Checked
 Then MERA.SetFocus
 Else MEAnoRef.SetFocus;
end;

procedure TFRCert5.b_cancelaClick(Sender: TObject);
begin
 MEAnoRef.SetFocus;
end;

procedure TFRCert5.CBEmissaoExit(Sender: TObject);
begin
 B_Ok.Enabled:=True;
 B_Ok.SetFocus;
end;

procedure TFRCert5.QRFichaCalcFields(DataSet: TDataSet);
begin
 If NULLToZero(QRFicha['his_chminima']) <> 0
 Then ch.value:=IntToStr(NULLToZero(QRFicha['his_chminima']))
 Else ch.value:='******';
end;

procedure TFRCert5.QAdicionaCalcFields(DataSet: TDataSet);
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

procedure TFRCert5.QEquivalCalcFields(DataSet: TDataSet);
begin
 QEquival['hr']:=Calcula_HorasEquiv(QEquival,QDadAlu,QRFicha);
end;

procedure TFRCert5.CECursoExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not b_finaliza.focused) and (not MEAnoRef.Focused)
 Then
  If CECurso.Value = 0
  Then CECurso.SetFocus
  Else
   Begin
    qconscur.close;
    qconscur.parambyname('codcur').AsInteger:=CECurso.AsInteger;
    qconscur.open;
    If not qconscur.eof
    Then
     Begin
      ECurso.Text:=qconscur['cur_nomcur'];
      If qconscur['cur_area'] = 1 // ensino médio
      Then
       If not Valida_Usuario(qconscur['cur_codigo'],0,0)
       Then
        Begin
          MessageDlg('Usuário não tem permissão de emitir certificado de conclusão de alunos deste curso!',mtError,[mbOk],0);
          CECurso.SetFocus;
        End;
     End
    Else
     Begin
      MessageDlg('Código de curso inválido!',mtError,[mbOk],0);
      CECurso.SetFocus;
     End;
   End;
end;

procedure TFRCert5.CBAlunoClick(Sender: TObject);
begin
 If CBAluno.Checked
 Then
  Begin
   LRA.Visible:=True;
   MERA.Visible:=True;
   BLocAlu.Visible:=True;
   ENome.Visible:=True;
   LSerie.Visible:=False;
   MESerie.Visible:=False;
   LTurma.Visible:=False;
   ETurma.Visible:=False;
  End
 Else
  Begin
   LRA.Visible:=False;
   MERA.Visible:=False;
   BLocAlu.Visible:=False;
   ENome.Visible:=False;
   LSerie.Visible:=True;
   MESerie.Visible:=True;
   LTurma.Visible:=True;
   ETurma.Visible:=True;
  End;
end;

procedure TFRCert5.BLocAluClick(Sender: TObject);
begin
 Application.CreateForm(TFConsAlu, FConsAlu);
 FConsAlu.Hide;
 FConsAlu.ShowModal;
 If VRAcad <> 0
 Then MERA.Value:=VRAcad;
 FConsAlu.Free;
end;

procedure TFRCert5.MERAExit(Sender: TObject);
var codhab:word;
begin
  BLocAlu.Enabled:=True;
  If (not MEAnoRef.Focused) and (not CECurso.Focused) and (not CBAluno.Focused) and (not B_Cancela.Focused) and (not b_finaliza.focused)
  Then
   If MERA.Value = 0
   Then MERA.SetFocus
   Else
    Begin
     QMatricula.Close;
     QMatricula.Sql.Clear;
     QMatricula.Sql.Add('Select a.alu_ra,p.pes_nome,p.pes_sacento,hab_codigo,f.cla_serie,f.cla_turma,alu_anoing,alu_seming,pes_nomecivil');
     QMatricula.Sql.Add('from fin_alumat f,sca_alunos a,crp_pessoas p,sca_classes c');
     QMatricula.Sql.Add('where a.alu_ra = f.alu_ra and a.pes_nro = p.pes_nro and');
     QMatricula.Sql.Add('f.cla_idecur = c.cla_ident and f.cla_serie = c.cla_serie and f.cla_turma = c.cla_turma and');
     QMatricula.Sql.Add('a.cur_codigo =:codcur and a.alu_ra =:ra and amt_ano =:ano and amt_semestre =:semestre and (sia_codigo = 1 or sia_codigo = 7)');
     QMatricula.ParamByName('codcur').AsInteger:=CECurso.AsInteger;
     QMatricula.ParamByName('ra').AsFloat:=MERA.Value;
     QMatricula.ParamByName('ano').AsSmallInt:=StrToInt(Trim(MEAnoRef.Text));
     QMatricula.ParamByName('semestre').AsSmallInt:=RGSem.ItemIndex + 1;
     QMatricula.Open;
     If QMatricula.Eof
     Then
      Begin
       messagedlg('R.A. inválido ou aluno não faz este curso ou aluno não está matriculado neste período!!!',mtError,[mbok],0);
       MERA.SetFocus;
      End
     Else
      Begin
       ENome.Text:=QMatricula['pes_nome'];
       SPConcluinte.Close;
       SPConcluinte.Params[0].AsFloat:=MERA.Value;
       SPConcluinte.Params[1].AsSmallInt:=QMatricula['hab_codigo'];
       SPConcluinte.Open;
       If SPConcluinte['formado'] = 'N' // Aluno não concluiu todas as disciplinas e carga horária de atividade complementar caso haja
       Then
        Begin
         MessageDlg('Aluno não concluiu o curso. Emissão de Certificado de Conclusão não pode ser efetuada!',mtError,[mbOk],0);
         MERA.SetFocus;
        End
       Else
        Begin
          QClasses.Close;
          QClasses.ParamByName('codcur').AsInteger:=CECurso.AsInteger;
          QClasses.ParamByName('Serie').AsSmallInt:=QMatricula['cla_serie'];
          QClasses.ParamByName('Turma').AsString:=QMatricula['cla_turma'];
          QClasses.Open;
          If CECurso.Value = 13 // psicologia
          Then
           Begin
             If QMatricula['cla_serie'] > 8 // Formação de Psicólogo
             Then codhab:=3
             Else codhab:=1;
           End
          Else codhab:=QClasses['hab_codigo'];
          If not Libera_Diploma(MERA.Value, codhab)
          Then
           Begin
             If qconscur['cur_pronatec'] = 'S'
             Then MessageDlg('Aluno não tem dados do ensino médio cadastrados. Emissão de Certificado de Conclusão não pode ser efetuada!',mtError,[mbOk],0)
             Else MessageDlg('Aluno tem situação no Enade em aberto. Emissão de Certificado de Conclusão não pode ser efetuada!',mtError,[mbOk],0);
             MERA.SetFocus;
           End
          Else
           Begin
             EHabilitacao.Text:='';
             qconshab.close;
             qconshab.parambyname('hab').assmallint:=QMatricula['hab_codigo'];
             qconshab.open;
             If not qconshab.eof
             Then EHabilitacao.Text:=qconshab['hab_nomhb1'];
             If (qconshab['hab_ligacao'] <> 0) and (qconshab['hab_ligacao'] <> Null)
             Then
              Begin
               CBEmissao.Visible:=True;
//               CBEmissao.SetFocus;
               CBFrase.SetFocus; // Nair pediu para disponiblizar a opção de tirar a frase de registro de diploma - 09/12/2016
              End
             Else
              Begin
               CBEmissao.Checked:=False;
               CBEmissao.Visible:=False;
               B_Ok.Enabled:=True;
//               B_Ok.SetFocus;
               CBFrase.SetFocus; // Nair pediu para disponiblizar a opção de tirar a frase de registro de diploma - 09/12/2016
              End;
           End;
        End;
      End;
    End;
end;

procedure TFRCert5.b_okExit(Sender: TObject);
begin
 B_Ok.Enabled:=False;
end;

procedure TFRCert5.MERAEnter(Sender: TObject);
begin
 BLocAlu.Enabled:=True;
 CBEmissao.Visible:=False;
 B_Cancela.Enabled:=True;
 B_Ok.Enabled:=False;
 qconshab.close;
 QClasses.Close;
 QMatricula.Close;
 SPConcluinte.Close;
end;

procedure TFRCert5.ppDetailBand2BeforePrint(Sender: TObject);
var vdia,vmes,vano:word;
    fac:string;
begin
 ppRichView1.RichView.Clear;
 ppRichView1.RichView.Style.TextStyles.Items[0].FontName:='Arial';
 ppRichView1.RichView.Style.TextStyles.Items[0].Size:=12;
 ppRichView1.RichView.Style.TextStyles.Items[0].Color:=clBlack;
 ppRichView1.RichView.Style.TextStyles.Items[0].Style:=[];

 ppRichView1.RichView.Style.TextStyles.Items[1].FontName:='Arial';
 ppRichView1.RichView.Style.TextStyles.Items[1].Size:=12;
 ppRichView1.RichView.Style.TextStyles.Items[1].Color:=clBlack;
 ppRichView1.RichView.Style.TextStyles.Items[1].Style:=[fsBold];

 ppRichView1.RichView.Style.TextStyles.Items[2].FontName:='Arial';
 ppRichView1.RichView.Style.TextStyles.Items[2].Size:=11;
 ppRichView1.RichView.Style.TextStyles.Items[2].Color:=clBlack;
 ppRichView1.RichView.Style.TextStyles.Items[2].Style:=[];

 ppRichView1.RichView.Style.TextStyles.Items[3].FontName:='Arial';
 ppRichView1.RichView.Style.TextStyles.Items[3].Size:=11;
 ppRichView1.RichView.Style.TextStyles.Items[3].Color:=clBlack;
 ppRichView1.RichView.Style.TextStyles.Items[3].Style:=[fsBold];

 ppRichView1.RichView.Style.TextStyles.Items[4].FontName:='Arial';
 ppRichView1.RichView.Style.TextStyles.Items[4].Size:=8;
 ppRichView1.RichView.Style.TextStyles.Items[4].Color:=clBlack;
 ppRichView1.RichView.Style.TextStyles.Items[4].Style:=[fsBold];

 ppRichView1.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
 ppRichView1.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;
 ppRichView1.RichView.Style.ParaStyles.Items[0].FirstIndent:=120;

 ppRichView1.RichView.Style.ParaStyles.Items[1].Alignment:=rvaLeft;
 ppRichView1.RichView.Style.ParaStyles.Items[1].LineSpacing:=150;
 ppRichView1.RichView.Style.ParaStyles.Items[1].FirstIndent:=120;

 ppRichView1.RichView.Style.ParaStyles.Items[2].Alignment:=rvaCenter;
 ppRichView1.RichView.Style.ParaStyles.Items[2].LineSpacing:=150;
 ppRichView1.RichView.Style.ParaStyles.Items[2].FirstIndent:=120;

 If (qconscur['cur_codigo'] = 4) and (MDAlunos['ahb_codgra'] >= 17) // NO curso de Farmácia, a partir da grade 17, deve sair uma resolução
 Then ppRichView1.RichView.AddNL('Certifico, para os devidos fins, nos termos da Resolução nº2 CNE/CES de 19/02/2002 que ',0,0)
 Else ppRichView1.RichView.AddNL('Certifico, para os devidos fins, que ',0,0);
 ppRichView1.RichView.AddNL(Nome_Aluno(MDAlunos['pes_nome'],NULLToSpace(MDAlunos['pes_nomecivil']),MDAlunos['pes_nomedefinitivo'],false),1,-1);
 DecodeDate(MDAlunos['pes_datnas'],vano,vmes,vdia);
 If (MDAlunos['nac_codigo'] = 1) or (MDAlunos['nac_codigo'] = 9) // Brasileiro ou Brasileiro Naturalizado
 Then
  Begin
    ppRichView1.RichView.AddNL(', R.G. nº '+NULLToSpace(MDAlunos['pes_rg'])+'-'+NULLToSpace(MDAlunos['pes_estexp']),0,-1);
    ppRichView1.RichView.AddNL(', nascido(a) em '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano)+NULLToSpace(MDAlunos['estado']),0,-1);
    ppRichView1.RichView.AddNL(', nacionalidade '+Trata_Texto(MDAlunos['nacionalidade']),0,-1);
  End
 Else
  Begin
    ppRichView1.RichView.AddNL(', RNE nº '+NULLToSpace(MDAlunos['pes_docestr']),0,-1);
    ppRichView1.RichView.AddNL(', nascido(a) em '+StrZero(vdia,2)+' de '+Mes[vmes]+' de '+IntToStr(vano)+', natural do País - '+Trata_Texto(NULLToSpace(MDAlunos['loc_nome'])),0,-1);
    ppRichView1.RichView.AddNL(', nacionalidade '+Trata_Texto(MDAlunos['nacionalidade']),0,-1);
  End;
 If (qconscur['cur_codigo'] = 4) and (qconshab['hab_ligacao'] <> 0) // Farmácia - Habilitação : Farmacêutico-Bioquímico
 Then ppRichView1.RichView.AddNL(', Graduado(a) em Farmácia',0,-1);
 If MDAlunos['ahb_conclusao'] <> Null
 Then
  Begin
   DecodeDate(MDAlunos['ahb_conclusao'],vano,vmes,vdia);
   If RGImp.ItemIndex = 0 // imprimir semestre de conclusão
   Then
    Begin
      If vmes <= 7 // se formou no 1º semestre
      Then ppRichView1.RichView.AddNL(', concluiu no 1º semestre letivo de '+IntToStr(vano),0,-1)
      Else ppRichView1.RichView.AddNL(', concluiu no 2º semestre letivo de '+IntToStr(vano),0,-1);
    End
   Else ppRichView1.RichView.AddNL(', concluiu em '+StrZero(vdia,2)+' de '+LowerCase(Mes[vmes])+' de '+IntToStr(vano),0,-1);
  End;
 If qconscur['cur_area'] = 1 // ensino médio
 Then
  Begin
    ppRichView1.RichView.AddNL(' o ',0,-1);
    ppRichView1.RichView.AddNL('CURSO '+qconscur['cur_nome']+'.',1,-1);
  End
 Else
  Begin
    If (qconscur['cur_codigo'] = 4) and (qconshab['hab_ligacao'] <> 0) // Farmácia - Habilitação : Farmacêutico-Bioquímico
    Then
     Begin
      ppRichView1.RichView.AddNL(' a Habilitação : ',0,-1);
      ppRichView1.RichView.AddNL('FARMACÊUTICO-BIOQUÍMICO',1,-1);
      ppRichView1.RichView.AddNL(' - Modalidade : ',0,-1);
      ppRichView1.RichView.AddNL('SAÚDE PÚBLICA - ANÁLISES CLÍNICAS',1,-1);
     End
    Else
     If qconscur['cur_area'] = 6 // Cursos de tecnologia
     Then
      Begin
       ppRichView1.RichView.AddNL(' o ',0,-1);
       ppRichView1.RichView.AddNL('CURSO '+qconscur['cur_nome']+lic,1,-1);
      End
     Else
      Begin
       ppRichView1.RichView.AddNL(' o Curso de ',0,-1);
       If (qconscur['cur_codigo'] = 311) // Estudos Complementares em Educação Infantil
       Then ppRichView1.RichView.AddNL('PEDAGOGIA'+lic,1,-1)
       Else ppRichView1.RichView.AddNL(qconscur['cur_nome']+lic,1,-1);
      End;
     If (qconshab['hab_ligacao'] <> 0) and (qconscur['cur_codigo'] <> 6)// Habilitação específica menos enfermagem
     Then ppRichView1.RichView.AddNL(' - HABILITAÇÃO : '+qconshab['hab_nomhb1']+NULLToSpace(qconshab['hab_nomhb2']),1,-1)
     Else
      If qconscur['cur_codigo'] = 13 // Psicologia
      Then
       Begin
         QGraLet.Close;
         QGraLet.ParamByName('codcur').AsSmallInt:=qconscur['cur_codigo'];
         QGraLet.ParamByName('codgra').AsSmallInt:=MDAlunos['ahb_codgra'];
         QGraLet.Open;
         If (NULLToZero(QGraLet['grl_anoinicio']) < 2006) or ((NULLToZero(QGraLet['grl_anoinicio']) = 2006) and (NULLToZero(QGraLet['grl_seminicio']) = 1)) // Psicologia até 1/2006 deve aparecer a habilitação
         Then
          Begin
            If MDAlunos['cla_serie'] > 8 // Formação de Psicólogo
            Then ppRichView1.RichView.AddNL(' - HABILITAÇÃO : FORMAÇÃO DE PSICÓLOGO',1,-1)
            Else ppRichView1.RichView.AddNL(' - HABILITAÇÃO : BACHARELADO EM PSICOLOGIA',1,-1);
          End
         Else
          If (NULLToZero(QGraLet['grl_anoinicio']) > 2006) or ((NULLToZero(QGraLet['grl_anoinicio']) = 2006) and (NULLToZero(QGraLet['grl_seminicio']) = 2)) // Psicologia a partir de 2/2006 deve aparecer formação de psicólogo
          Then ppRichView1.RichView.AddNL(' (FORMAÇÃO DE PSICÓLOGO)',1,-1);
       End;
    ppRichView1.RichView.AddNL(', tendo colado grau em '+NULLToSpace(MDAlunos['colacao'])+'.',0,-1);
  End;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

 If not CBFrase.Checked // Nair pediu para disponiblizar a opção de tirar a frase de registro de diploma - 09/12/2016
 Then
  Begin
    If (qconscur['cur_codigo'] = 9999 {4}) and (qconshab['hab_ligacao'] <> 0) // Farmácia - Habilitação : Farmacêutico-Bioquímico
    Then ppRichView1.RichView.AddNL('Certifico ainda, que o registro da respectiva apostila estará sendo providenciado.',0,0)
    Else
     Begin
      If qconscur['cur_codigo'] = 132 // Educação Física
      Then
       Begin
        If (MDAlunos['ahb_codgra'] = 1) or (MDAlunos['ahb_codgra'] = 2) or (MDAlunos['ahb_codgra'] = 3) or // Grades de 8 termos
           (MDAlunos['ahb_codgra'] = 6) or (MDAlunos['ahb_codgra'] = 7) or (MDAlunos['ahb_codgra'] = 8)
        Then ppRichView1.RichView.AddNL('Certifico ainda, que o graduando ingressou no curso no '+
             IntToStr(NULLToZero(MDAlunos['alu_seming']))+'º semestre de '+IntToStr(NULLToZero(MDAlunos['alu_anoing']))+
             ', com base legal na Resolução CFE 03/1987 e que o registro do respectivo diploma será providenciado mediante solicitação do formando.',0,0)
        Else ppRichView1.RichView.AddNL('Certifico ainda, que o graduando ingressou no curso no '+
             IntToStr(NULLToZero(MDAlunos['alu_seming']))+'º semestre de '+IntToStr(NULLToZero(MDAlunos['alu_anoing']))+
             ', com base legal na Resolução CNE/CP 01/2002 e 02/2002 e que o registro do respectivo diploma será providenciado mediante solicitação do formando.',0,0);
       End
      Else
       If qconscur['cur_area'] = 1 // ensino médio
       Then ppRichView1.RichView.AddNL('Certifico ainda, que o Diploma e seu respectivo registro, será providenciado por esta Instituição de Ensino.',0,0)
       Else ppRichView1.RichView.AddNL('Certifico ainda, que o registro do respectivo diploma será providenciado mediante solicitação do formando.',0,0);
     End;
  End;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

 DecodeDate(DEData1.Date,vano,vmes,vdia);
 ppRichView1.RichView.AddNL('',0,0);
 ppRichView1.RichView.AddNL('',0,0);
 ppRichView1.RichView.AddNL('Presidente  Prudente,  '+StrZero(vdia,2)+'  de  '+Mes[vmes]+'  de  '+IntToStr(vano)+'.',0,0);

 ppRichView1.RichView.Format;
end;

procedure TFRCert5.DEData1Exit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not b_finaliza.focused) and (not MEAnoRef.Focused)
 Then
  If DEData1.Date = 0
  Then DEData1.SetFocus;
end;

procedure TFRCert5.CBFraseExit(Sender: TObject);
begin
 If (not CBEmissao.Visible) and (not CB2Via.Visible) and (not B_Cancela.Focused) and (not b_finaliza.focused)
 Then
  Begin
   B_Ok.Enabled:=True;
   B_Ok.SetFocus;
  End;
end;

procedure TFRCert5.CB2ViaExit(Sender: TObject);
begin
 If (not CBEmissao.Visible) and (not CBFrase.Focused) and (not B_Cancela.Focused) and (not b_finaliza.focused)
 Then
  Begin
   B_Ok.Enabled:=True;
   B_Ok.SetFocus;
  End;
end;

procedure TFRCert5.ppFooterBand1BeforePrint(Sender: TObject);
begin
  LRA2.Caption:='R.A. '+Mascara_RA(MDAlunos['alu_ra'])+' em '+DEData1.Text;
end;


{        If QConsAlu['cur_area'] = 1 // Ensino Médio
        Then
         Begin
           If QConsAlu['cur_pronatec'] = 'S'
           Then
            Begin
              LAutRec.Caption:='Autorizado pela Portaria n° '+NULLToSpace(QConsAlu['cur_autndc'])+' - CONSU/UNOESTE, de '+DateToStr(QConsAlu['cur_autdata']);
              LTitQua.Caption:='Habilitação : ';
              LHab.Caption:=QConsAlu['cur_nome'];
            End
           Else
            Begin
              LAutRec.Caption:='Autorizado pela Portaria DER-PP de '+NULLToSpace(QConsAlu['cur_autndc'])+', publicada em '+DateToStr(QConsAlu['cur_autdata']);
              LHab.Caption:='';
              If qconsccl['hab_codigo'] = 1 // Tronco Comum
              Then
               Begin
                 LTitQua.Caption:='Qualificação : ';
                 Case QConsAlu['cur_codigo'] of
                   135:LHab.Caption:='AUXILIAR TÉCNICO EM PATOLOGIA CLÍNICA';
                   151:LHab.Caption:='AUXILIAR TÉCNICO EM FARMÁCIA';
                   152:LHab.Caption:='AUXILIAR DE ENFERMAGEM';
                 End;
               End
              Else
               Begin
                 LTitQua.Caption:='Habilitação : ';
                 LHab.Caption:=QConsHab['hab_nomhb1'];
               End;
            End;
         End;}

end.
