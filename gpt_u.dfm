object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 522
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 60
    Top = 107
    Width = 38
    Height = 13
    Caption = 'Prompt:'
  end
  object btnRun: TBitBtn
    Left = 112
    Top = 184
    Width = 75
    Height = 25
    Caption = 'btnRun'
    TabOrder = 0
    OnClick = btnRunClick
  end
  object memJson: TMemo
    Left = 480
    Top = 72
    Width = 185
    Height = 161
    TabOrder = 2
  end
  object edtPrompt: TEdit
    Left = 112
    Top = 104
    Width = 297
    Height = 21
    TabOrder = 1
    Text = 'Give me three trivia questions regarding outer space'
  end
  object pnlLogin: TPanel
    Left = 704
    Top = 485
    Width = 780
    Height = 521
    TabOrder = 3
    object Label1: TLabel
      Left = 242
      Top = 160
      Width = 52
      Height = 13
      Caption = 'Username:'
    end
    object Label2: TLabel
      Left = 242
      Top = 211
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object btnLogin: TBitBtn
      Left = 304
      Top = 280
      Width = 89
      Height = 41
      Caption = 'Login'
      TabOrder = 0
      OnClick = btnLoginClick
    end
    object edtUsername: TEdit
      Left = 304
      Top = 157
      Width = 153
      Height = 21
      TabOrder = 1
      Text = 'Johna'
    end
    object edtPassword: TEdit
      Left = 304
      Top = 208
      Width = 153
      Height = 21
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Text = '1234'
    end
  end
end
