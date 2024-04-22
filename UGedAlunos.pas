unit UGedAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RXSplit, ComCtrls, Db, DBTables, Grids, DBGrids,
  RXDBCtrl, OleCtrls{, placemnt, FOXITREADEROCXLib_TLB}, FileCtrl, RxMemDS, StdCtrls,
  AcroPDFLib_TLB, DBCtrls, JvExControls, JvDBLookup, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, JvComponentBase, JvThread,
  JvMemoryDataset, ContNrs, RestClient, SHDocVw, HTTPApp, UGed_Documentos;

type
  TFGedAlunos = class(TForm)
    PCabecalho: TPanel;
    Image1: TImage;
    PVisualizacao: TPanel;
    RxSplitter1: TRxSplitter;
    SB: TStatusBar;
    DSPasta: TDataSource;
    Panel1: TPanel;
    MDPasta: TRxMemoryData;
    MDPastapst_codigo: TIntegerField;
    MDPastadoc_nomearquivo: TStringField;
    MDPastadoc_arquivo: TMemoField;
    MDPastadoc_arquivotemp: TStringField;
    PPDFSemAssinatura: TPanel;
    Label1: TLabel;
    PDocumentos: TPanel;
    DBGDocumentos: TRxDBGrid;
    Panel2: TPanel;
    DBObs: TDBMemo;
    MDPastapst_obs: TStringField;
    DSPermissao: TDataSource;
    MDPastadoc_nivelprocesso: TStringField;
    PAreas: TPanel;
    Label2: TLabel;
    DBAreas: TJvDBLookupCombo;
    MDPastadoc_dataarm: TDateTimeField;
    MDPastadoc_extarq: TStringField;
    MDPastadoc_tamanho: TIntegerField;
    PCopiandoArquivo: TPanel;
    Label3: TLabel;
    ThreadDownload: TJvThread;
    IdHTTP: TIdHTTP;
    MDPastadoc_codigo: TIntegerField;
    MDPermissao: TJvMemoryData;
    MDPermissaoare_codigo: TIntegerField;
    MDPermissaoare_pai: TIntegerField;
    MDPermissaoare_descr: TStringField;
    MDPermissaoare_tempval: TSmallintField;
    MDPermissaoare_titulo: TStringField;
    MDPermissaoare_classif: TStringField;
    MDPermissaoare_caminho: TStringField;
    MDPermissaoare_nivel: TSmallintField;
    MeuRest: TRestClient;
    WebBrowser1: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MDPastaAfterScroll(DataSet: TDataSet);
    procedure DBGDocumentosCellClick(Column: TColumn);
    procedure DBAreasChange(Sender: TObject);
    procedure DBGDocumentosDblClick(Sender: TObject);
    procedure ThreadDownloadExecute(Sender: TObject; Params: Pointer);
  private
    { Private declarations }
    RA,CPF : Real;
    DocArquivo:string;
    Matricula, Pasta, DocCodigo : Integer;
    TemDocumentos, PrimeiraCarga: Boolean;
    function  InicializaPasta(Pasta : String) : Boolean;
    procedure VisualizaDocumento(Arquivo : String);
    procedure CopiaArquivoIndividual;

  public
    { Public declarations }
    procedure CarregaPasta(RA : Real; Matricula : Integer);
    function AreasPermitidasPorUsuario(matricula:integer): string;
    procedure CarregarDocumentos(area: integer; ra: real);
    function BuscarDadosDaPasta(pasta:integer): PastaViewModel;
  end;

const
  C_PASTA_TEMPORARIA = 'C:\SISTEMAS\GED_ACADEMICO';
  C_PASTASERVIDOR = '\\10.1.1.8\GED';
  C_USUARIO = 'UNOESTE\ged';
  C_SENHA = 'GED&CPD';
  TIPO_RECURSO = RESOURCETYPE_ANY;

var
  FGedAlunos: TFGedAlunos;
  UrlApi, UrlToken :string;
implementation

