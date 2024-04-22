unit UConsAlu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, DBCtrls, Mask,
  rxToolEdit, rxCurrEdit, Variants;

type
  TFConsAlu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    ENome: TEdit;
    B_Sair: TBitBtn;
    DBGrid1: TDBGrid;
    QConsAlu: TQuery;
    DSConsAlu: TDataSource;
    QConsAlualu_ra: TFloatField;
    QConsAlupes_nome: TStringField;
    RGConsulta: TRadioGroup;
    QConsAlupes_rg: TStringField;
    QConsAlupes_nompai: TStringField;
    QConsAlupes_nommae: TStringField;
    QConsAlura: TStringField;
    MERA: TCurrencyEdit;
    QConsAlupes_sacento: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure ENomeExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_SairClick(Sender: TObject);
    procedure RGConsultaClick(Sender: TObject);
    procedure MERAExit(Sender: TObject);
    procedure QConsAluCalcFields(DataSet: TDataSet);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsAlu: TFConsAlu;
  VRAcad: Real;

implementation

Uses UProcs, Umenupri;

{$R *.DFM}

procedure TFConsAlu.FormActivate(Sender: TObject);
begin
 FormatoRA(MERA,RAMask,RACurrency);
 VRAcad:=0;
 If (FConsAlu.Tag <> 10) and (FConsAlu.Tag <> 11)
 Then
  Begin
   RGConsulta.ItemIndex:=0;
   ENome.Visible:=True;
   ENome.SetFocus;
  End
 Else
  If FConsAlu.Tag = 10
  Then RGConsulta.ItemIndex:=1
  Else RGConsulta.ItemIndex:=0;
end;

procedure TFConsAlu.ENomeExit(Sender: TObject);
begin
 If (ENome.Text <> '') and (not B_Sair.Focused)
 Then
  Begin
   QConsAlu.Close;
   QConsAlu.Sql.Clear;
   QConsAlu.Sql.Add('Select A.Alu_RA, P.Pes_Nome, P.Pes_RG, P.Pes_NomPai, P.Pes_NomMae,P.Pes_SAcento');
   QConsAlu.Sql.Add('From SCA_Alunos A, CRP_Pessoas P, SCA_Cursos C');
   QConsAlu.Sql.Add('Where A.Pes_Nro = P.Pes_Nro and A.Cur_Codigo = C.Cur_Codigo and P.Pes_SAcento like :Nome');
   If (vnivel = 27) or (vnivel = 46) or (vnivel = 48) or (vnivel = 49) // Coordenadores, Secretaria Medicina Completo, Secretaria EAD
   Then
    Begin
     If (vnivel = 48) or (vnivel = 49) // secretaria geral ead ou secretaria polo ead
     Then
      Begin
        If (vnivel = 49) // secretaria polo ead
        Then
         Begin
           QConsAlu.Sql.Add('and c.cur_codigo in (select cur_codigo from sca_cursos where set_codigo = 1251) and a.pol_codigo =:polo');
           QConsAlu.ParamByName('polo').AsInteger:=vpolo;
         End
        Else
         Begin
           QConsAlu.Sql.Add('and (c.cur_codigo in (select cur_codigo from sca_cursos where set_codigo = 1251) or c.cur_codigo in (select cur_codigo from sca_cursofunc where fun_codigo =:matr))');
           QConsAlu.ParamByName('matr').AsInteger:=vcodusu;
         End;
      End
     Else
      Begin
        QConsAlu.Sql.Add('and c.cur_codigo in (select cur_codigo from sca_cursofunc where fun_codigo =:matr)');
        QConsAlu.ParamByName('matr').AsInteger:=vcodusu;
      End;
    End
   Else Filtra_Unidade(QConsAlu);
   QConsAlu.ParamByName('Nome').AsString:=Tira_Acentos(ENome.Text) + '%';
   QConsAlu.Sql.Add('Order by Pes_SAcento');
   QConsAlu.Open;
   DbGrid1.SetFocus;
  End;
end;

procedure TFConsAlu.DBGrid1DblClick(Sender: TObject);
begin
 If QConsAlu['alu_ra'] <> Null
 Then
  Begin
   VRAcad:=QConsAlu['Alu_RA'];
   B_Sair.Click;
  End;
end;

procedure TFConsAlu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QConsAlu.Close;
end;

procedure TFConsAlu.B_SairClick(Sender: TObject);
begin
  FConsAlu.Close;
end;

procedure TFConsAlu.RGConsultaClick(Sender: TObject);
begin
  Case RGConsulta.ItemIndex of
    0:Begin
       Label1.Caption:='Nome do Aluno';
       ENome.Visible:=True;
       MERA.Visible:=False;
       ENome.SetFocus;
      End;
    1:Begin
       Label1.Caption:='Registro Acadêmico';
       ENome.Visible:=False;
       MERA.Visible:=True;
       MERA.SetFocus;
      End;
  End;
end;

procedure TFConsAlu.MERAExit(Sender: TObject);
begin
 If (MERA.Text <> '') and (not B_Sair.Focused)
 Then
  Begin
//   MERA.Text:=StrZero(StrToFloat(Trim(MERA.Text)),10);
   QConsAlu.Close;
   QConsAlu.Sql.Clear;
   QConsAlu.Sql.Add('Select A.Alu_RA, P.Pes_Nome, P.Pes_RG, P.Pes_NomPai, P.Pes_NomMae, P.Pes_SAcento');
   QConsAlu.Sql.Add('From SCA_Alunos A, CRP_Pessoas P, SCA_Cursos C');
   QConsAlu.Sql.Add('Where A.Pes_Nro = P.Pes_Nro and A.Cur_Codigo = C.Cur_Codigo and A.Alu_RA =:RA');
   If (vnivel = 27) or (vnivel = 46) or (vnivel = 48) or (vnivel = 49) // Coordenadores, Secretaria Medicina Completo, Secretaria EAD
   Then
    Begin
     If vnivel = 49 // secretaria polo ead
     Then
      Begin
        QConsAlu.Sql.Add('and c.cur_codigo in (select cur_codigo from sca_cursos where set_codigo = 1251) and a.pol_codigo =:polo');
        QConsAlu.ParamByName('polo').AsInteger:=vpolo;
      End
     Else
      Begin
        QConsAlu.Sql.Add('and c.cur_codigo in (select cur_codigo from sca_cursofunc where fun_codigo =:matr)');
        QConsAlu.ParamByName('matr').AsInteger:=vcodusu;
      End;  
    End;
   Filtra_Unidade(QConsAlu);
   QConsAlu.ParambyName('ra').AsFloat:=StrToFloat(Trim(MERA.Text));
   QConsAlu.Open;
   DbGrid1.SetFocus;
  End;
end;

procedure TFConsAlu.QConsAluCalcFields(DataSet: TDataSet);
begin
  QConsAlura.value:=Mascara_RA(QConsAlu['alu_ra']);
end;

procedure TFConsAlu.DBGrid1Enter(Sender: TObject);
begin
 KeyPreview:=False;
end;

procedure TFConsAlu.DBGrid1Exit(Sender: TObject);
begin
 KeyPreview:=True;
end;

procedure TFConsAlu.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13
 Then DBGrid1.OnDblClick(Sender)
 Else
  If Key = #27
  Then
   If RGConsulta.ItemIndex = 0
   Then ENome.SetFocus
   Else MERA.SetFocus;
end;

procedure TFConsAlu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TFConsAlu.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

end.
