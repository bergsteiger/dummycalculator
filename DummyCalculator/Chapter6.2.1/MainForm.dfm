object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'fmMain'
  ClientHeight = 151
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtFirstArg: TEdit
    Left = 24
    Top = 16
    Width = 200
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object edtSecondArg: TEdit
    Left = 24
    Top = 43
    Width = 200
    Height = 21
    TabOrder = 1
    Text = '2'
  end
  object edtResult: TEdit
    Left = 24
    Top = 101
    Width = 200
    Height = 21
    TabOrder = 2
    Text = '<result>'
  end
  object btnAdd: TButton
    Left = 24
    Top = 70
    Width = 33
    Height = 25
    Caption = '+'
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnMinus: TButton
    Left = 63
    Top = 70
    Width = 33
    Height = 25
    Caption = '-'
    TabOrder = 4
    OnClick = btnMinusClick
  end
  object btnMul: TButton
    Left = 102
    Top = 70
    Width = 33
    Height = 25
    Caption = '*'
    TabOrder = 5
    OnClick = btnMulClick
  end
  object btnDiv: TButton
    Left = 141
    Top = 70
    Width = 33
    Height = 25
    Caption = '/'
    TabOrder = 6
    OnClick = btnDivClick
  end
  object btnDivInt: TButton
    Left = 180
    Top = 70
    Width = 44
    Height = 25
    Caption = 'DivInt'
    TabOrder = 7
    OnClick = btnDivIntClick
  end
end