uses funcoes, comum, RestUtils;

{$R *.DFM}

function TFGedAlunos.InicializaPasta(Pasta : String) : Boolean;
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

function TFGedAlunos.BuscarDadosDaPasta(pasta:integer):PastaViewModel;
var resultado:TObject;
begin
  resultado:=meuRest.Resource(UrlApi+'/api/Pasta/Get?id='+IntToStr(pasta))
                                .Accept(RestUtils.MediaType_Json)
                                .Get(PastaViewModel);
    if (resultado <> nil) then
    begin
      result:=PastaViewModel(resultado);
    end
    else result:= PastaViewModel.Create();
end;

procedure TFGedAlunos.CarregarDocumentos(area: integer; ra: real);
var resultado:TObjectList;
i,codigo_pasta:integer;
documento:DocumentosViewModel;
Pasta:PastaViewModel;
begin
  try
     resultado:=TObjectList(meuRest.Resource(UrlApi+'/api/Documentos/RA/'+IntToStr(area)+'/'+FloatToStr(Trunc(ra)))
                                .Accept(RestUtils.MediaType_Json)
                                .Get(TObjectList,DocumentosViewModel));
    if (resultado <> nil) then
      begin
        codigo_pasta:=0;
        MDPasta.Open;
        MDPasta.EmptyTable;
        for i:=0 to resultado.Count-1 do
          begin
            documento:=DocumentosViewModel(resultado.Items[i]);
            if (documento.pst_codigo <> codigo_pasta) then
              begin
                Pasta:=BuscarDadosDaPasta(documento.pst_codigo);
                codigo_pasta:=documento.pst_codigo;
              end;
            MDPasta.Append;
            MDPasta['pst_codigo']:=       documento.pst_codigo;
            MDPasta['doc_codigo']:=       documento.doc_codigo;
            MDPasta['doc_nomearquivo']:=  Trim(documento.doc_nomearquivo);
            MDPasta['doc_arquivo']:=      Trim(documento.doc_arquivo);
            MDPasta['doc_arquivotemp']:=  '';
            //MDPasta['doc_dataarm']:=      documento.doc_dataarm;
            MDPasta['doc_extarq']:=       documento.doc_extarq;
            MDPasta['doc_tamanho']:=      documento.doc_tamanho;
            MDPasta['doc_nivelprocesso']:=documento.doc_nivelprocesso;
            if (Pasta <> nil) then
              MDPasta['pst_obs']:=Pasta.pst_obs;
            MDPasta.Post;
          end;
        MDPasta.First;
      end;
  except

  end;
end;

procedure TFGedAlunos.DBAreasChange(Sender: TObject);
var ErroConexao, NomeArquivoCompletoGED, NomeArquivoTemporario : String;
begin
  DBGDocumentos.Enabled:=False;
  MDPasta.EmptyTable;
  {Verificando se usuário possui documentos PDF´s assinados em seu prontuário }
  if (MDPermissao['are_codigo'] <> 69) then 
    CarregarDocumentos(MDPermissao['are_codigo'], RA)
    else
      if (NullToZero(CPF) > 0) then
        CarregarDocumentos(MDPermissao['are_codigo'], CPF);
  //if not Pesquisa(QPasta,[QPermissao['are_codigo'],RA]) then
    //MessageDlg('O Aluno não possui documentos nesta pasta!',mtInformation,[mbOk],0)
  if (Not MDPasta.EOF) then
    begin
       TemDocumentos := True;

       { Gerando pasta temporária }
       {if not InicializaPasta(C_PASTA_TEMPORARIA)
          then begin
                   MessageDlg('Não foi possível gerar a pasta temporária. Verifique as permissões de gravação!',mtInformation,[mbOk],0);
                   PostMessage(self.handle,wm_close,0,0);
                   Exit;
               end;}

       { Copiando arquivos para pasta temporária }
       MDPasta.First;
       while not MDPasta.Eof do
           begin
               NomeArquivoCompletoGED := MDPasta['doc_arquivo'];
               MDPasta.Edit;                           //acrescentei a pasta antes do nome pq dá erro quando os arquivos têm os mesmo nome
               NomeArquivoTemporario := C_PASTA_TEMPORARIA + '\' + IntToStr(MDPasta['pst_codigo'])+ExtractFileName(NomeArquivoCompletoGED);
               MDPasta['doc_arquivotemp'] := ' ';//NomeArquivoTemporario;
               if MDPasta['doc_nivelprocesso'] = 'A' then
                 MDPasta['doc_nivelprocesso']:='Sim'
                 else MDPasta['doc_nivelprocesso']:='Não';
               MDPasta.Post;
               MDPasta.Next;
           end;
       MDPasta.First;
       MDPasta.EnableControls;
       DBGDocumentos.Enabled := True;
       { Visualiza o primeiro documento }
       VisualizaDocumento(MDPasta['doc_arquivotemp']);
       DBGDocumentos.SetFocus;
  end;
