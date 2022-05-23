object frameDocRecl: TframeDocRecl
  Left = 0
  Top = 0
  Caption = #1060#1086#1088#1084#1091#1083#1103#1088' '#1088#1077#1082#1083#1072#1084#1072#1094#1080#1086#1085#1085#1086#1075#1086' '#1076#1077#1083#1072
  ClientHeight = 459
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TcxLabel
    Left = 8
    Top = 35
    Caption = #1060#1086#1088#1084#1091#1083#1103#1088' '#1088#1077#1082#1083#1072#1084#1072#1094#1080#1086#1085#1085#1086#1075#1086' '#1076#1077#1083#1072' '#8470':'
  end
  object Label2: TcxLabel
    Left = 8
    Top = 62
    Caption = #1040#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1077' '#1089#1088#1077#1076#1089#1090#1074#1086':'
  end
  object edtDB_1: TcxDBTextEdit
    Left = 240
    Top = 34
    DataBinding.DataField = 'NUMBER_CERTIFICATE_COMPIANSE'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 2
    Width = 121
  end
  object Label4: TcxLabel
    Left = 8
    Top = 88
    Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' '#1074#1083#1072#1076#1077#1083#1077#1094':'
  end
  object ItemPageControl: TcxPageControl
    Left = 0
    Top = 113
    Width = 593
    Height = 346
    ActivePage = TabSheet_3
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    ClientRectBottom = 346
    ClientRectRight = 593
    ClientRectTop = 27
    object TabSheet_1: TcxTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1086#1090#1082#1072#1079#1077
      ImageIndex = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        593
        319)
      object cxLabel5: TcxLabel
        Left = 8
        Top = 16
        Caption = #1044#1072#1090#1072' '#1086#1090#1082#1072#1079#1072':'
      end
      object cxLabel6: TcxLabel
        Left = 8
        Top = 45
        Caption = #1044#1072#1090#1072' '#1087#1080#1089#1100#1084#1077#1085#1085#1086#1075#1086' '#1080#1079#1074#1077#1097#1077#1085#1080#1103':'
      end
      object cxGroupBox1: TcxGroupBox
        Left = 3
        Top = 71
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1092#1077#1082#1090#1072
        TabOrder = 2
        DesignSize = (
          587
          245)
        Height = 245
        Width = 587
        object edtDB_10: TcxDBRichEdit
          Left = 3
          Top = 136
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataBinding.DataField = 'FAILURE_DESCRIPTION'
          DataBinding.DataSource = SQLDataSource
          Properties.ScrollBars = ssBoth
          TabOrder = 0
          Height = 106
          Width = 581
        end
        object cxLabel7: TcxLabel
          Left = 8
          Top = 113
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1092#1077#1082#1090#1072':'
        end
        object cxLabel8: TcxLabel
          Left = 8
          Top = 24
          Caption = #1044#1077#1092#1077#1082#1090#1085#1099#1081' '#1091#1079#1077#1083':'
        end
        object edtDB_7: TcxButtonEdit
          Tag = 5
          Left = 121
          Top = 23
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = edtDB_7PropertiesButtonClick
          TabOrder = 3
          Width = 256
        end
        object cxLabel9: TcxLabel
          Left = 8
          Top = 54
          Caption = #1057#1077#1088#1080#1081#1085#1099#1077' '#1085#1086#1084#1077#1088' '#1091#1079#1083#1072':'
        end
        object edtDB_8: TcxDBTextEdit
          Left = 144
          Top = 53
          DataBinding.DataField = 'SERIAL_NUMBER_ELEMETS'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 5
          Width = 233
        end
        object cxLabel10: TcxLabel
          Left = 8
          Top = 84
          Caption = #1050#1086#1076' '#1086#1090#1082#1072#1079#1072':'
        end
        object edtDB_9: TcxButtonEdit
          Tag = 6
          Left = 87
          Top = 83
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = edtDB_9PropertiesButtonClick
          TabOrder = 7
          Width = 497
        end
      end
      object edtDB_3: TcxDBDateEdit
        Left = 200
        Top = 15
        DataBinding.DataField = 'DATE_FILURE'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 3
        Width = 121
      end
      object edtDB_4: TcxDBDateEdit
        Left = 200
        Top = 45
        DataBinding.DataField = 'DATE_NOTIFI'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 4
        Width = 121
      end
      object cxLabel16: TcxLabel
        Left = 327
        Top = 16
        Caption = #1055#1088#1086#1073#1077#1075' '#1090'/'#1089':'
      end
      object cxLabel17: TcxLabel
        Left = 328
        Top = 45
        Caption = #1053#1072#1088#1072#1073#1086#1090#1082#1072' '#1095'./'#1084'.:'
      end
      object edtDB_5: TcxDBCurrencyEdit
        Left = 448
        Top = 15
        DataBinding.DataField = 'RUN_MACHINE'
        DataBinding.DataSource = SQLDataSource
        Properties.DisplayFormat = '0'
        TabOrder = 7
        Width = 142
      end
      object edtDB_6: TcxDBCurrencyEdit
        Left = 448
        Top = 45
        DataBinding.DataField = 'LIFELENGTH'
        DataBinding.DataSource = SQLDataSource
        Properties.DisplayFormat = '0'
        TabOrder = 8
        Width = 142
      end
    end
    object TabSheet_2: TcxTabSheet
      Caption = #1056#1077#1082#1083#1072#1084#1072#1094#1080#1103
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        593
        319)
      object cxLabel11: TcxLabel
        Left = 12
        Top = 11
        Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072' '#1088#1077#1082#1083#1072#1084#1072#1094#1080#1080':'
      end
      object cxLabel12: TcxLabel
        Left = 12
        Top = 44
        Caption = #1044#1072#1090#1072' '#1087#1080#1089#1100#1084#1077#1085#1085#1086#1075#1086' '#1088#1077#1096#1077#1085#1080#1103' '#1080#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1103':'
      end
      object cxLabel13: TcxLabel
        Left = 12
        Top = 75
        Caption = #1044#1072#1090#1072' '#1088#1077#1084#1086#1085#1090#1072' '#1079#1072#1084#1077#1085#1099':'
      end
      object edtDB_16: TcxDBCheckGroup
        Left = 409
        Top = 3
        Caption = #1056#1077#1096#1077#1085#1080#1077' '#1087#1086' '#1088#1077#1082#1083#1072#1084#1072#1094#1080#1080
        Properties.Items = <
          item
            Caption = #1053#1077#1090' '#1088#1077#1096#1077#1085#1080#1103
          end
          item
            Caption = #1055#1088#1080#1085#1103#1090#1072
          end
          item
            Caption = #1053#1077' '#1087#1088#1080#1085#1103#1090#1072
          end>
        TabOrder = 3
        DataBinding.DataField = 'STATUS_RECL'
        DataBinding.DataSource = SQLDataSource
        Height = 95
        Width = 174
      end
      object edtDB_11: TcxDBDateEdit
        Left = 274
        Top = 10
        DataBinding.DataField = 'DATE_RECLAMATION'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 4
        Width = 121
      end
      object edtDB_12: TcxDBDateEdit
        Left = 274
        Top = 43
        DataBinding.DataField = 'DATE_DECISION_AUTOMAKER'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 5
        Width = 121
      end
      object edtDB_13: TcxDBDateEdit
        Left = 274
        Top = 74
        DataBinding.DataField = 'DATE_REPAIR'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 6
        Width = 121
      end
      object cxGroupBox2: TcxGroupBox
        Left = 3
        Top = 101
        Anchors = [akLeft, akTop, akBottom]
        Caption = #1056#1077#1096#1077#1085#1080#1103' '#1087#1086' '#1087#1088#1080#1085#1103#1090#1086#1081' '#1088#1077#1082#1083#1072#1084#1072#1094#1080#1080
        TabOrder = 7
        DesignSize = (
          580
          215)
        Height = 215
        Width = 580
        object cxLabel14: TcxLabel
          Left = 8
          Top = 24
          Caption = #1042#1080#1076' '#1088#1077#1084#1086#1085#1090#1072':'
        end
        object cxLabel15: TcxLabel
          Left = 9
          Top = 54
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1087#1088#1080#1085#1103#1090#1099#1084' '#1084#1077#1088#1072#1084' '#1087#1086' '#1091#1089#1090#1088#1072#1085#1077#1085#1080#1102':'
        end
        object edtDB_15: TcxDBRichEdit
          Left = 3
          Top = 72
          Anchors = [akLeft, akTop, akRight, akBottom]
          Properties.ScrollBars = ssBoth
          TabOrder = 2
          Height = 140
          Width = 574
        end
        object edtDB_14: TcxDBLookupComboBox
          Left = 96
          Top = 24
          DataBinding.DataField = 'TYPE_REPAIR'
          DataBinding.DataSource = SQLDataSource
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCR'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = SQLDataSourceVR
          TabOrder = 3
          Width = 329
        end
      end
    end
    object TabSheet_3: TcxTabSheet
      Caption = #1047#1072#1084#1077#1085#1072' '#1091#1079#1083#1086#1074
      ImageIndex = 2
      DesignSize = (
        593
        319)
      object RzToolbar1: TRzToolbar
        Left = 0
        Top = 0
        Width = 593
        Height = 29
        AutoStyle = False
        Images = frmMain.ImageSmall
        BorderInner = fsNone
        BorderOuter = fsGroove
        BorderSides = []
        BorderWidth = 0
        TabOrder = 0
        ToolbarControls = (
          tbbtnElements_new
          tbbtnElements_Delete)
        object tbbtnElements_new: TRzToolButton
          Left = 4
          Top = 2
          ImageIndex = 4
          OnClick = tbbtnElements_newClick
        end
        object tbbtnElements_Delete: TRzToolButton
          Left = 29
          Top = 2
          ImageIndex = 6
          OnClick = tbbtnElements_DeleteClick
        end
      end
      object browsDetail: TcxGrid
        Left = 3
        Top = 33
        Width = 587
        Height = 283
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        object browsDetailTableViewD: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          object browsDetailDColumnID: TcxGridColumn
            Caption = ' '
            DataBinding.ValueType = 'Integer'
            Width = 33
          end
          object browsDetailDColumnDescr_Element: TcxGridColumn
            Caption = #1059#1079#1077#1083' '#1079#1072#1084#1077#1085#1072
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ClickKey = 115
            Properties.ReadOnly = False
            Properties.ViewStyle = vsHideCursor
            Properties.OnButtonClick = browsDetailDColumnDescr_ElementPropertiesButtonClick
            Width = 220
          end
          object browsDetailDColumnElement_ID: TcxGridColumn
            DataBinding.ValueType = 'Integer'
            Visible = False
          end
          object browsDetailDKvo: TcxGridColumn
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = '0'
            Width = 93
          end
          object browsDetailDSerialOut: TcxGridColumn
            Caption = #1057#1077#1088#1080#1081#1085#1099#1077' '#1085#1086#1084#1077#1088' '#1079#1072#1084#1077#1085#1077#1085#1085#1086#1081
            Width = 157
          end
          object browsDetailDSerialIn: TcxGridColumn
            Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1085#1086#1074#1086#1081' '#1076#1077#1090#1072#1083#1080
            Width = 170
          end
        end
        object browsDetailLevelD: TcxGridLevel
          GridView = browsDetailTableViewD
        end
      end
    end
    object TabSheet_4: TcxTabSheet
      Caption = #1060#1086#1090#1086
      ImageIndex = 3
      object RzToolbar3: TRzToolbar
        Left = 0
        Top = 0
        Width = 593
        Height = 29
        AutoStyle = False
        Images = frmMain.ImageSmall
        BorderInner = fsNone
        BorderOuter = fsGroove
        BorderSides = []
        BorderWidth = 0
        TabOrder = 0
        ToolbarControls = (
          tbbtnFoto_new
          tbbtnFoto_delete)
        object tbbtnFoto_new: TRzToolButton
          Left = 4
          Top = 2
          ImageIndex = 5
          OnClick = tbbtnFoto_newClick
        end
        object tbbtnFoto_delete: TRzToolButton
          Left = 29
          Top = 2
          ImageIndex = 6
          OnClick = tbbtnFoto_deleteClick
        end
      end
      object FotoList: TcxListBox
        Left = 3
        Top = 33
        Width = 587
        Height = 283
        ItemHeight = 16
        TabOrder = 1
        OnDblClick = FotoListDblClick
      end
    end
  end
  object RzToolbar2: TRzToolbar
    Left = 0
    Top = 0
    Width = 593
    Height = 29
    Images = frmMain.ImageSmall
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 5
    ToolbarControls = (
      tbbtnClose
      RzSpacer1
      tbbtnSave
      tbbtnPrint)
    object tbbtnClose: TRzToolButton
      Left = 4
      Top = 2
      Width = 77
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1103
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = tbbtnCloseClick
    end
    object RzSpacer1: TRzSpacer
      Left = 81
      Top = 2
    end
    object tbbtnSave: TRzToolButton
      Left = 89
      Top = 2
      Width = 90
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 23
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = tbbtnSaveClick
    end
    object tbbtnPrint: TRzToolButton
      Left = 179
      Top = 2
      Width = 83
      ImageIndex = 82
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
    end
  end
  object edtDB_2: TcxButtonEdit
    Tag = 1
    Left = 184
    Top = 60
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ViewStyle = vsHideCursor
    Properties.OnButtonClick = edtDB_2PropertiesButtonClick
    TabOrder = 7
    Width = 401
  end
  object labelPredpr: TcxLabel
    Left = 184
    Top = 88
    AutoSize = False
    Height = 20
    Width = 401
  end
  object SQLDataSet: TADODataSet
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    CommandText = 'select * from TB_RECLAMATION'
    Parameters = <>
    Left = 232
  end
  object SQLDataSource: TDataSource
    DataSet = SQLDataSet
    Left = 264
  end
  object SQLVidRemonta: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300494400320000000100
      06004445534352000100000000011C000000C7E0ECE5EDE020E7E0E2EEE4EEEC
      20E8E7E3EEF2EEE2E8F2E5EBE5EC0101000000011A000000D0E5ECEEEDF220F1
      EEE1F1F2E2E5EDEDFBECE820F1E8EBE0ECE801020000000111000000D0E5ECEE
      EDF220F1ECE5E6EDE8EAE0ECE8}
    SortOptions = []
    Left = 456
    object SQLVidRemontaID: TIntegerField
      FieldName = 'ID'
    end
    object SQLVidRemontaDESCR: TStringField
      FieldName = 'DESCR'
      Size = 50
    end
  end
  object SQLDataSourceVR: TDataSource
    DataSet = SQLVidRemonta
    Left = 488
  end
  object SQLQueryFoto: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
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
    SQL.Strings = (
      'SELECT * FROM TB_RECL_FOTO WHERE ID=:IDITEM')
    Left = 528
  end
  object SQLDataSourceFoto: TDataSource
    DataSet = SQLQueryFoto
    Left = 560
  end
  object OpenPictureDlg: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofNoNetworkButton, ofEnableSizing]
    Left = 448
    Top = 40
  end
end
