object frmOdometro: TfrmOdometro
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Od'#244'metro'
  ClientHeight = 172
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 172
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 693
      Height = 88
      Align = alTop
      Caption = 'Dados Da Viagem'
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 24
        Width = 59
        Height = 13
        Caption = '(Km)  Inicial:'
      end
      object Label2: TLabel
        Left = 12
        Top = 58
        Width = 54
        Height = 13
        Caption = '(Km)  Final:'
      end
      object Label3: TLabel
        Left = 163
        Top = 24
        Width = 124
        Height = 13
        Caption = 'N'#176' Litros de Combust'#237'vel: '
      end
      object Label4: TLabel
        Left = 329
        Top = 24
        Width = 95
        Height = 13
        Caption = 'Pre'#231'o Combustivel: '
      end
      object Label5: TLabel
        Left = 498
        Top = 23
        Width = 117
        Height = 13
        Caption = 'Capacidade do Tanque: '
      end
      object edtLitrosCombustivel: TEdit
        Left = 287
        Top = 21
        Width = 36
        Height = 21
        TabOrder = 2
        OnKeyPress = edtLitrosCombustivelKeyPress
      end
      object edtValorCombustivel: TEdit
        Left = 424
        Top = 21
        Width = 68
        Height = 21
        TabOrder = 3
        OnKeyPress = edtValorCombustivelKeyPress
      end
      object edtCapacidadeTanque: TEdit
        Left = 618
        Top = 20
        Width = 67
        Height = 21
        TabOrder = 4
        OnKeyPress = edtCapacidadeTanqueKeyPress
      end
      object btnCalcular: TButton
        Left = 159
        Top = 51
        Width = 75
        Height = 25
        Caption = 'Calcular'
        TabOrder = 5
        OnClick = btnCalcularClick
      end
      object edtKmInicial: TEdit
        Left = 77
        Top = 20
        Width = 76
        Height = 21
        TabOrder = 0
        OnKeyPress = edtKmInicialKeyPress
      end
      object edtKmFinal: TEdit
        Left = 77
        Top = 53
        Width = 76
        Height = 21
        TabOrder = 1
        OnKeyPress = edtKmFinalKeyPress
      end
      object btnLimpar: TButton
        Left = 240
        Top = 51
        Width = 75
        Height = 25
        Caption = 'Limpar'
        TabOrder = 6
        OnClick = btnLimparClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 89
      Width = 693
      Height = 82
      Align = alClient
      Caption = 'Detalhes'
      TabOrder = 1
      object Label7: TLabel
        Left = 424
        Top = 24
        Width = 80
        Height = 13
        Caption = 'Custo da Viagem'
      end
      object Label10: TLabel
        Left = 285
        Top = 24
        Width = 51
        Height = 13
        Caption = 'Autonomia'
      end
      object Label9: TLabel
        Left = 146
        Top = 24
        Width = 23
        Height = 13
        Caption = 'Km/L'
      end
      object Label8: TLabel
        Left = 10
        Top = 24
        Width = 109
        Height = 13
        Caption = 'Quilometragem rodada'
      end
      object edtValorViagem: TEdit
        Left = 424
        Top = 43
        Width = 121
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtAutonomia: TEdit
        Left = 285
        Top = 43
        Width = 121
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtKmLitro: TEdit
        Left = 146
        Top = 43
        Width = 121
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtKmRodado: TEdit
        Left = 10
        Top = 43
        Width = 121
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
end
