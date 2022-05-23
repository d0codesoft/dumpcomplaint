object frameEditCodeFailure: TframeEditCodeFailure
  Left = 0
  Top = 0
  Caption = 'frameEditQuarry'
  ClientHeight = 337
  ClientWidth = 564
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
    Width = 564
    Height = 34
    Images = frmMain.ImageSmall
    RowHeight = 30
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      tbbtnSave
      RzSpacer1
      tbbtnClose
      RzSpacer2
      RzToolButton3)
    object tbbtnSave: TRzToolButton
      Left = 4
      Top = 5
      Width = 90
      ImageIndex = 23
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = tbbtnSaveClick
    end
    object RzSpacer1: TRzSpacer
      Left = 94
      Top = 2
      Width = 10
      Height = 30
    end
    object tbbtnClose: TRzToolButton
      Left = 104
      Top = 5
      Width = 77
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = tbbtnCloseClick
    end
    object RzSpacer2: TRzSpacer
      Left = 181
      Top = 5
    end
    object RzToolButton3: TRzToolButton
      Left = 189
      Top = 5
      Width = 83
      ImageIndex = 82
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 48
    Caption = #1050#1086#1076' '#1086#1090#1082#1072#1079#1072':'
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 78
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1082#1072#1079#1072':'
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 112
    Caption = #1044#1077#1090#1072#1083#1100#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1082#1072#1079#1072':'
  end
  object edtDB_1: TcxDBTextEdit
    Left = 168
    Top = 47
    DataBinding.DataField = 'CODE'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 4
    Width = 201
  end
  object edtDB_2: TcxDBTextEdit
    Left = 168
    Top = 77
    DataBinding.DataField = 'DESCR'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 5
    Width = 377
  end
  object edtDB_3: TcxDBRichEdit
    Left = 8
    Top = 136
    DataBinding.DataField = 'INFO'
    DataBinding.DataSource = SQLDataSource
    Properties.ScrollBars = ssBoth
    TabOrder = 6
    Height = 193
    Width = 545
  end
  object SQLDataSet: TADODataSet
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    CommandText = 'select * from TB_CODE_FAILURE WHERE ID=:IDITEM'
    Parameters = <
      item
        Name = 'IDITEM'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    Prepared = True
    Left = 112
  end
  object SQLDataSource: TDataSource
    DataSet = SQLDataSet
    Left = 144
  end
end
