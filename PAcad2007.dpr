program PAcad2007;

uses
  Forms,
  UMenupri in 'UMenupri.pas' {Menuprin},
  UConsAlu in 'UConsAlu.pas' {FConsAlu},
  UGed_Documentos in 'UGed_Documentos.pas',
  Uprocs in 'Uprocs.pas' {FProcs},
  Strak.Ghostscript in 'Strak.Ghostscript.pas',
  UExtPub in 'UExtPub.pas' {FExtPub},
  EXTENSOS in 'EXTENSOS.PAS',
  URHist9 in 'URHist9.pas' {FRHist9},
  URHist8 in 'URHist8.pas' {FRHist8},
  URHisPs8 in 'URHisPs8.pas' {FRHisPs8},
  URHisPs7 in 'URHisPs7.pas' {FRHisPs7},
  URotinas in 'Z:\acadD2007\URotinas.pas',
  Uargrade in 'Uargrade.pas' {F_AntGrade},
  Ulocgrad in 'Ulocgrad.pas' {F_LocGrade},
  URHisto2 in 'URHisto2.pas' {FRHisto2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title:='Controle Acadêmico';
  Application.CreateForm(TFProcs, FProcs);
  Application.CreateForm(TMenuprin, Menuprin);
  Application.OnMessage:=Menuprin.MessageHandle;
  Application.Run;
end.
