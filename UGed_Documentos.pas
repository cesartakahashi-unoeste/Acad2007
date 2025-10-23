unit UGed_Documentos;

interface

uses Classes, ContNrs, SysUtils;

type
 TArrayByte = array of byte;

{$M+}
TToken = class
 private
   faccess_token:string;
   ftoken_type  :string;
   fexpires_in  : integer;
 published
   property access_token: string read faccess_token write faccess_token;
   property token_type: string read ftoken_type write ftoken_type;
   property expires_in: integer read fexpires_in write fexpires_in;
end;

AreasViewModel= class
private
 fare_codigo :         integer;
 fare_pai     :            integer;
 fare_descr   :           string ;
 fare_tempval :        smallint ;
 fare_titulo  :         string ;
 fare_classif :        string ;
 fare_caminho :        string ;
 fare_nivel   :          smallint ;
 fResultadoValidacao:  string ;
 fIsValid     :            boolean  ;
published
   property are_codigo :           integer read    fare_codigo    write         fare_codigo ;
   property are_pai :              integer read    fare_pai       write         fare_pai    ;
   property are_descr:             string  read    fare_descr     write         fare_descr  ;
   property are_tempval :          smallint  read  fare_tempval     write       fare_tempval  ;
   property are_titulo :           string  read    fare_titulo    write         fare_titulo ;
   property are_classif :          string  read    fare_classif   write         fare_classif;
   property are_caminho :          string  read    fare_caminho   write         fare_caminho;
   property are_nivel :            smallint  read  fare_nivel       write       fare_nivel    ;
   property ResultadoValidacao:    string  read    fResultadoValidacao   write  fResultadoValidacao       ;
   property IsValid :              boolean   read  fIsValid         write       fIsValid      ;
end;

PastaViewModel = class
 private
        fpst_codigo       :integer;
        fpst_data_entrada :string;
        fpst_statuscd     :string;
        fpst_numid        :string;
        fpst_tamanho      :real;
        fpst_disponivel   :string;
        fare_codigo       :integer;
        fpst_obs          :string;
        ffun_matr         :integer;
        fpastavalcampo    :TObjectList;
        fDocumentos       :TObjectList;
 public
    constructor create;
    destructor destroy;
 published
    property pst_codigo       : integer    read  fpst_codigo        write    fpst_codigo           ;
    property pst_data_entrada :string   read  fpst_data_entrada  write    fpst_data_entrada      ;
    property pst_statuscd     :string      read  fpst_statuscd      write    fpst_statuscd       ;
    property pst_numid        :string     read  fpst_numid         write    fpst_numid           ;
    property pst_tamanho      :real        read  fpst_tamanho       write    fpst_tamanho      ;
    property pst_disponivel   :string      read  fpst_disponivel    write    fpst_disponivel     ;
    property are_codigo       :integer     read  fare_codigo        write    fare_codigo          ;
    property pst_obs          :string      read  fpst_obs           write    fpst_obs            ;
    property fun_matr         :integer     read  ffun_matr          write    ffun_matr            ;
    property pastavalcampo    :TObjectList read  fpastavalcampo     write    fpastavalcampo            ;
    property documentos       :TObjectList read fDocumentos write fDocumentos;
end;

ImagensViewModel = class
private
        fdoc_codigo   :integer;
        fdoc_ano      :integer;
        fdoc_semestre : string;
        fdoc_imagem   : TArrayByte;
        fdoc_imagemstr: AnsiString;
published
property doc_codigo     : integer read fdoc_codigo    write  fdoc_codigo ;
property doc_ano        : integer read fdoc_ano       write  fdoc_ano     ;
property doc_semestre   : string read fdoc_semestre  write  fdoc_semestre ;
property doc_imagem     : TArrayByte read fdoc_imagem    write  fdoc_imagem    ;
property doc_imagemstr  : String read fdoc_imagemstr   write  fdoc_imagemstr    ;

end;

DocAssinaturasViewModel = class
private
        fass_id:integer;
        fdoc_codigo:integer;
        fusr_id:integer;
        fass_data:string;
        fass_ordem:smallint;
        fass_assinatura:string;
        fcer_id:integer;
        fass_status:smallint;
        fass_dtstatus:string;
        fass_obsstatus:string;
        fass_fluxonivel:smallint;
        fass_fluxocompart:string;
        ftpu_seq:integer;
        fass_notificavel:string;
        fass_ip:string;
        fass_referenceuri:string;
        fass_politica:string;
        fass_assinaturarvdd:smallint;
