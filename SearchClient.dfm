object SearchForm: TSearchForm
  Left = 0
  Top = 0
  Caption = 'Search'
  ClientHeight = 168
  ClientWidth = 255
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 47
    Height = 19
    Caption = 'Search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 105
    Width = 227
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 160
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 1
    OnClick = Button1Click
  end
  object TypeChoose: TRadioGroup
    Left = 8
    Top = 33
    Width = 227
    Height = 66
    Caption = 'TypeChoose'
    Items.Strings = (
      'Surname'
      'Phone Number')
    TabOrder = 2
  end
end
