object EditForm: TEditForm
  Left = 0
  Top = 0
  Caption = 'Edit'
  ClientHeight = 320
  ClientWidth = 143
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 113
    Height = 29
    Caption = 'Edit Client:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 247
    Width = 121
    Height = 46
    Caption = 'Save'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 62
    Top = 216
    Width = 67
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = Button2Click
  end
  object SurnameEdit: TLabeledEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'SurnameEdit'
    TabOrder = 2
  end
  object NameEdit: TLabeledEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'NameEdit'
    TabOrder = 3
  end
  object AddressEdit: TLabeledEdit
    Left = 8
    Top = 144
    Width = 121
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'AddressEdit'
    TabOrder = 4
  end
  object NumberEdit: TLabeledEdit
    Left = 8
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'NumberEdit'
    TabOrder = 5
  end
end
