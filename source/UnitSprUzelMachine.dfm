object frameNodeMachine: TframeNodeMachine
  Left = 0
  Top = 0
  Caption = #1059#1079#1083#1099' '#1072#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
  ClientHeight = 478
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 622
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
      tbbtnSelect
      SpacerSelect
      tbbtnNew
      tbbtnEdit
      tbbtnDelete
      RzSpacer3
      tbbtnFilter)
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
    object tbbtnNew: TRzToolButton
      Left = 175
      Top = 2
      Width = 66
      ImageIndex = 5
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1053#1086#1074#1099#1081
      OnClick = tbbtnNewClick
    end
    object tbbtnEdit: TRzToolButton
      Left = 241
      Top = 2
      Width = 84
      ImageIndex = 7
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = tbbtnEditClick
    end
    object tbbtnDelete: TRzToolButton
      Left = 325
      Top = 2
      Width = 76
      ImageIndex = 6
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object SpacerSelect: TRzSpacer
      Left = 167
      Top = 2
    end
    object tbbtnSelect: TRzToolButton
      Left = 89
      Top = 2
      Width = 78
      ImageIndex = 21
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1042#1099#1073#1088#1072#1090#1100
    end
    object RzSpacer3: TRzSpacer
      Left = 401
      Top = 2
    end
    object tbbtnFilter: TRzToolButton
      Left = 409
      Top = 2
      Width = 28
      ImageIndex = 19
      ShowCaption = True
      UseToolbarShowCaption = False
    end
  end
  object browserTreeView: TdxDBTreeView
    Left = 0
    Top = 29
    Width = 161
    Height = 449
    ShowNodeHint = True
    DataSource = SQLDataSourceGroup
    DisplayField = 'DESCR'
    KeyField = 'ID'
    ListField = 'DESCR'
    ParentField = 'PARENT_ID'
    RootValue = Null
    SeparatedSt = ' - '
    RaiseOnError = True
    Indent = 19
    Align = alLeft
    ParentColor = False
    Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SelectedIndex = -1
    TabOrder = 1
    OnCreateNewKeyValue = browserTreeViewCreateNewKeyValue
    OnDblClick = browserTreeViewDblClick
    PopupMenu = PopupMenuGroup
    Images = frmMain.ImageSmall
  end
  object cxSplitter1: TcxSplitter
    Left = 161
    Top = 29
    Width = 4
    Height = 449
    Control = browserTreeView
  end
  object browser: TcxGrid
    Left = 165
    Top = 29
    Width = 457
    Height = 449
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 167
    ExplicitTop = 33
    object browserDBView: TcxGridDBTableView
      OnDblClick = browserDBViewDblClick
      OnKeyPress = browserDBViewKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SQLDataSourceItem
      DataController.Filter.AutoDataSetFilter = True
      DataController.Filter.TranslateBetween = True
      DataController.Filter.TranslateIn = True
      DataController.Filter.TranslateLike = True
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object browserDBViewID: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'ID'
        Width = 35
      end
      object browserDBViewCODE: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1087#1086' '#1082#1072#1090#1072#1083#1086#1075#1091
        DataBinding.FieldName = 'CODE'
        Width = 121
      end
      object browserDBViewDESCR: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1079#1083#1072
        DataBinding.FieldName = 'DESCR'
        Width = 296
      end
      object browserDBViewPARENT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENT_ID'
        Visible = False
      end
      object browserDBViewISGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'ISGROUP'
        Visible = False
      end
      object browserDBViewINFO: TcxGridDBColumn
        DataBinding.FieldName = 'INFO'
        Visible = False
      end
    end
    object browserLevel: TcxGridLevel
      GridView = browserDBView
    end
  end
  object SQLDataSourceGroup: TDataSource
    DataSet = SQLQueryGroup
    Left = 272
    Top = 16
  end
  object SQLDataSourceItem: TDataSource
    DataSet = SQLQueryItem
    Left = 304
    Top = 16
  end
  object SQLQueryItem: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    BeforePost = SQLQueryItemBeforePost
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT * FROM TB_QUERY_ELEMENT_ITEM')
    Left = 240
    Top = 16
  end
  object SQLQueryGroup: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT * FROM TB_QUERY_ELEMETN_GROUP')
    Left = 208
    Top = 16
  end
  object PopupMenuGroup: TPopupMenu
    Images = frmMain.ImageSmall
    Left = 104
    Top = 112
    object mnuTreeViewGroup_AddNew: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 5
      OnClick = mnuTreeViewGroup_AddNewClick
    end
    object mnuTreeViewGroup_Edit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 7
    end
    object mnuTreeViewGroup_Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 6
    end
  end
end
