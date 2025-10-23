unit Uprocs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JvBaseDlg, JvProgressDialog, Db, DBTables, Printers, dcpcrypt, blowfish, base64, Math,
  ExtCtrls, Winspool, ppMemo, ppDB, ppDBPipe, ppBands, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, StdCtrls, Mask, DbCtrls,
  RXDBCtrl, shellapi, RxLookup, RxMemDS, ZLib, rxMemTable, rxToolEdit, Variants,
  rxCurrEdit, rxDBUtils, ppRichTx, ppCtrls, ppParameter, ppRichView, RestClient,
  RestJsonUtils, IdCoderMIME, UGed_Documentos, Contnrs;

type
  TFProcs = class(TForm)
    qalumat: TQuery;
    qaluno: TQuery;
    qvalor: TQuery;
    qocorre: TQuery;
    qboldesc: TQuery;
    qmov: TQuery;
    Q_Feriados: TQuery;
    Q_Curso: TQuery;
    Q_Aux: TQuery;
    Q_PlanosPagto: TQuery;
    QValores: TQuery;
    QAbertAtrib: TQuery;
    SPCalcDis: TStoredProc;
    SPQuadro: TStoredProc;
    SPQuadros_fun_matr: TIntegerField;
    SPQuadros_pes_nome: TStringField;
    SPQuadros_tit_descricao: TStringField;
    SPQuadros_totaulas: TIntegerField;
    SPQuadros_totperiodo: TIntegerField;
    SPQuadros_totcoord: TIntegerField;
    SPQuadros_totativ: TIntegerField;
    SPQuadros_totaip: TIntegerField;
    SPQuadros_totaex: TIntegerField;
    SPQuadros_totasb: TIntegerField;
    SPQuadros_totcac: TIntegerField;
    SPQuadros_totdata: TIntegerField;
    SPQuadros_regime: TStringField;
    SPQuadros_totfolaulas: TFloatField;
    SPQuadros_totsalario: TFloatField;
    SPQuadros_valaula: TFloatField;
    SPQuadros_medaula: TFloatField;
    SPQuadros_medhora: TFloatField;
    SPQuadros_tit_cursando: TStringField;
    SPQuadros_totgeral: TIntegerField;
    SPQuadros_totgerprof: TIntegerField;
    SPQuadrocurso: TIntegerField;
    SPQuadros_totpg: TIntegerField;
    SPQuadros_totout: TIntegerField;
    SPQuadros_totad: TIntegerField;
    SPQuadros_totaulasresp: TIntegerField;
    SPQuadros_totperiodoresp: TIntegerField;
    SPQuadros_totdataresp: TIntegerField;
    SPQuadros_totadresp: TIntegerField;
    SPQuadros_totgativresp: TIntegerField;
    QProfTotAulas: TQuery;
    PD: TJvProgressDialog;
    MeuRest: TRestClient;
  private
    { Private declarations }
  public
    UrlApi, UrlToken :string;
    valmat:Double;
    { Public declarations }
  end;

  procedure MostraDB(DS: TDataSource);
  procedure LimpaDB(DS: TDataSource);
  Procedure VerCampoVazio(TQ:TQuery);
  Function Muda_Impressora(Imp: String):Boolean;
  procedure calcdig(carne : string;var ok :string);
  function CNPJ(Value: String): Boolean;
  Procedure Calc_Barra(vBoleto:integer;vValCobr:double;VDatVencto:TDateTime;Var L_Digit,CBarra:string);
  function FatorVencimento(Vencto: TDate): Double;
  Procedure Inicializa_Impressora(Papel:String);
  Function  XPol(X: Real): Word;
  Function  YPol(Y: Real): Word;
  Function  Mascara_RA(ra:real) : string;
  Procedure Trata_Campos(Q:TQuery);
  Function  BAR_XEROX(XCOD:String):String;
  Function  Imp_Periodo(diaini,diafim:word) : string;
  function  Criptografa(s: String): String;
  function  Descriptografa(s: String): String;
  Function  Tira_Acentos(XTEXTO : String) : String;
  Function  Tira_Acentos2(XTEXTO : String) : String;
  procedure GotoRecord(DataSet: TMemoryTable; RecordNo: Longint);
  function  Find(DataSet: TMemoryTable; FieldName: Array of String; Values: Array of Variant;
                Exact: Boolean): Boolean;
  Procedure OrderBy(DataSet: TMemoryTable; FieldNames: Array of String);
  function  FindTable(DataSet: TMemoryTable; FieldName: array of string;
                      DS: TDataSet; Exact: Boolean): Boolean;
  procedure Insert(DataSet: TMemoryTable);
  Function  Trata_Texto(XTEXTO: string): string;
  Function  relaluno(alu_ra:Real;anoref,hab_codigo,semest,anoref1,anoref2,his_semref:word):TMemoryTable;
  Procedure Log_Historico(Q,QHistorico:TQuery;codusu:integer;tipo:word);
  Function  Mascara_DocFal(doc:integer) : string;
  Procedure Carrega_Atividades(totativ:word;QCHAtiv,QDadAlu,qconsccl:TQuery;var MTObs:TMemoryTable;var totcarga:real;var somou:boolean);
  Procedure Carrega_AtivPsi(totativ,nhab:word;QCHAtiv,QDadAlu,qconsccl:TQuery;var MTObs:TMemoryTable;var totcarga:real;var somou:boolean);
  Function  Acha_Titular(coddis:integer;codtur:string;lab,perlet,semref:integer):integer;
  Function  Acha_Titular2(coddis:integer;codtur:string;lab,perlet,semref:integer):string;
  Function  Acha_Titular_Alu(coddis:integer;codtur:string;lab,perlet,semref:integer):string;
  Function  Mascara_CPF(cpf:real) : string;
  Function  CPF(Dados: string ): boolean;
  Function  Valida_Hora(hora:string):Boolean;
  Function  RemoveChar(Value: String; car: Char): String;
  Function  Trata_Hora(hora:string):String;
  Function  Pega_DataHora:TDateTime;
  Function  Pega_Data:TDate;
  Procedure GeraHorario(perlet,semref,matr,curso:integer;vdataini,vdatafim:TDateTime);
  Procedure GeraHorAtiv(perlet,semref,matr,curso:integer;vdataini,vdatafim:TDateTime);
  Function  Renovacao2(codcur,tipo,forma:smallint):String;
//  Procedure Imprime_AutRec(QConsAlu,QConsHab,QCurso:TQuery;tipo,forma:smallint;var LAutRec:TppLabel);
  Procedure Imprime_AutRec(QConsAlu,QConsHab,QCurso:TQuery;tipo,forma:smallint;var RTAutRec:TppRichText);
  Function  Mudou_Professor(MTProfessor, MTProfAnt:TMemoryTable):Boolean;
  function  Alinha_Doc(doc:string): string;
  Procedure Grava_Horario(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf:TQuery;vperiodo,vcurso,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_Horario2(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf:TQuery;vperiodo,vcampus,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_Horario3(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vrel,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_HorarioP(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado:TQuery;vperiodo,vcurso,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_Horario2P(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado:TQuery;vperiodo,vcampus,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_Horario3P(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vrel,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_Horario4P(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_HorarioeSocial(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau:TQuery;vperiodo,vaulaini,vaulafim,vtipoini,vtipofim,vrel,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_Data_eSocial(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vperiodo,vtipaul,vperlet,vsemref,vmes:word);
  Procedure Grava_HorAtiv(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
  Procedure Grava_Ponto_Disc(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vperiodo,vtipaul,vperlet,vsemref:word);
  Procedure Grava_Ponto_Disc2(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vcampus,vperiodo,vtipaul,vperlet,vsemref:word);
  Procedure Grava_Ponto_Disc3(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vunid,vperiodo,vtipaul,vperlet,vsemref,vrel:word);
  Procedure Grava_Ponto_Ativ(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vperiodo,vperlet,vsemref:word);
  Procedure Grava_Ponto_Ativ2(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vcampus,vperiodo,vperlet,vsemref:word);
  Procedure Grava_Ponto_Ativ3(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vunid,vperiodo,vperlet,vsemref,vrel:word);
  Procedure Grava_Ponto_Ativ4(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vunid,vperiodo,vperlet,vsemref:word);
  Function  Media_Semanal(totaulas:Integer):Integer;
  Function  DtProva_Valida(vdata:TDateTime;perlet,semref:word):Boolean;
  Procedure Grava_Sem(QCalendario,QFeriado,QCadHor,QDiscTur,qconsdis:TQuery;diaini,diafim:TDateTime);
  Procedure Confirma_Horario(QCalendario,QCadHor,qconsdis:TQuery;vdata:TDateTime;unica:boolean);
//  function  Calcula_DV_RA(vRA:string):word;
  Function  Calcula_Medias(QDiscTur,QDiscCont:TQuery):boolean;
  Function StrZero(num:real;tam:integer):String;
  function Pesquisa(TQ:TQuery; Valores: array of Variant):Boolean;
  function NULLToSpace(Value: Variant): String;
  function NULLToZero(Value: Variant): integer;
  function NULLToZero2(Value: Variant): real;
  function NULLToInt(Value: Variant): integer;
  function RoundCorrect(R: Real): LongInt;
  function Arred(Value: Currency; Prec: Word): Currency;
  Function Retorna_Porta:PChar;
  Procedure Zera_Campos(Tabela:TQuery);
//  Function HoraRelogio(tempo,ch:word) : integer;
  Function HoraRelogio(perlet,semref,codcur,periodo:word;ch:real) : integer;
  Function Educacao_Fisica(controle,area,codcur:word):Boolean;
  Function Equivalente_Horas(tipo,codcur,codhab,codgra,vanoing:word;totcarga,totcarga2,ra:real):String;
  Procedure Achou_Conflito(QDiscTur,QConsDis:TQuery;matr,coddis:Integer;perlet,semref,lab,periodo,aula,diasem:word;turma:string;var achou:boolean;var curso:string);
//  Function Achou_Conflito2(matr,ativ:Integer;perlet,semref,periodo,aula,diasem,codcur:word;QCalDias:TQuery): boolean;
  Procedure Achou_Conflito2(matr,ativ:Integer;perlet,semref,periodo,aula,diasem,codcur:word;QCalDias:TQuery;var achou:boolean;var curso:string;polo:word);
  Function Achou_Conflito_Data(matr,coddis:Integer;perlet,semref,lab,periodo,rem:word;turma:string;vdata,vhoraini,vhorfim:TDateTime;var curso:string): boolean;
  Function Achou_Conflito_Semanal(matr,coddis:Integer;perlet,semref,lab,periodo,rem,nivel,campus:word;turma,feriado:string;vdata,vhoraini,vhorfim:TDateTime;var curso:string): boolean;
  Function Achou_Conflito_Ativ(matr:Integer;perlet,semref,periodo,rem,nivel,campus:word;vdata,vhoraini,vhorfim:TDateTime;var curso:string): boolean;
  Function Valida_Creditos(qconsdis,QDiscTur,QDiscCont:TQuery):Boolean;
  Function Divide_Obs(parte:word;Obs:string):string;
  Function Calcula_HorasEquiv(QEquival,QDadAlu,QRFicha:TQuery):real;
//  Function Exibe_CargaTotal(totcarga:real;tipo:word):String;
  function ultimo_dia(data : tdatetime):integer;
  Function Retorna_Unidade(codcur : Integer; ra : Real; caixa : integer): integer;
  Procedure Filtra_Ocorrencia(Q:TQuery;vnivel,vcodusu:integer);
  Procedure Filtra_Unidade3(Q:TQuery;vunidade:integer);
  Function  ALinhaDir2(Texto: String; Tamanho: Word): String;
  Function  ALinhaEsq(Texto: String; Tamanho: Word): String;
  function  Replicate(value: String; qtde: Word): String;
  Procedure Habilita_Ordem(RG:TRadioGroup;vcodusu:integer);
  Function  Trata_Acento(XTEXTO : String;tipo:word) : String;
  Function  GetCurrentPrinterHandle: THandle;
  Function  PortaImpressora: String;
  Function  OnLine(Porta:Word):Boolean;
  Function  Imp_Curso_Hist(QDadAlu,QConsHab:TQuery;licenca,rec:string):string;
  Procedure Invisivel(TF:TForm; N:Word);
  Procedure Visivel(TF:TForm; N:Word);
  Procedure Desloca(TF:TForm; N:Word; Cima,Baixo,Esq,Dir:Real);
  Procedure Imp_Livro_Folha_DatReg(qconsccl,QDadAlu:TQuery;var LNLivro2,LNFolha2,LDatReg2:TppLabel);
  Procedure Imp_Qualif_Hab(qconsccl,QDadAlu,qconshab:TQuery;var LTitQua,LQualif,LIngresso,LDatConcl:TppLabel);
  Procedure Imp_ObsCompl(QObsCompl:TQuery;var LObsCompl,LNomObs4:TppLabel);
  Function  Achou_Adicional(MT:TMemoryTable;Q:TQuery):Boolean;
  Function  Achou_Disciplina(MT:TMemoryTable;Q:TQuery):Boolean;
  Procedure Acerta_Media(media:string;var DBTMedFin:TppDBText);
  Procedure Imp_Fac_Aut_Rec(qconshab,QDadAlu,qconsccl:TQuery;var licenca,rec,rec2:string;var LFac,LHab,LCurso:TppLabel);
  Procedure Imp_Fac_Aut_Rec2(qconshab,QDadAlu,qconsccl:TQuery;var licenca,rec:string;var LTitFac,LFac,LHab,LHab2,LRec:TppLabel);
  Procedure Dados_Aluno(QDadAlu:TQuery);
  Function  Mostra_Faculdade(codfac:word):string;
  Procedure Imp_Estado_Pais(QDadAlu:TQuery;var ppLabel15,LLocNas:TppLabel);
  Procedure Carrega_Fontes(Drive:string);
  Function  Versao_SO:Byte;
  Procedure Ativa_Portas;
  function  meutrunc(val : real) : integer;
  Procedure Horario_Professor(perlet,semref,coddis,lab,nivel,campus,matr:integer;codtur,feriado:string;dataini,datfim:TDateTime);
  Function  Calcula_Tempo(QProfPonto:TQuery):Integer;
  Procedure Habilita(TF:TForm);
  Procedure Desabilita(TF:TForm);
  Procedure Limpa(TF:TForm);
  function  Alinha_RA(ra:string): string;
  Procedure Dados_Grade_Hab(qconsccl:TQuery);
  Function  Cal_Dig(Campo:String):Integer;
  Procedure Calcula_CHCump(QAlunos,QGrade,QCursos,QHab,QAux,QRFicha:TQuery;SPFicha:TStoredProc;var chfalta,totfal,totcarga:word;var pfalta:real;previa,ativ:boolean;vanoref,vsemref,tipativ,minutos:word);
  function  VerifEmail(email: string): boolean;
  function  QuebraTexto(BaseString, BreakString: string; StringList: TStringList): TStringList;
  Function  Imp_Reconhecimento(qconscur,qconshab:TQuery;tipo:word): string;
  Procedure Carrega_Observacoes(var MTObs:TMemoryTable;disp1,disp2,disp3,disp4,lancado,cursando1,cursando2:boolean;vnota1,vnota2,codobs,RGHist,RGTipo:word;
                                qconsccl,QDadAlu,QAluHabEq:TQuery);
  Function  Valida_Geracao(perlet, semref, coddis, lab, ano, mes, chmin, tipaul:Integer;codtur:string):boolean;
  function  ValidaNomeDisciplina(ADisNome : String) : String;
  procedure MudaTamPapel(PaperSize, Comp, Alt: integer);
  Procedure Horario_Normal(QReitProf:TQuery;perlet,semref,matr,codcur,coddis,codfac:integer);
  Procedure Media_Data(QReitProf:TQuery;perlet,semref,matr,codcur,coddis,codfac:integer);
  Procedure Media_Especifico(QReitProf:TQuery;perlet,semref,matr,codcur,coddis,codfac:integer);
  Function  Idade(DatNas,DatAtu:TDateTime):Word;
  Procedure Esconde_Dados(TF:TForm);
  Procedure Conflito_Salas(QDiscTur:TQuery;MT:TMemoryTable;sala:Integer;lab,diasem:word;var achou:boolean;var curso:string);
  Procedure GeraSalas(perlet,semref,coddis,lab,vcodusu:integer;codtur:string;vdataini,vdatafim:TDateTime);
  Procedure GeraSala(QDiscTur:TQuery;vdataini,vdatafim:TDateTime;vcodusu:integer);
  Procedure ApagaSalas(perlet,semref,coddis,lab,tipo:integer;codtur:string;vdataini,vdatafim:TDateTime);
  Procedure GeraSalaData(QDiscTur,QTempo:TQuery;MTDatas:TMemoryTable;vdataini,vdatafim,DataSis:TDateTime;vcodusu,lab,codcur:integer);
  Function  Conflito_SalaData(QDiscTur:TQuery;lab,periodo,sala:integer;vdata,vhoraini,vhorfim:TDateTime): boolean;
  Function  Conflito_SalaSemanal(QDiscTur:TQuery;lab,periodo,nivel,sala:integer;vdata,vhoraini,vhorfim:TDateTime): boolean;
  Function  Calcula_HorasEquiv2(QAdiciona,QDadAlu,QRFicha:TQuery):real;
  function  ClassifLevel(Classif: String; N: Byte; Parents: Boolean): String;
  function  GetParentSTR(Classif: String; N: Byte): String;
  function  Level(Classif: String): Word;
  function  TruncClassif(Classif: String): String;
  function  CharCount(value: String; car: Char): Word;
  function  AulasFolha(sem, index, ano, mess, matr, curso : integer):integer;
  Function  Atribuicao_Aberta(vdata: TDateTime): Boolean;
  Procedure GravaSalas(perlet,semref,coddis,lab,vcodusu:integer;codtur:string;vdataini,vdatafim:TDateTime);
  procedure EnDecryptFile(INFName, OutFName : String; Chave : Word);
  procedure InterpretaCodigoBarras(ACodBarra : String; var ADisciplina,AAno,ASemestre,ATurma,AMes,ALabTurma,APagina,ATotalPaginas,ACodigoBarraDigitado : String);
  procedure Retorna_Turmas(Q:TQuery;vperlet,vsemref,vcoddis:integer;vcodtur:string);
  procedure InsereTexto(var texto: String; inserir: String; posicao: Integer);
  function  DecToRoman( Decimal: LongInt ): String;
  Procedure Calcula_SitFin(vano,vsem,vcodcur:word);
  function  Digito(N: String): Word;
  Function  Libera_Diploma(ra: real;hab: word): boolean;
  Function  Libera_Historico(ra: real;hab: word): boolean;
  Procedure FormatoRA(MERA:TComponent;RAMask, RACurrency:string);
  Function  Valida_email(MTemail:TMemoryTable): Boolean;
  Function  Usuario_Liberado(vmatr: Integer;vdata: TDateTime): Boolean;
  function  TemPendenciasFinanceiras(RA : Real; vData:TDateTime) : Boolean;
  Procedure Atualiza_Santander;
  Procedure Projeto_Rondon;
  Procedure Grava_Aulas_Prof_Ind(codcur, perlet, semref, matr:Integer);
  Procedure Registra_Faltas(QHistorico:TQuery;vdata:TDateTime);
  Procedure Ultima_Atribuicao(var vano, vsem:word;var vdataini:TDateTime;vcodusu:integer);
  procedure Delay(MSec: Cardinal);
  Function  MinparaHora(Minuto: integer): string;
  procedure DeleteDir( hHandle : THandle; Const sPath : String );
  Function  Achou_Lacuna(matr,perlet,semref,vmes,tipo:integer):boolean;
  Function  Achou_Conflito_Prof(matr,perlet,semref,vmes,tipo:integer):boolean;
  Function  Achou_Conflito_EAD(matr:Integer;vdata,vhoraini,vhorfim:TDateTime;tipoaula:word):boolean;
  Procedure Grava_Historico(ra:real;hab,codusu:integer;vdata:TDateTime);
  Function  Imprime_Curso(QConsAlu, QConsHab, QAluHab:TQuery):String;
  Procedure Calcula_Termino(vanoi,vsemi,vduracao:word;var vanot,vsemt:word);
  Procedure Carrega_Memo(QAluMat,qconscur:TQuery;var Memo1:TMemo);
  Procedure Verifica_Periodo(qconscur,QAluMat,QCalDias,QCalDiasMed:TQuery;vano,vsem:word;DataSis:TDateTime;var cursara,achou:boolean;var DEDataIni, DEDataFim:TDateEdit);
  Function  Focou(RG:TRadioGroup):Boolean;
  Procedure Verifica_Limite_Atribuicao(QAux,QCurTotAulas:TQuery;vcodcur,vperlet,vsemref,vanobloq:word);
  Function  Mostra_Coordenadores(seq:Integer):string;
  function  TiraPontoTraco(texto : string) : string;
  Function  Calcula_Media(ra:real;codhab:word):real;
  Procedure Insere_Horario(MTHorario:TMemoryTable;QCalendario:TQuery);
  function  PrinterSupportsDuplex: Boolean;
  Procedure Seta_Duplex;
  Function  Imp_Nacionalidade(QDadAlu:TQuery):String;
  Procedure Valida_Creditos2(qconsdis,QDiscTur,QDiscCont:TQuery;var ok:boolean;var totaulas,totcarga:word);
  function  GeraSenhaHex(Digitos: Integer; Min: Boolean; Mai: Boolean; Num: Boolean): string;
  procedure InicializaMD(MD : TRxMemoryData);
  Function  Nome_Aluno(nomesocial,nomecivil,nomedefinitivo:string;virgula:boolean):string;
  Function  Verifica_Dependencia(ra:real;coddis:integer):word;
  Function  Matricula_Liberada(vperlet,vsem: word;vra: Real): Boolean;
  Procedure Calcula_CHAluno(QAlunos,QGrade,QHab,QAux,QRFicha:TQuery;SPFicha:TStoredProc;var totcump:real;var totcarga:word;previa,ativ:boolean;vanoref,vsemref,tipativ,minutos:word);
  Procedure Verifica_Professor(MTProfessor:TMemoryTable;QAux,QHorAula:TQuery;vmatr,vano,vsem:integer;tipo:word);
  Procedure Mostra_Linhas(TF:TForm; Visivel:Boolean);
  Procedure Atualiza_Catraca;
  Procedure Grava_HorarioeSocial2(QProfPonto,QProfessor,QHorAula:TQuery;vperiodo,vaulaini,vaulafim,vtipo,vperlet,vsemref,vdiasem,vcodcur,vmes:word);
  Function  Todas_Turmas(vperlet,vsemref:word;vdisc,vmatr:integer):Boolean;
  Function  Maximo_Aulas_Turmas(vperlet,vsemref:word;vdisc,vmatr:integer):Word;
  Function  Media_Aulas2018(vperlet,vsemref:word;vcodcur,vmatr,vcoddis:integer):Word;
  Procedure Importa_Arquivo_Delimitado;
  Function Achou_Conflito_Aluno(perlet,semref:word;coddis1:Integer;codtur1:string;lab1:word;coddis2:Integer;codtur2:string;lab2:word;ra:real):string;
  procedure Comprime_Arquivo(arq: string);
  procedure Descomprime_Arquivo(arq: string);
  Procedure Imprime_ENEM(QDadAlu:TQuery;LDatVest:TppLabel);
  Function Digito_RA(vra : real):word;
  function GetFileModDate(filename : string) : TDateTime;
  Function Habilitacao_Valida(vhab:word):boolean;
  Procedure Imprime_Renovacao(QConsAlu:TQuery;tipo,forma:smallint;var RT:TppRichText);
  Procedure Define_Tamanho_Fonte(fontsize,alinha:word;fontname,text:string;var RT:TppRichText);
  Procedure Ajusta_Quadro(ppLabel46, ppLabel47, ppLabel51:TppLabel;ppLine64:TppLine;tipo:word);
//  Procedure Carrega_Portaria_Tecnico(RV:TppRichView; Q:TQuery);
  Procedure Carrega_Portaria_Tecnico(RV:TppRichView; Q:TQuery; StyleNo, ParaNo:Integer);
  Function Equivalente_Horas2(tipo,codcur,codhab,codgra,vanoing:word;totcarga,totcarga2,tothoras,ra:real;qconsccl,QDadAlu:TQuery):String;
  Function Exibe_CargaTotal2(totcarga,tothoras:real;tipo,totativ,nhab:word;QCHAtiv,QDadAlu,qconsccl:TQuery):String;
  procedure OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
  function FileToBytes(AName: string; var Bytes: TArrayByte): Boolean;
  function EncodeFile(const FileName: string): AnsiString;
  function RetornarPastasPorConteudoDoCampo(area,campo:smallint;ra:real):TObjectList;
  function Atualizar_Documentos_Fluxo_Pasta_PastaValCampo(pastaedocumentos:PastaEDocumentosViewModel):PastaEDocumentosViewModel;
  function CriarNovaPasta(area:smallint;vcodusu:integer;QConsAlu,qconsccl:TQuery):PastaViewModel; overload;
  function CriarNovaPasta(area:smallint;vcodusu:integer;QCurso:TQuery):PastaViewModel; overload;
  function Adicionar(novaPasta:PastaViewModel):PastaViewModel;
  function CarregarCamposDaPasta(pasta,area:integer):TObjectList;
  function RetornaConteudoCamposPorPasta(pasta:integer):TObjectList;
  function RetornaCamposPorArea(area:smallint):TObjectList;
  function RetornaCamposDaArea(area:smallint):TObjectList;
  function Carrega_Ficha_Escolar(ra:real;hab:word):TObjectList;
  function BuscarDocumentoPorNome(pasta:integer;arquivo:string;extensao:string):DocumentosViewModel;
  function ObterTodasPorDocumento(doc:integer):TObjectList;
  //function Gera_Fluxo(docs:TObjectList):TObjectList;
  Function Recupera_Periodo_Vestibular(dataini,datafim:TDateTime) : String;
  Function  Achou_AdicionalPos(MT:TMemoryTable;Q:TQuery):Boolean;
  Function  Achou_DisciplinaPos(MT:TMemoryTable;Q:TQuery):Boolean;

const
  msg1 = 'Caractere(s) inválido(s) no início do e-mail.';
  msg2 = 'Símbolo @ não foi encontrado.';
  msg3 = 'Excesso do símbolo @.';
  msg4 = 'Caractere(s) inválido(s) antes do símbolo @.';
  msg5 = 'Caractere(s) inválido(s) depois do símbolo @.';
  msg6 = 'Agrupamento de caractere(s) inválido(s) a esqueda do @.';
  msg7 = 'Não existe ponto(s) digitado(s).';
  msg8 = 'Ponto encontrado no final do e-mail.';
  msg9 = 'Ausência de caractere(s) após o último ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada após o @.';
  msg12 = 'Caractere(s) inválido(s) antes do ponto.';
  msg13 = 'Caractere(s) inválido(s) depois do ponto.';
  msg14 = 'Espaço em branco não permitido.';

var
  FProcs: TFProcs;
  QProfessor, QGeraProf, QProfPonto, QEscalaProf, QFeriado, QReitProf, QHorAula,
  QDisc, QFer2Grau, QReitProf2, QPonto, QProfPonto2: TQuery;
  valdev, valmen, valordep:real;
  vet_valido: array [0..37] of string = ('0','1','2','3','4','5','6','7', '8','9','a','b','c','d','e','f', 'g','h','i','j','k','l','m','n', 'o','p','q','r','s','t','u','v', 'w','x','y','z','_','-');

implementation

Uses RestUtils, URotinas;

{$R *.DFM}

Function Exibe_CargaTotal2(totcarga,tothoras:real;tipo,totativ,nhab:word;QCHAtiv,QDadAlu,qconsccl:TQuery):String;
var resto:real;
    somaativ:boolean;
Begin
  resto:=frac(totcarga);
  If tipo = 1
  Then
   Begin
     somaativ:=false;
     If totativ <> 0
     Then
      Begin
        QCHAtiv.Close;
        QCHAtiv.ParambyName('ra').AsFloat:=QDadAlu['alu_ra'];
        QCHAtiv.Open;
        If QCHAtiv['totcarga'] <> Null
        Then
         Begin                                            // cur_somativ = 1 (cursos da faclepp)
           If (QCHAtiv['totcarga'] >= totativ) and ((QDadAlu['cur_somaativ'] = 1) or ((QDadAlu['cur_somaativ'] = 2) and
              (NULLToZero(qconsccl['ahb_anoconcl']) >= NULLToZero(QDadAlu['cur_anoativ'])))) and
              (((QDadAlu['cur_codigo'] = 13) and (nhab = 3)) or (QDadAlu['cur_codigo'] <> 13)) and
              (not Deve_Atividade_Obrigatoria(QDadAlu['alu_anoing'],QDadAlu['cur_codigo'],QDadAlu['alu_ra']))
              // Aluno cumpriu toda a carga horária de atividades complementares e cursa psicologia na habilitação 3 ou não cursa psicologia e não deve atividade obrigatória
           Then somaativ:=true;
         End;  
      End;
     If qconsccl['grl_convertehs'] = 'N'
     Then
      Begin
        If resto = 0
        Then
         Begin
           If somaativ
           Then
            Begin
              If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
              Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga+totativ))+' (Inclusas '+IntToStr(totativ)+'H de Atividades Acadêmico-Científico-Culturais)'
              Else Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga+totativ))+' (Inclusas '+IntToStr(totativ)+'H de Atividades Complementares)';
            End
           Else Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga));
         End
        Else
         Begin
           If somaativ
           Then
            Begin
              If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
              Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.00',totcarga+totativ)+' (Inclusas '+IntToStr(totativ)+'H de Atividades Acadêmico-Científico-Culturais)'
              Else Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.00',totcarga+totativ)+' (Inclusas '+IntToStr(totativ)+'H de Atividades Complementares)';
            End
           Else Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.00',totcarga);
         End;
      End
     Else
      Begin
        If resto = 0
        Then
         Begin
           If (QDadAlu['cur_gradistancia'] = 'S') and (qconsccl['grl_converteead'] = 'N')
           Then
            Begin
              If somaativ
              Then
               Begin
                 If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
                 Then Result:='Carga Horária Total : '+IntToStr(trunc(totcarga+totativ))+' horas - inclusas '+IntToStr(totativ)+'H de Atividades Acadêmico-Científico-Culturais'
                 Else Result:='Carga Horária Total : '+IntToStr(trunc(totcarga+totativ))+' horas - inclusas '+IntToStr(totativ)+'H de Atividades Complementares';
               End
              Else Result:='Carga Horária Total : '+IntToStr(trunc(totcarga))+' horas'
            End
           Else
            Begin
              If somaativ
              Then
               Begin
                 If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
                 Then Result:='Carga Horária Total : '+IntToStr(trunc(totcarga+totativ))+' aulas correspondendo a '+IntToStr(trunc(tothoras+totativ))+' horas (relógio - inclusas '+IntToStr(totativ)+'H de Atividades Acadêmico-Científico-Culturais)'
                 Else Result:='Carga Horária Total : '+IntToStr(trunc(totcarga+totativ))+' aulas correspondendo a '+IntToStr(trunc(tothoras+totativ))+' horas (relógio - inclusas '+IntToStr(totativ)+'H de Atividades Complementares)';
               End
              Else Result:='Carga Horária Total : '+IntToStr(trunc(totcarga))+' aulas correspondendo a '+IntToStr(trunc(tothoras))+' horas (relógio)';
            End;  
         End
        Else
         If (QDadAlu['cur_gradistancia'] = 'S') and (qconsccl['grl_converteead'] = 'N')
         Then
          Begin
            If somaativ
            Then
             Begin
               If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
               Then Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga+totativ)+' horas - inclusas '+IntToStr(totativ)+'H de Atividades Acadêmico-Científico-Culturais'
               Else Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga+totativ)+' horas - inclusas '+IntToStr(totativ)+'H de Atividades Complementares';
             End
            Else Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga)+' horas';
          End
         Else
          Begin
            If somaativ
            Then
             Begin
               If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
               Then Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga+totativ)+' aulas correspondendo a '+IntToStr(trunc(tothoras+totativ))+' horas (relógio - inclusas '+IntToStr(totativ)+'H de Atividades Acadêmico-Científico-Culturais)'
               Else Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga+totativ)+' aulas correspondendo a '+IntToStr(trunc(tothoras+totativ))+' horas (relógio - inclusas '+IntToStr(totativ)+'H de Atividades Complementares)';
             End
            Else Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga)+' aulas correspondendo a '+IntToStr(trunc(tothoras))+' horas (relógio)';
          End;
      End;
   End
  Else
   If tipo = 2
   Then Result:=FormatFloat('0.00',totcarga)
   Else
    If resto = 0
    Then Result:=IntToStr(trunc(totcarga))
    Else Result:=FormatFloat('0.00',totcarga);
End;

Function Equivalente_Horas2(tipo,codcur,codhab,codgra,vanoing:word;totcarga,totcarga2,tothoras,ra:real;qconsccl,QDadAlu:TQuery):String;
var resto:real;
    QObsGrade, QCHAtiv:TQuery;
    somaativ:boolean;
Begin
  somaativ:=false;
  QObsGrade:=TQuery.Create(FProcs);
  QObsGrade.DatabaseName:='unoeste';
  QObsGrade.Close;
  QObsGrade.Sql.Clear;
  QObsGrade.Sql.Add('select * from sca_obsgrade');
  QObsGrade.Sql.Add('where cur_codigo =:codcur and hab_codigo =:codhab and grl_codgra =:codgra and obg_tipo = 1');
  QObsGrade.ParamByName('codcur').AsSmallInt:=codcur;
  QObsGrade.ParamByName('codhab').AsSmallInt:=codhab;
  QObsGrade.ParamByName('codgra').AsSmallInt:=codgra;
  QObsGrade.Open;
  If not QObsGrade.Eof
  Then
   Begin
     QCHAtiv:=TQuery.Create(FProcs);
     QCHAtiv.DatabaseName:='unoeste';
     QCHAtiv.Close;
     QCHAtiv.Sql.Clear;
     QCHAtiv.Sql.Add('select sum(aat_cargahor) as totcarga');
     QCHAtiv.Sql.Add('from sca_aluatividade');
     QCHAtiv.Sql.Add('where alu_ra =:ra');
     QCHAtiv.ParambyName('ra').AsFloat:=ra;
     QCHAtiv.Open;
     If NULLToZero(QCHAtiv['totcarga']) >= QObsGrade['obg_chativ']
     Then somaativ:=true;
     QCHAtiv.Destroy;
   End;

  resto:=frac(totcarga);
  If qconsccl['grl_convertehs'] = 'N'
  Then
   Begin
     If resto = 0
     Then
      Begin
    {   If codcur = 112 // Tecnologia em Desenvolvimento Web
       Then
        Begin
         If tipo = 1
         Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))+' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas'
         Else Result:=' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas';
        End
       Else
        Begin}
         If (tipo = 1) or (tipo = 3)
         Then
          Begin
            If not somaativ
            Then
             Begin
               If tipo = 1
    //           Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))+' aulas'
               Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))
               Else Result:=IntToStr(trunc(totcarga));
             End
            Else
             If tipo = 1
   //          Then Result:='Carga Horária Cumprida para Integralização : '+IntToStr(trunc(totcarga+QObsGrade['obg_chativ']))+' aulas - inclusas Atividades Complementares'
   // A Nair pediu para alterar - 29/03/2016
             Then
              Begin
                If Deve_Atividade_Obrigatoria(vanoing,codcur,ra)
                Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))
                Else Result:='Carga Horária Cumprida : '+IntToStr(trunc(totcarga+QObsGrade['obg_chativ']))+' - inclusas Atividades Complementares';
              End
             Else Result:=IntToStr(trunc(totcarga+QObsGrade['obg_chativ']));
          End
         Else Result:='';
    //    End;
      End
     Else
    {  If codcur = 112 // Tecnologia em Desenvolvimento Web
      Then
       Begin
        If tipo = 1
        Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)+' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas'
        Else Result:=' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas';
       End
      Else
       Begin}
        If (tipo = 1) or (tipo = 3)
        Then
         Begin
           If not somaativ
           Then
            Begin
              If tipo = 1
    //          Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)+' aulas'
              Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)
              Else Result:=FormatFloat('0.0',totcarga);
            End
           Else
            If tipo = 1
   //         Then Result:='Carga Horária Cumprida para Integralização : '+FormatFloat('0.0',totcarga+QObsGrade['obg_chativ'])+' aulas - inclusas Atividades Complementares'
   // A Nair pediu para alterar - 29/03/2016
            Then
             Begin
               If Deve_Atividade_Obrigatoria(vanoing,codcur,ra)
               Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)
               Else Result:='Carga Horária Cumprida : '+FormatFloat('0.0',totcarga+QObsGrade['obg_chativ'])+' - inclusas Atividades Complementares';
             End
            Else Result:=FormatFloat('0.0',totcarga+QObsGrade['obg_chativ']);
         End
        Else Result:='';
    //   End;
   End
  Else
   Begin
     If (tipo = 1) or (tipo = 3)
     Then
      Begin
        If resto = 0
        Then
         Begin
           If (QDadAlu['cur_gradistancia'] = 'S') and (qconsccl['grl_converteead'] = 'N')
           Then
            Begin
              If (somaativ) and (not Deve_Atividade_Obrigatoria(vanoing,codcur,ra))
              Then
               Begin
                 If tipo = 1
                 Then Result:='Carga Horária Total : '+IntToStr(trunc(totcarga+QObsGrade['obg_chativ']))+' horas - inclusas Atividades Complementares'
                 Else Result:=IntToStr(trunc(totcarga+QObsGrade['obg_chativ']));
               End
              Else
               If tipo = 1
               Then Result:='Carga Horária Total : '+IntToStr(trunc(totcarga))+' horas'
               Else Result:=IntToStr(trunc(totcarga));
            End
           Else
            Begin
              If (somaativ) and (not Deve_Atividade_Obrigatoria(vanoing,codcur,ra))
              Then
               Begin
                 If tipo = 1
                 Then Result:='Carga Horária Total : '+IntToStr(trunc(totcarga+QObsGrade['obg_chativ']))+' aulas correspondendo a '+IntToStr(trunc(tothoras+QObsGrade['obg_chativ']))+' horas (relógio - inclusas Atividades Complementares)'
                 Else Result:=IntToStr(trunc(totcarga+QObsGrade['obg_chativ']));
               End
              Else
               If tipo = 1
               Then Result:='Carga Horária Total : '+IntToStr(trunc(totcarga))+' aulas correspondendo a '+IntToStr(trunc(tothoras))+' horas (relógio)'
               Else Result:=IntToStr(trunc(totcarga));
            End;
         End
        Else
         If (QDadAlu['cur_gradistancia'] = 'S') and (qconsccl['grl_converteead'] = 'N')
         Then
          Begin
            If (somaativ) and (not Deve_Atividade_Obrigatoria(vanoing,codcur,ra))
            Then
             Begin
               If tipo = 1
               Then Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga+QObsGrade['obg_chativ'])+' horas - inclusas Atividades Complementares'
               Else Result:=FormatFloat('0.00',totcarga+QObsGrade['obg_chativ']);
             End
            Else
             If tipo = 1
             Then Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga)+' horas'
             Else Result:=FormatFloat('0.00',totcarga);
          End
         Else
          Begin
            If (somaativ) and (not Deve_Atividade_Obrigatoria(vanoing,codcur,ra))
            Then
             Begin
               If tipo = 1
               Then Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga+QObsGrade['obg_chativ'])+' aulas correspondendo a '+IntToStr(trunc(tothoras+QObsGrade['obg_chativ']))+' horas (relógio - inclusas Atividades Complementares)'
               Else Result:=FormatFloat('0.00',totcarga+QObsGrade['obg_chativ']);
             End
            Else
             If tipo = 1
             Then Result:='Carga Horária Total : '+FormatFloat('0.00',totcarga)+' aulas correspondendo a '+IntToStr(trunc(tothoras))+' horas (relógio)'
             Else Result:=FormatFloat('0.00',totcarga);
          End;
      End
     Else Result:='';
   End;
  QObsGrade.Destroy;
End;

{Procedure Carrega_Portaria_Tecnico(RV:TppRichView; Q:TQuery);
Begin
  If (Q['cur_codigo'] = 752) and ((Q['alu_anoing'] > 2020) or ((Q['alu_anoing'] = 2020) and (Q['alu_seming'] = 2))) // curso de enfermagem a partir de 2/2020
  Then RV.RichView.AddNL('Publicado no D.O.U em 22/01/2021 - Portaria nº28 de 21 de Janeiro de 2021.',0,0)
  Else
   Begin
     RV.RichView.AddNL('Curso de acordo com a portaria nº 401, de 10 de Maio de 2016.',0,0);
     RV.RichView.AddNL('Publicado no D.O.U. nº 89, de 11 de Maio de 2016, Seção1, Página 41.',0,0);
     If (Q['alu_anoing'] >= 2019)
     Then
      Begin
        RV.RichView.AddNL('Curso de acordo com a portaria nº 1.717, de 08 de Outubro de 2019.',0,0);
        RV.RichView.AddNL('Publicado no D.O.U, de 09 de Outubro de 2019, Edição 196, Seção1, Página 37.',0,0);
      End;
   End;
End;}

Procedure Carrega_Portaria_Tecnico(RV:TppRichView; Q:TQuery; StyleNo, ParaNo:Integer);
var vdia,vmes,vano:word;
    Mes: Array[1..12] of String;
Begin
  Mes[1]:='Janeiro';
  Mes[2]:='Fevereiro';
  Mes[3]:='Março';
  Mes[4]:='Abril';
  Mes[5]:='Maio';
  Mes[6]:='Junho';
  Mes[7]:='Julho';
  Mes[8]:='Agosto';
  Mes[9]:='Setembro';
  Mes[10]:='Outubro';
  Mes[11]:='Novembro';
  Mes[12]:='Dezembro';
  If (Q['cur_autdata'] <> Null) and (Q['cur_dataportaria'] <> Null) and (Trim(NULLToSpace(Q['cur_autndc'])) <> '')
  Then
   Begin
     DecodeDate(Q['cur_dataportaria'],vano,vmes,vdia);
     RV.RichView.AddNL('Publicado no D.O.U em ' + DateToStr(Q['cur_autdata']) + ' - Portaria nº' + Q['cur_autndc'] + ' de ' + StrZero(vdia,2) + ' de ' + Mes[vmes] + ' de ' + IntToStr(vano) + '.',StyleNo,ParaNo);
   End;
End;

Procedure Ajusta_Quadro(ppLabel46, ppLabel47, ppLabel51:TppLabel;ppLine64:TppLine;tipo:word);
Begin
  If tipo = 1 // vestibular
  Then
   Begin
     ppLabel46.Caption:='Ingresso por Processo Seletivo';
     ppLine64.Left:=1.3125;
     ppLine64.Width:=6.3646;
     ppLabel47.Caption:='Período do Processo Seletivo';
     ppLabel51.Caption:='Entidade Realizadora';
   End
  Else
   If tipo = 2 // ENEM
   Then
    Begin
      ppLabel46.Caption:='    Forma de Ingresso';
      ppLine64.Left:=0.9687;
      ppLine64.Width:=6.6979;
      ppLabel47.Caption:='';
      ppLabel51.Caption:='Mês/Ano';
    End;
End;

Function Media_Aulas2018(vperlet,vsemref:word;vcodcur,vmatr,vcoddis:integer):Word;
var QTot:TQuery;
    totaulas:word;
Begin
  QTot:=TQuery.Create(FProcs);
  QTot.DatabaseName:='unoeste';

  QTot.Close;
  QTot.Sql.Clear;
  QTot.Sql.Add('select d.dis_codigo, d.dst_codtur, round(sum(hrp_nroaulas)/max(dst_semanas)) totaulas');
  QTot.Sql.Add('from sca_disc_tur d, sca_cursos c, sca_disciplinas di, sca_horprof h');
  QTot.Sql.Add('where d.dst_perlet = h.dst_perlet and d.dst_semref = h.dst_semref and');
  QTot.Sql.Add('      d.dis_codigo = h.dis_codigo and d.dis_codigo = di.dis_codigo and');
  QTot.Sql.Add('      d.dst_codtur = h.dst_codtur and c.cur_codigo = di.cur_codigo and');
  QTot.Sql.Add('      d.dst_perlet =:perlet and d.dst_semref =:semref and');
  QTot.Sql.Add('      c.cur_codigo =:codcur and h.fun_matr =:matr and dst_periodo = "S" and d.dst_remunerada = 0');
  If vcoddis <> 0
  Then
   Begin
     QTot.Sql.Add('      and d.dis_codigo =:coddis');
     QTot.ParamByName('coddis').AsInteger:=vcoddis;
   End;
  QTot.Sql.Add('group by 1,2');
  QTot.ParamByName('perlet').AsInteger:=vperlet;
  QTot.ParamByName('semref').AsInteger:=vsemref;
  QTot.ParamByName('matr').AsInteger:=vmatr;
  QTot.ParamByName('codcur').AsInteger:=vcodcur;
  QTot.Open;

  totaulas:=0;
  While not QTot.Eof do
  Begin
    totaulas:=totaulas + NULLToZero(QTot['totaulas']);
    QTot.Next;
  End;

  QTot.Destroy;
  
  Result:=totaulas;
End;

Function Maximo_Aulas_Turmas(vperlet,vsemref:word;vdisc,vmatr:integer):Word;
var QTot:TQuery;
Begin
  QTot:=TQuery.Create(FProcs);
  QTot.DatabaseName:='unoeste';

  QTot.Close;
  QTot.Sql.Clear;
  QTot.Sql.Add('select r.dis_codigo, r.dst_codtur, dis_nomdisc, sum(rei_semanal) aulas');
  QTot.Sql.Add('from sca_reitprof r, sca_disc_tur dt, sca_disciplinas d');
  QTot.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
  QTot.Sql.Add('      r.dis_codigo = dt.dis_codigo and r.dis_codigo = d.dis_codigo and');
  QTot.Sql.Add('      r.dst_codtur = dt.dst_codtur and r.dst_perlet =:perlet and r.dst_semref =:semref and');
  QTot.Sql.Add('      d.dis_codigo =:coddis and r.fun_matr =:matr and dst_periodo = "S" and dst_remunerada = 0');
  QTot.Sql.Add('group by 1, 2, 3');
  QTot.Sql.Add('into temp tmp_reitprof');
  QTot.ParamByName('perlet').AsInteger:=vperlet;
  QTot.ParamByName('semref').AsSmallInt:=vsemref;
  QTot.ParamByName('matr').AsInteger:=vmatr;
  QTot.ParamByName('coddis').AsInteger:=vdisc;
  QTot.ExecSQL;

  QTot.Close;
  QTot.Sql.Clear;
  QTot.Sql.Add('select dis_codigo, dis_nomdisc, max(aulas) totaulas');
  QTot.Sql.Add('from tmp_reitprof');
  QTot.Sql.Add('group by 1, 2');
  QTot.Open;
  Result:=NULLToZero(QTot['totaulas']);

  QTot.Close;
  QTot.Sql.Clear;
  QTot.Sql.Add('drop table tmp_reitprof');
  QTot.ExecSQL;
  QTot.Destroy;
End;

Function Todas_Turmas(vperlet,vsemref:word;vdisc,vmatr:integer):Boolean;
var QDisc:TQuery;
    totturmas, totprof:word;
Begin
  QDisc:=TQuery.Create(FProcs);
  QDisc.DatabaseName:='unoeste';

  QDisc.Close;
  QDisc.Sql.Clear;
  QDisc.Sql.Add('select count(*) totdisc');
  QDisc.Sql.Add('from sca_disc_tur');
  QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and');
  QDisc.Sql.Add('      dis_codigo =:coddis and dst_periodo = "S" and dst_remunerada = 0');
  QDisc.ParamByName('perlet').AsInteger:=vperlet;
  QDisc.ParamByName('semref').AsSmallInt:=vsemref;
  QDisc.ParamByName('coddis').AsInteger:=vdisc;
  QDisc.Open;
  If not QDisc.Eof
  Then
   Begin
     totturmas:=QDisc['totdisc'];

     // Verificar se o professor tem atribuição em todas as turmas dessa disciplina. Caso ele não tenha, calcular a média
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select count(distinct dis_codigo||dst_codtur) totdisc');
     QDisc.Sql.Add('from sca_reitprof');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and');
     QDisc.Sql.Add('      fun_matr =:matr and dis_codigo =:coddis');
     QDisc.ParamByName('perlet').AsInteger:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=vmatr;
     QDisc.ParamByName('coddis').AsInteger:=vdisc;
     QDisc.Open;
     totprof:=QDisc['totdisc'];
     Result:=totturmas = totprof;
   End
  Else Result:=False;

  QDisc.Destroy;
End;

procedure LimpaDB(DS: TDataSource);
begin
  DS.Enabled:=False;
end;

procedure MostraDB(DS: TDataSource);
begin
  DS.Enabled:=True;
end;

Procedure VerCampoVazio(TQ:TQuery);
Var
  i: integer;
  Valor: string;
Begin
  For i := 0 to TQ.FieldCount - 1 do
  Begin
    Valor := TQ.Fields[i].AsString;
    If (TQ.Fields[i].Required) and (Valor = '') then
      TQ.Fields[i].Value := null;
  End;
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

{procedure calcdig(carne : string;var ok :string);
var
  x : string[10];
  soma,inteiro,resto,digito : integer;
begin
 if length(carne) = 10 then
 begin
  x := carne;
  ok:= ' ';
  soma :=((strtoint(x[1]) * 10) + (strtoint(x[2]) * 9) + (strtoint(x[3]) * 8) + (strtoint(x[4]) * 7) +
          (strtoint(x[5]) * 6) + (strtoint(x[6]) * 5) + (strtoint(x[7]) * 4) +
          (strtoint(x[8]) * 3) + (strtoint(x[9]) * 2));
  inteiro := soma div 11;
  inteiro := inteiro * 11;
  resto := soma - inteiro;
  digito := 11 - resto;
  if (digito = 11) or (digito = 10) then
     digito := 0;
  if x[10] <> (inttostr(digito)) then
     ok:= 'n';
 end;
end;}

procedure calcdig(carne : string;var ok :string);
var
  x8 :   string[08];
  x9 :   string[09];
  x10 :  string[10];
  x11 :  string[11];
  soma,inteiro,resto,digito : integer;
begin
  if length(carne) = 8 then
  begin
   x8 := carne;
   ok:= ' ';
   soma :=((strtoint(x8[1]) * 8) + (strtoint(x8[2]) * 7) + (strtoint(x8[3]) * 6) +
           (strtoint(x8[4]) * 5) + (strtoint(x8[5]) * 4) + (strtoint(x8[6]) * 3) +
           (strtoint(x8[7]) * 2));
   inteiro := soma div 11;
   inteiro := inteiro * 11;
   resto := soma - inteiro;
   digito := 11 - resto;
   if (digito = 11) or (digito = 10) then
      digito := 0;
   if x8[8] <> (inttostr(digito)) then
      ok:= 'n';
  end
  else
   if length(carne) = 9 then
   begin
    x9 := carne;
    ok:= ' ';
    soma :=((strtoint(x9[1]) * 9) + (strtoint(x9[2]) * 8) + (strtoint(x9[3]) * 7) +
            (strtoint(x9[4]) * 6) + (strtoint(x9[5]) * 5) + (strtoint(x9[6]) * 4) +
            (strtoint(x9[7]) * 3) + (strtoint(x9[8]) * 2));
    inteiro := soma div 11;
    inteiro := inteiro * 11;
    resto := soma - inteiro;
    digito := 11 - resto;
    if (digito = 11) or (digito = 10) then
       digito := 0;
    if x9[9] <> (inttostr(digito)) then
       ok:= 'n';
   end
   else
    if length(carne) = 10 then
    begin
     x10 := carne;
     ok:= ' ';
     soma :=((strtoint(x10[1]) * 10) + (strtoint(x10[2]) * 9) + (strtoint(x10[3]) * 8) + (strtoint(x10[4]) * 7) +
             (strtoint(x10[5]) * 6) + (strtoint(x10[6]) * 5) + (strtoint(x10[7]) * 4) +
             (strtoint(x10[8]) * 3) + (strtoint(x10[9]) * 2));
     inteiro := soma div 11;
     inteiro := inteiro * 11;
     resto := soma - inteiro;
     digito := 11 - resto;
     if (digito = 11) or (digito = 10) then
        digito := 0;
     if x10[10] <> (inttostr(digito)) then
        ok:= 'n';
    end
    else
     if length(carne) = 11 then
     begin
      x11 := carne;
      ok:= ' ';
      soma :=((strtoint(x11[1]) * 11) + (strtoint(x11[2]) * 10) + (strtoint(x11[3]) * 9) + (strtoint(x11[4]) * 8) +
              (strtoint(x11[5]) * 7) + (strtoint(x11[6]) * 6) + (strtoint(x11[7]) * 5) +
              (strtoint(x11[8]) * 4) + (strtoint(x11[9]) * 3) + (strtoint(x11[10]) * 2));
      inteiro := soma div 11;
      inteiro := inteiro * 11;
      resto := soma - inteiro;
      digito := 11 - resto;
      if (digito = 11) or (digito = 10) then
         digito := 0;
      if x11[11] <> (inttostr(digito)) then
         ok:= 'n';
     end;
end;

Function Digito_RA(vra : real):word;
var
  x11 :  string[11];
  soma,inteiro,resto,digito,digaux : integer;
begin
  digito:=999;
  digaux:=0;
  While digaux <> digito do
  Begin
    x11:=StrZero(vra,10)+IntToStr(digaux);
    soma :=((strtoint(x11[1]) * 11) + (strtoint(x11[2]) * 10) + (strtoint(x11[3]) * 9) + (strtoint(x11[4]) * 8) +
            (strtoint(x11[5]) * 7) + (strtoint(x11[6]) * 6) + (strtoint(x11[7]) * 5) +
            (strtoint(x11[8]) * 4) + (strtoint(x11[9]) * 3) + (strtoint(x11[10]) * 2));
    inteiro := soma div 11;
    inteiro := inteiro * 11;
    resto := soma - inteiro;
    digito := 11 - resto;
    if (digito = 11) or (digito = 10) then
       digito := 0;
    if x11[11] <> (inttostr(digito)) then
       inc(digaux);
  End;
  Result:=digaux;
end;

function CNPJ(Value: String): Boolean;
var
  i, D, D1, D2, R, M1, M2: integer;
  aux: string;
begin
   Result:=False;
   D1:=0;
   D2:=0;
   aux:= '';
   for i:=1 to Length(Value) do
   begin
     if (Pos(Copy(Value,i,1),'/-.')=0) then
       aux:=aux+Copy(Value,i,1);
   end;
   if ((Length(Trim(aux))=14) and (aux<>StringOfChar('0', 14))) then
   begin
      Value:=aux;
      for i:=1 to 12 do
      begin
         if (i<5) then
            M1:=6
         else
            M1:=14;
         if (i<6) then
            M2:=7
         else
            M2:=15;
         D1:=D1+StrToInt(Copy(Value,i,1))*(M1-i);
         D2:=D2+StrToInt(Copy(Value,i,1))*(M2-i);
      end;
      R:=D1 mod 11;
      if (R<2) then
         D:=0
      else
         D:=11-R;
      D2:=D2+(2*D);
      R:=D2 mod 11;
      D:=(D*10);
      if (R>=2) then
         D:=D+(11-R);
      if (D=StrToInt(Copy(Value, 13, 2))) then
         Result:=True;
   end;
end;

Procedure Calc_Barra(vBoleto:integer;vValCobr:double;VDatVencto:TDateTime;Var L_Digit,CBarra:string);
Var DigC1,DigC2,DigC3,Dig01,DigBA:String[1];
    Banco,Moeda,Agenc,Conta:String[07];
    Campo1,Campo2,V,Campo3,Bloqu,Vencto:String;
    Soma,S:SmallInt;
    I,N,Resto:Integer;
Begin
  Banco:='356';
  Moeda:='9';
  Agenc:='1299';
  Conta:='2700758';
  Bloqu:=FormatFloat('0000000000000',vBoleto);
  Campo1:=Banco+Moeda+Agenc+Copy(Conta,1,1);
  DigC1:=IntToStr(Cal_Dig(Campo1));
  Dig01:=IntToStr(Cal_Dig(Copy(Bloqu,5,9)+Agenc+Conta));
  Campo2:=Copy(Conta,2,6)+Dig01+Copy(Bloqu,1,3);
  DigC2:=IntToStr(Cal_Dig(Campo2));
  Campo3:=Copy(Bloqu,4,10);
  DigC3:=IntToStr(Cal_Dig(Campo3));
  Vencto:=FloatToStr(FatorVencimento(vDatVencto));
  V:=FormatFloat('00000000.00',vValCobr);
  V:=Copy(V,1,8)+Copy(V,10,2);
  CBarra:=Banco+Moeda+Vencto+V+Agenc+Conta+Dig01+Bloqu;
  {Preparando o digito verificador do Código de barra}
  Soma:=0;
  N:=2;
  For I:=43 DownTo 1 do
  Begin
    S:=(N*StrToInt(Copy(CBarra,I,1)));
    Soma:=Soma+S;
    N:=N+1;
    If N>9 Then
       N:=2;
  End;
  Resto:=Soma Mod 11;
  If ((Resto=10) Or (Resto=1) Or (Resto=0)) then
      DigBA:='1'
  Else
      DigBA:=IntToStr((11-Resto));
  CBarra:=Banco+Moeda+DigBA+Vencto+V+Agenc+Conta+Dig01+Bloqu;
//  I:=1;
//  While Copy(V,I,1)='0' Do
//      I:=I+1;
//  V:=Copy(V,I,14); {As 3 últimas linhas preparam o valor p/ linha de digitaçaõ}
  L_Digit:=Copy(Campo1,1,5)+'.'+Copy(Campo1,6,4)+DigC1+' '+
           Copy(Campo2,1,5)+'.'+Copy(Campo2,6,5)+DigC2+' '+
           Copy(Campo3,1,5)+'.'+Copy(Campo3,6,5)+DigC3+' '+DigBA+' '+Vencto+V;
End;

function FatorVencimento(Vencto: TDate): Double;
begin
   Result := Vencto-EncodeDate(2000, 07, 03)+1000;
end;

Function Libera_Diploma(ra: real;hab :word): boolean;
var QEnade, QAluno:TQuery;
    vdia,vmes,vano:word;
    ok:boolean;
Begin
  QEnade:=TQuery.Create(FProcs);
  QEnade.DatabaseName:='unoeste';

  QAluno:=TQuery.Create(FProcs);
  QAluno.DatabaseName:='unoeste';
  QAluno.Close;
  QAluno.Sql.Clear;
  QAluno.Sql.Add('select * from sca_alu_hab ah, sca_habilitacao h, sca_alunos a, sca_cursos c');
  QAluno.Sql.Add('where ah.hab_codigo = h.hab_codigo and ah.alu_ra = a.alu_ra and a.cur_codigo = c.cur_codigo and a.alu_ra =:ra and ah.hab_codigo =:hab');
  QAluno.ParambyName('ra').AsFloat:=ra;
  QAluno.ParambyName('hab').AsSmallInt:=hab;
  QAluno.Open;
  If QAluno.Eof // aluno não possui habilitação cadastrada
  Then Result:=False
  Else
   Begin
     If QAluno['cur_grapos'] = 8 // ensino médio
     Then Result:=True
     Else
      Begin
        vano:=9999;
        If QAluno['ahb_conclusao'] <> Null
        Then DecodeDate(QAluno['ahb_conclusao'],vano,vmes,vdia);
        If vano < 2011
        Then Result:=True
        Else
         Begin
           ok:=true;
           // verificar pendência como concluinte
           QEnade.Close;
           QEnade.Sql.Clear;
           QEnade.Sql.Add('select * from sca_enade e, sca_enasituacao s');
           QEnade.Sql.Add('where e.ena_situacao = s.sit_tipo and e.alu_ra =:ra and sit_liberadip = "N" and (hab_codigo =:hab1 or hab_codigo =:hab2) and ena_conclui = 0 and');
           QEnade.Sql.Add('      e.alu_ra not in (select alu_ra from sca_enade e1, sca_enasituacao s1');
           QEnade.Sql.Add('      where e1.ena_situacao = s1.sit_tipo and e1.alu_ra =:ra and sit_liberadip = "S" and (hab_codigo =:hab1 or hab_codigo =:hab2) and ena_conclui = 0 and');
           QEnade.Sql.Add('      (e1.ena_ano * 12 + e1.ena_semestre) > (e.ena_ano * 12 + e.ena_semestre))');
           QEnade.ParambyName('ra').AsFloat:=ra;
           QEnade.ParambyName('hab1').AsSmallInt:=hab;
           QEnade.ParambyName('hab2').AsSmallInt:=QAluno['hab_ligacao'];
           QEnade.Open;
           If not QEnade.Eof
           Then ok:=false
           Else
            Begin
              // verificar pendência como ingressante
              QEnade.Close;
              QEnade.Sql.Clear;
              QEnade.Sql.Add('select * from sca_enade e, sca_enasituacao s');
              QEnade.Sql.Add('where e.ena_situacao = s.sit_tipo and e.alu_ra =:ra and sit_liberadip = "N" and (hab_codigo =:hab1 or hab_codigo =:hab2) and ena_conclui = 1 and');
              QEnade.Sql.Add('      e.alu_ra not in (select alu_ra from sca_enade e1, sca_enasituacao s1');
              QEnade.Sql.Add('      where e1.ena_situacao = s1.sit_tipo and e1.alu_ra =:ra and sit_liberadip = "S" and (hab_codigo =:hab1 or hab_codigo =:hab2) and ena_conclui = 1 and');
              QEnade.Sql.Add('      (e1.ena_ano * 12 + e1.ena_semestre) > (e.ena_ano * 12 + e.ena_semestre))');
              QEnade.ParambyName('ra').AsFloat:=ra;
              QEnade.ParambyName('hab1').AsSmallInt:=hab;
              QEnade.ParambyName('hab2').AsSmallInt:=QAluno['hab_ligacao'];
              QEnade.Open;
              If not QEnade.Eof
              Then ok:=false
            End;
{           QEnade.Close;
           QEnade.Sql.Clear;
           QEnade.Sql.Add('select * from sca_enade e, sca_enasituacao s');
           QEnade.Sql.Add('where e.ena_situacao = s.sit_tipo and alu_ra =:ra and sit_liberadip = "N" and (hab_codigo =:hab1 or hab_codigo =:hab2)');
           QEnade.ParambyName('ra').AsFloat:=ra;
           QEnade.ParambyName('hab1').AsSmallInt:=hab;
           QEnade.ParambyName('hab2').AsSmallInt:=QAluno['hab_ligacao'];
           QEnade.Open;
           If not QEnade.Eof // não posso passar como parâmetro a habilitação pois o aluno pode ter feito o enade como ingressante em uma habilitação e concluinte em outra
           Then Result:=False}
           If not ok // não posso passar como parâmetro a habilitação pois o aluno pode ter feito o enade como ingressante em uma habilitação e concluinte em outra
           Then Result:=False
           Else
            Begin
              QEnade.Close;
              QEnade.Sql.Clear;
              QEnade.Sql.Add('select count(distinct ena_conclui) tot from sca_enade e, sca_enasituacao s');
              QEnade.Sql.Add('where e.ena_situacao = s.sit_tipo and alu_ra =:ra and sit_liberadip = "S" and (hab_codigo =:hab1 or hab_codigo =:hab2)');
              QEnade.ParambyName('ra').AsFloat:=ra;
              QEnade.ParambyName('hab1').AsSmallInt:=hab;
              QEnade.ParambyName('hab2').AsSmallInt:=QAluno['hab_ligacao'];
              QEnade.Open;
              If QEnade['tot'] <> 2
              Then Result:=False
              Else Result:=True;
            End;
         End;
      End;
   End;
  QEnade.Destroy;
  QAluno.Destroy;
End;

Function Libera_Historico(ra: real; hab: word): boolean;
var QEnade, QAluno:TQuery;
    vdia,vmes,vano:word;
Begin
  QEnade:=TQuery.Create(FProcs);
  QEnade.DatabaseName:='unoeste';

  QAluno:=TQuery.Create(FProcs);
  QAluno.DatabaseName:='unoeste';
  QAluno.Close;
  QAluno.Sql.Clear;
  QAluno.Sql.Add('select * from sca_alunos a, sca_cursos c, sca_alu_hab ah, sca_habilitacao h');
  QAluno.Sql.Add('where ah.hab_codigo = h.hab_codigo and ah.alu_ra = a.alu_ra and a.cur_codigo = c.cur_codigo and a.alu_ra =:ra and ah.hab_codigo =:hab');
  QAluno.ParambyName('ra').AsFloat:=ra;
  QAluno.ParambyName('hab').AsSmallInt:=hab;
  QAluno.Open;
  If QAluno.Eof // aluno não possui habilitação cadastrada
  Then Result:=False
  Else
   Begin
     If (QAluno['cur_grapos'] = 8) or (QAluno['cur_codigo'] = 311) // ensino médio ou estudos complementares em educação infantil
     Then Result:=True
     Else
      Begin
        vano:=9999;
        If QAluno['ahb_conclusao'] <> Null
        Then DecodeDate(QAluno['ahb_conclusao'],vano,vmes,vdia);
        If vano < 2011
        Then Result:=True
        Else
         Begin
           QEnade.Close;
           QEnade.Sql.Clear;
           QEnade.Sql.Add('select * from sca_enade e, sca_enasituacao s');
           QEnade.Sql.Add('where e.ena_situacao = s.sit_tipo and alu_ra =:ra and sit_liberahist = "N" and (hab_codigo =:hab1 or hab_codigo =:hab2)');
           QEnade.ParambyName('ra').AsFloat:=ra;
           QEnade.ParambyName('hab1').AsSmallInt:=hab;
           QEnade.ParambyName('hab2').AsSmallInt:=QAluno['hab_ligacao'];
           QEnade.Open;
           If not QEnade.Eof // não posso passar como parâmetro a habilitação pois o aluno pode ter feito o enade como ingressante em uma habilitação e concluinte em outra
           Then Result:=False
           Else
            Begin
              QEnade.Close;
              QEnade.Sql.Clear;
              QEnade.Sql.Add('select count(distinct ena_conclui) tot from sca_enade e, sca_enasituacao s');
              QEnade.Sql.Add('where e.ena_situacao = s.sit_tipo and alu_ra =:ra and sit_liberahist = "S" and (hab_codigo =:hab1 or hab_codigo =:hab2)');
              QEnade.ParambyName('ra').AsFloat:=ra;
              QEnade.ParambyName('hab1').AsSmallInt:=hab;
              QEnade.ParambyName('hab2').AsSmallInt:=QAluno['hab_ligacao'];
              QEnade.Open;
              If QEnade['tot'] <> 2
              Then Result:=False
              Else Result:=True;
            End;
         End;
      End;
   End;
  QEnade.Destroy;
  QAluno.Destroy;
End;

Function Atribuicao_Aberta(vdata: TDateTime): Boolean;
Begin
 Try
  With FProcs do
  Begin
   QAbertAtrib.Close;
   QAbertAtrib.Open;
   If not QAbertAtrib.Eof
   Then
    Begin
     If (vdata >= QAbertAtrib['ata_dtinicio']) and (vdata - 1 <= QAbertAtrib['ata_dtfinal'])
     Then Result:=True
     Else Result:=False;
    End
   Else Result:=False;
  End;
 Except
  Result:=False;
 End;
End;

function AulasFolha(sem, index, ano, mess, matr, curso : integer):integer;
var ccusto, mes, dia : integer;
    data : TDateTime;
begin
 With FProcs do
 Begin
   Q_Aux.RequestLive := False;
   //ver pela folha, quanto quantas aulas são pagas para o professor
   //1º semestre, mês de junho, e 2º semestre, mês de dezembro
   if Index = 2
    then if sem = 1
          then begin
                data := StrToDate('30/06/' + IntToStr(ano));
                mes := 6;
               end
          else begin
                data := StrToDate('31/12/' + IntToStr(Ano));
                mes := 12;
               end
    else begin
          mes := mess;
          data := StrToDate('01/' + IntToStr(mes) + '/' + IntToStr(Ano));
          dia := Ultimo_Dia(data);
          data := StrToDate(IntToStr(dia) + '/' + IntToStr(mes) + '/' + IntToStr(Ano));
         end;
   Q_Aux.Close;
   Q_Aux.Sql.Clear;
   Q_Aux.Sql.Add('Select * from fol_salfun s, fol_cargo c where s.emp_codigo = 1 and fun_codigo = ' + IntToStr(matr)
                +' and sal_ano <= ' + IntToStr(ano) + ' and (s.cgo_codigo = 189 or s.cgo_codigo = 146 or s.cgo_codigo = 147)'
                +' and ((saf_datafin is null and saf_dataini <= "' + DateToStr(data) + '") or '
                +' ("' + DateToStr(data) + '" between saf_dataini and saf_datafin)) and '
                +' (saf_dataini <> saf_datafin or saf_datafin is null) and '
                +' s.cgo_codigo = c.cgo_codigo and s.emp_codigo = c.emp_codigo');
   Q_Aux.Open;
   if not Q_Aux.Eof
    then result := 0
    else begin
           Q_Aux.Close;
           Q_Aux.SQL.Clear;
           Q_Aux.SQL.Add('Select * from sca_cursos where cur_codigo = ' + IntToStr(curso));
           Q_Aux.Open;
           if Q_Aux.Eof
            then ShowMessage('Curso não definido')
            else if Q_Aux['ccu_codigo'] = null //curso 256 não tem centro de custo
                  then result := 0
                  else begin
                         ccusto := Q_Aux['ccu_codigo'];
                         Q_Aux.Close;
                         Q_Aux.SQL.Clear;
                         Q_Aux.Sql.Add('select fun_codigo, sum(evf_inteiro) as totaulas from fol_funceve f, fol_eventos e, crp_ccusto c where'
                                      +' fun_codigo = ' + IntToStr(matr) + ' and tpf_codigo = 1 and emp_codigo = 1 and'
                                      +' evm_mes = ' + IntToStr(mes) + ' and evm_ano = ' + IntToStr(Ano) + ' and e.eve_codigo = f.eve_codigo'
                                      +' and e.eve_aula = "S" and f.evf_ccusto = c.ccu_codigo and eve_nhxaula = 1'
                                      +' and c.ccu_codigo = ' + IntToStr(ccusto) + ' group by fun_codigo');
                         Q_Aux.Open;
                         if not Q_Aux.Eof
                          then result := Q_Aux['totaulas']
                          else result := 0;
                       end;
         end;
   Q_Aux.RequestLive := True;
 End;  
end;

function ValidaNomeDisciplina(ADisNome : String) : String;
var i : integer;
begin
    for i := 1 to Length(ADisNome) do
        if ADisNome[i] in ['*','/','\','?','<','>','"','|']
           then Result := Result + '#'
           else Result := Result + ADisNome[i];

end;

Procedure Carrega_Observacoes(var MTObs:TMemoryTable;disp1,disp2,disp3,disp4,lancado,cursando1,cursando2:boolean;vnota1,vnota2,codobs,RGHist,RGTipo:word;
                              qconsccl,QDadAlu,QAluHabEq:TQuery);
Begin
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
  If (QDadAlu['fac_codigo'] = 1) and (qconsccl['ahb_conclusao'] <> Null) and (qconsccl['ahb_conclusao'] < StrToDate('01/01/2003'))  // FACLEPP, concluintes até 2002 - a pedido da Nair - 28/03/2019
  Then
   Begin
    MTObs.Append;
    MTObs['obs_observ']:='CARGA HORÁRIA COM "****", ENTENDER: - CARGA HORÁRIA JÁ LANÇADA EM DISPENSA OU EQUIVALÊNCIA DE OUTRA DISCIPLINA, OU JÁ';
    MTObs.Post;
    MTObs.Append;
    MTObs['obs_observ']:='COMPUTADA EM LICENCIATURA DE 1º GRAU.';
    MTObs.Post;
   End
  Else
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
// Carrega_Atividades(NULLToZero(QGradLet['totativ']),QCHAtiv,QDadAlu,qconsccl,MTObs,totcarga,somou);
 If RGHist = 1 // Análise de Currículo
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='ESTE HISTÓRICO NÃO TEM VALIDADE COMO GUIA DE TRANSFERÊNCIA.';
   MTObs.Post;
  End;
{ If (cursou99) and (NULLToZero(QDadAlu['fac_codigo']) <> 1) and (NULLToZero(QDadAlu['cur_area']) <> 1)
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='A PARTIR DO 1º SEMESTRE DE 1999, TODOS OS CURSOS DE GRADUAÇÃO DA UNOESTE TÊM ESTRUTURAÇÃO SERIADA SEMESTRAL.';
   MTObs.Post;
  End;}
{ If prat_ens
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='CUMPRIU 300 HORAS/AULA DE PRAT. DE ENS. SOB FORMA DE EST. SUPERV. EM: PSICOLOGIA EDUC., FILOSOFIA EDUC., HISTÓRIA EDUC.,';
   MTObs.Post;
   MTObs.Append;
   MTObs['obs_observ']:='SOCIOLOGIA EDUC., DIDÁTICA, ESTRUT. E FUNC. DO ENS. FUND. E MÉDIO E MET. DO ENS. FUND. E MÉDIO.';
   MTObs.Post;
  End;
 If QConsAlu['cur_codigo'] = 23  // Pedagogia
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='O(A) ALUNO(A) APRESENTOU COMPROVANTE DE EXPERIÊNCIA NO MAGISTÉRIO CONFORME DETERMINAÇÃO DO ARTIGO 5º DA PORTARIA 399/89.';
   MTObs.Post;
  End;}
 If codobs = 999
 Then
  Begin
   MTObs.Append;
   MTObs['obs_codigo']:='(Ø)';
   MTObs['obs_observ']:='EQUIVALÊNCIA DE DISCIPLINA POR MUDANÇA DE GRADE CURRICULAR.';
   MTObs.Post;
  End;
 If disp3
 Then
  Begin
   If Length(Trim(QAluHabEq['ahe_observ'])) > 120
   Then
    Begin
     MTObs.Append;
     MTObs['obs_codigo']:='('+IntToStr(QAluHabEq['ahe_codobs'])+')';
     MTObs['obs_observ']:=Copy(QAluHabEq['ahe_observ'],1,120);
     MTObs.Post;
     MTObs.Append;
     MTObs['obs_observ']:=Copy(QAluHabEq['ahe_observ'],121,90);
     MTObs.Post;
    End
   Else
    Begin
     MTObs.Append;
     MTObs['obs_codigo']:='('+IntToStr(QAluHabEq['ahe_codobs'])+')';
     MTObs['obs_observ']:=QAluHabEq['ahe_observ'];
     MTObs.Post;
    End;
  End;
 If RGTipo = 1 // Histórico Escolar Completo
 Then
  Begin
   MTObs.Append;
   MTObs['obs_observ']:='HISTÓRICO ESCOLAR COMPLETO COM OU SEM REPROVAS.';
   MTObs.Post;
  End;
End;

Function Imp_Reconhecimento(qconscur,qconshab:TQuery;tipo:word): string;
var rec,nport:string;
    vdia,vmes,vano:word;
Begin
 rec:='';
 If tipo = 1 // texto de reconhecimento para atestado com reconhecimento
 Then
  Begin
   If qconscur['cur_area'] = 1 // Ensino Médio
   Then
    Begin
     If qconscur['cur_autdcp'] = 1 // autorização
     Then
      Begin
        If qconscur['cur_autdata'] <> Null
        Then rec:=', com autorização através da Portaria DER-PP de '+NULLToSpace(qconscur['cur_autndc'])+', publicada em '+DateToStr(qconscur['cur_autdata'])
        Else rec:=', com autorização através da Portaria DER-PP de '+NULLToSpace(qconscur['cur_autndc'])+', publicada em ';
      End
     Else
      If qconscur['cur_autdcp'] = 3 // autorização CONSU/UNOESTE
      Then
       Begin
         If qconscur['cur_autdata'] <> Null
         Then rec:=', com autorização através da Portaria nº'+NULLToSpace(qconscur['cur_autndc'])+' CONSU/UNOESTE, de '+DateToStr(qconscur['cur_autdata'])
         Else rec:=', com autorização através da Portaria nº'+NULLToSpace(qconscur['cur_autndc'])+' CONSU/UNOESTE, de ';
       End;
    End
   Else
    Begin
     If (qconscur['cur_nrorenov'] <> Null) and (qconscur['cur_datrenov'] <> Null) and (qconscur['cur_dtrenvport'] <> Null)
     Then
      Begin
        DecodeDate(qconscur['cur_datrenov'],vano,vmes,vdia);
        vano:=Acerta_Ano(vano);
        If Pos('/',qconscur['cur_nrorenov']) > 0
        Then nport:=Copy(qconscur['cur_nrorenov'],1,Pos('/',qconscur['cur_nrorenov']) - 1)
        Else nport:=qconscur['cur_nrorenov'];
        rec:=', com renovação do reconhecimento através da Portaria'+NULLToSpace(qconscur['cur_orgrenov'])+' n°'+nport+' de '+DateToStr(qconscur['cur_dtrenvport'])+', publicada no D.O.U. de '+DateToStr(qconscur['cur_datrenov']);
      End
     Else
      If (qconshab['hab_ligacao'] <> 0) and (qconshab['hab_ligacao'] <> Null)
      Then
       Begin
        If NULLToSpace(qconshab['hab_autdoc']) <> ''
        Then
         Begin
          DecodeDate(qconshab['hab_autdat'],vano,vmes,vdia);
          vano:=Acerta_Ano(vano);
          If Pos('/',qconshab['hab_autdoc']) > 0
          Then nport:=Copy(qconshab['hab_autdoc'],1,Pos('/',qconshab['hab_autdoc']) - 1)
          Else nport:=qconshab['hab_autdoc'];
          If qconshab['cur_codigo'] = 4   //Farmacia
          Then
           Begin
            If qconshab['hab_autdcp'] = 1
            Then rec:=', com autorização através da Portaria n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconshab['hab_autdat'])
            Else rec:=', com reconhecimento através da Portaria n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconshab['hab_autdat']);
           End
          Else
           Begin
            If qconshab['hab_autdcp'] = 1
            Then
             Begin
   //             If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
              If vano > 1982
              Then rec:=', com autorização através da Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconshab['hab_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconshab['hab_autdat'])
              Else
               If qconshab['hab_dataportaria'] <> Null
               Then rec:=', com autorização através do Decreto Lei n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+', publicado no D.O.U. de '+DateToStr(qconshab['hab_autdat'])
               Else rec:=', com autorização através do Decreto Lei n°'+nport+', publicado no D.O.U. de '+DateToStr(qconshab['hab_autdat']);
             End
            Else
             Begin
   //             If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
              If vano > 1982
              Then rec:=', com reconhecimento através da Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconshab['hab_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconshab['hab_autdat'])
              Else
               If qconshab['hab_dataportaria'] <> Null
               Then rec:=', com reconhecimento através do Decreto Lei n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+', publicado D.O.U. '+DateToStr(qconshab['hab_autdat'])
               Else rec:=', com reconhecimento através do Decreto Lei n°'+nport+', publicado D.O.U. '+DateToStr(qconshab['hab_autdat']);
             End;
           End;
         End;
   {                  renov:=Renovacao(qconscur['cur_codigo'],2);
        If renov <> '' // Existe renovação cadastrada
        Then
         Begin
          LCurso.Font.Size:=8;
          rec:=rec + ' - '+renov;
         End;}
       End
      Else
       Begin
        If NULLToSpace(qconscur['cur_autndc']) <> ''
        Then
         Begin
          DecodeDate(qconscur['cur_autdata'],vano,vmes,vdia);
          vano:=Acerta_Ano(vano);
          If Pos('/',qconscur['cur_autndc']) > 0
          Then nport:=Copy(qconscur['cur_autndc'],1,Pos('/',qconscur['cur_autndc']) - 1)
          Else nport:=qconscur['cur_autndc'];
          If qconscur['cur_codigo'] = 4  //Farmacia
          Then
           Begin
            If qconscur['cur_autdcp'] = 1
            Then rec:=', com autorização através da Portaria n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconscur['cur_autdata'])
            Else rec:=', com reconhecimento através da Portaria n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconscur['cur_autdata']);
           End
          Else
           Begin
            If qconscur['cur_autdcp'] = 3 // Autorização UNOESTE
            Then rec:=', com autorização através da Portaria n°'+qconscur['cur_autndc']+' - CONSU/UNOESTE, de '+DateToStr(qconscur['cur_autdata'])
            Else
             If qconscur['cur_autdcp'] = 1 // Autorização
             Then
              Begin
 {              If (qconscur['cur_codigo'] = 28) or (qconscur['cur_codigo'] = 133) or (qconscur['cur_codigo'] = 143) or
                  (qconscur['cur_codigo'] = 144) or (qconscur['cur_codigo'] = 145) or (qconscur['cur_codigo'] = 170)
               Then rec:=', com autorização através da Portaria n°'+qconscur['cur_autndc']+' - CONSU/UNOESTE, de '+DateToStr(qconscur['cur_autdata'])
               Else}
    //              If StrToInt(Copy(DateToStr(qconscur['cur_autdata']),7,4)) > 1982
                If vano > 1982
                Then rec:=', com autorização através da Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconscur['cur_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconscur['cur_autdata'])
                Else rec:=', com autorização através do Decreto Lei n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+', publicado no D.O.U. de '+DateToStr(qconscur['cur_autdata']);
              End
             Else
              Begin
    //             If StrToInt(Copy(DateToStr(qconscur['cur_autdata']),7,4)) > 1982
               If vano > 1982
               Then rec:=', com reconhecimento através da Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconscur['cur_dataportaria'])+', publicada no D.O.U. de '+DateToStr(qconscur['cur_autdata'])
               Else rec:=', com reconhecimento através do Decreto n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+', publicado no D.O.U. de '+DateToStr(qconscur['cur_autdata']);
              End;
    //                     Acerta_LicRec(qconscur['cur_codigo'],licenca,rec);
           End;
         End;
       End;
    End;
  End
 Else
  If tipo = 2 // texto de reconhecimento para certificado de conclusão
  Then
   Begin
    If qconscur['cur_area'] = 1 // Ensino Médio
    Then
     Begin
       If qconscur['cur_autdcp'] = 1 // autorização
       Then
        Begin
          If qconscur['cur_autdata'] <> Null
          Then rec:='Autorização: Portaria DER-PP de '+NULLToSpace(qconscur['cur_autndc'])+', publicada em '+DateToStr(qconscur['cur_autdata'])
          Else rec:='Autorização: Portaria DER-PP de '+NULLToSpace(qconscur['cur_autndc'])+', publicada em ';
        End
       Else
        If qconscur['cur_autdcp'] = 3 // Autorização UNOESTE
        Then
         If qconscur['cur_autdata'] <> Null
         Then rec:='Autorização: Portaria CONSU/UNOESTE n°'+qconscur['cur_autndc']+' de '+DateToStr(qconscur['cur_autdata'])
         Else rec:='Autorização: Portaria CONSU/UNOESTE n°'+qconscur['cur_autndc']+' de ';
     End
    Else
     Begin
      If (qconshab['hab_ligacao'] <> 0) and (qconshab['hab_ligacao'] <> Null)
      Then
       Begin
        If NULLToSpace(qconshab['hab_autdoc']) <> ''
        Then
         Begin
          DecodeDate(qconshab['hab_autdat'],vano,vmes,vdia);
          vano:=Acerta_Ano(vano);
          If Pos('/',qconshab['hab_autdoc']) > 0
          Then nport:=Copy(qconshab['hab_autdoc'],1,Pos('/',qconshab['hab_autdoc']) - 1)
          Else nport:=qconshab['hab_autdoc'];
          If qconshab['cur_codigo'] = 4   //Farmacia
          Then
           Begin
            If qconshab['hab_autdcp'] = 1
            Then rec:='Autorização: Portaria n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+' - D.O.U. de '+DateToStr(qconshab['hab_autdat'])
            Else rec:='Reconhecimento: Portaria n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+' - D.O.U. de '+DateToStr(qconshab['hab_autdat']);
           End
          Else
           Begin
            If qconshab['hab_autdcp'] = 1
            Then
             Begin
   //             If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
              If vano > 1982
              Then rec:='Autorização: Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconshab['hab_dataportaria'])+' -  D.O.U. de '+DateToStr(qconshab['hab_autdat'])
              Else
               If qconshab['hab_dataportaria'] <> Null
               Then rec:='Autorização: Decreto Lei n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+' - D.O.U. de '+DateToStr(qconshab['hab_autdat'])
               Else rec:='Autorização: Decreto Lei n°'+nport+' - D.O.U. de '+DateToStr(qconshab['hab_autdat']);
             End
            Else
             Begin
   //             If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
              If vano > 1982
              Then rec:='Reconhecimento: Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconshab['hab_dataportaria'])+' - D.O.U. de '+DateToStr(qconshab['hab_autdat'])
              Else
               If qconshab['hab_dataportaria'] <> Null
               Then rec:='Reconhecimento: Decreto Lei n°'+nport+' de '+DateToStr(qconshab['hab_dataportaria'])+' - D.O.U. de '+DateToStr(qconshab['hab_autdat'])
               Else rec:='Reconhecimento: Decreto Lei n°'+nport+' - D.O.U. de '+DateToStr(qconshab['hab_autdat']);
             End;
           End;
         End;
   {                  renov:=Renovacao(qconscur['cur_codigo'],2);
        If renov <> '' // Existe renovação cadastrada
        Then
         Begin
          LCurso.Font.Size:=8;
          rec:=rec + ' - '+renov;
         End;}
       End
      Else
       Begin
        If NULLToSpace(qconscur['cur_autndc']) <> ''
        Then
         Begin
          DecodeDate(qconscur['cur_autdata'],vano,vmes,vdia);
          vano:=Acerta_Ano(vano);
          If Pos('/',qconscur['cur_autndc']) > 0
          Then nport:=Copy(qconscur['cur_autndc'],1,Pos('/',qconscur['cur_autndc']) - 1)
          Else nport:=qconscur['cur_autndc'];
          If qconscur['cur_codigo'] = 4  //Farmacia
          Then
           Begin
            If qconscur['cur_autdcp'] = 1
            Then rec:='Autorização: Portaria n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+' - D.O.U. de '+DateToStr(qconscur['cur_autdata'])
            Else rec:='Reconhecimento: Portaria n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+' - D.O.U. de '+DateToStr(qconscur['cur_autdata']);
           End
          Else
           Begin
            If qconscur['cur_autdcp'] = 3 // Autorização UNOESTE
            Then rec:='Autorização: Portaria n°'+qconscur['cur_autndc']+' - CONSU/UNOESTE, de '+DateToStr(qconscur['cur_autdata'])
            Else
             If qconscur['cur_autdcp'] = 1 // Autorização
             Then
              Begin
  {             If (qconscur['cur_codigo'] = 28) or (qconscur['cur_codigo'] = 133) or (qconscur['cur_codigo'] = 143) or
                  (qconscur['cur_codigo'] = 144) or (qconscur['cur_codigo'] = 145) or (qconscur['cur_codigo'] = 170)
               Then rec:='Autorização: Portaria n°'+qconscur['cur_autndc']+' - CONSU/UNOESTE, de '+DateToStr(qconscur['cur_autdata'])
               Else}
    //              If StrToInt(Copy(DateToStr(qconscur['cur_autdata']),7,4)) > 1982
                If vano > 1982
                Then rec:='Autorização: Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconscur['cur_dataportaria'])+' - D.O.U. de '+DateToStr(qconscur['cur_autdata'])
                Else rec:='Autorização: Decreto Lei n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+' - D.O.U. de '+DateToStr(qconscur['cur_autdata']);
              End
             Else
              Begin
    //             If StrToInt(Copy(DateToStr(qconscur['cur_autdata']),7,4)) > 1982
               If vano > 1982
               Then rec:='Reconhecimento: Portaria'+NULLToSpace(qconscur['cur_orgao'])+' n°'+nport+NULLToSpace(qconscur['cur_artigo'])+' de '+DateToStr(qconscur['cur_dataportaria'])+' - D.O.U. de '+DateToStr(qconscur['cur_autdata'])
               Else
                If qconscur['cur_dataportaria'] <> Null
                Then rec:='Reconhecimento: Decreto n°'+nport+' de '+DateToStr(qconscur['cur_dataportaria'])+' - D.O.U. de '+DateToStr(qconscur['cur_autdata'])
                Else rec:='Reconhecimento: Decreto n°'+nport+' - D.O.U. de '+DateToStr(qconscur['cur_autdata']);
              End;
    //                     Acerta_LicRec(qconscur['cur_codigo'],licenca,rec);
           End;
         End;
       End;
     End;
   End;
 Result:=rec;
End;

function QuebraTexto(BaseString, BreakString: string; StringList: TStringList): TStringList;
var
EndOfCurrentString: word;
TempStr: string;
begin
repeat
EndOfCurrentString := Pos(BreakString, BaseString);
if EndOfCurrentString = 0 then
StringList.add(BaseString)
else
StringList.add(Copy(BaseString, 1, EndOfCurrentString - 1));
BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString), length(BaseString) - EndOfCurrentString);

until EndOfCurrentString = 0;
result := StringList;
end;

function VerifEmail(email: string): boolean;
var
  i, j, tam_email, simb_arroba, simb_arroba2, qtd_arroba, qtd_pontos,
  qtd_pontos_esq, qtd_pontos_dir, posicao, posicao2, ponto, ponto2, qtd_branco: integer;
  vet_email: array [0..49] of string; //50 posições, capacidade do Edit
  msg: string;
begin

  qtd_pontos:= 0; qtd_pontos_esq:= 0; qtd_pontos_dir:= 0; qtd_arroba:= 0; qtd_branco:= 0;
  posicao:=0; posicao2:=0; simb_arroba:=0; simb_arroba2:=0; ponto:= 0;
  ponto2:= 0; msg:='';
  Result:= True;
 
  //Verificando parte inicial do E-mail
  tam_email:= Length(email);
  for i:= 0 to tam_email-1 do
  begin
  vet_email[i]:= Copy(email,i+1,1);
  if vet_email[i] = '@' then
  begin
  Inc(qtd_arroba);
  posicao:= i;
  end;
  if vet_email[i] = ' ' then
  Inc(qtd_branco);
  end;
 
  if ((vet_email[0] = '@') or (vet_email[0] = '.') or (vet_email[0] = '-')) then
  begin
  Result:= False;
  msg:= msg1;
  end;
 
  //Verificando se tem o símbolo @ e quantos tem
  if qtd_arroba < 1 then
  begin
  Result:= False;
  msg:= msg2;
  end
  else if qtd_arroba > 1 then
  begin
  Result:= False;
  msg:= msg3 + ' Encontrado(s): '+IntToStr(qtd_arroba)+'.';
  end
  else
  //Verificando o que vem antes e depois do símbolo @
  begin
  for i:=0 to 37 do
  begin
  if vet_email[posicao-1] <> vet_valido[i] then Inc(simb_arroba)
  else Dec(simb_arroba);
  if vet_email[posicao+1] <> vet_valido[i] then Inc(simb_arroba2)
  else Dec(simb_arroba2);
  end;
  if simb_arroba = 38 then
  begin
  //Antes do arroba há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg4;
  end
  else if simb_arroba2 = 38 then
  begin
  //Depois do arroba há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg5;
  end
  end;

  //Verificando se há pontos e quantos, e Verificando parte final do e-mail
  for j:=0 to tam_email-1 do
  if vet_email[j] = '-' then
  if ((vet_email[j-1] = '.') or (vet_email[j-1] = '-')) then
  begin
  Result:= False;
  msg:= msg6;
  end;
  for i:=0 to tam_email-1 do
  if vet_email[i] = '.' then
  begin
  Inc(qtd_pontos);
  posicao2:= i+1;
  if i > posicao then Inc(qtd_pontos_dir)
  else Inc(qtd_pontos_esq);
  if ((vet_email[i-1] = '.') or (vet_email[i-1] = '-')) then
  begin
  Result:= False;
  msg:= msg6;
  end;
  end;
  if qtd_pontos < 1 then
  begin
  Result:= False;
  msg:= msg7;
  end
  else if vet_email[tam_email-1] = '.' then
  begin
  Result:= False;
  msg:= msg8;
  end
  else if vet_email[tam_email-2] = '.' then
  begin
  Result:= False;
  msg:= msg9;
  end
  else if qtd_pontos_dir > 3 then // Alterado para 3 pontos permitidos após o @
  begin
  Result:= False;
  msg:= msg10 + ' Encontrado(s): '+
  IntToStr(qtd_pontos)+#10+'Encontrado(s) a direita do @: '+
  IntToStr(qtd_pontos_dir)+'.';
  end
  else if (not ((((tam_email - posicao2) = 3) and (qtd_pontos_dir = 1)) or
  (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 3)) or
  (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 2)) or
  (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 1)))) then
  begin
  Result:= False;
  msg:= msg11 +#10+ 'Encontrado(s) a esquerda do @: '+
  IntToStr(qtd_pontos_esq) +#10+ 'Encontrado(s) a direita do @: '+
  IntToStr(qtd_pontos_dir)+'.';
  end
  else
  //Verificando o que vem antes e depois do ponto
  begin
  for i:=0 to 35 do
  begin
  if vet_email[posicao2-2] <> vet_valido[i] then Inc(ponto)
  else Dec(ponto);
  if vet_email[posicao2] <> vet_valido[i] then Inc(ponto2)
  else Dec(ponto2);
  end;
  if ponto = 36 then
  begin
  //Antes do ponto há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg12;
  end
  else if ponto2 = 36 then
  begin
  //Depois do ponto há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg13;
  end
  end;

  if qtd_branco > 0 then
  begin
  Result:= False;
  msg:= msg14;
  end;

  //Verificação final
  if not Result then
  begin
  msg:= msg +#10+ 'Formato de E-mail não aceitável!!';
  MessageDlg(msg,mtWarning,[mbRetry],0);
  end;
end;

Procedure Calcula_CHCump(QAlunos,QGrade,QCursos,QHab,QAux,QRFicha:TQuery;SPFicha:TStoredProc;var chfalta,totfal,totcarga:word;var pfalta:real;previa,ativ:boolean;vanoref,vsemref,tipativ,minutos:word);
var QAluAtiv:TQuery;
Begin
 chfalta:=0;
 totfal:=0;
 If QAlunos['hab_ligacao'] = 0 // Aluno está fazendo tronco comum
 Then
  Begin
   // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and dis_controle <> 8 and dis_controle <> 9 and');
   QGrade.Sql.Add('      dis_controle <> 10 and dis_controle <> 11 and dis_controle <> 13 and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra');
   If (QCursos['cur_codigo'] <> 18) and (QCursos['cur_codigo'] <> 22) and (QCursos['cur_codigo'] <> 23) and
      (QCursos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      and g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End
   Else
    If QCursos['cur_codigo'] = 23 // Pedagogia
    Then
     Begin
      QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
      QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
     End
    Else
     If QCursos['cur_codigo'] = 16 // Comunicação Social
     Then
      Begin
       QGrade.Sql.Add('      and (g.hab_codigo =:hab or g.hab_codigo = 2)'); // Somar Tronco Comum + Publicidade e Propaganda
       QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
   QGrade.ParambyName('codcur').AsSmallInt:=QCursos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=Trunc(NULLToZero(QGrade['totcarga']) * minutos / 60);
   // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and (dis_controle = 9 or');
   QGrade.Sql.Add('      dis_controle = 10 or dis_controle = 11) and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra');
   If (QCursos['cur_codigo'] <> 18) and (QCursos['cur_codigo'] <> 22) and (QCursos['cur_codigo'] <> 23) and
      (QCursos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      and g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End
   Else
    If QCursos['cur_codigo'] = 23 // Pedagogia
    Then
     Begin
      QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
      QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
     End
    Else
     If QCursos['cur_codigo'] = 16 // Comunicação Social
     Then
      Begin
       QGrade.Sql.Add('      and (g.hab_codigo =:hab or g.hab_codigo = 2)'); // Somar Tronco Comum + Publicidade e Propaganda
       QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
   QGrade.ParambyName('codcur').AsSmallInt:=QCursos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=totcarga + NULLToZero(QGrade['totcarga']);
   
   If (ativ) and (NULLToZero(QAlunos['obg_chativ']) <> 0) // Considerar carga horária de atividades complementares caso esteja previsto na grade do aluno
   Then
    Begin
     totcarga:=totcarga + QAlunos['obg_chativ'];
     QAluAtiv:=TQuery.Create(FProcs);
     QAluAtiv.DatabaseName:='unoeste';
     QAluAtiv.Close;
     QAluAtiv.Sql.Clear;
     QAluAtiv.Sql.Add('select sum(aat_cargahor) as totcarga');
     QAluAtiv.Sql.Add('from sca_aluatividade');
     QAluAtiv.Sql.Add('where alu_ra =:ra');
     QAluAtiv.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QAluAtiv.Open;
     If tipativ = 0 // Considerar atividades realizadas pelo aluno
     Then
      Begin
       If QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']) > 0 // Aluno ainda tem atividades complementares para cumprir
       Then chfalta:=chfalta + QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']);
      End
     Else
      If tipativ = 2 // Considerar 0% de atividades cumpridas
      Then chfalta:=chfalta + QAlunos['obg_chativ'] // Considerar que o aluno não cumpriu nada de atividade
      Else
       If tipativ = 3 // Considerar atividades cumpridas se o aluno realizou o total definido na grade
       Then
        Begin
          If QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']) > 0 // Aluno ainda tem atividades complementares para cumprir então considerar que ele não cumpriu as atividades
          Then chfalta:=chfalta + QAlunos['obg_chativ'];
        End;

     QAluAtiv.Destroy;
    End;
   If totcarga <> 0
   Then
    Begin
     SPFicha.Close;
     SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
     SPFicha.Params[1].AsSmallInt:=QAlunos['hab_codigo'];
     SPFicha.Params[2].AsString:='*';
     SPFicha.ExecProc;
     SPFicha.Close;
     If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
        (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QHab.Close;
       QHab.Sql.Clear;
       QHab.Sql.Add('select distinct hab_codigo from sca_grades');
       QHab.Sql.Add('where cur_codigo =:codcur and grl_codgra =:codgra and hab_codigo <>:hab and hab_codigo <> 23 and');
       QHab.Sql.Add('      hab_codigo <> 52 and hab_codigo <> 53 and hab_codigo <> 54 and');
       QHab.Sql.Add('      hab_codigo <> 56 and hab_codigo <> 57 and hab_codigo <> 59 and hab_codigo <> 3');
       QHab.ParambyName('codcur').AsSmallInt:=QCursos['cur_codigo'];
       QHab.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
       QHab.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
       QHab.Open;
       While not QHab.Eof do
       Begin
        QAux.Close;
        QAux.RequestLive:=False;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from sca_alu_hab');
        QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
        QAux.ParamByName('ra').AsFloat:=QAlunos['alu_ra'];
        QAux.ParamByName('hab').AsSmallInt:=QHab['hab_codigo'];
        QAux.Open;
        If not QAux.Eof // Aluno está matriculado na habilitação
        Then
         Begin
          SPFicha.Close;
          SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
          SPFicha.Params[1].AsSmallInt:=QHab['hab_codigo'];
          SPFicha.Params[2].AsString:='*';
          SPFicha.ExecProc;
          SPFicha.Close;
         End
        Else
         Begin
          // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
          QAux.Close;
          QAux.RequestLive:=False;
          QAux.Sql.Clear;
          QAux.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
          QAux.Sql.Add('from sca_grades g, sca_disciplinas d');
          QAux.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and dis_controle <> 8 and dis_controle <> 9 and');
          QAux.Sql.Add('      dis_controle <> 10 and dis_controle <> 11 and dis_controle <> 13 and');
          QAux.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra and g.hab_codigo =:hab');
          QAux.ParambyName('codcur').AsSmallInt:=QCursos['cur_codigo'];
          QAux.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
          QAux.ParamByName('hab').AsSmallInt:=QHab['hab_codigo'];
          QAux.Open;
          chfalta:=chfalta + Trunc(NULLToZero(QAux['totcarga']) * minutos / 60);
          // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
          QAux.Close;
          QAux.RequestLive:=False;
          QAux.Sql.Clear;
          QAux.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
          QAux.Sql.Add('from sca_grades g, sca_disciplinas d');
          QAux.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and (dis_controle = 9 or dis_controle = 10 or');
          QAux.Sql.Add('      dis_controle = 11) and');
          QAux.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra and g.hab_codigo =:hab');
          QAux.ParambyName('codcur').AsSmallInt:=QCursos['cur_codigo'];
          QAux.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
          QAux.ParamByName('hab').AsSmallInt:=QHab['hab_codigo'];
          QAux.Open;
          chfalta:=chfalta + NULLToZero(QAux['totcarga']);
         End;
        QHab.Next;
       End;
      End;
     // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
     // Serão consideradas como carga horária devida todas as disciplinas que o aluno está devendo, inclusive as disciplinas que ele está matriculado mesmo sem fazer parte da grade
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
     If previa
     Then
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
       QRFicha.Sql.Add('      d.dis_controle <> 11 and d.dis_controle <> 13 and alu_ra =:ra and his_sitfin <> "A" and his_sitfin <> "N"'); // considerar como aprovado as disciplinas que o aluno está cursando
      End 
     Else
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
       QRFicha.Sql.Add('      d.dis_controle <> 11 and d.dis_controle <> 13 and alu_ra =:ra and his_sitfin <> "A"');
      End;
     If (QCursos['cur_codigo'] <> 18) and (QCursos['cur_codigo'] <> 22) and (QCursos['cur_codigo'] <> 23) and
        (QCursos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QRFicha.Sql.Add('      and r.hab_codigo =:hab');
       QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.Open;
     totfal:=Trunc(NULLToZero(QRFicha['totfal']) * minutos / 60);
     // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
     If previa
     Then
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
       QRFicha.Sql.Add('      and alu_ra =:ra and his_sitfin <> "A" and his_sitfin <> "N"'); // considerar como aprovado as disciplinas que o aluno está cursando
      End 
     Else
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
       QRFicha.Sql.Add('      and alu_ra =:ra and his_sitfin <> "A"');
      End;
     If (QCursos['cur_codigo'] <> 18) and (QCursos['cur_codigo'] <> 22) and (QCursos['cur_codigo'] <> 23) and
        (QCursos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QRFicha.Sql.Add('      and r.hab_codigo =:hab');
       QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.Open;
     totfal:=totfal + NULLToZero(QRFicha['totfal']);
     pfalta:=(totfal+chfalta)*100/totcarga;
     If (vanoref <> 0) and (vsemref <> 0) // Somar carga horária cumprida do aluno até o período letivo passado como parâmetro
     Then
      Begin
       // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
       QRFicha.Close;
       QRFicha.Sql.Clear;
       QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
       If previa
       Then
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
         QRFicha.Sql.Add('      d.dis_controle <> 11 and d.dis_controle <> 13 and alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
        End
       Else
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
         QRFicha.Sql.Add('      d.dis_controle <> 13 and alu_ra =:ra and his_sitfin = "A"');
        End;
       If vsemref = 2
       Then QRFicha.Sql.Add('and his_anoref >:anoref')
       Else QRFicha.Sql.Add('and (his_anoref >:anoref or (his_anoref =:anoref and his_semref = 2))');
       QRFicha.ParamByName('anoref').AsSmallInt:=vanoref;
       If (QCursos['cur_codigo'] <> 18) and (QCursos['cur_codigo'] <> 22) and (QCursos['cur_codigo'] <> 23) and
          (QCursos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
       Then
        Begin
         QRFicha.Sql.Add('      and r.hab_codigo =:hab');
         QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
        End;
       QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
       QRFicha.Open;
       totfal:=totfal + Trunc(NULLToZero(QRFicha['totfal']) * minutos / 60);
       // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
       QRFicha.Close;
       QRFicha.Sql.Clear;
       QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
       If previa
       Then
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
         QRFicha.Sql.Add('      and alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
        End
       Else
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
         QRFicha.Sql.Add('      and alu_ra =:ra and his_sitfin = "A"');
        End;
       If vsemref = 2
       Then QRFicha.Sql.Add('and his_anoref >:anoref')
       Else QRFicha.Sql.Add('and (his_anoref >:anoref or (his_anoref =:anoref and his_semref = 2))');
       QRFicha.ParamByName('anoref').AsSmallInt:=vanoref;
       If (QCursos['cur_codigo'] <> 18) and (QCursos['cur_codigo'] <> 22) and (QCursos['cur_codigo'] <> 23) and
          (QCursos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
       Then
        Begin
         QRFicha.Sql.Add('      and r.hab_codigo =:hab');
         QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
        End;
       QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
       QRFicha.Open;
       totfal:=totfal + NULLToZero(QRFicha['totfal']);
       pfalta:=(totfal+chfalta)*100/totcarga;
      End;
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Delete from sca_rficha');
     QRFicha.Sql.Add('where alu_ra =:ra');
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.ExecSql;
    End;
  End
 Else
  Begin
   // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and dis_controle <> 8 and dis_controle <> 9 and');
   QGrade.Sql.Add('      dis_controle <> 10 and dis_controle <> 11 and dis_controle <> 13 and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra and');
   If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
      (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      (g.hab_codigo =:hab1 or g.hab_codigo =:hab2)');
     If QCursos['cur_codigo'] = 23 // Pedagogia
     Then
      Begin
       QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
       QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
      End;
     QGrade.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
     QGrade.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
    End
   Else
    Begin
     QGrade.Sql.Add('      g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End;
   QGrade.ParambyName('codcur').AsSmallInt:=QCursos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=Trunc(NULLToZero(QGrade['totcarga']) * minutos / 60);
   // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and (dis_controle = 9 or');
   QGrade.Sql.Add('      dis_controle = 10 or dis_controle = 11) and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra and');
   If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
      (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      (g.hab_codigo =:hab1 or g.hab_codigo =:hab2)');
     If QCursos['cur_codigo'] = 23 // Pedagogia
     Then
      Begin
       QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
       QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
      End;
     QGrade.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
     QGrade.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
    End
   Else
    Begin
     QGrade.Sql.Add('      g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End;
   QGrade.ParambyName('codcur').AsSmallInt:=QCursos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=totcarga + NULLToZero(QGrade['totcarga']);

   If (ativ) and (NULLToZero(QAlunos['obg_chativ']) <> 0) // Considerar carga horária de atividades complementares caso esteja previsto na grade do aluno
   Then
    Begin
     totcarga:=totcarga + QAlunos['obg_chativ'];
     QAluAtiv:=TQuery.Create(FProcs);
     QAluAtiv.DatabaseName:='unoeste';
     QAluAtiv.Close;
     QAluAtiv.Sql.Clear;
     QAluAtiv.Sql.Add('select sum(aat_cargahor) as totcarga');
     QAluAtiv.Sql.Add('from sca_aluatividade');
     QAluAtiv.Sql.Add('where alu_ra =:ra');
     QAluAtiv.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QAluAtiv.Open;
     If tipativ = 0 // Considerar atividades realizadas pelo aluno
     Then
      Begin
       If QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']) > 0 // Aluno ainda tem atividades complementares para cumprir
       Then chfalta:=chfalta + QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']);
      End
     Else
      If tipativ = 2 // Considerar 0% de atividades cumpridas
      Then chfalta:=chfalta + QAlunos['obg_chativ'] // Considerar que o aluno não cumpriu nada de atividade
      Else
       If tipativ = 3 // Considerar atividades cumpridas se o aluno realizou o total definido na grade
       Then
        Begin
          If QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']) > 0 // Aluno ainda tem atividades complementares para cumprir então considerar que ele não cumpriu as atividades
          Then chfalta:=chfalta + QAlunos['obg_chativ'];
        End;

     QAluAtiv.Destroy;
    End;
   If totcarga <> 0
   Then
    Begin
     SPFicha.Close;
     SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
     SPFicha.Params[1].AsSmallInt:=QAlunos['hab_codigo'];
     SPFicha.Params[2].AsString:='*';
     SPFicha.ExecProc;
     SPFicha.Close;
     If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
        (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
       SPFicha.Params[1].AsSmallInt:=QAlunos['hab_ligacao'];
       SPFicha.Params[2].AsString:='*';
       SPFicha.ExecProc;
       SPFicha.Close;
      End;
     // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
     If previa
     Then
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
       QRFicha.Sql.Add('      d.dis_controle <> 11 and d.dis_controle <> 13 and alu_ra =:ra and his_sitfin <> "A" and his_sitfin <> "N"'); // considerar como aprovado as disciplinas que o aluno está cursando
      End
     Else
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
       QRFicha.Sql.Add('      d.dis_controle <> 11 and d.dis_controle <> 13 and alu_ra =:ra and his_sitfin <> "A"');
      End;
     If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
        (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QRFicha.Sql.Add('      and (r.hab_codigo =:hab1 or r.hab_codigo =:hab2)');
       QRFicha.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
       QRFicha.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
      End
     Else
      Begin
       QRFicha.Sql.Add('      and r.hab_codigo =:hab');
       QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.Open;
     totfal:=Trunc(NULLToZero(QRFicha['totfal']) * minutos / 60);
     // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
     If previa
     Then
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
       QRFicha.Sql.Add('      and alu_ra =:ra and his_sitfin <> "A" and his_sitfin <> "N"'); // considerar como aprovado as disciplinas que o aluno está cursando
      End
     Else
      Begin
       QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
       QRFicha.Sql.Add('      and alu_ra =:ra and his_sitfin <> "A"');
      End;
     If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
        (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QRFicha.Sql.Add('      and (r.hab_codigo =:hab1 or r.hab_codigo =:hab2)');
       QRFicha.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
       QRFicha.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
      End
     Else
      Begin
       QRFicha.Sql.Add('      and r.hab_codigo =:hab');
       QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.Open;
     totfal:= totfal + NULLToZero(QRFicha['totfal']);
     pfalta:=(totfal+chfalta)*100/totcarga;
     If (vanoref <> 0) and (vsemref <> 0) // Somar carga horária cumprida do aluno até o período letivo passado como parâmetro
     Then
      Begin
       // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
       QRFicha.Close;
       QRFicha.Sql.Clear;
       QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
       If previa
       Then
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
         QRFicha.Sql.Add('      d.dis_controle <> 11 and d.dis_controle <> 13 and alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
        End
       Else
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8 and d.dis_controle <> 9 and d.dis_controle <> 10 and');
         QRFicha.Sql.Add('      d.dis_controle <> 13 and alu_ra =:ra and his_sitfin = "A"');
        End;
       If vsemref = 2
       Then QRFicha.Sql.Add('and his_anoref >:anoref')
       Else QRFicha.Sql.Add('and (his_anoref >:anoref or (his_anoref =:anoref and his_semref = 2))');
       QRFicha.ParamByName('anoref').AsSmallInt:=vanoref;
       If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
          (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
       Then
        Begin
         QRFicha.Sql.Add('      and (r.hab_codigo =:hab1 or r.hab_codigo =:hab2)');
         QRFicha.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
         QRFicha.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
        End
       Else
        Begin
         QRFicha.Sql.Add('      and r.hab_codigo =:hab');
         QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
        End;
       QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
       QRFicha.Open;
       totfal:=totfal + Trunc(NULLToZero(QRFicha['totfal']) * minutos / 60);
       // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
       QRFicha.Close;
       QRFicha.Sql.Clear;
       QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
       If previa
       Then
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
         QRFicha.Sql.Add('      and alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
        End
       Else
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and (d.dis_controle = 9 or d.dis_controle = 10 or d.dis_controle = 11)');
         QRFicha.Sql.Add('      and alu_ra =:ra and his_sitfin = "A"');
        End;
       If vsemref = 2
       Then QRFicha.Sql.Add('and his_anoref >:anoref')
       Else QRFicha.Sql.Add('and (his_anoref >:anoref or (his_anoref =:anoref and his_semref = 2))');
       QRFicha.ParamByName('anoref').AsSmallInt:=vanoref;
       If (QCursos['cur_codigo'] = 18) or (QCursos['cur_codigo'] = 22) or (QCursos['cur_codigo'] = 23) or
          (QCursos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
       Then
        Begin
         QRFicha.Sql.Add('      and (r.hab_codigo =:hab1 or r.hab_codigo =:hab2)');
         QRFicha.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
         QRFicha.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
        End
       Else
        Begin
         QRFicha.Sql.Add('      and r.hab_codigo =:hab');
         QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
        End;
       QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
       QRFicha.Open;
       totfal:= totfal + NULLToZero(QRFicha['totfal']);
       pfalta:=(totfal+chfalta)*100/totcarga;
      End;
     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Delete from sca_rficha');
     QRFicha.Sql.Add('where alu_ra =:ra');
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.ExecSql;
    End;
  End;
  If totfal+chfalta > totcarga
  Then
   Begin
     totfal:=totfal - (totfal+chfalta - totcarga);
     pfalta:=100;
   End;
End;

Function Calcula_Tempo(QProfPonto:TQuery):Integer;
var eprev, sprev: string;
    ep, sp: integer;
Begin
 eprev:= DateTimeToStr(QProfPonto['pfp_iniprev']);
 sprev:= DateTimeToStr(QProfPonto['pfp_fimprev']);

 if length(eprev) = 10
    then eprev:= eprev + ' 23:59:00';
 if length(sprev) = 10
    then sprev:= sprev + ' 23:59:00';

 ep:= StrToInt(copy(eprev, 12, 2))*60 + StrToInt(copy(eprev, 15, 2));

 sp:= StrToInt(copy(sprev, 12, 2))*60 + StrToInt(copy(sprev, 15, 2));
 Result:= (ep - sp);
End;

function meutrunc(val : real) : integer;
var valor, resp : string;
    i : integer;
begin
   resp := '';
   valor := FloatToStr(val);
   for i := 1 to length(valor) do
    if (valor[i] <> '.') and (valor[i] <> ',')
     then resp := resp + valor[i]
     else exit;
   result := StrToInt(Resp);
end;

Function Divide_Obs(parte:word;Obs:string):string;
Begin
 If parte = 1 // 1ª parte da observação
 Then Result:=Copy(Obs,1,120)
 Else Result:=Copy(Obs,121,120);
End;

Function Valida_Creditos(qconsdis,QDiscTur,QDiscCont:TQuery):Boolean;
var ok:boolean;
    QGrade, QHorario:TQuery;
Begin
 ok:=true;
 If (QDiscTur['dst_perlet'] > 2004) and (QDiscTur['dst_periodo'] = 'S') and
    (qconsdis['dis_controle'] <> 9) and (qconsdis['dis_controle'] <> 11) and // Período Específico
    (qconsdis['cur_grapos'] <> 8) // Ensino Médio
 Then
  Begin
   QGrade:=TQuery.Create(FProcs);
   QGrade.DatabaseName:='unoeste';
   QGrade.Close;
   QGrade.RequestLive:=False;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select * from sca_grades');
   QGrade.Sql.Add('where dis_codigo =:coddis and grl_codgra =:codgra');
   QGrade.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QDiscTur['dst_codgra'];
   QGrade.Open;
   QHorario:=TQuery.Create(FProcs);
   QHorario.DatabaseName:='unoeste';
   QHorario.Close;
   QHorario.RequestLive:=False;
   QHorario.Sql.Clear;
   QHorario.Sql.Add('select sum(hor_nroaula1) totaulas from sca_horario');
   QHorario.Sql.Add('where dst_codtur =:codtur and dst_perlet =:perlet and dst_semref =:semref and');
   QHorario.Sql.Add('dis_codigo =:coddis and lab_turma =:labtur');
   QHorario.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
   QHorario.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
   QHorario.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
   QHorario.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
   QHorario.ParamByName('labtur').AsSmallInt:=QDiscCont['lab_turma'];
   QHorario.Open;
   If (QDiscCont['lab_turma'] = 0) and (NULLToZero(QHorario['totaulas']) <> QGrade['gra_chteor'])
   Then ok:=False
   Else
    If (QDiscCont['lab_turma'] <> 0) and (NULLToZero(QHorario['totaulas']) <> QGrade['gra_chprat'])
    Then ok:=False;
   QGrade.Destroy;
   QHorario.Destroy;
  End;
 Result:=ok;
End;

Procedure Valida_Creditos2(qconsdis,QDiscTur,QDiscCont:TQuery;var ok:boolean;var totaulas,totcarga:word);
var QGrade, QHorario:TQuery;
Begin
 ok:=true;
 totaulas:=0;
 totcarga:=0;
 If (QDiscTur['dst_perlet'] > 2004) and (QDiscTur['dst_periodo'] = 'S') and
    (qconsdis['dis_controle'] <> 9) and (qconsdis['dis_controle'] <> 11) and // Período Específico
    (qconsdis['cur_grapos'] <> 8) // Ensino Médio
 Then
  Begin
   QGrade:=TQuery.Create(FProcs);
   QGrade.DatabaseName:='unoeste';
   QGrade.Close;
   QGrade.RequestLive:=False;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select * from sca_grades');
   QGrade.Sql.Add('where dis_codigo =:coddis and grl_codgra =:codgra');
   QGrade.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QDiscTur['dst_codgra'];
   QGrade.Open;
   QHorario:=TQuery.Create(FProcs);
   QHorario.DatabaseName:='unoeste';
   QHorario.Close;
   QHorario.RequestLive:=False;
   QHorario.Sql.Clear;
   QHorario.Sql.Add('select sum(hor_nroaula1) totaulas from sca_horario');
   QHorario.Sql.Add('where dst_codtur =:codtur and dst_perlet =:perlet and dst_semref =:semref and');
   QHorario.Sql.Add('dis_codigo =:coddis and lab_turma =:labtur');
   QHorario.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
   QHorario.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
   QHorario.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
   QHorario.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
   QHorario.ParamByName('labtur').AsSmallInt:=QDiscCont['lab_turma'];
   QHorario.Open;
   totaulas:=NULLToZero(QHorario['totaulas']);
   If (QDiscCont['lab_turma'] = 0) and (NULLToZero(QHorario['totaulas']) < QGrade['gra_chteor'])
   Then
    Begin
      ok:=False;
      totcarga:=QGrade['gra_chteor'];
    End
   Else
    If (QDiscCont['lab_turma'] <> 0) and (NULLToZero(QHorario['totaulas']) < QGrade['gra_chprat'])
    Then
     Begin
       ok:=False;
       totcarga:=QGrade['gra_chprat'];
     End;
   QGrade.Destroy;
   QHorario.Destroy;
  End;
End;

Procedure Achou_Conflito(QDiscTur,QConsDis:TQuery;matr,coddis:Integer;perlet,semref,lab,periodo,aula,diasem:word;turma:string;var achou:boolean;var curso:string);
var Q,Q2:TQuery;
Begin
  curso:='';
  If QDiscTur['dst_remunerada'] = 0 // Turma remunerada
  Then
   Begin
     Q:=TQuery.Create(FProcs);
     Q.DatabaseName:='unoeste';
     Q.Close;
     Q.RequestLive:=False;
     Q2:=TQuery.Create(FProcs);
     Q2.DatabaseName:='unoeste';
     Q2.Close;
     Q2.RequestLive:=False;
     Q.Sql.Clear;
     Q.Sql.Add('select r.dis_codigo, dt.dst_codtur, rei_tipo, r.dst_codtur, dt.cla_turma, fac_codigo, r.lab_turma, cur_nomcur from sca_reitprof r, sca_cursos c, outer sca_disc_tur dt');
     Q.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
     Q.Sql.Add('      r.dis_codigo = dt.dis_codigo and r.cur_codigo = c.cur_codigo and');
     Q.Sql.Add('      ((r.dst_codtur = dt.cla_turma and r.rei_termo = dt.cla_serie) or');
     Q.Sql.Add('       (r.dst_codtur = dt.dst_codtur)) and');
     Q.Sql.Add('      r.dst_perlet =:perlet and r.dst_semref =:semref and r.fun_matr =:matr and');
     Q.Sql.Add('rei_periodo =:periodo and :aula between rei_aulaini and rei_aulafim and rei_diasem =:diasem and');
     Q.Sql.Add('(((rei_tipo = 1) and (r.dis_codigo <>:coddis or r.dst_codtur <>:codtur or lab_turma <>:labtur)) or ((rei_tipo = 11) and (rei_remunerada = 0)))');
    { Q.Sql.Add('select * from sca_reitprof');
     Q.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and fun_matr =:matr and');
     Q.Sql.Add('rei_periodo =:periodo and :aula between rei_aulaini and rei_aulafim and rei_diasem =:diasem and');
     Q.Sql.Add('(((rei_tipo = 1) and (dis_codigo <>:coddis or dst_codtur <>:codtur or lab_turma <>:labtur)) or ((rei_tipo = 11) and (rei_remunerada = 0)))');}
     Q.ParamByName('codtur').AsString:=turma;
     Q.ParamByName('perlet').AsSmallInt:=perlet;
     Q.ParamByName('semref').AsSmallInt:=semref;
     Q.ParamByName('coddis').AsInteger:=coddis;
     Q.ParamByName('labtur').AsSmallInt:=lab;
     Q.ParamByName('matr').AsInteger:=matr;
     Q.ParamByName('periodo').AsSmallInt:=periodo;
     Q.ParamByName('aula').AsSmallInt:=aula;
     Q.ParamByName('diasem').AsSmallInt:=diasem;
     Q.Open;
     If not Q.Eof
     Then
      Begin
       achou:=false;
       While (not achou) and (not Q.Eof) do
       Begin
        If Q['rei_tipo'] = 1
        Then
         Begin
          If (Q['fac_codigo'] <> 1) or ((Q['fac_codigo'] = 1) and ((Q['dis_codigo'] <> coddis) or (Q['dst_codtur'] <> turma) or (Q['lab_turma'] <> lab)))
          Then
           Begin
            Q2.Close;
            Q2.Sql.Clear;
            Q2.Sql.Add('select * from sca_disc_tur');
            Q2.Sql.Add('where dst_codtur =:codtur and dst_perlet =:perlet and dst_semref =:semref and');
            Q2.Sql.Add('      dis_codigo =:coddis');
            If Q['dst_codtur'] <> Null
            Then Q2.ParamByName('codtur').AsString:=Q['dst_codtur']
            Else Q2.ParamByName('codtur').AsString:=Q['dst_codtur_1'];
            Q2.ParamByName('perlet').AsSmallInt:=perlet;
            Q2.ParamByName('semref').AsSmallInt:=semref;
            Q2.ParamByName('coddis').AsInteger:=Q['dis_codigo'];
            Q2.Open;
            If Q2['dst_remunerada'] = 0 // Turma remunerada
            Then
             Begin
              If ((Q2['dst_calini']) <= (QDiscTur['dst_calfim'])) and
                 ((Q2['dst_calfim']) >= (QDiscTur['dst_calini']))
              Then
               Begin
                achou:=true;
                curso:=Q['cur_nomcur'];
               End;
             End;
           End;
         End
        Else
         Begin
          achou:=true;
          curso:=Q['cur_nomcur'];
         End;
        Q.Next;
       End;
      End
     Else achou:=false;

     If not achou // não existe conflito entre os horário semanais da graduação e ensino técnico então verificar conflito com os horários do ead
     Then
      Begin
        // Conversei com o Elias e ele concordou em validar as aulas a partir da última data que foi liberada a digitação de faltas da disciplina - 08/03/2016
        Q2.Close;
        Q2.Sql.Clear;
        Q2.Sql.Add('select max(hor_data) as datamax from sca_horario');
        Q2.Sql.Add('where dst_codtur =:codtur and dst_perlet =:perlet and dst_semref =:semref and');
        Q2.Sql.Add('dis_codigo =:coddis and lab_turma =:labtur and hor_controle <> 0');
        Q2.ParamByName('codtur').AsString:=turma;
        Q2.ParamByName('perlet').AsSmallInt:=perlet;
        Q2.ParamByName('semref').AsSmallInt:=semref;
        Q2.ParamByName('coddis').AsInteger:=coddis;
        Q2.ParamByName('labtur').AsSmallInt:=lab;
        Q2.Open;

        Q.Close;
        Q.Sql.Clear;
        Q.Sql.Add('select * from spg_horarioead');
        Q.Sql.Add('where fun_matr =:matr and weekday(hea_data) + 1 =:diasem and hea_data between :dataini and :datafim');
        Q.ParamByName('matr').AsInteger:=matr;
        Q.ParamByName('diasem').AsSmallInt:=diasem;
        If Q2['datamax'] <> Null
        Then Q.ParamByName('dataini').AsDate:=Q2['datamax']
        Else Q.ParamByName('dataini').AsDate:=QDiscTur['dst_calini'];
        Q.ParamByName('datafim').AsDate:=QDiscTur['dst_calfim'];
        Q.Open;
        If not Q.Eof
        Then
         Begin
           Q2.Close;
           Q2.Sql.Clear;
           Q2.Sql.Add('select * from sca_horaula');
           Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
           Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo');
           If QConsDis['dis_controle'] = 9 // Estágio
           Then Q2.Sql.Add('and hor_tipaula = 1')
           Else Q2.Sql.Add('and hor_tipaula = 0');
           Q2.ParamByName('perlet').AsSmallInt:=perlet;
           Q2.ParamByName('semref').AsSmallInt:=semref;
           Q2.ParamByName('codcur').AsSmallInt:=QConsDis['cur_codigo'];
           Q2.ParamByName('aula').AsSmallInt:=aula;
           Q2.ParamByName('periodo').AsSmallInt:=periodo;
           Q2.Open;

           While (not achou) and (not Q.Eof) do
           Begin
             If ((Q['hea_horaini']) <= (Q2['hor_horafim'])) and
                ((Q['hea_horafim']) >= (Q2['hor_horaini']))
             Then
              Begin
               achou:=true;
               curso:='EAD';
              End;
             Q.Next;
           End;
         End;
      End;

     Q.Destroy;
     Q2.Destroy;
   End
  Else achou:=false;
End;

Procedure Achou_Conflito2(matr,ativ:Integer;perlet,semref,periodo,aula,diasem,codcur:word;QCalDias:TQuery;var achou:boolean;var curso:string;polo:word);
var Q,Q2:TQuery;
Begin
  curso:='';
  Q:=TQuery.Create(FProcs);
  Q.DatabaseName:='unoeste';
  Q.Close;
  Q.RequestLive:=False;
  Q2:=TQuery.Create(FProcs);
  Q2.DatabaseName:='unoeste';
  Q2.Close;
  Q2.RequestLive:=False;
  Q.Sql.Clear;
  Q.Sql.Clear;
  Q.Sql.Add('select r.dis_codigo, dt.dst_codtur, rei_tipo, r.dst_codtur, dt.cla_turma, cur_nomcur from sca_reitprof r, sca_cursos c, outer sca_disc_tur dt');
  Q.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
  Q.Sql.Add('      r.dis_codigo = dt.dis_codigo and r.cur_codigo = c.cur_codigo and');
  Q.Sql.Add('      ((r.dst_codtur = dt.cla_turma and r.rei_termo = dt.cla_serie) or');
  Q.Sql.Add('       (r.dst_codtur = dt.dst_codtur)) and');
  Q.Sql.Add('      r.dst_perlet =:perlet and r.dst_semref =:semref and r.fun_matr =:matr and');
  Q.Sql.Add('rei_periodo =:periodo and :aula between rei_aulaini and rei_aulafim and rei_diasem =:diasem and');
  If polo <> 0 // curso de graduação a distância deve-se verificar conflito no polo passado como parâmetro
  Then
   Begin
     Q.Sql.Add('((rei_tipo = 1) or ((rei_tipo = 11) and (rei_remunerada = 0) and ((auc_seq <>:seq) or (r.cur_codigo <>:codcur) or (r.pol_codigo <>:polo))))');
     Q.ParamByName('polo').AsSmallInt:=polo;
   End
  Else Q.Sql.Add('((rei_tipo = 1) or ((rei_tipo = 11) and (rei_remunerada = 0) and ((auc_seq <>:seq) or (r.cur_codigo <>:codcur))))');
 { Q.Sql.Add('select * from sca_reitprof');
  Q.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and fun_matr =:matr and');
  Q.Sql.Add('rei_periodo =:periodo and :aula between rei_aulaini and rei_aulafim and rei_diasem =:diasem and');
  Q.Sql.Add('((rei_tipo = 1) or ((rei_tipo = 11) and (rei_remunerada = 0) and ((auc_seq <>:seq) or (cur_codigo <>:codcur))))');}
  Q.ParamByName('perlet').AsSmallInt:=perlet;
  Q.ParamByName('semref').AsSmallInt:=semref;
  Q.ParamByName('seq').AsInteger:=ativ;
  Q.ParamByName('matr').AsInteger:=matr;
  Q.ParamByName('periodo').AsSmallInt:=periodo;
  Q.ParamByName('aula').AsSmallInt:=aula;
  Q.ParamByName('diasem').AsSmallInt:=diasem;
  Q.ParamByName('codcur').AsSmallInt:=codcur;
  Q.Open;
  If not Q.Eof
  Then
   Begin
    achou:=false;
    While (not achou) and (not Q.Eof) do
    Begin
     If Q['rei_tipo'] = 1
     Then
      Begin
       Q2.Close;
       Q2.Sql.Clear;
       Q2.Sql.Add('select * from sca_disc_tur');
       Q2.Sql.Add('where dst_codtur =:codtur and dst_perlet =:perlet and dst_semref =:semref and');
       Q2.Sql.Add('      dis_codigo =:coddis');
       If Q['dst_codtur'] <> Null
       Then Q2.ParamByName('codtur').AsString:=Q['dst_codtur']
       Else Q2.ParamByName('codtur').AsString:=Q['dst_codtur_1'];
       Q2.ParamByName('perlet').AsSmallInt:=perlet;
       Q2.ParamByName('semref').AsSmallInt:=semref;
       Q2.ParamByName('coddis').AsInteger:=Q['dis_codigo'];
       Q2.Open;
       If Q2['dst_remunerada'] = 0 // Turma remunerada
       Then
        Begin
          achou:=true;
          curso:=Q['cur_nomcur'];
        End;
      End
     Else
      Begin
        achou:=true;
        curso:=Q['cur_nomcur'];
      End;
     Q.Next;
    End;
   End
  Else achou:=false;

  If not achou // não existe conflito entre os horário semanais da graduação e ensino técnico então verificar conflito com os horários do ead
  Then
   Begin
     Q.Close;
     Q.Sql.Clear;
     Q.Sql.Add('select * from spg_horarioead');
     Q.Sql.Add('where fun_matr =:matr and weekday(hea_data) + 1 =:diasem and hea_data between :dataini and :datafim');
     Q.ParamByName('matr').AsInteger:=matr;
     Q.ParamByName('diasem').AsSmallInt:=diasem;
     If semref = 1 // 1º semestre
     Then
      Begin
        Q.ParamByName('dataini').AsDate:=QCalDias['cld_diaini'];
        Q.ParamByName('datafim').AsDate:=QCalDias['cld_diafim'];
      End
     Else
      Begin
        Q.ParamByName('dataini').AsDate:=QCalDias['cld_inisem2'];
        Q.ParamByName('datafim').AsDate:=QCalDias['cld_fimsem2'];
      End;
     Q.Open;
     If not Q.Eof
     Then
      Begin
        Q2.Close;
        Q2.Sql.Clear;
        Q2.Sql.Add('select * from sca_horaula');
        Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
        Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo and hor_tipaula = 0');
        Q2.ParamByName('perlet').AsSmallInt:=perlet;
        Q2.ParamByName('semref').AsSmallInt:=semref;
        Q2.ParamByName('codcur').AsInteger:=codcur;
        Q2.ParamByName('aula').AsSmallInt:=aula;
        Q2.ParamByName('periodo').AsSmallInt:=periodo;
        Q2.Open;

        While (not achou) and (not Q.Eof) do
        Begin
          If ((Q['hea_horaini']) <= (Q2['hor_horafim'])) and
             ((Q['hea_horafim']) >= (Q2['hor_horaini']))
          Then
           Begin
             achou:=true;
             curso:='EAD';
           End;
          Q.Next;
        End;
      End;
   End;

  Q.Destroy;
  Q2.Destroy;
End;

Function Achou_Conflito_Data(matr,coddis:Integer;perlet,semref,lab,periodo,rem:word;turma:string;vdata,vhoraini,vhorfim:TDateTime;var curso:string): boolean;
var ok:boolean;
    Q:TQuery;
Begin
 Q:=TQuery.Create(FProcs);
 Q.DatabaseName:='unoeste';
 Q.Close;
 Q.RequestLive:=False;
 Q.Sql.Clear;
 Q.Sql.Add('select dt.dis_codigo, dt.dst_codtur, rei_tipo, rei_data, rei_horaini, rei_horfim, cur_nomcur from sca_reitprof r, sca_disc_tur dt, sca_cursos c');
 Q.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
 Q.Sql.Add('      r.dis_codigo = dt.dis_codigo and r.cur_codigo= c.cur_codigo and');
 Q.Sql.Add('      ((fac_codigo = 1 and r.dst_codtur = dt.cla_turma and r.rei_termo = dt.cla_serie) or');
 Q.Sql.Add('       (fac_codigo <> 1 and r.dst_codtur = dt.dst_codtur)) and');
 Q.Sql.Add('      dt.dst_perlet =:perlet and dt.dst_semref =:semref and r.fun_matr =:matr and');
 Q.Sql.Add('      rei_periodo =:periodo and rei_data =:vdata and dst_remunerada = 0 and');
 Q.Sql.Add('      (((rei_tipo = 2) or (rei_tipo = 3)) and (dt.dis_codigo <>:coddis or dt.dst_codtur <>:codtur or lab_turma <>:labtur))');
 Q.ParamByName('codtur').AsString:=turma;
 Q.ParamByName('perlet').AsSmallInt:=perlet;
 Q.ParamByName('semref').AsSmallInt:=semref;
 Q.ParamByName('coddis').AsInteger:=coddis;
 Q.ParamByName('labtur').AsSmallInt:=lab;
 Q.ParamByName('matr').AsInteger:=matr;
 Q.ParamByName('periodo').AsSmallInt:=periodo;
 Q.ParamByName('vdata').AsDate:=vdata;
 Q.Open;
 If (not Q.Eof) and (rem = 0)
 Then
  Begin
   ok:=false;
   While (not ok) and (not Q.Eof) do
   Begin
    If (Q['rei_horaini'] <= vhorfim) and
       (Q['rei_horfim'] >= vhoraini)
    Then
     Begin
       ok:=true;
       curso:=Q['cur_nomcur'];
     End;  
    Q.Next;
   End;
   Result:=ok;
  End
 Else
  Begin
    Q.Close;
    Q.RequestLive:=False;
    Q.Sql.Clear;
    Q.Sql.Add('select * from spg_horarioead');
    Q.Sql.Add('where fun_matr =:matr and hea_data =:vdata');
    Q.ParamByName('matr').AsInteger:=matr;
    Q.ParamByName('vdata').AsDate:=vdata;
    Q.Open;
    If (not Q.Eof)
    Then
     Begin
      ok:=false;
      While (not ok) and (not Q.Eof) do
      Begin
       If (Q['hea_horaini'] <= vhorfim) and
          (Q['hea_horafim'] >= vhoraini)
       Then
        Begin
          ok:=true;
          curso:='EAD';
        End;
       Q.Next;
      End;
      Result:=ok;
     End
    Else Result:=False;
  End;
 Q.Destroy;
End;

Function Achou_Conflito_Semanal(matr,coddis:Integer;perlet,semref,lab,periodo,rem,nivel,campus:word;turma,feriado:string;vdata,vhoraini,vhorfim:TDateTime;var curso:string): boolean;
var ok:boolean;
    Q,Q2,QFeriado:TQuery;
    diasem:word;
    vinicio,vfim:TDateTime;
Begin
 diasem:=DayOfWeek(vdata);
 Q:=TQuery.Create(FProcs);
 Q.DatabaseName:='unoeste';
 Q.Close;
 Q.RequestLive:=False;
 Q2:=TQuery.Create(FProcs);
 Q2.DatabaseName:='unoeste';
 Q2.Close;
 Q2.RequestLive:=False;
 Q.Sql.Clear;
 Q.Sql.Add('select dt.dis_codigo, dt.dst_codtur, rei_tipo, dst_calini, dst_calfim, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim, dis_controle, d.cur_codigo, dst_feriado, cam_codigo, cur_nomcur');
 Q.Sql.Add('from sca_reitprof r, sca_disc_tur dt, sca_cursos c, sca_disciplinas d');
 Q.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
 Q.Sql.Add('      r.dis_codigo = dt.dis_codigo and r.cur_codigo= c.cur_codigo and r.dis_codigo = d.dis_codigo and');
 Q.Sql.Add('      ((fac_codigo = 1 and r.dst_codtur = dt.cla_turma and r.rei_termo = dt.cla_serie) or');
 Q.Sql.Add('       (fac_codigo <> 1 and r.dst_codtur = dt.dst_codtur)) and');
 Q.Sql.Add('      dt.dst_perlet =:perlet and dt.dst_semref =:semref and r.fun_matr =:matr and');
 Q.Sql.Add('      rei_periodo =:periodo and rei_diasem =:diasem and dst_remunerada = 0 and');
 Q.Sql.Add('      ((rei_tipo = 1) and (dt.dis_codigo <>:coddis or dt.dst_codtur <>:codtur or lab_turma <>:labtur))');
 Q.ParamByName('codtur').AsString:=turma;
 Q.ParamByName('perlet').AsSmallInt:=perlet;
 Q.ParamByName('semref').AsSmallInt:=semref;
 Q.ParamByName('coddis').AsInteger:=coddis;
 Q.ParamByName('labtur').AsSmallInt:=lab;
 Q.ParamByName('matr').AsInteger:=matr;
 Q.ParamByName('periodo').AsSmallInt:=periodo;
 Q.ParamByName('diasem').AsSmallInt:=diasem;
 Q.Open;
 If (not Q.Eof) and (rem = 0)
 Then
  Begin
   ok:=true;
   If Q['dst_feriado'] = 'N' // Não considerar feriados
   Then
    Begin
     QFeriado:=TQuery.Create(FProcs);
     QFeriado.DatabaseName:='unoeste';
     QFeriado.Close;
     QFeriado.RequestLive:=False;
     QFeriado.Sql.Clear;
     If nivel = 8 // Ensino Médio
     Then QFeriado.Sql.Add('select * from sca_fer2grau where fer_data =:data')
     Else QFeriado.Sql.Add('select * from sca_feriado where fer_data =:data');
     QFeriado.Sql.Add('and (cam_codigo = 999 or cam_codigo =:cod)');
     QFeriado.ParamByName('data').AsDate:=vdata;
     QFeriado.ParamByName('cod').AsInteger:=Q['cam_codigo'];
     QFeriado.Open;
     If not QFeriado.Eof
     Then ok:=false;
     QFeriado.Destroy;
    End;
   If ok
   Then
    Begin
     ok:=false;
     While (not ok) and (not Q.Eof) do
     Begin
      Q2.Close;
      Q2.Sql.Clear;
      Q2.Sql.Add('select * from sca_horaula');
      Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
      Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo');
      If Q['dis_controle'] = 9 // Estágio
      Then Q2.Sql.Add('and hor_tipaula = 1')
      Else Q2.Sql.Add('and hor_tipaula = 0');
      Q2.ParamByName('perlet').AsSmallInt:=perlet;
      Q2.ParamByName('semref').AsSmallInt:=semref;
      Q2.ParamByName('codcur').AsSmallInt:=Q['cur_codigo'];
      Q2.ParamByName('aula').AsSmallInt:=Q['rei_aulaini'];
      Q2.ParamByName('periodo').AsSmallInt:=periodo;
      Q2.Open;
      vinicio:=Q2['hor_horaini'];

      Q2.Close;
      Q2.Sql.Clear;
      Q2.Sql.Add('select * from sca_horaula');
      Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
      Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo');
      If Q['dis_controle'] = 9 // Estágio
      Then Q2.Sql.Add('and hor_tipaula = 1')
      Else Q2.Sql.Add('and hor_tipaula = 0');
      Q2.ParamByName('perlet').AsSmallInt:=perlet;
      Q2.ParamByName('semref').AsSmallInt:=semref;
      Q2.ParamByName('codcur').AsSmallInt:=Q['cur_codigo'];
      Q2.ParamByName('aula').AsSmallInt:=Q['rei_aulafim'];
      Q2.ParamByName('periodo').AsSmallInt:=periodo;
      Q2.Open;
      vfim:=Q2['hor_horafim'];

      If (vinicio <= vhorfim) and (vfim >= vhoraini) and
         (vdata >= Q['dst_calini']) and (vdata <= Q['dst_calfim'])
      Then
       Begin
         ok:=true;
         curso:=Q['cur_nomcur'];
       End;  
      Q.Next;
     End;
     Result:=ok;
    End
   Else Result:=False;
  End
 Else Result:=False;
 Q.Destroy;
 Q2.Destroy;
End;

Function Achou_Conflito_Ativ(matr:Integer;perlet,semref,periodo,rem,nivel,campus:word;vdata,vhoraini,vhorfim:TDateTime;var curso:string): boolean;
var ok:boolean;
    Q,Q2,QFeriado:TQuery;
    diasem:word;
    vinicio,vfim:TDateTime;
Begin
 ok:=true;
 QFeriado:=TQuery.Create(FProcs);
 QFeriado.DatabaseName:='unoeste';
 QFeriado.Close;
 QFeriado.RequestLive:=False;
 QFeriado.Sql.Clear;
 If nivel = 8 // Ensino Médio
 Then QFeriado.Sql.Add('select * from sca_fer2grau where fer_data =:data')
 Else QFeriado.Sql.Add('select * from sca_feriado where fer_data =:data');
 QFeriado.Sql.Add('and (cam_codigo = 999 or cam_codigo =:cod)');
 QFeriado.ParamByName('data').AsDate:=vdata;
 QFeriado.ParamByName('cod').AsInteger:=campus;
 QFeriado.Open;
 If not QFeriado.Eof
 Then ok:=false;
 QFeriado.Destroy;
 If ok
 Then
  Begin
   diasem:=DayOfWeek(vdata);
   Q:=TQuery.Create(FProcs);
   Q.DatabaseName:='unoeste';
   Q.Close;
   Q.RequestLive:=False;
   Q2:=TQuery.Create(FProcs);
   Q2.DatabaseName:='unoeste';
   Q2.Close;
   Q2.RequestLive:=False;
   Q.Sql.Clear;
   Q.Sql.Add('select auc_seq, rei_tipo, cld_diaini, cld_diafim, cld_inisem2, cld_fimsem2, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim, r.cur_codigo, cur_nomcur');
   Q.Sql.Add('from sca_reitprof r, sca_cursos c, sca_caldias cd');
   Q.Sql.Add('where r.cur_codigo= c.cur_codigo and r.cur_codigo = cd.cur_codigo and dst_perlet = cld_periodo and');
   Q.Sql.Add('      dst_perlet =:perlet and dst_semref =:semref and r.fun_matr =:matr and');
   Q.Sql.Add('      rei_periodo =:periodo and rei_diasem =:diasem and');
   Q.Sql.Add('      rei_tipo = 11 and rei_remunerada = 0');
   Q.ParamByName('perlet').AsSmallInt:=perlet;
   Q.ParamByName('semref').AsSmallInt:=semref;
   Q.ParamByName('matr').AsInteger:=matr;
   Q.ParamByName('periodo').AsSmallInt:=periodo;
   Q.ParamByName('diasem').AsSmallInt:=diasem;
   Q.Open;
   If (not Q.Eof) and (rem = 0)
   Then
    Begin
     ok:=false;
     While (not ok) and (not Q.Eof) do
     Begin
      Q2.Close;
      Q2.Sql.Clear;
      Q2.Sql.Add('select * from sca_horaula');
      Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
      Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo');
      Q2.Sql.Add('and hor_tipaula = 0');
      Q2.ParamByName('perlet').AsSmallInt:=perlet;
      Q2.ParamByName('semref').AsSmallInt:=semref;
      Q2.ParamByName('codcur').AsSmallInt:=Q['cur_codigo'];
      Q2.ParamByName('aula').AsSmallInt:=Q['rei_aulaini'];
      Q2.ParamByName('periodo').AsSmallInt:=periodo;
      Q2.Open;
      vinicio:=Q2['hor_horaini'];

      Q2.Close;
      Q2.Sql.Clear;
      Q2.Sql.Add('select * from sca_horaula');
      Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
      Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo');
      Q2.Sql.Add('and hor_tipaula = 0');
      Q2.ParamByName('perlet').AsSmallInt:=perlet;
      Q2.ParamByName('semref').AsSmallInt:=semref;
      Q2.ParamByName('codcur').AsSmallInt:=Q['cur_codigo'];
      Q2.ParamByName('aula').AsSmallInt:=Q['rei_aulafim'];
      Q2.ParamByName('periodo').AsSmallInt:=periodo;
      Q2.Open;
      vfim:=Q2['hor_horafim'];

      If (vinicio <= vhorfim) and (vfim >= vhoraini) and
         (((vdata >= Q['cld_diaini']) and (vdata <= Q['cld_diafim']) and (semref = 1)) or
          ((vdata >= Q['cld_inisem2']) and (vdata <= Q['cld_fimsem2']) and (semref = 2)))
      Then
       Begin
         ok:=true;
         curso:=Q['cur_nomcur'];
       End;  

      Q.Next;
     End;
     Result:=ok;
    End
   Else Result:=False;
   Q.Destroy;
   Q2.Destroy;
  End;
End;

Function Achou_Conflito_EAD(matr:Integer;vdata,vhoraini,vhorfim:TDateTime;tipoaula:word):boolean;
var ok:boolean;
    Q:TQuery;
Begin
 Q:=TQuery.Create(FProcs);
 Q.DatabaseName:='unoeste';
 Q.Close;
 Q.RequestLive:=False;
 Q.Sql.Clear;
 Q.Sql.Add('select * from spg_horarioead');
 Q.Sql.Add('where fun_matr =:matr and hea_data =:vdata and hea_tipoaula <> :tipo');
 Q.ParamByName('matr').AsInteger:=matr;
 Q.ParamByName('vdata').AsDate:=vdata;
 Q.ParamByName('tipo').AsSmallInt:=tipoaula;
 Q.Open;
 If (not Q.Eof)
 Then
  Begin
   ok:=false;
   While (not ok) and (not Q.Eof) do
   Begin
    If (Q['hea_horaini'] <= vhorfim) and
       (Q['hea_horafim'] >= vhoraini)
    Then ok:=true;
    Q.Next;
   End;
   Result:=ok;
  End
 Else Result:=False;
 Q.Destroy;
End;

//Function Conflito_Salas(QDiscTur:TQuery;MT:TMemoryTable;sala:Integer;lab,diasem:word): boolean;
Procedure Conflito_Salas(QDiscTur:TQuery;MT:TMemoryTable;sala:Integer;lab,diasem:word;var achou:boolean;var curso:string);
var Q,Q2:TQuery;
    aula,periodo:word;
    diasem2:string;
Begin
 If (QDiscTur['dst_remunerada'] = 0) and (QDiscTur['dst_depend'] = 0) // Turma remunerada e não dependência
 Then
  Begin
   Q:=TQuery.Create(FProcs);
   Q.DatabaseName:='unoeste';
   Q.Close;
   Q.RequestLive:=False;
   Q2:=TQuery.Create(FProcs);
   Q2.DatabaseName:='unoeste';
   Q2.Close;
   Q2.RequestLive:=False;
   MT.DisableControls;
   MT.First;
   achou:=false;
   curso:='';
   While (not MT.Eof) and (not achou) do
   Begin
    diasem2:='';
    Case diasem of
      2:If Trim(NullToSpace(MT['seg'])) <> ''
        Then diasem2:='SEGUNDA';
      3:If Trim(NullToSpace(MT['ter'])) <> ''
        Then diasem2:='TERCA';
      4:If Trim(NullToSpace(MT['qua'])) <> ''
        Then diasem2:='QUARTA';
      5:If Trim(NullToSpace(MT['qui'])) <> ''
        Then diasem2:='QUINTA';
      6:If Trim(NullToSpace(MT['sex'])) <> ''
        Then diasem2:='SEXTA';
      7:If Trim(NullToSpace(MT['sab'])) <> ''
        Then diasem2:='SABADO';
      1:If Trim(NullToSpace(MT['dom'])) <> ''
        Then diasem2:='DOMINGO';
    End;
    If diasem2 <> ''
    Then
     Begin
      Q.Close;
      Q.Sql.Clear;
      Q.Sql.Add('select dt.dis_codigo, dt.dst_codtur, lab_turma, fac_codigo, cur_nomcur from sca_calendario ca, sca_cursos c, sca_disc_tur dt, sca_disciplinas d');
      Q.Sql.Add('where ca.dst_perlet = dt.dst_perlet and ca.dst_semref = dt.dst_semref and');
      Q.Sql.Add('      ca.dis_codigo = dt.dis_codigo and ca.dst_codtur = dt.dst_codtur and');
      Q.Sql.Add('      ca.dis_codigo = d.dis_codigo and d.cur_codigo = c.cur_codigo and');
      Q.Sql.Add('      ca.dst_perlet =:perlet and ca.dst_semref =:semref and ccu_seq =:sala and');
      Q.Sql.Add('cal_periodo =:periodo and :aula between cal_aula and cal_aulafim and cal_diasem =:diasem and');
      Q.Sql.Add('(ca.dis_codigo <>:coddis or ca.dst_codtur <>:codtur or lab_turma <>:labtur)');
      Q.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
      Q.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
      Q.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
      Q.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
      Q.ParamByName('labtur').AsSmallInt:=lab;
      Q.ParamByName('periodo').AsSmallInt:=MT['periodo'];
      Q.ParamByName('aula').AsSmallInt:=MT['aula'];
      Q.ParamByName('diasem').AsString:=diasem2;
      Q.ParamByName('sala').AsInteger:=sala;
      Q.Open;
      If not Q.Eof
      Then
       Begin
        While (not achou) and (not Q.Eof) do
        Begin
//         If (Q['fac_codigo'] <> 1) or ((Q['fac_codigo'] = 1) and ((Q['dis_codigo'] <> coddis) or (Q['dst_codtur'] <> turma) or (Q['lab_turma'] <> lab)))
//         Then
//          Begin
           Q2.Close;
           Q2.Sql.Clear;
           Q2.Sql.Add('select * from sca_disc_tur');
           Q2.Sql.Add('where dst_codtur =:codtur and dst_perlet =:perlet and dst_semref =:semref and');
           Q2.Sql.Add('      dis_codigo =:coddis');
           Q2.ParamByName('codtur').AsString:=Q['dst_codtur'];
           Q2.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
           Q2.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
           Q2.ParamByName('coddis').AsInteger:=Q['dis_codigo'];
           Q2.Open;
           If (Q2['dst_remunerada'] = 0) and (Q2['dst_depend'] = 0) // Turma remunerada e não dependência
           Then
            Begin
             If ((Q2['dst_calini']) <= (QDiscTur['dst_calfim'])) and
                ((Q2['dst_calfim']) >= (QDiscTur['dst_calini']))
             Then
              Begin
               achou:=true;
               curso:=Q['cur_nomcur'];
              End;
            End;
//          End;
         Q.Next;
        End;
       End;
     End;
    MT.Next;
   End;
   MT.EnableControls;
   Q.Destroy;
   Q2.Destroy;
  End
 Else achou:=False;
End;

Function Equivalente_Horas(tipo,codcur,codhab,codgra,vanoing:word;totcarga,totcarga2,ra:real):String;
var resto:real;
    QObsGrade, QCHAtiv:TQuery;
Begin
 resto:=frac(totcarga);
 If resto = 0
 Then
  Begin
{   If codcur = 112 // Tecnologia em Desenvolvimento Web
   Then
    Begin
     If tipo = 1
     Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))+' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas'
     Else Result:=' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas';
    End
   Else
    Begin}
     If (tipo = 1) or (tipo = 3)
     Then
      Begin
       QObsGrade:=TQuery.Create(FProcs);
       QObsGrade.DatabaseName:='unoeste';
       QObsGrade.Close;
       QObsGrade.Sql.Clear;
       QObsGrade.Sql.Add('select * from sca_obsgrade');
       QObsGrade.Sql.Add('where cur_codigo =:codcur and hab_codigo =:codhab and grl_codgra =:codgra and obg_tipo = 1');
       QObsGrade.ParamByName('codcur').AsSmallInt:=codcur;
       QObsGrade.ParamByName('codhab').AsSmallInt:=codhab;
       QObsGrade.ParamByName('codgra').AsSmallInt:=codgra;
       QObsGrade.Open;
       If not QObsGrade.Eof
       Then
        Begin
         QCHAtiv:=TQuery.Create(FProcs);
         QCHAtiv.DatabaseName:='unoeste';
         QCHAtiv.Close;
         QCHAtiv.Sql.Clear;
         QCHAtiv.Sql.Add('select sum(aat_cargahor) as totcarga');
         QCHAtiv.Sql.Add('from sca_aluatividade');
         QCHAtiv.Sql.Add('where alu_ra =:ra');
         QCHAtiv.ParambyName('ra').AsFloat:=ra;
         QCHAtiv.Open;
         If NULLToZero(QCHAtiv['totcarga']) < QObsGrade['obg_chativ']
         Then
          Begin
           If tipo = 1
//           Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))+' aulas'
           Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))
           Else Result:=IntToStr(trunc(totcarga));
          End
         Else
          If tipo = 1
//          Then Result:='Carga Horária Cumprida para Integralização : '+IntToStr(trunc(totcarga+QObsGrade['obg_chativ']))+' aulas - inclusas Atividades Complementares'
// A Nair pediu para alterar - 29/03/2016
          Then
           Begin
             If Deve_Atividade_Obrigatoria(vanoing,codcur,ra)
             Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))
             Else Result:='Carga Horária Cumprida : '+IntToStr(trunc(totcarga+QObsGrade['obg_chativ']))+' - inclusas Atividades Complementares';
           End
          Else Result:=IntToStr(trunc(totcarga+QObsGrade['obg_chativ']));
         QCHAtiv.Destroy;
        End
       Else
        If tipo = 1
//        Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))+' aulas'
        Then Result:='Total da Carga Horária Cumprida : '+IntToStr(trunc(totcarga))
        Else Result:=IntToStr(trunc(totcarga));
       QObsGrade.Destroy;
      End
     Else Result:='';
//    End;
  End
 Else
{  If codcur = 112 // Tecnologia em Desenvolvimento Web
  Then
   Begin
    If tipo = 1
    Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)+' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas'
    Else Result:=' aulas equivalentes a '+IntToStr(trunc(totcarga2))+' horas';
   End
  Else
   Begin}
    If (tipo = 1) or (tipo = 3)
    Then
     Begin
      QObsGrade:=TQuery.Create(FProcs);
      QObsGrade.DatabaseName:='unoeste';
      QObsGrade.Close;
      QObsGrade.Sql.Clear;
      QObsGrade.Sql.Add('select * from sca_obsgrade');
      QObsGrade.Sql.Add('where cur_codigo =:codcur and hab_codigo =:codhab and grl_codgra =:codgra and obg_tipo = 1');
      QObsGrade.ParamByName('codcur').AsSmallInt:=codcur;
      QObsGrade.ParamByName('codhab').AsSmallInt:=codhab;
      QObsGrade.ParamByName('codgra').AsSmallInt:=codgra;
      QObsGrade.Open;
      If not QObsGrade.Eof
      Then
       Begin
        QCHAtiv:=TQuery.Create(FProcs);
        QCHAtiv.DatabaseName:='unoeste';
        QCHAtiv.Close;
        QCHAtiv.Sql.Clear;
        QCHAtiv.Sql.Add('select sum(aat_cargahor) as totcarga');
        QCHAtiv.Sql.Add('from sca_aluatividade');
        QCHAtiv.Sql.Add('where alu_ra =:ra');
        QCHAtiv.ParambyName('ra').AsFloat:=ra;
        QCHAtiv.Open;
        If NULLToZero(QCHAtiv['totcarga']) < QObsGrade['obg_chativ']
        Then
         Begin
          If tipo = 1
//          Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)+' aulas'
          Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)
          Else Result:=FormatFloat('0.0',totcarga);
         End
        Else
         If tipo = 1
//         Then Result:='Carga Horária Cumprida para Integralização : '+FormatFloat('0.0',totcarga+QObsGrade['obg_chativ'])+' aulas - inclusas Atividades Complementares'
// A Nair pediu para alterar - 29/03/2016
         Then
          Begin
            If Deve_Atividade_Obrigatoria(vanoing,codcur,ra)
            Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)
            Else Result:='Carga Horária Cumprida : '+FormatFloat('0.0',totcarga+QObsGrade['obg_chativ'])+' - inclusas Atividades Complementares';
          End
         Else Result:=FormatFloat('0.0',totcarga+QObsGrade['obg_chativ']);
        QCHAtiv.Destroy;
       End
      Else
       If tipo = 1
//       Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)+' aulas'
       Then Result:='Total da Carga Horária Cumprida : '+FormatFloat('0.0',totcarga)
       Else Result:=FormatFloat('0.0',totcarga);
      QObsGrade.Destroy;
     End
    Else Result:='';
//   End;
End;

Function Educacao_Fisica(controle,area,codcur:word):Boolean;
Begin
 If controle = 8 // Educação Física
 Then Educacao_Fisica:=True
 Else Educacao_Fisica:=False;
{ Else
  If ((controle = 9) or (controle = 11)) and (area = 6) and (codcur = 112) // Estágio Supervisionado ou Trabalho de Conclusão do Curso e Curso de Tecnologia em Desenvolvimento Web
  Then Educacao_Fisica:=True
  Else Educacao_Fisica:=False;}
End;

Function Calcula_HorasEquiv(QEquival,QDadAlu,QRFicha:TQuery):real;
Begin
 If NULLToZero(QEquival['equ_cghora']) <> 0
 Then
  Begin
   If QDadAlu['cur_area'] = 6
   Then Result:=HoraRelogio(QRFicha['his_anoref'],QRFicha['his_semref'],QDadAlu['cur_codigo'],QDadAlu['alu_periodo'],NULLToZero(QEquival['equ_cghora']))
   Else Result:=QEquival['equ_cghora'];
  End
 Else
  If NULLToZero2(QEquival['equ_cghreal']) <> 0
  Then
   Begin
    If QDadAlu['cur_area'] = 6
    Then Result:=HoraRelogio(QRFicha['his_anoref'],QRFicha['his_semref'],QDadAlu['cur_codigo'],QDadAlu['alu_periodo'],QEquival['equ_cghreal'])
    Else Result:=QEquival['equ_cghreal'];
   End
  Else Result:=0;  
End;

Function Calcula_HorasEquiv2(QAdiciona,QDadAlu,QRFicha:TQuery):real;
var perlet,semref:word;
Begin
 perlet:=9999;
 semref:=1;
 If QAdiciona['adi_perlet'] <> Null
 Then
  If Length(IntToStr(QAdiciona['adi_perlet'])) = 4
  Then perlet:=QAdiciona['adi_perlet']
  Else
   Begin
    perlet:=StrToInt(Copy(IntToStr(QAdiciona['adi_perlet']),2,4));
    semref:=StrToInt(Copy(IntToStr(QAdiciona['adi_perlet']),1,1));
   End;
 If NULLToZero(QAdiciona['adi_cghora']) <> 0
 Then
  Begin
   If QDadAlu['cur_area'] = 6
   Then Result:=HoraRelogio(perlet,semref,QDadAlu['cur_codigo'],QDadAlu['alu_periodo'],NULLToZero(QAdiciona['adi_cghora']))
   Else Result:=QAdiciona['adi_cghora'];
  End
 Else
  If NULLToZero2(QAdiciona['adi_chreal']) <> 0
  Then
   Begin
    If QDadAlu['cur_area'] = 6
    Then Result:=HoraRelogio(perlet,semref,QDadAlu['cur_codigo'],QDadAlu['alu_periodo'],QAdiciona['adi_chreal'])
    Else Result:=QAdiciona['adi_chreal'];
   End
  Else Result:=0;
End;

Function HoraRelogio(perlet,semref,codcur,periodo:word;ch:real) : integer;
var QHorTec:TQuery;
Begin
 QHorTec:=TQuery.Create(FProcs);
 QHorTec.DatabaseName:='unoeste';
 QHorTec.Close;
 QHorTec.Sql.Clear;
 QHorTec.Sql.Add('select * from sca_hortecnol');
 QHorTec.Sql.Add('where htc_ano =:ano and htc_semestre =:sem and htc_periodo =:periodo and');
 QHorTec.Sql.Add('      cur_codigo =:codcur');
 QHorTec.ParamByName('ano').AsSmallInt:=perlet;
 QHorTec.ParamByName('sem').AsSmallInt:=semref;
 QHorTec.ParamByName('codcur').AsSmallInt:=codcur;
 QHorTec.ParamByName('periodo').AsSmallInt:=periodo;
 QHorTec.Open;
 If not QHorTec.Eof
 Then Result:=trunc(ch*QHorTec['htc_minutos']/60)
 Else Result:=0;
{  Begin
   QHorTec.Close;
   QHortec.Sql.Clear;
   QHortec.Sql.Add('select * from sca_hortecnol');
   QHortec.Sql.Add('where htc_periodo =:periodo and cur_codigo =:codcur');
   QHortec.Sql.Add('order by htc_ano, htc_semestre');
   QHorTec.ParamByName('codcur').AsSmallInt:=codcur;
   QHorTec.ParamByName('periodo').AsSmallInt:=periodo;
   QHorTec.Open;
   If not QHorTec.Eof
   Then Result:=trunc(ch*QHorTec['htc_minutos']/60)
   Else Result:=0;
  End;}
 QHorTec.Destroy;
End;

function RoundCorrect(R: Real): LongInt;
begin
  Result:= Trunc(R);       // extract the integer part
  if Frac(R) >= 0.5 then   // if fractional part >= 0.5 then...
    Result:= Result + 1;   // ...add 1
end;

{function Arred(Value: Currency; Prec: Word): Double;
begin
   if (Prec>0) then
   begin
      Value:=Value*Power(10,Prec);
      Value:=RoundCorrect(Value);
      Value:=Value/Power(10,Prec);
   end;
   Arred:=Value;
end;}

function Arred(Value: Currency; Prec: Word): Currency;
begin
   Result:=Value;
   if (Prec>0) then
   begin
      Result:=Value*Power(10,Prec);
      Result:=LongInt(Round(Result));
      Result:=Result/Power(10,Prec);
   end;
end;

{function Arred(Value: Currency; Prec: Word): Currency;
begin
   Result:=Value;
   if (Prec>0) then
   begin
      Result:=Value*Power(10,Prec);
      Result:=Int(Round(Result));
      Result:=Result/Power(10,Prec);
   end;
end;}

function NULLToSpace(Value: Variant): String;
begin
   if (VarType(Value)<>VarNULL) then
      NULLToSpace:=Value
   else
      NullToSpace:='';
end;

function NULLToZero(Value: Variant): integer;
begin
   if (VarType(Value)<>VarNULL) then
      NULLToZero:=Value
   else
      NullToZero:=0;
end;

function NULLToZero2(Value: Variant): real;
begin
   if (VarType(Value)<>VarNULL) then
      NULLToZero2:=Value
   else
      NullToZero2:=0;
end;

function NULLToInt(Value: Variant): integer;
begin
   if (VarType(Value)<>VarNULL) then
      NULLToInt:=Value
   else
      NullToInt:=0;
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

Function StrZero(num:real;tam:integer):String;
var numaux: real;
Begin
 numaux:=num+power(10,tam);
 StrZero:=Copy(FloatToStr(numaux),2,tam);
End;

Function Retorna_Unidade(codcur : Integer; ra : Real; caixa : integer): integer;
var QCurso:TQuery;
Begin
 QCurso:=TQuery.Create(FProcs);
 QCurso.DatabaseName:='unoeste';
 If codcur <> 0 Then
 Begin
   QCurso.Close;
   QCurso.Sql.Clear;
   QCurso.Sql.Add('select cam_codigo from sca_cursos');
   QCurso.Sql.Add('where cur_codigo =:codcur');
   QCurso.ParamByName('codcur').value:=codcur;
   QCurso.Open;
   If QCurso['CAM_Codigo'] <> Null Then
      Retorna_Unidade:=QCurso['Cam_Codigo']
   Else
      Retorna_Unidade:=1;
 End
 Else
 Begin
   If caixa <> 0 Then
   Begin
     QCurso.Close;
     QCurso.Sql.Clear;
     QCurso.Sql.Add('select cam_codigo from fin_caixa');
     QCurso.Sql.Add('where cxs_ncaixa =:cxs');
     QCurso.ParamByName('cxs').value:=caixa;
     QCurso.Open;
     If QCurso['CAM_Codigo'] <> Null Then
        Retorna_Unidade:=QCurso['Cam_Codigo']
     Else
        Retorna_Unidade:=1;
   End
   Else
   Begin
     QCurso.Close;
     QCurso.Sql.Clear;
     QCurso.Sql.Add('select cam_codigo from sca_cursos c,sca_alunos a');
     QCurso.Sql.Add('where c.cur_codigo = a.cur_codigo and a.alu_ra =:ra');
     QCurso.ParamByName('ra').value:=ra;
     QCurso.Open;
     If QCurso['CAM_Codigo'] <> Null Then
        Retorna_Unidade:=QCurso['Cam_Codigo']
     Else
        Retorna_Unidade:=1;
     End;
 end;
 QCurso.Close;
 QCurso.Destroy;
End;

Function Calcula_Medias(QDiscTur,QDiscCont:TQuery):boolean;
var ok1,ok2:boolean;
Begin
 ok1:=true;
 ok2:=true;
 If QDiscCont['totprev'] > QDiscCont['totcump']
 Then ok1:=false;

 If (QDiscTur['dst_controle'] = 1) or (QDiscTur['dst_controle'] = 2) // controle por nota
 Then
  Begin
   If QDiscTur['dst_regime'] = 2 // 1º semestre
   Then
    Begin
     If (QDiscTur['dst_contr1'] = 'S') and (QDiscTur['dst_contr2'] = 'S')
     Then ok2:=true
     Else ok2:=false;
    End
   Else
    If QDiscTur['dst_regime'] = 3 // 2º semestre
    Then
     Begin
      If (QDiscTur['dst_contr3'] = 'S') and (QDiscTur['dst_contr4'] = 'S')
      Then ok2:=true
      Else ok2:=false;
     End
    Else
     If QDiscTur['dst_regime'] = 1 // Anual
     Then
       if (QDiscTur['dst_contr1'] = 'S') and (QDiscTur['dst_contr2'] = 'S') and (QDiscTur['dst_contr3'] = 'S') and (QDiscTur['dst_contr4'] = 'S')
       Then ok2:=true
       Else ok2:=false;
  End;

 If  (QDiscTur['dst_controle'] = 5) or (QDiscTur['dst_controle'] = 6) // Média Final
 Then
  If QDiscTur['dst_contr9'] = 'S'
  Then ok2:=true
  Else ok2:=false;

 If QDiscTur['dst_controle'] = 4 // Média Final e Exame
 Then
  Begin
   ok2:=false;
   If QDiscTur['dst_perlet'] < 2000
   Then
    Begin
     if (QDiscTur['dst_contr7'] = 'S') or (QDiscTur['dst_contr8'] = 'S') or (QDiscTur['dst_contr9'] = 'S')
     Then ok2:=true
    End
   Else
    If (QDiscTur['dst_contr7'] = 'S') or (QDiscTur['dst_contr9'] = 'S')
    Then ok2:=true;
  End;

 If QDiscTur['dst_controle'] = 3 // Frequência
 Then ok2:=true;

 If (ok1) and (ok2)
 Then Result:=true
 Else Result:=false;
End;

{function Calcula_DV_RA(vRA:string):word;
var
  vMult,i:word;
  vTotal:integer;
begin
  vTotal:=0;
  vMult:=11;
  for i:=1 to 10 do
  begin
    vTotal:=vTotal+StrToInt(Copy(vRA,i,1))*vMult;
    Dec(vMult);
  end;
  vTotal:=11-(vTotal Mod 11);
  if (vTotal = 11)or(vTotal = 10) then
    Calcula_DV_RA:=0
  else Calcula_DV_RA:=vTotal;
end;}

procedure Inicializa_Impressora(Papel:String);
var
  ADevice, ADriver, APort: array [0..255] of char;
  DeviceHandle: THandle;
  DevMode: PDeviceMode;
Begin
  Printer.GetPrinter(ADevice, ADriver, APort, DeviceHandle);
  If DeviceHandle = 0 Then Begin
    Printer.PrinterIndex:=Printer.PrinterIndex;
    Printer.GetPrinter(ADevice, ADriver, APort, DeviceHandle);
  End;
  If DeviceHandle = 0 then
    Raise Exception.Create('Não foi possível Inicializar a Impressora')
  Else
    DevMode:=GlobalLock(DeviceHandle);
  With DevMode^ do Begin
    dmFields := dmFields or DM_ORIENTATION;
    dmOrientation := DMORIENT_PORTRAIT;
  end;
  With DevMode^ do Begin
    dmFields := dmFields or DM_PAPERSIZE;
    If UpperCase(Papel) = 'FOLIO'
    Then dmPaperSize := DMPAPER_FOLIO; {8,5 X 13}
    If UpperCase(Papel) = 'A4'
    Then dmPaperSize := DMPAPER_A4;
    If UpperCase(Papel) = 'LETTER'
    Then dmPaperSize := DMPAPER_LETTER;
    If UpperCase(Papel) = 'LEDGER'
    Then dmPaperSize := DMPAPER_LEDGER;
    If UpperCase(Papel) = 'CSHEET'
    Then dmPaperSize := DMPAPER_CSHEET;
    If UpperCase(Papel) = 'US'
    Then dmPaperSize := DMPAPER_FANFOLD_US;
  end;
  If not DeviceHandle = 0 Then
    Globalunlock(DeviceHandle);
End;

function XPol(X: Real): Word;
begin
   XPol:=Trunc(X*GetDeviceCaps(Printer.Handle, LOGPIXELSX)-GetDeviceCaps(Printer.Handle,PHYSICALOFFSETX));
end;

function YPol(Y: Real): Word;
begin
   YPol:=Trunc(Y*GetDeviceCaps(Printer.Handle, LOGPIXELSY)-GetDeviceCaps(Printer.Handle,PHYSICALOFFSETY));
end;

Function Mascara_RA(ra:Real) : string;
var aux:string;
Begin
 aux:='';
 If Length(FloatToStr(ra)) = 12
 Then
  Begin
   aux:=Copy(FloatToStr(ra),1,5)+'.'+Copy(FloatToStr(ra),6,2)+'.'+Copy(FloatToStr(ra),8,4)+'.'+
        Copy(FloatToStr(ra),12,1);
  End
 Else
  If Length(FloatToStr(ra)) = 11
  Then
   Begin
    aux:=Copy(FloatToStr(ra),1,4)+'.'+Copy(FloatToStr(ra),5,2)+'.'+Copy(FloatToStr(ra),7,4)+'.'+
         Copy(FloatToStr(ra),11,1);
   End
  Else
   If Length(FloatToStr(ra)) = 10
   Then
    Begin // '0' quando curso passar para 4 posições
     aux:=Copy(FloatToStr(ra),1,3)+'.'+Copy(FloatToStr(ra),4,2)+'.'+Copy(FloatToStr(ra),6,4)+'.'+
          Copy(FloatToStr(ra),10,1);
    End
   Else
    If Length(FloatToStr(ra)) = 9
    Then
     Begin // '00' quando curso passar para 4 posições
      aux:='0'+Copy(FloatToStr(ra),1,2)+'.'+Copy(FloatToStr(ra),3,2)+'.'+Copy(FloatToStr(ra),5,4)+'.'+
           Copy(FloatToStr(ra),9,1);
     End
    Else
     Begin // '000' quando curso passar para 4 posições
      aux:='00'+Copy(FloatToStr(ra),1,1)+'.'+Copy(FloatToStr(ra),2,2)+'.'+Copy(FloatToStr(ra),4,4)+'.'+
           Copy(FloatToStr(ra),8,1);
     End;
 Mascara_RA:=aux;
End;

Procedure Trata_Campos(Q:TQuery);
var i:word;
Begin
  For i:=0 to Q.FieldCount - 1 do
   If (Q.Fields[i].Required) and (Q.Fields[i].AsString = '')
   Then Q.Fields[i].value:=Null;
End;

Function BAR_XEROX(XCOD:String):String;
Var BARRES,PAR:String;
    I,TAM:Integer;
    MAT:Array [1..100] of String[5];
Begin
  BARRES:='';
  MAT[01]:='nnWWn';MAT[02]:='NnwwN';MAT[03]:='nNwwN';MAT[04]:='NNwwn';MAT[05]:='nnWwN';MAT[06]:='NnWwn';MAT[07]:='nNWwn';MAT[08]:='nnwWN';MAT[09]:='NnwWn';MAT[10]:='nNwWn';
  MAT[11]:='wnNNw';MAT[12]:='WnnnW';MAT[13]:='wNnnW';MAT[14]:='WNnnw';MAT[15]:='wnNnW';MAT[16]:='WnNnw';MAT[17]:='wNNnw';MAT[18]:='wnnNW';MAT[19]:='WnnNw';MAT[20]:='wNnNw';
  MAT[21]:='nwNNw';MAT[22]:='NwnnW';MAT[23]:='nWnnW';MAT[24]:='NWnnw';MAT[25]:='nwNnW';MAT[26]:='NwNnw';MAT[27]:='nWNnw';MAT[28]:='nwnNW';MAT[29]:='NwnNw';MAT[30]:='nWnNw';
  MAT[31]:='wwNNn';MAT[32]:='WwnnN';MAT[33]:='wWnnN';MAT[34]:='WWnnn';MAT[35]:='wwNnN';MAT[36]:='WwNnn';MAT[37]:='wWNnn';MAT[38]:='wwnNN';MAT[39]:='WwnNn';MAT[40]:='wWnNn';
  MAT[41]:='nnWNw';MAT[42]:='NnwnW';MAT[43]:='nNwnW';MAT[44]:='NNwnw';MAT[45]:='nnWnW';MAT[46]:='NnWnw';MAT[47]:='nNWnw';MAT[48]:='nnwNW';MAT[49]:='NnwNw';MAT[50]:='nNwNw';
  MAT[51]:='wnWNn';MAT[52]:='WnwnN';MAT[53]:='wNwnN';MAT[54]:='WNwnn';MAT[55]:='wnWnN';MAT[56]:='WnWnn';MAT[57]:='wNWnn';MAT[58]:='wnwNN';MAT[59]:='WnwNn';MAT[60]:='wNwNn';
  MAT[61]:='nwWNn';MAT[62]:='NwwnN';MAT[63]:='nWwnN';MAT[64]:='NWwnn';MAT[65]:='nwWnN';MAT[66]:='NwWnn';MAT[67]:='nWWnn';MAT[68]:='nwwNN';MAT[69]:='NwwNn';MAT[70]:='nWwNn';
  MAT[71]:='nnNWw';MAT[72]:='NnnwW';MAT[73]:='nNnwW';MAT[74]:='NNnww';MAT[75]:='nnNwW';MAT[76]:='NnNww';MAT[77]:='nNNww';MAT[78]:='nnnWW';MAT[79]:='NnnWw';MAT[80]:='nNnWw';
  MAT[81]:='wnNWn';MAT[82]:='WnnwN';MAT[83]:='wNnwN';MAT[84]:='WNnwn';MAT[85]:='wnNwN';MAT[86]:='WnNwn';MAT[87]:='wNNwn';MAT[88]:='wnnWN';MAT[89]:='WnnWn';MAT[90]:='wNnWn';
  MAT[91]:='nwNWn';MAT[92]:='NwnwN';MAT[93]:='nWnwN';MAT[94]:='NWnwn';MAT[95]:='nwNwN';MAT[96]:='NwNwn';MAT[97]:='nWNwn';MAT[98]:='nwnWN';MAT[99]:='NwnWn';MAT[100]:='nWnWn';
  TAM:=Length(Trim(XCOD));
  I:=1;
  While I<TAM Do
    Begin
      PAR:=Copy(XCOD,I,2);
      BARRES:=BARRES+MAT[StrToInt(PAR)+1];
      I:=I+2;
    End;
  BARRES:='<'+BARRES+'>';
  BAR_XEROX:=BARRES;
End;

Function Imp_Periodo(diaini,diafim:word) : string;
var i:word;
    aux:string;
Begin
 If diaini = diafim
 Then Imp_Periodo:=IntToStr(diaini)
 Else
  If (diafim - diaini) > 5
  Then Imp_Periodo:=IntToStr(diaini)+' E '+IntToStr(diafim)
  Else Imp_Periodo:=IntToStr(diaini)+' A '+IntToStr(diafim);
{  If (diafim - diaini) < 2
  Then Imp_Periodo:=IntToStr(diaini)+' E '+IntToStr(diafim)
  Else
   Begin
    aux:='';
    For i:=diaini to (diafim - 2) do
     aux:=aux + IntToStr(i)+',';
    aux:=aux + IntToStr(diafim - 1)+' E ';
    aux:=aux + IntToStr(diafim);
    Imp_Periodo:=aux;
   End;}
End;

function Criptografa(s: String): String;
var 
  Cipher: TDCP_blockcipher; 
  DCP_blowfish: TDCP_blowfish; 
begin 
  try 
     DCP_blowfish:=TDCP_blowfish.Create(nil);
     Cipher:= TDCP_blockcipher(DCP_blowfish); 
     Cipher.InitStr('unoeste'); 
     Cipher.EncryptCFB(s[1],s[1],Length(s)); 
     Result:=B64Encode(s);
     Cipher.Reset; 
     Cipher.Burn; 
  except
     MessageDlg('Argumento de entrada inválido!', mtError, [mbOk], 0); 
     Result:=''; 
  end; 
  DCP_blowfish.Free; 
end; 

function Descriptografa(s: String): String;
var 
  Cipher: TDCP_blockcipher; 
  DCP_blowfish: TDCP_blowfish;
begin
  try
     DCP_blowfish:=TDCP_blowfish.Create(nil);
     Cipher:= TDCP_blockcipher(DCP_blowfish); 
     Cipher.InitStr('unoeste'); 
     s:=B64Decode(s); 
     Cipher.DecryptCFB(s[1],s[1],Length(s)); 
     Result:=s; 
     Cipher.Reset; 
     Cipher.Burn; 
  except 
     MessageDlg('Argumento de entrada inválido!', mtError, [mbOk], 0);
     Result:=''; 
  end; 
  DCP_blowfish.Free;
end;

Function Tira_Acentos(XTEXTO : String) : String;
Var I, XPOS         : integer;
    AUX1, AUX2, AUX : String;
Begin
  AUX1   := 'áàãâäéèêëíìîïóòõôöúùûüçñÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÑ';
  AUX2   := 'aaaaaeeeeiiiiooooouuuucnAAAAAEEEEIIIIOOOOOUUUUCN';
  XTEXTO := Trim(XTEXTO);
  AUX  := '';
  For I := 1 To Length(XTEXTO) Do
   Begin
     XPOS := Pos(XTEXTO[I],AUX1);
     If XPOS <> 0 Then
        AUX := AUX + AUX2[XPOS]
     Else
        AUX := AUX + XTEXTO[I];
   End;
//  RESULT := LowerCase(AUX);
  RESULT := AUX;
End;

Function Tira_Acentos2(XTEXTO : String) : String;
Var I, XPOS         : integer;
    AUX1, AUX2, AUX : String;
Begin
  AUX1   := 'áàãâäéèêëíìîïóòõôöúùûüçñÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÑ';
  AUX2   := 'aaaaaeeeeiiiiooooouuuucnAAAAAEEEEIIIIOOOOOUUUUCN';
  XTEXTO := Trim(XTEXTO);
  AUX  := '';
  For I := 1 To Length(XTEXTO) Do
   Begin
     XPOS := Pos(XTEXTO[I],AUX1);
     If XPOS <> 0 Then
        AUX := AUX + AUX2[XPOS]
     Else
        AUX := AUX + XTEXTO[I];
   End;
  RESULT := LowerCase(AUX);
//  RESULT := AUX;
End;

{*************************************************************************}
{*************************************************************************}
procedure GotoRecord(DataSet: TMemoryTable; RecordNo: Longint);
begin
  DataSet.RecNo := RecordNo;
end;
{*************************************************************************}
{*************************************************************************}
function Find(DataSet: TMemoryTable; FieldName: Array of String; Values: Array of Variant;
                           Exact: Boolean): Boolean;
var
  aux: Boolean;
  Pos: Longint;
  i  : Word;
begin
  with DataSet do
  begin
   aux:=False;
   try
      Pos:=RecNo;
      DisableControls;
      First;
      while (not EOF) do
      begin
         aux:=False;
         for i:=0 to High(FieldName) do
            if (FieldByName(FieldName[i]).Value<>Values[i]) then
            begin
               aux:=False;
               if ((not Exact) and (FieldByName(FieldName[i]).Value>Values[i])) then
                  aux:=True;
               break;
            end                    
            else
               aux:=True;
         if (aux=True) then
            Break;
         Next;
      end;

      if ((not Exact) and (aux=False)) then
         aux:=True;

      if (not aux) then
         UProcs.GotoRecord(DataSet, Pos);

   finally
      Result:=aux;
      EnableControls;
   end;
  end;
end;
{*************************************************************************}
{*************************************************************************}
Procedure OrderBy(DataSet: TMemoryTable; FieldNames: Array of String);
var
   MT: TMemoryTable;
begin
   try
      MT:=TMemoryTable.Create(dataset);
      MT.TableName:='aux';
      MT.CopyStructure(dataset);
      MT.Open;
      dataset.Open;
      DataSet.DisableControls;
      DataSet.First;
      while (not DataSet.EOF) do
      begin
         FindTable(MT,FieldNames,dataset,False);
         if (MT.EOF) then
            MT.Append
         else
            Insert(MT);
         AssignRecord(dataset, MT, True);
         DataSet.Next;
      end;
      DataSet.EmptyTable;
      DataSet.BatchMove(MT,batAppend,0);
      MT.Free;
   Finally
      DataSet.EnableControls;
      DataSet.First;
   end;
end;
{*************************************************************************}
{*************************************************************************}
function FindTable(DataSet: TMemoryTable; FieldName: array of string;
                   DS: TDataSet; Exact: Boolean): Boolean;
var
  aux: Boolean;
  Pos: Longint;
  i  : Word;
begin
   aux:=False;
   try
      Pos:=DataSet.RecNo;
      DataSet.DisableControls;
      DataSet.First;
      while (not DataSet.EOF) do
      begin
         aux:=False;
         for i:=0 to High(FieldName) do
            if (DataSet.FieldByName(FieldName[i]).Value<>DS.FieldByName(FieldName[i]).Value) then
            begin
               aux:=False;
               if ((not Exact) and (DataSet.FieldByName(FieldName[i]).Value>DS.FieldByName(FieldName[i]).Value)) then
                  aux:=True;
               break;
            end
            else
               aux:=True;
         if (aux=True) then
            Break;
         DataSet.Next;
      end;

      if ((not Exact) and (aux=False)) then
         aux:=True;

      if (not aux) then
         UProcs.GotoRecord(DataSet, Pos);

   finally
      FindTable:=aux;
      DataSet.EnableControls;
   end;
end;
{*************************************************************************}
{*************************************************************************}
procedure Insert(DataSet: TMemoryTable);
var
  Aux: Array[0..50] of Variant;
  i  : Word;
  Pos: Word;
begin
   try
      DataSet.DisableControls;
      Pos:=DataSet.Recno;
      DataSet.Append;
      DataSet.Post;
      DataSet.Prior;
      while(DataSet.Recno>=Pos) do
      begin
         for i:=0 to DataSet.FieldCount-1 do
            Aux[i]:=DataSet.Fields[i].Value;
         DataSet.Next;
         DataSet.Edit;
         for i:=0 to DataSet.FieldCount-1 do
            DataSet.Fields[i].Value:=Aux[i];
         DataSet.Post;
         DataSet.Prior;
         if (DataSet.Recno=1) then
            Break;
         DataSet.Prior;
      end;
      GotoRecord(DataSet, Pos);
      DataSet.Edit;
      for i:=0 to DataSet.FieldCount-1 do
         DataSet.Fields[i].Value:=NULL;
   finally
      DataSet.EnableControls;
   end;
end;

Function Trata_Texto(XTEXTO : String) : String;
Var I, XPOS:integer;
    AUX1, AUX2, AUX3, AUX, XPARTE, XRESTO:String;
Begin
  AUX1:='ÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÑ';
  AUX2:='áàãâäéèêëíìîïóòõôöúùûüçñ';
  AUX3:='';
  XTEXTO:=Trim(XTEXTO);
  I:=Pos(' ',XTEXTO);
  If I <> 0
  Then
   Begin
    XRESTO:=XTEXTO;
    While I <> 0 do
    Begin
     XPARTE:=UpperCase(Copy(XRESTO,1,I));
     If (Trim(XPARTE) = 'II') or (Trim(XPARTE) = 'III') or (Trim(XPARTE) = 'IV') or
        (Trim(XPARTE) = 'VI') or (Trim(XPARTE) = 'VII') or (Trim(XPARTE) = 'VIII') or
        (Trim(XPARTE) = 'IX') or (Trim(XPARTE) = 'TI')
     Then AUX3:=AUX3 +  XPARTE
     Else
      If (Trim(XPARTE) <> 'DA') and (Trim(XPARTE) <> 'DAS') and (Trim(XPARTE) <> 'DE') and (Trim(XPARTE) <> 'DO') and
         (Trim(XPARTE) <> 'DOS') and (Trim(XPARTE) <> 'E') and (Trim(XPARTE) <> 'COM') and (Trim(XPARTE) <> 'EM') and
         (Trim(XPARTE) <> 'POR') and (Trim(XPARTE) <> 'N°') // and (Trim(XPARTE) <> 'PARA')
      Then AUX3:=AUX3 + UpperCase(Copy(XPARTE,1,1))+LowerCase(Copy(XPARTE,2,Length(XPARTE)-1))
      Else AUX3:=AUX3 +  LowerCase(XPARTE);
     XRESTO:=Copy(XRESTO,I + 1,100);
     I:=Pos(' ',XRESTO);
    End;
    XPARTE:=UpperCase(Copy(XRESTO,1,100));
    If (Trim(XPARTE) = 'II') or (Trim(XPARTE) = 'III') or (Trim(XPARTE) = 'IV') or
       (Trim(XPARTE) = 'VI') or (Trim(XPARTE) = 'VII') or (Trim(XPARTE) = 'VIII') or
       (Trim(XPARTE) = 'IX') or (Trim(XPARTE) = 'TI')
    Then AUX3:=AUX3 +  XPARTE
    Else
     If (Trim(XPARTE) <> 'DA') and (Trim(XPARTE) <> 'DAS') and (Trim(XPARTE) <> 'DE') and (Trim(XPARTE) <> 'DO') and
        (Trim(XPARTE) <> 'DOS') and (Trim(XPARTE) <> 'E') and (Trim(XPARTE) <> 'COM') and (Trim(XPARTE) <> 'EM') and
        (Trim(XPARTE) <> 'POR') and (Trim(XPARTE) <> 'N°') // and (Trim(XPARTE) <> 'PARA')
     Then AUX3:=AUX3 + UpperCase(Copy(XPARTE,1,1))+LowerCase(Copy(XPARTE,2,Length(XPARTE)-1))
     Else AUX3:=AUX3 +  LowerCase(XPARTE);
   End
  Else AUX3:=UpperCase(Copy(XTEXTO,1,1))+LowerCase(Copy(XTEXTO,2,Length(XTEXTO)-1));
  AUX:='';
  For I:=1 to Length(AUX3) do
  Begin
   XPOS:=Pos(AUX3[I],AUX1);
   If XPOS <> 0
   Then
    Begin
     If I = 1
     Then AUX:=AUX + AUX3[I]
     Else
      If AUX3[I-1] = ' '
      Then AUX:=AUX + AUX3[I]
      Else AUX:=AUX + AUX2[XPOS];
    End
   Else
    Begin
     If (Pos(AUX3[I],',') <> 0) or (Pos(AUX3[I],'.') <> 0) or (Pos(AUX3[I],'"') <> 0) or
        (Pos(AUX3[I],'/') <> 0) or (Pos(AUX3[I],'''') <> 0) or (Pos(AUX3[I],'-') <> 0)
     Then
      If I <> Length(AUX3)
      Then AUX3[I+1]:=UpCase(AUX3[I+1]);
     AUX:=AUX + AUX3[I];
    End;
  End;
  RESULT:=AUX;
End;

Function relaluno(alu_ra:Real;anoref,hab_codigo,semest,anoref1,anoref2,his_semref:word):TMemoryTable;
var
 s_cur_codigo,s_his_nordem,s_his_presenca1,s_his_presenca2,s_his_presenca3,
 s_his_presenca4,s_his_presenca,s_his_bimrep1,s_his_bimrep2,s_sia_codigo,s_lab_turma,
 s_his_codlan,s_dst_controle,s_dst_regime,s_chminima,s_his_ctavalia1,s_his_ctavalia2,
 s_his_ctavalia3,s_his_ctavalia4,s_sitexa,s_sitex2,s_fac_codigo,s_dst_tipaul,s_cur_anofechado,
 s_cur_semfechado,s_cla_serie:word;
 s_his_nteor1,s_his_nteor2,s_his_nteor3,s_his_nteor4,s_his_nprat1,s_his_nprat2,
 s_his_nprat3,s_his_nprat4,s_his_nexa1,s_his_nexa2,s_his_medano,s_his_medfin,
 s_his_pfreq,s_his_ntrepos1,s_his_ntrepos2,s_medbi1,s_medbi2,s_medbi3,s_medbi4,
 s_decimo,s_dst_medapr:real;
 s_sitfin,s_codtur,s_nomdisc,s_contr7,s_contr8,s_contr1,s_contr2,s_contr3,s_contr4,
 s_contr9,s_cla_turma,s_situacao,s_ok,s_media1,s_media2,s_medano,s_medfin,s_exame1,
 s_exame2,s_freq,s_sitreal,s_imprime:string;
 s_dis_codigo:integer;
 s_alu_ra:Real;
 QHistorico,QAluMat,QDisc,QCurso,QDiscTur:TQuery;

//  retorna todas disciplinas,notas,médias,frequência que o aluno faz em determinado ano e semestre de acordo com sua
//  matrícula financeira no período e semestre

Begin
  Result:=TMemoryTable.Create(FProcs);
  Result.FieldDefs.Add('alu_ra',ftInteger,0,false);
  Result.FieldDefs.Add('his_nteor1',ftFloat,0,false);
  Result.FieldDefs.Add('his_nteor2',ftFloat,0,false);
  Result.FieldDefs.Add('his_nteor3',ftFloat,0,false);
  Result.FieldDefs.Add('his_nteor4',ftFloat,0,false);
  Result.FieldDefs.Add('his_nprat1',ftFloat,0,false);
  Result.FieldDefs.Add('his_nprat2',ftFloat,0,false);
  Result.FieldDefs.Add('his_nprat3',ftFloat,0,false);
  Result.FieldDefs.Add('his_nprat4',ftFloat,0,false);
  Result.FieldDefs.Add('his_presenca1',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_presenca2',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_presenca3',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_presenca4',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_presenca',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_nexa1',ftFloat,0,false);
  Result.FieldDefs.Add('his_nexa2',ftFloat,0,false);
  Result.FieldDefs.Add('his_medano',ftFloat,0,false);
  Result.FieldDefs.Add('his_medfin',ftFloat,0,false);
  Result.FieldDefs.Add('his_sitfin',ftString,1,false);
  Result.FieldDefs.Add('his_pfreq',ftFloat,0,false);
  Result.FieldDefs.Add('his_ntrepos1',ftFloat,0,false);
  Result.FieldDefs.Add('his_bimrep1',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_ntrepos2',ftFloat,0,false);
  Result.FieldDefs.Add('his_bimrep2',ftSmallInt,0,false);
  Result.FieldDefs.Add('sia_codigo',ftSmallInt,0,false);
  Result.FieldDefs.Add('medbi1',ftFloat,0,false);
  Result.FieldDefs.Add('medbi2',ftFloat,0,false);
  Result.FieldDefs.Add('medbi3',ftFloat,0,false);
  Result.FieldDefs.Add('medbi4',ftFloat,0,false);
  Result.FieldDefs.Add('dis_codigo',ftInteger,0,false);
  Result.FieldDefs.Add('codtur',ftString,2,false);
  Result.FieldDefs.Add('lab_turma',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_codlan',ftSmallInt,0,false);
  Result.FieldDefs.Add('nomdisc',ftString,50,false);
  Result.FieldDefs.Add('dst_regime',ftSmallInt,0,false);
  Result.FieldDefs.Add('dst_controle',ftSmallInt,0,false);
  Result.FieldDefs.Add('chminima',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_ctavalia1',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_ctavalia2',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_ctavalia3',ftSmallInt,0,false);
  Result.FieldDefs.Add('his_ctavalia4',ftSmallInt,0,false);
  Result.FieldDefs.Add('contr7',ftString,1,false);
  Result.FieldDefs.Add('contr8',ftString,1,false);
  Result.FieldDefs.Add('cla_turma',ftString,3,false);
  Result.FieldDefs.Add('contr1',ftString,1,false);
  Result.FieldDefs.Add('contr2',ftString,1,false);
  Result.FieldDefs.Add('contr3',ftString,1,false);
  Result.FieldDefs.Add('contr4',ftString,1,false);
  Result.FieldDefs.Add('media1',ftString,4,false);
  Result.FieldDefs.Add('media2',ftString,4,false);
  Result.FieldDefs.Add('medano',ftString,4,false);
  Result.FieldDefs.Add('medfin',ftString,4,false);
  Result.FieldDefs.Add('situacao',ftString,10,false);
  Result.FieldDefs.Add('exame1',ftString,4,false);
  Result.FieldDefs.Add('exame2',ftString,4,false);
  Result.FieldDefs.Add('sitreal',ftString,1,false);
  Result.FieldDefs.Add('imprime',ftString,1,false);
  Result.FieldDefs.Add('dst_medapr',ftFloat,0,false);
  Result.FieldDefs.Add('dst_tipaul',ftSmallInt,0,false);
  Result.FieldDefs.Add('cla_serie',ftSmallInt,0,false);
  Result.TableName:='Aluno';
  Result.Open;
  QHistorico:=TQuery.Create(FProcs);
  QHistorico.DatabaseName:='unoeste';
  QAluMat:=TQuery.Create(FProcs);
  QAluMat.DatabaseName:='unoeste';
  QDisc:=TQuery.Create(FProcs);
  QDisc.DatabaseName:='unoeste';
  QCurso:=TQuery.Create(FProcs);
  QCurso.DatabaseName:='unoeste';
  QDiscTur:=TQuery.Create(FProcs);
  QDiscTur.DatabaseName:='unoeste';

  s_alu_ra:=0;
  s_his_nordem:=0;
  s_his_nteor1:=0;
  s_his_nteor2:=0;
  s_his_nteor3:=0;
  s_his_nteor4:=0;
  s_his_nprat1:=0;
  s_his_nprat2:=0;
  s_his_nprat3:=0;
  s_his_nprat4:=0;
  s_his_presenca1:=0;
  s_his_presenca2:=0;
  s_his_presenca3:=0;
  s_his_presenca4:=0;
  s_his_presenca:=0;
  s_his_nexa1:=0;
  s_his_nexa2:=0;
  s_his_medano:=-1;
  s_his_medfin:=-1;
  s_sitfin:='';
  s_his_pfreq:=0;
  s_his_ntrepos1:=0;
  s_his_bimrep1:=0;
  s_his_ntrepos2:=0;
  s_his_bimrep2:=0;
  s_sia_codigo:=0;
  s_lab_turma:=0;
  s_his_codlan:=0;
  s_his_ctavalia1:=0;
  s_his_ctavalia2:=0;
  s_his_ctavalia3:=0;
  s_his_ctavalia4:=0;
  s_contr7:='';
  s_contr8:='';
  s_contr1:='';
  s_contr2:='';
  s_contr3:='';
  s_contr4:='';
  s_cla_turma:='';
  s_dst_medapr:=-1;
  s_exame1:='';
  s_exame2:='';
  s_media1:='';
  s_media2:='';
  s_medano:='';
  s_situacao:='';
  s_medfin:='';
  s_imprime:='N';
  s_cla_serie:=0;

 If anoref > 1998
 Then
  Begin
   QHistorico.Close;
   QHistorico.Sql.Clear;
   QHistorico.Sql.Add('select h.alu_ra,h.his_nordem,h.his_nteor1,h.his_nteor2,h.his_nteor3,h.his_nteor4,h.his_nprat1,h.his_nprat2,');
   QHistorico.Sql.Add('h.his_nprat3,h.his_nprat4,h.his_presenca1,h.his_presenca2,h.his_presenca3,h.his_presenca4,h.his_presenca,h.his_nexa1,');
   QHistorico.Sql.Add('h.his_nexa2,h.his_medano,h.his_medfin,h.his_sitfin,h.his_pfreq,h.his_ntrepos1,h.his_bimrep1,h.his_ntrepos2,h.his_bimrep2,');
   QHistorico.Sql.Add('h.dis_codigo,h.lab_turma,h.his_codtur,h.his_codlan,h.his_ctavalia1,h.his_ctavalia2,h.his_ctavalia3,h.his_ctavalia4,h.his_sitexa,h.his_sitex2');
   QHistorico.Sql.Add('from sca_historico h');
   QHistorico.Sql.Add('where (h.his_anoref =:anoref or h.his_anoref =:anoref1 or h.his_anoref =:anoref2)');
   QHistorico.Sql.Add('and h.alu_ra =:alu_ra and h.his_semref =:his_semref');
   QHistorico.Sql.Add('order by h.his_nordem');
                    // order by p.pes_nome
   QHistorico.ParamByName('anoref').AsSmallInt:=anoref;
   QHistorico.ParamByName('anoref1').AsSmallInt:=anoref1;
   QHistorico.ParamByName('anoref2').AsSmallInt:=anoref2;
   QHistorico.ParamByName('alu_ra').AsFloat:=alu_ra;
   QHistorico.ParamByName('his_semref').AsSmallInt:=his_semref;
   QHistorico.Open;
   While not QHistorico.Eof do
   Begin
    s_sitreal:=QHistorico['his_sitfin'];
    s_sitfin:=QHistorico['his_sitfin'];
    QAluMat.Close;
    QAluMat.Sql.Clear;
    QAluMat.Sql.Add('select f.sia_codigo from fin_alumat f');
    QAluMat.Sql.Add('where f.alu_ra =:alu_ra and f.amt_ano =:anoref and f.amt_semestre =:semest');
    QAluMat.ParamByName('alu_ra').AsFloat:=alu_ra;
    QAluMat.ParamByName('anoref').AsSmallInt:=anoref;
    QAluMat.ParamByName('semest').AsSmallInt:=semest;
    QAluMat.Open;
    QDisc.Close;
    QDisc.Sql.Clear;
    QDisc.Sql.Add('select d.dis_nomdisc,d.cur_codigo from sca_disciplinas d');
    QDisc.Sql.Add('where d.dis_codigo =:s_dis_codigo');
    QDisc.ParamByName('s_dis_codigo').AsInteger:=QHistorico['dis_codigo'];
    QDisc.Open;
    QCurso.Close;
    QCurso.Sql.Clear;
    QCurso.Sql.Add('select c.fac_codigo,c.cur_anofechado,c.cur_semfechado');
    QCurso.Sql.Add('from sca_cursos c where c.cur_codigo =:s_cur_codigo');
    QCurso.ParamByName('s_cur_codigo').AsSmallInt:=QDisc['cur_codigo'];
    QCurso.Open;
    QDiscTur.Close;
    QDiscTur.Sql.Clear;
    QDiscTur.Sql.Add('select dt.dst_regime,dt.dst_controle,dt.dst_chminima,dt.dst_contr7,dt.dst_contr8,dt.cla_turma,dt.dst_contr1,dt.dst_contr2,');
    QDiscTur.Sql.Add('dt.dst_contr3,dt.dst_contr4,dt.dst_medapr,dt.dst_tipaul,dt.dst_contr9,dt.cla_serie');
    QDiscTur.Sql.Add('from sca_disc_tur dt');
    QDiscTur.Sql.Add('where dt.dis_codigo =:s_dis_codigo and dt.dst_codtur =:s_codtur and');
    QDiscTur.Sql.Add('dt.dst_perlet =:anoref and dt.dst_semref =:his_semref');
    QDiscTur.ParamByName('s_dis_codigo').AsInteger:=QHistorico['dis_codigo'];
    QDiscTur.ParamByName('s_codtur').AsString:=QHistorico['his_codtur'];
    QDiscTur.ParamByName('anoref').AsSmallInt:=anoref;
    QDiscTur.ParamByName('his_semref').AsSmallInt:=his_semref;
    QDiscTur.Open;
    If QAluMat['sia_codigo'] = Null
    Then s_sia_codigo:=0
    Else s_sia_codigo:=QAluMat['sia_codigo'];

    s_decimo:=0;
    s_medbi1:=0;
    s_medbi2:=0;
    s_medbi3:=0;
    s_medbi4:=0;
    s_media1:='**,*';
    s_media2:='**,*';
    s_medano:='**,*';
    s_medfin:='**,*';
    s_exame1:='**,*';
    s_exame2:='**,*';
    s_ok:='N';

    s_medbi1:=0;
    s_decimo:=0;
    s_medbi1:=(QHistorico['his_nteor1'] + QHistorico['his_nprat1']);
    s_decimo:=(s_medbi1 - trunc(s_medbi1));
    If s_decimo < 0.30
    Then s_medbi1:=trunc(s_medbi1)
    Else
     If s_decimo < 0.80
     Then s_medbi1:=(trunc(s_medbi1) + 0.50)
     Else s_medbi1:=(trunc(s_medbi1) + 1.00);

    If (QHistorico['his_ctavalia1'] = 0) and (s_medbi1 = 0.0)
    Then s_medbi1:=-1;

    s_decimo:=0;
    s_medbi2:=0;
    s_medbi2:=(QHistorico['his_nteor2'] + QHistorico['his_nprat2']);
    s_decimo:=(s_medbi2 - trunc(s_medbi2));
    If s_decimo < 0.30
    Then s_medbi2:=trunc(s_medbi2) + 0.0
    Else
     If s_decimo < 0.80
     Then s_medbi2:=(trunc(s_medbi2) + 0.5)
     Else s_medbi2:=(trunc(s_medbi2) + 1.00);

    If (QHistorico['his_ctavalia2'] = 0) and (s_medbi2 = 0.0)
    Then s_medbi2:=-1;

    s_medbi3:=0;
    s_decimo:=0;
    s_medbi3:=(QHistorico['his_nteor3'] + QHistorico['his_nprat3']);
    s_decimo:=(s_medbi3 - trunc(s_medbi3));
    If s_decimo < 0.30
    Then s_medbi3:=trunc(s_medbi3) + 0.0
    Else
     If s_decimo < 0.80
     Then s_medbi3:=(trunc(s_medbi3) + 0.5)
     Else s_medbi3:=(trunc(s_medbi3) + 1.00);

    If (QHistorico['his_ctavalia3'] = 0) and (s_medbi3 = 0.0)
    Then s_medbi3:=-1;

    s_decimo:=0;
    s_medbi4:=0;
    s_medbi4:=(QHistorico['his_nteor4'] + QHistorico['his_nprat4']);
    s_decimo:=(s_medbi4 - trunc(s_medbi4));
    If s_decimo < 0.30
    Then s_medbi4:=trunc(s_medbi4) + 0.0
    Else
     If s_decimo < 0.80
     Then s_medbi4:=(trunc(s_medbi4) + 0.5)
     Else s_medbi4:=(trunc(s_medbi4) + 1.00);

    If (QHistorico['his_ctavalia4'] = 0) and (s_medbi4 = 0.0)
    Then s_medbi4:=-1;

    If (QDiscTur['dst_controle'] = 3) or (QDiscTur['dst_controle'] = 4) or
       (QDiscTur['dst_controle'] = 5) or (QDiscTur['dst_controle'] = 6)
    Then
     Begin
      s_media1:='**,*';
      s_media2:='**,*';
      s_medano:='**,*';
      If QDiscTur['dst_controle'] = 3
      Then
       Begin
        s_medfin:='**,*';
        s_exame1:='**,*';
        s_exame2:='**,*';
       End
      Else
       If (QDiscTur['dst_controle'] = 5) or (QDiscTur['dst_controle'] = 6)
       Then
        Begin
          s_exame1:='**,*';
          s_exame2:='**,*';
        End;
     End;

    If QDiscTur['dst_controle'] = 6
    Then s_freq:=QHistorico['his_pfreq'];

    If (QDiscTur['dst_controle'] = 5) or (QDiscTur['dst_controle'] = 6)
    Then s_his_medano:=QHistorico['his_medfin'];

    If QDiscTur['dst_contr1'] = 'S'
    Then
     Begin
      If s_medbi1 = -1
      Then
       Begin
        s_media1:='N/C';
        If QDisc['cur_codigo'] <> 11
        Then s_medbi1:=0;
       End
      Else s_media1:=FormatFloat('#0.0',s_medbi1);
     End;

    If QDiscTur['dst_contr2'] = 'S'
    Then
     Begin
      If s_medbi2 = -1
      Then
       Begin
        s_media2:='N/C';
        If QDisc['cur_codigo'] <> 11
        Then s_medbi2:=0;
       End
      Else s_media2:=FormatFloat('#0.0',s_medbi2);
     End;

    If QDiscTur['dst_contr3'] = 'S'
    Then
     Begin
      If s_medbi3 = -1
      Then
       Begin
        s_media1:='N/C';
        If QDisc['cur_codigo'] <> 11
        Then s_medbi3:=0;
       End
      Else s_media1:=FormatFloat('#0.0',s_medbi3);
     End;

    If QDiscTur['dst_contr4'] = 'S'
    Then
     Begin
      If s_medbi4 = -1
      Then
       Begin
        s_media2:='N/C';
        If QDisc['cur_codigo'] <> 11
        Then s_medbi4:=0;
       End
      Else s_media2:=FormatFloat('#0.0',s_medbi4);
     End;

    If QDiscTur['dst_contr7'] = 'S'
    Then s_exame1:=FormatFloat('#0.0',QHistorico['his_nexa1']);

    If QDiscTur['dst_contr8'] = 'S'
    Then s_exame2:=FormatFloat('#0.0',QHistorico['his_nexa2']);

    If (QCurso['fac_codigo'] <> 1) and ((QHistorico['his_sitfin'] = 'N') or (QHistorico['his_sitfin'] = 'R') or (QHistorico['his_sitfin'] = 'A'))
    Then
     Begin
      If (QDiscTur['dst_regime'] = 2) and (QDiscTur['dst_contr1'] = 'S') and (QDiscTur['dst_contr2'] = 'S')
      Then
       Begin
        s_his_medano:= round((s_medbi1 + s_medbi2) / 2);
        s_ok:='S';
       End
      Else
       If (QDiscTur['dst_regime'] = 3) and (QDiscTur['dst_contr3'] = 'S') and (QDiscTur['dst_contr4'] = 'S')
       Then
        Begin
         s_his_medano:=round((s_medbi3 + s_medbi4) / 2);
         s_ok:='S';
        End;

      If (s_his_medano < QDiscTur['dst_medapr']) and (s_ok = 'S')
      Then
       Begin
        If  QDiscTur['dst_contr7'] = 'S'
        Then
         Begin
          s_his_medfin:=round((s_his_medano + QHistorico['his_nexa1']) / 2);
          If s_his_medfin < 5.0
          Then
           Begin
            If QDiscTur['dst_contr8'] = 'S'
            Then s_his_medfin:=round((s_his_medano + QHistorico['his_nexa2']) / 2)
            Else
             Begin
              s_sitexa:=0;
              If anoref < 2000
              Then
               Begin
                s_sitex2:=2;
                s_exame2:='**,*';
               End;
             End;
           End
          Else
           Begin
            s_sitexa:=0;
            s_sitex2:=0;
            s_exame2:='**,*';
           End;
         End
        Else
         If anoref < 2000
         Then
          Begin
           s_sitexa:=2;
           s_exame1:='**,*';
          End;
       End
      Else
       If (QDiscTur['dst_controle'] = 5) or (QDiscTur['dst_controle'] = 6)
       Then
        Begin
         s_his_medfin:=QHistorico['his_medano'];
         s_exame1:='**,*';
         s_exame2:='**,*';
         s_sitexa:=0;
         s_sitex2:=0;
        End;
     End;

    If s_his_medano <> -1
    Then
     Begin
       If (s_his_medano > 0.0)
       Then s_medano:=FormatFloat('#0.0',s_his_medano)
       Else
        If (QDiscTur['dst_regime'] = 2) and (QDiscTur['dst_contr1'] = 'S') and (QDiscTur['dst_contr2'] = 'S')
        Then s_medano:=FormatFloat('#0.0',s_his_medano)
        Else
         If (QDiscTur['dst_regime'] = 3) and (QDiscTur['dst_contr3'] = 'S') and (QDiscTur['dst_contr4'] = 'S')
         Then s_medano:=FormatFloat('#0.0',s_his_medano);
     End;

    If (s_his_medfin > 0.0)
    Then s_medfin:=FormatFloat('#0.0',s_his_medfin)
    Else
     If (QDiscTur['dst_contr9'] = 'S')
     Then s_medfin:=FormatFloat('#0.0',s_his_medfin)
     Else s_medfin:='**,*';

    s_situacao:='';
    s_imprime:='N';

    If s_sitfin = 'A'
    Then
     If ((anoref * 12) + his_semref)  <= ((QCurso['cur_anofechado'] * 12) + QCurso['cur_semfechado'])
     Then
      Begin
       s_situacao:='APROVADO';
       s_imprime:='S';
      End
     Else s_situacao:='CURSANDO';

    If s_sitfin = 'R'
    Then
     If ((anoref * 12) + his_semref)  <= ((QCurso['cur_anofechado'] * 12) + QCurso['cur_semfechado'])
     Then
      Begin
       s_situacao:='REPROVADO';
       s_imprime:='S';
      End
     Else
      Begin
       s_sitfin:='N';
       s_situacao:='CURSANDO';
      End;

    If s_sitfin = 'N'
    Then
     If s_sitexa = 2
     Then s_situacao:='EXAME'
     Else
      if s_sitex2 = 2
      Then s_situacao:='2ª EPOCA'
      Else s_situacao:='CURSANDO';

    Result.append;
    Result['alu_ra']:=alu_ra;
    Result['his_nteor1']:=QHistorico['his_nteor1'];
    Result['his_nteor2']:=QHistorico['his_nteor2'];
    Result['his_nteor3']:=QHistorico['his_nteor3'];
    Result['his_nteor4']:=QHistorico['his_nteor4'];
    Result['his_nprat1']:=QHistorico['his_nprat1'];
    Result['his_nprat2']:=QHistorico['his_nprat2'];
    Result['his_nprat3']:=QHistorico['his_nprat3'];
    Result['his_nprat4']:=QHistorico['his_nprat4'];
    Result['his_presenca1']:=QHistorico['his_presenca1'];
    Result['his_presenca2']:=QHistorico['his_presenca2'];
    Result['his_presenca3']:=QHistorico['his_presenca3'];
    Result['his_presenca4']:=QHistorico['his_presenca4'];
    Result['his_presenca']:=QHistorico['his_presenca'];
    Result['his_nexa1']:=QHistorico['his_nexa1'];
    Result['his_nexa2']:=QHistorico['his_nexa2'];
    Result['his_medano']:=s_his_medano;
    Result['his_medfin']:=s_his_medfin;
    Result['his_sitfin']:=s_sitfin;
    Result['his_pfreq']:=QHistorico['his_pfreq'];
    Result['his_ntrepos1']:=QHistorico['his_ntrepos1'];
    Result['his_bimrep1']:=QHistorico['his_bimrep1'];
    Result['his_ntrepos2']:=QHistorico['his_ntrepos2'];
    Result['his_bimrep2']:=QHistorico['his_bimrep2'];
    Result['sia_codigo']:=s_sia_codigo;
    Result['medbi1']:=s_medbi1;
    Result['medbi2']:=s_medbi2;
    Result['medbi3']:=s_medbi3;
    Result['medbi4']:=s_medbi4;
    Result['dis_codigo']:=QHistorico['dis_codigo'];
    Result['codtur']:=QHistorico['his_codtur'];
    Result['lab_turma']:=QHistorico['lab_turma'];
    Result['his_codlan']:=QHistorico['his_codlan'];
    Result['nomdisc']:=QDisc['dis_nomdisc'];
    Result['dst_regime']:=QDiscTur['dst_regime'];
    Result['dst_controle']:=QDiscTur['dst_controle'];
    Result['chminima']:=QDiscTur['dst_chminima'];
    Result['his_ctavalia1']:=QHistorico['his_ctavalia1'];
    Result['his_ctavalia2']:=QHistorico['his_ctavalia2'];
    Result['his_ctavalia3']:=QHistorico['his_ctavalia3'];
    Result['his_ctavalia4']:=QHistorico['his_ctavalia4'];
    Result['contr7']:=QDiscTur['dst_contr7'];
    Result['contr8']:=QDiscTur['dst_contr8'];
    Result['cla_turma']:=QDiscTur['cla_turma'];
    Result['contr1']:=QDiscTur['dst_contr1'];
    Result['contr2']:=QDiscTur['dst_contr2'];
    Result['contr3']:=QDiscTur['dst_contr3'];
    Result['contr4']:=QDiscTur['dst_contr4'];
    Result['media1']:=s_media1;
    Result['media2']:=s_media2;
    Result['medano']:=s_medano;
    Result['medfin']:=s_medfin;
    Result['situacao']:=s_situacao;
    Result['exame1']:=s_exame1;
    Result['exame2']:=s_exame2;
    Result['sitreal']:=s_sitreal;
    Result['imprime']:=s_imprime;
    Result['dst_medapr']:=QDiscTur['dst_medapr'];
    Result['dst_tipaul']:=QDiscTur['dst_tipaul'];
    Result['cla_serie']:=QDiscTur['cla_serie'];
    Result.post;

    QHistorico.Next;
   End;
  End
 Else
  Begin
{   foreach
     select h.alu_ra,h.his_nordem,h.his_nteor1,h.his_nteor2,h.his_nteor3,h.his_nteor4,h.his_nprat1,h.his_nprat2,
               h.his_nprat3,h.his_nprat4,h.his_presenca1,h.his_presenca2,h.his_presenca3,h.his_presenca4,h.his_presenca,h.his_nexa1,
               h.his_nexa2,h.his_medano,h.his_medfin,h.his_sitfin,h.his_pfreq,h.his_ntrepos1,h.his_bimrep1,h.his_ntrepos2,h.his_bimrep2,
               h.dis_codigo,h.lab_turma,h.his_codtur,h.his_codlan,h.his_ctavalia1,h.his_ctavalia2,h.his_ctavalia3,h.his_ctavalia4
         into s_alu_ra,s_his_nordem,s_his_nteor1,s_his_nteor2,s_his_nteor3,s_his_nteor4,s_his_nprat1,s_his_nprat2,
               s_his_nprat3,s_his_nprat4,s_his_presenca1,s_his_presenca2,s_his_presenca3,s_his_presenca4,s_his_presenca,s_his_nexa1,
               s_his_nexa2,s_his_medano,s_his_medfin,s_sitfin,s_his_pfreq,s_his_ntrepos1,s_his_bimrep1,s_his_ntrepos2,s_his_bimrep2,
               s_dis_codigo,s_lab_turma,s_codtur,s_his_codlan,s_his_ctavalia1,s_his_ctavalia2,s_his_ctavalia3,s_his_ctavalia4
         from sca_historico h
         where  (h.his_anoref = anoref or h.his_anoref = anoref1 or h.his_anoref = anoref2)
            and   h.alu_ra = alu_ra
             order by h.his_nordem
                    // order by p.pes_nome

        let s_sitreal = s_sitfin;

        select f.sia_codigo into s_sia_codigo from fin_alumat f
          where f.alu_ra = s_alu_ra and f.amt_ano = anoref and f.amt_semestre = semest;

        select d.dis_nomdisc into s_nomdisc from sca_disciplinas d
          where d.dis_codigo = s_dis_codigo;

        select dt.dst_regime,dt.dst_controle,dt.dst_chminima,dt.dst_contr7,dt.dst_contr8,dt.cla_turma,dt.dst_contr1,dt.dst_contr2,
          dt.dst_contr3,dt.dst_contr4,dt.dst_tipaul,dt.cla_serie
          into s_dst_regime,s_dst_controle,s_chminima,s_contr7,s_contr8,s_cla_turma,s_contr1,s_contr2,s_contr3,
                 s_contr4,s_dst_tipaul,s_cla_serie
          from sca_disc_tur dt
          where dt.dis_codigo = s_dis_codigo and dt.dst_codtur = s_codtur and     
                     dt.dst_perlet = anoref and dt.dst_semref = his_semref;

        if s_sia_codigo is null then
          let s_sia_codigo = 0;
        end if;

        let s_medbi1 = 0;
        let s_medbi2 = 0;
        let s_medbi3 = 0;
        let s_medbi4 = 0;
        let s_decimo = 0;

        if anoref > 89 then
          let s_medbi1 = (s_his_nteor1 + s_his_nprat1);
          let s_decimo = (s_medbi1 - trunc(s_medbi1));
          if s_decimo < 0.30 then
            let s_medbi1 = trunc(s_medbi1);
          else
            if s_decimo < 0.80 then
               let s_medbi1 = (trunc(s_medbi1) + 0.50);
            else
                let s_medbi1 = (trunc(s_medbi1) + 1);
            end if;
           end if;

          let s_decimo = 0;

          let s_medbi2 = (s_his_nteor2 + s_his_nprat2);
          let s_decimo = (s_medbi2 - trunc(s_medbi2));
          if s_decimo < 0.30 then
            let s_medbi2 = trunc(s_medbi2);
          else
            if s_decimo < 0.80 then
               let s_medbi2 = (trunc(s_medbi2) + 0.50);
            else
                let s_medbi2 = (trunc(s_medbi2) + 1);
            end if;
           end if;

         let s_decimo = 0;

          let s_medbi3 = (s_his_nteor3 + s_his_nprat3);
          let s_decimo = (s_medbi3 - trunc(s_medbi3));
          if s_decimo < 0.30 then
            let s_medbi3 = trunc(s_medbi3);
          else
            if s_decimo < 0.80 then
               let s_medbi3 = (trunc(s_medbi3) + 0.50);
            else
                let s_medbi3 = (trunc(s_medbi3) + 1);
            end if;
          end if;
        
          let s_decimo = 0;

          let s_medbi4 = (s_his_nteor4 + s_his_nprat4);
          let s_decimo = (s_medbi4 - trunc(s_medbi4));
          if s_decimo < 0.30 then
            let s_medbi4 = trunc(s_medbi4);
          else
            if s_decimo < 0.80 then
               let s_medbi4 = (trunc(s_medbi4) + 0.50);
            else
                let s_medbi4 = (trunc(s_medbi4) + 1);
            end if;
          end if; 

         else
           let s_medbi1 = s_his_nteor1;
           let s_medbi2 = s_his_nteor2;
           let s_medbi3 = s_his_nteor3;
           let s_medbi4 = s_his_nteor4;
         end if;

        if s_alu_ra <> 0 then
           return s_alu_ra,s_his_nteor1,s_his_nteor2,s_his_nteor3,s_his_nteor4,s_his_nprat1,s_his_nprat2,
             s_his_nprat3,s_his_nprat4,s_his_presenca1,s_his_presenca2,s_his_presenca3,s_his_presenca4,s_his_presenca,
             s_his_nexa1,s_his_nexa2,s_his_medano,s_his_medfin,s_sitfin,s_his_pfreq,s_his_ntrepos1,s_his_bimrep1,s_his_ntrepos2,
             s_his_bimrep2,s_sia_codigo,s_medbi1,s_medbi2,s_medbi3,s_medbi4,s_dis_codigo,s_codtur,s_lab_turma,s_his_codlan,
             s_nomdisc,s_dst_regime,s_dst_controle,s_chminima,s_his_ctavalia1,s_his_ctavalia2,s_his_ctavalia3,s_his_ctavalia4,
             s_contr7,s_contr8,s_cla_turma,s_contr1,s_contr2,s_contr3,s_contr4,s_media1,s_media2,s_medano,s_medfin,s_situacao,
             s_exame1,s_exame2,s_sitreal,s_imprime,s_dst_medapr,s_dst_tipaul,s_cla_serie
             with resume;
        end if;

   end foreach;}
  End;
  QHistorico.Destroy;
  QAluMat.Destroy;
  QDisc.Destroy;
  QCurso.Destroy;
  QDiscTur.Destroy;
End;

Procedure Log_Historico(Q,QHistorico:TQuery;codusu:integer;tipo:word);
var QHistLog:TQuery;
    DataHora:TDateTime;
    SP_DataSis:TStoredProc;
Begin
 QHistLog:=TQuery.Create(FProcs);
 QHistLog.DatabaseName:='unoeste';
 QHistLog.RequestLive:=True;
 QHistLog.Close;
 QHistLog.Sql.Clear;
 QHistLog.Sql.Add('select * from sca_histlog');
 QHistLog.Sql.Add('where hsl_anoref = 0 and hsl_semref = 0 and alu_ra = 0');
 QHistLog.Open;
 QHistLog.Insert;
 QHistLog['hsl_anoref']:=QHistorico['his_anoref'];
 QHistLog['hsl_semref']:=QHistorico['his_semref'];
 QHistLog['dis_codigo']:=QHistorico['dis_codigo'];
 QHistLog['alu_ra']:=QHistorico['alu_ra'];
 QHistLog['hab_codigo']:=QHistorico['hab_codigo'];
 QHistLog['hsl_codtur']:=QHistorico['his_codtur'];
 QHistLog['lab_turma']:=QHistorico['lab_turma'];
 QHistLog['hsl_perlet']:=QHistorico['his_perlet'];
 QHistLog['hsl_regime']:=QHistorico['his_regime'];
 QHistLog['hsl_chminima']:=QHistorico['his_chminima'];
 QHistLog['hsl_codlan']:=QHistorico['his_codlan'];
 QHistLog['hsl_chcumpr']:=QHistorico['his_chcumpr'];
 QHistLog['hsl_medfin']:=QHistorico['his_medfin'];
 QHistLog['hsl_sitfin']:=QHistorico['his_sitfin'];
 QHistLog['hsl_presenca']:=QHistorico['his_presenca'];
 QHistLog['hsl_pfreq']:=QHistorico['his_pfreq'];
 QHistLog['hsl_nexa1']:=QHistorico['his_nexa1'];
 QHistLog['hsl_medano']:=QHistorico['his_medano'];
 QHistLog['fun_matr']:=codusu;
 SP_DataSis:=TStoredProc.Create(FProcs);
 SP_DataSis.DatabaseName:='unoeste';
 SP_DataSis.StoredProcName:='pega_datahora';
 SP_DataSis.Active:=True;
 DataHora:=SP_DataSis['(expression)'];
 SP_DataSis.Active:=False;
 SP_DataSis.Destroy;
 QHistLog['hsl_dtaltera']:=DataHora;
 If Q['dst_regime'] <> 3
 Then
  Begin
   QHistLog['hsl_nota1']:=QHistorico['his_nteor1']+QHistorico['his_nprat1'];
   QHistLog['hsl_nota2']:=QHistorico['his_nteor2']+QHistorico['his_nprat2'];
   QHistLog['hsl_ctavalia1']:=QHistorico['his_ctavalia1'];
   QHistLog['hsl_ctavalia2']:=QHistorico['his_ctavalia2'];
   QHistLog['hsl_presenca1']:=QHistorico['his_presenca1'];
   QHistLog['hsl_presenca2']:=QHistorico['his_presenca2'];
  End
 Else
  Begin
   QHistLog['hsl_nota1']:=QHistorico['his_nteor3']+QHistorico['his_nprat3'];
   QHistLog['hsl_nota2']:=QHistorico['his_nteor4']+QHistorico['his_nprat4'];
   QHistLog['hsl_ctavalia1']:=QHistorico['his_ctavalia3'];
   QHistLog['hsl_ctavalia2']:=QHistorico['his_ctavalia4'];
   QHistLog['hsl_presenca1']:=QHistorico['his_presenca3'];
   QHistLog['hsl_presenca2']:=QHistorico['his_presenca4'];
  End;
 QHistLog['hsl_tipo']:=tipo;
 QHistLog['hsl_coddisref']:=QHistorico['his_coddisref'];
 QHistLog['hsl_turmasref']:=QHistorico['his_turmasref'];
 QHistLog['hab_coddest']:=QHistorico['hab_coddest'];
 QHistLog['hsl_ncursado']:=QHistorico['his_ncursado'];
 QHistLog['hsl_regesp']:=QHistorico['his_regesp'];
 QHistLog['hsl_obrigatorio']:=QHistorico['his_obrigatorio'];
 QHistLog.Post;
 QHistLog.Destroy;
End;

Function Mascara_DocFal(doc:integer) : string;
var aux:string;
    tam:word;
Begin
 aux:='';
 tam:=Length(IntToStr(doc));
 aux:='0'+Copy(IntToStr(doc),1,1)+'.'+Copy(IntToStr(doc),2,tam - 1);
 Mascara_DocFal:=aux;
End;

Procedure Carrega_Atividades(totativ:word;QCHAtiv,QDadAlu,qconsccl:TQuery;var MTObs:TMemoryTable;var totcarga:real;var somou:boolean);
Begin
 somou:=false;
 If totativ <> 0
 Then
  Begin
   QCHAtiv.Close;
   QCHAtiv.ParambyName('ra').AsFloat:=QDadAlu['alu_ra'];
   QCHAtiv.Open;
   MTObs.Append;
   If QCHAtiv['totcarga'] <> Null
   Then
    Begin
     If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
     Then MTObs['obs_observ']:='ATIVIDADES ACADÊMICO-CIENTÍFICO-CULTURAIS - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = '+IntToStr(QCHAtiv['totcarga'])+' H'
     Else
      If qconsccl['grl_mascara'] = 3 // Atividades Complementares (incluindo Trabalho de Curso)
      Then MTObs['obs_observ']:='ATIVIDADES COMPLEMENTARES (INCLUINDO TRABALHO DE CURSO) - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = '+IntToStr(QCHAtiv['totcarga'])+' H'
      Else MTObs['obs_observ']:='ATIVIDADES COMPLEMENTARES - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = '+IntToStr(QCHAtiv['totcarga'])+' H';
     If (QCHAtiv['totcarga'] >= totativ) and ((QDadAlu['cur_somaativ'] = 1) or ((QDadAlu['cur_somaativ'] = 2) and
            (NULLToZero(qconsccl['ahb_anoconcl']) >= NULLToZero(QDadAlu['cur_anoativ'])))) // Aluno cumpriu toda a carga horária de atividades complementares
     Then
      Begin
//       totcarga:=totcarga + totativ;
       somou:=true;
      End;
    End
   Else
    If qconsccl['grl_mascara'] = 1 // Atividades Acadêmico-Científico-Culturais
    Then MTObs['obs_observ']:='ATIVIDADES ACADÊMICO-CIENTÍFICO-CULTURAIS - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = 0 H'
    Else
     If qconsccl['grl_mascara'] = 3 // Atividades Complementares (incluindo Trabalho de Curso)
     Then MTObs['obs_observ']:='ATIVIDADES COMPLEMENTARES (INCLUINDO TRABALHO DE CURSO) - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = 0 H'
     Else MTObs['obs_observ']:='ATIVIDADES COMPLEMENTARES - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = 0 H';
   MTObs.Post;
   If Deve_Atividade_Obrigatoria(QDadAlu['alu_anoing'],QDadAlu['cur_codigo'],QDadAlu['alu_ra'])
   Then
    Begin
      MTObs.Append;
      MTObs['obs_observ']:='ALUNO(A) ESTÁ DEVENDO ATIVIDADE OBRIGATÓRIA';
      MTObs.Post;
    End;
  End;
End;

Procedure Carrega_AtivPsi(totativ,nhab:word;QCHAtiv,QDadAlu,qconsccl:TQuery;var MTObs:TMemoryTable;var totcarga:real;var somou:boolean);
Begin
 somou:=false;
 If (totativ <> 0) and (nhab = 3)
 Then
  Begin
   QCHAtiv.Close;
   QCHAtiv.ParambyName('ra').AsFloat:=QDadAlu['alu_ra'];
   QCHAtiv.Open;
   MTObs.Append;
   If QCHAtiv['totcarga'] <> Null
   Then
    Begin
     MTObs['obs_observ']:='ATIVIDADES COMPLEMENTARES - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = '+IntToStr(QCHAtiv['totcarga'])+' H';
     If (QCHAtiv['totcarga'] >= totativ) and ((QDadAlu['cur_somaativ'] = 1) or ((QDadAlu['cur_somaativ'] = 2) and
            (NULLToZero(qconsccl['ahb_anoconcl']) >= NULLToZero(QDadAlu['cur_anoativ'])))) // Aluno cumpriu toda a carga horária de atividades complementares
     Then somou:=true;
    End
   Else MTObs['obs_observ']:='ATIVIDADES COMPLEMENTARES - CARGA HORÁRIA = '+IntToStr(totativ)+' H          REALIZADAS = 0 H';
   MTObs.Post;
  End;
End;

Function Acha_Titular(coddis:integer;codtur:string;lab,perlet,semref:integer):integer;
var QProfessor:TQuery;
Begin
 QProfessor:=TQuery.Create(FProcs);
 QProfessor.DatabaseName:='unoeste';
 If lab >= 0
 Then
  Begin
   QProfessor.Close;
   QProfessor.Sql.Clear;
   QProfessor.Sql.Add('select * from sca_prof_disc pd, sca_professor p');
   QProfessor.Sql.Add('where pd.fun_matr = p.fun_matr and pd.dst_perlet =:perlet and');
   QProfessor.Sql.Add('pd.dst_semref =:semref and pd.dis_codigo =:coddis and');
   QProfessor.Sql.Add('pd.dst_codtur =:codtur and pd.lab_turma =:lab and pd.prd_resp = 1');
   QProfessor.ParamByName('perlet').AsSmallInt:=perlet;
   QProfessor.ParamByName('semref').AsSmallInt:=semref;
   QProfessor.ParamByName('coddis').AsInteger:=coddis;
   QProfessor.ParamByName('codtur').AsString:=codtur;
   QProfessor.ParamByName('lab').AsSmallInt:=lab;
   QProfessor.Open;
   If not QProfessor.Eof
   Then Acha_Titular:=QProfessor['fun_matr']
   Else Acha_Titular:=0;
  End
 Else
  Begin
   QProfessor.Close;
   QProfessor.Sql.Clear;
   QProfessor.Sql.Add('select * from sca_prof_disc pd, sca_professor p');
   QProfessor.Sql.Add('where pd.fun_matr = p.fun_matr and pd.dst_perlet =:perlet and');
   QProfessor.Sql.Add('pd.dst_semref =:semref and pd.dis_codigo =:coddis and');
   QProfessor.Sql.Add('pd.dst_codtur =:codtur and pd.prd_resp = 1');
   QProfessor.Sql.Add('order by lab_turma');
   QProfessor.ParamByName('perlet').AsSmallInt:=perlet;
   QProfessor.ParamByName('semref').AsSmallInt:=semref;
   QProfessor.ParamByName('coddis').AsInteger:=coddis;
   QProfessor.ParamByName('codtur').AsString:=codtur;
   QProfessor.Open;
   If not QProfessor.Eof
   Then Acha_Titular:=QProfessor['fun_matr']
   Else Acha_Titular:=0;
  End;
 QProfessor.Destroy;
End;

Function Acha_Titular2(coddis:integer;codtur:string;lab,perlet,semref:integer):string;
var QProfessor:TQuery;
Begin
 QProfessor:=TQuery.Create(FProcs);
 QProfessor.DatabaseName:='unoeste';
 If lab >= 0
 Then
  Begin
   QProfessor.Close;
   QProfessor.Sql.Clear;
   QProfessor.Sql.Add('select * from sca_prof_disc pd, fol_funcionario f, crp_pessoas p');
   QProfessor.Sql.Add('where f.pes_nro = p.pes_nro and');
   QProfessor.Sql.Add('((f.emp_codigo in (1,22,23) and fun_admprof in (2,3) and fun_prof = "S") or (f.emp_codigo in (3,24,25) and fun_atribui = "S"))');
//   QProfessor.Sql.Add('((f.emp_codigo = 1 and f.fun_admprof between 2 and 3) or (f.emp_codigo = 3 and fun_atribui = "S")) and pd.fun_matr = f.fun_codigo and pd.dst_perlet =:perlet and');
   QProfessor.Sql.Add('and pd.fun_matr = f.fun_codigo and pd.dst_perlet =:perlet and');
   QProfessor.Sql.Add('pd.dst_semref =:semref and pd.dis_codigo =:coddis and');
   QProfessor.Sql.Add('pd.dst_codtur =:codtur and pd.lab_turma =:lab and pd.prd_resp = 1');
   QProfessor.ParamByName('perlet').AsSmallInt:=perlet;
   QProfessor.ParamByName('semref').AsSmallInt:=semref;
   QProfessor.ParamByName('coddis').AsInteger:=coddis;
   QProfessor.ParamByName('codtur').AsString:=codtur;
   QProfessor.ParamByName('lab').AsSmallInt:=lab;
   QProfessor.Open;
   If not QProfessor.Eof
   Then Acha_Titular2:=QProfessor['pes_nome']
   Else Acha_Titular2:='';
  End
 Else
  Begin
   QProfessor.Close;
   QProfessor.Sql.Clear;
   QProfessor.Sql.Add('select * from sca_prof_disc pd, fol_funcionario f, crp_pessoas p');
   QProfessor.Sql.Add('where f.pes_nro = p.pes_nro and');
   QProfessor.Sql.Add('((f.emp_codigo in (1,22,23) and fun_admprof in (2,3) and fun_prof = "S") or (f.emp_codigo in (3,24,25) and fun_atribui = "S"))');
//   QProfessor.Sql.Add('((f.emp_codigo = 1 and f.fun_admprof between 2 and 3) or (f.emp_codigo = 3 and fun_atribui = "S")) and pd.fun_matr = f.fun_codigo and pd.dst_perlet =:perlet and');
   QProfessor.Sql.Add('and pd.fun_matr = f.fun_codigo and pd.dst_perlet =:perlet and');
   QProfessor.Sql.Add('pd.dst_semref =:semref and pd.dis_codigo =:coddis and');
   QProfessor.Sql.Add('pd.dst_codtur =:codtur and pd.prd_resp = 1');
   QProfessor.Sql.Add('order by lab_turma');
   QProfessor.ParamByName('perlet').AsSmallInt:=perlet;
   QProfessor.ParamByName('semref').AsSmallInt:=semref;
   QProfessor.ParamByName('coddis').AsInteger:=coddis;
   QProfessor.ParamByName('codtur').AsString:=codtur;
   QProfessor.Open;
   If not QProfessor.Eof
   Then Acha_Titular2:=QProfessor['pes_nome']
   Else Acha_Titular2:='';
  End;
 QProfessor.Destroy;
End;

Function Acha_Titular_Alu(coddis:integer;codtur:string;lab,perlet,semref:integer):string;
var QProfessor:TQuery;
Begin
 QProfessor:=TQuery.Create(FProcs);
 QProfessor.DatabaseName:='unoeste';
 QProfessor.Close;
 QProfessor.Sql.Clear;
 QProfessor.Sql.Add('select * from sca_prof_disc pd, fol_funcionario f, crp_pessoas p');
 QProfessor.Sql.Add('where f.pes_nro = p.pes_nro and');
 QProfessor.Sql.Add('((f.emp_codigo = 1 and f.fun_admprof between 2 and 3) or (f.emp_codigo = 3 and fun_atribui = "S")) and pd.fun_matr = f.fun_codigo and pd.dst_perlet =:perlet and');
 QProfessor.Sql.Add('pd.dst_semref =:semref and pd.dis_codigo =:coddis and');
 QProfessor.Sql.Add('pd.dst_codtur =:codtur and (pd.lab_turma = 0 or pd.lab_turma =:lab) and pd.prd_resp = 1');
 QProfessor.Sql.Add('order by lab_turma');
 QProfessor.ParamByName('perlet').AsSmallInt:=perlet;
 QProfessor.ParamByName('semref').AsSmallInt:=semref;
 QProfessor.ParamByName('coddis').AsInteger:=coddis;
 QProfessor.ParamByName('codtur').AsString:=codtur;
 QProfessor.ParamByName('lab').AsSmallInt:=lab;
 QProfessor.Open;
 If not QProfessor.Eof
 Then Acha_Titular_Alu:=QProfessor['pes_nome']
 Else Acha_Titular_Alu:='';
 QProfessor.Destroy;
End;

{Function Mascara_CPF(cpf:real) : string;
var aux:string;
Begin
 aux:='';
 If Length(FloatToStr(cpf)) = 11
 Then
  Begin
   aux:=Copy(FloatToStr(cpf),1,3)+'.'+Copy(FloatToStr(cpf),4,3)+'.'+Copy(FloatToStr(cpf),7,3)+'-'+
        Copy(FloatToStr(cpf),10,2);
  End
 Else
  If Length(FloatToStr(cpf)) = 10
  Then
   Begin
    aux:='0'+Copy(FloatToStr(cpf),1,2)+'.'+Copy(FloatToStr(cpf),3,3)+'.'+Copy(FloatToStr(cpf),6,3)+'-'+
        Copy(FloatToStr(cpf),9,2);
   End
  Else
   If Length(FloatToStr(cpf)) = 9
   Then
    Begin
     aux:='00'+Copy(FloatToStr(cpf),1,1)+'.'+Copy(FloatToStr(cpf),2,3)+'.'+Copy(FloatToStr(cpf),5,3)+'-'+
         Copy(FloatToStr(cpf),8,2);
    End
   Else
    Begin
     aux:='000'+'.'+Copy(FloatToStr(cpf),1,3)+'.'+Copy(FloatToStr(cpf),4,3)+'-'+
         Copy(FloatToStr(cpf),7,2);
    End;
 Mascara_CPF:=aux;
End;}

Function Mascara_CPF(cpf:real) : string;
var aux:string;
Begin
 aux:=StrZero(cpf,11);
 Mascara_CPF:=Copy(aux,1,3)+'.'+Copy(aux,4,3)+'.'+Copy(aux,7,3)+'-'+Copy(aux,10,2);
End;

Function CPF( Dados: string ): boolean;
var
  Contar : integer;
  Digito : integer;
  Digito1: integer;
  Digito2: integer;
  Resto  : integer;
  SemMascara: string;
begin
  Digito1 := 0;
  Digito2 := 0;
  SemMascara := '';
  for Contar := 1 to Length( Dados ) do
  begin
    if Pos( Copy( Dados, Contar, 1 ), '/-.' ) = 0 then
      SemMascara := SemMascara + Copy( Dados, Contar, 1 );
  end;
  if (Length(Trim(SemMascara))=11) then
  begin
     Dados := SemMascara;
     for Contar := 1 to 9 do
     begin
       Digito1 := Digito1 + ( ( 11 - Contar )
       * StrToInt( Copy( Dados, Contar, 1 ) ) );
       Digito2 := Digito2 + ( ( 12 - Contar )
       * StrToInt( Copy( Dados, Contar, 1 ) ) );
     end;
     Resto := Digito1 mod 11;
     if Resto < 2 then Digito := 0
     else Digito := 11 - Resto;
     Digito2 := Digito2 + ( 2 * Digito );
     Resto := Digito2 mod 11;
     Digito := Digito * 10;
     if Resto >= 2 then Digito := Digito + ( 11 - Resto );
     if Digito <> StrToInt( Copy( Dados,
     10, 2 ) ) then CPF := False
     else CPF := True;
  end
  else
     CPF:=False;
end;

Function Valida_Hora(hora:string):Boolean;
var horaux:TDateTime;
Begin
 Valida_Hora:=True;
 Try
  horaux:=StrToTime(hora);
 Except
  Valida_Hora:=False;
 End;
End;

Function RemoveChar(Value: String; car: Char): String;
var
   p,t: Word;
Begin
   p:=Pos(car,Value);
   t:=Length(Value);
   if (p=0) then
      RemoveChar:=Value
   else
      RemoveChar:=Removechar(Copy(Value,1,p-1)+Copy(Value,p+1,t-p),car);
End;

Function Trata_Hora(hora:string):String;
var vaux,s1,s2:string;
Begin
 vaux:=RemoveChar(hora,':');
 Trata_Hora:=Copy(Copy(IntToStr(StrToInt(Trim(vaux))+10000),2,4),1,2)+':'+Copy(Copy(IntToStr(StrToInt(Trim(vaux))+10000),2,4),3,2);
End;

Function Pega_DataHora:TDateTime;
var SP_DataSis:TStoredProc;
Begin
 SP_DataSis:=TStoredProc.Create(FProcs);
 SP_DataSis.DatabaseName:='unoeste';
 SP_DataSis.StoredProcName:='pega_datahora';
 SP_DataSis.Active:=True;
 Pega_DataHora:=SP_DataSis['(expression)'];
 SP_DataSis.Active:=False;
 SP_DataSis.Destroy;
End;

Function Pega_Data:TDate;
var SP_DataSis:TStoredProc;
Begin
 SP_DataSis:=TStoredProc.Create(FProcs);
 SP_DataSis.DatabaseName:='unoeste';
 SP_DataSis.StoredProcName:='pega_data';
 SP_DataSis.Active:=True;
 Pega_Data:=SP_DataSis['(expression)'];
 SP_DataSis.Active:=False;
 SP_DataSis.Destroy;
End;

Function Renovacao2(codcur,tipo,forma:smallint):String;
var QCurso:TQuery;
Begin
 QCurso:=TQuery.Create(FProcs);
 QCurso.DatabaseName:='unoeste';
 QCurso.Close;
 QCurso.Sql.Clear;
 QCurso.Sql.Add('select * from sca_cursos where cur_codigo =:codcur');
 QCurso.ParamByName('codcur').AsSmallInt:=codcur;
 QCurso.Open;
 If (QCurso['cur_nrorenov'] <> Null) and (QCurso['cur_datrenov'] <> Null)
 Then
  Begin
    If (Trim(NULLToSpace(QCurso['cur_renovsecao'])) <> '') and (Trim(NULLToSpace(QCurso['cur_renovpag'])) <> '') and
       (Trim(NULLToSpace(QCurso['cur_nrenovdou'])) <> '') and (QCurso['cur_dtrenvport'] <> Null)
    Then
     Begin
       If forma = 1
       Then
        Begin
          If tipo = 1
          Then Result:='RENOVAÇÃO DO REC. PORT.'+NULLToSpace(QCurso['cur_orgrenov'])+' Nº'+QCurso['cur_nrorenov']+', DE '+DateToStr(QCurso['cur_dtrenvport'])+', D.O.U. Nº'+QCurso['cur_nrenovdou']+
                           ', SEÇÃO '+QCurso['cur_renovsecao']+', PÁG.'+QCurso['cur_renovpag']+', DE '+DateToStr(QCurso['cur_datrenov'])
          Else Result:='RENOV. DO REC. PORT.'+NULLToSpace(QCurso['cur_orgrenov'])+' Nº'+QCurso['cur_nrorenov']+', DE '+DateToStr(QCurso['cur_dtrenvport'])+', D.O.U. Nº'+QCurso['cur_nrenovdou']+
                           ', SEÇÃO '+QCurso['cur_renovsecao']+', PÁG.'+QCurso['cur_renovpag']+', DE '+DateToStr(QCurso['cur_datrenov']);
        End
       Else
        If tipo = 1
        Then Result:='Renovação do Rec. Port.'+NULLToSpace(QCurso['cur_orgrenov'])+' nº'+QCurso['cur_nrorenov']+', de '+DateToStr(QCurso['cur_dtrenvport'])+', D.O.U. nº'+QCurso['cur_nrenovdou']+
                         ', Seçao '+QCurso['cur_renovsecao']+', pág.'+QCurso['cur_renovpag']+', de '+DateToStr(QCurso['cur_datrenov'])
        Else Result:='Renov. do Rec. Port.'+NULLToSpace(QCurso['cur_orgrenov'])+' nº'+QCurso['cur_nrorenov']+', de '+DateToStr(QCurso['cur_dtrenvport'])+', D.O.U. nº'+QCurso['cur_nrenovdou']+
                         ', Seção '+QCurso['cur_renovsecao']+', pág.'+QCurso['cur_renovpag']+', de '+DateToStr(QCurso['cur_datrenov']);

     End
    Else
     If forma = 1
     Then
      Begin
        If tipo = 1
        Then Result:='RENOVAÇÃO DO REC. PORT.'+NULLToSpace(QCurso['cur_orgrenov'])+' Nº'+QCurso['cur_nrorenov']+' D.O.U. '+DateToStr(QCurso['cur_datrenov'])
        Else Result:='RENOV. DO REC. PORT.'+NULLToSpace(QCurso['cur_orgrenov'])+' Nº'+QCurso['cur_nrorenov']+' D.O.U. '+DateToStr(QCurso['cur_datrenov']);
      End
     Else
      If tipo = 1
      Then Result:='Renovação do Rec. Port.'+NULLToSpace(QCurso['cur_orgrenov'])+' nº'+QCurso['cur_nrorenov']+' D.O.U. '+DateToStr(QCurso['cur_datrenov'])
      Else Result:='Renov. do Rec. Port.'+NULLToSpace(QCurso['cur_orgrenov'])+' nº'+QCurso['cur_nrorenov']+' D.O.U. '+DateToStr(QCurso['cur_datrenov']);
  End
 Else Result:='';
 QCurso.Destroy;
End;

Procedure Imprime_AutRec(QConsAlu,QConsHab,QCurso:TQuery;tipo,forma:smallint;var RTAutRec:TppRichText);
var secao, protemec, republicacao, vautrec:string;
    vdia, vmes, vano:word;
Begin
  vautrec:='';
  secao:='';
  protemec:='';

  If (Trim(NULLToSpace(QConsAlu['cur_procemec'])) <> '')
  Then protemec:=' - Protocolo e-MEC '+QConsAlu['cur_procemec'];

  If (Trim(NULLToSpace(QConsAlu['cur_autsecao'])) <> '') and (Trim(NULLToSpace(QConsAlu['cur_autpag'])) <> '') and
     (Trim(NULLToSpace(QConsAlu['cur_nautdou'])) <> '') and (QConsAlu['cur_dataportaria'] <> Null) and (QConsAlu['cur_autdata'] <> Null)
  Then secao:=', de '+DateToStr(QConsAlu['cur_dataportaria'])+', D.O.U. nº'+QConsAlu['cur_nautdou']+
              ', Seção '+QConsAlu['cur_autsecao']+', pág.'+QConsAlu['cur_autpag']+', de '+DateToStr(QConsAlu['cur_autdata']);

  If (QConsAlu['cur_codigo'] = 20) //Estudos Sociais
  Then
   Begin
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
          Then vautrec:='Reconhecimento: Portaria n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata'])
          Else vautrec:='Autorização: Decreto Lei n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata']);
         End
        Else
         Begin
          If vano > 1982
          Then vautrec:='Reconhecimento: Portaria n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata'])
          Else vautrec:='Reconhecimento: Decreto Lei n°'+QConsAlu['cur_autndc']+' D.O.U. '+DateToStr(QConsAlu['cur_autdata']);
         End;
       End;
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsHab['hab_autdoc'] <> Null
      Then
       Begin
        If QConsHab['hab_autdcp'] = 1
        Then
         Begin
          If vano > 1982
          Then vautrec:='Autorização: Portaria n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat'])
          Else vautrec:='Autorização: Decreto Lei n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat']);
         End
        Else
         Begin
          If vano > 1982
          Then vautrec:='Reconhecimento: Portaria n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat'])
          Else vautrec:='Reconhecimento: Decreto Lei n°'+QConsHab['hab_autdoc']+' D.O.U. '+DateToStr(QConsHab['hab_autdat']);
         End;
       End;
     End
    Else
     Begin
      DecodeDate(QConsHab['hab_autdat'],vano,vmes,vdia);
      vano:=Acerta_Ano(vano);
      If QConsHab['hab_autdcp'] = 1
      Then
       Begin
        If vano > 1982
        Then vautrec:='Autorização: Portaria nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat'])
        Else vautrec:='Autorização: Decreto Lei nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat']);
       End
      Else
       Begin
        If vano > 1982
        Then vautrec:='Reconhecimento: Portaria nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat'])
        Else vautrec:='Reconhecimento: Decreto Lei nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat']);
       End;
     End;
   End
  Else
   Begin
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
         Then vautrec:='Autorização: Portaria nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat'])
         Else vautrec:='Reconhecimento: Portaria nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat']);
        End
       Else
        Begin
         If QConsHab['hab_autdcp'] = 1
         Then
          Begin
           If vano > 1982
           Then vautrec:='Autorização: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+' D.O.U. de '+DateToStr(QConsHab['hab_autdat'])
           Else vautrec:='Autorização: Decreto Lei nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat']);
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
                Then vautrec:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+', de '+DateToStr(QConsHab['hab_dataportaria'])+' D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+protemec
                Else vautrec:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+' D.O.U. de '+DateToStr(QConsHab['hab_autdat'])+protemec;
              End
             Else vautrec:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsHab['hab_autdoc']+NULLToSpace(QConsAlu['cur_artigo'])+secao+protemec;
            End
           Else vautrec:='Reconhecimento: Decreto Lei nº '+QConsHab['hab_autdoc']+' D.O.U. de '+DateToStr(QConsHab['hab_autdat']);
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
         Then vautrec:='Autorização: Portaria nº '+QConsAlu['cur_autndc']+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao
         Else vautrec:='Reconhecimento: Portaria nº '+QConsAlu['cur_autndc']+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao;
        End
       Else
        If QConsAlu['cur_codigo'] = 19  // Esquema I
        Then vautrec:='Reconhecimento: Portaria nº '+QConsAlu['cur_autndc']+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao
        Else
         Begin
          If QConsAlu['cur_autdcp'] = 1
          Then
           Begin
            If vano > 1982
            Then vautrec:='Autorização: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao
            Else vautrec:='Autorização: Decreto Lei nº '+QConsAlu['cur_autndc']+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao;
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
                 Then vautrec:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+', de '+DateToStr(QConsAlu['cur_dataportaria'])+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+protemec
                 Else vautrec:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao+protemec;
               End
              Else vautrec:='Reconhecimento: Portaria'+NULLToSpace(QConsAlu['cur_orgao'])+' nº '+QConsAlu['cur_autndc']+NULLToSpace(QConsAlu['cur_artigo'])+secao+protemec;
             End
            Else vautrec:='Reconhecimento: Decreto Lei nº '+QConsAlu['cur_autndc']+' D.O.U. de '+DateToStr(QConsAlu['cur_autdata'])+republicacao;
           End;
         End;
     End;
   End;

  Define_Tamanho_Fonte(10, 1, 'Calibri', vautrec, RTAutRec);
End;

Function Mudou_Professor(MTProfessor, MTProfAnt:TMemoryTable):Boolean;
var ok:boolean;
Begin
 ok:=false;
 If MTProfessor.RecordCount <> MTProfAnt.RecordCount
 Then ok:=true
 Else
  Begin
   MTProfessor.First;
   While not MTProfessor.Eof do
   Begin
    If not Find(MTProfAnt,['fun_matr'],[MTProfessor['fun_matr']],true)
    Then
     Begin
      ok:=true;
      break;
     End;
    MTProfessor.Next;
   End;
  End;
 Mudou_Professor:=ok; 
End;

function Alinha_Doc(doc:string): string;
var s:string;
    n:integer;
Begin
  n:=StrToInt(Trim(doc));
  n:=n+10000000;
  s:=Copy(IntToStr(n),2,7);
  Alinha_Doc:=s;
End;

// ************ Funções para geração de Ponto dos Professores ************

Procedure GeraHorario(perlet,semref,matr,curso:integer;vdataini,vdatafim:TDateTime);
var vdata:TDateTime;
    vperiodo, vcurso, vcampus, vaulaini, vaulafim, vtipoini, vtipofim, vtipo:word;
    diferente:boolean;
Begin
{ QGeraProf:=TQuery.Create(FProcs);
 QGeraProf.DatabaseName:='unoeste';
 QGeraProf.RequestLive:=True;
 If matr <> 0
 Then
  Begin
   QGeraProf.Close;
   QGeraProf.Sql.Clear;
   QGeraProf.Sql.Add('select * from sca_geraprof');
   QGeraProf.Sql.Add('where grp_perlet =:perlet and grp_semref =:semref and fun_matr =:matr and grp_status = ''N''');
   QGeraProf.ParamByName('perlet').AsSmallInt:=perlet;
   QGeraProf.ParamByName('semref').AsSmallInt:=semref;
   QGeraProf.ParamByName('matr').AsInteger:=matr;
   QGeraProf.Open;
   If QGeraProf.Eof
   Then
    Begin
     QGeraProf.Insert;
     QGeraProf['grp_perlet']:=perlet;
     QGeraProf['grp_semref']:=semref;
     QGeraProf['fun_matr']:=matr;
     QGeraProf['grp_dataini']:=vdataini;
     QGeraProf['grp_datfim']:=vdatafim;
     QGeraProf.Post;
    End
   Else
    If (vdataini < QGeraProf['grp_dataini']) or (vdatafim > QGeraProf['grp_datfim'])
    Then
     Begin
      QGeraProf.Edit;
      If vdataini < QGeraProf['grp_dataini']
      Then QGeraProf['grp_dataini']:=vdataini;
      If vdatafim > QGeraProf['grp_datfim']
      Then QGeraProf['grp_datfim']:=vdatafim;
      QGeraProf.Post;
     End;
  End
 Else
  Begin
   QProfessor:=TQuery.Create(FProcs);
   QProfessor.DatabaseName:='unoeste';
   QProfessor.RequestLive:=False;
   QProfessor.Close;
   QProfessor.Sql.Clear;
   QProfessor.Sql.Add('select distinct fun_matr, fun_admprof from sca_reitprof r, fol_funcionario f');
   QProfessor.Sql.Add('where r.fun_matr = f.fun_codigo and emp_codigo = 1 and dst_perlet =:perlet and dst_semref =:semref');
   QProfessor.Sql.Add('and cur_codigo =:codcur');
   QProfessor.ParamByName('perlet').AsSmallInt:=perlet;
   QProfessor.ParamByName('semref').AsSmallInt:=semref;
   QProfessor.ParamByName('codcur').AsInteger:=curso;
   QProfessor.Open;
   If not QProfessor.Eof
   Then
    Begin
     QProfessor.First;
     While not QProfessor.Eof do
     Begin
      QGeraProf.Close;
      QGeraProf.Sql.Clear;
      QGeraProf.Sql.Add('select * from sca_geraprof');
      QGeraProf.Sql.Add('where grp_perlet =:perlet and grp_semref =:semref and fun_matr =:matr and grp_status = ''N''');
      QGeraProf.ParamByName('perlet').AsSmallInt:=perlet;
      QGeraProf.ParamByName('semref').AsSmallInt:=semref;
      QGeraProf.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
      QGeraProf.Open;
      If QGeraProf.Eof
      Then
       Begin
        QGeraProf.Insert;
        QGeraProf['grp_perlet']:=perlet;
        QGeraProf['grp_semref']:=semref;
        QGeraProf['fun_matr']:=QProfessor['fun_matr'];
        QGeraProf['grp_dataini']:=vdataini;
        QGeraProf['grp_datfim']:=vdatafim;
        QGeraProf.Post;
       End
      Else
       If (vdataini < QGeraProf['grp_dataini']) or (vdatafim > QGeraProf['grp_datfim'])
       Then
        Begin
         QGeraProf.Edit;
         If vdataini < QGeraProf['grp_dataini']
         Then QGeraProf['grp_dataini']:=vdataini;
         If vdatafim > QGeraProf['grp_datfim']
         Then QGeraProf['grp_datfim']:=vdatafim;
         QGeraProf.Post;
        End;
      QProfessor.Next;
     End;
    End;
   QProfessor.Destroy;
  End;
 QGeraProf.Destroy;
 vtipo:=3; // 1 - Curso / 2 - Campus / 3 - Unidade}
End;

Procedure Grava_Horario(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf:TQuery;vperiodo,vcurso,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
 QHorAula.Close;
 QHorAula.Sql.Clear;
 QHorAula.Sql.Add('select * from sca_horaula');
 QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
 QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
 If vtipoini = 9 // Estágio
 Then QHorAula.Sql.Add('and hor_tipaula = 1')
 Else QHorAula.Sql.Add('and hor_tipaula = 0');
 QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
 QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
 QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
 QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
 QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
 QHorAula.Open;
 If not QHorAula.Eof
 Then
  Begin
   QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
   tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipofim = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
     If tempo <> 0
     Then QProfPonto['pfp_tempo']:=tempo
     Else QProfPonto['pfp_tempo']:=60;
     QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
     QProfPonto.Post;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
     QDisc.Sql.Add('from sca_reitprof');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and (rei_tipo = 1 or rei_tipo = 11) and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and cur_codigo =:codcur and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr');
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('codcur').AsSmallInt:=vcurso;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.Open;
     QDisc.First;
     While not QDisc.Eof do
     Begin
      QEscalaProf.Insert;
      QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
      QEscalaProf['cur_codigo']:=vcurso;
      QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
      QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
      QEscalaProf['lab_turma']:=QDisc['lab_turma'];
      QEscalaProf['cla_serie']:=QDisc['rei_termo'];
      QEscalaProf['auc_seq']:=QDisc['auc_seq'];
      QEscalaProf.Post;
      QDisc.Next;
     End;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

Procedure Grava_Horario2(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf:TQuery;vperiodo,vcampus,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
 QDisc.Close;
 QDisc.Sql.Clear;
 QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
 QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and (rei_tipo = 1 or rei_tipo = 11) and');
 QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
 QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
 QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
 If vsemref = 1 // 1º Semestre
 Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
 Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
 QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
 QDisc.ParamByName('semref').AsSmallInt:=vsemref;
 QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
 QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
 QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
 QDisc.ParamByName('campus').AsSmallInt:=vcampus;
 QDisc.ParamByName('vdata').AsDate:=vdata;
 QDisc.Open;
 QHorAula.Close;
 QHorAula.Sql.Clear;
 QHorAula.Sql.Add('select * from sca_horaula');
 QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
 QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
 If vtipoini = 9 // Estágio
 Then QHorAula.Sql.Add('and hor_tipaula = 1')
 Else QHorAula.Sql.Add('and hor_tipaula = 0');
 QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
 QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
 QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
 QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
 QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
 QHorAula.Open;
 If not QHorAula.Eof
 Then
  Begin
   QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
   tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QDisc.Close;
   QDisc.Sql.Clear;
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
   QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and (rei_tipo = 1 or rei_tipo = 11) and');
   QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
   QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
   If vsemref = 1 // 1º Semestre
   Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
   Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
   QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
   QDisc.ParamByName('semref').AsSmallInt:=vsemref;
   QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
   QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
   QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
   QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
   QDisc.ParamByName('campus').AsSmallInt:=vcampus;
   QDisc.ParamByName('vdata').AsDate:=vdata;
   QDisc.Open;
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipofim = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
   QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
     If tempo <> 0
     Then QProfPonto['pfp_tempo']:=tempo
     Else QProfPonto['pfp_tempo']:=60;
     QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
     QProfPonto.Post;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct c.cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
     QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_caldias cd');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and (rei_tipo = 1 or rei_tipo = 11) and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
     QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
     If vsemref = 1 // 1º Semestre
     Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
     Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('campus').AsSmallInt:=vcampus;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     QDisc.First;
     While not QDisc.Eof do
     Begin
      QEscalaProf.Insert;
      QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
      QEscalaProf['cur_codigo']:=QDisc['cur_codigo'];
      QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
      QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
      QEscalaProf['lab_turma']:=QDisc['lab_turma'];
      QEscalaProf['cla_serie']:=QDisc['rei_termo'];
      QEscalaProf['auc_seq']:=QDisc['auc_seq'];
      QEscalaProf.Post;
      QDisc.Next;
     End;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

Procedure Grava_Horario3(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vrel,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
{ If vrel <> 0 // Existe relógio cadastrado na unidade
 Then QProfPonto['uni_codigo']:=vunid;}
 QProfPonto['uni_codigo']:=vunid;
 QDisc.Close;
 QDisc.Sql.Clear;
 QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
 QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and (rei_tipo = 1 or rei_tipo = 11) and');
 QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
 QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
 QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
 If vsemref = 1 // 1º Semestre
 Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
 Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
 QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
 QDisc.ParamByName('semref').AsSmallInt:=vsemref;
 QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
 QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
 QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
 QDisc.ParamByName('unid').AsSmallInt:=vunid;
 QDisc.ParamByName('vdata').AsDate:=vdata;
 QDisc.Open;
 QHorAula.Close;
 QHorAula.Sql.Clear;
 QHorAula.Sql.Add('select * from sca_horaula');
 QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
 QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
 If vtipoini = 9 // Estágio
 Then QHorAula.Sql.Add('and hor_tipaula = 1')
 Else QHorAula.Sql.Add('and hor_tipaula = 0');
 QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
 QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
 QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
 QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
 QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
 QHorAula.Open;
 If not QHorAula.Eof
 Then
  Begin
   QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
   tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QDisc.Close;
   QDisc.Sql.Clear;
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
   QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and (rei_tipo = 1 or rei_tipo = 11) and');
   QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
   QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
   If vsemref = 1 // 1º Semestre
   Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
   Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
   QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
   QDisc.ParamByName('semref').AsSmallInt:=vsemref;
   QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
   QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
   QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
   QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
   QDisc.ParamByName('unid').AsSmallInt:=vunid;
   QDisc.ParamByName('vdata').AsDate:=vdata;
   QDisc.Open;
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipofim = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
   QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
     If tempo <> 0
     Then QProfPonto['pfp_tempo']:=tempo
     Else QProfPonto['pfp_tempo']:=60;
     QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
     QProfPonto.Post;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct c.cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
     QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_caldias cd');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and (rei_tipo = 1 or rei_tipo = 11) and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
     QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
     If vsemref = 1 // 1º Semestre
     Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
     Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('unid').AsSmallInt:=vunid;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     QDisc.First;
     While not QDisc.Eof do
     Begin
      QEscalaProf.Insert;
      QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
      QEscalaProf['cur_codigo']:=QDisc['cur_codigo'];
      QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
      QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
      QEscalaProf['lab_turma']:=QDisc['lab_turma'];
      QEscalaProf['cla_serie']:=QDisc['rei_termo'];
      QEscalaProf['auc_seq']:=QDisc['auc_seq'];
      QEscalaProf.Post;
      QDisc.Next;
     End;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

Procedure Grava_HorarioP(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado:TQuery;vperiodo,vcurso,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
 QHorAula.Close;
 QHorAula.Sql.Clear;
 QHorAula.Sql.Add('select * from sca_horaula');
 QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
 QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
 If vtipoini = 9 // Estágio
 Then QHorAula.Sql.Add('and hor_tipaula = 1')
 Else QHorAula.Sql.Add('and hor_tipaula = 0');
 QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
 QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
 QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
 QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
 QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
 QHorAula.Open;
 If not QHorAula.Eof
 Then
  Begin
   QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
   tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipofim = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
     If tempo <> 0
     Then QProfPonto['pfp_tempo']:=tempo
     Else QProfPonto['pfp_tempo']:=60;
     QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
     QProfPonto.Post;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct r.cur_codigo, r.dis_codigo, r.dst_codtur, lab_turma, rei_termo, 0 auc_seq');
     QDisc.Sql.Add('from sca_reitprof, sca_disc_tur dt');
     QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and cur_codigo =:codcur and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr');
     QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
     QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
     QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata');
     If not QFeriado.Eof
     Then QDisc.Sql.Add('and dst_feriado = "S"')
     Else
      Begin
       QDisc.Sql.Add('union');
       QDisc.Sql.Add('select distinct r.cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
       QDisc.Sql.Add('from sca_reitprof r, sca_caldias cd');
       QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
       QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and r.cur_codigo =:codcur and');
       QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
       QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
       If vsemref = 1 // 1º Semestre
       Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
       Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
      End;
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('codcur').AsSmallInt:=vcurso;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     QDisc.First;
     While not QDisc.Eof do
     Begin
      QEscalaProf.Insert;
      QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
      QEscalaProf['cur_codigo']:=vcurso;
      QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
      QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
      QEscalaProf['lab_turma']:=QDisc['lab_turma'];
      QEscalaProf['cla_serie']:=QDisc['rei_termo'];
      If QDisc['auc_seq'] <> 0
      Then QEscalaProf['auc_seq']:=QDisc['auc_seq'];
      QEscalaProf.Post;
      QDisc.Next;
     End;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

Procedure Grava_Horario2P(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado:TQuery;vperiodo,vcampus,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
 QDisc.Close;
 QDisc.Sql.Clear;
 QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
 QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and');
 QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
 QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
 QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
 QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
 QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata');
 If not QFeriado.Eof
 Then QDisc.Sql.Add('and dst_feriado = "S"')
 Else
  Begin
   QDisc.Sql.Add('union');
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
   QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
   QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
   QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
   If vsemref = 1 // 1º Semestre
   Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
   Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
  End;
 QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
 QDisc.ParamByName('semref').AsSmallInt:=vsemref;
 QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
 QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
 QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
 QDisc.ParamByName('campus').AsSmallInt:=vcampus;
 QDisc.ParamByName('vdata').AsDate:=vdata;
 QDisc.Open;
 QHorAula.Close;
 QHorAula.Sql.Clear;
 QHorAula.Sql.Add('select * from sca_horaula');
 QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
 QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
 If vtipoini = 9 // Estágio
 Then QHorAula.Sql.Add('and hor_tipaula = 1')
 Else QHorAula.Sql.Add('and hor_tipaula = 0');
 QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
 QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
 QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
 QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
 QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
 QHorAula.Open;
 If not QHorAula.Eof
 Then
  Begin
   QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
   tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QDisc.Close;
   QDisc.Sql.Clear;
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
   QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and');
   QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
   QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
   QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
   QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata');
   If not QFeriado.Eof
   Then QDisc.Sql.Add('and dst_feriado = "S"')
   Else
    Begin
     QDisc.Sql.Add('union');
     QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
     QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
     QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
     If vsemref = 1 // 1º Semestre
     Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
     Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
    End;
   QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
   QDisc.ParamByName('semref').AsSmallInt:=vsemref;
   QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
   QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
   QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
   QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
   QDisc.ParamByName('campus').AsSmallInt:=vcampus;
   QDisc.ParamByName('vdata').AsDate:=vdata;
   QDisc.Open;
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipofim = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
   QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
     If tempo <> 0
     Then QProfPonto['pfp_tempo']:=tempo
     Else QProfPonto['pfp_tempo']:=60;
     QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
     QProfPonto.Post;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct c.cur_codigo, r.dis_codigo, r.dst_codtur, lab_turma, rei_termo, 0 auc_seq');
     QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
     QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
     QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
     QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
     QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata');
     If not QFeriado.Eof
     Then QDisc.Sql.Add('and dst_feriado = "S"')
     Else
      Begin
       QDisc.Sql.Add('union');
       QDisc.Sql.Add('select distinct c.cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
       QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_caldias cd');
       QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
       QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
       QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
       QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and cur_campus =:campus');
       QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
       If vsemref = 1 // 1º Semestre
       Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
       Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
      End;
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('campus').AsSmallInt:=vcampus;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     QDisc.First;
     While not QDisc.Eof do
     Begin
      QEscalaProf.Insert;
      QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
      QEscalaProf['cur_codigo']:=QDisc['cur_codigo'];
      QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
      QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
      QEscalaProf['lab_turma']:=QDisc['lab_turma'];
      QEscalaProf['cla_serie']:=QDisc['rei_termo'];
      If QDisc['auc_seq'] <> 0
      Then QEscalaProf['auc_seq']:=QDisc['auc_seq'];
      QEscalaProf.Post;
      QDisc.Next;
     End;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

Procedure Grava_Horario3P(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vrel,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
// If vrel <> 0 // Existe relógio cadastrado na unidade
// Then QProfPonto['uni_codigo']:=vunid;
 QProfPonto['uni_codigo']:=vunid;
 QDisc.Close;
 QDisc.Sql.Clear;
 QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
 QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
 QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
 QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
 QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
 QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
 QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
 If not QFeriado.Eof
 Then QDisc.Sql.Add('and dst_feriado = "S"');
 QDisc.Sql.Add('union');
 QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
 QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
 QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
 QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
 QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
 QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
 QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
 If not QFer2Grau.Eof
 Then QDisc.Sql.Add('and dst_feriado = "S"');
// Início Atividades
 If QFeriado.Eof
 Then
  Begin
   QDisc.Sql.Add('union');
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
   QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
   QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
   QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
   If vsemref = 1 // 1º Semestre
   Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
   Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
  End;
// Fim Atividades   
 QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
 QDisc.ParamByName('semref').AsSmallInt:=vsemref;
 QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
 QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
 QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
 QDisc.ParamByName('unid').AsSmallInt:=vunid;
 QDisc.ParamByName('vdata').AsDate:=vdata;
 QDisc.Open;
 QHorAula.Close;
 QHorAula.Sql.Clear;
 QHorAula.Sql.Add('select * from sca_horaula');
 QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
 QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
 If vtipoini = 9 // Estágio
 Then QHorAula.Sql.Add('and hor_tipaula = 1')
 Else QHorAula.Sql.Add('and hor_tipaula = 0');
 QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
 QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
 QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
 QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
 QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
 QHorAula.Open;
 If not QHorAula.Eof
 Then
  Begin
   QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
   tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QDisc.Close;
   QDisc.Sql.Clear;
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
   QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
   QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
   QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
   QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
   QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
   If not QFeriado.Eof
   Then QDisc.Sql.Add('and dst_feriado = "S"');
   QDisc.Sql.Add('union');
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
   QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
   QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
   QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
   QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
   QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
   If not QFer2Grau.Eof
   Then QDisc.Sql.Add('and dst_feriado = "S"');
// Início Atividades
   If QFeriado.Eof
   Then
    Begin
     QDisc.Sql.Add('union');
     QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
     QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
     QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
     If vsemref = 1 // 1º Semestre
     Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
     Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
    End;
// Fim Atividades    
   QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
   QDisc.ParamByName('semref').AsSmallInt:=vsemref;
   QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
   QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
   QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
   QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
   QDisc.ParamByName('unid').AsSmallInt:=vunid;
   QDisc.ParamByName('vdata').AsDate:=vdata;
   QDisc.Open;
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipofim = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
   QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
     If tempo <> 0
     Then QProfPonto['pfp_tempo']:=tempo
     Else QProfPonto['pfp_tempo']:=60;
     QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
     QProfPonto.Post;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct c.cur_codigo, r.dis_codigo, r.dst_codtur, lab_turma, rei_termo, 0 auc_seq');
     QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
     QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
     QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
     QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
     QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
     If not QFeriado.Eof
     Then QDisc.Sql.Add('and dst_feriado = "S"');
     QDisc.Sql.Add('union');
     QDisc.Sql.Add('select distinct c.cur_codigo, r.dis_codigo, r.dst_codtur, lab_turma, rei_termo, 0 auc_seq');
     QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
     QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
     QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
     QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
     QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
     If not QFer2Grau.Eof
     Then QDisc.Sql.Add('and dst_feriado = "S"');
// Início Atividades
     If QFeriado.Eof
     Then
      Begin
       QDisc.Sql.Add('union');
       QDisc.Sql.Add('select distinct c.cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
       QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_caldias cd');
       QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
       QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
       QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
       QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
       QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
       If vsemref = 1 // 1º Semestre
       Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
       Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
      End;
// Fim Atividades      
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('unid').AsSmallInt:=vunid;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     QDisc.First;
     While not QDisc.Eof do
     Begin
      QEscalaProf.Insert;
      QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
      QEscalaProf['cur_codigo']:=QDisc['cur_codigo'];
      QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
      QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
      QEscalaProf['lab_turma']:=QDisc['lab_turma'];
      QEscalaProf['cla_serie']:=QDisc['rei_termo'];
      If QDisc['auc_seq'] <> 0
      Then QEscalaProf['auc_seq']:=QDisc['auc_seq'];
      QEscalaProf.Post;
      QDisc.Next;
     End;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

{Procedure Grava_HorarioeSocial(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau:TQuery;vperiodo,vaulaini,vaulafim,vtipoini,vtipofim,vrel,vperlet,vsemref:word;vdata:TDateTime);
var QAux:TQuery;
    vhoraini,vhorafim:TDateTime;
    vinicio,vfim:word;
Begin
  QAux:=TQuery.Create(FProcs);
  QAux.DatabaseName:='unoeste';
  QAux.Close;

  vinicio:=vaulaini;
  vfim:=vaulafim;

  While (vaulafim - vinicio) >= 1 do
  Begin
    If (vinicio mod 2) = 0 // aula inicial começa em uma aula par
    Then vfim:=vinicio
    Else vfim:=vinicio + 1;

    QDisc.Close;
    QDisc.Sql.Clear;
    QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
    QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
    QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
    QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
    QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
    QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
    If not QFeriado.Eof
    Then QDisc.Sql.Add('and dst_feriado = "S"');
    QDisc.Sql.Add('union');
    QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
    QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
    QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
    QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
    QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
    QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
    If not QFer2Grau.Eof
    Then QDisc.Sql.Add('and dst_feriado = "S"');
   // Início Atividades
    If QFeriado.Eof
    Then
     Begin
      QDisc.Sql.Add('union');
      QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
      QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
      QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
      QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
      If vsemref = 1 // 1º Semestre
      Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
      Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
     End;
   // Fim Atividades
    QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
    QDisc.ParamByName('semref').AsSmallInt:=vsemref;
    QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
    QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
    QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
    QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
    QDisc.ParamByName('vdata').AsDate:=vdata;
    QDisc.Open;
    If not QDisc.Eof
    Then
     Begin
       QHorAula.Close;
       QHorAula.Sql.Clear;
       QHorAula.Sql.Add('select * from sca_horaula');
       QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
       QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
       If vtipoini = 9 // Estágio
       Then QHorAula.Sql.Add('and hor_tipaula = 1')
       Else QHorAula.Sql.Add('and hor_tipaula = 0');
       QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
       QHorAula.ParamByName('aula').AsSmallInt:=vinicio;
       QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
       QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
       QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
       QHorAula.Open;
       If not QHorAula.Eof
       Then
        Begin
         vhoraini:=QHorAula['hor_horaini'];
         QDisc.Close;
         QDisc.Sql.Clear;
         QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
         QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
         QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
         QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
         QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
         QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
         If not QFeriado.Eof
         Then QDisc.Sql.Add('and dst_feriado = "S"');
         QDisc.Sql.Add('union');
         QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
         QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
         QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
         QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
         QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
         QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
         If not QFer2Grau.Eof
         Then QDisc.Sql.Add('and dst_feriado = "S"');
      // Início Atividades
         If QFeriado.Eof
         Then
          Begin
           QDisc.Sql.Add('union');
           QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
           QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
           QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
           QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
           If vsemref = 1 // 1º Semestre
           Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
           Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
          End;
      // Fim Atividades
         QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
         QDisc.ParamByName('semref').AsSmallInt:=vsemref;
         QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
         QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
         QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
         QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
         QDisc.ParamByName('vdata').AsDate:=vdata;
         QDisc.Open;
         QHorAula.Close;
         QHorAula.Sql.Clear;
         QHorAula.Sql.Add('select * from sca_horaula');
         QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
         QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
         If vtipofim = 9 // Estágio
         Then QHorAula.Sql.Add('and hor_tipaula = 1')
         Else QHorAula.Sql.Add('and hor_tipaula = 0');
         QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
         QHorAula.ParamByName('aula').AsSmallInt:=vfim;
         QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
         QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
         QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
         QHorAula.Open;
         If not QHorAula.Eof
         Then
          Begin
           vhorafim:=QHorAula['hor_horafim'];
           QAux.Close;
           QAux.Sql.Clear;
           QAux.Sql.Add('select * from eso_profponto');
           QAux.Sql.Add('where fun_codigo =:matr and emp_codigo = 1 and pfp_tipofunc between 2 and 3 and pfp_periodo =:periodo and pfp_diasem =:diasem and');
           QAux.Sql.Add('      pfp_horaini =:horaini and pfp_horafim =:horafim');
           QAux.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
           QAux.ParamByName('periodo').AsSmallInt:=vperiodo;
           QAux.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
           QAux.ParamByName('horaini').AsDateTime:=vhoraini;
           QAux.ParamByName('horafim').AsDateTime:=vhorafim;
           QAux.Open;
           If QAux.Eof
           Then
            Begin
              QProfPonto.Insert;
              QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
              QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
              QProfPonto['pfp_diasem']:=DayOfWeek(vdata);
              QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
              QProfPonto['emp_codigo']:=1;
              QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
              QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
              QProfPonto['pfp_periodo']:=vperiodo;
              QProfPonto['pfp_horaini']:=vhoraini;
              QProfPonto['pfp_horafim']:=vhorafim;
              QProfPonto['pfp_status']:=0;
              QProfPonto['pfp_dtgerado']:=Pega_DataHora;
              QProfPonto.Post;
            End;
          End;
        End;
     End;

    If (vinicio mod 2) = 0 // aula inicial começa em uma aula par
    Then vinicio:=vinicio + 1
    Else vinicio:=vinicio + 2;
  End;

  If (vinicio <= vaulafim)
  Then
   Begin
     vfim:=vinicio;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
     QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
     QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
     QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
     QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
     If not QFeriado.Eof
     Then QDisc.Sql.Add('and dst_feriado = "S"');
     QDisc.Sql.Add('union');
     QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
     QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
     QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
     QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
     QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
     If not QFer2Grau.Eof
     Then QDisc.Sql.Add('and dst_feriado = "S"');
    // Início Atividades
     If QFeriado.Eof
     Then
      Begin
       QDisc.Sql.Add('union');
       QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
       QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
       QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
       QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
       If vsemref = 1 // 1º Semestre
       Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
       Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
      End;
    // Fim Atividades
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     If not QDisc.Eof
     Then
      Begin
        QHorAula.Close;
        QHorAula.Sql.Clear;
        QHorAula.Sql.Add('select * from sca_horaula');
        QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
        QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
        If vtipoini = 9 // Estágio
        Then QHorAula.Sql.Add('and hor_tipaula = 1')
        Else QHorAula.Sql.Add('and hor_tipaula = 0');
        QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
        QHorAula.ParamByName('aula').AsSmallInt:=vinicio;
        QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
        QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
        QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
        QHorAula.Open;
        If not QHorAula.Eof
        Then
         Begin
          vhoraini:=QHorAula['hor_horaini'];
          QDisc.Close;
          QDisc.Sql.Clear;
          QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
          QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
          QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
          QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
          QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
          QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
          If not QFeriado.Eof
          Then QDisc.Sql.Add('and dst_feriado = "S"');
          QDisc.Sql.Add('union');
          QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
          QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
          QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
          QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
          QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
          QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
          If not QFer2Grau.Eof
          Then QDisc.Sql.Add('and dst_feriado = "S"');
       // Início Atividades
          If QFeriado.Eof
          Then
           Begin
            QDisc.Sql.Add('union');
            QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
            QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
            QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
            QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
            If vsemref = 1 // 1º Semestre
            Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
            Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
           End;
       // Fim Atividades
          QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
          QDisc.ParamByName('semref').AsSmallInt:=vsemref;
          QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
          QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
          QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
          QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
          QDisc.ParamByName('vdata').AsDate:=vdata;
          QDisc.Open;
          QHorAula.Close;
          QHorAula.Sql.Clear;
          QHorAula.Sql.Add('select * from sca_horaula');
          QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
          QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
          If vtipofim = 9 // Estágio
          Then QHorAula.Sql.Add('and hor_tipaula = 1')
          Else QHorAula.Sql.Add('and hor_tipaula = 0');
          QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
          QHorAula.ParamByName('aula').AsSmallInt:=vfim;
          QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
          QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
          QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
          QHorAula.Open;
          If not QHorAula.Eof
          Then
           Begin
            vhorafim:=QHorAula['hor_horafim'];
            QAux.Close;
            QAux.Sql.Clear;
            QAux.Sql.Add('select * from eso_profponto');
            QAux.Sql.Add('where fun_codigo =:matr and emp_codigo = 1 and pfp_tipofunc between 2 and 3 and pfp_periodo =:periodo and pfp_diasem =:diasem and');
            QAux.Sql.Add('      pfp_horaini =:horaini and pfp_horafim =:horafim');
            QAux.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
            QAux.ParamByName('periodo').AsSmallInt:=vperiodo;
            QAux.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
            QAux.ParamByName('horaini').AsDateTime:=vhoraini;
            QAux.ParamByName('horafim').AsDateTime:=vhorafim;
            QAux.Open;
            If QAux.Eof
            Then
             Begin
               QProfPonto.Insert;
               QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
               QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
               QProfPonto['pfp_diasem']:=DayOfWeek(vdata);
               QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
               QProfPonto['emp_codigo']:=1;
               QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
               QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
               QProfPonto['pfp_periodo']:=vperiodo;
               QProfPonto['pfp_horaini']:=vhoraini;
               QProfPonto['pfp_horafim']:=vhorafim;
               QProfPonto['pfp_status']:=0;
               QProfPonto['pfp_dtgerado']:=Pega_DataHora;
               QProfPonto.Post;
             End;
           End;
         End;
      End;
   End;

  QAux.Destroy;
End;}

Procedure Grava_HorarioeSocial(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau:TQuery;vperiodo,vaulaini,vaulafim,vtipoini,vtipofim,vrel,vperlet,vsemref:word;vdata:TDateTime);
var QAux:TQuery;
    vhoraini,vhorafim:TDateTime;
Begin
  QAux:=TQuery.Create(FProcs);
  QAux.DatabaseName:='unoeste';
  QAux.Close;

  QDisc.Close;
  QDisc.Sql.Clear;
  QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
  QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
  QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
  QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
  QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
  QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
  If not QFeriado.Eof
  Then QDisc.Sql.Add('and dst_feriado = "S"');
  QDisc.Sql.Add('union');
  QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
  QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
  QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
  QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
  QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
  QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
  If not QFer2Grau.Eof
  Then QDisc.Sql.Add('and dst_feriado = "S"');
 // Início Atividades
  If QFeriado.Eof
  Then
   Begin
    QDisc.Sql.Add('union');
    QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
    QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
    QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
    QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
    If vsemref = 1 // 1º Semestre
    Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
    Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
   End;
 // Fim Atividades
  QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
  QDisc.ParamByName('semref').AsSmallInt:=vsemref;
  QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
  QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
  QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
  QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
  QDisc.ParamByName('vdata').AsDate:=vdata;
  QDisc.Open;
  If not QDisc.Eof
  Then
   Begin
     QHorAula.Close;
     QHorAula.Sql.Clear;
     QHorAula.Sql.Add('select * from sca_horaula');
     QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
     QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
     If vtipoini = 9 // Estágio
     Then QHorAula.Sql.Add('and hor_tipaula = 1')
     Else QHorAula.Sql.Add('and hor_tipaula = 0');
     QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
     QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
     QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
     QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
     QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
     QHorAula.Open;
     If not QHorAula.Eof
     Then
      Begin
       vhoraini:=QHorAula['hor_horaini'];
       QDisc.Close;
       QDisc.Sql.Clear;
       QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
       QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
       QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
       QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
       QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
       QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos <> 8');
       If not QFeriado.Eof
       Then QDisc.Sql.Add('and dst_feriado = "S"');
       QDisc.Sql.Add('union');
       QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
       QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and dst_remunerada = 0 and');
       QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
       QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
       QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
       QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata and c.cur_grapos = 8');
       If not QFer2Grau.Eof
       Then QDisc.Sql.Add('and dst_feriado = "S"');
    // Início Atividades
       If QFeriado.Eof
       Then
        Begin
         QDisc.Sql.Add('union');
         QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
         QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
         QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
         QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
         If vsemref = 1 // 1º Semestre
         Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
         Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
        End;
    // Fim Atividades
       QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
       QDisc.ParamByName('semref').AsSmallInt:=vsemref;
       QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
       QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
       QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
       QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
       QDisc.ParamByName('vdata').AsDate:=vdata;
       QDisc.Open;
       QHorAula.Close;
       QHorAula.Sql.Clear;
       QHorAula.Sql.Add('select * from sca_horaula');
       QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
       QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
       If vtipofim = 9 // Estágio
       Then QHorAula.Sql.Add('and hor_tipaula = 1')
       Else QHorAula.Sql.Add('and hor_tipaula = 0');
       QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
       QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
       QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
       QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
       QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
       QHorAula.Open;
       If not QHorAula.Eof
       Then
        Begin
         vhorafim:=QHorAula['hor_horafim'];
         QAux.Close;
         QAux.Sql.Clear;
         QAux.Sql.Add('select * from eso_profponto');
         QAux.Sql.Add('where fun_codigo =:matr and emp_codigo = 1 and pfp_tipofunc between 2 and 3 and pfp_periodo =:periodo and pfp_diasem =:diasem and');
         QAux.Sql.Add('      pfp_horaini =:horaini and pfp_horafim =:horafim');
         QAux.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
         QAux.ParamByName('periodo').AsSmallInt:=vperiodo;
         QAux.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
         QAux.ParamByName('horaini').AsDateTime:=vhoraini;
         QAux.ParamByName('horafim').AsDateTime:=vhorafim;
         QAux.Open;
         If QAux.Eof
         Then
          Begin
            QProfPonto.Insert;
            QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
            QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
            QProfPonto['pfp_diasem']:=DayOfWeek(vdata);
            QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
            QProfPonto['emp_codigo']:=1;
            QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
            QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
            QProfPonto['pfp_periodo']:=vperiodo;
            QProfPonto['pfp_horaini']:=vhoraini;
            QProfPonto['pfp_horafim']:=vhorafim;
            QProfPonto['pfp_status']:=0;
            QProfPonto['pfp_dtgerado']:=Pega_DataHora;
            QProfPonto.Post;
          End;
        End;
      End;
   End;

  QAux.Destroy;
End;

{Procedure Grava_HorarioeSocial2(QProfPonto,QProfessor,QHorAula:TQuery;vperiodo,vaulaini,vaulafim,vtipo,vperlet,vsemref,vdiasem,vcodcur:word);
var QAux:TQuery;
    vhoraini,vhorafim:TDateTime;
    i:word;
    achou:boolean;
Begin
  QHorAula.Close;
  QHorAula.Sql.Clear;
  QHorAula.Sql.Add('select * from sca_horaula');
  QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
  QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
  If vtipo = 9 // Estágio
  Then QHorAula.Sql.Add('and hor_tipaula = 1')
  Else QHorAula.Sql.Add('and hor_tipaula = 0');
  QHorAula.ParamByName('codcur').AsSmallInt:=vcodcur;
  QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
  QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
  QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
  QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
  QHorAula.Open;
  If not QHorAula.Eof
  Then
   Begin
     vhoraini:=QHorAula['hor_horaini'];
     vhorafim:=QHorAula['hor_horafim'];

     If vaulafim - vaulaini = 0 // somente uma aula atribuida
     Then
      Begin
        QProfPonto.Close;
        QProfPonto.Sql.Clear;
        QProfPonto.Sql.Add('select * from tmp_profponto');
        QProfPonto.Sql.Add('where fun_codigo =:matr and emp_codigo =:emp and pfp_periodo =:periodo and pfp_diasem =:diasem');
        QProfPonto.Sql.Add('order by pfp_horaini desc');
        QProfPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
        QProfPonto.ParamByName('emp').AsSmallInt:=QProfessor['emp_codigo'];
        QProfPonto.ParamByName('periodo').AsSmallInt:=vperiodo;
        QProfPonto.ParamByName('diasem').AsSmallInt:=vdiasem;
        QProfPonto.Open;
        If QProfPonto.Eof
        Then
         Begin
           QProfPonto.Insert;
           QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
           QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
           QProfPonto['pfp_diasem']:=vdiasem;
           QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
           QProfPonto['emp_codigo']:=QProfessor['emp_codigo'];
           QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
           QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
           QProfPonto['pfp_periodo']:=vperiodo;
           QProfPonto['pfp_horaini']:=vhoraini;
           QProfPonto['pfp_horafim']:=vhorafim;
           QProfPonto['pfp_status']:=0;
           QProfPonto['pfp_dtgerado']:=Pega_DataHora;
           QProfPonto.Post;
         End
        Else
         Begin
           While (not QProfPonto.Eof) and (vhoraini <> QProfPonto['pfp_horafim']) do
             QProfPonto.Next;
           If not QProfPonto.Eof // não há intervalo entre as aulas
           Then
            Begin
              QProfPonto.Edit;
              QProfPonto['pfp_horafim']:=vhorafim;
              QProfPonto.Post;
            End
           Else
            Begin
              QProfPonto.Insert;
              QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
              QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
              QProfPonto['pfp_diasem']:=vdiasem;
              QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
              QProfPonto['emp_codigo']:=QProfessor['emp_codigo'];
              QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
              QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
              QProfPonto['pfp_periodo']:=vperiodo;
              QProfPonto['pfp_horaini']:=vhoraini;
              QProfPonto['pfp_horafim']:=vhorafim;
              QProfPonto['pfp_status']:=0;
              QProfPonto['pfp_dtgerado']:=Pega_DataHora;
              QProfPonto.Post;
            End;
         End;
      End
     Else
      Begin
        For i:=vaulaini + 1 to vaulafim do
        Begin
          QHorAula.Close;
          QHorAula.Sql.Clear;
          QHorAula.Sql.Add('select * from sca_horaula');
          QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
          QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
          If vtipo = 9 // Estágio
          Then QHorAula.Sql.Add('and hor_tipaula = 1')
          Else QHorAula.Sql.Add('and hor_tipaula = 0');
          QHorAula.ParamByName('codcur').AsSmallInt:=vcodcur;
          QHorAula.ParamByName('aula').AsSmallInt:=i;
          QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
          QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
          QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
          QHorAula.Open;

          If vhorafim = QHorAula['hor_horaini'] // não existe intervalo entre as aulas
          Then vhorafim:=QHorAula['hor_horafim']
          Else
           Begin
             QProfPonto.Close;
             QProfPonto.Sql.Clear;
             QProfPonto.Sql.Add('select * from tmp_profponto');
             QProfPonto.Sql.Add('where fun_codigo =:matr and emp_codigo =:emp and pfp_periodo =:periodo and pfp_diasem =:diasem');
             QProfPonto.Sql.Add('order by pfp_horaini desc');
             QProfPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
             QProfPonto.ParamByName('emp').AsSmallInt:=QProfessor['emp_codigo'];
             QProfPonto.ParamByName('periodo').AsSmallInt:=vperiodo;
             QProfPonto.ParamByName('diasem').AsSmallInt:=vdiasem;
             QProfPonto.Open;
             If QProfPonto.Eof
             Then
              Begin
                QProfPonto.Insert;
                QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
                QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
                QProfPonto['pfp_diasem']:=vdiasem;
                QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
                QProfPonto['emp_codigo']:=QProfessor['emp_codigo'];
                QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
                QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
                QProfPonto['pfp_periodo']:=vperiodo;
                QProfPonto['pfp_horaini']:=vhoraini;
                QProfPonto['pfp_horafim']:=vhorafim;
                QProfPonto['pfp_status']:=0;
                QProfPonto['pfp_dtgerado']:=Pega_DataHora;
                QProfPonto.Post;
              End
             Else
              Begin
                While (not QProfPonto.Eof) and (vhoraini <> QProfPonto['pfp_horafim']) do
                  QProfPonto.Next;
                If not QProfPonto.Eof // não há intervalo entre as aulas
                Then
                 Begin
                   QProfPonto.Edit;
                   QProfPonto['pfp_horafim']:=vhorafim;
                   QProfPonto.Post;
                 End
                Else
                 Begin
                   QProfPonto.Insert;
                   QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
                   QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
                   QProfPonto['pfp_diasem']:=vdiasem;
                   QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
                   QProfPonto['emp_codigo']:=QProfessor['emp_codigo'];
                   QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
                   QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
                   QProfPonto['pfp_periodo']:=vperiodo;
                   QProfPonto['pfp_horaini']:=vhoraini;
                   QProfPonto['pfp_horafim']:=vhorafim;
                   QProfPonto['pfp_status']:=0;
                   QProfPonto['pfp_dtgerado']:=Pega_DataHora;
                   QProfPonto.Post;
                 End;
              End;
           End;
        End;

        QProfPonto.Close;
        QProfPonto.Sql.Clear;
        QProfPonto.Sql.Add('select * from tmp_profponto');
        QProfPonto.Sql.Add('where fun_codigo =:matr and emp_codigo =:emp and pfp_periodo =:periodo and pfp_diasem =:diasem');
        QProfPonto.Sql.Add('order by pfp_horaini desc');
        QProfPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
        QProfPonto.ParamByName('emp').AsSmallInt:=QProfessor['emp_codigo'];
        QProfPonto.ParamByName('periodo').AsSmallInt:=vperiodo;
        QProfPonto.ParamByName('diasem').AsSmallInt:=vdiasem;
        QProfPonto.Open;
        If QProfPonto.Eof
        Then
         Begin
           QProfPonto.Insert;
           QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
           QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
           QProfPonto['pfp_diasem']:=vdiasem;
           QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
           QProfPonto['emp_codigo']:=QProfessor['emp_codigo'];
           QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
           QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
           QProfPonto['pfp_periodo']:=vperiodo;
           QProfPonto['pfp_horaini']:=vhoraini;
           QProfPonto['pfp_horafim']:=vhorafim;
           QProfPonto['pfp_status']:=0;
           QProfPonto['pfp_dtgerado']:=Pega_DataHora;
           QProfPonto.Post;
         End
        Else
         Begin
           If vhoraini = QProfPonto['pfp_horafim'] // não há intervalo entre as aulas
           Then
            Begin
              QProfPonto.Edit;
              QProfPonto['pfp_horafim']:=vhorafim;
              QProfPonto.Post;
            End
           Else
            Begin
              QProfPonto.Insert;
              QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
              QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
              QProfPonto['pfp_diasem']:=vdiasem;
              QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
              QProfPonto['emp_codigo']:=QProfessor['emp_codigo'];
              QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
              QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
              QProfPonto['pfp_periodo']:=vperiodo;
              QProfPonto['pfp_horaini']:=vhoraini;
              QProfPonto['pfp_horafim']:=vhorafim;
              QProfPonto['pfp_status']:=0;
              QProfPonto['pfp_dtgerado']:=Pega_DataHora;
              QProfPonto.Post;
            End;
         End;
      End;
   End;
End;}

Procedure Grava_HorarioeSocial2(QProfPonto,QProfessor,QHorAula:TQuery;vperiodo,vaulaini,vaulafim,vtipo,vperlet,vsemref,vdiasem,vcodcur,vmes:word);
var QAux:TQuery;
    vhoraini,vhorafim:TDateTime;
    i:word;
    achou:boolean;
Begin
  For i:=vaulaini to vaulafim do
  Begin
    QHorAula.Close;
    QHorAula.Sql.Clear;
    QHorAula.Sql.Add('select * from sca_horaula');
    QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
    QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
//    If vtipo = 9 // Estágio
//    Then QHorAula.Sql.Add('and hor_tipaula = 1')
//    Else QHorAula.Sql.Add('and hor_tipaula = 0');
    // O Nei pediu para gerar horário baseado somente no horário normal - 21/11/2017
    QHorAula.Sql.Add('and hor_tipaula = 0');
    QHorAula.ParamByName('codcur').AsSmallInt:=vcodcur;
    QHorAula.ParamByName('aula').AsSmallInt:=i;
    QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
    QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
    QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
    QHorAula.Open;
    If not QHorAula.Eof
    Then
     Begin
       QProfPonto.Close;
       QProfPonto.Sql.Clear;
       QProfPonto.Sql.Add('select * from tmp_profponto');
       QProfPonto.Sql.Add('where fun_codigo =:matr and emp_codigo =:emp and pfp_periodo =:periodo and pfp_diasem =:diasem and pfp_horaini =:horaini and pfp_horafim =:horafim and pfp_mes =:vmes');
       QProfPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
       QProfPonto.ParamByName('emp').AsSmallInt:=QProfessor['emp_codigo'];
       QProfPonto.ParamByName('periodo').AsSmallInt:=vperiodo;
       QProfPonto.ParamByName('diasem').AsSmallInt:=vdiasem;
       QProfPonto.ParamByName('horaini').AsDateTime:=QHorAula['hor_horaini'];
       QProfPonto.ParamByName('horafim').AsDateTime:=QHorAula['hor_horafim'];
       QProfPonto.ParamByName('vmes').AsSmallInt:=vmes;
       QProfPonto.Open;
       If QProfPonto.Eof
       Then
        Begin
          QProfPonto.Insert;
          QProfPonto['pfp_ano']:=QProfessor['dst_perlet'];
          QProfPonto['pfp_semestre']:=QProfessor['dst_semref'];
          QProfPonto['pfp_diasem']:=vdiasem;
          QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
          QProfPonto['emp_codigo']:=QProfessor['emp_codigo'];
          QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
          QProfPonto['pes_cpf']:=QProfessor['pes_cpf'];
          QProfPonto['pfp_periodo']:=vperiodo;
          QProfPonto['pfp_horaini']:=QHorAula['hor_horaini'];
          QProfPonto['pfp_horafim']:=QHorAula['hor_horafim'];
          QProfPonto['pfp_status']:=0;
          QProfPonto['pfp_dtgerado']:=Pega_DataHora;
          QProfPonto['pfp_mes']:=vmes;
          QProfPonto.Post;
        End;
     End;
  End;
End;

Procedure Grava_Horario4P(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
 QDisc.Close;
 QDisc.Sql.Clear;
 QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
 QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and');
 QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
 QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
 QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo');
 QDisc.Sql.Add('and (r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
 QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata');
 If not QFeriado.Eof
 Then QDisc.Sql.Add('and dst_feriado = "S"')
 Else
  Begin
   QDisc.Sql.Add('union');
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
   QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
   QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
   QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
   If vsemref = 1 // 1º Semestre
   Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
   Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
  End;
 QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
 QDisc.ParamByName('semref').AsSmallInt:=vsemref;
 QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
 QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
 QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
 QDisc.ParamByName('unid').AsSmallInt:=vunid;
 QDisc.ParamByName('vdata').AsDate:=vdata;
 QDisc.Open;
 QHorAula.Close;
 QHorAula.Sql.Clear;
 QHorAula.Sql.Add('select * from sca_horaula');
 QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
 QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
 If vtipoini = 9 // Estágio
 Then QHorAula.Sql.Add('and hor_tipaula = 1')
 Else QHorAula.Sql.Add('and hor_tipaula = 0');
 QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
 QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
 QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
 QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
 QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
 QHorAula.Open;
 If not QHorAula.Eof
 Then
  Begin
   QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
   tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QDisc.Close;
   QDisc.Sql.Clear;
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
   QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and');
   QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
   QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
   QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
   QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata');
   If not QFeriado.Eof
   Then QDisc.Sql.Add('and dst_feriado = "S"')
   Else
    Begin
     QDisc.Sql.Add('union');
     QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
     QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
     QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
     If vsemref = 1 // 1º Semestre
     Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
     Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
    End;
   QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
   QDisc.ParamByName('semref').AsSmallInt:=vsemref;
   QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
   QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
   QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
   QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
   QDisc.ParamByName('unid').AsSmallInt:=vunid;
   QDisc.ParamByName('vdata').AsDate:=vdata;
   QDisc.Open;
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipofim = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
   QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
     If tempo <> 0
     Then QProfPonto['pfp_tempo']:=tempo
     Else QProfPonto['pfp_tempo']:=60;
     QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
     QProfPonto.Post;
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct c.cur_codigo, r.dis_codigo, r.dst_codtur, lab_turma, rei_termo, 0 auc_seq');
     QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_disc_tur dt');
     QDisc.Sql.Add('where r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 1 and');
     QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
     QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and r.fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
     QDisc.Sql.Add('and r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
     QDisc.Sql.Add('(r.dst_codtur = dt.dst_codtur or r.dst_codtur = dt.cla_turma)');
     QDisc.Sql.Add('and dst_calini <=:vdata and dst_calfim >=:vdata');
     If not QFeriado.Eof
     Then QDisc.Sql.Add('and dst_feriado = "S"')
     Else
      Begin
       QDisc.Sql.Add('union');
       QDisc.Sql.Add('select distinct c.cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
       QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_caldias cd');
       QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
       QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
       QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
       QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
       QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
       If vsemref = 1 // 1º Semestre
       Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
       Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
      End;
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('unid').AsSmallInt:=vunid;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     QDisc.First;
     While not QDisc.Eof do
     Begin
      QEscalaProf.Insert;
      QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
      QEscalaProf['cur_codigo']:=QDisc['cur_codigo'];
      QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
      QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
      QEscalaProf['lab_turma']:=QDisc['lab_turma'];
      QEscalaProf['cla_serie']:=QDisc['rei_termo'];
      If QDisc['auc_seq'] <> 0
      Then QEscalaProf['auc_seq']:=QDisc['auc_seq'];
      QEscalaProf.Post;
      QDisc.Next;
     End;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

Procedure Grava_HorAtiv(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau:TQuery;vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,vperlet,vsemref:word;vdata:TDateTime);
var tempo:word;
Begin
 QProfPonto.Insert;
 QProfPonto['pfp_data']:=vdata;
 QProfPonto['fun_codigo']:=QProfessor['fun_matr'];
 QProfPonto['emp_codigo']:=1;
 QProfPonto['pfp_tipofunc']:=QProfessor['fun_admprof'];
 QProfPonto['pfp_bateponto']:='N';
 If QFeriado.Eof
 Then
  Begin
   QDisc.Close;
   QDisc.Sql.Clear;
   QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
   QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
   QDisc.Sql.Add('rei_aulaini =:aulaini and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
   QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
   QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
   If vsemref = 1 // 1º Semestre
   Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
   Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
   QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
   QDisc.ParamByName('semref').AsSmallInt:=vsemref;
   QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
   QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
   QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
   QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
   QDisc.ParamByName('unid').AsSmallInt:=vunid;
   QDisc.ParamByName('vdata').AsDate:=vdata;
   QDisc.Open;
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipoini = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
   QHorAula.ParamByName('aula').AsSmallInt:=vaulaini;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   If not QHorAula.Eof
   Then
    Begin
     QProfPonto['pfp_iniprev']:=QHorAula['hor_horaini'];
     tempo:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
     QDisc.Close;
     QDisc.Sql.Clear;
     QDisc.Sql.Add('select distinct r.cur_codigo from sca_reitprof r, sca_cursos c, sca_caldias cd');
     QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
     QDisc.Sql.Add('rei_aulafim =:aulafim and rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
     QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
     QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
     If vsemref = 1 // 1º Semestre
     Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
     Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
     QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
     QDisc.ParamByName('semref').AsSmallInt:=vsemref;
     QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
     QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
     QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
     QDisc.ParamByName('unid').AsSmallInt:=vunid;
     QDisc.ParamByName('vdata').AsDate:=vdata;
     QDisc.Open;
     QHorAula.Close;
     QHorAula.Sql.Clear;
     QHorAula.Sql.Add('select * from sca_horaula');
     QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
     QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
     If vtipofim = 9 // Estágio
     Then QHorAula.Sql.Add('and hor_tipaula = 1')
     Else QHorAula.Sql.Add('and hor_tipaula = 0');
     QHorAula.ParamByName('codcur').AsSmallInt:=QDisc['cur_codigo'];
     QHorAula.ParamByName('aula').AsSmallInt:=vaulafim;
     QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
     QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
     QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
     QHorAula.Open;
     If not QHorAula.Eof
     Then
      Begin
       QProfPonto['pfp_fimprev']:=QHorAula['hor_horafim'];
       If tempo <> 0
       Then QProfPonto['pfp_tempo']:=tempo
       Else QProfPonto['pfp_tempo']:=60;
       QProfPonto['pfp_tempodif']:=Calcula_Tempo(QProfPonto);
       QProfPonto.Post;
       QDisc.Close;
       QDisc.Sql.Clear;
       QDisc.Sql.Add('select distinct c.cur_codigo, dis_codigo, dst_codtur, lab_turma, rei_termo, auc_seq');
       QDisc.Sql.Add('from sca_reitprof r, sca_cursos c, sca_caldias cd');
       QDisc.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11 and');
       QDisc.Sql.Add('rei_aulaini >=:aulaini and rei_aulafim <=:aulafim and');
       QDisc.Sql.Add('rei_periodo =:periodo and rei_diasem =:diasem and fun_matr =:matr and');
       QDisc.Sql.Add('r.cur_codigo = c.cur_codigo and uni_codigo =:unid');
       QDisc.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
       If vsemref = 1 // 1º Semestre
       Then QDisc.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
       Else QDisc.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
       QDisc.ParamByName('perlet').AsSmallInt:=vperlet;
       QDisc.ParamByName('semref').AsSmallInt:=vsemref;
       QDisc.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
       QDisc.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
       QDisc.ParamByName('aulaini').AsSmallInt:=vaulaini;
       QDisc.ParamByName('aulafim').AsSmallInt:=vaulafim;
       QDisc.ParamByName('periodo').AsSmallInt:=vperiodo;
       QDisc.ParamByName('unid').AsSmallInt:=vunid;
       QDisc.ParamByName('vdata').AsDate:=vdata;
       QDisc.Open;
       QDisc.First;
       While not QDisc.Eof do
       Begin
        QEscalaProf.Insert;
        QEscalaProf['pfp_seq']:=QProfPonto['pfp_seq'];
        QEscalaProf['cur_codigo']:=QDisc['cur_codigo'];
        QEscalaProf['dis_codigo']:=QDisc['dis_codigo'];
        QEscalaProf['dst_codtur']:=QDisc['dst_codtur'];
        QEscalaProf['lab_turma']:=QDisc['lab_turma'];
        QEscalaProf['cla_serie']:=QDisc['rei_termo'];
        If QDisc['auc_seq'] <> 0
        Then QEscalaProf['auc_seq']:=QDisc['auc_seq'];
        QEscalaProf.Post;
        QDisc.Next;
       End;
      End
     Else QProfPonto.Cancel;
    End
   Else QProfPonto.Cancel;
  End
 Else QProfPonto.Cancel;
End;

Procedure Grava_Ponto_Disc(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vperiodo,vtipaul,vperlet,vsemref:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct p.pfp_seq, pfp_iniprev, pfp_fimprev from fol_profponto p, fol_escalaprof e');
 QPonto.Sql.Add('where p.pfp_seq = e.pfp_seq and pfp_data =:vdata and fun_codigo =:matr and cur_codigo =:codcur');
 QPonto.Sql.Add('and pfp_status = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
 QPonto.Sql.Add('order by pfp_iniprev');
 QPonto.ParamByName('vdata').AsDate:=vdata;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('codcur').AsInteger:=vcurso;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_fimprev'])) and
     ((vhorafim) >= (QPonto['pfp_iniprev']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_iniprev']
   Then QProfPonto2['pfp_iniprev']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_fimprev']
   Then QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['dis_codigo']:=vcoddis;
   QEscalaProf['dst_codtur']:=vcodtur;
   QEscalaProf['lab_turma']:=vlab;
   QEscalaProf['cla_serie']:=vtermo;
   QEscalaProf.Post;
   QProfPonto2.Post;
  End
 Else
  Begin
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula = 1 and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipaul = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_data']:=vdata;
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=1;
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
   QProfPonto2['pfp_iniprev']:=vhoraini;
   QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempo']:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QProfPonto2.Post;
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['dis_codigo']:=vcoddis;
   QEscalaProf['dst_codtur']:=vcodtur;
   QEscalaProf['lab_turma']:=vlab;
   QEscalaProf['cla_serie']:=vtermo;
   QEscalaProf.Post;
  End;
End;

Procedure Grava_Ponto_Disc2(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vcampus,vperiodo,vtipaul,vperlet,vsemref:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct p.pfp_seq, pfp_iniprev, pfp_fimprev from fol_profponto p, fol_escalaprof e, sca_cursos c');
 QPonto.Sql.Add('where p.pfp_seq = e.pfp_seq and e.cur_codigo = c.cur_codigo and pfp_data =:vdata and fun_codigo =:matr and cur_campus =:campus');
 QPonto.Sql.Add('and pfp_status = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
 QPonto.Sql.Add('order by pfp_iniprev');
 QPonto.ParamByName('vdata').AsDate:=vdata;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('campus').AsInteger:=vcampus;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_fimprev'])) and
     ((vhorafim) >= (QPonto['pfp_iniprev']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_iniprev']
   Then QProfPonto2['pfp_iniprev']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_fimprev']
   Then QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['dis_codigo']:=vcoddis;
   QEscalaProf['dst_codtur']:=vcodtur;
   QEscalaProf['lab_turma']:=vlab;
   QEscalaProf['cla_serie']:=vtermo;
   QEscalaProf.Post;
   QProfPonto2.Post;
  End
 Else
  Begin
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula = 1 and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipaul = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_data']:=vdata;
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=1;
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
   QProfPonto2['pfp_iniprev']:=vhoraini;
   QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempo']:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QProfPonto2.Post;
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['dis_codigo']:=vcoddis;
   QEscalaProf['dst_codtur']:=vcodtur;
   QEscalaProf['lab_turma']:=vlab;
   QEscalaProf['cla_serie']:=vtermo;
   QEscalaProf.Post;
  End;
End;

Procedure Grava_Ponto_Disc3(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vunid,vperiodo,vtipaul,vperlet,vsemref,vrel:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct p.pfp_seq, pfp_iniprev, pfp_fimprev from fol_profponto p, fol_escalaprof e, sca_cursos c');
 QPonto.Sql.Add('where p.pfp_seq = e.pfp_seq and e.cur_codigo = c.cur_codigo and pfp_data =:vdata and fun_codigo =:matr and c.uni_codigo =:unid');
 QPonto.Sql.Add('and pfp_status = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
 QPonto.Sql.Add('order by pfp_iniprev');
 QPonto.ParamByName('vdata').AsDate:=vdata;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('unid').AsInteger:=vunid;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_fimprev'])) and
     ((vhorafim) >= (QPonto['pfp_iniprev']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_iniprev']
   Then QProfPonto2['pfp_iniprev']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_fimprev']
   Then QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['dis_codigo']:=vcoddis;
   QEscalaProf['dst_codtur']:=vcodtur;
   QEscalaProf['lab_turma']:=vlab;
   QEscalaProf['cla_serie']:=vtermo;
   QEscalaProf.Post;
   QProfPonto2.Post;
  End
 Else
  Begin
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula = 1 and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
   If vtipaul = 9 // Estágio
   Then QHorAula.Sql.Add('and hor_tipaula = 1')
   Else QHorAula.Sql.Add('and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_data']:=vdata;
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=1;
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
//   If vrel <> 0 // Existe relógio cadastrado na unidade
//   Then QProfPonto2['uni_codigo']:=vunid;
   QProfPonto2['uni_codigo']:=vunid;
   QProfPonto2['pfp_iniprev']:=vhoraini;
   QProfPonto2['pfp_fimprev']:=vhorafim;
   If (StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2))) <> 0
   Then QProfPonto2['pfp_tempo']:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2))
   Else QProfPonto2['pfp_tempo']:=60;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QProfPonto2.Post;
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['dis_codigo']:=vcoddis;
   QEscalaProf['dst_codtur']:=vcodtur;
   QEscalaProf['lab_turma']:=vlab;
   QEscalaProf['cla_serie']:=vtermo;
   QEscalaProf.Post;
  End;
End;

Procedure Grava_Data_eSocial(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vcoddis,vlab,vtermo:integer;vcodtur:string;vdata,vhoraini,vhorafim:TDateTime;vperiodo,vtipaul,vperlet,vsemref,vmes:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct pfp_seq, pfp_horaini, pfp_horafim from eso_profponto');
 QPonto.Sql.Add('where pfp_ano =:ano and pfp_semestre =:sem and pfp_diasem =:diasem and pfp_periodo =:periodo and fun_codigo =:matr and emp_codigo =:emp and pfp_mes =:vmes');
 QPonto.Sql.Add('order by pfp_horaini');
 QPonto.ParamByName('ano').AsSmallInt:=QProfessor['dst_perlet'];
 QPonto.ParamByName('sem').AsSmallInt:=QProfessor['dst_semref'];
 QPonto.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
 QPonto.ParamByName('periodo').AsSmallInt:=vperiodo;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('emp').AsSmallInt:=QProfessor['emp_codigo'];
 QPonto.ParamByName('vmes').AsSmallInt:=vmes;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_horafim'])) and
     ((vhorafim) >= (QPonto['pfp_horaini']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from eso_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_horaini']
   Then QProfPonto2['pfp_horaini']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_horafim']
   Then QProfPonto2['pfp_horafim']:=vhorafim;
   QProfPonto2.Post;
  End
 Else
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from eso_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_ano']:=QProfessor['dst_perlet'];
   QProfPonto2['pfp_semestre']:=QProfessor['dst_semref'];
   QProfPonto2['pfp_diasem']:=DayOfWeek(vdata);
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=QProfessor['emp_codigo'];
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
   QProfPonto2['pes_cpf']:=QProfessor['pes_cpf'];
   QProfPonto2['pfp_periodo']:=vperiodo;
   QProfPonto2['pfp_horaini']:=vhoraini;
   QProfPonto2['pfp_horafim']:=vhorafim;
   QProfPonto2['pfp_status']:=0;
   QProfPonto2['pfp_dtgerado']:=Pega_DataHora;
   QProfPonto2['pfp_mes']:=vmes;
   QProfPonto2.Post;
  End;
End;

Procedure Grava_Ponto_Ativ(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vperiodo,vperlet,vsemref:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct p.pfp_seq, pfp_iniprev, pfp_fimprev from fol_profponto p, fol_escalaprof e');
 QPonto.Sql.Add('where p.pfp_seq = e.pfp_seq and pfp_data =:vdata and fun_codigo =:matr and cur_codigo =:codcur');
 QPonto.Sql.Add('and pfp_status = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
 QPonto.Sql.Add('order by pfp_iniprev');
 QPonto.ParamByName('vdata').AsDate:=vdata;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('codcur').AsInteger:=vcurso;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_fimprev'])) and
     ((vhorafim) >= (QPonto['pfp_iniprev']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_iniprev']
   Then QProfPonto2['pfp_iniprev']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_fimprev']
   Then QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
   QProfPonto2.Post;
  End
 Else
  Begin
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula = 1 and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_data']:=vdata;
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=1;
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
   QProfPonto2['pfp_iniprev']:=vhoraini;
   QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempo']:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QProfPonto2.Post;
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
  End;
End;

Procedure Grava_Ponto_Ativ2(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vcampus,vperiodo,vperlet,vsemref:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct p.pfp_seq, pfp_iniprev, pfp_fimprev from fol_profponto p, fol_escalaprof e, sca_cursos c');
 QPonto.Sql.Add('where p.pfp_seq = e.pfp_seq and e.cur_codigo = c.cur_codigo and pfp_data =:vdata and fun_codigo =:matr and cur_campus =:campus');
 QPonto.Sql.Add('and pfp_status = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
 QPonto.Sql.Add('order by pfp_iniprev');
 QPonto.ParamByName('vdata').AsDate:=vdata;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('campus').AsInteger:=vcampus;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_fimprev'])) and
     ((vhorafim) >= (QPonto['pfp_iniprev']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_iniprev']
   Then QProfPonto2['pfp_iniprev']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_fimprev']
   Then QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
   QProfPonto2.Post;
  End
 Else
  Begin
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula = 1 and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_data']:=vdata;
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=1;
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
   QProfPonto2['pfp_iniprev']:=vhoraini;
   QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempo']:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2));
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QProfPonto2.Post;
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
  End;
End;

Procedure Grava_Ponto_Ativ3(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vunid,vperiodo,vperlet,vsemref,vrel:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct p.pfp_seq, pfp_iniprev, pfp_fimprev from fol_profponto p, fol_escalaprof e, sca_cursos c');
 QPonto.Sql.Add('where p.pfp_seq = e.pfp_seq and e.cur_codigo = c.cur_codigo and pfp_data =:vdata and fun_codigo =:matr and c.uni_codigo =:unid');
 QPonto.Sql.Add('and pfp_status = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
 QPonto.Sql.Add('order by pfp_iniprev');
 QPonto.ParamByName('vdata').AsDate:=vdata;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('unid').AsInteger:=vunid;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_fimprev'])) and
     ((vhorafim) >= (QPonto['pfp_iniprev']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_iniprev']
   Then QProfPonto2['pfp_iniprev']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_fimprev']
   Then QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
   QProfPonto2.Post;
  End
 Else
  Begin
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula = 1 and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_data']:=vdata;
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=1;
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
//   If vrel <> 0 // Existe relógio cadastrado na unidade
//   Then QProfPonto2['uni_codigo']:=vunid;
   QProfPonto2['uni_codigo']:=vunid;
   QProfPonto2['pfp_iniprev']:=vhoraini;
   QProfPonto2['pfp_fimprev']:=vhorafim;
   If (StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2))) <> 0
   Then QProfPonto2['pfp_tempo']:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2))
   Else QProfPonto2['pfp_tempo']:=60;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QProfPonto2.Post;
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
  End;
End;

Procedure Grava_Ponto_Ativ4(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula:TQuery;vcurso,vativ:integer;vdata,vhoraini,vhorafim:TDateTime;vunid,vperiodo,vperlet,vsemref:word);
var achou:boolean;
Begin
 QPonto.Close;
 QPonto.Sql.Clear;
 QPonto.Sql.Add('select distinct p.pfp_seq, pfp_iniprev, pfp_fimprev from fol_profponto p, fol_escalaprof e, sca_cursos c');
 QPonto.Sql.Add('where p.pfp_seq = e.pfp_seq and e.cur_codigo = c.cur_codigo and pfp_data =:vdata and fun_codigo =:matr and uni_codigo =:unid');
 QPonto.Sql.Add('and pfp_bateponto = "N"');
 QPonto.Sql.Add('order by pfp_iniprev');
 QPonto.ParamByName('vdata').AsDate:=vdata;
 QPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
 QPonto.ParamByName('unid').AsInteger:=vunid;
 QPonto.Open;
 QPonto.First;
 achou:=false;
 While not QPonto.Eof do
 Begin
  If ((vhoraini) <= (QPonto['pfp_fimprev'])) and
     ((vhorafim) >= (QPonto['pfp_iniprev']))
  Then
   Begin
    achou:=true;
    break;
   End;
  QPonto.Next;
 End;
 If achou
 Then
  Begin
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Sql.Add('where pfp_seq =:seq');
   QProfPonto2.ParamByName('seq').AsInteger:=QPonto['pfp_seq'];
   QProfPonto2.Open;
   QProfPonto2.Edit;
   If vhoraini < QProfPonto2['pfp_iniprev']
   Then QProfPonto2['pfp_iniprev']:=vhoraini;
   If vhorafim > QProfPonto2['pfp_fimprev']
   Then QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
   QProfPonto2.Post;
  End
 Else
  Begin
   QHorAula.Close;
   QHorAula.Sql.Clear;
   QHorAula.Sql.Add('select * from sca_horaula');
   QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula = 1 and hor_periodo =:periodo and');
   QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref and hor_tipaula = 0');
   QHorAula.ParamByName('codcur').AsSmallInt:=vcurso;
   QHorAula.ParamByName('periodo').AsSmallInt:=vperiodo;
   QHorAula.ParamByName('perlet').AsSmallInt:=vperlet;
   QHorAula.ParamByName('semref').AsSmallInt:=vsemref;
   QHorAula.Open;
   QProfPonto2.Close;
   QProfPonto2.RequestLive:=True;
   QProfPonto2.Sql.Clear;
   QProfPonto2.Sql.Add('select * from fol_profponto');
   QProfPonto2.Open;
   QProfPonto2.Insert;
   QProfPonto2['pfp_data']:=vdata;
   QProfPonto2['fun_codigo']:=QProfessor['fun_matr'];
   QProfPonto2['emp_codigo']:=1;
   QProfPonto2['pfp_tipofunc']:=QProfessor['fun_admprof'];
   QProfPonto2['pfp_iniprev']:=vhoraini;
   QProfPonto2['pfp_fimprev']:=vhorafim;
   QProfPonto2['pfp_bateponto']:='N';
   If (StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2))) <> 0
   Then QProfPonto2['pfp_tempo']:=StrToInt(Copy(TimeToStr(QHorAula['hor_horafim'] - QHorAula['hor_horaini']),4,2))
   Else QProfPonto2['pfp_tempo']:=60;
   QProfPonto2['pfp_tempodif']:=Calcula_Tempo(QProfPonto2);
   QProfPonto2.Post;
   QEscalaProf.Insert;
   QEscalaProf['pfp_seq']:=QProfPonto2['pfp_seq'];
   QEscalaProf['cur_codigo']:=vcurso;
   QEscalaProf['auc_seq']:=vativ;
   QEscalaProf.Post;
  End;
End;

Procedure GeraHorAtiv(perlet,semref,matr,curso:integer;vdataini,vdatafim:TDateTime);
var vdata:TDateTime;
    vperiodo, vunid, vaulaini, vaulafim, vtipoini, vtipofim:word;
Begin
 QProfessor:=TQuery.Create(FProcs);
 QProfessor.DatabaseName:='unoeste';
 QProfPonto:=TQuery.Create(FProcs);
 QProfPonto.DatabaseName:='unoeste';
 QEscalaProf:=TQuery.Create(FProcs);
 QEscalaProf.DatabaseName:='unoeste';
 QFeriado:=TQuery.Create(FProcs);
 QFeriado.DatabaseName:='unoeste';
 QReitProf:=TQuery.Create(FProcs);
 QReitProf.DatabaseName:='unoeste';
 QHorAula:=TQuery.Create(FProcs);
 QHorAula.DatabaseName:='unoeste';
 QDisc:=TQuery.Create(FProcs);
 QDisc.DatabaseName:='unoeste';
 QFer2Grau:=TQuery.Create(FProcs);
 QFer2Grau.DatabaseName:='unoeste';
 QReitProf2:=TQuery.Create(FProcs);
 QReitProf2.DatabaseName:='unoeste';
 QPonto:=TQuery.Create(FProcs);
 QPonto.DatabaseName:='unoeste';
 QProfPonto2:=TQuery.Create(FProcs);
 QProfPonto2.DatabaseName:='unoeste';

 QProfessor.Close;
 QProfessor.Sql.Clear;
 QProfessor.Sql.Add('select distinct fun_matr, fun_admprof, cam_codigo');
 QProfessor.Sql.Add('from sca_reitprof r, fol_funcionario f, sca_cursos c');
 QProfessor.Sql.Add('where r.fun_matr = f.fun_codigo and r.cur_codigo = c.cur_codigo and emp_codigo = 1 and dst_perlet =:perlet and dst_semref =:semref');
 If matr <> 0
 Then
  Begin
   QProfessor.Sql.Add('and fun_matr =:matr');
   QProfessor.ParamByName('matr').AsInteger:=matr;
  End
 Else
  Begin
   QProfessor.Sql.Add('and r.cur_codigo =:codcur');
   QProfessor.Sql.Add('and (rei_tipo = 11 or rei_tipo = 12)');
   QProfessor.ParamByName('codcur').AsInteger:=curso;
  End;
 QProfessor.ParamByName('perlet').AsSmallInt:=perlet;
 QProfessor.ParamByName('semref').AsSmallInt:=semref;
 QProfessor.Open;
 If not QProfessor.Eof
 Then
  Begin
   QProfessor.First;
   While not QProfessor.Eof do
   Begin
    QProfPonto.Close;
    QProfPonto.RequestLive:=False;
    QProfPonto.Sql.Clear;
    QProfPonto.Sql.Add('select min(pfp_data) as primdata from fol_profponto');
    QProfPonto.Sql.Add('where pfp_data between :vdataini and :vdatafim and fun_codigo =:matr and emp_codigo = 1');
    QProfPonto.Sql.Add('      and pfp_bateponto = "N"');
    QProfPonto.ParamByName('vdataini').AsDate:=vdataini;
    QProfPonto.ParamByName('vdatafim').AsDate:=vdatafim;
    QProfPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
    QProfPonto.Open;
    If QProfPonto['primdata'] <> Null
    Then vdata:=QProfPonto['primdata']
    Else vdata:=vdataini;

    QEscalaProf.Close;
    QEscalaProf.RequestLive:=False;
    QEscalaProf.Sql.Clear;
    QEscalaProf.Sql.Add('delete from fol_escalaprof');
    QEscalaProf.Sql.Add('where pfp_seq in (select pfp_seq from fol_profponto');
    QEscalaProf.Sql.Add('where pfp_data between :vdataini and :vdatafim and fun_codigo =:matr and emp_codigo = 1 and pfp_bateponto = "N" and pfp_tipofunc between 2 and 3)'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90)');
    QEscalaProf.ParamByName('vdataini').AsDate:=vdata;
    QEscalaProf.ParamByName('vdatafim').AsDate:=vdatafim;
    QEscalaProf.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
    QEscalaProf.ExecSql;
    QEscalaProf.Close;
    QEscalaProf.RequestLive:=True;
    QEscalaProf.Sql.Clear;
    QEscalaProf.Sql.Add('select * from fol_escalaprof');
    QEscalaProf.Open;

    QProfPonto.Close;
    QProfPonto.RequestLive:=False;
    QProfPonto.Sql.Clear;
    QProfPonto.Sql.Add('delete from fol_profponto');
    QProfPonto.Sql.Add('where pfp_data between :vdataini and :vdatafim and fun_codigo =:matr and emp_codigo = 1 and pfp_bateponto = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
    QProfPonto.ParamByName('vdataini').AsDate:=vdata;
    QProfPonto.ParamByName('vdatafim').AsDate:=vdatafim;
    QProfPonto.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
    QProfPonto.ExecSql;

    QProfPonto.Close;
    QProfPonto.RequestLive:=True;
    QProfPonto.Sql.Clear;
    QProfPonto.Sql.Add('select * from fol_profponto');
    QProfPonto.Open;

    While vdata <= vdatafim do
    Begin
     QFeriado.Close;
     QFeriado.Sql.Clear;
     QFeriado.Sql.Add('select * from sca_feriado');
     QFeriado.Sql.Add('where fer_data =:data and (cam_codigo = 999 or cam_codigo =:cod)');
     QFeriado.ParamByName('data').AsDate:=vdata;
     QFeriado.ParamByName('cod').AsInteger:=QProfessor['cam_codigo'];
     QFeriado.Open;
     If QFeriado.Eof
     Then
      Begin
       QReitProf.Close;
       QReitProf.Sql.Clear;
       QReitProf.Sql.Add('select distinct rei_periodo, uni_codigo, rei_aulaini, rei_aulafim, 0 as dis_controle from sca_reitprof r, sca_cursos c, sca_caldias cd');
       QReitProf.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and r.cur_codigo = c.cur_codigo and');
       QReitProf.Sql.Add('fun_matr =:matr and rei_tipo = 11 and rei_diasem =:diasem and rei_remunerada = 0');
       QReitProf.Sql.Add('and dst_perlet = cld_periodo and r.cur_codigo = cd.cur_codigo');
       If semref = 1 // 1º Semestre
       Then QReitProf.Sql.Add('and cld_diaini <=:vdata and cld_diafim >=:vdata')
       Else QReitProf.Sql.Add('and cld_inisem2 <=:vdata and cld_fimsem2 >=:vdata');
       QReitProf.Sql.Add('order by 1, 2');
       QReitProf.ParamByName('perlet').AsSmallInt:=perlet;
       QReitProf.ParamByName('semref').AsSmallInt:=semref;
       QReitProf.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
       QReitProf.ParamByName('diasem').AsSmallInt:=DayOfWeek(vdata);
       QReitProf.ParamByName('vdata').AsDate:=vdata;
       QReitProf.Open;
       If not QReitProf.Eof
       Then
        Begin
         vperiodo:=QReitProf['rei_periodo'];
         vunid:=QReitProf['uni_codigo'];
         vaulaini:=QReitProf['rei_aulaini'];
         vaulafim:=QReitProf['rei_aulafim'];
         vtipoini:=QReitProf['dis_controle'];
         vtipofim:=QReitProf['dis_controle'];
         QReitProf.First;
         While not QReitProf.Eof do
         Begin
          If vperiodo <> QReitProf['rei_periodo']
          Then
           Begin
            Grava_HorAtiv(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau,vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,perlet,semref,vdata);
            vperiodo:=QReitProf['rei_periodo'];
            vunid:=QReitProf['uni_codigo'];
            vaulaini:=QReitProf['rei_aulaini'];
            vaulafim:=QReitProf['rei_aulafim'];
            vtipoini:=QReitProf['dis_controle'];
            vtipofim:=QReitProf['dis_controle'];
           End
          Else
           If vunid <> QReitProf['uni_codigo']
           Then
            Begin
             Grava_HorAtiv(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau,vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,perlet,semref,vdata);
             vperiodo:=QReitProf['rei_periodo'];
             vunid:=QReitProf['uni_codigo'];
             vaulaini:=QReitProf['rei_aulaini'];
             vaulafim:=QReitProf['rei_aulafim'];
             vtipoini:=QReitProf['dis_controle'];
             vtipofim:=QReitProf['dis_controle'];
            End
           Else
            If QReitProf['rei_aulaini'] > vaulafim + 1
            Then
             Begin
              Grava_HorAtiv(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau,vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,perlet,semref,vdata);
              vperiodo:=QReitProf['rei_periodo'];
              vunid:=QReitProf['uni_codigo'];
              vaulaini:=QReitProf['rei_aulaini'];
              vaulafim:=QReitProf['rei_aulafim'];
              vtipoini:=QReitProf['dis_controle'];
              vtipofim:=QReitProf['dis_controle'];
             End
            Else
             Begin
              vaulafim:=QReitProf['rei_aulafim'];
              vtipofim:=QReitProf['dis_controle'];
             End;
          QReitProf.Next;
         End;
         Grava_HorAtiv(QProfPonto,QProfessor,QHorAula,QDisc,QEscalaProf,QFeriado,QFer2Grau,vperiodo,vunid,vaulaini,vaulafim,vtipoini,vtipofim,perlet,semref,vdata);
        End;
      End;
     QReitProf2.Close;
     QReitProf2.Sql.Clear;
     QReitProf2.Sql.Add('select * from sca_reitprof r, sca_cursos c');
     QReitProf2.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and');
     QReitProf2.Sql.Add('fun_matr =:matr and rei_tipo = 12 and rei_data =:vdata and rei_remunerada = 0 and');
     QReitProf2.Sql.Add('r.cur_codigo = c.cur_codigo');
     QReitProf2.Sql.Add('order by rei_periodo, rei_horaini');
     QReitProf2.ParamByName('perlet').AsSmallInt:=perlet;
     QReitProf2.ParamByName('semref').AsSmallInt:=semref;
     QReitProf2.ParamByName('matr').AsInteger:=QProfessor['fun_matr'];
     QReitProf2.ParamByName('vdata').AsDate:=vdata;
     QReitProf2.Open;
     QReitProf2.First;
     While not QReitProf2.Eof do
     Begin
      Grava_Ponto_Ativ4(QPonto,QProfPonto2,QEscalaProf,QProfessor,QHorAula,QReitProf2['cur_codigo'],QReitProf2['auc_seq'],vdata,
                        QReitProf2['rei_horaini'],QReitProf2['rei_horfim'],QReitProf2['uni_codigo'],QReitProf2['rei_periodo'],perlet,semref);
      QReitProf2.Next;
     End;
     vdata:=vdata + 1;
    End;
    QProfessor.Next;
   End;
  End
 Else
  If matr <> 0 // Professor pode ter ponto gerado
  Then
   Begin
    QProfPonto.Close;
    QProfPonto.RequestLive:=False;
    QProfPonto.Sql.Clear;
    QProfPonto.Sql.Add('select min(pfp_data) as primdata from fol_profponto');
    QProfPonto.Sql.Add('where pfp_data between :vdataini and :vdatafim and fun_codigo =:matr and emp_codigo = 1 and pfp_bateponto = "N"');
    QProfPonto.ParamByName('vdataini').AsDate:=vdataini;
    QProfPonto.ParamByName('vdatafim').AsDate:=vdatafim;
    QProfPonto.ParamByName('matr').AsInteger:=matr;
    QProfPonto.Open;
    If QProfPonto['primdata'] <> Null
    Then vdata:=QProfPonto['primdata']
    Else vdata:=vdataini;

    QEscalaProf.Close;
    QEscalaProf.RequestLive:=False;
    QEscalaProf.Sql.Clear;
    QEscalaProf.Sql.Add('delete from fol_escalaprof');
    QEscalaProf.Sql.Add('where pfp_seq in (select pfp_seq from fol_profponto');
    QEscalaProf.Sql.Add('where pfp_data between :vdataini and :vdatafim and fun_codigo =:matr and emp_codigo = 1 and pfp_bateponto = "N" and pfp_tipofunc between 2 and 3)'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90)');
    QEscalaProf.ParamByName('vdataini').AsDate:=vdata;
    QEscalaProf.ParamByName('vdatafim').AsDate:=vdatafim;
    QEscalaProf.ParamByName('matr').AsInteger:=matr;
    QEscalaProf.ExecSql;
    QEscalaProf.Close;
    QEscalaProf.RequestLive:=True;
    QEscalaProf.Sql.Clear;
    QEscalaProf.Sql.Add('select * from fol_escalaprof');
    QEscalaProf.Open;

    QProfPonto.Close;
    QProfPonto.RequestLive:=False;
    QProfPonto.Sql.Clear;
    QProfPonto.Sql.Add('delete from fol_profponto');
    QProfPonto.Sql.Add('where pfp_data between :vdataini and :vdatafim and fun_codigo =:matr and emp_codigo = 1 and pfp_bateponto = "N" and pfp_tipofunc between 2 and 3'); // pfp_tipofunc <> 1 and pfp_tipofunc <> 90');
    QProfPonto.ParamByName('vdataini').AsDate:=vdata;
    QProfPonto.ParamByName('vdatafim').AsDate:=vdatafim;
    QProfPonto.ParamByName('matr').AsInteger:=matr;
    QProfPonto.ExecSql;
   End;
   
 QProfessor.Destroy;
 QProfPonto.Destroy;
 QEscalaProf.Destroy;
 QFeriado.Destroy;
 QReitProf.Destroy;
 QHorAula.Destroy;
 QDisc.Destroy;
 QFer2Grau.Destroy;
 QReitProf2.Destroy;
 QPonto.Destroy;
 QProfPonto2.Destroy;
End;

Function Media_Semanal(totaulas:Integer):Integer;
Begin
  Result:=Round(totaulas/31); // 5,25 semanas vezes 6 meses
End;

Function DtProva_Valida(vdata:TDateTime;perlet,semref:word):Boolean;
var vdia,vmes,vano:word;
    diferenca:shortint;
Begin
 DecodeDate(vdata,vano,vmes,vdia);
 diferenca:=perlet - vano;
 If semref = 1 // 1º Semestre
 Then
  Begin
   If ((diferenca = 0) or (diferenca = 1))
   Then Result:=True
   Else Result:=False;
  End
 Else
  If ((diferenca = -1) or (diferenca = 0))
  Then Result:=True
  Else Result:=False;
End;

Procedure Confirma_Horario(QCalendario,QCadHor,qconsdis:TQuery;vdata:TDateTime;unica:boolean);
var d,m,a,bim:word;
Begin
  DecodeDate(vdata,a,m,d);
  If m <= 4
  Then bim:=1
  Else
   If m <= 7
   Then bim:=2
   Else
    If m <= 9
    Then bim:=3
    Else bim:=4;
  If QCalendario['cal_nrlista1'] <> 0
  Then
   Begin
    QCadHor.Insert;
    QCadHor['dst_codtur']:=QCalendario['dst_codtur'];
    QCadHor['hor_data']:=vdata;
    If (QCalendario['cal_nroaulas'] <> QCalendario['cal_nrlista1']) or (not unica)
    Then QCadHor['hor_nrlista']:=1  // 1ª Lista
    Else QCadHor['hor_nrlista']:=3; // Lista Única
    QCadHor['dst_perlet']:=QCalendario['dst_perlet'];
    QCadHor['dst_semref']:=QCalendario['dst_semref'];
    QCadHor['dis_codigo']:=QCalendario['dis_codigo'];
    QCadHor['lab_turma']:=QCalendario['lab_turma'];
    QCadHor['hor_periodo']:=QCalendario['cal_periodo'];
    QCadHor['hor_nroaula1']:=QCalendario['cal_nrlista1'];
    QCadHor['hor_bimestre']:=bim;
    QCadHor['hor_controle']:=0;
    QCadHor['hor_aulaini']:=QCalendario['cal_aula'];
    If qconsdis['cur_gradistancia'] = 'S' // curso de graduação a distância deve-se deixar os dias letivos como padrão não presencial
    Then QCadHor['hor_presencial']:=1
    Else QCadHor['hor_presencial']:=QCalendario['cal_presencial'];
    QCadHor.Post;
   End; 
  If QCalendario['cal_nrlista2'] <> 0
  Then
   Begin
    QCadHor.Insert;
    QCadHor['dst_codtur']:=QCalendario['dst_codtur'];
    QCadHor['hor_data']:=vdata;
    QCadHor['hor_nrlista']:=2;
    QCadHor['dst_perlet']:=QCalendario['dst_perlet'];
    QCadHor['dst_semref']:=QCalendario['dst_semref'];
    QCadHor['dis_codigo']:=QCalendario['dis_codigo'];
    QCadHor['lab_turma']:=QCalendario['lab_turma'];
    QCadHor['hor_periodo']:=QCalendario['cal_periodo'];
    QCadHor['hor_nroaula1']:=QCalendario['cal_nrlista2'];
    QCadHor['hor_bimestre']:=bim;
    QCadHor['hor_controle']:=0;
    QCadHor['hor_aulaini']:=QCalendario['cal_aula'];
    If qconsdis['cur_gradistancia'] = 'S' // curso de graduação a distância deve-se deixar os dias letivos como padrão não presencial
    Then QCadHor['hor_presencial']:=1
    Else QCadHor['hor_presencial']:=QCalendario['cal_presencial'];
    QCadHor.Post;
   End;
End;

Procedure Grava_Sem(QCalendario,QFeriado,QCadHor,QDiscTur,qconsdis:TQuery;diaini,diafim:TDateTime);
var vdata:TDateTime;
    Dia: Array[1..7] of String;
    unica:boolean;
Begin
  Dia[1]:='DOMINGO';
  Dia[2]:='SEGUNDA';
  Dia[3]:='TERCA';
  Dia[4]:='QUARTA';
  Dia[5]:='QUINTA';
  Dia[6]:='SEXTA';
  Dia[7]:='SABADO';
  vdata:=diaini;
  unica:=true;
  While not QCalendario.Eof do
  Begin
   If QCalendario['cal_nrlista2'] <> 0
   Then
    Begin
     unica:=false;
     break;
    End; 
   QCalendario.Next;
  End;
  QCalendario.First;
  While not QCalendario.Eof do
  Begin
   While Dia[DayOfWeek(vdata)] <> QCalendario['cal_diasem'] do
    vdata:=vdata+1;
   While vdata <= diafim do
   Begin
    If QDiscTur['dst_feriado'] = 'N' // Não considerar feriados
    Then
     Begin
      QFeriado.Close;
      QFeriado.Sql.Clear;
      If (qconsdis['cur_codigo'] = 90) or (qconsdis['cur_codigo'] = 91) or (qconsdis['cur_codigo'] = 113)
      Then QFeriado.Sql.Add('select * from sca_fercol where fer_data =:data')
      Else
       Begin
         If (qconsdis['cur_grapos'] = 8) // Ensino Médio
         Then QFeriado.Sql.Add('select * from sca_fer2grau where fer_data =:data')
         Else QFeriado.Sql.Add('select * from sca_feriado where fer_data =:data');
         QFeriado.Sql.Add('and (cam_codigo = 999 or cam_codigo =:cod)');
         QFeriado.ParamByName('cod').AsInteger:=qconsdis['cam_codigo'];
       End;
      QFeriado.ParamByName('data').AsDate:=vdata;
      QFeriado.Open;
      If QFeriado.Eof
      Then Confirma_Horario(QCalendario,QCadHor,qconsdis,vdata,unica);
     End
    Else Confirma_Horario(QCalendario,QCadHor,qconsdis,vdata,unica);
    vdata:=vdata+7;
   End;
   vdata:=diaini;
   QCalendario.Next;
  End;
End;

Function Retorna_Porta:PChar;
var Device, Driver, Port : Pchar;
    HdeviceMode: Thandle;
Begin
 Printer.GetPrinter(device, driver, port, HdeviceMode);
 Result:=port;
End;

Procedure Zera_Campos(Tabela:TQuery);
var i:integer;
Begin
  for i:=0 to Tabela.fieldcount -1 do
  begin
   if (Tabela.Fields[i].required) and (Trim(Tabela.Fields[i].asstring)='') then
       Tabela.Fields[i].value:=null;
  end;
End;

function ultimo_dia(data : tdatetime):integer;
var
 ano,dia,mes : word;
 vdata : tdatetime;
begin
 decodedate(data,ano,mes,dia);
 if mes = 12 then
  vdata := (encodedate((ano+1),1,1)) -1
 else
  vdata := (encodedate(ano,(mes+1),1)) -1;
 decodedate(vdata,ano,mes,dia);
 ultimo_dia := dia; // nro de dias do mes
end;

Procedure Filtra_Ocorrencia(Q:TQuery;vnivel,vcodusu:integer);
Begin
 If (vnivel <> 1) and (vnivel <> 27) and (vnivel <> 35) and (vnivel <> 36)
 Then
  Begin
   Q.Sql.Add('and o.fun_matr =:matr');
   Q.ParambyName('matr').AsInteger:=vcodusu;
  End;
End;

Procedure Filtra_Unidade3(Q:TQuery;vunidade:integer);
Begin
 If (vunidade <> 999) and (vunidade <> 0)
 Then
  Begin
   Q.Sql.Add('where uni_codigo in (select uni_codigo from sca_cursos where cam_codigo =:unid)');
   Q.ParamByName('unid').AsInteger:=vunidade;
  End;
End;

Function ALinhaDir2(Texto: String; Tamanho: Word): String;
Begin
 If Tamanho-Length(Texto) > 0
 Then AlinhaDir2:=Replicate(' ',Tamanho-Length(Texto))+Texto
 Else AlinhaDir2:=Texto;
End;

function Replicate(value: String; qtde: Word): String;
begin
   if (Length(value)>=qtde) then
      Replicate:=Copy(value,1,qtde)
   else
      Replicate:=Replicate(value+value,qtde);
end;

Function ALinhaEsq(Texto: String; Tamanho: Word): String;
Begin
 If Tamanho-Length(Texto) > 0
 Then AlinhaEsq:=Texto+Replicate(' ',Tamanho-Length(Texto))
 Else AlinhaEsq:=Texto;
End;

Procedure Habilita_Ordem(RG:TRadioGroup;vcodusu:integer);
Begin
  If (vcodusu = 43065) or (vcodusu = 9308) or (vcodusu = 0)
  Then RG.Visible:=True;
End;

Function Trata_Acento(XTEXTO : String;tipo:word) : String;
Var I, XPOS:integer;
    AUX1, AUX2, AUX3, AUX:String;
Begin
  AUX1:='ÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÑ';
  AUX2:='áàãâäéèêëíìîïóòõôöúùûüçñ';
  AUX3:='';
  If tipo = 1 // Converte para minúsculo
  Then AUX3:=LowerCase(Trim(XTEXTO))
  Else AUX3:=UpperCase(Trim(XTEXTO));
  AUX:='';
  For I:=1 to Length(AUX3) do
  Begin
   If tipo = 1 // Converte para minúsculo
   Then
    Begin
     XPOS:=Pos(AUX3[I],AUX1);
     If XPOS <> 0
     Then AUX:=AUX + AUX2[XPOS]
     Else AUX:=AUX + AUX3[I];
    End
   Else
    Begin
     XPOS:=Pos(AUX3[I],AUX2);
     If XPOS <> 0
     Then AUX:=AUX + AUX1[XPOS]
     Else AUX:=AUX + AUX3[I];
    End;
  End;
  RESULT:=AUX;
End;

Function GetCurrentPrinterHandle: THandle;
  Const
    Defaults: TPrinterDefaults = (
      pDatatype : nil;
      pDevMode  : nil;
      DesiredAccess : PRINTER_ACCESS_USE or PRINTER_ACCESS_ADMINISTER );
  Var
    Device, Driver, Port : array[0..255] of char;
    hDeviceMode: THandle;
  Begin { GetCurrentPrinterHandle }
    Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
    If not OpenPrinter(@Device, Result, @Defaults) Then
      RaiseLastWin32Error;
  End; { GetCurrentPrinterHandle }

Function PortaImpressora: String;
var porta:string;
var
hPrinter : THandle;
pInfo: PPrinterInfo2;
bytesNeeded: DWORD;
begin
hprinter := GetCurrentPrinterHandle;
try
Winspool.GetPrinter( hPrinter, 2, Nil, 0, @bytesNeeded );
pInfo := AllocMem( bytesNeeded );
try
Winspool.GetPrinter( hPrinter, 2, pInfo, bytesNeeded, @bytesNeeded );
//Result := pInfo^.Status;
porta:=pInfo^.pPortName;
{If Copy(porta,length(porta),1) = ':'
Then porta:=Copy(porta,1,length(porta) - 1);}
Result:=porta;
finally
FreeMem( pInfo );
end;
finally
ClosePrinter( hPrinter );
end;
end;

Function OnLine(Porta:Word):Boolean;  // Para Windows 98
Const
PrnStInt : Byte = $17;
Portas :Byte = $02;
Var
Res :Byte;
Begin
{ Código em Assembler }
Asm
mov ah,Portas; {Requisita o acesso as portas}
mov dx,Porta;{Define a porta de teste 0 - LPT1, 1 - LPT2}
Int $17; {Chama a interrupção de Impressora}
mov Res,ah; {Guarda em Res o resultado da operação }
end;
Result := (Res and $80) = $80; {Testa o valor de saída}
End;


{   If MD_Testao.Locate('ra',Q_Aludis['alu_ra'],[locaseinsensitive])
   Then
    Begin
     MD_Testao.Edit;
     MD_Testao['testao'] := CETestao.Value;
     MD_Testao.Post;
    End
   Else
    Begin
     MD_Testao.Append;
     MD_Testao['ra'] := Q_aludis['alu_ra'];
     MD_Testao['nome'] := Q_aludis['pes_nome'];
     MD_Testao['pes_sacento'] := Q_aludis['pes_sacento'];
     MD_Testao['testao'] := CETestao.Value;
     MD_Testao.Post;
     MD_Testao.SortOnFields('pes_sacento');
    End;
}

// ---------------------- Rotinas do Histórico ---------------------------------

Procedure Invisivel(TF:TForm; N:Word);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount - 1 do
  Begin
    If (Components[I] is TppLabel) and (Components[I].Tag = N) Then
      TppLabel(Components[I]).Visible:=False;
    If (Components[I] is TppLine) and (Components[I].Tag = N) Then
      TppLine(Components[I]).Visible:=False;
    If (Components[I] is TppShape) and (Components[I].Tag = N) Then
      TppShape(Components[I]).Visible:=False;
  End;
End;

Procedure Visivel(TF:TForm; N:Word);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount - 1 do
  Begin
    If (Components[I] is TppLabel) and (Components[I].Tag = N) Then
      TppLabel(Components[I]).Visible:=True;
    If (Components[I] is TppLine) and (Components[I].Tag = N) Then
      TppLine(Components[I]).Visible:=True;
    If (Components[I] is TppShape) and (Components[I].Tag = N) Then
      TppShape(Components[I]).Visible:=True;
  End;
End;

Function Imp_Curso_Hist(QDadAlu,QConsHab:TQuery;licenca,rec:string):string;
Begin
 If (QDadAlu['cur_codigo'] = 22) and (QConsHab['hab_codigo'] = 15) // Letras tronco comum
 Then Result:='CURSO : LETRAS - LICENCIATURA DE 1º GRAU - HABILITAÇÃO EM PORTUGUÊS/INGLÊS' // tive que colocar o nome novo para todas as habilitações pois quem cursa o tronco comum deve sair também
 Else
  If (QDadAlu['cur_codigo'] = 22) and (QConsHab['hab_codigo'] <> 17) // Letras com habilitação em português/inglês e tronco comum
  Then Result:='CURSO : LETRAS - PORTUGUÊS/INGLÊS E RESPECTIVAS LITERATURAS - LICENCIATURA' // tive que colocar o nome novo para todas as habilitações pois quem cursa o tronco comum deve sair também
  Else
   If QDadAlu['cur_codigo'] = 112 // Sup. de Tecnologia em Desenvolvimento Web
   Then
    Begin
     If ((QDadAlu['alu_anoing'] = 2005) and (QDadAlu['alu_seming'] = 1)) or (QDadAlu['alu_anoing'] < 2005)
     Then Result:='CURSO SUP. DE TECNOLOGIA EM INFORMÁTICA - MOD.: DESENV. WEB'+licenca+rec
     Else Result:='CURSO '+NULLToSpace(QDadAlu['cur_nome'])+licenca+rec;
    End
   Else
    If QDadAlu['cur_codigo'] = 311 // Estudos Complementares em Educação Infantil
    Then Result:='CURSO : PEDAGOGIA - LICENCIATURA - REC. DEC. LEI Nº75.361/75 D.O.U. 14/02/1975 - RENOV. DO REC. PORT. Nº1.096 D.O.U. 30/12/2015'
    Else
     If QDadAlu['cur_area'] = 6 // Tecnologia
     Then Result:='CURSO '+NULLToSpace(QDadAlu['cur_nome'])+licenca+rec
     Else Result:='CURSO : '+NULLToSpace(QDadAlu['cur_nome'])+licenca+rec;
End;

Procedure Imp_Fac_Aut_Rec2(qconshab,QDadAlu,qconsccl:TQuery;var licenca,rec:string;var LTitFac,LFac,LHab,LHab2,LRec:TppLabel);
var vdia,vmes,vano:word;
Begin
 licenca:='';
 If QDadAlu['cur_area'] = 1 // Ensino Médio
 Then
  Begin
   LTitFac.Caption:='';
   LFac.Caption:='COLÉGIO UNOESTE - ENSINO MÉDIO E PROFISSIONAL';
   LHab.Caption:='';
   LHab2.Caption:='';
   If QDadAlu['cur_autdata'] <> Null
   Then LRec.Caption:='Aut. pela Portaria DER-PP de '+NULLToSpace(QDadAlu['cur_autndc'])+', publicada em '+DateToStr(QDadAlu['cur_autdata'])
   Else LRec.Caption:='Aut. pela Portaria DER-PP de '+NULLToSpace(QDadAlu['cur_autndc'])+', publicada em ';
  End
 Else
  Begin
   LTitFac.Caption:='Faculdade';
   If (QDadAlu['cur_area'] = 6) or (QDadAlu['cur_codigo'] = 133) // Tecnologia, Turismo ou Eng. Ambiental // Tecnologia ou Turismo
   Then LFac.Caption:=''
   Else LFac.Caption:=NULLToSpace(QDadAlu['fac_completo']);
   If qconshab['hab_licenca'] <> null
   Then
    Begin
     Case qconshab['hab_licenca'] of
       1:licenca:=' - LICENCIATURA DE 1º GRAU';
       2:licenca:=' - LICENCIATURA'; // ' - LICENCIATURA PLENA';
       3:licenca:=' - LICENCIATURA PLENA PARA LICENCIADOS';
     End;
    End;
   If (qconshab['hab_ligacao'] <> 0) and (qconshab['hab_ligacao'] <> Null)
   Then
    Begin
     If (QDadAlu['cur_codigo'] = 22) and (qconshab['hab_codigo'] <> 17) // Letras com habilitação em português/inglês e tronco comum
     Then
      Begin
       LHab.Caption:='';
       LHab2.Caption:='';
      End
     Else
      Begin
       LHab.Caption:=qconshab['hab_nomhb1'];
       LHab2.Caption:=NULLToSpace(qconshab['hab_nomhb2']);
      End;
     If NULLToSpace(qconshab['hab_autdoc']) <> ''
     Then
      Begin
       DecodeDate(qconshab['hab_autdat'],vano,vmes,vdia);
       vano:=Acerta_Ano(vano);
       If qconshab['cur_codigo'] = 4   //Farmacia
       Then
        Begin
         If qconshab['hab_autdcp'] = 1
         Then LRec.Caption:='AUT. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
         Else LRec.Caption:='REC. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
        End
       Else
        Begin
         If qconshab['hab_autdcp'] = 1
         Then
          Begin
//           If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
           If vano > 1982
           Then LRec.Caption:='AUT. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
           Else LRec.Caption:='AUT. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
          End
         Else
          Begin
//           If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
           If vano > 1982
           Then LRec.Caption:='REC. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
           Else LRec.Caption:='REC. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
          End;
        End;
      End;
    End
   Else
    Begin
     LHab.Caption:='';
     LHab2.Caption:='';
     If NULLToSpace(QDadAlu['cur_autndc']) <> ''
     Then
      Begin
       DecodeDate(QDadAlu['cur_autdata'],vano,vmes,vdia);
       vano:=Acerta_Ano(vano);
       If QDadAlu['cur_codigo'] = 4  //Farmacia
       Then
        Begin
         If qconsccl['ahb_codgra'] >= 17 // Deve aparecer resolução
         Then licenca:=' - RES. Nº 2 CNE/CES, DE 19/02/2002';
         If QDadAlu['cur_autdcp'] = 1
         Then LRec.Caption:='AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
         Else LRec.Caption:='REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
        End
       Else
        Begin
         If QDadAlu['cur_autdcp'] = 3 // Autorização UNOESTE
         Then LRec.Caption:='AUT. PORT. N°'+QDadAlu['cur_autndc']+' - CONSU/UNOESTE, DE '+DateToStr(QDadAlu['cur_autdata'])
         Else
          If QDadAlu['cur_autdcp'] = 1 // Autorização
          Then
           Begin
{            If (QDadAlu['cur_codigo'] = 28) or (QDadAlu['cur_codigo'] = 133) or (QDadAlu['cur_codigo'] = 143) or
               (QDadAlu['cur_codigo'] = 144) or (QDadAlu['cur_codigo'] = 145) or (QDadAlu['cur_codigo'] = 170)
            Then LRec.Caption:='AUT. PORT. N°'+QDadAlu['cur_autndc']+' - CONSU/UNOESTE, DE '+DateToStr(QDadAlu['cur_autdata'])
            Else}
 //            If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
             If vano > 1982
             Then LRec.Caption:='AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
             Else LRec.Caption:='AUT. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
           End
          Else
           Begin
 //           If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
            If vano > 1982
            Then LRec.Caption:='REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
 //           Else LRec.Caption:='REC. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
            Else LRec.Caption:='REC. DEC. N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']); // Alteração realizada dia 19/10/2006 de DEC. LEI somente para DEC.
           End;
         rec:=LRec.Caption;
         Acerta_LicRec(QDadAlu['cur_codigo'],qconsccl['ahb_codgra'],licenca,rec);
         LRec.Caption:=rec;
        End;
      End;
    End;
  End;
End;

Procedure Desloca(TF:TForm; N:Word; Cima,Baixo,Esq,Dir:Real);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount - 1 do
  Begin
    If (Components[I] is TppLabel) and (Components[I].Tag = N)
    Then
     Begin
      TppLabel(Components[I]).Top:=TppLabel(Components[I]).Top - Cima;
      TppLabel(Components[I]).Top:=TppLabel(Components[I]).Top + Baixo;
      TppLabel(Components[I]).Left:=TppLabel(Components[I]).Left + Esq;
      TppLabel(Components[I]).Left:=TppLabel(Components[I]).Left - Dir;
     End;
    If (Components[I] is TppLine) and (Components[I].Tag = N)
    Then
     Begin
      TppLine(Components[I]).Top:=TppLine(Components[I]).Top - Cima;
      TppLine(Components[I]).Top:=TppLine(Components[I]).Top + Baixo;
      TppLine(Components[I]).Left:=TppLine(Components[I]).Left + Esq;
      TppLine(Components[I]).Left:=TppLine(Components[I]).Left - Dir;
     End;
    If (Components[I] is TppShape) and (Components[I].Tag = N)
    Then
     Begin
      TppShape(Components[I]).Top:=TppShape(Components[I]).Top - Cima;
      TppShape(Components[I]).Top:=TppShape(Components[I]).Top + Baixo;
      TppShape(Components[I]).Left:=TppShape(Components[I]).Left + Esq;
      TppShape(Components[I]).Left:=TppShape(Components[I]).Left - Dir;
     End;
    If (Components[I] is TppDBCalc) and (Components[I].Tag = N)
    Then
     Begin
      TppDBCalc(Components[I]).Top:=TppDBCalc(Components[I]).Top - Cima;
      TppDBCalc(Components[I]).Top:=TppDBCalc(Components[I]).Top + Baixo;
      TppDBCalc(Components[I]).Left:=TppDBCalc(Components[I]).Left + Esq;
      TppDBCalc(Components[I]).Left:=TppDBCalc(Components[I]).Left - Dir;
     End;
    If (Components[I] is TppMemo) and (Components[I].Tag = N)
    Then
     Begin
      TppMemo(Components[I]).Top:=TppMemo(Components[I]).Top - Cima;
      TppMemo(Components[I]).Top:=TppMemo(Components[I]).Top + Baixo;
      TppMemo(Components[I]).Left:=TppMemo(Components[I]).Left + Esq;
      TppMemo(Components[I]).Left:=TppMemo(Components[I]).Left - Dir;
     End;
  End;
End;

Procedure Imp_Livro_Folha_DatReg(qconsccl,QDadAlu:TQuery;var LNLivro2,LNFolha2,LDatReg2:TppLabel);
Begin
 If qconsccl['ahb_nrlivro'] <> Null
 Then LNLivro2.Caption:=qconsccl['ahb_nrlivro']
 Else
  If QDadAlu['alu_nrlivro'] <> Null
  Then
   Begin
    If QDadAlu['alu_nrlivro'] <> '0000'
    Then LNLivro2.Caption:=QDadAlu['alu_nrlivro']
    Else LNLivro2.Caption:='****';
   End
  Else LNLivro2.Caption:='';
 If qconsccl['ahb_nrfolha'] <> Null
 Then LNFolha2.Caption:=qconsccl['ahb_nrfolha']
 Else
  If QDadAlu['alu_nrfolha'] <> Null
  Then
   Begin
    If QDadAlu['alu_nrfolha'] <> '00000'
    Then LNFolha2.Caption:=QDadAlu['alu_nrfolha']
    Else LNFolha2.Caption:='*****';
   End
  Else LNFolha2.Caption:='';
 If qconsccl['ahb_datreg'] <> Null
 Then LDatReg2.Caption:=DateToStr(qconsccl['ahb_datreg'])
 Else
  If QDadAlu['alu_datreg'] <> Null
  Then LDatReg2.Caption:=DateToStr(QDadAlu['alu_datreg'])
  Else LDatReg2.Caption:='********';
End;

Procedure Imp_Qualif_Hab(qconsccl,QDadAlu,qconshab:TQuery;var LTitQua,LQualif,LIngresso,LDatConcl:TppLabel);
Begin
 If QDadAlu['cur_pronatec'] = 'S'
 Then
  Begin
    LTitQua.Caption:='Habilitação';
    LQualif.Caption:=QDadAlu['cur_nome'];
  End
 Else
  Begin
    LQualif.Caption:='';
    If qconsccl['hab_codigo'] = 1 // Tronco Comum
    Then LTitQua.Caption:='Qualificação'
    Else LTitQua.Caption:='Habilitação';
  End;
 LIngresso.Caption:='';
 LDatConcl.Caption:='';
 If qconshab['hab_codigo'] <> 1
 Then LQualif.Caption:=qconshab['hab_nomhb1']
 Else
  Begin
   Case QDadAlu['cur_codigo'] of
    135:LQualif.Caption:='AUXILIAR TÉCNICO EM PATOLOGIA CLÍNICA';
    151:LQualif.Caption:='AUXILIAR TÉCNICO EM FARMÁCIA';
    152:LQualif.Caption:='AUXILIAR DE ENFERMAGEM';
   End;
  End;
 If (QDadAlu['alu_anoing'] <> Null) and (QDadAlu['alu_seming'] <> Null)
 Then LIngresso.Caption:=IntToStr(QDadAlu['alu_seming'])+'/'+IntToStr(QDadAlu['alu_anoing']);
 If qconsccl['ahb_conclusao'] <> Null
 Then LDatConcl.Caption:=DateToStr(qconsccl['ahb_conclusao']);
End;

Procedure Imp_ObsCompl(QObsCompl:TQuery;var LObsCompl,LNomObs4:TppLabel);
Begin
 LObsCompl.Caption:='';
 LNomObs4.Font.Style:=[];
 If (Pos('@',NULLToSpace(QObsCompl['obc_caracter'])) = 0) and (Trim(NULLToSpace(QObsCompl['obc_caracter'])) <> '')
 Then LObsCompl.Caption:='('+NULLToSpace(QObsCompl['obc_caracter'])+')'
 Else
  If (Pos('@',NULLToSpace(QObsCompl['obc_caracter'])) <> 0) and (Pos('Res. CNE/CP nº 3',NULLToSpace(QObsCompl['obs_observ2'])) <> 0) // Texto da Competência
  Then LNomObs4.Font.Style:=[fsBold,fsUnderline];
End;

Function Achou_Adicional(MT:TMemoryTable;Q:TQuery):Boolean;
var achou:boolean;
Begin
 achou:=false;
 MT.First;
 While not MT.Eof do
 Begin
  If (Q['adi_nro'] = MT['adi_nro']) and (Q['hab_codigo'] = MT['hab_codigo'])
  Then
   Begin
    achou:=true;
    break;
   End;
  MT.Next;
 End;
 If achou
 Then Achou_Adicional:=true
 Else
  Begin
   MT.Append;
   MT['adi_nro']:=Q['adi_nro'];
   MT['hab_codigo']:=Q['hab_codigo'];
   MT.Post;
   Achou_Adicional:=False;
  End;
End;

Function Achou_Disciplina(MT:TMemoryTable;Q:TQuery):Boolean;
var achou:boolean;
Begin
 achou:=false;
 MT.First;
 While not MT.Eof do
 Begin
  If (Q['his_anoref'] = MT['his_anoref']) and (Q['his_semref'] = MT['his_semref']) and
     ((Q['dis_codigo'] = MT['dis_codigo']) or (NULLToZero(Q['his_disequ']) = MT['dis_codigo']))
  Then
   Begin
    achou:=true;
    break;
   End;
  MT.Next;
 End;
 If achou
 Then Achou_Disciplina:=true
 Else
  Begin
   MT.Append;
   MT['his_anoref']:=Q['his_anoref'];
   MT['his_semref']:=Q['his_semref'];
   If Q['his_disequ'] <> Null
   Then MT['dis_codigo']:=Q['his_disequ']
   Else MT['dis_codigo']:=Q['dis_codigo'];
   MT.Post;
   Achou_Disciplina:=False;
  End;
End;

Procedure Acerta_Media(media:string;var DBTMedFin:TppDBText);
Begin
 If Length(media) < 9
 Then DBTMedFin.Font.Size:=7
 Else DBTMedFin.Font.Size:=5;
End;

Procedure Imp_Fac_Aut_Rec(qconshab,QDadAlu,qconsccl:TQuery;var licenca,rec,rec2:string;var LFac,LHab,LCurso:TppLabel);
var renov, republicacao, secao:string;
    vdia,vmes,vano:word;
Begin
 licenca:='';
 rec:='';
 republicacao:='';
 If QDadAlu['cur_dtrepublicacao'] <> Null
 Then republicacao:=' (Republicada em '+DateToStr(QDadAlu['cur_dtrepublicacao'])+')';
 If QDadAlu['cur_area'] = 6 // Cursos de Tecnologia
 Then LCurso.Font.Size:=7
 Else LCurso.Font.Size:=9;
 If QDadAlu['cur_area'] = 1 // Ensino Médio
 Then
  Begin
   If QDadAlu['cur_pronatec'] = 'S'
   Then
    Begin
      LFac.Caption:='UNOESTE - CURSOS TÉCNICOS DE NÍVEL MÉDIO';
      If QDadAlu['cur_autdata'] <> Null
      Then rec:=' - AUT. PORT. N°'+NULLToSpace(QDadAlu['cur_autndc'])+' - CONSU/UNOESTE, DE '+DateToStr(QDadAlu['cur_autdata'])
      Else rec:=' - AUT. PORT. N°'+NULLToSpace(QDadAlu['cur_autndc'])+' - CONSU/UNOESTE, DE ';
    End
   Else
    Begin
      LFac.Caption:='COLÉGIO UNOESTE - ENSINO MÉDIO E PROFISSIONAL';
      If QDadAlu['cur_autdata'] <> Null
      Then rec:=' - Autorizado pela Portaria DER-PP de '+NULLToSpace(QDadAlu['cur_autndc'])+', publicada em '+DateToStr(QDadAlu['cur_autdata'])
      Else rec:=' - Autorizado pela Portaria DER-PP de '+NULLToSpace(QDadAlu['cur_autndc'])+', publicada em ';
    End; 
   LHab.Caption:='Fundamento legal: Lei Fed. 9394/96; Decreto Fed. 5154/04; Parecer CNE/CEB 16/99; Resolução CNE/CEB 04/99 e Indicação CEE 08/2000.';
  End
 Else
  Begin
//   If (QDadAlu['cur_area'] = 6) or (QDadAlu['cur_codigo'] = 133) // Tecnologia, Turismo ou Eng. Ambiental
//   Then LFac.Caption:=''
//   Else LFac.Caption:=NULLToSpace(QDadAlu['fac_completo']);
   LFac.Caption:='';
   If qconshab['hab_licenca'] <> null
   Then
    Begin
     Case qconshab['hab_licenca'] of
       1:licenca:=' - LICENCIATURA DE 1º GRAU';
       2:licenca:=' - LICENCIATURA'; //' - LICENCIATURA PLENA';
       3:licenca:=' - LICENCIATURA PLENA PARA LICENCIADOS';
     End;
    End;
  // LCurso.Caption:=NULLToSpace(QDadAlu['cur_nomcur'])+licenca;
   If (qconshab['cur_codigo'] = 20) // Estudos Sociais
   Then
    Begin
     If (qconshab['hab_ligacao'] <> 0) and (qconshab['hab_ligacao'] <> Null)
     Then
      Begin
       If NULLToSpace(QDadAlu['cur_autndc']) <> ''
       Then
        Begin
         DecodeDate(QDadAlu['cur_autdata'],vano,vmes,vdia);
         vano:=Acerta_Ano(vano);
         If QDadAlu['cur_autdcp'] = 1
         Then
          Begin
//           If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
           If vano > 1982
           Then rec:=' - AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
           Else rec:=' - AUT. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
          End
         Else
          Begin
//           If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
           If vano > 1982
           Then rec:=' - REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
           Else rec:=' - REC. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
          End;
        End;
       rec2:='';
       If qconshab['hab_autdoc'] <> Null
       Then
        Begin
         DecodeDate(qconshab['hab_autdat'],vano,vmes,vdia);
         vano:=Acerta_Ano(vano);
         If qconshab['hab_autdcp'] = 1
         Then
          Begin
//           If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
           If vano > 1982
           Then rec2:=' - AUT. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
           Else rec2:=' - AUT. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
          End
         Else
          Begin
//           If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
           If vano > 1982
           Then rec2:=' - REC. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
           Else rec2:=' - REC. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
          End;
        End;
       LHab.Caption:='HAB.: '+qconshab['hab_nomhb1']+rec2;
    //   LHab2.Caption:=NULLToSpace(qconshab['hab_nomhb2']);
      End
     Else
      Begin
       LHab.Caption:='';
       If NULLToSpace(qconshab['hab_autdoc']) <> ''
       Then
        Begin
         DecodeDate(qconshab['hab_autdat'],vano,vmes,vdia);
         vano:=Acerta_Ano(vano);
         If qconshab['hab_autdcp'] = 1
         Then
          Begin
//           If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
           If vano > 1982
           Then rec:=' - AUT. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
           Else rec:=' - AUT. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
          End
         Else
          Begin
//           If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
           If vano > 1982
           Then rec:=' - REC. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
           Else rec:=' - REC. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
          End;
        End;
      End;
    End
   Else
    If (qconshab['hab_ligacao'] <> 0) and (qconshab['hab_ligacao'] <> Null)
    Then
     Begin
      If (qconshab['hab_codigo'] = 19) or (qconshab['hab_codigo'] = 21) or (qconshab['hab_codigo'] = 22) or
         (qconshab['hab_codigo'] = 48) or (qconshab['hab_codigo'] = 49) or (qconshab['hab_codigo'] = 51) or
         (qconshab['hab_codigo'] = 60) or (qconshab['hab_codigo'] = 61) or (qconshab['hab_codigo'] = 62) or
         (qconshab['hab_codigo'] = 69) or (qconshab['hab_codigo'] = 70) or (qconshab['hab_codigo'] = 71)
//      Then LHab.Caption:='HAB.: '+qconshab['hab_nomhb1']+' '+NULLToSpace(qconshab['hab_nomhb2'])+' - (PAR.CES 1155/99)'
//      Then LHab.Caption:='HAB.: '+qconshab['hab_nomhb1']+NULLToSpace(qconshab['hab_nomhb2'])+' - (RES.CNE/CES Nº1/2005)'  // Alteração efetuada dia 31/03/2006
      Then LHab.Caption:='HAB.: '+qconshab['hab_nomhb1']+NULLToSpace(qconshab['hab_nomhb2'])+' - (RES.CNE/CES Nº2/2009)'  // Alteração efetuada dia 22/03/2022
      Else LHab.Caption:='HAB.: '+qconshab['hab_nomhb1']+NULLToSpace(qconshab['hab_nomhb2']);
   //   LHab2.Caption:=NULLToSpace(qconshab['hab_nomhb2']);
      If NULLToSpace(qconshab['hab_autdoc']) <> ''
      Then
       Begin
        DecodeDate(qconshab['hab_autdat'],vano,vmes,vdia);
        vano:=Acerta_Ano(vano);
        If qconshab['cur_codigo'] = 4   //Farmacia
        Then
         Begin
          If qconshab['hab_autdcp'] = 1 // Autorização
          Then rec:=' - AUT. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
          Else rec:=' - REC. PORTARIA N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
         End
        Else
         Begin
          If qconshab['hab_autdcp'] = 1 // Autorização
          Then
           Begin
//            If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
            If vano > 1982
            Then rec:=' - AUT. PORTARIA'+UpperCase(NULLToSpace(QDadAlu['cur_orgao']))+' N°'+qconshab['hab_autdoc']+UpperCase(NULLToSpace(QDadAlu['cur_artigo']))+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
            Else rec:=' - AUT. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
           End
          Else
           Begin
//            If StrToInt(Copy(DateToStr(qconshab['hab_autdat']),7,4)) > 1982
            If vano > 1982
            Then rec:=' - REC. PORTARIA'+UpperCase(NULLToSpace(QDadAlu['cur_orgao']))+' N°'+qconshab['hab_autdoc']+UpperCase(NULLToSpace(QDadAlu['cur_artigo']))+' D.O.U. '+DateToStr(qconshab['hab_autdat'])
            Else rec:=' - REC. DEC. LEI N°'+qconshab['hab_autdoc']+' D.O.U. '+DateToStr(qconshab['hab_autdat']);
           End;
         End;
       End;
      renov:=Renovacao(QDadAlu['cur_codigo'],2);
      If renov <> '' // Existe renovação cadastrada
      Then
       Begin
         If QDadAlu['cur_codigo'] = 23 // pedagogia
         Then
          Begin
            LCurso.Font.Size:=7;
            LHab.Font.Size:=7;
          End
         Else LCurso.Font.Size:=8;
         rec:=rec + ' - '+renov;
       End;
      If (QDadAlu['cur_codigo'] = 22) and (qconshab['hab_codigo'] <> 17)// curso de letras
      Then LHab.Caption:=Copy(rec,4,200);
     End
    Else
     Begin
      LHab.Caption:=Renovacao(QDadAlu['cur_codigo'],1)+republicacao;
      If NULLToSpace(QDadAlu['cur_autndc']) <> ''
      Then
       Begin
        DecodeDate(QDadAlu['cur_autdata'],vano,vmes,vdia);
        vano:=Acerta_Ano(vano);
        If QDadAlu['cur_codigo'] = 4  //Farmacia
        Then
         Begin
          If qconsccl['ahb_codgra'] >= 17 // Deve aparecer resolução
          Then
           Begin
            //rec:=' - RESOLUÇÃO Nº 2 CNE/CES, DE 19/02/2002';
            rec:=' - CONFORME RESOLUÇÕES MINISTERIAIS VIGENTES';
            If QDadAlu['cur_autdcp'] = 1
            Then LHab.Caption:='AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])+' - '+Renovacao(QDadAlu['cur_codigo'],2)
            Else LHab.Caption:='REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])+' - '+Renovacao(QDadAlu['cur_codigo'],2);
           End
          Else
           If QDadAlu['cur_autdcp'] = 1
           Then rec:=' - AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])+' - '+Renovacao(QDadAlu['cur_codigo'],2)
           Else rec:=' - REC. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])+' - '+Renovacao(QDadAlu['cur_codigo'],2);
         End
        Else
{// MARCELO
        If QDadAlu['cur_codigo'] = 133  //
        Then
         Begin
          If QDadAlu['cur_autdcp'] = 1
          Then rec:=' - AUT. PORTARIA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
          Else rec:=' - REC. PORTARIA CONJUNTA N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
         End
        Else
//}
         Begin
          If QDadAlu['cur_autdcp'] = 3 // Autorização UNOESTE
          Then rec:=' - AUT. PORT. N°'+QDadAlu['cur_autndc']+' - CONSU/UNOESTE, DE '+DateToStr(QDadAlu['cur_autdata'])
          Else
           If QDadAlu['cur_autdcp'] = 1 // Autorização
           Then
            Begin
{             If (QDadAlu['cur_codigo'] = 28) or (QDadAlu['cur_codigo'] = 133) or (QDadAlu['cur_codigo'] = 143) or
                (QDadAlu['cur_codigo'] = 144) or (QDadAlu['cur_codigo'] = 145) or (QDadAlu['cur_codigo'] = 170)
             Then rec:=' - AUT. PORT. N°'+QDadAlu['cur_autndc']+' - CONSU/UNOESTE, DE '+DateToStr(QDadAlu['cur_autdata'])
             Else}
  //            If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
              If vano > 1982
              Then
               Begin
                If QDadAlu['cur_area'] = 6 // Cursos de Tecnologia
                Then rec:=' - AUT. PORT.'+UpperCase(NULLToSpace(QDadAlu['cur_orgao']))+' N°'+QDadAlu['cur_autndc']+UpperCase(NULLToSpace(QDadAlu['cur_artigo']))+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
                Else rec:=' - AUT. PORTARIA'+UpperCase(NULLToSpace(QDadAlu['cur_orgao']))+' N°'+QDadAlu['cur_autndc']+UpperCase(NULLToSpace(QDadAlu['cur_artigo']))+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
               End
              Else rec:=' - AUT. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
            End
           Else
            Begin
  //           If StrToInt(Copy(DateToStr(QDadAlu['cur_autdata']),7,4)) > 1982
             If vano > 1982
             Then
              Begin
               If QDadAlu['cur_area'] = 6 // Cursos de Tecnologia
               Then rec:=' - REC. PORT.'+UpperCase(NULLToSpace(QDadAlu['cur_orgao']))+' N°'+QDadAlu['cur_autndc']+UpperCase(NULLToSpace(QDadAlu['cur_artigo']))+' D.O.U. '+DateToStr(QDadAlu['cur_autdata'])
               Else rec:=' - REC. PORTARIA'+UpperCase(NULLToSpace(QDadAlu['cur_orgao']))+' N°'+QDadAlu['cur_autndc']+UpperCase(NULLToSpace(QDadAlu['cur_artigo']))+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
              End
 //            Else rec:=' - REC. DEC. LEI N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']);
             Else rec:=' - REC. DEC. N°'+QDadAlu['cur_autndc']+' D.O.U. '+DateToStr(QDadAlu['cur_autdata']); // Alteração realizada dia 19/10/2006 de DEC. LEI somente para DEC.
            End;
          Acerta_LicRec(QDadAlu['cur_codigo'],qconsccl['ahb_codgra'],licenca,rec);
         End;
       End;
      If (QDadAlu['cur_codigo'] = 32) or (QDadAlu['cur_codigo'] = 307) or ((QDadAlu['cur_codigo'] = 22) and (qconshab['hab_codigo'] <> 17)) // Turismo ou Letras
      Then
       Begin
        renov:=Renovacao(QDadAlu['cur_codigo'],2);
        If renov <> '' // Existe renovação cadastrada
        Then
         Begin
          LCurso.Font.Size:=8;
          rec:=rec + ' - '+renov;
         End;
        If (QDadAlu['cur_codigo'] = 22) // curso de letras
        Then LHab.Caption:=Copy(rec,4,200)
        Else LHab.Caption:='ESTRUTURA CURRICULAR DO CURSO DE TURISMO COM ÊNFASE EM HOTELARIA';
        If QDadAlu['cur_codigo'] = 307  // Licenciatura em Pedagogia
        Then
         Begin
           LCurso.Font.Size:=7;
           LHab.Caption:='RESOLUÇÃO CNE/CP Nº01, DE 15 DE MAIO DE 2006';
         End;
       End;
      If QDadAlu['cur_codigo'] = 311 // Estudos Complementares em Educação Infantil
      Then
       Begin
         LCurso.Font.Size:=8;
         LHab.Caption:='HAB.: EDUCAÇÃO INFANTIL CONFORME ARTIGO 12 DA RESOLUÇÃO CNE Nº1, DE 15/05/2006';
       End;  
     End;
  End;
End;

Procedure Dados_Aluno(QDadAlu:TQuery);
Begin
 QDadAlu.Close;
 QDadAlu.Sql.Clear;
 QDadAlu.Sql.Add('select c.*, f.fac_codigo, f.fac_nome, p.pes_nomecivil, p.pes_nome, p.pes_rg, p.pes_orgexp,');
 QDadAlu.Sql.Add('p.pes_estexp, p.pes_nompai, p.pes_nommae, alu_prouni, p.pes_datnas, p.pes_locnas, p.nac_codigo,');
 QDadAlu.Sql.Add('p.pes_titulo, p.pes_zonael, p.pes_municipio, p.pes_cpf, p.pes_sexo, p.pes_reserv, p.pes_regmil,');
 QDadAlu.Sql.Add('p.pes_cirmil, a.alu_ra, a.alu_foring, a.alu_foringgov, a.alu_inives, a.alu_fimves, a.alu_totpon,');
 QDadAlu.Sql.Add('a.alu_entidade, a.alu_nrlivro, a.alu_nrfolha, a.alu_datreg, alu_anoing, alu_seming, alu_periodo,');
 QDadAlu.Sql.Add('fac_completo, pes_docestr, p.tde_codigo, tde_sigla, alu_notaenem, pes_nomedefinitivo');
 QDadAlu.Sql.Add('from sca_alunos a, crp_pessoas p, sca_cursos c, outer sca_faculdade f, outer crp_tpdocestr t');
 QDadAlu.Sql.Add('where a.pes_nro = p.pes_nro and a.cur_codigo = c.cur_codigo and');
 QDadAlu.Sql.Add('c.fac_codigo = f.fac_codigo and p.tde_codigo = t.tde_codigo and a.alu_ra =:ra');
End;

Procedure Dados_Grade_Hab(qconsccl:TQuery);
Begin
 qconsccl.Close;
 qconsccl.RequestLive:=False;
 qconsccl.Sql.Clear;
 qconsccl.Sql.Add('select * from sca_alu_hab ah, sca_alunos a, sca_grades_letivo gl');
 qconsccl.Sql.Add('where ah.alu_ra = a.alu_ra and a.cur_codigo = gl.cur_codigo and ah.ahb_codgra = gl.grl_codgra and');
 qconsccl.Sql.Add('      a.alu_ra =:ra and ah.hab_codigo =:hab');
End;

Procedure Imp_Estado_Pais(QDadAlu:TQuery;var ppLabel15,LLocNas:TppLabel);
var QLocalidade:TQuery;
Begin
 QLocalidade:=TQuery.Create(FProcs);
 QLocalidade.DatabaseName:='unoeste';
 QLocalidade.Close;
 QLocalidade.RequestLive:=False;
 LLocNas.Caption:='';
 ppLabel15.Caption:='Estado';
 If QDadAlu['pes_locnas'] <> Null
 Then
  Begin
   QLocalidade.Sql.Clear;
   QLocalidade.Sql.Add('select * from cep_local l, outer cep_estado e');
   QLocalidade.Sql.Add('where l.loc_uf = e.loc_uf and l.loc_codigo =:codloc');
   QLocalidade.ParamByName('codloc').AsInteger:=QDadAlu['pes_locnas'];
   QLocalidade.Open;
   If ((Pos('(',NULLToSpace(QLocalidade['loc_nome'])) <> 0)) or ((Pos('(',NULLToSpace(QLocalidade['loc_obs'])) <> 0)) // Cidade de Nascimento no Exterior
   Then
    Begin
     ppLabel15.Caption:='País';
     If (Pos('(',NULLToSpace(QLocalidade['loc_nome'])) <> 0)
     Then LLocNas.Caption:=Copy(QLocalidade['loc_nome'],(Pos('(',QLocalidade['loc_nome'])+1),(Pos(')',QLocalidade['loc_nome']) - Pos('(',QLocalidade['loc_nome']) - 1))
     Else
      If (Pos('(',NULLToSpace(QLocalidade['loc_obs'])) <> 0)
      Then LLocNas.Caption:=Copy(QLocalidade['loc_obs'],(Pos('(',QLocalidade['loc_obs'])+1),(Pos(')',QLocalidade['loc_obs']) - Pos('(',QLocalidade['loc_obs']) - 1));
    End
   Else LLocNas.Caption:=Trata_Acento(NULLToSpace(QLocalidade['est_descr']),2);
  End;
 QLocalidade.Destroy;
End;

Procedure Esconde_Dados(TF:TForm);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount - 1 do
  Begin
    If (Components[I] is TppLabel) and (Components[I].Tag <> 100) and (Components[I].Tag <> 4) and (TppLabel(Components[I]).Font.Size <> 6) Then
      TppLabel(Components[I]).Visible:=False;
    If (Components[I] is TppDBText) and (Components[I].Tag <> 100) and (Components[I].Tag <> 4) Then
      TppDBText(Components[I]).Visible:=False;
  End;
End;

//------------------------------------------------------------------------------

Function Mostra_Faculdade(codfac:word):string;
var QFac:TQuery;
Begin
 QFac:=TQuery.Create(FProcs);
 QFac.DatabaseName:='unoeste';
 QFac.Close;
 QFac.RequestLive:=False;
 QFac.Sql.Clear;
 QFac.Sql.Add('select * from sca_faculdade');
 QFac.Sql.Add('where fac_codigo =:codfac');
 QFac.ParamByName('codfac').AsSmallInt:=codfac;
 QFac.Open;
 If QFac.Eof
 Then Result:=''
 Else Result:=NULLToSpace(QFac['fac_completo']);
 QFac.Destroy;
End;

Procedure Carrega_Fontes(Drive:string);
var porta:string;
Begin
{ If Drive = 'C:'
 Then
  Begin
   porta:=PortaImpressora;
   WinExec(PChar('command.com /c copy /b c:\sistemas\fontbar.pcl '+porta),0);
   WinExec(PChar('command.com /c copy /b c:\sistemas\fontlogo.pcl '+porta),0);
  End
 Else
  Begin
   WinExec('command.com /c copy /b q:\fontbar.pcl LPT1',0);
   WinExec('command.com /c copy /b q:\fontlogo.pcl LPT1',0);
  End;}
End;

Function Versao_SO:Byte;
var  verInfo : TOsVersionInfo;
Begin
 verInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
 If GetVersionEx(verInfo)
 Then
  Begin
   case verInfo.dwPlatformId of
    VER_PLATFORM_WIN32s : Result:=1; // Windows 95
    VER_PLATFORM_WIN32_WINDOWS : Result:=2; // Windows 95 Osr2 / 98
    VER_PLATFORM_WIN32_NT : Result:=3; //Windows XP/2000/NT
   end;
  End
 Else Result:=0; 
End;

Procedure Ativa_Portas;
var  i : Integer;
     Caminho, Drive : String;
     Tamanho : Cardinal;
Begin
  SetLength(Caminho,255);
  Tamanho:=255;
  For i:=2 to 5 do
  Begin
    Drive := 'LPT'+IntToStr(i);
    if WNetGetConnection(PChar(Drive),PChar(Caminho),Tamanho) = NO_ERROR then
      WinExec(PChar('command.com /c net use '+Drive+': '+Caminho+' /persistent:yes'),0);
  End;
End;

Procedure Horario_Professor(perlet,semref,coddis,lab,nivel,campus,matr:integer;codtur,feriado:string;dataini,datfim:TDateTime);
var QHorProf, QReitProf, QFeriado:TQuery;
    vdata:TDateTime;
Begin
 QFeriado:=TQuery.Create(FProcs);
 QFeriado.DatabaseName:='unoeste';
 QFeriado.Close;
 QFeriado.RequestLive:=False;

 QReitProf:=TQuery.Create(FProcs);
 QReitProf.DatabaseName:='unoeste';
 QReitProf.Close;
 QReitProf.RequestLive:=False;
 QReitProf.Sql.Clear;
 QReitProf.Sql.Add('select * from sca_reitprof');
 QReitProf.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab and rei_tipo = 1');

 QHorProf:=TQuery.Create(FProcs);
 QHorProf.DatabaseName:='unoeste';
 QHorProf.Close;
 QHorProf.RequestLive:=False;
 QHorProf.Sql.Clear;
 QHorProf.Sql.Add('delete from sca_horprof');
 QHorProf.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab');
 If matr <> 0 // Gerar datas de um professor específico
 Then
  Begin
   QHorProf.Sql.Add('and fun_matr =:matr');
   QHorProf.ParamByName('matr').AsInteger:=matr;

   QReitProf.Sql.Add('and fun_matr =:matr');
   QReitProf.ParamByName('matr').AsInteger:=matr;
  End;
 QHorProf.ParamByName('perlet').AsSmallInt:=perlet;
 QHorProf.ParamByName('semref').AsSmallInt:=semref;
 QHorProf.ParamByName('coddis').AsInteger:=coddis;
 QHorProf.ParamByName('codtur').AsString:=codtur;
 QHorProf.ParamByName('lab').AsSmallInt:=lab;
 QHorProf.ExecSql;

 QHorProf.Close;
 QHorProf.RequestLive:=True;
 QHorProf.Sql.Clear;
 QHorProf.Sql.Add('select * from sca_horprof');
 QHorProf.Open;

 QReitProf.ParamByName('perlet').AsSmallInt:=perlet;
 QReitProf.ParamByName('semref').AsSmallInt:=semref;
 QReitProf.ParamByName('coddis').AsInteger:=coddis;
 QReitProf.ParamByName('codtur').AsString:=codtur;
 QReitProf.ParamByName('lab').AsSmallInt:=lab;
 QReitProf.Open;

 While not QReitProf.Eof do
 Begin
  vdata:=dataini;
  While DayOfWeek(vdata) <> QReitProf['rei_diasem'] do
   vdata:=vdata+1;
  While vdata <= datfim do
  Begin
   If feriado = 'N' // Não considerar feriados
   Then
    Begin
     QFeriado.Close;
     QFeriado.Sql.Clear;
     If nivel = 8 // Ensino Médio
     Then QFeriado.Sql.Add('select * from sca_fer2grau where fer_data =:data')
     Else QFeriado.Sql.Add('select * from sca_feriado where fer_data =:data');
     QFeriado.Sql.Add('and (cam_codigo = 999 or cam_codigo =:cod)');
     QFeriado.ParamByName('data').AsDate:=vdata;
     QFeriado.ParamByName('cod').AsInteger:=campus;
     QFeriado.Open;
     If QFeriado.Eof
     Then
      Begin
       QHorProf.Append;
       QHorProf['dst_perlet']:=perlet;
       QHorProf['dst_semref']:=semref;
       QHorProf['dis_codigo']:=coddis;
       QHorProf['dst_codtur']:=codtur;
       QHorProf['lab_turma']:=lab;
       QHorProf['fun_matr']:=QReitProf['fun_matr'];
       QHorProf['hrp_nroaulas']:=QReitProf['rei_semanal'];
       QHorProf['hrp_periodo']:=QReitProf['rei_periodo'];
       QHorProf['hrp_data']:=vdata;
       QHorProf.Post;
      End;
    End
   Else
    Begin
     QHorProf.Append;
     QHorProf['dst_perlet']:=perlet;
     QHorProf['dst_semref']:=semref;
     QHorProf['dis_codigo']:=coddis;
     QHorProf['dst_codtur']:=codtur;
     QHorProf['lab_turma']:=lab;
     QHorProf['fun_matr']:=QReitProf['fun_matr'];
     QHorProf['hrp_nroaulas']:=QReitProf['rei_semanal'];
     QHorProf['hrp_periodo']:=QReitProf['rei_periodo'];
     QHorProf['hrp_data']:=vdata;
     QHorProf.Post;
    End;
   vdata:=vdata+7;
  End;
  vdata:=dataini;
  QReitProf.Next;
 End;
 QFeriado.Destroy;
 QReitProf.Destroy;
 QHorProf.Destroy;
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
    If (Components[I] is TDBCheckBox) Then
       If TDBCheckBox(Components[I]).Tag = 0 Then
          TDBCheckBox(Components[I]).Enabled:=True;
    If (Components[I] is TDateEdit) Then
       If TDateEdit(Components[I]).Tag = 0 Then
          TDateEdit(Components[I]).Enabled:=True;
    If (Components[I] is TDBDateEdit) Then
       If TDBDateEdit(Components[I]).Tag = 0 Then
          TDBDateEdit(Components[I]).Enabled:=True;
    If (Components[I] is TGroupBox) Then
       If TGroupBox(Components[I]).Tag = 0 Then
          TGroupBox(Components[I]).Enabled:=True;
    If (Components[I] is TRxDBLookupCombo) Then
       If TRxDBLookupCombo(Components[I]).Tag = 0 Then
          TRxDBLookupCombo(Components[I]).Enabled:=True;
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
    If (Components[I] is TDBCheckBox) Then
       If TDBCheckBox(Components[I]).Tag = 0 Then
          TDBCheckBox(Components[I]).Enabled:=False;
    If (Components[I] is TDateEdit) Then
       If TDateEdit(Components[I]).Tag = 0 Then
          TDateEdit(Components[I]).Enabled:=False;
    If (Components[I] is TDBDateEdit) Then
       If TDBDateEdit(Components[I]).Tag = 0 Then
          TDBDateEdit(Components[I]).Enabled:=False;
    If (Components[I] is TGroupBox) Then
       If TGroupBox(Components[I]).Tag = 0 Then
          TGroupBox(Components[I]).Enabled:=False;
    If (Components[I] is TRxDBLookupCombo) Then
       If TRxDBLookupCombo(Components[I]).Tag = 0 Then
          TRxDBLookupCombo(Components[I]).Enabled:=False;
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

function Alinha_RA(ra:string): string;
var s:string;
Begin
  s:=StrZero(StrToFloat(Trim(ra)),10);
  Alinha_RA:=s;
End;

Function Cal_Dig(Campo:String):Integer;
Var Soma:smallInt;
    N,Resto,I,S:integer;
Begin
  Soma:=0;
  N:=2;
  For I:=Length(Campo) DownTo 1 do
  begin
    S:=(N*StrToInt(Copy(Campo,I,1)));
    If Length(IntToStr(S))>1 then
      Begin
        S:=StrToInt(Copy(IntToStr(S),1,1))+StrToInt(copy(IntTOStr(S),2,1));
      End;
    Soma:=Soma+S;
    If N=1 Then
       N:=2
    Else
       N:=1;
  End;
  Resto:=(10 - (Soma Mod 10));
  If Resto=10 then
     Resto:=0;
  Cal_Dig:=Resto;
End;

Function Valida_Geracao(perlet, semref, coddis, lab, ano, mes, chmin, tipaul:Integer;codtur:string):boolean;
var QHorario,QDiscCont:TQuery;
Begin
 QDiscCont:=TQuery.Create(FProcs);
 QDiscCont.DatabaseName:='unoeste';
 QDiscCont.Close;
 QDiscCont.RequestLive:=False;
 QDiscCont.Sql.Clear;
 QDiscCont.Sql.Add('select sum(dcc_totprev) as totprev');
 QDiscCont.Sql.Add('from sca_disc_cont');
 QDiscCont.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and');
 QDiscCont.Sql.Add('      dis_codigo =:coddis and dst_codtur =:codtur and');
 QDiscCont.Sql.Add('      (lab_turma = 0 or lab_turma =:lab)');
 QDiscCont.ParamByName('perlet').AsSmallint:=perlet;
 QDiscCont.ParamByName('semref').AsSmallint:=semref;
 QDiscCont.ParamByName('coddis').AsInteger:=coddis;
 QDiscCont.ParamByName('codtur').AsString:=codtur;
 QDiscCont.ParamByName('lab').AsSmallint:=lab;
 QDiscCont.Open;
 If (NullToZero(QDiscCont['totprev']) < chmin) and ((tipaul <> 3) or ((tipaul = 3) and (lab <> 0))) // Carga horária prevista está menor do que a mínima. Verificar se a caderneta a ser gerada é a última.
 Then
  Begin
   QHorario:=TQuery.Create(FProcs);
   QHorario.DatabaseName:='unoeste';
   QHorario.Close;
   QHorario.RequestLive:=False;
   QHorario.Sql.Clear;
   QHorario.Sql.Add('select distinct year(hor_data) ano, month(hor_data) mes from sca_horario');
   QHorario.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab');
   QHorario.Sql.Add('order by 1 desc,2 desc');
   QHorario.ParamByName('perlet').AsSmallint:=perlet;
   QHorario.ParamByName('semref').AsSmallint:=semref;
   QHorario.ParamByName('coddis').AsInteger:=coddis;
   QHorario.ParamByName('codtur').AsString:=codtur;
   QHorario.ParamByName('lab').AsSmallint:=lab;
   QHorario.Open;
   If (QHorario['ano'] = ano) and (QHorario['mes'] = mes)
   Then Result:=False
   Else Result:=True;
   QHorario.Destroy;
  End
 Else Result:=true;
 QDiscCont.Destroy;
End;

procedure MudaTamPapel(PaperSize, Comp, Alt: integer);
var
ADevice, ADriver, APort: array[0..255] of char;
DeviceMode: THandle;
M: PDevMode;
s: string;
begin
// Força o uso de Printer. Se esta linha for removida, a primeira
// invocação falha. Bug da VCL
S := Printer.Printers[Printer.PrinterIndex];
// Pega dados da impressora atual
Printer.GetPrinter(ADevice, ADriver, APort, DeviceMode);
// Pega um ponteiro para DEVMODE
M := GlobalLock(DeviceMode);
try
if M <> nil then
begin
// Muda tamanho do papel
M^.dmFields := DM_PAPERSIZE;
if PaperSize = DMPAPER_USER then
M^.dmFields := M^.dmFields or DM_PAPERLENGTH or DM_PAPERWIDTH;
M^.dmPaperLength := Alt;
M^.dmPaperWidth := Comp;
M^.dmPaperSize := PaperSize;//
// Atualiza
Printer.SetPrinter(ADevice, ADriver, APort, DeviceMode);
end;
finally
GlobalUnlock(DeviceMode);
end;
end;

//----------------------- Funções que calculam número de aulas do professor ----------------------------------

Procedure Horario_Normal(QReitProf:TQuery;perlet,semref,matr,codcur,coddis,codfac:integer);
Begin
  // Total de Aulas das atividades e disciplinas com horário normal
  QReitProf.Close;
  QReitProf.Sql.Clear;
  QReitProf.Sql.Add('select rei_tipo, sum(rei_semanal) totaulas');
  QReitProf.Sql.Add('from sca_reitprof r, sca_disc_tur dt, sca_disciplinas d');
  QReitProf.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
  QReitProf.Sql.Add('      r.dis_codigo = dt.dis_codigo and r.dis_codigo = d.dis_codigo and');
  If codfac = 1 // Faclepp
  Then QReitProf.Sql.Add('r.dst_codtur = dt.cla_turma and r.rei_termo = dt.cla_serie')
  Else QReitProf.Sql.Add('r.dst_codtur = dt.dst_codtur');
  QReitProf.Sql.Add('      and r.fun_matr =:matr and rei_tipo = 1 and');
  QReitProf.Sql.Add('      dst_remunerada = 0 and dst_periodo = "N" and r.dst_perlet =:perlet and');
  QReitProf.Sql.Add('      r.dst_semref =:semref and r.cur_codigo =:codcur');
  If coddis <> 0 // Calcular de uma disciplina específica
  Then
   Begin
    QReitProf.Sql.Add('      and r.dis_codigo =:coddis');
    QReitProf.Sql.Add('group by 1');
    QReitProf.ParamByName('coddis').AsInteger:=coddis;
   End
  Else
   Begin
    QReitProf.Sql.Add('group by 1');
    QReitProf.Sql.Add('union');
    QReitProf.Sql.Add('select rei_tipo, sum(rei_semanal) totaulas');
    QReitProf.Sql.Add('from sca_reitprof');
    QReitProf.Sql.Add('where fun_matr =:matr and rei_tipo = 11 and rei_remunerada = 0 and dst_perlet =:perlet and');
    QReitProf.Sql.Add('      dst_semref =:semref and cur_codigo =:codcur');
    QReitProf.Sql.Add('group by 1');
   End;
  QReitProf.ParamByName('perlet').AsInteger:=perlet;
  QReitProf.ParamByName('semref').AsSmallInt:=semref;
  QReitProf.ParamByName('matr').AsInteger:=matr;
  QReitProf.ParamByName('codcur').AsSmallInt:=codcur;
  QReitProf.Open;
End;

Procedure Media_Data(QReitProf:TQuery;perlet,semref,matr,codcur,coddis,codfac:integer);
Begin
  // Gera média semanal das disciplinas com horário por data
  QReitProf.Close;
  QReitProf.Sql.Clear;
  QReitProf.Sql.Add('select r.dis_codigo, r.dst_codtur, dis_nomdisc, sum(rei_semanal) as totdata');
  QReitProf.Sql.Add('from sca_reitprof r, sca_disc_tur dt, sca_disciplinas d');
  QReitProf.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
  QReitProf.Sql.Add('r.dis_codigo = dt.dis_codigo and r.dis_codigo = d.dis_codigo and');
  If codfac = 1 // Faclepp
  Then QReitProf.Sql.Add('r.dst_codtur = dt.cla_turma and r.rei_termo = dt.cla_serie and')
  Else QReitProf.Sql.Add('r.dst_codtur = dt.dst_codtur and');
  QReitProf.Sql.Add('r.dst_perlet =:perlet and r.dst_semref =:semref and');
  QReitProf.Sql.Add('r.cur_codigo =:codcur and r.fun_matr =:matr and (rei_tipo = 2 or rei_tipo = 90)');
  QReitProf.Sql.Add('and dt.dst_remunerada = 0 and dst_periodo = "N"');
  If coddis <> 0 // Calcular de uma disciplina específica
  Then
   Begin
    QReitProf.Sql.Add('      and r.dis_codigo =:coddis');
    QReitProf.ParamByName('coddis').AsInteger:=coddis;
   End;
  QReitProf.Sql.Add('group by 1,2,3');
  QReitProf.ParamByName('perlet').AsInteger:=perlet;
  QReitProf.ParamByName('semref').AsSmallInt:=semref;
  QReitProf.ParamByName('codcur').AsSmallInt:=codcur;
  QReitProf.ParamByName('matr').AsInteger:=matr;
  QReitProf.Open;
End;

Procedure Media_Especifico(QReitProf:TQuery;perlet,semref,matr,codcur,coddis,codfac:integer);
Begin
  // Gera média semanal das disciplinas com período específico
  QReitProf.Close;
  QReitProf.Sql.Clear;
  If (perlet < 2006) or ((perlet = 2006) and (semref = 1))
  Then
   Begin
    QReitProf.Sql.Add('select r.dis_codigo, r.dst_codtur, dis_nomdisc, rei_diasem, dst_semanas,');
    QReitProf.Sql.Add('       trunc(sum((dst_calfim - dst_calini +1)/7*rei_semanal)) aulas');
    QReitProf.Sql.Add('from sca_reitprof r, sca_disc_tur dt, sca_disciplinas d');
    QReitProf.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
    QReitProf.Sql.Add('r.dis_codigo = dt.dis_codigo and r.dis_codigo = d.dis_codigo and');
    If codfac = 1 // Faclepp
    Then QReitProf.Sql.Add('r.dst_codtur = dt.cla_turma and r.rei_termo = dt.cla_serie and')
    Else QReitProf.Sql.Add('r.dst_codtur = dt.dst_codtur and');
    QReitProf.Sql.Add('r.dst_perlet =:perlet and r.dst_semref =:semref and');
    QReitProf.Sql.Add('r.cur_codigo =:codcur and r.fun_matr =:matr and rei_tipo = 1 and dst_periodo = "S"');
    QReitProf.Sql.Add('and dst_remunerada = 0');
    If coddis <> 0 // Calcular de uma disciplina específica
    Then
     Begin
      QReitProf.Sql.Add('      and r.dis_codigo =:coddis');
      QReitProf.ParamByName('coddis').AsInteger:=coddis;
     End;
    QReitProf.Sql.Add('group by 1, 2, 3, 4, 5');
    QReitProf.Sql.Add('into temp tmp_reitprof');
    QReitProf.ParamByName('perlet').AsInteger:=perlet;
    QReitProf.ParamByName('semref').AsSmallInt:=semref;
    QReitProf.ParamByName('matr').AsInteger:=matr;
    QReitProf.ParamByName('codcur').AsSmallInt:=codcur;
    QReitProf.ExecSql;

    QReitProf.Close;
    QReitProf.Sql.Clear;
    QReitProf.Sql.Add('select dis_codigo, dst_codtur, dis_nomdisc, round(sum(aulas)/max(dst_semanas)) totaulas');
    QReitProf.Sql.Add('from tmp_reitprof');
    QReitProf.Sql.Add('group by 1, 2, 3');
    QReitProf.Open;
   End
  Else
   Begin
    QReitProf.Sql.Add('select r.dis_codigo, r.dst_codtur, dis_nomdisc, dst_periodo, dst_semanas,');
    QReitProf.Sql.Add('       sum(hrp_nroaulas) aulas');
    QReitProf.Sql.Add('from sca_horprof r, sca_disc_tur dt, sca_disciplinas d');
    QReitProf.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and');
    QReitProf.Sql.Add('r.dis_codigo = dt.dis_codigo and r.dis_codigo = d.dis_codigo and');
    QReitProf.Sql.Add('r.dst_codtur = dt.dst_codtur and');
    QReitProf.Sql.Add('r.dst_perlet =:perlet and r.dst_semref =:semref and');
    QReitProf.Sql.Add('d.cur_codigo =:codcur and r.fun_matr =:matr and dst_periodo = "S"');
    QReitProf.Sql.Add('and dst_remunerada = 0');
    If coddis <> 0 // Calcular de uma disciplina específica
    Then
     Begin
      QReitProf.Sql.Add('      and r.dis_codigo =:coddis');
      QReitProf.ParamByName('coddis').AsInteger:=coddis;
     End;
    QReitProf.Sql.Add('group by 1, 2, 3, 4, 5');
    QReitProf.Sql.Add('into temp tmp_reitprof');
    QReitProf.ParamByName('perlet').AsInteger:=perlet;
    QReitProf.ParamByName('semref').AsSmallInt:=semref;
    QReitProf.ParamByName('matr').AsInteger:=matr;
    QReitProf.ParamByName('codcur').AsSmallInt:=codcur;
    QReitProf.ExecSql;

    QReitProf.Close;
    QReitProf.Sql.Clear;
    If perlet >= 2018
     Then
      Begin
        QReitProf.Sql.Add('select dis_codigo, dst_codtur, round(sum(aulas)/max(dst_semanas)) totaulas');
        QReitProf.Sql.Add('from tmp_reitprof');
        QReitProf.Sql.Add('group by 1,2');
		End
     Else
      If (perlet > 2016) or ((perlet = 2016) and (semref = 2))
      Then
       Begin
         QReitProf.Sql.Add('select dis_codigo, round(sum(aulas)/max(dst_semanas)) totaulas');
         QReitProf.Sql.Add('from tmp_reitprof');
         QReitProf.Sql.Add('group by 1');
       End
      Else
       Begin
         QReitProf.Sql.Add('select dst_periodo, round(sum(aulas)/max(dst_semanas)) totaulas');
         QReitProf.Sql.Add('from tmp_reitprof');
         QReitProf.Sql.Add('group by 1');
       End;
    QReitProf.Open;
   End;
End;

Function Idade(DatNas,DatAtu:TDateTime):Word;
var da,ma,aa,dn,mn,an,anos:word;
Begin
 DecodeDate(DatNas,an,mn,dn);
 DecodeDate(DatAtu,aa,ma,da);
 anos:=aa - an;
 If ma < mn
 Then anos:= anos - 1
 Else
  If ma = mn
  Then
   If da < dn
   Then anos:= anos - 1;
 Idade:=anos;
End;

Procedure GeraSalas(perlet,semref,coddis,lab,vcodusu:integer;codtur:string;vdataini,vdatafim:TDateTime);
var QGeraSalas: TQuery;
Begin
 QGeraSalas:=TQuery.Create(FProcs);
 QGeraSalas.DatabaseName:='unoeste';
 QGeraSalas.RequestLive:=True;
 QGeraSalas.Close;
 QGeraSalas.Sql.Clear;
 QGeraSalas.Sql.Add('select * from sca_gerasalas');
 QGeraSalas.Sql.Add('where grs_perlet =:perlet and grs_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab and grs_status = ''N''');
 QGeraSalas.ParamByName('perlet').AsSmallInt:=perlet;
 QGeraSalas.ParamByName('semref').AsSmallInt:=semref;
 QGeraSalas.ParamByName('coddis').AsInteger:=coddis;
 QGeraSalas.ParamByName('codtur').AsString:=codtur;
 QGeraSalas.ParamByName('lab').AsSmallInt:=lab;
 QGeraSalas.Open;
 If QGeraSalas.Eof
 Then
  Begin
   QGeraSalas.Insert;
   QGeraSalas['grs_perlet']:=perlet;
   QGeraSalas['grs_semref']:=semref;
   QGeraSalas['fun_matr']:=vcodusu;
   QGeraSalas['grs_dataini']:=vdataini;
   QGeraSalas['grs_datafim']:=vdatafim;
   QGeraSalas['dis_codigo']:=coddis;
   QGeraSalas['dst_codtur']:=codtur;
   QGeraSalas['lab_turma']:=lab;
   QGeraSalas.Post;
  End
 Else
  If (vdataini < QGeraSalas['grs_dataini']) or (vdatafim > QGeraSalas['grs_datafim'])
  Then
   Begin
    QGeraSalas.Edit;
    If vdataini < QGeraSalas['grs_dataini']
    Then QGeraSalas['grs_dataini']:=vdataini;
    If vdatafim > QGeraSalas['grs_datafim']
    Then QGeraSalas['grs_datafim']:=vdatafim;
    QGeraSalas['fun_matr']:=vcodusu;
    QGeraSalas.Post;
   End;
 QGeraSalas.Destroy;
End;

Procedure GeraSala(QDiscTur:TQuery;vdataini,vdatafim:TDateTime;vcodusu:integer);
var QAgenda,QHorAula,QAge,QAgeCur,QFeriado,QEvento:TQuery;
    vhoraini,vdata:TDateTime;
    Dia: Array[1..7] of String;
Begin
 Dia[1]:='DOMINGO';
 Dia[2]:='SEGUNDA';
 Dia[3]:='TERCA';
 Dia[4]:='QUARTA';
 Dia[5]:='QUINTA';
 Dia[6]:='SEXTA';
 Dia[7]:='SABADO';

 QDiscTur.First;

 QAgenda:=TQuery.Create(FProcs);
 QAgenda.DatabaseName:='unoeste';
 QAgenda.RequestLive:=False;

 QHorAula:=TQuery.Create(FProcs);
 QHorAula.DatabaseName:='unoeste';
 QHorAula.RequestLive:=False;

 QAge:=TQuery.Create(FProcs);
 QAge.DatabaseName:='unoeste';
 QAge.RequestLive:=True;

 QAgeCur:=TQuery.Create(FProcs);
 QAgeCur.DatabaseName:='unoeste';
 QAgeCur.RequestLive:=True;

 QFeriado:=TQuery.Create(FProcs);
 QFeriado.DatabaseName:='unoeste';
 QFeriado.RequestLive:=False;

 QEvento:=TQuery.Create(FProcs);
 QEvento.DatabaseName:='unoeste';
 QEvento.RequestLive:=False;
 QEvento.Close;
 QEvento.Sql.Clear;
 QEvento.Sql.Add('select * from pat_evento where eve_tipo = 1');
 QEvento.Open;

 QAgenda.Close;
 QAgenda.Sql.Clear;
 QAgenda.Sql.Add('select * from pat_agendamento');
 QAgenda.Sql.Add('where age_data between :vdata1 and :vdata2 and eve_codigo =:codeve and age_seq in (select age_seq from pat_agendacursos');
 QAgenda.Sql.Add('      where dst_perlet =:perlet and dst_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab)');
 QAgenda.Sql.Add('      and age_semanal = 0');
 QAgenda.ParamByName('codeve').AsSmallInt:=QEvento['eve_codigo'];
 QAgenda.ParamByName('vdata1').AsDate:=vdataini;
 QAgenda.ParamByName('vdata2').AsDate:=vdatafim;
 QAgenda.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
 QAgenda.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
 QAgenda.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
 QAgenda.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
 QAgenda.ParamByName('lab').AsSmallInt:=QDiscTur['lab_turma'];
 QAgenda.Open;
 If not QAgenda.Eof  // Existe agendamento para esta disciplina neste período
 Then
  Begin
   // Excluir todos os agendamentos desta disciplina no período
   While not QAgenda.Eof do
   Begin
    QAgeCur.RequestLive:=False;
    QAgeCur.Close;
    QAgeCur.Sql.Clear;
    QAgeCur.Sql.Add('select * from pat_agendacursos');
    QAgeCur.Sql.Add('where age_seq =:seq and dst_perlet =:perlet and dst_semref =:semref and');
    QAgeCur.Sql.Add('      (dis_codigo <>:coddis or dst_codtur <>:codtur or lab_turma <>:lab)');
    QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
    QAgeCur.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
    QAgeCur.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
    QAgeCur.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
    QAgeCur.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
    QAgeCur.ParamByName('lab').AsSmallInt:=QDiscTur['lab_turma'];
    QAgeCur.Open;
    If not QAgeCur.Eof // Agendamento não é somente desta disciplina portanto excluir somente a disciplina da tabela pat_agendacursos
    Then
     Begin
      QAgeCur.Close;
      QAgeCur.Sql.Clear;
      QAgeCur.Sql.Add('delete from pat_agendacursos');
      QAgeCur.Sql.Add('where age_seq =:seq and dst_perlet =:perlet and dst_semref =:semref and');
      QAgeCur.Sql.Add('      dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab');
      QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAgeCur.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
      QAgeCur.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
      QAgeCur.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
      QAgeCur.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
      QAgeCur.ParamByName('lab').AsSmallInt:=QDiscTur['lab_turma'];
      QAgeCur.ExecSql;
     End
    Else
     Begin
      QAgeCur.Close;
      QAgeCur.Sql.Clear;
      QAgeCur.Sql.Add('delete from pat_agendacursos');
      QAgeCur.Sql.Add('where age_seq =:seq');
      QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAgeCur.ExecSql;

      QAge.RequestLive:=False;
      QAge.Close;
      QAge.Sql.Clear;
      QAge.Sql.Add('delete from pat_agendamento');
      QAge.Sql.Add('where age_seq =:seq');
      QAge.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAge.ExecSql;
     End;
    QAgenda.Next;
   End;
  End;

 // Cadastrar agendamento
 QAge.RequestLive:=True;
 QAge.Close;
 QAge.Sql.Clear;
 QAge.Sql.Add('select * from pat_agendamento');
 QAge.Sql.Add('where age_seq = 0');
 QAge.Open;

 QAgeCur.RequestLive:=True;
 QAgeCur.Close;
 QAgeCur.Sql.Clear;
 QAgeCur.Sql.Add('select * from pat_agendacursos');
 QAgeCur.Sql.Add('where age_seq = 0');
 QAgeCur.Open;

 While not QDiscTur.Eof do
 Begin
  If QDiscTur['ccu_seq'] <> Null
  Then
   Begin
    vdata:=vdataini;
    QHorAula.Close;
    QHorAula.Sql.Clear;
    QHorAula.Sql.Add('select * from sca_horaula');
    QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
    QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
    If QDiscTur['dis_controle'] = 9 // Estágio
    Then QHorAula.Sql.Add('and hor_tipaula = 1')
    Else QHorAula.Sql.Add('and hor_tipaula = 0');
    QHorAula.ParamByName('codcur').AsSmallInt:=QDiscTur['cur_codigo'];
    QHorAula.ParamByName('aula').AsSmallInt:=QDiscTur['cal_aula'];
    QHorAula.ParamByName('periodo').AsSmallInt:=QDiscTur['cal_periodo'];
    QHorAula.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
    QHorAula.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
    QHorAula.Open;
    If not QHorAula.Eof
    Then
     Begin
      vhoraini:=QHorAula['hor_horaini'];
      QHorAula.Close;
      QHorAula.Sql.Clear;
      QHorAula.Sql.Add('select * from sca_horaula');
      QHorAula.Sql.Add('where cur_codigo =:codcur and hor_aula =:aula and hor_periodo =:periodo and');
      QHorAula.Sql.Add('hor_perlet =:perlet and hor_semref =:semref');
      If QDiscTur['dis_controle'] = 9 // Estágio
      Then QHorAula.Sql.Add('and hor_tipaula = 1')
      Else QHorAula.Sql.Add('and hor_tipaula = 0');
      QHorAula.ParamByName('codcur').AsSmallInt:=QDiscTur['cur_codigo'];
      QHorAula.ParamByName('aula').AsSmallInt:=QDiscTur['cal_aulafim'];
      QHorAula.ParamByName('periodo').AsSmallInt:=QDiscTur['cal_perfim'];
      QHorAula.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
      QHorAula.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
      QHorAula.Open;
      If not QHorAula.Eof
      Then
       Begin
        vdata:=vdataini;
        While Dia[DayOfWeek(vdata)] <> QDiscTur['cal_diasem'] do
         vdata:=vdata+1;
        While vdata <= vdatafim do
        Begin
         If QDiscTur['dst_feriado'] = 'N' // Não considerar feriados
         Then
          Begin
           QFeriado.Close;
           QFeriado.Sql.Clear;
           If QDiscTur['cur_grapos'] = 8 // Ensino Médio
           Then QFeriado.Sql.Add('select * from sca_fer2grau where fer_data =:data')
           Else QFeriado.Sql.Add('select * from sca_feriado where fer_data =:data');
           QFeriado.Sql.Add('and (cam_codigo = 999 or cam_codigo =:cod)');
           QFeriado.ParamByName('data').AsDate:=vdata;
           QFeriado.ParamByName('cod').AsInteger:=QDiscTur['cam_codigo'];
           QFeriado.Open;
           If QFeriado.Eof
           Then
            Begin
             // Verificar se já existe agendamento para este local
             QAgenda.Close;
             QAgenda.Sql.Clear;
             QAgenda.Sql.Add('select * from pat_agendamento a, pat_agendacursos ac');
             QAgenda.Sql.Add('where a.age_seq = ac.age_seq and age_data =:vdata and ccu_seq =:seq and age_horaini =:horaini and age_horafim =:horafim and eve_codigo =:codeve');
             QAgenda.Sql.Add('      and age_semanal = 0');
             QAgenda.Sql.Add('order by agc_ordem desc');
             QAgenda.ParamByName('codeve').AsSmallInt:=QEvento['eve_codigo'];
             QAgenda.ParamByName('vdata').AsDate:=vdata;
             QAgenda.ParamByName('horaini').AsDateTime:=vhoraini;
             QAgenda.ParamByName('horafim').AsDateTime:=QHorAula['hor_horafim'];
             QAgenda.ParamByName('seq').AsInteger:=QDiscTur['ccu_seq'];
             QAgenda.Open;
             If not QAgenda.Eof // Já existe agendamento cadastrado através do horário semanal para outra disciplina portanto deve-se incluí-la
             Then
              Begin
               QAgeCur.Insert;
               QAgeCur['age_seq']:=QAgenda['age_seq'];
               QAgeCur['agc_ordem']:=QAgenda['agc_ordem'] + 1;
               QAgeCur['dst_perlet']:=QDiscTur['dst_perlet'];
               QAgeCur['dst_semref']:=QDiscTur['dst_semref'];
               QAgeCur['dis_codigo']:=QDiscTur['dis_codigo'];
               QAgeCur['dst_codtur']:=QDiscTur['dst_codtur'];
               QAgeCur['lab_turma']:=QDiscTur['lab_turma'];
               QAgeCur['cur_codigo']:=QDiscTur['cur_codigo'];
               QAgeCur.Post;
              End
             Else
              Begin
               QAge.Insert;
               QAge['age_data']:=vdata;
               QAge['age_horaini']:=vhoraini;
               QAge['age_horafim']:=QHorAula['hor_horafim'];
               QAge['fun_agendou']:=vcodusu;
               QAge['fun_autorizou']:=vcodusu;
               QAge['eve_codigo']:=QEvento['eve_codigo'];
               QAge['ccu_seq']:=QDiscTur['ccu_seq'];
               QAge.Post;

               QAgeCur.Insert;
               QAgeCur['age_seq']:=QAge['age_seq'];
               QAgeCur['agc_ordem']:=1;
               QAgeCur['dst_perlet']:=QDiscTur['dst_perlet'];
               QAgeCur['dst_semref']:=QDiscTur['dst_semref'];
               QAgeCur['dis_codigo']:=QDiscTur['dis_codigo'];
               QAgeCur['dst_codtur']:=QDiscTur['dst_codtur'];
               QAgeCur['lab_turma']:=QDiscTur['lab_turma'];
               QAgeCur['cur_codigo']:=QDiscTur['cur_codigo'];
               QAgeCur.Post;
              End;
            End;
          End
         Else
          Begin
           // Verificar se já existe agendamento para este local
           QAgenda.Close;
           QAgenda.Sql.Clear;
           QAgenda.Sql.Add('select * from pat_agendamento a, pat_agendacursos ac');
           QAgenda.Sql.Add('where a.age_seq = ac.age_seq and age_data =:vdata and ccu_seq =:seq and age_horaini =:horaini and age_horafim =:horafim and eve_codigo =:codeve');
           QAgenda.Sql.Add('      and age_semanal = 0');
           QAgenda.Sql.Add('order by agc_ordem desc');
           QAgenda.ParamByName('codeve').AsSmallInt:=QEvento['eve_codigo'];
           QAgenda.ParamByName('vdata').AsDate:=vdata;
           QAgenda.ParamByName('horaini').AsDateTime:=vhoraini;
           QAgenda.ParamByName('horafim').AsDateTime:=QHorAula['hor_horafim'];
           QAgenda.ParamByName('seq').AsInteger:=QDiscTur['ccu_seq'];
           QAgenda.Open;
           If not QAgenda.Eof // Já existe agendamento cadastrado através do horário semanal para outra disciplina portanto deve-se incluí-la
           Then
            Begin
             QAgeCur.Insert;
             QAgeCur['age_seq']:=QAgenda['age_seq'];
             QAgeCur['agc_ordem']:=QAgenda['agc_ordem'] + 1;
             QAgeCur['dst_perlet']:=QDiscTur['dst_perlet'];
             QAgeCur['dst_semref']:=QDiscTur['dst_semref'];
             QAgeCur['dis_codigo']:=QDiscTur['dis_codigo'];
             QAgeCur['dst_codtur']:=QDiscTur['dst_codtur'];
             QAgeCur['lab_turma']:=QDiscTur['lab_turma'];
             QAgeCur['cur_codigo']:=QDiscTur['cur_codigo'];
             QAgeCur.Post;
            End
           Else
            Begin
             QAge.Insert;
             QAge['age_data']:=vdata;
             QAge['age_horaini']:=vhoraini;
             QAge['age_horafim']:=QHorAula['hor_horafim'];
             QAge['fun_agendou']:=vcodusu;
             QAge['fun_autorizou']:=vcodusu;
             QAge['eve_codigo']:=QEvento['eve_codigo'];
             QAge['ccu_seq']:=QDiscTur['ccu_seq'];
             QAge.Post;

             QAgeCur.Insert;
             QAgeCur['age_seq']:=QAge['age_seq'];
             QAgeCur['agc_ordem']:=1;
             QAgeCur['dst_perlet']:=QDiscTur['dst_perlet'];
             QAgeCur['dst_semref']:=QDiscTur['dst_semref'];
             QAgeCur['dis_codigo']:=QDiscTur['dis_codigo'];
             QAgeCur['dst_codtur']:=QDiscTur['dst_codtur'];
             QAgeCur['lab_turma']:=QDiscTur['lab_turma'];
             QAgeCur['cur_codigo']:=QDiscTur['cur_codigo'];
             QAgeCur.Post;
            End;
          End;
         vdata:=vdata+7;
        End;
       End;
     End;
   End;
  QDiscTur.Next;
 End;
 QAgenda.Destroy;
 QHorAula.Destroy;
 QAge.Destroy;
 QAgeCur.Destroy;
 QFeriado.Destroy;
 QEvento.Destroy;
End;

Procedure GravaSalas(perlet,semref,coddis,lab,vcodusu:integer;codtur:string;vdataini,vdatafim:TDateTime);
var QDiscTur:TQuery;
Begin
 QDiscTur:=TQuery.Create(FProcs);
 QDiscTur.DatabaseName:='unoeste';
 QDiscTur.Close;
 QDiscTur.RequestLive:=False;
 QDiscTur.Close;
 QDiscTur.Sql.Clear;
 QDiscTur.Sql.Add('select distinct dt.dst_perlet, dt.dst_semref, dt.dis_codigo, dt.dst_codtur, lab_turma, cal_aula, cal_periodo,');
 QDiscTur.Sql.Add('       cal_aulafim, cal_perfim, ccu_seq, dis_controle, c.cur_codigo, cal_diasem, dst_feriado, fac_codigo, cam_codigo, ca.ccu_seq, cur_grapos');
 QDiscTur.Sql.Add('from sca_calendario ca, sca_disciplinas d, sca_cursos c, sca_disc_tur dt');
 QDiscTur.Sql.Add('where ca.dis_codigo = d.dis_codigo and d.cur_codigo = c.cur_codigo and ca.dst_perlet = dt.dst_perlet and ca.dst_semref = dt.dst_semref and');
 QDiscTur.Sql.Add('      ca.dis_codigo = dt.dis_codigo and ca.dst_codtur = dt.dst_codtur and dt.dst_perlet =:perlet and dt.dst_semref =:semref and');
 QDiscTur.Sql.Add('      dt.dis_codigo =:coddis and dt.dst_codtur =:codtur and lab_turma =:lab');// and ca.ccu_seq is not null');
 QDiscTur.ParamByName('perlet').AsSmallInt:=perlet;
 QDiscTur.ParamByName('semref').AsSmallInt:=semref;
 QDiscTur.ParamByName('coddis').AsInteger:=coddis;
 QDiscTur.ParamByName('codtur').AsString:=codtur;
 QDiscTur.ParamByName('lab').AsSmallInt:=lab;
 QDiscTur.Open;
 While not QDiscTur.Eof do
 Begin
  GeraSala(QDiscTur,vdataini,vdatafim,vcodusu);
  QDiscTur.Next;
 End;
 QDiscTur.Destroy;
End;

Procedure ApagaSalas(perlet,semref,coddis,lab,tipo:integer;codtur:string;vdataini,vdatafim:TDateTime);
var QAgenda,QAge,QAgeCur,QEvento:TQuery;
Begin
 QAgenda:=TQuery.Create(FProcs);
 QAgenda.DatabaseName:='unoeste';
 QAgenda.RequestLive:=False;

 QAge:=TQuery.Create(FProcs);
 QAge.DatabaseName:='unoeste';
 QAge.RequestLive:=True;

 QAgeCur:=TQuery.Create(FProcs);
 QAgeCur.DatabaseName:='unoeste';
 QAgeCur.RequestLive:=True;

 QEvento:=TQuery.Create(FProcs);
 QEvento.DatabaseName:='unoeste';
 QEvento.RequestLive:=False;
 QEvento.Close;
 QEvento.Sql.Clear;
 QEvento.Sql.Add('select * from pat_evento where eve_tipo = 1');
 QEvento.Open;

 QAgenda.Close;
 QAgenda.Sql.Clear;
 QAgenda.Sql.Add('select * from pat_agendamento');
 QAgenda.Sql.Add('where age_data between :vdata1 and :vdata2 and eve_codigo =:codeve and age_seq in (select age_seq from pat_agendacursos');
 QAgenda.Sql.Add('      where dst_perlet =:perlet and dst_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab)');
 QAgenda.Sql.Add('      and age_semanal =:tipo');
 QAgenda.ParamByName('codeve').AsSmallInt:=QEvento['eve_codigo'];
 QAgenda.ParamByName('vdata1').AsDate:=vdataini;
 QAgenda.ParamByName('vdata2').AsDate:=vdatafim;
 QAgenda.ParamByName('perlet').AsSmallInt:=perlet;
 QAgenda.ParamByName('semref').AsSmallInt:=semref;
 QAgenda.ParamByName('coddis').AsInteger:=coddis;
 QAgenda.ParamByName('codtur').AsString:=codtur;
 QAgenda.ParamByName('lab').AsSmallInt:=lab;
 QAgenda.ParamByName('tipo').AsSmallInt:=tipo;
 QAgenda.Open;
 If not QAgenda.Eof  // Existe agendamento para esta disciplina neste período
 Then
  Begin
   // Excluir todos os agendamentos desta disciplina no período
   While not QAgenda.Eof do
   Begin
    QAgeCur.RequestLive:=False;
    QAgeCur.Close;
    QAgeCur.Sql.Clear;
    QAgeCur.Sql.Add('select * from pat_agendacursos');
    QAgeCur.Sql.Add('where age_seq =:seq and dst_perlet =:perlet and dst_semref =:semref and');
    QAgeCur.Sql.Add('      (dis_codigo <>:coddis or dst_codtur <>:codtur or lab_turma <>:lab)');
    QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
    QAgeCur.ParamByName('perlet').AsSmallInt:=perlet;
    QAgeCur.ParamByName('semref').AsSmallInt:=semref;
    QAgeCur.ParamByName('coddis').AsInteger:=coddis;
    QAgeCur.ParamByName('codtur').AsString:=codtur;
    QAgeCur.ParamByName('lab').AsSmallInt:=lab;
    QAgeCur.Open;
    If not QAgeCur.Eof // Agendamento não é somente desta disciplina portanto excluir somente a disciplina da tabela pat_agendacursos
    Then
     Begin
      QAgeCur.Close;
      QAgeCur.Sql.Clear;
      QAgeCur.Sql.Add('delete from pat_agendacursos');
      QAgeCur.Sql.Add('where age_seq =:seq and dst_perlet =:perlet and dst_semref =:semref and');
      QAgeCur.Sql.Add('      dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab');
      QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAgeCur.ParamByName('perlet').AsSmallInt:=perlet;
      QAgeCur.ParamByName('semref').AsSmallInt:=semref;
      QAgeCur.ParamByName('coddis').AsInteger:=coddis;
      QAgeCur.ParamByName('codtur').AsString:=codtur;
      QAgeCur.ParamByName('lab').AsSmallInt:=lab;
      QAgeCur.ExecSql;
     End
    Else
     Begin
      QAgeCur.Close;
      QAgeCur.Sql.Clear;
      QAgeCur.Sql.Add('delete from pat_agendacursos');
      QAgeCur.Sql.Add('where age_seq =:seq');
      QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAgeCur.ExecSql;

      QAge.RequestLive:=False;
      QAge.Close;
      QAge.Sql.Clear;
      QAge.Sql.Add('delete from pat_agendamento');
      QAge.Sql.Add('where age_seq =:seq');
      QAge.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAge.ExecSql;
     End;
    QAgenda.Next;
   End;
  End;
End;

Procedure GeraSalaData(QDiscTur,QTempo:TQuery;MTDatas:TMemoryTable;vdataini,vdatafim,DataSis:TDateTime;vcodusu,lab,codcur:integer);
var QAgenda,QAge,QAgeCur,QEvento:TQuery;
    tempo,vhoraini,vdata:TDateTime;
Begin
 MTDatas.First;

 QAgenda:=TQuery.Create(FProcs);
 QAgenda.DatabaseName:='unoeste';
 QAgenda.RequestLive:=False;

 QAge:=TQuery.Create(FProcs);
 QAge.DatabaseName:='unoeste';
 QAge.RequestLive:=True;

 QAgeCur:=TQuery.Create(FProcs);
 QAgeCur.DatabaseName:='unoeste';
 QAgeCur.RequestLive:=True;

 QEvento:=TQuery.Create(FProcs);
 QEvento.DatabaseName:='unoeste';
 QEvento.RequestLive:=False;
 QEvento.Close;
 QEvento.Sql.Clear;
 QEvento.Sql.Add('select * from pat_evento where eve_tipo = 1');
 QEvento.Open;

 QAgenda.Close;
 QAgenda.Sql.Clear;
 QAgenda.Sql.Add('select * from pat_agendamento');
 QAgenda.Sql.Add('where age_data between :vdata1 and :vdata2 and eve_codigo =:codeve and age_seq in (select age_seq from pat_agendacursos');
 QAgenda.Sql.Add('      where dst_perlet =:perlet and dst_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab)');
 QAgenda.Sql.Add('      and age_semanal = 1');
 QAgenda.ParamByName('codeve').AsSmallInt:=QEvento['eve_codigo'];
 QAgenda.ParamByName('vdata1').AsDate:=vdataini;
 QAgenda.ParamByName('vdata2').AsDate:=vdatafim;
 QAgenda.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
 QAgenda.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
 QAgenda.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
 QAgenda.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
 QAgenda.ParamByName('lab').AsSmallInt:=lab;
 QAgenda.Open;
 If not QAgenda.Eof  // Existe agendamento para esta disciplina neste período
 Then
  Begin
   // Excluir todos os agendamentos desta disciplina no período
   While not QAgenda.Eof do
   Begin
    QAgeCur.RequestLive:=False;
    QAgeCur.Close;
    QAgeCur.Sql.Clear;
    QAgeCur.Sql.Add('select * from pat_agendacursos');
    QAgeCur.Sql.Add('where age_seq =:seq and dst_perlet =:perlet and dst_semref =:semref and');
    QAgeCur.Sql.Add('      (dis_codigo <>:coddis or dst_codtur <>:codtur or lab_turma <>:lab)');
    QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
    QAgeCur.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
    QAgeCur.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
    QAgeCur.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
    QAgeCur.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
    QAgeCur.ParamByName('lab').AsSmallInt:=lab;
    QAgeCur.Open;
    If not QAgeCur.Eof // Agendamento não é somente desta disciplina portanto excluir somente a disciplina da tabela pat_agendacursos
    Then
     Begin
      QAgeCur.Close;
      QAgeCur.Sql.Clear;
      QAgeCur.Sql.Add('delete from pat_agendacursos');
      QAgeCur.Sql.Add('where age_seq =:seq and dst_perlet =:perlet and dst_semref =:semref and');
      QAgeCur.Sql.Add('      dis_codigo =:coddis and dst_codtur =:codtur and lab_turma =:lab');
      QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAgeCur.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
      QAgeCur.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
      QAgeCur.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
      QAgeCur.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
      QAgeCur.ParamByName('lab').AsSmallInt:=lab;
      QAgeCur.ExecSql;
     End
    Else
     Begin
      QAgeCur.Close;
      QAgeCur.Sql.Clear;
      QAgeCur.Sql.Add('delete from pat_agendacursos');
      QAgeCur.Sql.Add('where age_seq =:seq');
      QAgeCur.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAgeCur.ExecSql;

      QAge.RequestLive:=False;
      QAge.Close;
      QAge.Sql.Clear;
      QAge.Sql.Add('delete from pat_agendamento');
      QAge.Sql.Add('where age_seq =:seq');
      QAge.ParamByName('seq').AsInteger:=QAgenda['age_seq'];
      QAge.ExecSql;
     End;
    QAgenda.Next;
   End;
  End;

 // Cadastrar agendamento
 QAge.RequestLive:=True;
 QAge.Close;
 QAge.Sql.Clear;
 QAge.Sql.Add('select * from pat_agendamento');
 QAge.Sql.Add('where age_seq = 0');
 QAge.Open;

 QAgeCur.RequestLive:=True;
 QAgeCur.Close;
 QAgeCur.Sql.Clear;
 QAgeCur.Sql.Add('select * from pat_agendacursos');
 QAgeCur.Sql.Add('where age_seq = 0');
 QAgeCur.Open;

 While not MTDatas.Eof do
 Begin
  If (NullToZero(MTDatas['hor_semanal']) = 1) and (NullToZero(MTDatas['ccu_seq']) <> 0)
  Then
   Begin
    tempo:=StrToTime(QTempo['tempo']);
    // Verificar se já existe agendamento para este local
    QAgenda.Close;
    QAgenda.Sql.Clear;
    QAgenda.Sql.Add('select * from pat_agendamento a, pat_agendacursos ac');
    QAgenda.Sql.Add('where a.age_seq = ac.age_seq and age_data =:vdata and ccu_seq =:seq and age_horaini =:horaini and age_horafim =:horafim and eve_codigo =:codeve');
    QAgenda.Sql.Add('      and age_semanal = 1');
    QAgenda.Sql.Add('order by agc_ordem desc');
    QAgenda.ParamByName('codeve').AsSmallInt:=QEvento['eve_codigo'];
    QAgenda.ParamByName('vdata').AsDate:=MTDatas['hor_data'];
    QAgenda.ParamByName('horaini').AsDateTime:=StrToTime(MTDatas['hor_horaini']) + StrToDate(DateToStr(DataSis));
    QAgenda.ParamByName('horafim').AsDateTime:=StrToTime(MTDatas['hor_horaini']) + (StrToTime(QTempo['tempo'])*(MTDatas['hor_lista1']+MTDatas['hor_lista2'])) + StrToDate(DateToStr(DataSis));
    QAgenda.ParamByName('seq').AsInteger:=MTDatas['ccu_seq'];                      
    QAgenda.Open;
    If not QAgenda.Eof // Já existe agendamento cadastrado através de horário por data para outra disciplina portanto deve-se incluí-la
    Then
     Begin
      QAgeCur.Insert;
      QAgeCur['age_seq']:=QAgenda['age_seq'];
      QAgeCur['agc_ordem']:=QAgenda['agc_ordem'] + 1;
      QAgeCur['dst_perlet']:=QDiscTur['dst_perlet'];
      QAgeCur['dst_semref']:=QDiscTur['dst_semref'];
      QAgeCur['dis_codigo']:=QDiscTur['dis_codigo'];
      QAgeCur['dst_codtur']:=QDiscTur['dst_codtur'];
      QAgeCur['lab_turma']:=lab;
      QAgeCur['cur_codigo']:=codcur;
      QAgeCur.Post;
     End
    Else
     Begin
      QAge.Insert;
      QAge['age_data']:=MTDatas['hor_data'];
      QAge['age_horaini']:=StrToTime(MTDatas['hor_horaini']);
      QAge['age_horafim']:=StrToTime(MTDatas['hor_horaini']) + (tempo*(NULLToZero(MTDatas['hor_lista1'])+NullToZero(MTDatas['hor_lista2'])));
      QAge['fun_agendou']:=vcodusu;
      QAge['fun_autorizou']:=vcodusu;
      QAge['eve_codigo']:=QEvento['eve_codigo'];
      QAge['ccu_seq']:=MTDatas['ccu_seq'];
      QAge['age_semanal']:=1;
      QAge.Post;

      QAgeCur.Insert;
      QAgeCur['age_seq']:=QAge['age_seq'];
      QAgeCur['agc_ordem']:=1;
      QAgeCur['dst_perlet']:=QDiscTur['dst_perlet'];
      QAgeCur['dst_semref']:=QDiscTur['dst_semref'];
      QAgeCur['dis_codigo']:=QDiscTur['dis_codigo'];
      QAgeCur['dst_codtur']:=QDiscTur['dst_codtur'];
      QAgeCur['lab_turma']:=lab;
      QAgeCur['cur_codigo']:=codcur;
      QAgeCur.Post;
     End;
   End;
  MTDatas.Next;
 End;
 QAgenda.Destroy;
 QAge.Destroy;
 QAgeCur.Destroy;
 QEvento.Destroy;
End;

Function Conflito_SalaData(QDiscTur:TQuery;lab,periodo,sala:integer;vdata,vhoraini,vhorfim:TDateTime): boolean;
var ok:boolean;
    Q:TQuery;
Begin
 Q:=TQuery.Create(FProcs);
 Q.DatabaseName:='unoeste';
 Q.Close;
 Q.RequestLive:=False;
 Q.Sql.Clear;
 Q.Sql.Add('select dt.dis_codigo, dt.dst_codtur, hor_data, hor_horaini, hor_horfim from sca_horario h, sca_disc_tur dt');
 Q.Sql.Add('where h.dst_perlet = dt.dst_perlet and h.dst_semref = dt.dst_semref and');
 Q.Sql.Add('      h.dis_codigo = dt.dis_codigo and h.dst_codtur = dt.dst_codtur and');
 Q.Sql.Add('      dt.dst_perlet =:perlet and dt.dst_semref =:semref and hor_periodo =:periodo and');
 Q.Sql.Add('      hor_data =:vdata and dst_remunerada = 0 and hor_semanal = 1 and ccu_seq =:sala and');
 Q.Sql.Add('      (dt.dis_codigo <>:coddis or dt.dst_codtur <>:codtur or lab_turma <>:labtur)');
 Q.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
 Q.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
 Q.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
 Q.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
 Q.ParamByName('labtur').AsSmallInt:=lab;
 Q.ParamByName('periodo').AsSmallInt:=periodo;
 Q.ParamByName('vdata').AsDate:=vdata;
 Q.ParamByName('sala').AsInteger:=sala;
 Q.Open;
 If (not Q.Eof) and (QDiscTur['dst_remunerada'] = 0)
 Then
  Begin
   ok:=false;
   While (not ok) and (not Q.Eof) do
   Begin
    If (Q['hor_horaini'] <= vhorfim) and
       (Q['hor_horfim'] >= vhoraini)
    Then ok:=true;
    Q.Next;
   End;
   Result:=ok;
  End
 Else Result:=False;
 Q.Destroy;
End;

Function Conflito_SalaSemanal(QDiscTur:TQuery;lab,periodo,nivel,sala:integer;vdata,vhoraini,vhorfim:TDateTime): boolean;
var ok:boolean;
    Q,Q2,QFeriado:TQuery;
    diasem:word;
    vinicio,vfim:TDateTime;
    diasem2:string;
Begin
 diasem:=DayOfWeek(vdata);
 diasem2:='';
 Case diasem of
   2:diasem2:='SEGUNDA';
   3:diasem2:='TERCA';
   4:diasem2:='QUARTA';
   5:diasem2:='QUINTA';
   6:diasem2:='SEXTA';
   7:diasem2:='SABADO';
   1:diasem2:='DOMINGO';
 End;
 Q:=TQuery.Create(FProcs);
 Q.DatabaseName:='unoeste';
 Q.Close;
 Q.RequestLive:=False;
 Q2:=TQuery.Create(FProcs);
 Q2.DatabaseName:='unoeste';
 Q2.Close;
 Q2.RequestLive:=False;
 Q.Sql.Clear;
 Q.Sql.Add('select dt.dis_codigo, dt.dst_codtur, dst_calini, dst_calfim, cal_periodo, cal_diasem,');
 Q.Sql.Add('       cal_aula, cal_aulafim, dis_controle, d.cur_codigo, dst_feriado, cam_codigo');
 Q.Sql.Add('from sca_calendario ca, sca_disc_tur dt, sca_cursos c, sca_disciplinas d');
 Q.Sql.Add('where ca.dst_perlet = dt.dst_perlet and ca.dst_semref = dt.dst_semref and');
 Q.Sql.Add('      ca.dis_codigo = dt.dis_codigo and ca.dis_codigo = d.dis_codigo and');
 Q.Sql.Add('      ca.dst_codtur = dt.dst_codtur and dt.dst_perlet =:perlet and dt.dst_semref =:semref and');
 Q.Sql.Add('      cal_periodo =:periodo and cal_diasem =:diasem and dst_remunerada = 0 and ccu_seq =:sala and');
 Q.Sql.Add('      (dt.dis_codigo <>:coddis or dt.dst_codtur <>:codtur or lab_turma <>:labtur)');
 Q.ParamByName('codtur').AsString:=QDiscTur['dst_codtur'];
 Q.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
 Q.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
 Q.ParamByName('coddis').AsInteger:=QDiscTur['dis_codigo'];
 Q.ParamByName('labtur').AsSmallInt:=lab;
 Q.ParamByName('periodo').AsSmallInt:=periodo;
 Q.ParamByName('diasem').AsString:=diasem2;
 Q.ParamByName('sala').AsInteger:=sala;
 Q.Open;
 If (not Q.Eof) and (QDiscTur['dst_remunerada'] = 0)
 Then
  Begin
   ok:=true;
   If Q['dst_feriado'] = 'N' // Não considerar feriados
   Then
    Begin
     QFeriado:=TQuery.Create(FProcs);
     QFeriado.DatabaseName:='unoeste';
     QFeriado.Close;
     QFeriado.RequestLive:=False;
     QFeriado.Sql.Clear;
     If nivel = 8 // Ensino Médio
     Then QFeriado.Sql.Add('select * from sca_fer2grau where fer_data =:data')
     Else QFeriado.Sql.Add('select * from sca_feriado where fer_data =:data');
     QFeriado.Sql.Add('and (cam_codigo = 999 or cam_codigo =:cod)');
     QFeriado.ParamByName('data').AsDate:=vdata;
     QFeriado.ParamByName('cod').AsInteger:=Q['cam_codigo'];
     QFeriado.Open;
     If not QFeriado.Eof
     Then ok:=false;
     QFeriado.Destroy;
    End;
   If ok
   Then
    Begin
     ok:=false;
     While (not ok) and (not Q.Eof) do
     Begin
      Q2.Close;
      Q2.Sql.Clear;
      Q2.Sql.Add('select * from sca_horaula');
      Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
      Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo');
      If Q['dis_controle'] = 9 // Estágio
      Then Q2.Sql.Add('and hor_tipaula = 1')
      Else Q2.Sql.Add('and hor_tipaula = 0');
      Q2.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
      Q2.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
      Q2.ParamByName('codcur').AsSmallInt:=Q['cur_codigo'];
      Q2.ParamByName('aula').AsSmallInt:=Q['cal_aula'];
      Q2.ParamByName('periodo').AsSmallInt:=periodo;
      Q2.Open;
      vinicio:=Q2['hor_horaini'];

      Q2.Close;
      Q2.Sql.Clear;
      Q2.Sql.Add('select * from sca_horaula');
      Q2.Sql.Add('where hor_perlet =:perlet and hor_semref =:semref and cur_codigo =:codcur and');
      Q2.Sql.Add('hor_aula =:aula and hor_periodo =:periodo');
      If Q['dis_controle'] = 9 // Estágio
      Then Q2.Sql.Add('and hor_tipaula = 1')
      Else Q2.Sql.Add('and hor_tipaula = 0');
      Q2.ParamByName('perlet').AsSmallInt:=QDiscTur['dst_perlet'];
      Q2.ParamByName('semref').AsSmallInt:=QDiscTur['dst_semref'];
      Q2.ParamByName('codcur').AsSmallInt:=Q['cur_codigo'];
      Q2.ParamByName('aula').AsSmallInt:=Q['cal_aulafim'];
      Q2.ParamByName('periodo').AsSmallInt:=periodo;
      Q2.Open;
      vfim:=Q2['hor_horafim'];

      If (vinicio <= vhorfim) and (vfim >= vhoraini) and
         (vdata >= Q['dst_calini']) and (vdata <= Q['dst_calfim'])
      Then ok:=true;
      Q.Next;
     End;
     Result:=ok;
    End
   Else Result:=False;
  End
 Else Result:=False;
 Q.Destroy;
 Q2.Destroy;
End;

// Rotinas utilizadas na consulta de salas

function ClassifLevel(Classif: String; N: Byte; Parents: Boolean): String;
var
   i, j: Byte;
   postraco: word;
begin
   postraco := pos('-',classif);
   if postraco <> 0 then
     Classif := copy(classif,1,postraco-1);
   Result := '';
   for i:=1 to Length(Classif) do
   begin
      if (Classif[i]='.') then
      begin
         Dec(N);
         if (N=0) then
            Break;
      end;
   end;
   if (N = 0) or ((N = 1) and (i>Length(classif))) then
   begin
     if (Parents) then
        Result:=Copy(Classif, 1, i-1)
     else
     begin
        for j:=i-1 downto 1 do
           if (Classif[j]='.') then
              Break;
        Result:=Copy(Classif, j+1, i-j-1);
     end;
   end;
end;

function GetParentSTR(Classif: String; N: Byte): String;
var
   i: Byte;
begin
   Classif:=TruncClassif(Classif);
   for i:=Length(Classif) downto 1  do
   begin
      if (Classif[i]='.') then
      begin
         Dec(N);
         if (N=0) then
            Break;
      end;
   end;
   if (i<1) then
      Result:=''
   else
      Result:=Copy(Classif, 1, i-1);
end;


function Level(Classif: String): Word;
begin
   Result:=CharCount(TruncClassif(Classif), '.')+1;
end;


function TruncClassif(Classif: String): String;
var
   i, p: Byte;
begin
   p:=Length(Classif);
   for i:=Length(Classif) downto 1 do
   begin
      if (Classif[i]='.') then
         p:=i;
      if not (Classif[i] in ['.', ' ']) then
         Break;
   end;
   if ((p>0) and (Classif[p]='.')) then
      Dec(p);
   Result:=Copy(Classif, 1, p);
end;

function CharCount(value: String; car: Char): Word;
var
   i: Word;
begin
   Result:=0;
   for i:=1 to Length(value) do
      if (value[i]=car) then
         Inc(Result);
end;

//-----------------------------------------------------------

procedure EnDecryptFile(INFName, OutFName : String; Chave : Word);
var InMS, OutMS : TMemoryStream;
    I : Integer;
    C : byte;
begin
    InMS := TMemoryStream.Create;
    OutMS := TMemoryStream.Create;
    try
       InMS.LoadFromFile(INFName);
       InMS.Position := 0;
       for I := 0 to InMS.Size - 1 do
           begin
               InMS.Read(C, 1);
               C := (C xor not(ord(chave shr I)));
               OutMS.Write(C,1);
           end;
       OutMS.SaveToFile(OutFName);
    finally
       InMS.Free;
       OutMS.Free;
    end;
end;

procedure InterpretaCodigoBarras(ACodBarra : String; var ADisciplina,AAno,ASemestre,ATurma,AMes,ALabTurma,APagina,ATotalPaginas,ACodigoBarraDigitado : String);
begin
    ADisciplina := Copy(ACodBarra,1,8);
    AAno := Copy(ACodBarra,9,4);
    ASemestre := Copy(ACodBarra,13,1);
    ATurma := Chr(StrToInt(Copy(ACodBarra,14,2)));
    if Copy(ACodBarra,16,2) <> '00'
       then ATurma := ATurma + Chr(StrToInt(Copy(ACodBarra,16,2)));
    AMes := Copy(ACodBarra,18,2);
    ALabTurma := Copy(ACodBarra,20,1);
    APagina := Copy(ACodBarra,21,1);
    ATotalPaginas := Copy(ACodBarra,22,1);
end;

procedure Retorna_Turmas(Q:TQuery;vperlet,vsemref,vcoddis:integer;vcodtur:string);
Begin
 Q.Close;
 Q.Sql.Clear;
 Q.SQl.Add('select distinct cla_turfac from fin_alumat am, sca_historico h');
 Q.SQl.Add('where amt_ano = his_anoref and amt_semestre = his_semref and am.alu_ra = h.alu_ra and');
 Q.SQl.Add('      dis_codigo =:coddis and his_codtur =:codtur and (his_codlan = 1 or his_codlan = 9) and');
 Q.SQl.Add('      sia_codigo = 1 and amt_ano =:ano and amt_semestre =:sem and cla_turfac is not null');
 Q.SQl.Add('order by cla_turfac');
 Q.ParamByName('coddis').AsInteger:=vcoddis;
 Q.ParamByName('codtur').AsString:=vcodtur;
 Q.ParamByName('ano').AsInteger:=vperlet;
 Q.ParamByName('sem').AsInteger:=vsemref;
 Q.Open;
End;

procedure InsereTexto(var texto: String; inserir: String; posicao: Integer);
var
  i: Integer;
begin
  for i:=1 to Length(inserir) do
  begin
    texto[posicao] := inserir[i];
    Inc(posicao);
  end;
end;

function DecToRoman( Decimal: LongInt ): String;
{Converte um numero decimal em algarismos romanos}
const
Romans: Array[1..13] of String = ( 'I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M' );
Arabics: Array[1..13] of Integer =( 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);
var
i: Integer;
scratch: String;
begin
  scratch := '';
  for i := 13 downto 1 do
  while ( Decimal >= Arabics[i] ) do
  begin
  Decimal := Decimal - Arabics[i];
  scratch := scratch + Romans[i];
  end;
  Result := scratch;
end;

Procedure Calcula_SitFin(vano,vsem,vcodcur:word);
var QDisc:TQuery;
Begin
 QDisc:=TQuery.Create(FProcs);
 QDisc.DatabaseName:='unoeste';
 QDisc.Close;
 QDisc.Sql.Clear;
 QDisc.Sql.Add('select distinct dt.dis_codigo, his_codtur');
 QDisc.Sql.Add('from sca_historico h, sca_disc_tur dt, sca_disciplinas d');
 QDisc.Sql.Add('where his_anoref =:anoref and his_semref =:semref and d.cur_codigo =:codcur and his_sitfin = "N" and');
 QDisc.Sql.Add('      his_anoref = dst_perlet and his_semref = dst_semref and h.dis_codigo = dt.dis_codigo and his_codtur = dst_codtur and');
 QDisc.Sql.Add('      dst_contr9 = "S" and dt.dis_codigo = d.dis_codigo and dst_controle in (4,5) and his_chcumpr <> 0');
// QDisc.Sql.Add('      and dt.dis_codigo = 121355 and his_codtur = "B"');
 QDisc.Sql.Add('order by dt.dis_codigo, his_codtur');
 QDisc.ParambyName('anoref').AsSmallInt:=vano;
 QDisc.ParambyName('semref').AsSmallInt:=vsem;
 QDisc.ParambyName('codcur').AsSmallInt:=vcodcur;
 QDisc.Open;
 While not QDisc.Eof do
 Begin
   FProcs.SPCalcDis.Close;
   FProcs.SPCalcDis.Params[0].AsInteger:=QDisc['dis_codigo'];
   FProcs.SPCalcDis.Params[1].AsInteger:=vano;
   FProcs.SPCalcDis.Params[2].AsString:=QDisc['his_codtur'];
   FProcs.SPCalcDis.Params[3].AsInteger:=vano;
   FProcs.SPCalcDis.Params[4].AsInteger:=vsem;
   FProcs.SPCalcDis.ExecProc;
   QDisc.Next;
 End;

 ShowMessage('Cálculo foi processado.');
 QDisc.Destroy;
End;

function Digito(N: String): Word;
Var
  DV,peso,cont,soma,sup,uni,i: integer;
  aux: string;
begin
    peso := 3;
    aux := trim(N);
    Soma := 0;
    cont := Length(aux);
    For i := cont downto 1 do
    Begin
      Soma := Soma + (StrToInt(copy(aux,i,1)) * peso);
      If Peso = 3 then
        peso := 1
      else peso := 3;
    End;
    Uni := StrToInt(Copy(IntToStr(soma),Length(IntToStr(soma)),1));
    sup := soma;
    While uni <> 0 do
    Begin
      sup := sup + 1;
      uni := StrToInt(copy(IntToStr(sup),Length(IntToStr(sup)),1));
    End;
    DV := sup - soma;
    Digito := DV;
End;

Procedure FormatoRA(MERA:TComponent;RAMask, RACurrency:string);
Begin
  If (MERA is TMaskEdit)
  Then
   Begin
     TMaskEdit(MERA).EditMask:=RAMask;
//     TMaskEdit(MERA).Width:=80;
   End
  Else
   If (MERA is TCurrencyEdit)
   Then
    Begin
      TCurrencyEdit(MERA).DisplayFormat:=RACurrency;
//      TCurrencyEdit(MERA).Width:=85;
    End;
End;

Function Valida_email(MTemail:TMemoryTable): Boolean;
var tot:word;
    MT:TMemoryTable;
Begin
  Result:=True;
  If MTemail.RecordCount <> 0
  Then
   Begin
   // valida se existe somente um email como principal
     tot:=0;
     MTemail.First;
     While not MTemail.Eof do
     Begin
       If MTemail['eml_principal'] = 'S'
       Then inc(tot);
       MTemail.Next;
     End;
     If tot = 0
     Then
      Begin
        MessageDlg('Não existe email definido como principal!',mtError,[mbOk],0);
        Result:=False;
      End
     Else
      If tot > 1
      Then
       Begin
         MessageDlg('Existe mais de um email definido como principal!',mtError,[mbOk],0);
         Result:=False;
       End;
   // valida se existem emails duplicados
     MT:=TMemoryTable.Create(FProcs);
     MT.CopyStructure(MTemail);
     MT.BatchMove(MTemail,BatAppend,0);
     MTemail.First;
     While not MTemail.Eof do
     Begin
       tot:=0;
       MT.First;
       While not MT.Eof do
       Begin
         If MTemail['eml_email'] = MT['eml_email']
         Then inc(tot);
         MT.Next;
       End;
       If tot > 1
       Then
        Begin
          MessageDlg('Existem emails duplicados!',mtError,[mbOk],0);
          Result:=False;
          break;
        End;
       MTemail.Next;
     End;
     MT.Destroy;
   End;  
End;

Function Usuario_Liberado(vmatr: Integer;vdata: TDateTime): Boolean;
var QUsuatrib:TQuery;
Begin
  Try
    QUsuAtrib:=TQuery.Create(FProcs);
    QUsuAtrib.DatabaseName:='unoeste';
    QUsuAtrib.Close;
    QUsuAtrib.Sql.Clear;
    QUsuAtrib.Sql.Add('select * from sca_usuatrib');
    QUsuAtrib.Sql.Add('where fun_matr =:matr');
    QUsuAtrib.ParamByName('matr').AsInteger:=vmatr;
    QUsuAtrib.Open;
    If not QUsuAtrib.Eof
    Then
     Begin
      If (vdata >= QUsuAtrib['uat_dataini']) and (vdata - 1 <= QUsuAtrib['uat_datafim'])
      Then Result:=True
      Else Result:=False;
     End
    Else Result:=False;
    QUsuAtrib.Destroy;
  Except
    Result:=False;
  End;
End;

function TemPendenciasFinanceiras(RA : Real; vData:TDateTime) : Boolean;
var Q : TQuery;
    SPDeve: TStoredProc;
begin
    Result := False;
    Q := TQuery.Create(nil);
    Q.DatabaseName := 'unoeste';

    // Verifica se aluno tem garantia hipotecária
    Q.SQL.Add('Select STA_CodStatus, MEN_Parcela_2 From FIN_Mensalidade Where ALU_Ra = ' + FloatToStr(RA) + ' And STA_CodStatus = 13');
    Q.Open;
    Result := not Q.Eof;
    Q.Close;

    if not Result
      then begin
               // Verifica se aluno possui cheque devolvido
               Q.SQL.Clear;
               Q.SQL.Add('Select distinct cc.chq_ncheque, cc.chq_nconta, cc.ban_codigo, cc.age_codigo, cc.chq_valor, cc.chq_seq ' +
                         ' from Fin_CadCheques cc, fin_itenslotechq i, fin_lotecheque lc, fin_tipomov tm,' +
                         ' fin_cadchdoc cd, outer Fin_LocCobranca co Where cc.chq_seq = i.chq_seq ' +
                         ' and i.ltc_seq = lc.ltc_seq and lc.tmv_seq = tm.tmv_seq and tm.tmv_controle in ("D","C") ' +
                         ' and cc.chq_seq = cd.chq_seq and lc.lcc_seq = co.lcc_seq and chd_nrodoc = ' + FloatToStr(RA) +
                         ' union ' +
                         ' Select distinct cc.chq_ncheque, cc.chq_nconta,cc.ban_codigo, cc.age_codigo, cc.chq_valor, cc.chq_seq ' +
                         ' from Fin_CadCheques cc, fin_cadchdoc cd Where cc.chq_seq = cd.chq_seq  and cc.orc_seq = 11 ' +
                         ' and chd_nrodoc = ' + FloatToStr(RA) + ' and cc.chq_seq not in ' +
                         ' (select chq_seq from fin_itenslotechq i, fin_lotecheque lc, fin_tipomov tm ' +
                         ' where i.chq_seq=cc.chq_seq and i.ltc_seq=lc.ltc_seq and lc.tmv_seq=tm.tmv_seq and ' +
                         ' tm.tmv_controle in ("R"))');
               Q.Open;
               Result := not Q.Eof;
               Q.Close;
           end;

    if not Result
       then begin
                // Verifica se o aluno está inadimplente  (Departamento Jurídico)
                Q.SQL.Clear;
                Q.SQL.Add('Select * from jur_cadastro Where alu_ra = ' + FloatToStr(RA) + ' and cad_tipo = 4 and (sit_numero <> 5 and sit_numero <> 4)');
                Q.Open;
                Result := not Q.Eof;
                Q.Close;
            end;

    if not Result
       then begin
                // Verifica se o aluno possui liminar contra a Unoeste
                Q.SQL.Clear;
                Q.SQL.Add('select * from jur_liminar where alu_ra = ' + FloatToStr(RA) + ' and jur_status = "S"');
                Q.Open;
                Result := not Q.Eof;
                Q.Close;
            end;

    if not Result
       then begin
                // Verifica se o aluno está negativado no SPC
                Q.SQL.Clear;
                Q.SQL.Add('select * from fin_negativacao where neg_dataexclusao is null and alu_ra= ' + FloatToStr(RA));
                Q.Open;
                Result := not Q.Eof;
                Q.Close;
            end;

    if not Result
      then begin
               SPDeve := TStoredProc.Create(nil);
               SPDeve.DatabaseName := 'unoeste';
               SPDeve.StoredProcName := 'calcula_debaberto';
               SPDeve.Params.CreateParam(ftFloat,'RA',ptInput);
               SPDeve.Params.CreateParam(ftDate,'vdata',ptInput);
               SPDeve.Close;
               SPDeve.Params[0].AsFloat := RA;
               SPDeve.Params[1].AsDate  := vData;
               SPDeve.Open;
               Result := not SPDeve.Eof;
               SPDeve.Close;
               SPDeve.Free;
           end;

    Q.Free;
end;

Procedure Atualiza_Santander;
var arq,linha,linha2:string;
    ArqTxt,Copia:TextFile;
    i,p,tam,totdisc,vperlet,vsemref:word;
    aluno:Array[1..7] of string;
    vra,totmed,media,vcpf:real;
    ok:boolean;
    QAluno,QHistorico:TQuery;
Begin
  vperlet:=2018;
  vsemref:=2;
  arq:='d:\temp\Inscritos Santander Graduacao 2018.csv';
  If InputQuery('Atualização Fórmula Santander 2018', 'Entre com nome do arquivo', arq)
  Then
   Begin
     Try
       QAluno:=TQuery.Create(FProcs);
       QAluno.DatabaseName:='unoeste';

       QHistorico:=TQuery.Create(FProcs);
       QHistorico.DatabaseName:='unoeste';

       AssignFile(Copia,'d:\temp\Inscritos Santander Graduacao 2018-2.csv');
       Rewrite(Copia);

       AssignFile(ArqTxt,arq);
       Reset(ArqTxt);
//       Readln(ArqTxt,linha);
//       Writeln(Copia,linha); // Copia cabecalho para arquivo destino
       Readln(ArqTxt,linha);
       linha2:=linha+';MEDIA';
       Writeln(Copia,linha2);
       While not Eof(ArqTxt) do
       Begin
         Readln(ArqTxt,linha);
         p:=1;
         tam:=Length(linha);
//         linha2:='';
         linha2:=linha;
         For i:=1 to 7 do // total de colunas do arquivo origem sem contar a classe e média que eu estarei adicionando
         Begin
           linha:=Copy(linha,p,tam);
           If pos(';',linha) <> 0
           Then aluno[i]:=Copy(linha,1,pos(';',linha) - 1)
           Else aluno[i]:=linha;
//           linha2:=linha2 + aluno[i];
           p:=pos(';',linha) + 1;
           tam:= tam - p + 1;
         End;
         ok:=true;
         Try
           aluno[5]:=RemoveChar(aluno[5],'.'); // coluna onde está o R.A.
           aluno[5]:=RemoveChar(aluno[5],'-');
           aluno[5]:=RemoveChar(aluno[5],':');
           aluno[5]:=RemoveChar(aluno[5],'R');
           aluno[5]:=RemoveChar(aluno[5],'A');
           If Trim(aluno[5]) = ''
           Then vra:=0
           Else
            Begin
              Try
                vra:=StrToFloat(aluno[5]);
              Except
                vra:=0;
              End;
            End;

           aluno[2]:=RemoveChar(aluno[2],'.'); // coluna onde está o CPF
           aluno[2]:=RemoveChar(aluno[2],'-');
           If Trim(aluno[2]) = ''
           Then vcpf:=0
           Else
            Begin
              Try
                vcpf:=StrToFloat(aluno[2]);
              Except
                vcpf:=0;
              End;
            End;
         Except
           ok:=false;
         End;
         If ok
         Then
          Begin
            QAluno.Close;
            QAluno.Sql.Clear;
            QAluno.Sql.Add('select a.alu_ra,p.pes_nome,am.cla_serie,am.cla_turma,hab_codigo,pes_cpf');
            QAluno.Sql.Add('from sca_alunos a, crp_pessoas p, fin_alumat am, sca_classes c');
            QAluno.Sql.Add('where a.pes_nro = p.pes_nro and a.alu_ra = am.alu_ra and cla_idecur = cla_ident and am.cla_serie = c.cla_serie and am.cla_turma = c.cla_turma and');
            QAluno.Sql.Add('a.cur_codigo = c.cur_codigo and (am.sia_codigo = 1 or am.sia_codigo = 7) and amt_ano =:ano and amt_semestre =:sem and a.alu_ra =:ra');
            QAluno.ParamByName('sem').AsSmallInt:=vsemref;
            QAluno.ParamByName('ano').AsSmallInt:=vperlet;
            QAluno.ParamByName('ra').AsFloat:=vra;
            QAluno.Open;
            If (not QAluno.Eof) and (vcpf = QAluno['pes_cpf'])
            Then
             Begin
               QHistorico.Close;
               QHistorico.Sql.Clear;
               QHistorico.Sql.Add('select h.alu_ra,h.dis_codigo,h.his_codtur,h.his_medfin,h.his_sitfin,h.his_codlan,h.his_chminima');
               QHistorico.Sql.Add('from sca_historico h, sca_disc_tur d, sca_disciplinas di');
               QHistorico.Sql.Add('where h.his_anoref = d.dst_perlet and h.his_semref = d.dst_semref and h.dis_codigo = d.dis_codigo and');
               QHistorico.Sql.Add('h.his_codtur = d.dst_codtur and h.dis_codigo = di.dis_codigo and (h.his_codlan = 1 or h.his_codlan = 9)');
               QHistorico.Sql.Add('and d.dst_controle <> 3 and d.dst_controle <> 7 and h.alu_ra =:ra');
//               If CB8T.Checked
//               Then QHistorico.Sql.Add('and (d.cla_serie is null or d.cla_serie between 1 and 8)');
//               If CBEstProj.Checked // Excluir disciplinas de estágio e projeto da média geral
//               Then QHistorico.Sql.Add('and dis_controle <> 9 and dis_controle <> 11');
               QHistorico.Sql.Add('and h.hab_codigo =:codhab and (h.his_sitfin = "A" or h.his_sitfin = "R")');
//               QHistorico.Sql.Add('and h.hab_codigo =:codhab and h.his_sitfin = "A"');
               QHistorico.ParambyName('ra').AsFloat:=QAluno['alu_ra'];
               QHistorico.ParamByName('codhab').AsSmallInt:=QAluno['hab_codigo'];
               QHistorico.Open;
               If not QHistorico.Eof
               Then
                Begin
                 totdisc:=0;
                 totmed:=0;
                 While not QHistorico.Eof do
                 Begin
                  totmed:=totmed + QHistorico['his_medfin'];
                  totdisc:=totdisc + 1;
                  QHistorico.Next;
                 End;
                 If totdisc <> 0
                 Then media:=totmed / totdisc
                 Else media:=0;
                 linha2:=linha2+';'+FormatFloat('#0.00',media);
                End;
//               Else linha2:=linha2+';'+IntToStr(QAluno['cla_serie'])+QAluno['cla_turma'];
             End
            Else
             If (not QAluno.Eof) and (vcpf <> QAluno['pes_cpf'])
             Then ShowMessage('CPF do aluno '+QAluno['pes_nome']+' não está batendo.');
          End;
         Writeln(Copia,linha2);
       End;
     Finally
       CloseFile(ArqTxt);
       CloseFile(Copia);
       QAluno.Destroy;
       QHistorico.Destroy;
     End;
     ShowMessage('Processo Finalizado.');
   End;
End;

Procedure Projeto_Rondon;
var arq,linha,linha2:string;
    ArqTxt,Copia:TextFile;
    i,p,tam,totdisc:word;
    aluno:Array[1..56] of string;
    vra,totmed,media,vcpf:real;
    ok:boolean;
    QAluno,QHistorico:TQuery;
Begin
  arq:='c:\temp\Projeto Rondon 2015.csv';
  If InputQuery('Projeto Rondon 2015', 'Entre com nome do arquivo', arq)
  Then
   Begin
     Try
       QAluno:=TQuery.Create(FProcs);
       QAluno.DatabaseName:='unoeste';

       QHistorico:=TQuery.Create(FProcs);
       QHistorico.DatabaseName:='unoeste';

       AssignFile(Copia,'c:\temp\Projeto Rondon 2015-2.csv');
       Rewrite(Copia);

       AssignFile(ArqTxt,arq);
       Reset(ArqTxt);
       For i:=1 to 5 do
       Begin
         Readln(ArqTxt,linha);
         Writeln(Copia,linha); // Copia cabecalho para arquivo destino
       End;  
       Readln(ArqTxt,linha);
       linha2:=linha+';MEDIA';
       Writeln(Copia,linha2);
       While not Eof(ArqTxt) do
       Begin
         Readln(ArqTxt,linha);
         p:=1;
         tam:=Length(linha);
         linha2:=linha;
         For i:=1 to 56 do
         Begin
           linha:=Copy(linha,p,tam);
           If pos(';',linha) <> 0
           Then aluno[i]:=Copy(linha,1,pos(';',linha) - 1)
           Else aluno[i]:=linha;
//           linha2:=linha2 + aluno[i];
           p:=pos(';',linha) + 1;
           tam:= tam - p + 1;
         End;
         ok:=true;
         Try
           aluno[1]:=RemoveChar(aluno[1],'.');
           aluno[1]:=RemoveChar(aluno[1],'-');
           aluno[1]:=RemoveChar(aluno[1],':');
           aluno[1]:=RemoveChar(aluno[1],'R');
           aluno[1]:=RemoveChar(aluno[1],'A');
           If Trim(aluno[1]) = ''
           Then vra:=0
           Else vra:=StrToFloat(aluno[1]);
           aluno[13]:=RemoveChar(aluno[13],'.');
           aluno[13]:=RemoveChar(aluno[13],'-');
           If Trim(aluno[13]) = ''
           Then vcpf:=0
           Else vcpf:=StrToFloat(aluno[13]);
         Except
           ok:=false;
         End;
         If ok
         Then
          Begin
            QAluno.Close;
            QAluno.Sql.Clear;
            QAluno.Sql.Add('select a.alu_ra,p.pes_nome,am.cla_serie,am.cla_turma,hab_codigo,pes_cpf');
            QAluno.Sql.Add('from sca_alunos a, crp_pessoas p, fin_alumat am, sca_classes c');
            QAluno.Sql.Add('where a.pes_nro = p.pes_nro and a.alu_ra = am.alu_ra and cla_idecur = cla_ident and am.cla_serie = c.cla_serie and am.cla_turma = c.cla_turma and');
            QAluno.Sql.Add('a.cur_codigo = c.cur_codigo and (am.sia_codigo = 1 or am.sia_codigo = 7) and amt_ano =:ano and amt_semestre =:sem and a.alu_ra =:ra');
            QAluno.ParamByName('sem').AsSmallInt:=1;
            QAluno.ParamByName('ano').AsSmallInt:=2015;
            QAluno.ParamByName('ra').AsFloat:=vra;
            QAluno.Open;
            If (not QAluno.Eof) and (vcpf = QAluno['pes_cpf'])
            Then
             Begin
               QHistorico.Close;
               QHistorico.Sql.Clear;
               QHistorico.Sql.Add('select h.alu_ra,h.dis_codigo,h.his_codtur,h.his_medfin,h.his_sitfin,h.his_codlan,h.his_chminima');
               QHistorico.Sql.Add('from sca_historico h, sca_disc_tur d, sca_disciplinas di');
               QHistorico.Sql.Add('where h.his_anoref = d.dst_perlet and h.his_semref = d.dst_semref and h.dis_codigo = d.dis_codigo and');
               QHistorico.Sql.Add('h.his_codtur = d.dst_codtur and h.dis_codigo = di.dis_codigo and (h.his_codlan = 1 or h.his_codlan = 9)');
               QHistorico.Sql.Add('and d.dst_controle <> 3 and d.dst_controle <> 7 and h.alu_ra =:ra');
//               If CB8T.Checked
//               Then QHistorico.Sql.Add('and (d.cla_serie is null or d.cla_serie between 1 and 8)');
//               If CBEstProj.Checked // Excluir disciplinas de estágio e projeto da média geral
//               Then QHistorico.Sql.Add('and dis_controle <> 9 and dis_controle <> 11');
               QHistorico.Sql.Add('and h.hab_codigo =:codhab and (h.his_sitfin = "A" or h.his_sitfin = "R")');
//               QHistorico.Sql.Add('and h.hab_codigo =:codhab and h.his_sitfin = "A"');
               QHistorico.ParambyName('ra').AsFloat:=QAluno['alu_ra'];
               QHistorico.ParamByName('codhab').AsSmallInt:=QAluno['hab_codigo'];
               QHistorico.Open;
               If not QHistorico.Eof
               Then
                Begin
                 totdisc:=0;
                 totmed:=0;
                 While not QHistorico.Eof do
                 Begin
                  totmed:=totmed + QHistorico['his_medfin'];
                  totdisc:=totdisc + 1;
                  QHistorico.Next;
                 End;
                 If totdisc <> 0
                 Then media:=totmed / totdisc
                 Else media:=0;
                 linha2:=linha2+';'+FormatFloat('#0.00',media);
                End
               Else linha2:=linha2+';';
             End
            Else
             If (not QAluno.Eof) and (vcpf <> QAluno['pes_cpf'])
             Then ShowMessage('CPF do aluno '+QAluno['pes_nome']+' não está batendo.');
          End;
         Writeln(Copia,linha2);
       End;
     Finally
       CloseFile(ArqTxt);
       CloseFile(Copia);
       QAluno.Destroy;
       QHistorico.Destroy;
     End;
     ShowMessage('Processo Finalizado.');
   End;
End;

Procedure Grava_Aulas_Prof_Ind(codcur, perlet, semref, matr:Integer);
Begin
  With FProcs do
  Begin
    Try
      SPQuadro.Close;
      SPQuadro.Params[0].AsSmallInt:=codcur;
      SPQuadro.Params[1].AsSmallInt:=perlet;
      SPQuadro.Params[2].AsSmallInt:=semref;
      SPQuadro.Params[3].AsSmallInt:=1; // Turmas remuneradas
      SPQuadro.Params[4].AsSmallInt:=0; // mês de referência para retornar dados da folha
      SPQuadro.Params[5].AsInteger:=matr;
      SPQuadro.Open;
    Except
      raise EConvertError.Create('Erro na procedure quadro_horasind!');
    End;  

    QProfTotAulas.Close;
    QProfTotAulas.Sql.Clear;
    QProfTotAulas.Sql.Add('select * from sca_proftotaulas');
    QProfTotAulas.Sql.Add('where prt_ano =:ano and prt_semestre =:sem and fun_matr =:matr and cur_codigo =:codcur');
    QProfTotAulas.ParamByName('matr').AsInteger:=matr;
    QProfTotAulas.ParamByName('codcur').AsSmallInt:=codcur;
    QProfTotAulas.ParamByName('ano').AsSmallInt:=perlet;
    QProfTotAulas.ParamByName('sem').AsSmallInt:=semref;
    QProfTotAulas.Open;
    If not QProfTotAulas.Eof
    Then QProfTotAulas.Edit
    Else
     Begin
      QProfTotAulas.Insert;
      QProfTotAulas['prt_ano']:=perlet;
      QProfTotAulas['prt_semestre']:=semref;
      QProfTotAulas['fun_matr']:=matr;
      QProfTotAulas['cur_codigo']:=codcur;
     End;
    QProfTotAulas['prt_totaulas']:=NULLToZero(SPQuadro['s_totaulas']) + NULLToZero(SPQuadro['s_totperiodo']) + NULLToZero(SPQuadro['s_totdata']);
    QProfTotAulas['prt_totativ']:=NULLToZero(SPQuadro['s_totcoord']) + NULLToZero(SPQuadro['s_totativ']);
    QProfTotAulas['prt_cac']:=NULLToZero(SPQuadro['s_totcac']);
    QProfTotAulas.Post;
  End;
End;

Procedure Registra_Faltas(QHistorico:TQuery;vdata:TDateTime);
var QHorario:TQuery;
Begin
{  If QHistorico['his_anoref'] >= 2012
  Then
   Begin
     QHorario:=TQuery.Create(FProcs);
     QHorario.DatabaseName:='unoeste';
     QHorario.Close;
     QHorario.Sql.Clear;
     QHorario.Sql.Add('select hor_bimestre, sum(hor_nroaula1) totaulas from sca_horario');
     QHorario.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and dis_codigo =:coddis and dst_codtur =:codtur and (lab_turma = 0 or lab_turma =:lab)');
     QHorario.Sql.Add('      and hor_data <:vdata and hor_controle <> 0');
     QHorario.Sql.Add('group by 1');
     QHorario.ParamByName('perlet').AsSmallInt:=QHistorico['his_anoref'];
     QHorario.ParamByName('semref').AsSmallInt:=QHistorico['his_semref'];
     QHorario.ParamByName('coddis').AsInteger:=QHistorico['dis_codigo'];
     QHorario.ParamByName('codtur').AsString:=QHistorico['his_codtur'];
     QHorario.ParamByName('lab').AsSmallInt:=QHistorico['lab_turma'];
     QHorario.ParamByName('vdata').AsDate:=vdata;
     QHorario.Open;
     While not QHorario.Eof do
     Begin
       If QHorario['hor_bimestre'] = 1
       Then QHistorico['his_presenca1']:=QHorario['totaulas']
       Else
        If QHorario['hor_bimestre'] = 2
        Then QHistorico['his_presenca2']:=QHorario['totaulas']
        Else
         If QHorario['hor_bimestre'] = 3
         Then QHistorico['his_presenca3']:=QHorario['totaulas']
         Else
          If QHorario['hor_bimestre'] = 4
          Then QHistorico['his_presenca4']:=QHorario['totaulas'];
       QHorario.Next;
     End;
     QHistorico['his_presenca']:=NULLToZero(QHistorico['his_presenca1'])+NULLToZero(QHistorico['his_presenca2'])+NULLToZero(QHistorico['his_presenca3'])+NULLToZero(QHistorico['his_presenca4']);
     QHorario.Destroy;
   End;}
End;

Procedure Ultima_Atribuicao(var vano, vsem:word;var vdataini:TDateTime;vcodusu:integer);
var QCurTotAulas:TQuery;
    QCalDias:TQuery;
Begin
  QCurTotAulas:=TQuery.Create(FProcs);
  QCurTotAulas.DatabaseName:='unoeste';
  QCurTotAulas.Close;
  QCurTotAulas.Sql.Clear;
  QCurTotAulas.Sql.Add('select distinct cta_ano, cta_semestre from sca_curtotaulas');
  QCurTotAulas.Sql.Add('order by 1 desc, 2 desc');
  QCurTotAulas.Open;
  vano:=QCurTotAulas['cta_ano'];
  vsem:=QCurTotAulas['cta_semestre'];

  vdataini:=0;
  QCalDias:=TQuery.Create(FProcs);
  QCalDias.DatabaseName:='unoeste';
  QCalDias.Close;
  QCalDias.Sql.Clear;
  QCalDias.Sql.Add('select distinct cld_diaini, cld_diafim, cld_inisem2, cld_fimsem2 from sca_caldias');
  QCalDias.Sql.Add('where cld_periodo =:periodo and cur_codigo in (select cur_codigo from sca_cursofunc where fun_codigo =:codusu)');
  QCalDias.ParamByName('periodo').AsInteger:=vano;
  QCalDias.ParamByName('codusu').AsInteger:=vcodusu;
  QCalDias.Open;
  If not QCalDias.Eof
  Then
   Begin
     If vsem = 1
     Then
      Begin
        If QCalDias['cld_diaini'] <> Null
        Then vdataini:=QCalDias['cld_diaini'];
      End
     Else
      If QCalDias['cld_inisem2'] <> Null
      Then vdataini:=QCalDias['cld_inisem2'];
   End;

  QCurTotAulas.Destroy;
  QCalDias.Destroy;
End;

//procedure para aguardar um determinado tempo - não trava o programa como o sleep
procedure Delay(MSec: Cardinal);
var
  Start: Cardinal;
begin
  Start := GetTickCount;
  repeat
    Application.ProcessMessages;
  until (GetTickCount - Start) >= MSec;
end;
{ Exemplos de uso
Delay(1000); // Aguarda 1 segundo
Delay(5000); // Aguarda 5 segundos
Delay(60000); // Aguarda 60 segundos - 1 minuto
}

Function MinparaHora(Minuto: integer): string;
var
hr, min : Integer;
begin
  hr := 0;
  while minuto >= 60 do begin
    minuto := minuto - 60;
    hr := hr + 1;
  end;
  min := minuto;
  Result := FormatFloat('00:', hr) + FormatFloat('00', min) + ':00';
end;

procedure DeleteDir( hHandle : THandle; Const sPath : String );
var
OpStruc: TSHFileOpStruct;
FromBuffer, ToBuffer: Array[0..128] of Char;
begin
//Apaga Pasta, Sub-Pastas e Arquivos;;;
fillChar( OpStruc, Sizeof(OpStruc), 0 );
FillChar( FromBuffer, Sizeof(FromBuffer), 0 );
FillChar( ToBuffer, Sizeof(ToBuffer), 0 );
StrPCopy( FromBuffer, sPath);
With OpStruc Do
Begin
Wnd:= hHandle;
wFunc:=FO_DELETE;
pFrom:= @FromBuffer;
pTo:= @ToBuffer;
fFlags:= FOF_NOCONFIRMATION;
fAnyOperationsAborted:=False;
hNameMappings:=nil;
End;
ShFileOperation(OpStruc);
end;

Function Achou_Lacuna(matr,perlet,semref,vmes,tipo:integer):boolean;
var QReitProf:TQuery;
    achou:boolean;
    periodo, diasem, aulafim:word;
Begin
  QReitProf:=TQuery.Create(FProcs);
  QReitProf.DatabaseName:='unoeste';
  QReitProf.Close;
  QReitProf.Sql.Clear;
  QReitProf.Sql.Add('select distinct r.fun_matr, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim');
  QReitProf.Sql.Add('from sca_reitprof r, sca_disc_tur dt');
  QReitProf.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and r.dst_codtur = dt.dst_codtur');
  QReitProf.Sql.Add('      and dt.dst_perlet =:perlet and dt.dst_semref =:semref and rei_diasem is not null and r.fun_matr =:matr');
  QReitProf.Sql.Add('      and ((month(dst_calini) <=:vmes and month(dst_calfim) >=:vmes and year(dst_calini) = year(dst_calfim)) or (month(dst_calini) <=:vmes and year(dst_calini) < year(dst_calfim)))');
  If tipo = 1 // Remuneradas
  Then QReitProf.Sql.Add('and dt.dst_remunerada = 0')
  Else
   If tipo = 2 // Não Remuneradas
   Then QReitProf.Sql.Add('and dt.dst_remunerada = 1');
  QReitProf.Sql.Add('union');
  QReitProf.Sql.Add('select distinct r.fun_matr, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim');
  QReitProf.Sql.Add('from sca_reitprof r');
  QReitProf.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and auc_seq is not null and rei_diasem is not null and r.fun_matr =:matr');
  If tipo = 1 // Remuneradas
  Then QReitProf.Sql.Add('and r.rei_remunerada = 0')
  Else
   If tipo = 2 // Não Remuneradas
   Then QReitProf.Sql.Add('and r.rei_remunerada = 1');
  QReitProf.Sql.Add('order by rei_periodo, rei_diasem, rei_aulaini, rei_aulafim');
  QReitProf.ParamByName('perlet').AsSmallInt:=perlet;
  QReitProf.ParamByName('semref').AsSmallInt:=semref;
  QReitProf.ParamByName('matr').AsInteger:=matr;
  QReitProf.ParamByName('vmes').AsSmallInt:=vmes;
  QReitProf.Open;

  achou:=false;
  periodo:=0;
  diasem:=0;
  While not QReitProf.Eof do
  Begin
    If (QReitProf['rei_periodo'] <> periodo) or (QReitProf['rei_diasem'] <> diasem)
    Then
     Begin
       periodo:=QReitProf['rei_periodo'];
       diasem:=QReitProf['rei_diasem'];
       aulafim:=QReitProf['rei_aulafim'];
     End
    Else
     If QReitProf['rei_aulaini'] > aulafim + 1
     Then
      Begin
        achou:=true;
        break;
      End
     Else aulafim:=QReitProf['rei_aulafim'];
    QReitProf.Next;
  End;
  Result:=achou;
  QReitProf.Destroy;
End;

Function Achou_Conflito_Prof(matr,perlet,semref,vmes,tipo:integer):boolean;
var QReitProf:TQuery;
    achou:boolean;
    periodo, diasem, aulaini, aulafim:word;
Begin
  QReitProf:=TQuery.Create(FProcs);
  QReitProf.DatabaseName:='unoeste';
  QReitProf.Close;
  QReitProf.Sql.Clear;
  QReitProf.Sql.Add('select distinct r.fun_matr, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim, r.dis_codigo||r.dst_codtur||lab_turma coddis');
  QReitProf.Sql.Add('from sca_reitprof r, sca_disc_tur dt');
  QReitProf.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and r.dst_codtur = dt.dst_codtur');
  QReitProf.Sql.Add('      and dt.dst_perlet =:perlet and dt.dst_semref =:semref and rei_diasem is not null and r.fun_matr =:matr');
  QReitProf.Sql.Add('      and ((month(dst_calini) <=:vmes and month(dst_calfim) >=:vmes and year(dst_calini) = year(dst_calfim)) or (month(dst_calini) <=:vmes and year(dst_calini) < year(dst_calfim)))');
  If tipo = 1 // Remuneradas
  Then QReitProf.Sql.Add('and dt.dst_remunerada = 0')
  Else
   If tipo = 2 // Não Remuneradas
   Then QReitProf.Sql.Add('and dt.dst_remunerada = 1');
  QReitProf.Sql.Add('union');
  QReitProf.Sql.Add('select distinct r.fun_matr, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim, auc_seq||" "');
  QReitProf.Sql.Add('from sca_reitprof r');
  QReitProf.Sql.Add('where dst_perlet =:perlet and dst_semref =:semref and auc_seq is not null and rei_diasem is not null and r.fun_matr =:matr');
  If tipo = 1 // Remuneradas
  Then QReitProf.Sql.Add('and r.rei_remunerada = 0')
  Else
   If tipo = 2 // Não Remuneradas
   Then QReitProf.Sql.Add('and r.rei_remunerada = 1');
  QReitProf.Sql.Add('order by rei_periodo, rei_diasem, rei_aulaini, rei_aulafim');
  QReitProf.ParamByName('perlet').AsSmallInt:=perlet;
  QReitProf.ParamByName('semref').AsSmallInt:=semref;
  QReitProf.ParamByName('matr').AsInteger:=matr;
  QReitProf.ParamByName('vmes').AsSmallInt:=vmes;
  QReitProf.Open;

  achou:=false;
  periodo:=0;
  diasem:=0;
  While not QReitProf.Eof do
  Begin
    If (QReitProf['rei_periodo'] <> periodo) or (QReitProf['rei_diasem'] <> diasem)
    Then
     Begin
       periodo:=QReitProf['rei_periodo'];
       diasem:=QReitProf['rei_diasem'];
       aulaini:=QReitProf['rei_aulaini'];
       aulafim:=QReitProf['rei_aulafim'];
     End
    Else
     If ((QReitProf['rei_aulaini']) <= (aulafim)) and
        ((QReitProf['rei_aulafim']) >= (aulaini))
     Then
      Begin
        achou:=true;
        break;
      End
     Else
      Begin
        If QReitProf['rei_aulaini'] < aulaini
        Then aulaini:=QReitProf['rei_aulaini'];
        If QReitProf['rei_aulafim'] > aulafim
        Then aulafim:=QReitProf['rei_aulafim'];
      End;
    QReitProf.Next;
  End;
  Result:=achou;
  QReitProf.Destroy;
End;

Procedure Grava_Historico(ra:real;hab,codusu:integer;vdata:TDateTime);
var QImpHist:TQuery;
Begin
  If codusu <> 0
  Then
   Begin
     Try
       QImpHist:=TQuery.Create(FProcs);
       QImpHist.DatabaseName:='unoeste';
       QImpHist.Close;
       QImpHist.RequestLive:=True;
       QImpHist.Sql.Clear;
       QImpHist.Sql.Add('select * from sca_impressaohist');
       QImpHist.Open;
       QImpHist.Insert;
       QImpHist['alu_ra']:=ra;
       QImpHist['hab_codigo']:=hab;
       QImpHist['fun_matr']:=codusu;
       QImpHist['iph_dtimpressao']:=vdata;
       QImpHist.Post;
     Finally
       QImpHist.Destroy;
     End;
   End;
End;

Function Imprime_Curso(QConsAlu, QConsHab, QAluHab:TQuery):String;
var licenca,rec,rec2:string;
    LFac,LHab,LCurso:TppLabel;
Begin
  If (QConsAlu['cur_codigo'] = 23) or (QConsAlu['cur_codigo'] = 311) // Pedagogia
  Then Result:='Curso de Pedagogia - Licenciatura - Dec. nº 75.361/75 - D.O.U. 14/02/75'
  Else
   If (QConsAlu['cur_codigo'] = 307) // Licenciatura em Pedagogia
   Then Result:='Curso de Licenciatura em Pedagogia - Dec. nº 75.361/75 - D.O.U. 14/02/75'
   Else
    If QConsAlu['cur_codigo'] = 22 // Letras
    Then Result:='Curso de Letras - Português/Inglês e Respectivas Literaturas - Licenciatura - Dec. nº 77.997/76 - D.O.U. 09/07/76'
    Else
     If (QConsAlu['cur_codigo'] = 20) // Estudos Sociais
     Then Result:='Curso de Estudos Sociais - Lic. Plena em Geografia e História - Dec. nº 77.996/76 - D.O.U. 09/07/76'
     Else
      If QConsAlu['cur_codigo'] = 18 // Educação Artística
      Then Result:='Curso de Educação Artística - Licenciatura em Artes Plásticas e Desenho - Dec. nº 79.014/76 - D.O.U. 27/12/76'
      Else
       If (QConsAlu['cur_codigo'] = 17) // Ciências
       Then Result:='Curso de Ciências - Lic. Plena em Biologia, Física, Matemática e Química - Dec. nº 79.014/76 - D.O.U. 27/12/76'
       Else
        If (QConsAlu['cur_codigo'] = 101) // Ciências Biológicas
        Then Result:='Curso de Ciências Biológicas - Licenciatura - Dec. nº 79.014/76 - D.O.U. 27/12/76'
        Else
         If (QConsAlu['cur_codigo'] = 102) // Química
         Then Result:='Curso de Química - Licenciatura - Dec. nº 79.014/76 - D.O.U. 27/12/76'
         Else
          If (QConsAlu['cur_codigo'] = 103) // Física
          Then Result:='Curso de Física - Licenciatura - Dec. nº 79.014/76 - D.O.U. 27/12/76'
          Else
           If (QConsAlu['cur_codigo'] = 104) // Matemática
           Then Result:='Curso de Matemática - Licenciatura - Dec. nº 79.014/76 - D.O.U. 27/12/76'
           Else
            If (QConsAlu['cur_codigo'] = 105) // Geografia
            Then Result:='Curso de Geografia - Licenciatura - Dec. nº 77.996/76 - D.O.U. 09/07/76'
            Else
             If (QConsAlu['cur_codigo'] = 106) // História
             Then Result:='Curso de História - Licenciatura - Dec. nº 77.996/76 - D.O.U. 09/07/76'
             Else
              If QConsAlu['cur_codigo'] = 364 // Artes Visuais
              Then Result:='Curso de Artes Visuais - Licenciatura - Dec. nº 79.014/76 - D.O.U. 27/12/76'
              Else
               Begin
                 LFac:=TppLabel.Create(FProcs);
                 LHab:=TppLabel.Create(FProcs);
                 LCurso:=TppLabel.Create(FProcs);
                 Imp_Fac_Aut_Rec(QConsHab,QConsAlu,QAluHab,licenca,rec,rec2,LFac,LHab,LCurso);
                 Result:=Trata_Texto(Imp_Curso_Hist(QConsAlu,QConsHab,licenca,rec));
                 LFac.Destroy;
                 LHab.Destroy;
                 LCurso.Destroy;
               End;
End;

Procedure Calcula_Termino(vanoi,vsemi,vduracao:word;var vanot,vsemt:word);
var i:word;
Begin
  vanot:=vanoi;
  vsemt:=vsemi;
  For i:=2 to vduracao do
  Begin
    If vsemt = 2
    Then
     Begin
       inc(vanot);
       vsemt:=1;
     End
    Else vsemt:=2;
  End;
End;

Procedure Carrega_Memo(QAluMat,qconscur:TQuery;var Memo1:TMemo);
Begin
  If NULLToSpace(QAluMat['cla_horatestnovo']) <> ''
  Then Memo1.Text:=NULLToSpace(QAluMat['cla_horatestnovo'])
  Else
   If qconscur['cur_codigo'] = 12 // Medicina
   Then
    Begin
      If QAluMat['cla_serie'] > 8 // até o 8º termo o atestado é de uma forma
      Then Memo1.Text:=NULLToSpace(qconscur['cur_horatestnovo2'])
      Else Memo1.Text:=NULLToSpace(qconscur['cur_horatestnovo']);
    End
   Else
//    If (qconscur['cur_periodo'] = 3) and (qconscur['cur_integral'] = 'N')// curso é oferecido em dois períodos
//    Then
//     Begin
       If QAluMat['cla_periodo'] = 2 // noturno
       Then Memo1.Text:=NULLToSpace(qconscur['cur_horatestnovo2'])
       Else Memo1.Text:=NULLToSpace(qconscur['cur_horatestnovo']);
//     End
//    Else Memo1.Text:=NULLToSpace(qconscur['cur_horatestnovo']);

  If (qconscur['cur_codigo'] = 307) and (QAluMat['cla_serie'] <= 2) // Aluno do curso 307 até o 2º termo tem aula no sábado
  Then Memo1.Lines.Add('Sábado : 07:30 às 12:00 horas.');
End;

Procedure Verifica_Periodo(qconscur,QAluMat,QCalDias,QCalDiasMed:TQuery;vano,vsem:word;DataSis:TDateTime;var cursara,achou:boolean;var DEDataIni, DEDataFim:TDateEdit);
Begin
  achou:=false;
  If (qconscur['cur_codigo'] = 12) or (qconscur['cur_codigo'] = 33) or (qconscur['cur_codigo'] = 34) // medicina
  Then
   Begin
     QCalDiasMed.Close;
     QCalDiasMed.ParamByName('ano').AsSmallInt:=vano;
     QCalDiasMed.ParamByName('sem').AsSmallInt:=vsem;
     QCalDiasMed.ParamByName('codcur').AsSmallInt:=qconscur['cur_codigo'];
     QCalDiasMed.ParamByName('serie').AsSmallInt:=QAluMat['cla_serie'];
     QCalDiasMed.Open;
     If not QCalDiasMed.Eof
     Then
      Begin
        achou:=true;
        If DataSis < QCalDiasMed['clm_diaini']
        Then cursara:=true
        Else cursara:=false;
        DEDataIni.Date:=QCalDiasMed['clm_diaini'];
        DEDataFim.Date:=QCalDiasMed['clm_diafim'];
      End;
   End;

  If not achou
  Then
   If vsem = 1 // 1º semestre
   Then
    Begin
      If DataSis < QCalDias['cld_diaini']
      Then cursara:=true
      Else cursara:=false;
      DEDataIni.Date:=QCalDias['cld_diaini'];
      If QCalDias['cld_fimexa'] <> Null
      Then DEDataFim.Date:=QCalDias['cld_fimexa']
      Else DEDataFim.Date:=QCalDias['cld_diafim'];
    End
   Else
    Begin
      If DataSis < QCalDias['cld_inisem2']
      Then cursara:=true
      Else cursara:=false;
      DEDataIni.Date:=QCalDias['cld_inisem2'];
      If QCalDias['cld_fimexa2'] <> Null
      Then DEDataFim.Date:=QCalDias['cld_fimexa2']
      Else DEDataFim.Date:=QCalDias['cld_fimsem2'];
    End;
End;

Function Focou(RG:TRadioGroup):Boolean;
var i : integer;
    achou:boolean;
Begin
  achou:=false;
  i:=0;
  While (i <= RG.Items.Count - 1) and (not achou) do
  Begin
    If TRadioButton(RG.Controls[i]).Focused
    Then achou:=true;
    inc(i);
  End;
  Result:=achou;
End;

Procedure Verifica_Limite_Atribuicao(QAux,QCurTotAulas:TQuery;vcodcur,vperlet,vsemref,vanobloq:word);
Begin
  QAux.Close;
  QAux.Sql.Clear;
  QAux.Sql.Add('select sum(prt_totaulas) totaulas, sum(prt_totativ) totativ from sca_proftotaulas');
  QAux.Sql.Add('where prt_ano =:ano and prt_semestre =:sem and cur_codigo =:codcur');
  QAux.ParamByName('codcur').AsSmallInt:=vcodcur;
  QAux.ParamByName('ano').AsSmallInt:=vperlet;
  QAux.ParamByName('sem').AsSmallInt:=vsemref;
  QAux.Open;
  QCurTotAulas.Edit;
  QCurTotAulas['cta_totaulatr']:=NULLToZero(QAux['totaulas']);
  QCurTotAulas['cta_totativatr']:=NULLToZero(QAux['totativ']);
  If (QCurTotAulas['cta_totaulatr']+QCurTotAulas['cta_totativatr'] > QCurTotAulas['cta_totaulas']+QCurTotAulas['cta_totativ']) and (vperlet >= vanobloq)
  Then
   Begin
     MessageDlg('Atenção. Curso possui '+IntToStr(QCurTotAulas['cta_totaulatr']+QCurTotAulas['cta_totativatr'])+' aulas atribuídas ultrapassando o limite de '+IntToStr(QCurTotAulas['cta_totaulas']+QCurTotAulas['cta_totativ'])+' aulas permitidas no semestre!',mtInformation,[mbOk],0);
//     raise EConvertError.Create('Ultrapassado o limite de aulas permitidas!');
   End;
  QCurTotAulas.Post;
End;

Function Mostra_Coordenadores(seq:Integer):string;
var QCoord:TQuery;
    scoord:string;
    i, tot:word;
Begin
  scoord:='';
  QCoord:=TQuery.Create(FProcs);
  QCoord.DatabaseName:='unoeste';
  QCoord.Close;
  QCoord.Sql.Clear;
  QCoord.Sql.Add('select p.pes_nome, p.pes_sacento, tit_codigo, pes_sexo from spg_coordenadores c, fol_funcionario f, crp_pessoas p, sca_professor pr');
  QCoord.Sql.Add('where c.fun_matr = f.fun_codigo and f.pes_nro = p.pes_nro and emp_codigo = 1 and fun_admprof between 2 and 3 and c.fun_matr = pr.fun_matr and ofc_seq =:seq');
  QCoord.Sql.Add('order by pes_sacento');
  QCoord.ParamByName('seq').AsInteger:=seq;
  QCoord.Open;
  If not QCoord.Eof
  Then
   Begin
     tot:=QCoord.RecordCount;
     If QCoord['pes_sexo'] = 1 // Masculino
     Then
      Begin
        Case QCoord['tit_codigo'] of
          1,5,10:scoord:='Dr. '+Trata_Texto(QCoord['pes_nome']);
          2:scoord:='Me. '+Trata_Texto(QCoord['pes_nome']);
          3:scoord:='Espec. '+Trata_Texto(QCoord['pes_nome']);
          4:scoord:=Trata_Texto(QCoord['pes_nome']);
        End;
      End
     Else
      Begin
        Case QCoord['tit_codigo'] of
          1,5,10:scoord:='Drª. '+Trata_Texto(QCoord['pes_nome']);
          2:scoord:='Me. '+Trata_Texto(QCoord['pes_nome']);
          3:scoord:='Espec. '+Trata_Texto(QCoord['pes_nome']);
          4:scoord:=Trata_Texto(QCoord['pes_nome']);
        End;
      End;
     QCoord.Next;
     For i:=2 to tot do
     Begin
       If i = tot
       Then
        Begin
          If QCoord['pes_sexo'] = 1 // Masculino
          Then
           Begin
             Case QCoord['tit_codigo'] of
               1,5,10:scoord:=scoord + ' e Dr. '+Trata_Texto(QCoord['pes_nome']);
               2:scoord:=scoord + ' e Me. '+Trata_Texto(QCoord['pes_nome']);
               3:scoord:=scoord + ' e Espec. '+Trata_Texto(QCoord['pes_nome']);
               4:scoord:=scoord + ' e '+Trata_Texto(QCoord['pes_nome']);
             End;
           End
          Else
           Begin
             Case QCoord['tit_codigo'] of
               1,5,10:scoord:=scoord + ' e Drª. '+Trata_Texto(QCoord['pes_nome']);
               2:scoord:=scoord + ' e Me. '+Trata_Texto(QCoord['pes_nome']);
               3:scoord:=scoord + ' e Espec. '+Trata_Texto(QCoord['pes_nome']);
               4:scoord:=scoord + ' e '+Trata_Texto(QCoord['pes_nome']);
             End;
           End;
        End
       Else
        Begin
          If QCoord['pes_sexo'] = 1 // Masculino
          Then
           Begin
             Case QCoord['tit_codigo'] of
               1,5,10:scoord:=scoord + ', Dr. '+Trata_Texto(QCoord['pes_nome']);
               2:scoord:=scoord + ', Me. '+Trata_Texto(QCoord['pes_nome']);
               3:scoord:=scoord + ', Espec. '+Trata_Texto(QCoord['pes_nome']);
               4:scoord:=scoord + ', '+Trata_Texto(QCoord['pes_nome']);
             End;
           End
          Else
           Begin
             Case QCoord['tit_codigo'] of
               1,5,10:scoord:=scoord + ', Drª. '+Trata_Texto(QCoord['pes_nome']);
               2:scoord:=scoord + ', Me. '+Trata_Texto(QCoord['pes_nome']);
               3:scoord:=scoord + ', Espec. '+Trata_Texto(QCoord['pes_nome']);
               4:scoord:=scoord + ', '+Trata_Texto(QCoord['pes_nome']);
             End;
           End;
        End;
       QCoord.Next;
     End;
   End;
  Result:=scoord;
  QCoord.Destroy;
End;

function TiraPontoTraco(texto : string) : string;
var i : integer;
    nome : string;
begin
   nome := '';
   if texto <> ''
    then begin
          for i := 1 to Length(texto) do
           if (texto[i] <> '.') and (texto[i] <> '-') and (texto[i] <> ',') and (texto[i] <> ' ')
            then nome := nome + texto[i];
         end;
   result := nome;
end;

Function Calcula_Media(ra:real;codhab:word):real;
var totdisc:word;
    totmed:real;
    QHistorico:TQuery; 
Begin
  QHistorico:=TQuery.Create(FProcs);
  QHistorico.DatabaseName:='unoeste';
  QHistorico.Close;
  QHistorico.Sql.Clear;
  QHistorico.Sql.Add('select h.alu_ra,h.dis_codigo,h.his_codtur,h.his_medfin,h.his_sitfin,h.his_codlan,h.his_chminima');
  QHistorico.Sql.Add('from sca_historico h, sca_disc_tur d, sca_disciplinas di');
  QHistorico.Sql.Add('where h.his_anoref = d.dst_perlet and h.his_semref = d.dst_semref and h.dis_codigo = d.dis_codigo and');
  QHistorico.Sql.Add('h.his_codtur = d.dst_codtur and h.dis_codigo = di.dis_codigo and (h.his_codlan = 1 or h.his_codlan = 9)');
  QHistorico.Sql.Add('and d.dst_controle <> 3 and d.dst_controle <> 7 and h.alu_ra =:ra and');
  QHistorico.Sql.Add('h.hab_codigo =:codhab and (h.his_sitfin = "A" or h.his_sitfin = "R")');
  QHistorico.ParambyName('ra').AsFloat:=ra;
  QHistorico.ParamByName('codhab').AsSmallInt:=codhab;
  QHistorico.Open;
  If not QHistorico.Eof
  Then
   Begin
    totdisc:=0;
    totmed:=0;
    While not QHistorico.Eof do
    Begin
     totmed:=totmed + QHistorico['his_medfin'];
     totdisc:=totdisc + 1;
     QHistorico.Next;
    End;
    If totdisc <> 0
    Then Result:=totmed / totdisc
    Else Result:=0;
   End
  Else Result:=0;
  QHistorico.Close;
  QHistorico.Destroy;
End;

Procedure Insere_Horario(MTHorario:TMemoryTable;QCalendario:TQuery);
Begin
  MTHorario.Edit;
  If Trim(QCalendario['cal_diasem']) = 'SEGUNDA'
  Then
   Begin
    If Trim(MTHorario['seg']) <> ''
    Then
     Begin
       MTHorario['seg']:='X';
       MTHorario['confseg']:=MTHorario['confseg'] + 1;
       MTHorario['segdis']:=MTHorario['segdis']+' / '+QCalendario['dis_nomdisc'];
       MTHorario['segred']:=MTHorario['segred']+' / '+QCalendario['dis_nomred'];
     End
    Else
     Begin
       MTHorario['seg']:=QCalendario['dis_nomred'];
       MTHorario['segdis']:=QCalendario['dis_nomdisc'];
       MTHorario['segred']:=QCalendario['dis_nomred'];
     End
   End
  Else
   If Trim(QCalendario['cal_diasem']) = 'TERCA'
   Then
    Begin
     If Trim(MTHorario['ter']) <> ''
     Then
      Begin
        MTHorario['ter']:='X';
        MTHorario['confter']:=MTHorario['confter'] + 1;
        MTHorario['terdis']:=MTHorario['terdis']+' / '+QCalendario['dis_nomdisc'];
        MTHorario['terred']:=MTHorario['terred']+' / '+QCalendario['dis_nomred'];
      End
     Else
      Begin
        MTHorario['ter']:=QCalendario['dis_nomred'];
        MTHorario['terdis']:=QCalendario['dis_nomdisc'];
        MTHorario['terred']:=QCalendario['dis_nomred'];
      End;
    End
   Else
    If Trim(QCalendario['cal_diasem']) = 'QUARTA'
    Then
     Begin
      If Trim(MTHorario['qua']) <> ''
      Then
       Begin
         MTHorario['qua']:='X';
         MTHorario['confqua']:=MTHorario['confqua'] + 1;
         MTHorario['quadis']:=MTHorario['quadis']+' / '+QCalendario['dis_nomdisc'];
         MTHorario['quared']:=MTHorario['quared']+' / '+QCalendario['dis_nomred'];
       End
      Else
       Begin
         MTHorario['qua']:=QCalendario['dis_nomred'];
         MTHorario['quadis']:=QCalendario['dis_nomdisc'];
         MTHorario['quared']:=QCalendario['dis_nomred'];
       End;
     End
    Else
     If Trim(QCalendario['cal_diasem']) = 'QUINTA'
     Then
      Begin
       If Trim(MTHorario['qui']) <> ''
       Then
        Begin
          MTHorario['qui']:='X';
          MTHorario['confqui']:=MTHorario['confqui'] + 1;
          MTHorario['quidis']:=MTHorario['quidis']+' / '+QCalendario['dis_nomdisc'];
          MTHorario['quired']:=MTHorario['quired']+' / '+QCalendario['dis_nomred'];
        End
       Else
        Begin
          MTHorario['qui']:=QCalendario['dis_nomred'];
          MTHorario['quidis']:=QCalendario['dis_nomdisc'];
          MTHorario['quired']:=QCalendario['dis_nomred'];
        End;
      End
     Else
      If Trim(QCalendario['cal_diasem']) = 'SEXTA'
      Then
       Begin
        If Trim(MTHorario['sex']) <> ''
        Then
         Begin
           MTHorario['sex']:='X';
           MTHorario['confsex']:=MTHorario['confsex'] + 1;
           MTHorario['sexdis']:=MTHorario['sexdis']+' / '+QCalendario['dis_nomdisc'];
           MTHorario['sexred']:=MTHorario['sexred']+' / '+QCalendario['dis_nomred'];
         End
        Else
         Begin
           MTHorario['sex']:=QCalendario['dis_nomred'];
           MTHorario['sexdis']:=QCalendario['dis_nomdisc'];
           MTHorario['sexred']:=QCalendario['dis_nomred'];
         End;
       End
      Else
       If Trim(QCalendario['cal_diasem']) = 'SABADO'
       Then
        Begin
         If Trim(MTHorario['sab']) <> ''
         Then
          Begin
            MTHorario['sab']:='X';
            MTHorario['confsab']:=MTHorario['confsab'] + 1;
            MTHorario['sabdis']:=MTHorario['sabdis']+' / '+QCalendario['dis_nomdisc'];
            MTHorario['sabred']:=MTHorario['sabred']+' / '+QCalendario['dis_nomred'];
          End
         Else
          Begin
            MTHorario['sab']:=QCalendario['dis_nomred'];
            MTHorario['sabdis']:=QCalendario['dis_nomdisc'];
            MTHorario['sabred']:=QCalendario['dis_nomred'];
          End;
        End
       Else
        If Trim(QCalendario['cal_diasem']) = 'DOMINGO'
        Then
         Begin
          If Trim(MTHorario['dom']) <> ''
          Then
           Begin
             MTHorario['dom']:='X';
             MTHorario['confdom']:=MTHorario['confdom'] + 1;
             MTHorario['domdis']:=MTHorario['domdis']+' / '+QCalendario['dis_nomdisc'];
             MTHorario['domred']:=MTHorario['domred']+' / '+QCalendario['dis_nomred'];
           End
          Else
           Begin
             MTHorario['dom']:=QCalendario['dis_nomred'];
             MTHorario['domdis']:=QCalendario['dis_nomdisc'];
             MTHorario['domred']:=QCalendario['dis_nomred'];
           End;
         End;
  MTHorario.Post;
End;

function PrinterSupportsDuplex: Boolean;
var
  Device, Driver, Port: array[0..255] of Char;
  hDevMode: THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  Result :=
    WinSpool.DeviceCapabilities(Device, Port, DC_DUPLEX, nil, nil) <>
    0;
end;

{if it does you can try to switch the duplex mode on before you call
 richedit.print:}

Procedure Seta_Duplex;
var
  Device, Driver, Port: array[0..80] of Char;
  DevMode: THandle;
  pDevmode: PDeviceMode;
begin
   // Get printer device mode handle.
  Printer.GetPrinter(Device, Driver, Port, DevMode);
  if Devmode <> 0 then begin
     // lock it to get pointer to DEVMODE record
    pDevMode := GlobalLock(Devmode);
    if pDevmode <> nil then
    try
      with pDevmode^ do begin
        dmDuplex := DMDUP_VERTICAL;
        dmFields := dmFields or DM_DUPLEX;
      end;
    finally
      // unlock devmode handle.
      GlobalUnlock(Devmode);
    end;
  end; { If }
end;

Function Imp_Nacionalidade(QDadAlu:TQuery):String;
var QNacional:TQuery;
Begin
  If QDadAlu['nac_codigo'] <> Null
  Then
   Begin
     QNacional:=TQuery.Create(FProcs);
     QNacional.DatabaseName:='unoeste';
     QNacional.Close;
     QNacional.Sql.Clear;
     QNacional.Sql.Add('select * from sca_nacionalidade where nac_codigo =:cod');
     QNacional.ParamByName('Cod').AsInteger:=QDadAlu['nac_codigo'];
     QNacional.Open;
     If QDadAlu['nac_codigo'] = 9 // brasileiro naturalizado
     Then
      Begin
        If NULLToZero(QDadAlu['pes_sexo']) = 1 // masculino
        Then Result:=QNacional['nac_descmasc']
        Else Result:=QNacional['nac_descricao'];
      End
     Else Result:=QNacional['nac_descricao'];
     QNacional.Destroy;
   End
  Else Result:=''; 
End;

function GeraSenhaHex(Digitos: Integer; Min: Boolean; Mai: Boolean; Num: Boolean): string;
const
MinC = 'abcdef';
MaiC = 'ABCDEF';
NumC = '1234567890';
var
p, q : Integer;
Char, Senha: String;
begin
Randomize;
Char := '';
If Min then Char := Char + MinC;
If Mai then Char := Char + MaiC;
If Num then Char := Char + NumC;
for p := 1 to Digitos do
  begin
    q := Random(Length(Char)) + 1;
    Senha := Senha + Char[q];
  end;
Result := Senha;
end;

procedure InicializaMD(MD : TRxMemoryData);
begin
    if not MD.Active
       then MD.Open
       else MD.EmptyTable;
end;

Function Nome_Aluno(nomesocial,nomecivil,nomedefinitivo:string;virgula:boolean):string;
Begin
  If (nomecivil = '') or ((nomecivil <> '') and (UpperCase(Tira_Acentos(nomesocial)) = UpperCase(Tira_Acentos(nomecivil)))) or (nomedefinitivo = 'S')
  Then
   Begin
     If virgula
     Then Result:=nomesocial+', '
     Else Result:=nomesocial;
   End
  Else
   If virgula
   Then Result:=nomesocial+', nome civil: '+nomecivil+', '
   Else Result:=nomesocial+', nome civil: '+nomecivil;
End;

Function Verifica_Dependencia(ra:real;coddis:integer):word;
var QHist:TQuery;
Begin
  QHist:=TQuery.Create(FProcs);
  QHist.DatabaseName:='unoeste';
  QHist.Close;
  QHist.Sql.Clear;
  QHist.Sql.Add('select count(*) totrep from sca_historico');
  QHist.Sql.Add('where alu_ra =:ra and nvl(his_coddisref,dis_codigo) =:coddis and his_sitfin = "R"');
  QHist.ParamByName('ra').AsFloat:=ra;
  QHist.ParamByName('coddis').AsInteger:=coddis;
  QHist.Open;
  If NULLToZero(QHist['totrep']) = 1
  Then
   Begin
     QHist.Close;
     QHist.Sql.Clear;
     QHist.Sql.Add('select count(*) totrep from sca_historico');
     QHist.Sql.Add('where alu_ra =:ra and nvl(his_coddisref,dis_codigo) =:coddis and his_sitfin = "R" and his_pfreq >= 75');
     QHist.ParamByName('ra').AsFloat:=ra;
     QHist.ParamByName('coddis').AsInteger:=coddis;
     QHist.Open;
     Result:=NULLToZero(QHist['totrep']);
   End
  Else Result:=NULLToZero(QHist['totrep']);
  QHist.Destroy;
End;

Function Matricula_Liberada(vperlet,vsem: word;vra: Real): Boolean;
var QLibMatr:TQuery;
Begin
  Try
    QLibMatr:=TQuery.Create(FProcs);
    QLibMatr.DatabaseName:='unoeste';
    QLibMatr.Close;
    QLibMatr.Sql.Clear;
    QLibMatr.Sql.Add('select * from sca_libmatr');
    QLibMatr.Sql.Add('where lbm_perlet =:perlet and lbm_semestre =:sem and alu_ra =:ra');
    QLibMatr.ParamByName('perlet').AsSmallInt:=vperlet;
    QLibMatr.ParamByName('sem').AsSmallInt:=vsem;
    QLibMatr.ParamByName('ra').AsFloat:=vra;
    QLibMatr.Open;
    If not QLibMatr.Eof
    Then Result:=True
    Else Result:=False;
    QLibMatr.Destroy;
  Except
    Result:=False;
  End;
End;

Procedure Calcula_CHAluno(QAlunos,QGrade,QHab,QAux,QRFicha:TQuery;SPFicha:TStoredProc;var totcump:real;var totcarga:word;previa,ativ:boolean;vanoref,vsemref,tipativ,minutos:word);
var QAluAtiv:TQuery;
Begin
 totcump:=0;
 totcarga:=0;
 If QAlunos['hab_ligacao'] = 0 // Aluno está fazendo tronco comum
 Then
  Begin
   // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and dis_controle <> 8 and dis_controle <> 9 and');
   QGrade.Sql.Add('      dis_controle <> 10 and dis_controle <> 11 and dis_controle <> 13 and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra');
   If (QAlunos['cur_codigo'] <> 18) and (QAlunos['cur_codigo'] <> 22) and (QAlunos['cur_codigo'] <> 23) and
      (QAlunos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      and g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End
   Else
    If QAlunos['cur_codigo'] = 23 // Pedagogia
    Then
     Begin
      QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
      QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
     End
    Else
     If QAlunos['cur_codigo'] = 16 // Comunicação Social
     Then
      Begin
       QGrade.Sql.Add('      and (g.hab_codigo =:hab or g.hab_codigo = 2)'); // Somar Tronco Comum + Publicidade e Propaganda
       QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
   QGrade.ParambyName('codcur').AsSmallInt:=QAlunos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=Trunc(NULLToZero(QGrade['totcarga']) * minutos / 60);
   // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and (dis_controle = 9 or');
   QGrade.Sql.Add('      dis_controle = 10 or dis_controle = 11) and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra');
   If (QAlunos['cur_codigo'] <> 18) and (QAlunos['cur_codigo'] <> 22) and (QAlunos['cur_codigo'] <> 23) and
      (QAlunos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      and g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End
   Else
    If QAlunos['cur_codigo'] = 23 // Pedagogia
    Then
     Begin
      QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
      QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
     End
    Else
     If QAlunos['cur_codigo'] = 16 // Comunicação Social
     Then
      Begin
       QGrade.Sql.Add('      and (g.hab_codigo =:hab or g.hab_codigo = 2)'); // Somar Tronco Comum + Publicidade e Propaganda
       QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
   QGrade.ParambyName('codcur').AsSmallInt:=QAlunos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=totcarga + NULLToZero(QGrade['totcarga']);
   
   If (ativ) and (NULLToZero(QAlunos['obg_chativ']) <> 0) // Considerar carga horária de atividades complementares caso esteja previsto na grade do aluno
   Then
    Begin
     totcarga:=totcarga + QAlunos['obg_chativ'];
     QAluAtiv:=TQuery.Create(FProcs);
     QAluAtiv.DatabaseName:='unoeste';
     QAluAtiv.Close;
     QAluAtiv.Sql.Clear;
     QAluAtiv.Sql.Add('select sum(aat_cargahor) as totcarga');
     QAluAtiv.Sql.Add('from sca_aluatividade');
     QAluAtiv.Sql.Add('where alu_ra =:ra');
     QAluAtiv.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QAluAtiv.Open;
     If tipativ = 0 // Considerar atividades realizadas pelo aluno
     Then
      Begin
       If QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']) > 0 // Aluno ainda tem atividades complementares para cumprir
       Then totcump:=totcump + NULLToZero(QAluAtiv['totcarga'])
       Else totcump:=totcump + QAlunos['obg_chativ'];
      End
     Else
      If tipativ = 1 // Considerar 100% de atividades cumpridas
      Then totcump:=totcump + QAlunos['obg_chativ'] // Considerar que o aluno cumpriu 100% das atividades
      Else
       If tipativ = 3 // Considerar atividades cumpridas se o aluno realizou o total definido na grade
       Then
        Begin
          If (NULLToZero(QAluAtiv['totcarga']) >= QAlunos['obg_chativ']) and ((QAlunos['cur_somaativ'] = 1) or ((QAlunos['cur_somaativ'] = 2) and
             (NULLToZero(QAlunos['ahb_anoconcl']) >= NULLToZero(QAlunos['cur_anoativ']))))
          Then totcump:=totcump + QAlunos['obg_chativ']; // Aluno ainda tem atividades complementares para cumprir então considerar que ele não cumpriu as atividades
        End;
     QAluAtiv.Destroy;
    End;
   If totcarga <> 0
   Then
    Begin
     SPFicha.Close;
     SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
     SPFicha.Params[1].AsSmallInt:=QAlunos['hab_codigo'];
     SPFicha.Params[2].AsString:='*';
     SPFicha.ExecProc;
     SPFicha.Close;
     If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
        (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QHab.Close;
       QHab.Sql.Clear;
       QHab.Sql.Add('select distinct hab_codigo from sca_grades');
       QHab.Sql.Add('where cur_codigo =:codcur and grl_codgra =:codgra and hab_codigo <>:hab and hab_codigo <> 23 and');
       QHab.Sql.Add('      hab_codigo <> 52 and hab_codigo <> 53 and hab_codigo <> 54 and');
       QHab.Sql.Add('      hab_codigo <> 56 and hab_codigo <> 57 and hab_codigo <> 59 and hab_codigo <> 3');
       QHab.ParambyName('codcur').AsSmallInt:=QAlunos['cur_codigo'];
       QHab.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
       QHab.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
       QHab.Open;
       While not QHab.Eof do
       Begin
        QAux.Close;
        QAux.RequestLive:=False;
        QAux.Sql.Clear;
        QAux.Sql.Add('select * from sca_alu_hab');
        QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
        QAux.ParamByName('ra').AsFloat:=QAlunos['alu_ra'];
        QAux.ParamByName('hab').AsSmallInt:=QHab['hab_codigo'];
        QAux.Open;
        If not QAux.Eof // Aluno está matriculado na habilitação
        Then
         Begin
          SPFicha.Close;
          SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
          SPFicha.Params[1].AsSmallInt:=QHab['hab_codigo'];
          SPFicha.Params[2].AsString:='*';
          SPFicha.ExecProc;
          SPFicha.Close;
         End;
        QHab.Next;
       End;
      End;
     If (vanoref <> 0) and (vsemref <> 0) // Somar carga horária cumprida do aluno até o período letivo passado como parâmetro
     Then
      Begin
       QRFicha.Close;
       QRFicha.Sql.Clear;
       QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
       If previa
       Then
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
         QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
        End
       Else
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
         QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and alu_ra =:ra and his_sitfin = "A"');
        End;
       If vsemref = 2
       Then QRFicha.Sql.Add('and his_anoref <=:anoref')
       Else QRFicha.Sql.Add('and (his_anoref <:anoref or (his_anoref =:anoref and his_semref = 1))');
       QRFicha.ParamByName('anoref').AsSmallInt:=vanoref;
       If (QAlunos['cur_codigo'] <> 18) and (QAlunos['cur_codigo'] <> 22) and (QAlunos['cur_codigo'] <> 23) and
          (QAlunos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
       Then
        Begin
         QRFicha.Sql.Add('      and r.hab_codigo =:hab');
         QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
        End;
       QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
       QRFicha.Open;
       totcump:=totcump + NULLToZero(QRFicha['totfal']);
      End
     Else
      Begin
        QRFicha.Close;
        QRFicha.Sql.Clear;
        QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
        If previa
        Then
         Begin
          QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
          QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
         End
        Else
         Begin
          QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
          QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and alu_ra =:ra and his_sitfin = "A"');
         End;
        If (QAlunos['cur_codigo'] <> 18) and (QAlunos['cur_codigo'] <> 22) and (QAlunos['cur_codigo'] <> 23) and
           (QAlunos['cur_codigo'] <> 16) // não pode ser Educação Artística, Letras, Pedagogia, Comunicação Social
        Then
         Begin
          QRFicha.Sql.Add('      and r.hab_codigo =:hab');
          QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
         End;
        QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
        QRFicha.Open;
        totcump:=totcump + NULLToZero(QRFicha['totfal']);
      End;

     // Disciplinas adicionais
     QAux.Close;
     QAux.RequestLive:=False;
     QAux.Sql.Clear;
     QAux.Sql.Add('select * from sca_adicionais');
     QAux.Sql.Add('where alu_ra =:ra and hab_codigo =:hab');
     QAux.ParamByName('ra').AsFloat:=QAlunos['alu_ra'];
     QAux.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
     QAux.Open;
     While not QAux.Eof do
     Begin
       If NULLToInt(QAux['adi_cghora']) <> 0
       Then totcump:=totcump+QAux['adi_cghora']
       Else totcump:=totcump+NULLToZero2(QAux['adi_chreal']);
       QAux.Next;
     End;

     // Dispensas
     QAux.Close;
     QAux.RequestLive:=False;
     QAux.Sql.Clear;
     QAux.Sql.Add('select * from sca_historico h, sca_equivalencia e, sca_disciplinas d');
     QAux.Sql.Add('where h.alu_ra = e.alu_ra and h.dis_codigo = e.dis_codigo and h.dis_codigo = d.dis_codigo and h.hab_codigo = e.hab_codigo and h.alu_ra =:ra and');
     QAux.Sql.Add('      h.hab_codigo =:hab and his_codlan = 2 and dis_controle <> 8');
     QAux.ParamByName('ra').AsFloat:=QAlunos['alu_ra'];
     QAux.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
     QAux.Open;
     While not QAux.Eof do
     Begin
       If NULLToInt(QAux['equ_cghora']) <> 0
       Then totcump:=totcump+QAux['equ_cghora']
       Else totcump:=totcump+NULLToZero2(QAux['equ_cghreal']);
       QAux.Next;
     End;

     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Delete from sca_rficha');
     QRFicha.Sql.Add('where alu_ra =:ra');
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.ExecSql;
    End;
  End
 Else
  Begin
   // Carga horária das disciplinas com aulas de 50 minutos converter para hora relógio
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and dis_controle <> 8 and dis_controle <> 9 and');
   QGrade.Sql.Add('      dis_controle <> 10 and dis_controle <> 11 and dis_controle <> 13 and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra and');
   If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
      (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      (g.hab_codigo =:hab1 or g.hab_codigo =:hab2)');
     If QAlunos['cur_codigo'] = 23 // Pedagogia
     Then
      Begin
       QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
       QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
      End;
     QGrade.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
     QGrade.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
    End
   Else
    Begin
     QGrade.Sql.Add('      g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End;
   QGrade.ParambyName('codcur').AsSmallInt:=QAlunos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=Trunc(NULLToZero(QGrade['totcarga']) * minutos / 60);
   // Disciplinas de estágio, trabalho de conclusão de curso e atividades complementares sao consideradas de 60 minutos
   QGrade.Close;
   QGrade.Sql.Clear;
   QGrade.Sql.Add('select sum(gra_chteor + gra_chprat) totcarga');
   QGrade.Sql.Add('from sca_grades g, sca_disciplinas d');
   QGrade.Sql.Add('where g.dis_codigo = d.dis_codigo and g.hab_codigo = d.hab_codigo and (dis_controle = 9 or');
   QGrade.Sql.Add('      dis_controle = 10 or dis_controle = 11) and');
   QGrade.Sql.Add('      g.cur_codigo =:codcur and grl_codgra =:codgra and');
   If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
      (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
   Then
    Begin
     QGrade.Sql.Add('      (g.hab_codigo =:hab1 or g.hab_codigo =:hab2)');
     If QAlunos['cur_codigo'] = 23 // Pedagogia
     Then
      Begin
       QGrade.Sql.Add('      and g.hab_codigo <> 23 and g.hab_codigo <> 52 and g.hab_codigo <> 53 and g.hab_codigo <> 54');
       QGrade.Sql.Add('      and g.hab_codigo <> 56 and g.hab_codigo <> 57 and g.hab_codigo <> 59');
      End;
     QGrade.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
     QGrade.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
    End
   Else
    Begin
     QGrade.Sql.Add('      g.hab_codigo =:hab');
     QGrade.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
    End;
   QGrade.ParambyName('codcur').AsSmallInt:=QAlunos['cur_codigo'];
   QGrade.ParamByName('codgra').AsSmallInt:=QAlunos['ahb_codgra'];
   QGrade.Open;
   totcarga:=totcarga + NULLToZero(QGrade['totcarga']);

   If (ativ) and (NULLToZero(QAlunos['obg_chativ']) <> 0) // Considerar carga horária de atividades complementares caso esteja previsto na grade do aluno
   Then
    Begin
     totcarga:=totcarga + QAlunos['obg_chativ'];
     QAluAtiv:=TQuery.Create(FProcs);
     QAluAtiv.DatabaseName:='unoeste';
     QAluAtiv.Close;
     QAluAtiv.Sql.Clear;
     QAluAtiv.Sql.Add('select sum(aat_cargahor) as totcarga');
     QAluAtiv.Sql.Add('from sca_aluatividade');
     QAluAtiv.Sql.Add('where alu_ra =:ra');
     QAluAtiv.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QAluAtiv.Open;
     If tipativ = 0 // Considerar atividades realizadas pelo aluno
     Then
      Begin
       If QAlunos['obg_chativ'] - NULLToZero(QAluAtiv['totcarga']) > 0 // Aluno ainda tem atividades complementares para cumprir
       Then totcump:=totcump + NULLToZero(QAluAtiv['totcarga'])
       Else totcump:=totcump + QAlunos['obg_chativ'];
      End
     Else
      If tipativ = 1 // Considerar 100% de atividades cumpridas
      Then totcump:=totcump + QAlunos['obg_chativ'] // Considerar que o aluno cumpriu 100% das atividades
      Else
       If tipativ = 3 // Considerar atividades cumpridas se o aluno realizou o total definido na grade
       Then
        Begin
          If (NULLToZero(QAluAtiv['totcarga']) >= QAlunos['obg_chativ']) and ((QAlunos['cur_somaativ'] = 1) or ((QAlunos['cur_somaativ'] = 2) and
             (NULLToZero(QAlunos['ahb_anoconcl']) >= NULLToZero(QAlunos['cur_anoativ']))))
          Then totcump:=totcump + QAlunos['obg_chativ'];
        End;

     QAluAtiv.Destroy;
    End;
   If totcarga <> 0
   Then
    Begin
     SPFicha.Close;
     SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
     SPFicha.Params[1].AsSmallInt:=QAlunos['hab_codigo'];
     SPFicha.Params[2].AsString:='*';
     SPFicha.ExecProc;
     SPFicha.Close;
     If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
        (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       SPFicha.Params[0].AsFloat:=QAlunos['alu_ra'];
       SPFicha.Params[1].AsSmallInt:=QAlunos['hab_ligacao'];
       SPFicha.Params[2].AsString:='*';
       SPFicha.ExecProc;
       SPFicha.Close;
      End;
     If (vanoref <> 0) and (vsemref <> 0) // Somar carga horária cumprida do aluno até o período letivo passado como parâmetro
     Then
      Begin
       QRFicha.Close;
       QRFicha.Sql.Clear;
       QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
       If previa
       Then
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
         QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and  alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
        End
       Else
        Begin
         QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
         QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and alu_ra =:ra and his_sitfin = "A"');
        End;
       If vsemref = 2
       Then QRFicha.Sql.Add('and his_anoref <=:anoref')
       Else QRFicha.Sql.Add('and (his_anoref <:anoref or (his_anoref =:anoref and his_semref = 1))');
       QRFicha.ParamByName('anoref').AsSmallInt:=vanoref;
       If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
          (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
       Then
        Begin
         QRFicha.Sql.Add('      and (r.hab_codigo =:hab1 or r.hab_codigo =:hab2)');
         QRFicha.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
         QRFicha.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
        End
       Else
        Begin
         QRFicha.Sql.Add('      and r.hab_codigo =:hab');
         QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
        End;
       QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
       QRFicha.Open;
       totcump:= totcump + NULLToZero(QRFicha['totfal']);
      End
     Else
      Begin
        QRFicha.Close;
        QRFicha.Sql.Clear;
        QRFicha.Sql.Add('Select sum(his_chminima) totfal from sca_rficha r, sca_disciplinas d');
        If previa
        Then
         Begin
          QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
          QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and alu_ra =:ra and (his_sitfin = "A" or his_sitfin = "N")'); // considerar como aprovado as disciplinas que o aluno está cursando
         End
        Else
         Begin
          QRFicha.Sql.Add('where r.dis_codigo = d.dis_codigo and d.dis_controle <> 8');
          QRFicha.Sql.Add('      and his_codlan <> 2 and his_codlan <> 8 and his_codlan <> 9 and his_codlan <> 10 and alu_ra =:ra and his_sitfin = "A"');
         End;
        If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
           (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
        Then
         Begin
          QRFicha.Sql.Add('      and (r.hab_codigo =:hab1 or r.hab_codigo =:hab2)');
          QRFicha.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
          QRFicha.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
         End
        Else
         Begin
          QRFicha.Sql.Add('      and r.hab_codigo =:hab');
          QRFicha.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
         End;
        QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
        QRFicha.Open;
        totcump:= totcump + NULLToZero(QRFicha['totfal']);
      End;

     // Disciplinas adicionais
     QAux.Close;
     QAux.RequestLive:=False;
     QAux.Sql.Clear;
     QAux.Sql.Add('select * from sca_adicionais');
     QAux.Sql.Add('where alu_ra =:ra');
     If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
        (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QAux.Sql.Add('      and (hab_codigo =:hab1 or hab_codigo =:hab2)');
       QAux.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
       QAux.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
      End
     Else
      Begin
       QAux.Sql.Add('      and hab_codigo =:hab');
       QAux.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
     QAux.ParamByName('ra').AsFloat:=QAlunos['alu_ra'];
     QAux.Open;
     While not QAux.Eof do
     Begin
       If NULLToInt(QAux['adi_cghora']) <> 0
       Then totcump:=totcump+QAux['adi_cghora']
       Else totcump:=totcump+NULLToZero2(QAux['adi_chreal']);
       QAux.Next;
     End;


     // Dispensas                                                
     QAux.Close;
     QAux.RequestLive:=False;
     QAux.Sql.Clear;
     QAux.Sql.Add('select * from sca_historico h, sca_equivalencia e, sca_disciplinas d');
     QAux.Sql.Add('where h.alu_ra = e.alu_ra and h.dis_codigo = e.dis_codigo and h.dis_codigo = d.dis_codigo and h.hab_codigo = e.hab_codigo and h.alu_ra =:ra and');
     QAux.Sql.Add('      his_codlan = 2 and dis_controle <> 8');
     If (QAlunos['cur_codigo'] = 18) or (QAlunos['cur_codigo'] = 22) or (QAlunos['cur_codigo'] = 23) or
        (QAlunos['cur_codigo'] = 16) // Educação Artística, Letras, Pedagogia, Comunicação Social
     Then
      Begin
       QAux.Sql.Add('      and (h.hab_codigo =:hab1 or h.hab_codigo =:hab2)');
       QAux.ParamByName('hab1').AsSmallInt:=QAlunos['hab_codigo'];
       QAux.ParamByName('hab2').AsSmallInt:=QAlunos['hab_ligacao'];
      End
     Else
      Begin
       QAux.Sql.Add('      and h.hab_codigo =:hab');
       QAux.ParamByName('hab').AsSmallInt:=QAlunos['hab_codigo'];
      End;
     QAux.ParamByName('ra').AsFloat:=QAlunos['alu_ra'];
     QAux.Open;
     While not QAux.Eof do
     Begin
       If NULLToInt(QAux['equ_cghora']) <> 0
       Then totcump:=totcump+QAux['equ_cghora']
       Else totcump:=totcump+NULLToZero2(QAux['equ_cghreal']);
       QAux.Next;
     End;

     QRFicha.Close;
     QRFicha.Sql.Clear;
     QRFicha.Sql.Add('Delete from sca_rficha');
     QRFicha.Sql.Add('where alu_ra =:ra');
     QRFicha.ParambyName('ra').AsFloat:=QAlunos['alu_ra'];
     QRFicha.ExecSql;
    End;
  End;
End;

Procedure Verifica_Professor(MTProfessor:TMemoryTable;QAux,QHorAula:TQuery;vmatr,vano,vsem:integer;tipo:word);
var hora1, hora2, dataini1, datafim1, dataini2, datafim2:TDateTime;
    dia1, dia2, horini, horfim, minini, minfim, seg, mseg, tempodif, vdiasem,
    vperiodo, vcodcur1, vcodcur2, aulafim:word;
    vmatraux:integer;
    vnomcur1, vnomcur2:String;
    Dia: Array[1..7] of String;
    Periodo: Array[1..3] of String;
Begin
  Dia[1]:='DOMINGO';
  Dia[2]:='SEGUNDA';
  Dia[3]:='TERÇA';
  Dia[4]:='QUARTA';
  Dia[5]:='QUINTA';
  Dia[6]:='SEXTA';
  Dia[7]:='SABADO';

  Periodo[1]:='MANHÃ';
  Periodo[2]:='TARDE';
  Periodo[3]:='NOITE';

  MTProfessor.Close;
  MTProfessor.EmptyTable;
  MTProfessor.Open;

  // O Elias disse que não era mais necessário fazer a validação do intervalo menor do que 11 horas entre um dia e outro de aula - 07/11/2017
{  If tipo = 1
  Then
   Begin
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select p.fun_matr, pro_sacento, rei_diasem, rei_periodo, rei_tipo, max(rei_aulafim) aula from sca_reitprof r, sca_professor p');
     QAux.Sql.Add('where r.fun_matr = p.fun_matr and dst_perlet =:perlet and dst_semref =:semref and ((rei_tipo = 1) or (rei_tipo = 11 and auc_seq <> 74)) and rei_periodo = 3');
     If vmatr <> 0
     Then QAux.Sql.Add('and p.fun_matr =:matr');
     QAux.Sql.Add('group by 1,2,3,4,5');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select p.fun_matr, pro_sacento, rei_diasem, rei_periodo, rei_tipo, min(rei_aulaini) aula from sca_reitprof r, sca_professor p');
     QAux.Sql.Add('where r.fun_matr = p.fun_matr and dst_perlet =:perlet and dst_semref =:semref and ((rei_tipo = 1) or (rei_tipo = 11 and auc_seq <> 74)) and rei_periodo = 1');
     If vmatr <> 0
     Then QAux.Sql.Add('and p.fun_matr =:matr');
     QAux.Sql.Add('group by 1,2,3,4,5');
     QAux.Sql.Add('order by 2,1,3,4');
     QAux.ParamByName('perlet').AsInteger:=vano;
     QAux.ParamByName('semref').AsInteger:=vsem;
     If vmatr <> 0
     Then QAux.ParamByName('matr').AsInteger:=vmatr;
     QAux.Open;
     dia1:=0;
     dia2:=0;
     hora1:=0;
     hora2:=0;
     vmatraux:=NULLToZero(QAux['fun_matr']);
     // procura professores que tem um intervalo menor do que 11 horas entre um dia e outro de aula
     While not QAux.Eof do
     Begin
       If vmatraux = QAux['fun_matr']
       Then
        Begin
          If dia1 <> 0
          Then
           Begin
             If (dia1 + 1 = QAux['rei_diasem']) and (QAux['rei_periodo'] = 1) // o professor possui aula no período da manhã no dia seguinte a aula no período da noite
             Then
              Begin
                QHorAula.Close;
                QHorAula.Sql.Clear;
                If QAux['rei_tipo'] = 1 // horário de disciplina
                Then
                 Begin
                   QHorAula.Sql.Add('select hor_horaini, dst_calini, dst_calfim, r.cur_codigo, cur_nomcur from sca_horaula h, sca_reitprof r, sca_disc_tur dt, sca_disciplinas d, sca_cursos c');
                   QHorAula.Sql.Add('where h.cur_codigo = r.cur_codigo and hor_perlet = r.dst_perlet and hor_semref = r.dst_semref and h.cur_codigo = c.cur_codigo and');
                   QHorAula.Sql.Add('      rei_periodo = hor_periodo and rei_aulaini = hor_aula and r.dis_codigo = d.dis_codigo and');
                   QHorAula.Sql.Add('      r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
                   QHorAula.Sql.Add('      ((dis_controle = 9 and hor_tipaula = 1) or (dis_controle <> 9 and hor_tipaula = 0)) and');
                   QHorAula.Sql.Add('      r.fun_matr =:matr and dt.dst_perlet =:perlet and dt.dst_semref =:semref and rei_periodo =:periodo and');
                   QHorAula.Sql.Add('      rei_diasem =:diasem and rei_aulaini =:aula');
                 End
                Else
                 Begin
                   If vsem = 1 // 1º semestre
                   Then QHorAula.Sql.Add('select hor_horaini, cld_diaini dst_calini, cld_diafim dst_calfim, r.cur_codigo, cur_nomcur from sca_horaula h, sca_reitprof r, sca_cursos c, sca_caldias cd')
                   Else QHorAula.Sql.Add('select hor_horaini, cld_inisem2 dst_calini, cld_fimsem2 dst_calfim, r.cur_codigo, cur_nomcur from sca_horaula h, sca_reitprof r, sca_cursos c, sca_caldias cd');
                   QHorAula.Sql.Add('where h.cur_codigo = r.cur_codigo and hor_perlet = r.dst_perlet and hor_semref = r.dst_semref and h.cur_codigo = c.cur_codigo and');
                   QHorAula.Sql.Add('      h.cur_codigo = cd.cur_codigo and hor_perlet = cld_periodo and');
                   QHorAula.Sql.Add('      rei_periodo = hor_periodo and rei_aulaini = hor_aula and hor_tipaula = 0 and');
                   QHorAula.Sql.Add('      r.fun_matr =:matr and r.dst_perlet =:perlet and r.dst_semref =:semref and rei_periodo =:periodo and');
                   QHorAula.Sql.Add('      rei_diasem =:diasem and rei_aulaini =:aula');
                 End;
                QHorAula.Sql.Add('order by 1');
                QHorAula.ParamByName('perlet').AsInteger:=vano;
                QHorAula.ParamByName('semref').AsInteger:=vsem;
                QHorAula.ParamByName('matr').AsInteger:=QAux['fun_matr'];
                QHorAula.ParamByName('periodo').AsInteger:=QAux['rei_periodo'];
                QHorAula.ParamByName('diasem').AsInteger:=QAux['rei_diasem'];
                QHorAula.ParamByName('aula').AsInteger:=QAux['aula'];
                QHorAula.Open;

                hora2:=QHorAula['hor_horaini'];
                dia2:=QAux['rei_diasem'];
                dataini2:=QHorAula['dst_calini'];
                datafim2:=QHorAula['dst_calfim'];
                vcodcur2:=QHorAula['cur_codigo'];
                vnomcur2:=QHorAula['cur_nomcur'];
                DecodeTime(QHorAula['hor_horaini'], horfim, minfim, seg, mseg);
                tempodif:=(24-horini)+(horfim);
                If minfim < minini
                Then tempodif:=tempodif - 1;
                If (tempodif < 11) and (dataini1 <= datafim2) and (datafim1 >= dataini2)
                Then
                 Begin
                   MTProfessor.Append;
                   MTProfessor['fun_matr']:=QAux['fun_matr'];
                   MTProfessor['pes_nome']:=QAux['pro_sacento'];
                   If vcodcur1 <> vcodcur2
                   Then MTProfessor['obs']:='Professor(a) possui aula na '+DIA[dia1]+' até as '+TimeToStr(hora1)+' em '+vnomcur1+' e aula na '+DIA[dia2]+' iniciando as '+TimeToStr(hora2)+' em '+vnomcur2+'.'
                   Else MTProfessor['obs']:='Professor(a) possui aula na '+DIA[dia1]+' até as '+TimeToStr(hora1)+' e aula na '+DIA[dia2]+' iniciando as '+TimeToStr(hora2)+' em '+vnomcur1+'.';
                   MTProfessor['tipo']:=1;
                   MTProfessor['diasem']:=dia1;
                   MTProfessor.Post;
                 End;
                QAux.Next;
              End;
             dia1:=0;
             dia2:=0;
             hora1:=0;
             hora2:=0;
           End
          Else
           Begin
             If QAux['rei_periodo'] = 3
             Then
              Begin
                QHorAula.Close;
                QHorAula.Sql.Clear;
                If QAux['rei_tipo'] = 1 // horário de disciplina
                Then
                 Begin
                   QHorAula.Sql.Add('select hor_horafim, dst_calini, dst_calfim, r.cur_codigo, cur_nomcur from sca_horaula h, sca_reitprof r, sca_disc_tur dt, sca_disciplinas d, sca_cursos c');
                   QHorAula.Sql.Add('where h.cur_codigo = r.cur_codigo and hor_perlet = r.dst_perlet and hor_semref = r.dst_semref and h.cur_codigo = c.cur_codigo and');
                   QHorAula.Sql.Add('      rei_periodo = hor_periodo and rei_aulafim = hor_aula and r.dis_codigo = d.dis_codigo and');
                   QHorAula.Sql.Add('      r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and');
                   QHorAula.Sql.Add('      ((dis_controle = 9 and hor_tipaula = 1) or (dis_controle <> 9 and hor_tipaula = 0)) and');
                   QHorAula.Sql.Add('      r.fun_matr =:matr and dt.dst_perlet =:perlet and dt.dst_semref =:semref and rei_periodo =:periodo and');
                   QHorAula.Sql.Add('      rei_diasem =:diasem and rei_aulafim =:aula');
                 End
                Else
                 Begin
                   If vsem = 1 // 1º semestre
                   Then QHorAula.Sql.Add('select hor_horafim, cld_diaini dst_calini, cld_diafim dst_calfim, r.cur_codigo, cur_nomcur from sca_horaula h, sca_reitprof r, sca_cursos c, sca_caldias cd')
                   Else QHorAula.Sql.Add('select hor_horafim, cld_inisem2 dst_calini, cld_fimsem2 dst_calfim, r.cur_codigo, cur_nomcur from sca_horaula h, sca_reitprof r, sca_cursos c, sca_caldias cd');
                   QHorAula.Sql.Add('where h.cur_codigo = r.cur_codigo and hor_perlet = r.dst_perlet and hor_semref = r.dst_semref and h.cur_codigo = c.cur_codigo and');
                   QHorAula.Sql.Add('      h.cur_codigo = cd.cur_codigo and hor_perlet = cld_periodo and');
                   QHorAula.Sql.Add('      rei_periodo = hor_periodo and rei_aulafim = hor_aula and hor_tipaula = 0 and');
                   QHorAula.Sql.Add('      r.fun_matr =:matr and r.dst_perlet =:perlet and r.dst_semref =:semref and rei_periodo =:periodo and');
                   QHorAula.Sql.Add('      rei_diasem =:diasem and rei_aulafim =:aula');
                 End;
                QHorAula.Sql.Add('order by 1 desc');
                QHorAula.ParamByName('perlet').AsInteger:=vano;
                QHorAula.ParamByName('semref').AsInteger:=vsem;
                QHorAula.ParamByName('matr').AsInteger:=QAux['fun_matr'];
                QHorAula.ParamByName('periodo').AsInteger:=QAux['rei_periodo'];
                QHorAula.ParamByName('diasem').AsInteger:=QAux['rei_diasem'];
                QHorAula.ParamByName('aula').AsInteger:=QAux['aula'];
                QHorAula.Open;

                hora1:=QHorAula['hor_horafim'];
                dia1:=QAux['rei_diasem'];
                dataini1:=QHorAula['dst_calini'];
                datafim1:=QHorAula['dst_calfim'];
                vcodcur1:=QHorAula['cur_codigo'];
                vnomcur1:=QHorAula['cur_nomcur'];
                DecodeTime(QHorAula['hor_horafim'], horini, minini, seg, mseg);
              End;
             QAux.Next;
           End;
        End
       Else
        Begin
          vmatraux:=QAux['fun_matr'];
          dia1:=0;
          dia2:=0;
          hora1:=0;
          hora2:=0;
        End;
     End;
   End;}

  If (tipo = 1) or (tipo = 2) or (tipo = 99)
  Then
   Begin
     // professores que possuem mais do que 8 aulas atribuídas em um dia da semana - foi alterado para 10 a pedido do Creste - 05/02/2018

     // criar tabelas temporárias para armazenar a quantidade de aulas por dia da semana das disciplinas com período específico
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select p.fun_matr, pro_sacento, hrp_data, weekday(hrp_data) + 1 rei_diasem, sum(hrp_nroaulas) totaulas');
     QAux.Sql.Add('from sca_horprof h, sca_professor p');
     QAux.Sql.Add('where h.fun_matr = p.fun_matr and dst_perlet =:perlet and dst_semref =:semref and weekday(hrp_data) <> 6');
     If vmatr <> 0
     Then QAux.Sql.Add('and p.fun_matr =:matr');
     QAux.Sql.Add('group by 1,2,3,4');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select p.fun_matr, pro_sacento, hrp_data, weekday(hrp_data) + 1 rei_diasem, sum(hrp_nroaulas) totaulas');
     QAux.Sql.Add('from sca_horprof h, sca_professor p');
     QAux.Sql.Add('where h.fun_matr = p.fun_matr and dst_perlet =:perlet and dst_semref =:semref and weekday(hrp_data) = 6');
     If vmatr <> 0
     Then
      Begin
        QAux.Sql.Add('and p.fun_matr =:matr');
        QAux.ParamByName('matr').AsInteger:=vmatr;
      End;
     QAux.Sql.Add('group by 1,2,3,4');
     QAux.Sql.Add('into temp tmp_horprof');
     QAux.ParamByName('perlet').AsInteger:=vano;
     QAux.ParamByName('semref').AsInteger:=vsem;
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select fun_matr, pro_sacento, rei_diasem, max(totaulas) totaulas from tmp_horprof');
     QAux.Sql.Add('group by 1,2,3');
     QAux.Sql.Add('into temp tmp_horprof2');
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select r.fun_matr, pro_sacento, rei_diasem, sum(rei_semanal) totaulas from sca_reitprof r, sca_disc_tur dt, sca_professor p');
     QAux.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and r.dst_codtur = dt.dst_codtur and');
     QAux.Sql.Add('      r.fun_matr = p.fun_matr and dt.dst_perlet =:perlet and dt.dst_semref =:semref and rei_tipo = 1 and dst_periodo = "N"');
     If vmatr <> 0
     Then QAux.Sql.Add('and p.fun_matr =:matr');
     QAux.Sql.Add('group by 1,2,3');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select r.fun_matr, pro_sacento, rei_diasem, sum(rei_semanal) totaulas from sca_reitprof r, sca_professor p');
     QAux.Sql.Add('where r.fun_matr = p.fun_matr and r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 11 and auc_seq <> 74');
     If vmatr <> 0
     Then
      Begin
        QAux.Sql.Add('and p.fun_matr =:matr');
        QAux.ParamByName('matr').AsInteger:=vmatr;
      End;
     QAux.Sql.Add('group by 1,2,3');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select fun_matr, pro_sacento, rei_diasem, totaulas from tmp_horprof2');
     QAux.Sql.Add('into temp tmp_reitprof');
     QAux.ParamByName('perlet').AsInteger:=vano;
     QAux.ParamByName('semref').AsInteger:=vsem;
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select fun_matr, pro_sacento, rei_diasem, sum(totaulas) from tmp_reitprof');
     QAux.Sql.Add('where rei_diasem <> 7');
     QAux.Sql.Add('group by 1,2,3');
//     QAux.Sql.Add('having sum(totaulas) > 8');
     QAux.Sql.Add('having sum(totaulas) > 10');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select fun_matr, pro_sacento, rei_diasem, sum(totaulas) from tmp_reitprof');
     QAux.Sql.Add('where rei_diasem = 7');
     QAux.Sql.Add('group by 1,2,3');
//     QAux.Sql.Add('having sum(totaulas) > 4');
     QAux.Sql.Add('having sum(totaulas) > 5');
     QAux.Open;
     While not QAux.Eof do
     Begin
       vdiasem:=QAux['rei_diasem'];
       MTProfessor.Append;
       MTProfessor['fun_matr']:=QAux['fun_matr'];
       MTProfessor['pes_nome']:=QAux['pro_sacento'];
       If (tipo = 1) or (tipo = 99)
       Then
        Begin
          If vdiasem = 7 // sábado
          Then MTProfessor['obs']:='Professor(a) possui mais do que 5 aulas no '+DIA[vdiasem]+'.'
          Else MTProfessor['obs']:='Professor(a) possui mais do que 10 aulas na '+DIA[vdiasem]+'.'; //MTProfessor['obs']:='Professor(a) possui mais do que 8 aulas na '+DIA[vdiasem]+'.';
        End
       Else
        If vdiasem = 7 // sábado
        Then MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com mais do que 4 aulas no '+DIA[vdiasem]+'.'
        Else MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com mais do que 10 aulas na '+DIA[vdiasem]+'.'; //MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com mais do que 8 aulas na '+DIA[vdiasem]+'.';
       MTProfessor['tipo']:=2;
       MTProfessor['diasem']:=vdiasem;
       MTProfessor.Post;
       QAux.Next;
     End;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('drop table tmp_reitprof');
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('drop table tmp_horprof');
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('drop table tmp_horprof2');
     QAux.ExecSql;

     // professores que possuem mais do que 8 aulas atribuídas em um dia da semana em disciplinas com período específico - foi alterado para 10 a pedido do Creste - 05/02/2018
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select p.fun_matr, pro_sacento, hrp_data, weekday(hrp_data) + 1 diasem, sum(hrp_nroaulas) totaulas');
     QAux.Sql.Add('from sca_horprof h, sca_professor p');
     QAux.Sql.Add('where h.fun_matr = p.fun_matr and dst_perlet =:perlet and dst_semref =:semref and weekday(hrp_data) <> 6');
     If vmatr <> 0
     Then QAux.Sql.Add('and p.fun_matr =:matr');
     QAux.Sql.Add('group by 1,2,3,4');
//     QAux.Sql.Add('having sum(hrp_nroaulas) > 8');
     QAux.Sql.Add('having sum(hrp_nroaulas) > 10');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select p.fun_matr, pro_sacento, hrp_data, weekday(hrp_data) + 1 diasem, sum(hrp_nroaulas) totaulas');
     QAux.Sql.Add('from sca_horprof h, sca_professor p');
     QAux.Sql.Add('where h.fun_matr = p.fun_matr and dst_perlet =:perlet and dst_semref =:semref and weekday(hrp_data) = 6');
     If vmatr <> 0
     Then
      Begin
        QAux.Sql.Add('and p.fun_matr =:matr');
        QAux.ParamByName('matr').AsInteger:=vmatr;
      End;
     QAux.Sql.Add('group by 1,2,3,4');
//     QAux.Sql.Add('having sum(hrp_nroaulas) > 4');
     QAux.Sql.Add('having sum(hrp_nroaulas) > 5');
     QAux.ParamByName('perlet').AsInteger:=vano;
     QAux.ParamByName('semref').AsInteger:=vsem;
     QAux.Open;
     While not QAux.Eof do
     Begin
       vdiasem:=QAux['diasem'];
       If not Find(MTProfessor,['fun_matr','diasem','tipo'],[QAux['fun_matr'],vdiasem,2],true)
       Then
        Begin
          MTProfessor.Append;
          MTProfessor['fun_matr']:=QAux['fun_matr'];
          MTProfessor['pes_nome']:=QAux['pro_sacento'];
          If (tipo = 1) or (tipo = 3)
          Then
           Begin
             If vdiasem = 7 // sábado
             Then MTProfessor['obs']:='Professor(a) possui mais do que 5 aulas no '+DIA[vdiasem]+'.'
             Else MTProfessor['obs']:='Professor(a) possui mais do que 10 aulas na '+DIA[vdiasem]+'.'; //MTProfessor['obs']:='Professor(a) possui mais do que 8 aulas na '+DIA[vdiasem]+'.';
           End
          Else
           If vdiasem = 7 // sábado
           Then MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com mais do que 5 aulas no '+DIA[vdiasem]+'.'
           Else MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com mais do que 10 aulas na '+DIA[vdiasem]+'.'; //MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com mais do que 8 aulas na '+DIA[vdiasem]+'.';
          MTProfessor['tipo']:=2;
          MTProfessor['diasem']:=vdiasem;
          MTProfessor.Post;
        End;
       QAux.Next;
     End;
   End;

  If tipo = 1
  Then
   Begin
     // professores que possuem mais do que 4 aulas atribuídas em um dia da semana e no mesmo período - foi alterado para 5 a pedido do Creste - 05/02/2018

     // criar tabelas temporárias para armazenar a quantidade de aulas por dia da semana das disciplinas com período específico
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select p.fun_matr, pro_sacento, hrp_periodo rei_periodo, hrp_data, weekday(hrp_data) + 1 rei_diasem, sum(hrp_nroaulas) totaulas');
     QAux.Sql.Add('from sca_horprof h, sca_professor p');
     QAux.Sql.Add('where h.fun_matr = p.fun_matr and dst_perlet =:perlet and dst_semref =:semref');
     If vmatr <> 0
     Then
      Begin
        QAux.Sql.Add('and p.fun_matr =:matr');
        QAux.ParamByName('matr').AsInteger:=vmatr;
      End;
     QAux.Sql.Add('group by 1,2,3,4,5');
     QAux.Sql.Add('into temp tmp_horprof');
     QAux.ParamByName('perlet').AsInteger:=vano;
     QAux.ParamByName('semref').AsInteger:=vsem;
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select fun_matr, pro_sacento, rei_periodo, rei_diasem, max(totaulas) totaulas from tmp_horprof');
     QAux.Sql.Add('group by 1,2,3,4');
     QAux.Sql.Add('into temp tmp_horprof2');
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select r.fun_matr, pro_sacento, rei_periodo, rei_diasem, sum(rei_semanal) totaulas from sca_reitprof r, sca_disc_tur dt, sca_professor p');
     QAux.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and r.dst_codtur = dt.dst_codtur and');
     QAux.Sql.Add('      r.fun_matr = p.fun_matr and dt.dst_perlet =:perlet and dt.dst_semref =:semref and rei_tipo = 1 and dst_periodo = "N"');
     If vmatr <> 0
     Then QAux.Sql.Add('and p.fun_matr =:matr');
     QAux.Sql.Add('group by 1,2,3,4');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select r.fun_matr, pro_sacento, rei_periodo, rei_diasem, sum(rei_semanal) totaulas from sca_reitprof r, sca_professor p');
     QAux.Sql.Add('where r.fun_matr = p.fun_matr and r.dst_perlet =:perlet and r.dst_semref =:semref and rei_tipo = 11 and auc_seq <> 74');
     If vmatr <> 0
     Then
      Begin
        QAux.Sql.Add('and p.fun_matr =:matr');
        QAux.ParamByName('matr').AsInteger:=vmatr;
      End;
     QAux.Sql.Add('group by 1,2,3,4');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select fun_matr, pro_sacento, rei_periodo, rei_diasem, totaulas from tmp_horprof2');
     QAux.Sql.Add('into temp tmp_reitprof');
     QAux.ParamByName('perlet').AsInteger:=vano;
     QAux.ParamByName('semref').AsInteger:=vsem;
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select fun_matr, pro_sacento, rei_periodo, rei_diasem, sum(totaulas) from tmp_reitprof');
     QAux.Sql.Add('group by 1,2,3,4');
//     QAux.Sql.Add('having sum(totaulas) > 4');
     QAux.Sql.Add('having sum(totaulas) > 5');
     QAux.Open;
     While not QAux.Eof do
     Begin
       vdiasem:=QAux['rei_diasem'];
       vperiodo:=QAux['rei_periodo'];
       MTProfessor.Append;
       MTProfessor['fun_matr']:=QAux['fun_matr'];
       MTProfessor['pes_nome']:=QAux['pro_sacento'];
       MTProfessor['obs']:='Professor(a) possui mais do que 5 aulas na '+DIA[vdiasem]+' no período da '+Periodo[vperiodo]+'.'; //MTProfessor['obs']:='Professor(a) possui mais do que 4 aulas na '+DIA[vdiasem]+' no período da '+Periodo[vperiodo]+'.';
       MTProfessor['tipo']:=3;
       MTProfessor['diasem']:=vdiasem;
       MTProfessor.Post;
       QAux.Next;
     End;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('drop table tmp_reitprof');
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('drop table tmp_horprof');
     QAux.ExecSql;

     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('drop table tmp_horprof2');
     QAux.ExecSql;
   End;

  If (tipo = 1) or (tipo = 2) or (tipo = 3) or (tipo = 99)
  Then
   Begin
     // procura professores que possuem lacunas entre as aulas
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select distinct r.fun_matr, pro_sacento, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim, c.cur_codigo, cur_nomcur');
     QAux.Sql.Add('from sca_reitprof r, sca_disc_tur dt, sca_professor p, sca_cursos c');
     QAux.Sql.Add('where r.dst_perlet = dt.dst_perlet and r.dst_semref = dt.dst_semref and r.dis_codigo = dt.dis_codigo and r.dst_codtur = dt.dst_codtur');
     QAux.Sql.Add('      and r.fun_matr = p.fun_matr and r.cur_codigo = c.cur_codigo and dt.dst_perlet =:perlet and dt.dst_semref =:semref and rei_diasem is not null');
     QAux.Sql.Add('      and rei_tipo = 1');
     If vmatr <> 0
     Then QAux.Sql.Add('and p.fun_matr =:matr');
     QAux.Sql.Add('union');
     QAux.Sql.Add('select distinct r.fun_matr, pro_sacento, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim, c.cur_codigo, cur_nomcur');
     QAux.Sql.Add('from sca_reitprof r, sca_professor p, sca_cursos c');
     QAux.Sql.Add('where r.fun_matr = p.fun_matr and r.cur_codigo = c.cur_codigo and dst_perlet =:perlet and dst_semref =:semref and rei_tipo = 11');// and auc_seq <> 74'); O Nei pediu para considerar o CAC neste caso - 27/02/2018 
     If vmatr <> 0
     Then
      Begin
        QAux.Sql.Add('and p.fun_matr =:matr');
        QAux.ParamByName('matr').AsInteger:=vmatr;
      End;
     QAux.Sql.Add('order by pro_sacento, r.fun_matr, rei_periodo, rei_diasem, rei_aulaini, rei_aulafim');
     QAux.ParamByName('perlet').AsSmallInt:=vano;
     QAux.ParamByName('semref').AsSmallInt:=vsem;
     QAux.Open;

     vperiodo:=0;
     vdiasem:=0;
     vmatraux:=0;
     While not QAux.Eof do
     Begin
       If (QAux['rei_periodo'] <> vperiodo) or (QAux['rei_diasem'] <> vdiasem) or (QAux['fun_matr'] <> vmatraux)
       Then
        Begin
          vperiodo:=QAux['rei_periodo'];
          vdiasem:=QAux['rei_diasem'];
          aulafim:=QAux['rei_aulafim'];
          vmatraux:=QAux['fun_matr'];
          vcodcur1:=QAux['cur_codigo'];
          vnomcur1:=QAux['cur_nomcur'];
        End
       Else
        Begin
          If QAux['rei_aulaini'] > aulafim + 1
          Then
           Begin
             MTProfessor.Append;
             MTProfessor['fun_matr']:=QAux['fun_matr'];
             MTProfessor['pes_nome']:=QAux['pro_sacento'];
             If (tipo = 1) or (tipo = 99)
             Then
              Begin
                If vcodcur1 <> QAux['cur_codigo']
                Then MTProfessor['obs']:='Professor(a) possui intervalo entre aulas na '+DIA[vdiasem]+' no período da '+Periodo[vperiodo]+' entre '+vnomcur1+' e '+QAux['cur_nomcur']+'.'
                Else MTProfessor['obs']:='Professor(a) possui intervalo entre aulas na '+DIA[vdiasem]+' no período da '+Periodo[vperiodo]+' em '+vnomcur1+'.';
              End
             Else
              If vcodcur1 <> QAux['cur_codigo']
              Then MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com intervalo entre aulas na '+DIA[vdiasem]+' no período da '+Periodo[vperiodo]+' entre '+vnomcur1+' e '+QAux['cur_nomcur']+'.'
              Else MTProfessor['obs']:='Professor(a) '+MTProfessor['pes_nome']+' ficará com intervalo entre aulas na '+DIA[vdiasem]+' no período da '+Periodo[vperiodo]+' em '+vnomcur1+'.';
             MTProfessor['tipo']:=4;
             MTProfessor['diasem']:=vdiasem;
             MTProfessor.Post;
           End;
          aulafim:=QAux['rei_aulafim'];
        End;
       QAux.Next;
     End;
   End;

  OrderBy(MTProfessor,['pes_nome', 'fun_matr', 'tipo', 'diasem']);
End;

Procedure Mostra_Linhas(TF:TForm; Visivel:Boolean);
var I:Integer;
Begin
  With TF do
  For I:=0 to ComponentCount - 1 do
  Begin
    If (Components[I] is TppLine) and (Components[I].Tag = 2)
    Then TppLine(Components[I]).Visible:=Visivel;
    If (Components[I] is TppShape) and (Components[I].Tag = 2)
    Then TppShape(Components[I]).Visible:=Visivel;
  End;
End;

Procedure Atualiza_Catraca;
var arq,linha,linha2:string;
    ArqTxt,Copia:TextFile;
    tam:word;
    vra:real;
    QAluno:TQuery;
Begin
  arq:='d:\temp\Alunos sem cadastro.txt';
  If InputQuery('Atualização Catraca', 'Entre com nome do arquivo', arq)
  Then
   Begin
     Try
       QAluno:=TQuery.Create(FProcs);
       QAluno.DatabaseName:='unoeste';

       AssignFile(Copia,'d:\temp\Alunos sem cadastro-2.txt');
       Rewrite(Copia);

       AssignFile(ArqTxt,arq);
       Reset(ArqTxt);
       While not Eof(ArqTxt) do
       Begin
         Readln(ArqTxt,linha);
         tam:=Length(linha);
         If tam = 14
         Then vra:=StrToFloat(Copy(linha,5,10))
         Else vra:=StrToFloat(linha);

         QAluno.Close;
         QAluno.Sql.Clear;
         QAluno.Sql.Add('select a.alu_ra, p.pes_nome');
         QAluno.Sql.Add('from sca_alunos a, crp_pessoas p');
         QAluno.Sql.Add('where a.pes_nro = p.pes_nro and a.alu_ra =:ra');
         QAluno.ParamByName('ra').AsFloat:=vra;
         QAluno.Open;
         If not QAluno.Eof
         Then linha2:=linha+';'+QAluno['pes_nome']
         Else linha2:=linha;
         Writeln(Copia,linha2);
       End;
     Finally
       CloseFile(ArqTxt);
       CloseFile(Copia);
       QAluno.Destroy;
     End;
     ShowMessage('Processo Finalizado.');
   End;
End;

Procedure Importa_Arquivo_Delimitado;
var
 Linhas, Colunas:TStringList;
 i,j:integer;
begin
 Linhas := TStringList.Create;
 Colunas := TStringList.Create;
 try
   Linhas.LoadFromFile('C:\Sistemas\teste.txt'); //Carregando arquivo
   for i := 0 to Pred(Linhas.Count) do
   begin
     {Transformando os dados das colunas em Linhas}
     Colunas.text := StringReplace(Linhas.Strings[i],'|',#13,[rfReplaceAll]);
     for j := 0 to Pred(Colunas.Count) do
     begin
       { Aqui você faz alguma coisa como colocar num Edit
         No Meu caso aqui para exemplificar vou apenas mostrar num ShowMessage}
       ShowMessage('Valor "'+Colunas.Strings[j] + '" da Linha '+IntTostr(i+1) +
         ' Coluna '+IntToStr(j+1));
     end;
   end;
 finally
   Linhas.Free;
   Colunas.Free;
 end;
end;

Function Achou_Conflito_Aluno(perlet,semref:word;coddis1:Integer;codtur1:string;lab1:word;coddis2:Integer;codtur2:string;lab2:word;ra:real):string;
var Q,Q2:TQuery;
    achou:boolean;
Begin
  Result:='';
  achou:=false;
  Q:=TQuery.Create(FProcs);
  Q.DatabaseName:='unoeste';
  Q.Close;
  Q.RequestLive:=False;
  Q2:=TQuery.Create(FProcs);
  Q2.DatabaseName:='unoeste';
  Q2.Close;
  Q2.RequestLive:=False;
  Q.Sql.Clear;
  Q.Sql.Add('select * from sca_calendario c, sca_disc_tur dt, sca_disciplinas d');
  Q.Sql.Add('where c.dst_perlet = dt.dst_perlet and c.dst_semref = dt.dst_semref and');
  Q.Sql.Add('      d.dis_codigo = dt.dis_codigo and c.dst_codtur = nvl(dt.dst_turmamestre,dt.dst_codtur) and c.dis_codigo = nvl(dt.dst_codmestre,dt.dis_codigo) and');
  Q.Sql.Add('      dt.dst_codtur =:codtur and dt.dst_perlet =:perlet and dt.dst_semref =:semref and cal_presencial = 0 and');
  Q.Sql.Add('      dis_controle <> 9 and dis_controle <> 11 and dis_controle <> 12 and');
  Q.Sql.Add('      dt.dis_codigo =:coddis and (lab_turma =:lab or lab_turma = 0)');
  Q.ParamByName('codtur').AsString:=codtur1;
  Q.ParamByName('perlet').AsSmallInt:=perlet;
  Q.ParamByName('semref').AsSmallInt:=semref;
  Q.ParamByName('coddis').AsInteger:=coddis1;
  Q.ParamByName('lab').AsSmallInt:=lab1;
  Q.Open;
  If not Q.Eof
  Then
   Begin
     While (not achou) and (not Q.Eof) do
     Begin
       Q2.Close;
       Q2.Sql.Clear;
       Q2.Sql.Add('select * from sca_calendario c, sca_disc_tur dt, sca_historico h, sca_disciplinas d');
       Q2.Sql.Add('where c.dst_perlet = dt.dst_perlet and c.dst_semref = dt.dst_semref and');
       Q2.Sql.Add('      c.dst_codtur = dt.dst_codtur and c.dis_codigo = dt.dis_codigo and');
       Q2.Sql.Add('      c.dst_perlet = his_anoref and c.dst_semref = his_semref and');
       Q2.Sql.Add('      c.dst_codtur = his_codtur and c.dis_codigo = h.dis_codigo and c.dis_codigo = d.dis_codigo and');
       Q2.Sql.Add('      dt.dst_perlet =:perlet and dt.dst_semref =:semref and cal_presencial = 0 and');
       Q2.Sql.Add('      dis_controle <> 9 and dis_controle <> 11 and dis_controle <> 12 and');
       Q2.Sql.Add('      (c.lab_turma = 0 or c.lab_turma = h.lab_turma) and his_codlan in (1,9) and his_regesp <> "S" and');
       Q2.Sql.Add('      alu_ra =:ra and c.dis_codigo <>:coddis2 and cal_periodo =:periodo and cal_diasem =:diasem and');
       Q2.Sql.Add('      (cal_aula between :aulaini and :aulafim or cal_aulafim between :aulaini and :aulafim)');
       If coddis2 <> 0
       Then
        Begin
          Q2.Sql.Add('      and c.dis_codigo =:coddis and c.dst_codtur =:codtur and h.lab_turma =:lab');
          Q2.ParamByName('codtur').AsString:=codtur2;
          Q2.ParamByName('coddis').AsInteger:=coddis2;
          Q2.ParamByName('lab').AsSmallInt:=lab2;
        End;
       Q2.ParamByName('perlet').AsSmallInt:=perlet;
       Q2.ParamByName('semref').AsSmallInt:=semref;
       Q2.ParamByName('coddis2').AsInteger:=coddis1;
       Q2.ParamByName('ra').AsFloat:=ra;
       Q2.ParamByName('periodo').AsSmallInt:=Q['cal_periodo'];
       Q2.ParamByName('diasem').AsString:=Q['cal_diasem'];
       Q2.ParamByName('aulaini').AsSmallInt:=Q['cal_aula'];
       Q2.ParamByName('aulafim').AsSmallInt:=Q['cal_aulafim'];
       Q2.Open;
       If not Q2.Eof // encontrou conflito
       Then
        Begin
          While (not achou) and (not Q2.Eof) do
          Begin
            If ((Q2['dst_calini']) <= (Q['dst_calfim'])) and
               ((Q2['dst_calfim']) >= (Q['dst_calini']))
            Then
             Begin
               achou:=true;
               Result:=Q2['dis_nomdisc'];
             End;
            Q2.Next;
          End;
{          If (not achou) and (coddis2 <> 0) // se não encontrou e for uma disciplina específica, verificar conflito novamente sem considerar que o aluno está cursando a mesma
          Then
           Begin
             Q2.Close;
             Q2.Sql.Clear;
             Q2.Sql.Add('select * from sca_calendario c, sca_disc_tur dt, sca_disciplinas d');
             Q2.Sql.Add('where c.dst_perlet = dt.dst_perlet and c.dst_semref = dt.dst_semref and');
             Q2.Sql.Add('      c.dst_codtur = nvl(dt.dst_turmamestre,dt.dst_codtur) and c.dis_codigo = nvl(dt.dst_codmestre,dt.dis_codigo) and');
             Q2.Sql.Add('      dt.dis_codigo = d.dis_codigo and');
             Q2.Sql.Add('      dt.dst_perlet =:perlet and dt.dst_semref =:semref and cal_presencial = 0 and');
             Q2.Sql.Add('      dis_controle <> 9 and dis_controle <> 11 and dis_controle <> 12 and');
             Q2.Sql.Add('      dt.dis_codigo <>:coddis2 and cal_periodo =:periodo and cal_diasem =:diasem and');
             Q2.Sql.Add('      (cal_aula between :aulaini and :aulafim or cal_aulafim between :aulaini and :aulafim)');
             Q2.Sql.Add('      and dt.dis_codigo =:coddis and dt.dst_codtur =:codtur and (c.lab_turma = 0 or c.lab_turma =:lab)');
             Q2.ParamByName('codtur').AsString:=codtur2;
             Q2.ParamByName('coddis').AsInteger:=coddis2;
             Q2.ParamByName('lab').AsSmallInt:=lab2;
             Q2.ParamByName('perlet').AsSmallInt:=perlet;
             Q2.ParamByName('semref').AsSmallInt:=semref;
             Q2.ParamByName('coddis2').AsInteger:=coddis1;
             Q2.ParamByName('periodo').AsSmallInt:=Q['cal_periodo'];
             Q2.ParamByName('diasem').AsString:=Q['cal_diasem'];
             Q2.ParamByName('aulaini').AsSmallInt:=Q['cal_aula'];
             Q2.ParamByName('aulafim').AsSmallInt:=Q['cal_aulafim'];
             Q2.Open;
             If not Q2.Eof // encontrou conflito
             Then
              Begin
                While (not achou) and (not Q2.Eof) do
                Begin
                  If ((Q2['dst_calini']) <= (Q['dst_calfim'])) and
                     ((Q2['dst_calfim']) >= (Q['dst_calini']))
                  Then
                   Begin
                     achou:=true;
                     Result:=Q2['dis_nomdisc'];
                   End;
                  Q2.Next;
                End;
              End;
           End;}
        End;
       Q.Next;
     End;
   End;

  Q.Destroy;
  Q2.Destroy;
End;

procedure Comprime_Arquivo(arq: string);
var
  FileIni, FileOut: TFileStream;
  Zip: TCompressionStream;
begin
  FileIni:=TFileStream.Create(arq, fmOpenRead and   fmShareExclusive);
  FileOut:=TFileStream.Create('teste.zip', fmCreate or fmShareExclusive);
  Zip:=TCompressionStream.Create(clMax, FileOut);
  Zip.CopyFrom(FileIni, FileIni.Size);
  Zip.Free;
  FileOut.Free;
  FileIni.Free;
end;

procedure Descomprime_Arquivo(arq: string);
var
  FileIni, FileOut: TFileStream;
  DeZip: TDecompressionStream;
  i : Integer;
  Buf: array[0..1023]of Byte;
begin
   FileIni:=TFileStream.Create(arq, fmOpenRead and fmShareExclusive);
   FileOut:=TFileStream.Create(arq, fmCreate or fmShareExclusive);
   DeZip:=TDecompressionStream.Create(FileIni);
repeat
   i:=DeZip.Read(Buf, SizeOf(Buf));
  if i <> 0 then FileOut.Write(Buf, i);
  until i <= 0;
  DeZip.Free;
  FileOut.Free;
  FileIni.free;
end;

Procedure Imprime_ENEM(QDadAlu:TQuery;LDatVest:TppLabel);
Begin
  LDatVest.Font.Size:=9;
  If NULLToZero(QDadAlu['alu_foringgov']) = 0
  Then LDatVest.Caption:='ENEM'
  Else
   If NULLToZero(QDadAlu['alu_foringgov']) = 1
   Then LDatVest.Caption:='ENEM/PROUNI'
   Else
    If NULLToZero(QDadAlu['alu_foringgov']) = 2
    Then LDatVest.Caption:='ENEM/PROIES'
    Else
     If NULLToZero(QDadAlu['alu_foringgov']) = 3
     Then LDatVest.Caption:='ENEM/FIES'
     Else
      If NULLToZero(QDadAlu['alu_foringgov']) = 4
      Then
       Begin
         LDatVest.Font.Size:=7;
         LDatVest.Caption:='ENEM/BOLSA+MÉDICOS';
       End;
End;

function GetFileModDate(filename : string) : TDateTime;
var
   F : TSearchRec;
begin
   FindFirst(filename,faAnyFile,F);
   Result := FileDateToDatetime(F.Time);
   FindClose(F);
end;

Function Habilitacao_Valida(vhab:word):boolean;
Begin
  If (vhab = 28) or (vhab = 29) // a pedido da Nair, bloquear registro e expedição de diplomas nestas habilitações - 17/06/2020
  Then Result:=False
  Else Result:=True;
End;

Procedure Imprime_Renovacao(QConsAlu:TQuery;tipo,forma:smallint;var RT:TppRichText);
var vrenov:string;
Begin
  vrenov:=Renovacao3(QConsAlu,tipo,forma);
  Define_Tamanho_Fonte(10, 1, 'Calibri', vrenov, RT);
End;

Procedure Define_Tamanho_Fonte(fontsize,alinha:word;fontname,text:string;var RT:TppRichText);
var tamtext,tamrich: single;
    texto:string;
    tamfont:word;
Begin
  FProcs.Font.Name:=RT.SelAttributes.Name;
  FProcs.Font.Style:=RT.SelAttributes.Style;
  RT.SelAttributes.Size:=fontsize;
  FProcs.Font.Size:=fontsize;
  FProcs.Font.Name:=fontname;
  tamfont:=fontsize;
  RT.RichText:=text;
  texto:=text;
  RT.SelectAll;
  tamtext:=FProcs.Canvas.TextWidth(texto);
  tamrich:=RT.Width;
  While tamtext > tamrich do
  Begin
   tamfont:=tamfont - 1;
   FProcs.Font.Size:=tamfont;
   tamtext := FProcs.Canvas.TextWidth(texto);
  End;
  RT.SelAttributes.Size:=tamfont;
  If alinha = 1
  Then RT.Paragraph.Alignment:=Classes.taLeftJustify
  Else
   If alinha = 2
   Then RT.Paragraph.Alignment:=Classes.taCenter
   Else
    If alinha = 3
    Then RT.Paragraph.Alignment:=Classes.taRightJustify
End;

{Procedure Gera_QrCode;
var
  ImageStream: TMemoryStream;
  PngImage: TPngImage;
begin
  Image1.Picture := nil;
  ImageStream := TMemoryStream.Create;
  PngImage := TPngImage.Create;
  try
    try
      GetQrCode(StrToInt(Trim(MaskEdit1.Text)), StrToInt(Trim(MaskEdit2.Text)),
        TQrImage_ErrCorrLevel(ComboBox1.ItemIndex), Memo1.Lines.Text,
        ImageStream);
      if ImageStream.Size > 0 then
      begin
        ImageStream.Position := 0;
        PngImage.LoadFromStream(ImageStream);
        Image1.Picture.Assign(PngImage);
      end;
    except
      on E: exception do
        ShowMessage(E.Message);
    end;
  finally
    ImageStream.Free;
    PngImage.Free;
  end;
End;}

procedure OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
var
  Pdir: PChar;
begin
  GetMem(pDir, 256);
  StrPCopy(pDir, aFile);
  ShellExecute(0, nil, Pchar(aFile), nil, Pdir, TypeForm);
  FreeMem(pdir, 256);
end;

function EncodeFile(const FileName: string): AnsiString;
var
  stream: TMemoryStream;
  Encoder: TIdEncoderMIME;
  Base64String: String;
begin
  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(Filename);
    Encoder := TIdEncoderMIME.Create;
    Base64String := Encoder.Encode(stream);
    result := Base64String;
  finally
    Encoder.Free;
    stream.Free;
  end;
end;

function FileToBytes(AName: string; var Bytes: TArrayByte): Boolean;
var
  Stream: TFileStream;
begin
  if not FileExists(AName) then
  begin
    Result := False;
    Exit;
  end;
  Stream := TFileStream.Create(AName, fmOpenRead);
  try
    SetLength(Bytes, Stream.Size);
    Stream.ReadBuffer(Pointer(Bytes)^, Stream.Size);
  finally
    Stream.Free;
  end;
  Result := True;
end;

function RetornarPastasPorConteudoDoCampo(area,campo:smallint;ra:real):TObjectList;
begin
  result:=TObjectList(FProcs.meuRest.Resource(FProcs.URLApi+'/api/Pasta/RetornaPastasPorConteudoDoCampoEArea/'+IntToStr(area)+'/'+IntToStr(campo)+'/'+FloatToStr(ra))
                                       .Accept(RestUtils.MediaType_Json)
                                       .Get(TObjectList,PastaViewModel));
end;

function Atualizar_Documentos_Fluxo_Pasta_PastaValCampo(pastaedocumentos:PastaEDocumentosViewModel):PastaEDocumentosViewModel;
var resultado:TObject;
begin
  resultado:=FProcs.meuRest.Resource(FProcs.UrlApi+'/api/Documentos/AtualizarDocumentosFluxoPastaPastaValCampo')
                                .Accept(RestUtils.MediaType_Json)
                                .ContentType(RestUtils.MediaType_Json)
                                .Post(pastaedocumentos);
  Result:=PastaEDocumentosViewModel(resultado);
end;

function BuscarDocumentoPorNome(pasta:integer;arquivo:string;extensao:string):DocumentosViewModel;
var resultado:TObject;
begin
  resultado:=FProcs.meuRest.Resource(FProcs.UrlApi+'/api/Documentos/BuscarPorNome/'+IntToStr(pasta)+'/'+arquivo+'/'+extensao)
                                       .Accept(RestUtils.MediaType_Json)
                                       .Get(DocumentosViewModel);
  result:=DocumentosViewModel(resultado);
end;

function Adicionar(novaPasta:PastaViewModel):PastaViewModel;
var resultado:TObject;
begin
  resultado:=FProcs.meuRest.Resource(FProcs.UrlApi+'/api/Pasta/')
                                .Accept(RestUtils.MediaType_Json)
                                .ContentType(RestUtils.MediaType_Json)
                                .Post(novaPasta);
  Result:=PastaViewModel(resultado);
end;

function RetornaCamposPorArea(area:smallint):TObjectList;
begin
  result:=TObjectList(FProcs.meuRest.Resource(FProcs.UrlApi+'/api/Campos/Area/'+IntToStr(area))
                                       .Accept(RestUtils.MediaType_Json)
                                       .Get(TObjectList,CamposViewModel));
end;

function RetornaCamposDaArea(area:smallint):TObjectList;
begin
  result:=TObjectList(FProcs.meuRest.Resource(FProcs.UrlApi+'/api/AreaCampos/Area/'+IntToStr(area))
                                       .Accept(RestUtils.MediaType_Json)
                                       .Get(TObjectList,AreaCamposViewModel));
end;

function Carrega_Ficha_Escolar(ra:real;hab:word):TObjectList;
var resultado:TObjectList;
begin
  resultado:=TObjectList(FProcs.meuRest.Resource('http://10.1.15.2/Unoeste.WebApi.Academico/api/FichaEscolar/Aluno/'+FloatToStr(ra)+'/'+IntToStr(hab))
                                .Accept(RestUtils.MediaType_Json)
                                .ContentType(RestUtils.MediaType_Json)
                                .Get(TObjectList));
//  Result:=PastaEDocumentosViewModel(resultado);
end;

function CarregarCamposDaPasta(pasta,area:integer):TObjectList;
var retorno, CamposDaPastaAux, Campos, CamposDaArea:TObjectList;
    i, j:integer;
    item, novo:PastaValCampoViewModel;
begin
  retorno:=RetornaConteudoCamposPorPasta(pasta);
  if retorno <> nil then
  begin
    for i:=0 to retorno.Count-1 do
    begin
      item:=PastaValCampoViewModel(retorno.Items[i]);
      if (item.areacampos.campos.cmp_tipo = 'T') and (item.pvc_texto <> null) then
        item.Conteudo:=Trim(item.pvc_texto)
      else
        if (item.areacampos.campos.cmp_tipo = 'D') and (item.pvc_data <> null) then
          item.Conteudo:=item.pvc_data
        else
          if (item.areacampos.campos.cmp_tipo = 'N') and (item.pvc_numero <> null) and (item.pvc_numero > 0) then
            if (item.areacampos.campos.cmp_codigo = 13) then
              if (item.pvc_numero <> null) then
                item.Conteudo:=Mascara_RA(item.pvc_numero)
              else
                if (item.areacampos.campos.cmp_codigo = 11) then
                  if (item.pvc_numero <> null) then
                    item.Conteudo:=Mascara_CPF(item.pvc_numero)
              else
                item.Conteudo:=FloatToStr(item.pvc_numero);
    end;
    Result:=retorno;
  end
  else
  begin
    CamposDaPastaAux:=TObjectList.Create();
    Campos:=RetornaCamposPorArea(area);
    CamposDaArea:=RetornaCamposDaArea(area);
    if (CamposDaArea <> nil) then
    begin
      for i:=0 to CamposDaArea.Count-1 do
      begin
        for j:=0 to Campos.Count-1 do
          if AreaCamposViewModel(CamposDaArea.Items[i]).cmp_codigo = CamposViewModel(Campos.Items[j]).cmp_codigo then
          begin
            AreaCamposViewModel(CamposDaArea.Items[i]).campos:=CamposViewModel(Campos.Items[j]);
            break;
          end;
        novo:=PastaValCampoViewModel.Create();
        novo.pst_codigo:=pasta;
        novo.arc_codigo:=AreaCamposViewModel(CamposDaArea.Items[i]).arc_codigo;
        novo.areacampos:=AreaCamposViewModel(CamposDaArea.Items[i]);
        CamposDaPastaAux.Add(novo);
      end;
      Result:=CamposDaPastaAux;
    end
   else
   begin
     MessageDlg('Retornou campos da area nulos!!!!!!!!!',mtError,[mbOk],0);
     Result:=nil;
   end;
  end;
end;

function RetornaConteudoCamposPorPasta(pasta:integer):TObjectList;
var resultado:TObjectList;
begin
  Result:=TObjectList(FProcs.meuRest.Resource(FProcs.UrlApi+'/api/PastaValCampo/Pasta/'+IntToStr(pasta))
                                .Accept(RestUtils.MediaType_Json)
                                .Get(TObjectList,PastaValCampoViewModel));
end;

function ObterTodasPorDocumento(doc:integer):TObjectList;
var resultado:TObjectList;
begin
  Result:=TObjectList(FProcs.meuRest.Resource(FProcs.UrlApi+'/api/DocAssinaturas/RetornarTodasPorDocumento/'+IntToStr(doc))
                                .Accept(RestUtils.MediaType_Json)
                                .Get(TObjectList,DocAssinaturasViewModel));
end;

//Procedure TFRHist8.Gera_Fluxo(docs:TObjectList):TObjectList;
//Begin
//End;

function CriarNovaPasta(area:smallint;vcodusu:integer;QConsAlu,qconsccl:TQuery):PastaViewModel;
var novaPasta:PastaViewModel;
    CamposdaPasta:TObjectList;
    i:integer;
    campo:PastaValCampoViewModel;
    vdia,vmes,vano:word;
begin
  novaPasta:=PastaViewModel.Create();
  novaPasta.are_codigo:=area;
  novaPasta.pst_codigo:=0;
  novaPasta.pst_data_entrada:=DelphiDateTimeToISO8601Date(Pega_DataHora);
  novaPasta.fun_matr:=vcodusu;
  novaPasta:=Adicionar(novaPasta);
  CamposdaPasta:=CarregarCamposdaPasta(novaPasta.pst_codigo, area);
  for i:=0 to CamposdaPasta.Count-1 do
  begin
    campo:=PastaValCampoViewModel(CamposdaPasta.Items[i]);
    if (campo.areacampos.campos.cmp_codigo = 13) then // RA
      campo.pvc_numero:=QConsAlu['alu_ra']
    else
     if (campo.areacampos.campos.cmp_codigo = 6) then // nome
       campo.pvc_texto:=QConsAlu['pes_nome']
     else
      if (campo.areacampos.campos.cmp_codigo = 11) then // cpf
        campo.pvc_numero:=QConsAlu['pes_cpf']
      else
       if (campo.areacampos.campos.cmp_codigo = 10) then // curso
         campo.pvc_texto:=QConsAlu['cur_nomcur']
       else
        if (campo.areacampos.campos.cmp_codigo = 22) then // código do curso
          campo.pvc_numero:=QConsAlu['cur_codigo']
        else
         if (campo.areacampos.campos.cmp_codigo = 8) then // ano/semestre
           if qconsccl['ahb_conclusao'] <> null then
           begin
             DecodeDate(qconsccl['ahb_conclusao'],vano,vmes,vdia);
             if vmes <= 7 then
               campo.pvc_texto:=IntToStr(vano) + '/1'
             else campo.pvc_texto:=IntToStr(vano) + '/2';
           end;
  end;
  novaPasta.pastavalcampo:=CamposDaPasta;
  Result:=novaPasta;
end;

function CriarNovaPasta(area:smallint;vcodusu:integer;QCurso:TQuery):PastaViewModel;
var novaPasta:PastaViewModel;
    CamposdaPasta:TObjectList;
    i:integer;
    campo:PastaValCampoViewModel;
    vdia,vmes,vano:word;
begin
  novaPasta:=PastaViewModel.Create();
  novaPasta.are_codigo:=area;
  novaPasta.pst_codigo:=0;
  novaPasta.pst_data_entrada:=DelphiDateTimeToISO8601Date(Pega_DataHora);
  novaPasta.fun_matr:=vcodusu;
  novaPasta:=Adicionar(novaPasta);
  CamposdaPasta:=CarregarCamposdaPasta(novaPasta.pst_codigo, area);
  for i:=0 to CamposdaPasta.Count-1 do
  begin
    campo:=PastaValCampoViewModel(CamposdaPasta.Items[i]);
    if (campo.areacampos.campos.cmp_codigo = 22) then // código do curso
      campo.pvc_numero:=QCurso['cur_codigo']
    else
     if (campo.areacampos.campos.cmp_codigo = 10) then // curso
       campo.pvc_texto:=QCurso['cur_nomcur'];
  end;
  novaPasta.pastavalcampo:=CamposDaPasta;
  Result:=novaPasta;
end;

Function Recupera_Periodo_Vestibular(dataini,datafim:TDateTime) : String;
var VAno, VMes, VDia, DiaFim, MesFim: word;
    Mes: Array[1..12] of String;
Begin
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
//  DecodeDate(dataini,VAno,VMes,VDia);
  DecodeDate(datafim,VAno,MesFim,DiaFim);
//  If VMes > MesFim //na data do vestibular é p/ aparecer somente o ano
//  Then Result:=IntToStr(VAno)
//  Else
//   If VMes <> MesFim
//   Then Result:=Copy(Mes[VMes],1,3)+'/'+Copy(Mes[MesFim],1,3)+'/'+IntToStr(VAno)
//   Else Result:=Mes[VMes]+'/'+IntToStr(VAno);
  Result:=Mes[MesFim]+'/'+IntToStr(VAno); // A partir de agora o Elias pediu para pegar o mês da data final - 10/02/2022
End;

// **** Funções comuns para emissão do Histórico Escolar Pós Graduação ****

Function Achou_DisciplinaPos(MT:TMemoryTable;Q:TQuery):Boolean;
var achou:boolean;
Begin
 achou:=false;
 MT.First;
 While not MT.Eof do
 Begin
  If (Q['his_perlet'] = MT['his_perlet']) and (Q['his_semref'] = MT['his_semref']) and
     (Q['mod_seq'] = MT['mod_seq'])
  Then
   Begin
    achou:=true;
    break;
   End;
  MT.Next;
 End;
 If achou
 Then Achou_DisciplinaPos:=true
 Else
  Begin
   MT.Append;
   MT['his_perlet']:=Q['his_perlet'];
   MT['his_semref']:=Q['his_semref'];
   MT['mod_seq']:=Q['mod_seq'];
   MT.Post;
   Achou_DisciplinaPos:=False;
  End;
End;

Function Achou_AdicionalPos(MT:TMemoryTable;Q:TQuery):Boolean;
var achou:boolean;
Begin
 achou:=false;
 MT.First;
 While not MT.Eof do
 Begin
  If (Q['adi_nro'] = MT['adi_nro'])
  Then
   Begin
    achou:=true;
    break;
   End;
  MT.Next;
 End;
 If achou
 Then Achou_AdicionalPos:=true
 Else
  Begin
   MT.Append;
   MT['adi_nro']:=Q['adi_nro'];
   MT.Post;
   Achou_AdicionalPos:=False;
  End;
End;

//***********************************************************

end.
