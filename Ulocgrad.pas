unit ULocGrad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, ExtCtrls,
  RXDBCtrl, Mask, rxToolEdit, rxCurrEdit, Variants;

type
  TF_LocGrade = class(TForm)
    Panel1: TPanel;
    RGConsulta: TRadioGroup;
    Label1: TLabel;
    b_finaliza: TBitBtn;
    Q_GraLet: TQuery;
    DS_GraLet: TDataSource;
    Q_Curso: TQuery;
    DS_Curso: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    E_PerLet: TEdit;
    Q_GraLetgrl_codgra: TSmallintField;
    Q_GraLetcur_codigo: TSmallintField;
    Q_GraLetgrl_inicio: TSmallintField;
    Q_GraLetcur_nomcur: TStringField;
    Q_GraLetgrt_fechado: TStringField;
    Q_GraLetgrl_anoinicio: TSmallintField;
    Q_GraLetgrl_seminicio: TSmallintField;
    GroupBox1: TGroupBox;
    CEAno: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    CESem: TCurrencyEdit;
    DBGrid1: TRxDBGrid;
    procedure RGConsultaEnter(Sender: TObject);
    procedure RGConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure b_finalizaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_PerLetExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure GroupBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LocGrade: TF_LocGrade;
  s1,s2,s3,s4,s5,s6,s7 : string;
  vCodGra,vGraCur,vGraIni  : integer;

implementation

uses UProcs, Umenupri;

{$R *.DFM}

procedure TF_LocGrade.RGConsultaEnter(Sender: TObject);
begin
  E_PerLet.visible:=false;
  E_PerLet.Text:='';
  label1.visible:=false;
  Label2.Visible:=False;
  dblookupcombobox1.visible:=false;
  Q_GraLet.close;
end;

procedure TF_LocGrade.RGConsultaClick(Sender: TObject);
begin
  case RGConsulta.ItemIndex of
    0:begin
        Q_GraLet.Close;
        Q_GraLet.SQL.Clear;
        Q_GraLet.SQL.Add(s1+s2+s3);
        If CEAno.Value <> 0
        Then
         Begin
           Q_GraLet.SQL.Add(s5);
           Q_GraLet.ParamByName('anoinicio').AsInteger:=CEAno.AsInteger;
         End;
        If CESem.Value <> 0
        Then
         Begin
           Q_GraLet.SQL.Add(s6);
           Q_GraLet.ParamByName('seminicio').AsInteger:=CESem.AsInteger;
         End;
        If (vunidade <> 999) and (vunidade <> 0)
        Then
         Begin
          Q_GraLet.Sql.Add('and cam_codigo =:cod');
          Q_GraLet.ParamByName('cod').AsInteger:=vunidade;
         End;
        If (vnivel = 27) or (vnivel = 46) or (vnivel = 48) or (vnivel = 49) // Coordenadores, Secretaria Medicina Completo, Secretaria EAD
        Then
         Begin
          If vnivel = 49 // secretaria polo ead
          Then Q_GraLet.Sql.Add('and g.cur_codigo in (select cur_codigo from sca_cursos where set_codigo = 1251)')
          Else
           Begin
             Q_GraLet.Sql.Add('and g.cur_codigo in (select cur_codigo from sca_cursofunc where fun_codigo =:matr)');
             Q_GraLet.ParamByName('matr').AsInteger:=vcodusu;
           End;  
         End;
        Q_GraLet.Sql.Add('Order By C.Cur_NomCur,G.Grl_Inicio');
        Q_GraLet.Open;
        DBgrid1.setfocus;
      end;
    1:begin
//        Q_Curso.Open;
//        Q_Curso.First;
        label1.visible:=true;
        dblookupcombobox1.visible:=true;
        dblookupcombobox1.setfocus;
      end;
    2:begin
//        Q_Curso.Open;
//        Q_Curso.First;
        label1.visible:=true;
        Label2.Visible:=True;
        E_PerLet.Visible:=True;
        dblookupcombobox1.visible:=true;
        dblookupcombobox1.setfocus;
      end;
  end;
end;

