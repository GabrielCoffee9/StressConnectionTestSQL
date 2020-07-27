unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ZAbstractConnection,
  ZConnection, generics.collections, ShellApi;

type
  TfrmPrincipal = class(TForm)
    ZConnectionO: TZConnection;
    btnConectar: TButton;
    lblNumero: TLabel;
    edtNumeroDesejado: TEdit;
    lblDigitarNumero: TLabel;
    btnLiberarConexoes: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure btnLiberarConexoesClick(Sender: TObject);
    procedure reiniciarAplica��o;
  private
    { Private declarations }
  public
  procedure criarZconnection;
end;


var
  frmPrincipal: TfrmPrincipal;
  numeroDesejado : string;
  zconnection: TZConnection;
  indice, save : integer;


implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  if edtNumeroDesejado.Text = '' then
  begin
    ShowMessage ('� preciso colocar o numero de conex�es!');
  end
  else
  begin
    btnConectar.Enabled := False;
    numeroDesejado      := edtNumeroDesejado.Text;
    for indice := 0 To numeroDesejado.ToInteger do
    begin
      lblNumero.Caption := 'Numero de conex�es feitas com sucesso: '+indice.ToString;
      criarZconnection;
     save := indice;
    end;
    btnLiberarConexoes.Enabled := True;
  end;
end;

procedure TfrmPrincipal.btnLiberarConexoesClick(Sender: TObject);

begin
  reiniciarAplica��o;
end;

procedure TfrmPrincipal.reiniciarAplica��o;
var nomeDoAplicativo : PChar;
begin
  nomeDoAplicativo := PChar(Application.ExeName);
  ShellExecute(Handle,'open', nomeDoAplicativo, nil, nil, SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure TfrmPrincipal.criarZconnection;
begin
zconnection := TZConnection.Create(nil);

zconnection.HostName := 'localhost';
zconnection.Port     := 5432;
zconnection.Database := 'db_sgc';
zconnection.User     := 'postgres';
zconnection.Password := 'info$g10112';
zconnection.Protocol := 'postgresql';
zconnection.Connect;
end;

end.