end;

procedure TFGedAlunos.VisualizaDocumento(Arquivo : String);
begin
    Try
      Try
        PVisualizacao.Visible:=false;
        webbrowser1.Navigate('about:blank');
        Application.ProcessMessages();
        if (Arquivo <> ' ') then
          begin
            PVisualizacao.Visible:=true;
            webbrowser1.Navigate(UrlApi+'/api/Documentos/ArquivoDisco/'+IntToStr(MDPasta['doc_codigo']));
          end;
        Finally
        PCopiandoArquivo.Visible:=False;
      End;
      Except
        on E: Exception do
          //ShowMessage('except do loadfile do acropdf: '+E.Message);
    End;
    SB.SimpleText := 'Visualizando "' + ExtractFileName(Arquivo) + '"';
end;

procedure TFGedAlunos.CarregaPasta(RA : Real; Matricula : Integer);
begin
    Self.RA := RA;
    Self.Matricula := Matricula;
end;

procedure TFGedAlunos.FormActivate(Sender: TObject);
var ErroConexao, NomeArquivoCompletoGED, NomeArquivoTemporario , retorno: String;
begin
  UrlApi :='http://10.1.2.27:9095';//'http://10.1.15.3/Unoeste.WebApi.Ged';
  UrlToken := 'http://localhost:52833/token';
    if (ParamStr(1) = '') or (ParamStr(2) = '') {or (Paramstr(3) = '')} then
      begin
        MessageDlg('Esta aplicação depende dos parâmetros de inicialização (RA, Matrícula e CPF)!!!',MtInformation,[MbOk],0);
        PostMessage(self.handle,wm_close,0,0);
        Exit;
      end;
    RA := StrToFloat(OnlyNumber(ParamStr(1)));
    Matricula := StrToInt(OnlyNumber(ParamStr(2)));
    if (Paramstr(3) <> '') then   
      CPF:=StrToFloat(OnlyNumber(ParamStr(3)));

    { Verificando se usuário possui permissão de acesso: tabela ged_usu_area, are_codigo = 22 }
    retorno:=AreasPermitidasPorUsuario(Matricula);

    if (retorno <> '')
       then begin
                MessageDlg(retorno,mtError,[mbOk],0);
                PostMessage(self.handle,wm_close,0,0);
                Exit;
            end;
end;

function TFGedAlunos.AreasPermitidasPorUsuario(matricula:integer): string;
var Resultado:TObjectList;
i:integer;
area: AreasViewModel;
begin
  try
    Resultado:= TObjectList(meuRest.Resource(UrlApi + '/api/Areas/Funcionario/'+IntToStr(matricula))
                              .Accept(RestUtils.MediaType_Json)
                              .Get(TObjectList, AreasViewModel));
    if (resultado <> nil) then
      begin
        MDPermissao.Open;
        MDPermissao.EmptyTable;
        for i:=0 to resultado.Count-1 do
          begin
            area:=AreasViewModel(resultado.Items[i]);
            MDPermissao.Append;
            MDPermissao['are_codigo']:=area.are_codigo;
            MDPermissao['are_descr']:=area.are_descr;
            MDPermissao['are_pai']:=area.are_pai;
            MDPermissao['are_titulo']:=area.are_titulo;
            MDPermissao['are_classif']:=area.are_classif;
            MDPermissao.Post;
          end;
      end;
  except
    result:='Ocorreu um erro ao buscar as áreas que o usuário tem acesso!!!';
  end;
