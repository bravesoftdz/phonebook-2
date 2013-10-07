object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Clients DB'
  ClientHeight = 330
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object AddNewButton: TButton
    Left = 8
    Top = 16
    Width = 97
    Height = 25
    Caption = '&Add new item'
    TabOrder = 0
    OnClick = AddNewButtonClick
  end
  object EditButton: TButton
    Left = 8
    Top = 47
    Width = 97
    Height = 25
    Caption = '&Edit'
    TabOrder = 1
    OnClick = EditButtonClick
  end
  object DeleteButton: TButton
    Left = 8
    Top = 78
    Width = 97
    Height = 25
    Caption = '&Delete'
    TabOrder = 2
    OnClick = DeleteButtonClick
  end
  object ShowAllButton: TButton
    Left = 8
    Top = 185
    Width = 97
    Height = 25
    Caption = 'S&how all'
    TabOrder = 3
    OnClick = ShowAllButtonClick
  end
  object StringGrid1: TStringGrid
    Left = 120
    Top = 16
    Width = 625
    Height = 305
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    ColCount = 7
    DefaultColWidth = 80
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 51
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 4
  end
  object LoadButton: TButton
    Left = 8
    Top = 234
    Width = 97
    Height = 25
    Caption = '&Load'
    TabOrder = 5
    OnClick = LoadButtonClick
  end
  object SaveButton: TButton
    Left = 8
    Top = 265
    Width = 97
    Height = 25
    Caption = '&Save'
    TabOrder = 6
    OnClick = SaveButtonClick
  end
  object ClearButton: TButton
    Left = 8
    Top = 296
    Width = 97
    Height = 25
    Caption = '&Clear'
    TabOrder = 7
    OnClick = ClearButtonClick
  end
  object SortButton: TProcessButton
    Left = 8
    Top = 156
    Width = 97
    Height = 25
    Caption = 'Sort'
    TabOrder = 8
    OnClick = SortButtonClick
  end
  object SearchButton: TProcessButton
    Left = 8
    Top = 125
    Width = 97
    Height = 25
    Caption = 'Search'
    TabOrder = 9
    OnClick = SearchButtonClick
  end
end
