program ConexoesSQLServer;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Teste de conex�es ';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