procedure TF_LocGrade.FormActivate(Sender: TObject);
begin
  Consulta_Cursos(Q_Curso);
  vCodGra:=0;
  vGraCur:=0;
  vGraIni:=0;
  s1:='Select Distinct G.Grl_CodGra, G.GrL_Inicio, G.Cur_Codigo, C.Cur_NomCur, GrT_Fechado, grl_anoinicio, grl_seminicio ';
  s2:=' from SCA_Grades_Letivo G, SCA_Cursos C, Outer SCA_GradesAtu GA ';
  s3:='where G.Cur_Codigo = C.Cur_Codigo and G.Cur_Codigo = GA.Cur_Codigo and G.Grl_CodGra = GA.Grl_CodGra ';
  s4:=' and c.Cur_Codigo = :vcur ';
  s5:=' and grl_anoinicio =:anoinicio ';
  s6:=' and grl_seminicio =:seminicio ';
  s7:='Order By C.Cur_NomCur,G.Grl_Inicio';
end;

procedure TF_LocGrade.DBGrid1DblClick(Sender: TObject);
begin
 If Q_GraLet['GrL_CodGra'] <> Null
 Then
  Begin
   vCodGra:=Q_GraLet['GrL_CodGra'];
   vGraCur:=Q_GraLet['Cur_Codigo'];
   vGraIni:=Q_GraLet['GrL_Inicio'];
   F_LocGrade.close;
  End; 
end;

procedure TF_LocGrade.b_finalizaClick(Sender: TObject);
begin
  F_LocGrade.Close;
end;

procedure TF_LocGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Q_GraLet.Close;
  Q_Curso.Close;
  {F_LocGrade.Release;}
end;

procedure TF_LocGrade.E_PerLetExit(Sender: TObject);
begin
  if (ActiveControl<>B_Finaliza) and (E_PerLet.text <> '') then
  begin
    Q_GraLet.Close;
    Q_GraLet.SQL.Clear;
    Q_GraLet.SQL.Add(s1+s2+s3);
//    Q_GraLet.SQL.Add(' and G.Cur_Codigo=:vCur and G.GrL_Inicio=(Select Max(GrL_Inicio) From SCA_Grades_Letivo ');
//    Q_GraLet.SQL.Add('Where  Cur_Codigo=:vCur and GrL_Inicio<=:vPer)');
    Q_GraLet.SQL.Add(' and G.Cur_Codigo=:vCur and G.GrL_Inicio=:vPer');
    If CEAno.Value <> 0
    Then
     Begin
       Q_GraLet.SQL.Add(s5);
       Q_GraLet.ParamByName('anoinicio').AsInteger:=CEAno.AsInteger;
     End;
    If CESem.Value <> 0
    Then
     Begin
       Q_GraLet.SQL.Add(s6);
       Q_GraLet.ParamByName('seminicio').AsInteger:=CESem.AsInteger;
     End;
    Q_GraLet.ParamByName('vCur').AsInteger:=Q_Curso['Cur_Codigo'];
    Q_GraLet.ParamByName('vPer').AsInteger:=StrToInt(E_PerLet.Text);
    Q_GraLet.Open;
    DBGrid1.SetFocus;
  end;
end;

procedure TF_LocGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TF_LocGrade.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Key:=#0;
end;

procedure TF_LocGrade.DBGrid1GetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
 If Q_GraLet['grt_fechado'] <> Null
 Then
  Begin
   Background:=$0080FFFF;
   AFont.Color:=clBlack;
  End;
end;

procedure TF_LocGrade.GroupBox1Exit(Sender: TObject);
begin
  RGConsultaClick(Sender);
end;

procedure TF_LocGrade.DBLookupComboBox1Exit(Sender: TObject);
begin
  if RGConsulta.ItemIndex = 1 then
  begin
    Q_GraLet.Close;
    Q_GraLet.SQL.Clear;
    Q_GraLet.SQL.Add(s1+s2+s3+s4);
    If CEAno.Value <> 0
    Then
     Begin
       Q_GraLet.SQL.Add(s5);
       Q_GraLet.ParamByName('anoinicio').AsInteger:=CEAno.AsInteger;
     End;
    If CESem.Value <> 0
    Then
     Begin
       Q_GraLet.SQL.Add(s6);
       Q_GraLet.ParamByName('seminicio').AsInteger:=CESem.AsInteger;
     End;
    Q_GraLet.SQL.Add(s7);
    Pesquisa(Q_GraLet,[Q_Curso['Cur_Codigo']]);
    DBGrid1.SetFocus;
  end
  else E_PerLet.SetFocus;
end;

procedure TF_LocGrade.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  DBLookupComboBox1Exit(Sender);
end;

end.
