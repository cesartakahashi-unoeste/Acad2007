program PRelAcad;

uses
  Forms,
  UMenupri in 'UMenupri.pas' {Menuprin},
  Uprocs in 'Uprocs.pas' {FProcs},
  URCert5 in 'URCert5.pas' {FRCert5},
  UConsAlu in 'UConsAlu.pas' {FConsAlu};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title:='Controle Acadêmico';
  Application.CreateForm(TMenuprin, Menuprin);
  Application.CreateForm(TFProcs, FProcs);
  Application.OnMessage:=Menuprin.MessageHandle;
  Application.Run;
end.
