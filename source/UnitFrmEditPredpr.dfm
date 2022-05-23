object frmEditPredrp: TfrmEditPredrp
  Left = 0
  Top = 0
  Caption = 'frmEditPredrp'
  ClientHeight = 404
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 17
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 625
    Height = 29
    Images = frmMain.ImageSmall
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
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
      Width = 82
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = tbbtnCloseClick
    end
    object RzSpacer1: TRzSpacer
      Left = 86
      Top = 2
    end
    object tbbtnSave: TRzToolButton
      Left = 94
      Top = 2
      Width = 99
      ImageIndex = 25
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    end
    object tbbtnPrint: TRzToolButton
      Left = 193
      Top = 2
      Width = 28
      ImageIndex = 82
      ShowCaption = True
      UseToolbarShowCaption = False
    end
  end
  object edtDB_1: TcxDBTextEdit
    Left = 199
    Top = 49
    DataBinding.DataField = 'DESCR'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 1
    Width = 329
  end
  object edtDB_2: TcxDBTextEdit
    Left = 199
    Top = 81
    DataBinding.DataField = 'ADRESS'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 2
    Width = 329
  end
  object edtDB_3: TcxDBTextEdit
    Left = 199
    Top = 112
    DataBinding.DataField = 'TEL'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 3
    Width = 329
  end
  object edtDB_4: TcxDBTextEdit
    Left = 199
    Top = 143
    DataBinding.DataField = 'DIRECTOR'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 4
    Width = 329
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 50
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103':'
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 82
    Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089':'
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 113
    Caption = #1058#1077#1083#1077#1092#1086#1085#1099':'
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 144
    Caption = #1060'.'#1048'.'#1054'. '#1076#1080#1088#1077#1082#1090#1086#1088#1072':'
  end
  object SQLDataSource: TDataSource
    DataSet = SQLDataSet
    Left = 336
    Top = 136
  end
  object SQLDataSet: TADODataSet
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    CommandText = 'select ADRESS, DESCR, DIRECTOR, ID, TEL from TB_ADVENTURE'
    Parameters = <>
    Prepared = True
    Left = 296
    Top = 136
  end
end
