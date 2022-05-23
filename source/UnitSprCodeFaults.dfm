object frmCodeFault: TfrmCodeFault
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
    Height = 241
    Align = alClient
    TabOrder = 1
    object browserView: TcxGridDBTableView
      OnDblClick = browserViewDblClick
      OnKeyPress = browserViewKeyPress
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
        Width = 39
      end
      object browserViewCODE: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1086#1090#1082#1072#1079#1072
        DataBinding.FieldName = 'CODE'
        Width = 170
      end
      object browserViewDESCR: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1082#1072#1079#1072
        DataBinding.FieldName = 'DESCR'
        Width = 327
      end
    end
    object browserLevel: TcxGridLevel
      GridView = browserView
    end
  end
  object cxDBRichEdit1: TcxDBRichEdit
    Left = 0
    Top = 272
    Align = alBottom
    DataBinding.DataField = 'INFO'
    DataBinding.DataSource = SqlDataSource
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    TabOrder = 2
    Height = 90
    Width = 538
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 270
    Width = 538
    Height = 2
    AlignSplitter = salBottom
    Control = cxDBRichEdit1
  end
  object SqlDataSource: TDataSource
    DataSet = browserADOQuery
    Left = 136
    Top = 128
  end
  object browserADOQuery: TADOQuery
    Active = True
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_CODE_FAILURE')
    Left = 96
    Top = 128
  end
end
