object frmConfigUser: TfrmConfigUser
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
      object browserViewID_USER: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'ID_USER'
        OnCustomDrawCell = browserViewIDCustomDrawCell
        MinWidth = 31
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 31
      end
      object browserViewUSER_NAME: TcxGridDBColumn
        Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'USER_NAME'
        Width = 188
      end
      object browserViewUSER_DESCR: TcxGridDBColumn
        Caption = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'USER_DESCR'
        Width = 210
      end
      object browserViewADMIN_FUNCTION: TcxGridDBColumn
        Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
        DataBinding.FieldName = 'ADMIN_FUNCTION'
        Width = 107
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
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_SYS_USER')
    Left = 96
    Top = 128
  end
end
