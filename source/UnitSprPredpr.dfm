object frmSprPredpr: TfrmSprPredpr
  Left = 0
  Top = 0
  ClientHeight = 291
  ClientWidth = 475
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
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 475
    Height = 29
    Images = frmMain.ImageSmall
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      RzToolButton1
      RzSpacer1
      tbbtnItemNew
      tbbtnItemEdit
      tbbtnItemDelete
      RzSpacer2
      tbbtnItemFilter
      tbbtnItemSort)
    object tbbtnItemNew: TRzToolButton
      Left = 89
      Top = 2
      Width = 66
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      ImageIndex = 4
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1053#1086#1074#1099#1081
      ParentShowHint = False
      ShowHint = True
      OnClick = tbbtnItemNewClick
    end
    object tbbtnItemEdit: TRzToolButton
      Left = 155
      Top = 2
      Width = 116
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      ImageIndex = 7
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = tbbtnItemEditClick
    end
    object tbbtnItemDelete: TRzToolButton
      Left = 271
      Top = 2
      Width = 76
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1077#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      ImageIndex = 6
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
    end
    object RzSpacer1: TRzSpacer
      Left = 81
      Top = 2
    end
    object tbbtnItemSort: TRzToolButton
      Left = 383
      Top = 2
      Width = 28
      Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1082#1086#1083#1086#1085#1082#1077
      ImageIndex = 11
      ShowCaption = True
      UseToolbarShowCaption = False
      ParentShowHint = False
      ShowHint = True
    end
    object RzSpacer2: TRzSpacer
      Left = 347
      Top = 2
    end
    object tbbtnItemFilter: TRzToolButton
      Left = 355
      Top = 2
      Width = 28
      Hint = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 19
      ShowCaption = True
      UseToolbarShowCaption = False
      ParentShowHint = False
      ShowHint = True
    end
    object RzToolButton1: TRzToolButton
      Left = 4
      Top = 2
      Width = 77
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = RzToolButton1Click
    end
  end
  object browser: TcxGrid
    Left = 0
    Top = 29
    Width = 475
    Height = 262
    Align = alClient
    TabOrder = 1
    object browserDBSprView: TcxGridDBTableView
      OnDblClick = browserDBSprViewDblClick
      OnKeyPress = browserDBSprViewKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SQLDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object browserDBSprViewID: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'ID'
        OnCustomDrawCell = browserDBSprViewIDCustomDrawCell
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taRightJustify
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.Grouping = False
        Options.Sorting = False
        Styles.Content = cxStyle1
        Width = 36
      end
      object browserDBSprViewDESCR: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
        DataBinding.FieldName = 'DESCR'
        Width = 226
      end
      object browserDBSprViewDIRECTOR: TcxGridDBColumn
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088
        DataBinding.FieldName = 'DIRECTOR'
        Width = 135
      end
      object browserDBSprViewTEL: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'TEL'
        Width = 118
      end
      object browserDBSprViewADRESS: TcxGridDBColumn
        Caption = #1040#1076#1088#1077#1089
        DataBinding.FieldName = 'ADRESS'
        SortIndex = 0
        SortOrder = soDescending
        Width = 188
      end
    end
    object browserSpr: TcxGridLevel
      GridView = browserDBSprView
    end
  end
  object SQLQuerySpr: TADOQuery
    Connection = RCDataModule.DBConn
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_ADVENTURE')
    Left = 80
    Top = 152
  end
  object SQLDataSource: TDataSource
    DataSet = SQLQuerySpr
    Left = 120
    Top = 152
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
    end
  end
end
