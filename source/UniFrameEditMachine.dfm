object frmEditMachine: TfrmEditMachine
  Left = 0
  Top = 0
  Align = alClient
  AutoSize = True
  ClientHeight = 476
  ClientWidth = 575
  Color = clBtnFace
  Constraints.MinHeight = 406
  Constraints.MinWidth = 556
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
    Width = 575
    Height = 29
    AutoStyle = False
    Images = frmMain.ImageSmall
    BorderInner = fsNone
    BorderOuter = fsPopup
    BorderSides = [sdTop, sdBottom]
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      tbbtnSave
      tbbtnClose
      RzSpacer1
      tbbtnPrint)
    object tbbtnSave: TRzToolButton
      Left = 4
      Top = 2
      ImageIndex = 23
      Images = frmMain.ImageSmall
      OnClick = tbbtnSaveClick
    end
    object tbbtnClose: TRzToolButton
      Left = 29
      Top = 2
      ImageIndex = 24
      OnClick = tbbtnCloseClick
    end
    object RzSpacer1: TRzSpacer
      Left = 54
      Top = 2
    end
    object tbbtnPrint: TRzToolButton
      Left = 62
      Top = 2
      ImageIndex = 35
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 95
    Width = 575
    Height = 359
    ActivePage = cxTabSheet1
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [pcoGoDialog, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    TabOrder = 1
    ClientRectBottom = 359
    ClientRectRight = 575
    ClientRectTop = 27
    object cxTabSheet1: TcxTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 0
      object edtDB_1: TcxDBDateEdit
        Left = 251
        Top = 93
        DataBinding.DataField = 'DATE_IN_EXPOITATION'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 1
        Width = 121
      end
      object edtDB_3: TcxDBTextEdit
        Left = 251
        Top = 153
        DataBinding.DataField = 'NUMER_ACT'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 2
        Width = 121
      end
      object edtDB_0: TcxDBLookupComboBox
        Left = 95
        Top = 55
        DataBinding.DataField = 'TYPE_PROCESS'
        DataBinding.DataSource = SQLDataSource
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1058#1080#1087' '#1087#1088#1086#1094#1077#1089#1089#1072
            FieldName = 'descr'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = RCDataModule.DataSource_type_process
        TabOrder = 3
        Width = 145
      end
      object edtDB_2: TcxDBDateEdit
        Left = 251
        Top = 123
        DataBinding.DataField = 'DATE_PRODUCTION_ENGINE'
        DataBinding.DataSource = SQLDataSource
        TabOrder = 4
        Width = 121
      end
      object RzGroupBox1: TcxGroupBox
        Left = 12
        Top = 186
        Caption = #1043#1072#1088#1072#1085#1090#1080#1103
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 0
        Height = 75
        Width = 228
        object edtDB_4: TcxDBMaskEdit
          Left = 105
          Top = 16
          DataBinding.DataField = 'GUARANTEE'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 105
        end
        object edtDB_5: TcxDBLookupComboBox
          Left = 104
          Top = 43
          DataBinding.DataField = 'TYPE_GUARANTEE'
          DataBinding.DataSource = SQLDataSource
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'Id'
          Properties.ListColumns = <
            item
              FieldName = 'descr'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = RCDataModule.DataSource_type_guarant
          TabOrder = 1
          Width = 105
        end
        object RzLabel9: TcxLabel
          Left = 8
          Top = 21
          Caption = #1057#1088#1086#1082' '#1075#1072#1088#1072#1085#1090#1080#1080':'
        end
        object RzLabel10: TcxLabel
          Left = 8
          Top = 43
          Caption = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080':'
        end
      end
      object RzLabel5: TcxLabel
        Left = 8
        Top = 57
        Caption = #1055#1088#1080#1084#1077#1085#1077#1085#1080#1077':'
      end
      object RzLabel6: TcxLabel
        Left = 12
        Top = 96
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1075#1086' '#1089#1088#1077#1076#1089#1090#1074#1072':'
      end
      object RzLabel7: TcxLabel
        Left = 12
        Top = 128
        Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102':'
      end
      object RzLabel8: TcxLabel
        Left = 12
        Top = 160
        Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102':'
      end
      object edtDB_50: TcxButtonEdit
        Tag = 3
        Left = 95
        Top = 15
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsHideCursor
        TabOrder = 9
        Text = 'edtDB_50'
        OnClick = edtDB_50Click
        Width = 194
      end
      object edtDB_51: TcxButtonEdit
        Tag = 4
        Left = 371
        Top = 15
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsHideCursor
        TabOrder = 10
        Text = 'edtDB_51'
        OnClick = edtDB_51Click
        Width = 193
      end
      object cxLabel2: TcxLabel
        Left = 8
        Top = 16
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077':'
      end
      object cxLabel3: TcxLabel
        Left = 314
        Top = 16
        Caption = #1050#1072#1088#1100#1077#1088':'
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1057#1077#1088#1080#1081#1085#1099#1077' '#1085#1086#1084#1077#1088#1072
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox2: TcxGroupBox
        Left = 7
        Top = 3
        Caption = #1044#1074#1080#1075#1072#1090#1077#1083#1100':'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 78
        Width = 218
        object edtDB_6: TcxDBLookupComboBox
          Left = 56
          Top = 19
          DataBinding.DataField = 'TYPE_ENGINE_ID'
          DataBinding.DataSource = SQLDataSource
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = #1084#1072#1088#1082#1072' '#1076#1074'.'
              FieldName = 'DESCR'
            end>
          Properties.ListSource = DataSource_type_engine
          TabOrder = 0
          Width = 153
        end
        object edtDB_7: TcxDBTextEdit
          Left = 96
          Top = 48
          DataBinding.DataField = 'NUMBER_ENGINE'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 113
        end
        object RzLabel11: TcxLabel
          Left = 8
          Top = 22
          Caption = #1052#1072#1088#1082#1072':'
        end
        object RzLabel12: TcxLabel
          Left = 8
          Top = 52
          Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#8470':'
        end
      end
      object RzGroupBox3: TcxGroupBox
        Left = 7
        Top = 82
        Caption = #1050#1091#1079#1086#1074':'
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 1
        Height = 79
        Width = 218
        object edtDB_8: TcxDBTextEdit
          Left = 112
          Top = 16
          DataBinding.DataField = 'NUMBER_CAB_CAR_FRAME'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 97
        end
        object edtDB_9: TcxDBTextEdit
          Left = 112
          Top = 48
          DataBinding.DataField = 'NUMBER_CAB'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 97
        end
        object RzLabel13: TcxLabel
          Left = 9
          Top = 24
          Caption = #1057#1077#1088'. '#8470' '#1088#1072#1084#1099':'
        end
        object RzLabel14: TcxLabel
          Left = 9
          Top = 54
          Caption = #1057#1077#1088'. '#8470' '#1082#1072#1073#1080#1085#1099':'
        end
      end
      object RzGroupBox4: TcxGroupBox
        Left = 231
        Top = 3
        Caption = #1062#1080#1083#1080#1085#1076#1088#1099' '#1087#1086#1076#1074#1077#1089#1082#1080':'
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 2
        Height = 126
        Width = 314
        object RzLabel15: TcxLabel
          Left = 12
          Top = 19
          Caption = #1055#1077#1088#1077#1076#1085#1103#1103' '#1087#1086#1076#1074#1077#1089#1082#1072':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object RzLabel16: TcxLabel
          Left = 12
          Top = 45
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel17: TcxLabel
          Left = 160
          Top = 45
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object RzLabel18: TcxLabel
          Left = 12
          Top = 71
          Caption = #1047#1072#1076#1085#1103#1103' '#1087#1086#1076#1074#1077#1089#1082#1072':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object RzLabel19: TcxLabel
          Left = 12
          Top = 99
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel20: TcxLabel
          Left = 160
          Top = 99
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object edtDB_12: TcxDBTextEdit
          Left = 65
          Top = 44
          DataBinding.DataField = 'CYLINDER_PODVESKA_FRONT_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 6
          Width = 80
        end
        object edtDB_13: TcxDBTextEdit
          Left = 216
          Top = 40
          DataBinding.DataField = 'CYLINDER_PODVESKA_FRONT_RIGTH'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 7
          Width = 73
        end
        object edtDB_14: TcxDBTextEdit
          Left = 66
          Top = 96
          DataBinding.DataField = 'CYLINDER_PODVESKA_BACK_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 8
          Width = 79
        end
        object edtDB_15: TcxDBTextEdit
          Left = 216
          Top = 96
          DataBinding.DataField = 'CYLINDER_PODVESKA_BACK_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 9
          Width = 73
        end
      end
      object RzGroupBox5: TcxGroupBox
        Left = 3
        Top = 167
        Caption = #1052#1086#1076#1077#1083#1100' '#1062#1054#1052':'
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 3
        Height = 114
        Width = 218
        object edtDB_10: TcxDBTextEdit
          Left = 112
          Top = 16
          DataBinding.DataField = 'MODEL_CYLINDER_DUMPING_GEAR_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 97
        end
        object edtDB_11: TcxDBTextEdit
          Left = 112
          Top = 48
          DataBinding.DataField = 'MODEL_CYLINDER_DUMPING_GEAR_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 97
        end
        object RzLabel21: TcxLabel
          Left = 9
          Top = 24
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object RzLabel22: TcxLabel
          Left = 9
          Top = 54
          Caption = #1051#1077#1074#1099#1081':'
        end
      end
      object RzGroupBox6: TcxGroupBox
        Left = 231
        Top = 129
        Caption = #1055#1088#1086#1095#1077#1077':'
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 4
        Height = 184
        Width = 314
        object RzLabel25: TcxLabel
          Left = 12
          Top = 93
          Caption = #1057#1080#1089#1090#1077#1084#1072' '#1087#1086#1078#1072#1088#1086#1090#1091#1096#1077#1085#1080#1103':'
        end
        object RzLabel26: TcxLabel
          Left = 12
          Top = 123
          Caption = #1052#1086#1076#1077#1083#1100' '#1082#1086#1085#1076#1080#1094#1080#1086#1085#1077#1088#1072':'
        end
        object RzLabel24: TcxLabel
          Left = 12
          Top = 51
          Caption = #1052#1086#1076#1077#1083#1100' '#1062#1040#1057#1057':'
        end
        object RzLabel23: TcxLabel
          Left = 12
          Top = 22
          Caption = #1052#1086#1076#1077#1083#1100' '#1043#1052#1055':'
        end
        object RzLabel61: TcxLabel
          Left = 12
          Top = 160
          Caption = #1041#1072#1083#1082#1072' '#1087#1077#1088#1077#1076#1085#1077#1081' '#1086#1089#1080':'
        end
        object edtDB_16: TcxDBTextEdit
          Left = 112
          Top = 18
          DataBinding.DataField = 'MODEL_GMP'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 5
          Width = 97
        end
        object edtDB_17: TcxDBTextEdit
          Left = 112
          Top = 48
          DataBinding.DataField = 'MODEL_CASS'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 6
          Width = 97
        end
        object edtDB_18: TcxDBTextEdit
          Left = 176
          Top = 88
          DataBinding.DataField = 'FIRE_WARNING_SYSTEM'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 7
          Width = 129
        end
        object edtDB_19: TcxDBTextEdit
          Left = 176
          Top = 122
          DataBinding.DataField = 'MODEL_AIR_CONDITIONER'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 8
          Width = 129
        end
        object edtDB_20: TcxDBTextEdit
          Left = 176
          Top = 152
          DataBinding.DataField = 'FRONT_AXLE'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 9
          Width = 129
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 2
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox7: TcxGroupBox
        Left = 7
        Top = 3
        Caption = #1052#1086#1076#1077#1083#1100' '#1055#1043#1040
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 0
        Height = 182
        Width = 130
        object RzLabel27: TcxLabel
          Left = 16
          Top = 27
          Caption = #8470' 1:'
        end
        object RzLabel28: TcxLabel
          Left = 16
          Top = 54
          Caption = #8470' 2:'
        end
        object RzLabel29: TcxLabel
          Left = 16
          Top = 88
          Caption = #8470' 3:'
        end
        object RzLabel30: TcxLabel
          Left = 16
          Top = 120
          Caption = #8470' 4:'
        end
        object RzLabel31: TcxLabel
          Left = 16
          Top = 152
          Caption = #8470' 5:'
        end
        object edtDB_21: TcxDBTextEdit
          Left = 53
          Top = 24
          DataBinding.DataField = 'MODEL_PGA_1'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 67
        end
        object edtDB_22: TcxDBTextEdit
          Left = 53
          Top = 54
          DataBinding.DataField = 'MODEL_PGA_2'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 67
        end
        object edtDB_23: TcxDBTextEdit
          Left = 53
          Top = 84
          DataBinding.DataField = 'MODEL_PGA_3'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 2
          Width = 67
        end
        object edtDB_24: TcxDBTextEdit
          Left = 53
          Top = 114
          DataBinding.DataField = 'MODEL_PGA_4'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 3
          Width = 67
        end
        object edtDB_25: TcxDBTextEdit
          Left = 53
          Top = 144
          DataBinding.DataField = 'MODEL_PGA_5'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 4
          Width = 67
        end
      end
      object RzGroupBox8: TcxGroupBox
        Left = 7
        Top = 186
        Caption = #1052#1086#1076#1077#1083#1100' '#1101#1083#1077#1082#1090#1088#1086#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 1
        Height = 140
        Width = 267
        object RzLabel39: TcxLabel
          Left = 13
          Top = 19
          Caption = #1052#1072#1088#1082#1072' '#1058#1045#1044':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object RzLabel40: TcxLabel
          Left = 11
          Top = 49
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel41: TcxLabel
          Left = 139
          Top = 50
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object RzLabel38: TcxLabel
          Left = 13
          Top = 83
          Caption = #1052#1072#1088#1082#1072' '#1058#1045#1043':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object RzLabel42: TcxLabel
          Left = 11
          Top = 112
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel43: TcxLabel
          Left = 139
          Top = 112
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object edtDB_34: TcxDBTextEdit
          Left = 61
          Top = 47
          DataBinding.DataField = 'TED_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 57
        end
        object edtDB_37: TcxDBTextEdit
          Left = 61
          Top = 110
          DataBinding.DataField = 'TEG_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 2
          Width = 57
        end
        object edtDB_35: TcxDBTextEdit
          Left = 195
          Top = 46
          DataBinding.DataField = 'TED_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 57
        end
        object edtDB_38: TcxDBTextEdit
          Left = 195
          Top = 110
          DataBinding.DataField = 'TEG_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 3
          Width = 57
        end
        object edtDB_33: TcxDBLookupComboBox
          Left = 96
          Top = 16
          DataBinding.DataField = 'MODEL_TED'
          DataBinding.DataSource = SQLDataSource
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCR'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataSource_model_ted
          TabOrder = 10
          Width = 156
        end
        object edtDB_36: TcxDBLookupComboBox
          Left = 96
          Top = 80
          DataBinding.DataField = 'MODEL_TEG'
          DataBinding.DataSource = SQLDataSource
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCR'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataSource_model_teg
          TabOrder = 11
          Width = 156
        end
      end
      object RzGroupBox10: TcxGroupBox
        Left = 143
        Top = 5
        Caption = #1055#1088#1086#1095#1077#1077
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 2
        Height = 180
        Width = 246
        object RzLabel32: TcxLabel
          Left = 6
          Top = 16
          Caption = #1052#1086#1076#1077#1083#1100' '#1056#1052#1050':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold, fsItalic, fsUnderline]
          Style.Shadow = False
          Style.TextColor = clGreen
          Style.IsFontAssigned = True
        end
        object RzLabel33: TcxLabel
          Left = 6
          Top = 68
          Caption = #1062#1080#1083#1080#1085#1076#1088' '#1088#1091#1083#1077#1074#1086#1075#1086' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold, fsItalic, fsUnderline]
          Style.TextColor = clGreen
          Style.IsFontAssigned = True
        end
        object RzLabel34: TcxLabel
          Left = 14
          Top = 40
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel35: TcxLabel
          Left = 126
          Top = 40
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object RzLabel36: TcxLabel
          Left = 14
          Top = 90
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel37: TcxLabel
          Left = 127
          Top = 90
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object RzLabel44: TcxLabel
          Left = 8
          Top = 120
          Caption = #1057#1090#1091#1087#1080#1094#1072' '#1087#1077#1088#1077#1076#1085#1077#1075#1086' '#1082#1086#1083#1077#1089#1072':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold, fsItalic, fsUnderline]
          Style.TextColor = clGreen
          Style.IsFontAssigned = True
        end
        object RzLabel45: TcxLabel
          Left = 14
          Top = 145
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel46: TcxLabel
          Left = 127
          Top = 145
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object edtDB_27: TcxDBTextEdit
          Left = 63
          Top = 38
          DataBinding.DataField = 'RMK_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 57
        end
        object edtDB_28: TcxDBTextEdit
          Left = 182
          Top = 40
          DataBinding.DataField = 'RMK_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 57
        end
        object edtDB_29: TcxDBTextEdit
          Left = 64
          Top = 90
          DataBinding.DataField = 'CYLINDER_WHEEL_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 2
          Width = 57
        end
        object edtDB_30: TcxDBTextEdit
          Left = 183
          Top = 90
          DataBinding.DataField = 'CYLINDER_WHEEL_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 3
          Width = 57
        end
        object edtDB_31: TcxDBTextEdit
          Left = 64
          Top = 145
          DataBinding.DataField = 'STEERING_WHEEL_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 4
          Width = 57
        end
        object edtDB_32: TcxDBTextEdit
          Left = 181
          Top = 145
          DataBinding.DataField = 'STEERING_WHEEL_RIGTH'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 5
          Width = 57
        end
      end
      object RzGroupBox11: TcxGroupBox
        Left = 395
        Top = 6
        Caption = #1069#1083#1077#1082#1090#1088#1086' '#1086#1073#1086#1088#1091#1086#1074#1072#1085#1080#1077
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 3
        Height = 180
        Width = 174
        object RzLabel47: TcxLabel
          Left = 8
          Top = 24
          Caption = #1057#1059#1058#1045#1055':'
        end
        object RzLabel48: TcxLabel
          Left = 8
          Top = 59
          Caption = #1057#1050#1058'/'#1057#1050#1047':'
        end
        object edtDB_39: TcxDBTextEdit
          Left = 80
          Top = 21
          DataBinding.DataField = 'SUTEP'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 81
        end
        object edtDB_40: TcxDBTextEdit
          Left = 80
          Top = 56
          DataBinding.DataField = 'SKZ'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 81
        end
      end
      object RzGroupBox9: TcxGroupBox
        Left = 280
        Top = 186
        Caption = #1045#1083#1077#1082#1090#1088#1086' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 4
        Height = 140
        Width = 289
        object RzLabel49: TcxLabel
          Left = 8
          Top = 24
          Caption = #1057#1080#1083#1086#1074#1086#1081' '#1096#1082#1072#1092':'
        end
        object RzLabel51: TcxLabel
          Left = 8
          Top = 54
          Caption = #1045#1083#1077#1082#1090#1088#1086' '#1084#1077#1093#1072#1085#1080#1095#1077#1089#1082#1080#1081' '#1087#1088#1080#1074#1086#1076':'
        end
        object RzLabel50: TcxLabel
          Left = 8
          Top = 89
          Caption = #1050#1072#1088#1090#1077#1088' '#1074#1077#1076#1091#1097#1077#1075#1086' '#1084#1086#1089#1090#1072':'
        end
        object edtDB_41: TcxDBTextEdit
          Left = 195
          Top = 21
          DataBinding.DataField = 'POWER_PLANT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 2
          Width = 81
        end
        object edtDB_42: TcxDBTextEdit
          Left = 195
          Top = 51
          DataBinding.DataField = 'ELECTROMECHANIKAL_DRIVE'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 81
        end
        object edtDB_43: TcxDBTextEdit
          Left = 195
          Top = 81
          DataBinding.DataField = 'CRANK'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 81
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = #1058#1077#1093#1085#1080#1095#1077#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 4
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox12: TcxGroupBox
        Left = 15
        Top = 3
        Caption = #1052#1072#1088#1082#1080' '#1094#1080#1083#1080#1085#1076#1088#1086#1074
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 0
        Height = 150
        Width = 270
        object RzLabel52: TcxLabel
          Left = 16
          Top = 20
          Caption = #1062#1080#1083#1080#1085#1076#1088' '#1087#1086#1076#1074#1077#1089#1082#1080' '#1089#1088#1077#1076#1085#1080#1081':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object RzLabel53: TcxLabel
          Left = 16
          Top = 84
          Caption = #1043#1080#1076#1088#1072#1074#1083#1080#1095#1077#1089#1082#1080#1081' '#1094#1080#1083#1080#1085#1076#1088' '#1087#1086#1074#1086#1088#1086#1090#1086#1074':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object RzLabel54: TcxLabel
          Left = 16
          Top = 46
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel55: TcxLabel
          Left = 137
          Top = 46
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object RzLabel56: TcxLabel
          Left = 16
          Top = 110
          Caption = #1051#1077#1074#1099#1081':'
        end
        object RzLabel57: TcxLabel
          Left = 137
          Top = 110
          Caption = #1055#1088#1072#1074#1099#1081':'
        end
        object edtDB_44: TcxDBTextEdit
          Left = 66
          Top = 46
          DataBinding.DataField = 'CYLINDER_PODVESKA_AVERAGE_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 60
        end
        object edtDB_45: TcxDBTextEdit
          Left = 193
          Top = 47
          DataBinding.DataField = 'CYLINDER_PODVESKA_AVERAGE_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 60
        end
        object edtDB_46: TcxDBTextEdit
          Left = 66
          Top = 110
          DataBinding.DataField = 'HYDRAULIC_CYLINDER_LEFT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 2
          Width = 60
        end
        object edtDB_47: TcxDBTextEdit
          Left = 193
          Top = 110
          DataBinding.DataField = 'HYDRAULIC_CYLINDER_RIGHT'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 3
          Width = 60
        end
      end
      object RzGroupBox13: TcxGroupBox
        Left = 15
        Top = 159
        Caption = #1057#1077#1088#1080#1081#1085#1099#1077' '#1085#1086#1084#1077#1088#1072
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 1
        Height = 97
        Width = 270
        object RzLabel58: TcxLabel
          Left = 13
          Top = 24
          Caption = #1042#1077#1076#1091#1097#1080#1081' '#1084#1086#1089#1090':'
        end
        object RzLabel60: TcxLabel
          Left = 13
          Top = 64
          Caption = #1055#1083#1072#1090#1092#1086#1088#1084#1072':'
        end
        object edtDB_48: TcxDBTextEdit
          Left = 148
          Top = 24
          DataBinding.DataField = 'DRIVING_AXLE'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 0
          Width = 105
        end
        object edtDB_49: TcxDBTextEdit
          Left = 148
          Top = 62
          DataBinding.DataField = 'PLATFORM'
          DataBinding.DataSource = SQLDataSource
          TabOrder = 1
          Width = 105
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = #1056#1077#1084#1086#1085#1090#1099', '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1080
      ImageIndex = 3
      DesignSize = (
        575
        332)
      object browserFault: TcxGrid
        Left = 3
        Top = 3
        Width = 569
        Height = 179
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object browserFaultDBView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataModeController.GridMode = True
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
          object browserFaultDBViewColumn7: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1091#1089
            Width = 47
          end
          object browserFaultDBViewColumn1: TcxGridDBColumn
            Caption = #1054#1090#1082#1072#1079
            Width = 77
          end
          object browserFaultDBViewColumn2: TcxGridDBColumn
            Caption = #1048#1079#1074#1077#1097#1077#1085#1080#1077
            Width = 80
          end
          object browserFaultDBViewColumn3: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1086#1090#1082#1072#1079#1072
            Width = 155
          end
          object browserFaultDBViewColumn4: TcxGridDBColumn
            Caption = #1050#1072#1090'. '#8470' '#1091#1079#1083#1072
            Width = 114
          end
          object browserFaultDBViewColumn5: TcxGridDBColumn
            Caption = #1059#1079#1077#1083
            Width = 92
          end
          object browserFaultDBViewColumn6: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1088#1077#1084#1086#1085#1090#1072
          end
        end
        object browserFaultLevel: TcxGridLevel
          GridView = browserFaultDBView
        end
      end
    end
  end
  object edtDBO_3: TcxDBLookupComboBox
    Left = 291
    Top = 35
    DataBinding.DataField = 'MODEL_ID'
    DataBinding.DataSource = SQLDataSource
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        Caption = #1052#1086#1076#1077#1083#1100
        Width = 35
        FieldName = 'DESCR'
      end
      item
        Caption = #1090#1085'.'
        Width = 25
        FieldName = 'TONNAGE'
      end>
    Properties.ListSource = DataSource_model_machine
    TabOrder = 2
    Width = 273
  end
  object edtDBO_1: TcxDBTextEdit
    Left = 116
    Top = 35
    DataBinding.DataField = 'NUMBER_CHASSIS'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 3
    Width = 89
  end
  object edtDBO_2: TcxDBTextEdit
    Left = 116
    Top = 65
    DataBinding.DataField = 'NUMBER_GARAGE'
    DataBinding.DataSource = SQLDataSource
    TabOrder = 4
    Width = 89
  end
  object RzLabel1: TcxLabel
    Left = 3
    Top = 38
    Caption = #1053#1086#1084#1077#1088' '#1096#1072#1089#1089#1080':'
  end
  object RzLabel2: TcxLabel
    Left = 4
    Top = 68
    Caption = #1043#1072#1088#1072#1078#1085#1099#1081' '#1085#1086#1084#1077#1088':'
  end
  object RzLabel3: TcxLabel
    Left = 211
    Top = 38
    Caption = #1052#1086#1076#1077#1083#1100' '#1090'.'#1089'.:'
  end
  object RzLabel4: TcxLabel
    Left = 211
    Top = 68
    Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1100#1077#1084#1085#1086#1089#1090#1100':'
  end
  object FrameStatusBar: TdxStatusBar
    Left = 0
    Top = 454
    Width = 575
    Height = 22
    Panels = <>
    PaintStyle = stpsFlat
    ParentFont = True
  end
  object lDB_TONAGE: TcxDBLabel
    Left = 326
    Top = 69
    DataBinding.DataField = 'TONNAGE'
    DataBinding.DataSource = DataSource_model_machine
    Properties.Orientation = cxoLeft
    Style.BorderStyle = ebsOffice11
    Height = 20
    Width = 46
  end
  object cxDBLabel1: TcxDBLabel
    Left = 403
    Top = 68
    DataBinding.DataField = 'MACHINE_TYPE_DESCR'
    DataBinding.DataSource = DataSource_model_machine
    Properties.Orientation = cxoLeft
    Style.BorderStyle = ebsOffice11
    Height = 21
    Width = 164
  end
  object cxLabel1: TcxLabel
    Left = 371
    Top = 69
    AutoSize = False
    Caption = #1090#1085'.'
    Height = 20
    Width = 19
  end
  object SQLDataSet: TADODataSet
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    CommandText = 'SELECT * FROM TB_MACHINE'
    Parameters = <>
    Left = 136
    Top = 65528
  end
  object SQLDataSource: TDataSource
    DataSet = SQLDataSet
    Left = 168
    Top = 65528
  end
  object SQL_Query_model_machine: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from SQL_MODEL_MACHINE')
    Left = 208
    Top = 65528
  end
  object DataSource_model_machine: TDataSource
    DataSet = SQL_Query_model_machine
    Left = 240
    Top = 65528
  end
  object SQLQuery_model_teg: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_MODEL_TEG')
    Left = 280
    Top = 65528
  end
  object SQLQuery_model_ted: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_MODEL_TED')
    Left = 320
    Top = 65528
  end
  object DataSource_model_teg: TDataSource
    AutoEdit = False
    DataSet = SQLQuery_model_teg
    Left = 400
    Top = 65528
  end
  object DataSource_model_ted: TDataSource
    AutoEdit = False
    DataSet = SQLQuery_model_ted
    Left = 440
    Top = 65528
  end
  object DataSource_type_engine: TDataSource
    AutoEdit = False
    DataSet = SQLQuery_type_engine
    Left = 480
    Top = 65528
  end
  object SQLQuery_type_engine: TADOQuery
    Connection = RCDataModule.DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_TYPE_ENGINE')
    Left = 360
    Top = 65528
  end
end