published

   property ass_id             :integer read fass_id write fass_id;
   property doc_codigo         :integer read fdoc_codigo write fdoc_codigo;
   property usr_id             :integer read fusr_id write fusr_id;
   property ass_data           :string read fass_data write fass_data;
   property ass_ordem          :smallint read fass_ordem write fass_ordem;
   property ass_assinatura     :string read fass_assinatura write fass_assinatura;
   property cer_id             :integer read fcer_id write fcer_id;
   property ass_status         :smallint read fass_status write fass_status;
   property ass_dtstatus       :string read fass_dtstatus write fass_dtstatus;
   property ass_obsstatus      :string read fass_obsstatus write fass_obsstatus;
   property ass_fluxonivel     :smallint read fass_fluxonivel write fass_fluxonivel;
   property ass_fluxocompart   :string read fass_fluxocompart write fass_fluxocompart;
   property tpu_seq            :integer read ftpu_seq write ftpu_seq;
   property ass_notificavel    :string read fass_notificavel write fass_notificavel;
   property ass_ip             :string read fass_ip write fass_ip;
   property ass_referenceuri   :string read fass_referenceuri write fass_referenceuri;
   property ass_politica       :string read fass_politica write fass_politica;
   property ass_assinaturarvdd :smallint read fass_assinaturarvdd write fass_assinaturarvdd;
end;

DocumentosViewModel = class
private
        fdoc_codigo:integer;
        ffun_matr: integer;
        fpst_codigo:integer;
        fdoc_nivelprocesso:string;
        fdoc_dataarm: string;
        fdoc_arquivo: string;
        fdoc_dtrevisao: string;
        fdoc_extarq: string;
        fdoc_tamanho: integer;
        fcpa_num: integer;
        fdoc_nomearquivo: string;
        ffun_inativo: integer;
        fdoc_ativo: string;
        fdoc_dtinativo: string;
        fdoc_ordem: integer;
        fdoc_dtassinatura: string;
        fpdf: TArrayByte;
        fassinado  : string;
        ftemporario: string;
        fmodificado: string;
        fimagens: ImagensViewModel;
        fpasta: PastaViewModel;
        fdoc_usanodiploma: string;
        ftdo_seq: integer;
        faut_seq: integer;
        floc_seq: integer;
        fdoc_assunto: string;
        fdoc_titulo: string;
        fassinaturas:TObjectList;
 public
    constructor create;
    destructor destroy;
 published
   property doc_codigo       :integer read fdoc_codigo write fdoc_codigo;
   property fun_matr         : integer read ffun_matr write ffun_matr;
   property pst_codigo       :integer read fpst_codigo write fpst_codigo;
   property doc_nivelprocesso:string read fdoc_nivelprocesso write fdoc_nivelprocesso ;
   property doc_dataarm      : string read fdoc_dataarm write fdoc_dataarm ;
   property doc_arquivo      : string read fdoc_arquivo write fdoc_arquivo ;
   property doc_dtrevisao    : string read   fdoc_dtrevisao     write fdoc_dtrevisao;
   property doc_extarq       : string read         fdoc_extarq        write fdoc_extarq;
   property doc_tamanho      : integer read       fdoc_tamanho       write fdoc_tamanho;
   property cpa_num          : integer read           fcpa_num           write fcpa_num;
   property doc_nomearquivo  : string read    fdoc_nomearquivo   write fdoc_nomearquivo;
   property fun_inativo      : integer read       ffun_inativo       write ffun_inativo;
   property doc_ativo        : string read          fdoc_ativo         write fdoc_ativo;
   property doc_dtinativo    : string read   fdoc_dtinativo     write fdoc_dtinativo;
   property doc_ordem        : integer read         fdoc_ordem         write fdoc_ordem;
   property doc_dtassinatura : string read fdoc_dtassinatura write fdoc_dtassinatura;
   property pdf              : TArrayByte read fpdf write fpdf;
   property assinado         : string   read fassinado   write fassinado;
   property temporario       : string read ftemporario write ftemporario;
   property modificado       : string read fmodificado write fmodificado;
   property imagens          : ImagensViewModel read fimagens write fimagens;
   property pasta            : PastaViewModel read fpasta write fpasta;
   property doc_usanodiploma : string read fdoc_usanodiploma write fdoc_usanodiploma;
   property tdo_seq          : integer read         ftdo_seq         write ftdo_seq;
   property aut_seq          : integer read         faut_seq         write faut_seq;
   property loc_seq          : integer read         floc_seq         write floc_seq;
   property doc_assunto      : string read fdoc_assunto write fdoc_assunto;
   property doc_titulo       : string read fdoc_titulo write fdoc_titulo;
   property assinaturas      : TObjectList read fassinaturas write fassinaturas;
end;

