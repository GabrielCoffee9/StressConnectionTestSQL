object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Teste de conex'#227'o localhost'
  ClientHeight = 211
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblNumero: TLabel
    Left = 72
    Top = 133
    Width = 3
    Height = 13
  end
  object lblDigitarNumero: TLabel
    Left = 56
    Top = 43
    Width = 148
    Height = 13
    Caption = 'N'#250'mero de conex'#245'es desejada'
  end
  object btnConectar: TButton
    Left = 356
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = btnConectarClick
  end
  object edtNumeroDesejado: TEdit
    Left = 216
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnLiberarConexoes: TButton
    Left = 304
    Top = 168
    Width = 115
    Height = 25
    Caption = 'Liberar Conex'#245'es'
    Enabled = False
    TabOrder = 2
    OnClick = btnLiberarConexoesClick
  end
  object ZConnectionO: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = ''
    Left = 8
    Top = 136
  end
end
