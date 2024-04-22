unit ULivDipl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, DBTables, DB, Grids, DBGrids,
  Buttons, RXDBCtrl, lmdclass, ppDB, ppDBPipe, ppBands, ppClass, ppCtrls,
  ppPrnabl, ppStrtch, ppRichView, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  RVStyle, jpeg, Variants, ppDesignLayer, ppParameter, rxToolEdit, rxCurrEdit;

type
  TFLivDipl = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    b_cancela: TBitBtn;
    b_ok: TBitBtn;
    B_Sair: TBitBtn;
    Label5: TLabel;
    Label2: TLabel;
    DBEAulas2: TDBEdit;
    Label3: TLabel;
    DBEAtiv2: TDBEdit;
    QLivroDiploma: TQuery;
    DSLivroDiploma: TDataSource;
    CELivro: TCurrencyEdit;
    Label4: TLabel;
    CBTipo: TComboBox;
    QAux: TQuery;
    Label1: TLabel;
    DBEPag: TDBEdit;
    RTermo: TppReport;
    ppDetailBand2: TppDetailBand;
    ppRichView1: TppRichView;
    LTitulo: TppLabel;
    ppLine43: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBPipeline1: TppDBPipeline;
    ppLabel1: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    procedure B_SairClick(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure b_okClick(Sender: TObject);
    procedure b_okExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CELivroExit(Sender: TObject);
    procedure CBTipoEnter(Sender: TObject);
    procedure CELivroEnter(Sender: TObject);
    procedure DBEPagExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLivDipl: TFLivDipl;

implementation

Uses UMenupri, UProcs;

{$R *.DFM}

procedure TFLivDipl.B_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFLivDipl.b_cancelaClick(Sender: TObject);
begin
  CBTipo.SetFocus;
end;

procedure TFLivDipl.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  QAux.Close;
  QLivroDiploma.Close;
end;

procedure TFLivDipl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TFLivDipl.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TFLivDipl.b_okClick(Sender: TObject);
var vnivel:string;
    vdia,vmes,vano,sem: word;
    livro:string;
begin
  If (QLivroDiploma.State = dsInsert) or (QLivroDiploma.State = dsEdit)
  Then
   Begin
     Try
       livro:='';
       vnivel:='';
       If CBTipo.ItemIndex = 0
       Then vnivel:='Graduação em Nível Superior'
       Else
        If CBTipo.ItemIndex = 1
        Then vnivel:='Mestrado'
        Else
         If CBTipo.ItemIndex = 2
         Then vnivel:='Doutorado';

       ppRichView1.RichView.Clear;
       ppRichView1.RichView.Style.TextStyles.Items[0].FontName:='Times New Roman';
       ppRichView1.RichView.Style.TextStyles.Items[0].Size:=12;
       ppRichView1.RichView.Style.TextStyles.Items[0].Color:=clBlack;
       ppRichView1.RichView.Style.TextStyles.Items[0].Style:=[];

       ppRichView1.RichView.Style.TextStyles.Items[1].FontName:='Times New Roman';
       ppRichView1.RichView.Style.TextStyles.Items[1].Size:=12;
       ppRichView1.RichView.Style.TextStyles.Items[1].Color:=clBlack;
       ppRichView1.RichView.Style.TextStyles.Items[1].Style:=[];

       ppRichView1.RichView.Style.ParaStyles.Items[0].Alignment:=rvaJustify;
       ppRichView1.RichView.Style.ParaStyles.Items[0].LineSpacing:=150;
       ppRichView1.RichView.Style.ParaStyles.Items[0].FirstIndent:=120;

       ppRichView1.RichView.Style.ParaStyles.Items[1].Alignment:=rvaLeft;
       ppRichView1.RichView.Style.ParaStyles.Items[1].LineSpacing:=150;
       ppRichView1.RichView.Style.ParaStyles.Items[1].FirstIndent:=120;

       If (QLivroDiploma.State = dsInsert)
       Then
        Begin
          livro:='AberturaLivro.pdf';
          LTitulo.Caption:='Termo de Abertura';
          ppRichView1.RichView.AddNL('Servirá o presente livro nº '+CELivro.Text+', com '+DBEPag.Text+' páginas numeradas de 001 a '+DBEPag.Text+' para o registro de diplomas de '+vnivel,0,0);
          ppRichView1.RichView.AddNL(', efetuados pela Universidade do Oeste Paulista a partir desta data.',0,-1);
          QLivroDiploma['liv_dtabertura']:=Pega_DataHora;
          QLivroDiploma['fun_abertura']:=vcodusu;
        End
       Else
        Begin
          livro:='EncerramentoLivro.pdf';
          LTitulo.Caption:='Termo de Encerramento';
          ppRichView1.RichView.AddNL('O presente livro nº '+CELivro.Text+', com '+DBEPag.Text+' páginas numeradas de 001 a '+DBEPag.Text+', destinou-se ao registro de diplomas de '+vnivel+'.',0,0);
          QLivroDiploma['liv_dtencerramento']:=Pega_DataHora;
          QLivroDiploma['fun_encerramento']:=vcodusu;
        End;
       QLivroDiploma.Post;

       QLivroDiploma.Close;
       QLivroDiploma.Sql.Clear;
       QLivroDiploma.Sql.Add('select * from sca_livrodiploma');
       QLivroDiploma.Sql.Add('where liv_tipo =:tipo and liv_numero =:num');
       QLivroDiploma.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
       QLivroDiploma.ParamByName('num').AsSmallInt:=CELivro.AsInteger;
       QLivroDiploma.Open;

       DecodeDate(DataSis,vano,vmes,vdia);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('',0,0);
       ppRichView1.RichView.AddNL('S.R.D., em '+StrZero(vdia,2)+'  de  '+Trata_Texto(Mes[vmes])+'  de  '+IntToStr(vano)+'.',1,0);
//       ppRichView1.RichView.Format;

       RTermo.AllowPrintToFile := True;
       RTermo.ShowPrintDialog := False;
       RTermo.ShowCancelDialog := False;
       RTermo.TextFileName := livro;
       RTermo.DeviceType := 'PDFA';
       RTermo.Print;
     Except
       MessageDlg('Ocorreu um erro. Cadastro será cancelado!',mtError,[mbOk],0);
       QLivroDiploma.Cancel;
     End;
   End;
  CBTipo.SetFocus;
end;

procedure TFLivDipl.b_okExit(Sender: TObject);
begin
  B_Ok.Enabled:=False;
end;

procedure TFLivDipl.FormActivate(Sender: TObject);
begin
  CBTipo.ItemIndex:=0;
  CBTipo.SetFocus;
end;

procedure TFLivDipl.CELivroExit(Sender: TObject);
begin
 If (not CBTipo.Focused) and (not B_Cancela.Focused) and (not B_Sair.Focused)
 Then
  If CELivro.Value = 0
  Then CELivro.SetFocus
  Else
   Begin
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select * from sca_livrodiploma');
     QAux.Sql.Add('where liv_tipo =:tipo');
     QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
     QAux.Open;
     If QAux.Eof // não existem livros cadastrados portanto o usuário pode informar o número de livro que ele quiser
     Then
      Begin
        If MessageDlg('Deseja efetuar a abertura do livro nº '+CELivro.Text+' ? ',mtConfirmation, [mbYes, mbNo], 0) = mrYes
        Then
         Begin
           QLivroDiploma.Close;
           QLivroDiploma.Sql.Clear;
           QLivroDiploma.Sql.Add('select * from sca_livrodiploma');
           QLivroDiploma.Sql.Add('where liv_tipo =:tipo and liv_numero =:num');
           QLivroDiploma.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
           QLivroDiploma.ParamByName('num').AsSmallInt:=CELivro.AsInteger;
           QLivroDiploma.Open;
           QLivroDiploma.Append;
           QLivroDiploma['liv_numero']:=CELivro.AsInteger;
           QLivroDiploma['liv_tipo']:=CBTipo.ItemIndex;
           CELivro.Enabled:=False;
           DBEPag.SetFocus;
         End
        Else CELivro.SetFocus;
      End
     Else
      Begin
        QLivroDiploma.Close;
        QLivroDiploma.Sql.Clear;
        QLivroDiploma.Sql.Add('select * from sca_livrodiploma');
        QLivroDiploma.Sql.Add('where liv_tipo =:tipo and liv_numero =:num');
        QLivroDiploma.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
        QLivroDiploma.ParamByName('num').AsSmallInt:=CELivro.AsInteger;
        QLivroDiploma.Open;
        If not QLivroDiploma.Eof
        Then
         Begin
           If QLivroDiploma['liv_dtencerramento'] <> Null
           Then
            Begin
              MessageDlg('Encerramento deste livro foi efetuado em '+DateTimeToStr(QLivroDiploma['liv_dtencerramento'])+' !',mtInformation,[mbOk],0);
              CELivro.SetFocus;
            End
           Else
            Begin
              QAux.Close;
              QAux.Sql.Clear;
              QAux.Sql.Add('select max(ldf_folha) folha from sca_livrodipfol');
              QAux.Sql.Add('where liv_tipo =:tipo and liv_numero =:num');
              QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
              QAux.ParamByName('num').AsSmallInt:=CELivro.AsInteger;
              QAux.Open;
              If QLivroDiploma['liv_nrofolhas'] <> NULLToZero(QAux['folha'])
              Then
               Begin
                 MessageDlg('Livro nº '+CELivro.Text+' ainda não atingiu o máximo de folhas definido!',mtError,[mbOk],0);
                 CELivro.SetFocus;
               End
              Else
               If MessageDlg('Deseja efetuar o encerramento do livro nº '+CELivro.Text+' ? ',mtConfirmation, [mbYes, mbNo], 0) = mrYes
               Then
                Begin
                  CELivro.Enabled:=False;
                  QLivroDiploma.Edit;
                  B_Ok.Enabled:=True;
                  B_Ok.SetFocus;
                End
               Else CELivro.SetFocus;
            End;   
         End
        Else
         Begin
           QAux.Close;
           QAux.Sql.Clear;
           QAux.Sql.Add('select * from sca_livrodiploma');
           QAux.Sql.Add('where liv_tipo =:tipo and liv_dtencerramento is null');
           QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
           QAux.Open;
           If not QAux.Eof
           Then
            Begin
              MessageDlg('O livro nº '+IntToStr(QAux['liv_numero'])+' está em aberto. Abertura de um novo não pode ser efetuada !',mtError,[mbOk],0);
              CELivro.Value:=QAux['liv_numero'];
              CELivro.SetFocus;
            End
           Else
            Begin
              QAux.Close;
              QAux.Sql.Clear;
              QAux.Sql.Add('select max(liv_numero) livro from sca_livrodiploma');
              QAux.Sql.Add('where liv_tipo =:tipo');
              QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
              QAux.Open;
              If CELivro.AsInteger <> QAux['livro'] + 1
              Then
               Begin
                 MessageDlg('O novo livro a ser aberto deve ser o nº '+IntToStr(QAux['livro'] + 1)+' !',mtError,[mbOk],0);
                 CELivro.Value:=QAux['livro'] + 1;
                 CELivro.SetFocus;
               End
              Else
               If MessageDlg('Deseja efetuar a abertura do livro nº '+CELivro.Text+' ? ',mtConfirmation, [mbYes, mbNo], 0) = mrYes
               Then
                Begin
                  QLivroDiploma.Close;
                  QLivroDiploma.Sql.Clear;
                  QLivroDiploma.Sql.Add('select * from sca_livrodiploma');
                  QLivroDiploma.Sql.Add('where liv_tipo =:tipo and liv_numero =:num');
                  QLivroDiploma.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
                  QLivroDiploma.ParamByName('num').AsSmallInt:=CELivro.AsInteger;
                  QLivroDiploma.Open;
                  QLivroDiploma.Append;
                  QLivroDiploma['liv_numero']:=CELivro.AsInteger;
                  QLivroDiploma['liv_tipo']:=CBTipo.ItemIndex;
                  CELivro.Enabled:=False;
                  DBEPag.SetFocus;
                End
               Else CELivro.SetFocus;
            End;
         End;
      End;
   End;
end;

procedure TFLivDipl.CBTipoEnter(Sender: TObject);
begin
  Limpa(FLivDipl);
  CELivro.Enabled:=True;
  B_Cancela.Enabled:=True;
  B_Ok.Enabled:=False;
  QLivroDiploma.Close;
  QAux.Close;
end;

procedure TFLivDipl.CELivroEnter(Sender: TObject);
begin
  QAux.Close;
  QAux.Sql.Clear;
  QAux.Sql.Add('select max(liv_numero) livro from sca_livrodiploma');
  QAux.Sql.Add('where liv_tipo =:tipo and liv_dtencerramento is null');
  QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
  QAux.Open;
  If NULLToZero(QAux['livro']) = 0 // não existe livro em aberto
  Then
   Begin
     QAux.Close;
     QAux.Sql.Clear;
     QAux.Sql.Add('select max(liv_numero) livro from sca_livrodiploma');
     QAux.Sql.Add('where liv_tipo =:tipo');
     QAux.ParamByName('tipo').AsSmallInt:=CBTipo.ItemIndex;
     QAux.Open;
     CELivro.Value:=NULLToZero(QAux['livro']) + 1;
   End
  Else CELivro.Value:=NULLToZero(QAux['livro']);
  CELivro.SelectAll;
end;

procedure TFLivDipl.DBEPagExit(Sender: TObject);
begin
 If (not B_Cancela.Focused) and (not B_Sair.Focused)
 Then
  If Trim(DBEPag.Text) = ''
  Then DBEPag.SetFocus
  Else
   Begin
     B_Ok.Enabled:=True;
     B_Ok.SetFocus;
   End;
end;

end.