end;

procedure TFGedAlunos.CopiaArquivoIndividual;
var Origem, Destino : String;
arquivoStream:TFileStream;
begin
  try
    arquivoStream:=TFileStream.Create(DocArquivo,fmCreate);
    //IdHttp.Request.Connection:='close';
    //Quando for pegar do ged_imagens mudar a chamada para '/api/Documentos/Arquivo/'+IntToStr(doc_Codigo)
    IdHttp.Get(UrlApi+'/api/Documentos/ArquivoDisco/'+IntToStr(DocCodigo),arquivoStream);
  finally
    arquivoStream.Free;
    IdHttp.Disconnect;
    //ThreadDownload.Terminate;
  end;

end;

procedure TFGedAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //InicializaPasta(C_PASTA_TEMPORARIA); // Remove documentos temporários
end;

procedure TFGedAlunos.MDPastaAfterScroll(DataSet: TDataSet);
begin
  if (DBGDocumentos.Enabled) then//and (NullToSpace(MDPasta['doc_arquivotemp']) <> ' ') then
    begin
      VisualizaDocumento(NullToSpace(MDPasta['doc_arquivotemp']));
    end;
end;

procedure TFGedAlunos.ThreadDownloadExecute(Sender: TObject; Params: Pointer);
var arquivoStream:TFileStream;
begin
  try
    arquivoStream:=TFileStream.Create(DocArquivo,fmCreate);
    //IdHttp.Request.Connection:='close';
//Quando for pegar do ged_imagens mudar a chamada para '/api/Documentos/Arquivo/'+IntToStr(doc_Codigo)
    IdHttp.Get(UrlApi+'/api/Documentos/ArquivoDisco/'+IntToStr(DocCodigo),arquivoStream);
  finally
    arquivoStream.Free;
    IdHttp.Disconnect;
    ThreadDownload.Terminate;
  end;
end;

procedure TFGedAlunos.DBGDocumentosCellClick(Column: TColumn);
var i : integer;
    hlp: TForm;
begin
    // Cria uma janela e a fecha para o foco sair do componente ActiveX e voltar ao DGBDocumento
    //if (MDPasta['doc_arquivotemp'] <> ' ') then
      //begin
        hlp := TForm.Create(nil);
        try
            hlp.BorderStyle := bsNone;
            hlp.SetBounds(0, 0, 1, 1);
            hlp.FormStyle := fsStayOnTop;
            hlp.Show;
            hlp.Close;
        finally
            hlp.Free;
        end;
      //end;
end;

procedure TFGedAlunos.DBGDocumentosDblClick(Sender: TObject);
var Origem:string;
begin
  if (NullToSpace(MDPasta['doc_arquivotemp']) = ' ') then
    begin
      PcopiandoArquivo.Visible:=True;
      MDPasta.DisableControls;
      Origem := MDPasta['doc_arquivo'];
      //if MDPasta['doc_extarq'] = 'JPG' then
      DocArquivo := C_PASTA_TEMPORARIA + '\' + ExtractFileName(Origem);
      DocCodigo:=MDPasta['doc_codigo'];
      //CopiaArquivoIndividual;
      MDPasta.Edit;
      MDPasta['doc_arquivotemp'] := DocArquivo;
      MDPasta.Post;
      PCopiandoArquivo.Visible:=False;
      MDPasta.EnableControls;
      //Application.ProcessMessages();
    end;
  VisualizaDocumento(MDPasta['doc_arquivotemp']);
//  VisualizaDocumento;
end;

end.
