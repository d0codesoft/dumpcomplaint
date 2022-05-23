object frameEditQuarry: TframeEditQuarry
  Left = 0
  Top = 0
  Caption = 'frameEditQuarry'
  ClientHeight = 409
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
      ImageIndex = 23
      OnClick = tbbtnSaveClick
    end
    object RzSpacer1: TRzSpacer
      Left = 29
      Top = 2
      Width = 10
      Height = 30
    end
    object tbbtnClose: TRzToolButton
      Left = 39
      Top = 5
      ImageIndex = 24
      OnClick = tbbtnCloseClick
    end
    object RzSpacer2: TRzSpacer
      Left = 64
      Top = 5
    end
    object RzToolButton3: TRzToolButton
      Left = 72
      Top = 5
      ImageIndex = 82
    end
  end
  object cxLabel1: TcxLabel
    Left = 6
    Top = 42
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1072#1088#1100#1077#1088#1072':'
  end
  object cxLabel6: TcxLabel
    Left = 7
    Top = 77
    Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' '#1074#1083#1072#1076#1077#1083#1077#1094':'
  end
  object edtDB_0: TcxDBTextEdit
    Left = 188
    Top = 42
    DataBinding.DataField = 'DESCR'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 3
    Width = 367
  end
  object cxGroupBox1: TcxGroupBox
    Left = 12
    Top = 235
    Caption = #1052#1077#1089#1090#1086' '#1085#1072#1093#1086#1078#1076#1077#1085#1080#1077' '#1082#1072#1088#1100#1077#1088#1072
    TabOrder = 4
    Height = 105
    Width = 543
    object cxLabel3: TcxLabel
      Left = 15
      Top = 59
      Caption = #1054#1073#1083#1072#1089#1090#1100':'
    end
    object cxLabel2: TcxLabel
      Left = 15
      Top = 25
      Caption = #1057#1090#1088#1072#1085#1072':'
    end
    object edtDB_4: TcxDBTextEdit
      Left = 83
      Top = 24
      DataBinding.DataField = 'COUNTRY'
      DataBinding.DataSource = SQLDataSource
      TabOrder = 2
      Width = 441
    end
    object edtDB_5: TcxDBTextEdit
      Left = 83
      Top = 59
      DataBinding.DataField = 'REGION'
      DataBinding.DataSource = SQLDataSource
      TabOrder = 3
      Width = 441
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 12
    Top = 113
    Caption = #1058#1077#1093#1085#1080#1095#1077#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077':'
    TabOrder = 5
    Height = 115
    Width = 543
    object edtDB_3: TcxDBDateEdit
      Left = 262
      Top = 68
      DataBinding.DataField = 'DATE_COMMENCEMENT_WORKS'
      DataBinding.DataSource = SQLDataSource
      TabOrder = 0
      Width = 144
    end
    object cxLabel4: TcxLabel
      Left = 10
      Top = 72
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1080' '#1082#1072#1088#1100#1077#1088#1072':'
    end
    object cxLabel5: TcxLabel
      Left = 15
      Top = 25
      Caption = #1043#1083#1091#1073#1080#1085#1072' '#1082#1072#1088#1100#1077#1088#1072':'
    end
    object edtDB_2: TcxDBCurrencyEdit
      Left = 152
      Top = 25
      DataBinding.DataField = 'DEPTH_QUARRY'
      DataBinding.DataSource = SQLDataSource
      TabOrder = 3
      Width = 110
    end
  end
  object edtDB_1: TcxButtonEdit
    Tag = 1
    Left = 190
    Top = 76
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.ViewStyle = vsHideCursor
    Properties.OnButtonClick = edtDB_1PropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 6
    Width = 365
  end
  object SQLDataSet: TADODataSet
    Connection = RCDataModule.DBConn
    CommandText = 'select * from TB_QUARRY WHERE ID=:EDTID'
    Parameters = <
      item
        Name = 'EDTID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    Left = 48
    Top = 40
  end
  object SQLDataSource: TDataSource
    DataSet = SQLDataSet
    Left = 80
    Top = 40
  end
end