CamposViewModel = class
 private
    fcmp_codigo:integer;
    fcmp_descr:string;
    fcmp_tipo:string;
    fcmp_tamanho:smallint;
    fcmp_decimal:smallint;
    fcmp_mascara:string;
    fcmp_mascarac:string;
    fResultadoValidacao:string;
    fIsValid:boolean ;
 published
    property cmp_codigo : integer   read fcmp_codigo write fcmp_codigo;
    property cmp_descr : string read fcmp_descr write fcmp_descr;
    property cmp_tipo : string read fcmp_tipo write fcmp_tipo;
    property cmp_tamanho : smallint read fcmp_tamanho write fcmp_tamanho;
    property cmp_decimal : smallint read fcmp_decimal write fcmp_decimal;
    property cmp_mascara : string read fcmp_mascara write fcmp_mascara;
    property cmp_mascarac : string read fcmp_mascarac write fcmp_mascarac;
    property ResultadoValidacao:    string  read    fResultadoValidacao   write  fResultadoValidacao       ;
    property IsValid :              boolean   read  fIsValid         write       fIsValid      ;
end;

AreaCamposViewModel = class
 private
    farc_codigo:integer;
    fare_codigo:integer;
    fcmp_codigo:integer;
    fcmp_descricao:string;
    farc_descr:string;
    farc_requerido:string;
    farc_ordem:smallint;
    farc_chave:string;
    fsql:string;
    fcondicao:string;
    fcampos:CamposViewModel;
    fpastavalcampo:TObjectList;
    fareas:AreasViewModel;
    fResultadoValidacao:string;
    fIsValid:boolean ;
 public
    constructor create;
    destructor destroy;
 published
    property arc_codigo : integer   read farc_codigo write farc_codigo;
    property are_codigo : integer   read fare_codigo write fare_codigo;
    property cmp_codigo : integer   read fcmp_codigo write fcmp_codigo;
    property cmp_descricao : string read fcmp_descricao write fcmp_descricao;
    property arc_descr : string read farc_descr write farc_descr;
    property arc_requerido : string read farc_requerido write farc_requerido;
    property arc_ordem : smallint read farc_ordem write farc_ordem;
    property arc_chave : string read farc_chave write farc_chave;
    property sql : string read fsql write fsql;
    property condicao : string read fcondicao write fcondicao;
    property campos: CamposViewModel read fcampos write fcampos;
    property pastavalcampo: TObjectList read fpastavalcampo write fpastavalcampo;
    property areas: AreasViewModel read fareas write fareas;
    property ResultadoValidacao:    string  read    fResultadoValidacao   write  fResultadoValidacao       ;
    property IsValid :              boolean   read  fIsValid         write       fIsValid      ;
end;

PastaValCampoViewModel = class
 private
        farc_codigo : integer  ;
        fpst_codigo : integer  ;
        fpvc_numero : currency ;
        fpvc_data   : string;
        fpvc_texto  : string   ;
        fcmp_codigo : integer;
        fareacampos : AreaCamposViewModel;
        fConteudo   : string;
 published
  property arc_codigo : integer   read farc_codigo write farc_codigo ;
  property pst_codigo : integer   read fpst_codigo write fpst_codigo ;
  property pvc_numero : currency  read fpvc_numero write fpvc_numero ;
  property pvc_data   : string read fpvc_data   write fpvc_data   ;
  property pvc_texto  : string    read fpvc_texto  write fpvc_texto  ;
  property cmp_codigo: integer    read fcmp_codigo write fcmp_codigo;
  property areacampos: AreaCamposViewModel read fareacampos write fareacampos;
  property Conteudo  : string    read fConteudo  write fConteudo;
end;

PastaEDocumentosViewModel = class
 private
    fDocumentos: TObjectList;
    fPasta : PastaViewModel;
 public
    constructor create;
    destructor destroy;
 published
    property Documentos: TObjectList read fDocumentos write fDocumentos;
    property Pasta: PastaViewModel read fPasta write fPasta;
end;

implementation

constructor DocumentosViewModel.create;
begin
  fassinaturas:=TObjectList.Create;
end;

destructor DocumentosViewModel.destroy;
begin
  fassinaturas.destroy;
end;

constructor PastaEDocumentosViewModel.create;
begin
  fPasta:=PastaViewModel.Create;
  fDocumentos:=TObjectList.Create;
end;

destructor PastaEDocumentosViewModel.destroy;
begin
  fPasta.destroy;
  fDocumentos.destroy;
end;

constructor AreaCamposViewModel.create;
begin
  fpastavalcampo:=TObjectList.Create;
end;

destructor AreaCamposViewModel.destroy;
begin
  fpastavalcampo.destroy;
end;

constructor PastaViewModel.create;
begin
  fpastavalcampo:=TObjectList.Create;
  fDocumentos:=TObjectList.Create;
end;

destructor PastaViewModel.destroy;
begin
  fpastavalcampo.destroy;
  fDocumentos.destroy;
end;

end.
