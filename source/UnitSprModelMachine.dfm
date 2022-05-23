object frmSprModel_Machine: TfrmSprModel_Machine
  Left = 0
  Top = 0
  ClientHeight = 436
  ClientWidth = 545
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
  object Splitter1: TSplitter
    Left = 0
    Top = 334
    Width = 545
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 362
    ExplicitWidth = 553
  end
  object browser: TcxGrid
    Left = 0
    Top = 29
    Width = 545
    Height = 305
    Align = alClient
    TabOrder = 0
    object browserView: TcxGridDBTableView
      OnDblClick = browserViewDblClick
      OnKeyPress = browserViewKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SqlDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object browserViewID: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'ID'
        OnCustomDrawCell = browserViewIDCustomDrawCell
        MinWidth = 40
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 40
      end
      object browserViewDESCR: TcxGridDBColumn
        Caption = #1052#1086#1076#1077#1083#1100' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1075#1086' '#1089#1088#1077#1076#1089#1090#1074#1072
        DataBinding.FieldName = 'DESCR'
        Width = 259
      end
      object browserViewTONNAGE: TcxGridDBColumn
        Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1100#1077#1084#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'TONNAGE'
      end
      object browserViewMACHINE_TYPE_DESCR: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1075#1086' '#1089#1088#1077#1076#1090#1074#1072
        DataBinding.FieldName = 'MACHINE_TYPE_DESCR'
        Width = 167
      end
      object browserViewFOTO_MACHINE: TcxGridDBColumn
        Caption = #1060#1086#1090#1086
        DataBinding.FieldName = 'FOTO_MACHINE'
        Visible = False
      end
    end
    object browserLevel: TcxGridLevel
      GridView = browserView
    end
  end
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 545
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
      tbbtnItemNew
      tbbtnItemEdit
      tbbtnItemDelete
      RzSpacer2
      RzToolButton1
      RzToolButton2)
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
    object tbbtnItemNew: TRzToolButton
      Left = 89
      Top = 2
      Width = 66
      ImageIndex = 4
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1053#1086#1074#1099#1081
    end
    object tbbtnItemEdit: TRzToolButton
      Left = 155
      Top = 2
      Width = 116
      ImageIndex = 7
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    end
    object tbbtnItemDelete: TRzToolButton
      Left = 271
      Top = 2
      Width = 76
      ImageIndex = 6
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object RzSpacer2: TRzSpacer
      Left = 347
      Top = 2
    end
    object RzToolButton1: TRzToolButton
      Left = 355
      Top = 2
      Width = 28
      ImageIndex = 11
      ShowCaption = True
      UseToolbarShowCaption = False
    end
    object RzToolButton2: TRzToolButton
      Left = 383
      Top = 2
      Width = 28
      ImageIndex = 19
      ShowCaption = True
      UseToolbarShowCaption = False
    end
  end
  object RzDBRichEdit1: TRzDBRichEdit
    Left = 0
    Top = 339
    Width = 545
    Height = 97
    Align = alBottom
    Color = clInfoBk
    DataField = 'INFO'
    DataSource = SqlDataSource
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
    FrameVisible = True
    ReadOnlyColorOnFocus = True
  end
  object browserADOQuery: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SQL_MODEL_MACHINE')
    Left = 96
    Top = 128
  end
  object SqlDataSource: TDataSource
    DataSet = browserADOQuery
    Left = 136
    Top = 128
  end
end
