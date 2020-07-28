unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ZAbstractConnection,
  ZConnection, generics.collections, ShellApi, IniFiles;

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
    procedure reiniciarAplicação;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  procedure criarZconnection;
end;


var
  frmPrincipal: TfrmPrincipal;
  numeroDesejado, vHostName, vDataBase, vUser, vPassword, vProtocol :string;
  zconnection :TZConnection;
  indice, save, vPort :integer;
  arquivoIni : TIniFile;


implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  if vHostName = '' then
    ShowMessage('Parâmetro de hostname vazio! Verifique no arquivo de Configuração')
  else
    if vDataBase = ''  then
      ShowMessage ('Parâmetro de database vazio! Verifique no arquivo de Configuração')
    else
      if vUser = '' then
        ShowMessage('Parâmetro de user vazio! Verifique no arquivo de Configuração')
      else
        if vPassword = '' then
          ShowMessage('Parâmetro de password vazio! Verifique no arquivo de Configuração')
        else
          if vProtocol = '' then
            ShowMessage('Parâmetro de protocol vazio! Verifique no arquivo de Configuração')
          else
            if VPort = 0 then
            ShowMessage('Parâmetro de port vazio! Verifique no arquivo de Configuração')
            else
              if edtNumeroDesejado.Text = '' then
                begin
                  ShowMessage ('É preciso colocar o numero de conexões!');
                end
                else
                begin
                  btnConectar.Enabled := False;
                  numeroDesejado      := edtNumeroDesejado.Text;
                  for indice := 0 To numeroDesejado.ToInteger do
                  begin
                  lblNumero.Caption := 'Numero de conexões feitas com sucesso: '+indice.ToString;
                  criarZconnection;
                  save := indice;
                end;
                  btnLiberarConexoes.Enabled := True;
                end;
end;

procedure TfrmPrincipal.btnLiberarConexoesClick(Sender: TObject);

begin
  reiniciarAplicação;
end;

procedure TfrmPrincipal.reiniciarAplicação;
var nomeDoAplicativo : PChar;
begin
  nomeDoAplicativo := PChar(Application.ExeName);
  ShellExecute(Handle,'open', nomeDoAplicativo, nil, nil, SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure TfrmPrincipal.criarZconnection;
begin
zconnection := TZConnection.Create(nil);

zconnection.HostName := vHostName;
zconnection.Port     := vPort;
zconnection.Database := vDataBase;
zconnection.User     := vUser;
zconnection.Password := vPassword;
zconnection.Protocol := vProtocol;
zconnection.Connect;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  ArquivoIni: TIniFile;
begin
  if FileExists (ExtractFilePath(Application.ExeName) + 'Conectar.ini') then
  begin
    arquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Conectar.ini');
    vHostName := arquivoIni.ReadString('Config Database', 'HostName', 'Erro ao ler o valor do Host');
    vPort     := arquivoIni.ReadInteger('Config Database', 'Port', 0);
    vDataBase := arquivoIni.ReadString('Config Database', 'DataBase', 'Erro ao ler o valor de DataBase');
    vUser     := arquivoIni.ReadString('Config Database', 'User', 'Erro ao ler o valor de User');
    vPassword := arquivoIni.ReadString('Config Database', 'Password', 'Erro ao ler o valor de Password');
    vProtocol := arquivoIni.ReadString('Config Database', 'Protocol', 'Erro ao ler o valor de Protocol');
  end
  else
  begin
   arquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Conectar.ini');
    arquivoIni.WriteString('Config Database', 'HostName', '');
    arquivoIni.WriteInteger('Config Database', 'Port', 5432);
    arquivoIni.WriteString('Config Database', 'DataBase', '');
    arquivoIni.WriteString('Config Database', 'User', '');
    arquivoIni.WriteString('Config Database', 'Password', '');
    arquivoIni.WriteString('Config Database', 'Protocol', 'postgresql');
    arquivoIni.Free;
    ShowMessage('Um arquivo de configuração ''Conectar.ini'' foi criado'+
    ' na pasta onde se encontra o Executável deste progama.'
    +' Certifique-se de alterar corretamente para que a conexão seja bem sucedida!');
  end;
end;

end.
