object FrmeSprBelaz: TFrmeSprBelaz
  Left = 0
  Top = 0
  ClientHeight = 399
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object browser: TcxGrid
    Left = 0
    Top = 29
    Width = 535
    Height = 370
    Align = alClient
    TabOrder = 0
    object browserDBView: TcxGridDBTableView
      OnDblClick = browserDBViewDblClick
      OnKeyPress = browserDBViewKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = browserDataSource
      DataController.KeyFieldNames = 'MACHINE_ID'
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
      object browserDBViewMACHINE_ID: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'MACHINE_ID'
        OnCustomDrawCell = browserDBViewMACHINE_IDCustomDrawCell
        Options.Editing = False
        Options.Focusing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 28
      end
      object browserDBViewMACHINE_NUMBER_GARAGE: TcxGridDBColumn
        Caption = #8470' '#1075#1072#1088#1072#1078#1085#1099#1081
        DataBinding.FieldName = 'MACHINE_NUMBER_GARAGE'
        Width = 62
      end
      object browserDBViewMACHINE_NUMBER_CHASSIS: TcxGridDBColumn
        Caption = #8470' '#1096#1072#1089#1089#1080
        DataBinding.FieldName = 'MACHINE_NUMBER_CHASSIS'
        Width = 64
      end
      object browserDBViewMACHINE_DESCR: TcxGridDBColumn
        Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1077' '#1089#1088#1077#1076#1089#1090#1074#1086
        DataBinding.FieldName = 'MACHINE_MODEL_DESCR'
        Width = 189
      end
      object browserDBViewMACHINE_ADVENTURE_DESCR: TcxGridDBColumn
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
        DataBinding.FieldName = 'MACHINE_ADVENTURE_DESCR'
        Width = 201
      end
      object browserDBViewMACHINE_QUARRY_DESCR: TcxGridDBColumn
        Caption = #1050#1072#1088#1100#1077#1088
        DataBinding.FieldName = 'MACHINE_QUARRY_DESCR'
        Width = 182
      end
      object browserDBViewMACHINE_DATE_IN_EXPOITATION: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1101#1082#1089#1087#1083'.'
        DataBinding.FieldName = 'MACHINE_DATE_IN_EXPOITATION'
        Width = 121
      end
      object browserDBViewMACHINE_TYPE_PROCESS: TcxGridDBColumn
        DataBinding.FieldName = 'MACHINE_TYPE_PROCESS'
        Visible = False
        IsCaptionAssigned = True
      end
      object browserDBViewMACHINE_NUMBER_ENGINE: TcxGridDBColumn
        Caption = #8470' '#1076#1074#1080#1075#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'MACHINE_NUMBER_ENGINE'
        Width = 111
      end
      object browserDBViewMACHINE_DATE_PRODUCTION_ENGINE: TcxGridDBColumn
        DataBinding.FieldName = 'MACHINE_DATE_PRODUCTION_ENGINE'
        Visible = False
      end
      object browserDBViewMACHINE_TYPE_GUARANTEE: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
        DataBinding.FieldName = 'MACHINE_TYPE_GUARANTEE'
        Visible = False
        Width = 94
      end
      object browserDBViewMACHINE_GUARANTEE: TcxGridDBColumn
        DataBinding.FieldName = 'MACHINE_GUARANTEE'
        Visible = False
      end
      object browserDBViewMACHINE_NUMBER_CAB_CAR_FRAME: TcxGridDBColumn
        Caption = #8470' '#1082#1091#1079#1086#1074#1072
        DataBinding.FieldName = 'MACHINE_NUMBER_CAB_CAR_FRAME'
      end
      object browserDBViewMACHINE_NUMBER_CAB: TcxGridDBColumn
        Caption = #8470' '#1082#1072#1073#1080#1085#1099
        DataBinding.FieldName = 'MACHINE_NUMBER_CAB'
      end
      object browserDBViewMODEL_ID: TcxGridDBColumn
        DataBinding.FieldName = 'MODEL_ID'
        Visible = False
      end
      object browserDBViewTYPE_ENGINE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'TYPE_ENGINE_ID'
        Visible = False
      end
      object browserDBViewMACHINE_MACHINE_RUN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1101#1082#1087#1083'.'
        DataBinding.FieldName = 'MACHINE_MACHINE_RUN'
      end
      object browserDBViewTB_MODEL_MACHINEID: TcxGridDBColumn
        Caption = #1052#1086#1076#1077#1083#1100' '#1084#1072#1096#1080#1085#1099
        DataBinding.FieldName = 'TB_MODEL_MACHINE.ID'
        Visible = False
      end
      object browserDBViewMACHINE_MODEL_DESCR: TcxGridDBColumn
        Caption = #1052#1086#1076#1077#1083#1100' '#1084#1072#1096#1080#1085#1099
        DataBinding.FieldName = 'MACHINE_MODEL_DESCR'
        Width = 176
      end
      object browserDBViewMACHINE_MODEL_TONNAGE: TcxGridDBColumn
        Caption = #1058#1085'.'
        DataBinding.FieldName = 'MACHINE_MODEL_TONNAGE'
        Width = 48
      end
      object browserDBViewTYPE_MACHINE: TcxGridDBColumn
        DataBinding.FieldName = 'TYPE_MACHINE'
        Visible = False
        Width = 92
      end
      object browserDBViewTB_TYPE_ENGINEID: TcxGridDBColumn
        DataBinding.FieldName = 'TB_TYPE_ENGINE.ID'
        Visible = False
      end
      object browserDBViewMACHINE_ENGINE_DESCR: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1074#1080#1075#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'MACHINE_ENGINE_DESCR'
        Width = 181
      end
      object browserDBViewMACHINE_TYPE_DESCR: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1075#1086' '#1089#1088#1077#1076#1089#1090#1074#1072
        DataBinding.FieldName = 'MACHINE_TYPE_DESCR'
        Width = 173
      end
      object browserDBViewID_ADVENTURE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADVENTURE'
        Visible = False
      end
      object browserDBViewID_QUARRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_QUARRY'
        Visible = False
      end
      object browserDBViewTB_MACHINE_TYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'TB_MACHINE_TYPE.ID'
        Visible = False
      end
    end
    object browserLevel: TcxGridLevel
      GridView = browserDBView
    end
  end
  object ToolbarSpr: TRzToolbar
    Left = 0
    Top = 0
    Width = 535
    Height = 29
    Images = frmMain.ImageSmall
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 1
    ToolbarControls = (
      tbbtnClose
      RzSpacer1
      tbtnNewItem
      tbtnEditItem
      tbtnDelItem
      RzSpacer2
      tbtbFilterItem
      RzToolButton1)
    object tbtnNewItem: TRzToolButton
      Left = 89
      Top = 2
      Width = 66
      Hint = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 4
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1053#1086#1074#1099#1081
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnNewItemClick
    end
    object tbtnEditItem: TRzToolButton
      Left = 155
      Top = 2
      Width = 116
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1101#1083#1077#1084#1077#1085#1090' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 7
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
    end
    object tbtnDelItem: TRzToolButton
      Left = 271
      Top = 2
      Width = 76
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 6
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
    end
    object tbtbFilterItem: TRzToolButton
      Left = 355
      Top = 2
      Width = 28
      Hint = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1103#1084
      ImageIndex = 19
      ShowCaption = True
      UseToolbarShowCaption = False
      ParentShowHint = False
      ShowHint = True
    end
    object RzSpacer1: TRzSpacer
      Left = 81
      Top = 2
    end
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
    object RzSpacer2: TRzSpacer
      Left = 347
      Top = 2
    end
    object RzToolButton1: TRzToolButton
      Left = 383
      Top = 2
      Width = 85
      ImageIndex = 13
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = RzToolButton1Click
    end
  end
  object browserDataSource: TDataSource
    AutoEdit = False
    DataSet = browserADOQuery
    Left = 152
    Top = 72
  end
  object browserADOQuery: TADOQuery
    Connection = RCDataModule.DBConn
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT * FROM SQL_MACHINE')
    Left = 80
    Top = 72
  end
end
