object frameEditElementGroup: TframeEditElementGroup
  Left = 0
  Top = 0
  Caption = 'frameEditElementGroup'
  ClientHeight = 275
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 435
    Height = 29
    AutoStyle = False
    Images = frmMain.ImageSmall
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = []
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      tbbtnClose
      RzSpacer1
      tbbtnSave
      tbbtnPrint)
    object tbbtnClose: TRzToolButton
      Left = 4
      Top = 2
      Width = 64
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1042#1099#1093#1086#1076
      OnClick = tbbtnCloseClick
    end
    object RzSpacer1: TRzSpacer
      Left = 68
      Top = 2
    end
    object tbbtnSave: TRzToolButton
      Left = 76
      Top = 2
      Width = 90
      ImageIndex = 23
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = tbbtnSaveClick
    end
    object tbbtnPrint: TRzToolButton
      Left = 166
      Top = 2
      Width = 83
      ImageIndex = 82
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 35
    Caption = #1056#1086#1076#1080#1090#1077#1083#1100' '#1101#1083#1077#1084#1077#1085#1090#1072':'
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 64
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 94
    Caption = #1044#1077#1090#1072#1083#1100#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077':'
  end
  object edtDB_1: TcxDBTextEdit
    Left = 104
    Top = 64
    DataBinding.DataField = 'DESCR'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 4
    Width = 321
  end
  object edtDB_3: TcxTextEdit
    Left = 136
    Top = 33
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 289
  end
  object edtDB_2: TcxDBRichEdit
    Left = 8
    Top = 120
    DataBinding.DataField = 'INFO'
    DataBinding.DataSource = SQLDataSource
    Properties.ScrollBars = ssBoth
    TabOrder = 6
    Height = 145
    Width = 417
  end
  object SQLDataSet: TADODataSet
    Connection = RCDataModule.DBConn
    Parameters = <>
    Left = 296
    Top = 32
  end
  object SQLDataSource: TDataSource
    DataSet = SQLDataSet
    Left = 328
    Top = 32
  end
end
