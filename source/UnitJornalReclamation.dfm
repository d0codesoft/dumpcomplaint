object frmJournalReclamation: TfrmJournalReclamation
  Left = 0
  Top = 0
  Caption = 'frmJournalReclamation'
  ClientHeight = 378
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  DesignSize = (
    516
    378)
  PixelsPerInch = 120
  TextHeight = 16
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 516
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
      tbbtnPeriod
      RzSpacer2
      tbbtnNewDoc
      tbbtnEditDoc
      tbbtnDeleteDoc)
    object tbbtnClose: TRzToolButton
      Left = 4
      Top = 2
      Width = 77
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = tbbtnCloseClick
    end
    object RzSpacer1: TRzSpacer
      Left = 81
      Top = 2
    end
    object tbbtnPeriod: TRzToolButton
      Left = 89
      Top = 2
      Width = 28
      ImageIndex = 44
      ShowCaption = True
      UseToolbarShowCaption = False
      OnClick = tbbtnPeriodClick
    end
    object RzSpacer2: TRzSpacer
      Left = 117
      Top = 2
    end
    object tbbtnNewDoc: TRzToolButton
      Left = 125
      Top = 2
      Width = 66
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 5
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1053#1086#1074#1099#1081
      ParentShowHint = False
      ShowHint = True
      OnClick = tbbtnNewDocClick
    end
    object tbbtnEditDoc: TRzToolButton
      Left = 191
      Top = 2
      Width = 116
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 7
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = tbbtnEditDocClick
    end
    object tbbtnDeleteDoc: TRzToolButton
      Left = 307
      Top = 2
      Width = 76
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 6
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
    end
  end
  object browser: TcxGrid
    Left = 0
    Top = 33
    Width = 516
    Height = 344
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object browserDBView: TcxGridDBTableView
      OnDblClick = browserDBViewDblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SQLDataSource
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object browserDBViewID: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'ID'
        Width = 32
      end
      object browserDBViewSTATUS_RECL: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'STATUS_RECL'
        Width = 58
      end
      object browserDBViewNUMBER_RECLAMATION: TcxGridDBColumn
        Caption = #8470' '#1088#1077#1082#1083#1072#1084#1072#1094#1080#1080
        DataBinding.FieldName = 'NUMBER_CERTIFICATE_COMPIANSE'
        Width = 84
      end
      object browserDBViewTB_ADVENTUREDESCR: TcxGridDBColumn
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
        DataBinding.FieldName = 'TB_ADVENTURE.DESCR'
        Width = 193
      end
      object browserDBViewTB_MACHINEDESCR: TcxGridDBColumn
        Caption = #1040#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1077' '#1089#1088#1077#1076#1089#1090#1074#1086
        DataBinding.FieldName = 'TB_MACHINE.DESCR'
        Width = 162
      end
      object browserDBViewADVENTURE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'ADVENTURE_ID'
        Visible = False
        Width = 81
      end
      object browserDBViewMACHINE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'MACHINE_ID'
        Visible = False
      end
      object browserDBViewMACHINE_ELEMENT: TcxGridDBColumn
        Caption = #1059#1079#1077#1083' '#1074#1099#1096#1077#1076#1096#1099#1081' '#1080#1079' '#1089#1090#1088#1086#1103
        DataBinding.FieldName = 'TB_MACHINE_ELEMENTS.DESCR'
        Width = 177
      end
      object browserDBViewDATE_FILURE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1090#1082#1072#1079#1072
        DataBinding.FieldName = 'DATE_FILURE'
        Width = 104
      end
      object browserDBViewDATE_NOTIFI: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1080#1079#1074#1077#1097#1077#1085#1080#1103
        DataBinding.FieldName = 'DATE_NOTIFI'
        Width = 111
      end
      object browserDBViewFAILUR_ELEMENTS_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FAILUR_ELEMENTS_ID'
        Visible = False
        Width = 124
      end
      object browserDBViewNUMBER_CHASSIS: TcxGridDBColumn
        DataBinding.FieldName = 'NUMBER_CHASSIS'
        Visible = False
      end
    end
    object browserLevel: TcxGridLevel
      GridView = browserDBView
    end
  end
  object SQLQuery: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = '[:MinDate]'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '01/01/01 0:00:00'
      end>
    Prepared = True
    SQL.Strings = (
      'select * from SQL_RECLAMATION')
    Left = 104
    Top = 152
  end
  object SQLDataSource: TDataSource
    AutoEdit = False
    DataSet = SQLQuery
    Left = 144
    Top = 152
  end
end
