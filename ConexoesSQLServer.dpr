program ConexoesSQLServer;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.Title := 'Teste de conexões ';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
