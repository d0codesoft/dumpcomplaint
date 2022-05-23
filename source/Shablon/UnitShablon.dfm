object frmShablon: TfrmShablon
  Left = 0
  Top = 0
  ClientHeight = 362
  ClientWidth = 538
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
  object FrameToolbar: TRzToolbar
    Left = 0
    Top = 0
    Width = 538
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
      tbbtnItemNew
      tbbtnItemEdit
      tbbtnItemDelete
      RzSpacer2
      RzToolButton2
      RzToolButton1)
    object tbbtnClose: TRzToolButton
      Left = 4
      Top = 2
      Width = 83
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1095#1080#1085#1080#1090#1080
      OnClick = tbbtnCloseClick
    end
    object RzSpacer1: TRzSpacer
      Left = 87
      Top = 2
    end
    object tbbtnItemNew: TRzToolButton
      Left = 95
      Top = 2
      Width = 66
      ImageIndex = 4
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1053#1086#1074#1099#1081
      OnClick = tbbtnItemNewClick
    end
    object tbbtnItemEdit: TRzToolButton
      Left = 161
      Top = 2
      Width = 116
      ImageIndex = 7
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    end
    object tbbtnItemDelete: TRzToolButton
      Left = 277
      Top = 2
      Width = 76
      ImageIndex = 6
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object RzSpacer2: TRzSpacer
      Left = 353
      Top = 2
    end
    object RzToolButton1: TRzToolButton
      Left = 389
      Top = 2
      Width = 28
      ImageIndex = 11
      ShowCaption = True
      UseToolbarShowCaption = False
    end
    object RzToolButton2: TRzToolButton
      Left = 361
      Top = 2
      Width = 28
      ImageIndex = 19
      ShowCaption = True
      UseToolbarShowCaption = False
    end
  end
  object browser: TcxGrid
    Left = 0
    Top = 29
    Width = 538
    Height = 333
    Align = alClient
    TabOrder = 1
    object browserView: TcxGridDBTableView
      OnDblClick = browserViewDblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SqlDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
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
        MinWidth = 30
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 30
      end
      object browserViewDESCR: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1072#1088#1100#1077#1088#1072
        DataBinding.FieldName = 'DESCR'
        Width = 152
      end
      object browserViewADVENTURE_DESCR: TcxGridDBColumn
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
        DataBinding.FieldName = 'ADVENTURE_DESCR'
        Width = 128
      end
      object browserViewDATE_COMMENCEMENT_WORKS: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1080
        DataBinding.FieldName = 'DATE_COMMENCEMENT_WORKS'
        Width = 86
      end
      object browserViewDEPTH_QUARRY: TcxGridDBColumn
        Caption = #1043#1083#1091#1073#1080#1085#1072' '#1082#1072#1088#1100#1077#1088#1072
        DataBinding.FieldName = 'DEPTH_QUARRY'
        Width = 105
      end
      object browserViewCOUNTRY: TcxGridDBColumn
        Caption = #1057#1090#1088#1072#1085#1072
        DataBinding.FieldName = 'COUNTRY'
        Width = 121
      end
      object browserViewREGION: TcxGridDBColumn
        Caption = #1054#1073#1083#1072#1089#1090#1100
        DataBinding.FieldName = 'REGION'
        Width = 125
      end
      object browserViewID_ADVENTURE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADVENTURE'
        Visible = False
      end
    end
    object browserLevel: TcxGridLevel
      GridView = browserView
    end
  end
  object SqlDataSource: TDataSource
    DataSet = browserADOQuery
    Left = 136
    Top = 128
  end
  object browserADOQuery: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SQL_QUARRY')
    Left = 96
    Top = 128
  end
end
