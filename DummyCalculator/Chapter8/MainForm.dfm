object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'fmMain'
  ClientHeight = 151
  ClientWidth = 200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 150
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object Edit2: TEdit
    Left = 24
    Top = 43
    Width = 150
    Height = 21
    TabOrder = 1
    Text = '2'
  end
  object Edit3: TEdit
    Left = 24
    Top = 101
    Width = 150
    Height = 21
    TabOrder = 2
    Text = '<result>'
  end
  object Button1: TButton
    Left = 24
    Top = 70
    Width = 33
    Height = 25
    Caption = '+'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 63
    Top = 70
    Width = 33
    Height = 25
    Caption = '-'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 102
    Top = 70
    Width = 33
    Height = 25
    Caption = '*'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 141
    Top = 70
    Width = 33
    Height = 25
    Caption = '/'
    TabOrder = 6
    OnClick = Button4Click
  end
end
