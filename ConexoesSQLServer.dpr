program ConexoesSQLServer;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Testar conexões !';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
