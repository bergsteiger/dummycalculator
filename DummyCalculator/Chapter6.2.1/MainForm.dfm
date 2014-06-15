object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'fmMain'
  ClientHeight = 149
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    236
    149)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 189
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = '1'
    ExplicitWidth = 185
  end
  object Edit2: TEdit
    Left = 24
    Top = 43
    Width = 189
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Text = '2'
    ExplicitWidth = 185
  end
  object Edit3: TEdit
    Left = 24
    Top = 101
    Width = 189
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Text = '<result>'
    ExplicitWidth = 185
  end
  object Button1: TButton
    Left = 24
    Top = 70
    Width = 35
    Height = 25
    Caption = '+'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 63
    Top = 70
    Width = 35
    Height = 25
    Caption = '-'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 102
    Top = 70
    Width = 35
    Height = 25
    Caption = '*'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 141
    Top = 70
    Width = 35
    Height = 25
    Caption = '/'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 180
    Top = 70
    Width = 35
    Height = 25
    Caption = 'DivInt'
    TabOrder = 7
    OnClick = Button5Click
  end
end
