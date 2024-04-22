program Main;

uses
  Vcl.Forms,
  Umain in 'Umain.pas' {Form3},
  Strak.Ghostscript in 'Strak.Ghostscript.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
