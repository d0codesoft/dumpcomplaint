object frmReportRecl: TfrmReportRecl
  Left = 0
  Top = 0
  ClientHeight = 362
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 13
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
      tbbtnClose)
    object tbbtnClose: TRzToolButton
      Left = 4
      Top = 2
      Width = 60
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1095#1080#1085#1080#1090#1080
      OnClick = tbbtnCloseClick
    end
  end
  object SQLPreview: TfrxPreview
    Left = 0
    Top = 29
    Width = 538
    Height = 333
    Align = alClient
    OutlineVisible = False
    OutlineWidth = 120
  end
  object SQLReport: TfrxReport
    Version = '3.23.9'
    DotMatrixReport = False
    IniFile = '\Software\BELAZ\RECLAMATION'
    Preview = SQLPreview
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38915.646782037000000000
    ReportOptions.LastChange = 38917.666475324080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 40
    Top = 72
    Datasets = <
      item
        DataSet = SQLReportDataSet
        DataSetName = 'SQLDataSet'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 139.842610000000000000
          Top = 7.559059999999999000
          Width = 415.748300000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1113#1056#1118'-'#1056#160#1056#8226#1056#1113#1056#8250#1056#1106#1056#1114#1056#1106#1056#166#1056#152#1056#152)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 839.055660000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        DataSet = SQLReportDataSet
        DataSetName = 'SQLDataSet'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 241.889920000000000000
          Top = 3.779529999999994000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DataField = 'DateReport'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SQLDataSet."DateReport"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 15.118120000000000000
          Top = 45.354360000000010000
          Width = 695.433520000000000000
          Height = 41.574830000000000000
          DataField = 'PREDPR'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8 = (
            '[SQLDataSet."PREDPR"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 15.118120000000000000
          Top = 90.708720000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1110#1057#1026#1057#1107#1056#183#1056#1109#1057#8225#1056#1029#1057#8249#1056#181' '#1057#1026#1056#181#1056#1108#1056#1030#1056#1105#1056#183#1056#1105#1057#8218#1057#8249':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 196.535560000000000000
          Top = 90.708720000000000000
          Width = 514.016080000000000000
          Height = 41.574830000000000000
          AutoWidth = True
          DataField = 'OTGRUZKA'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."OTGRUZKA"]')
        end
        object Memo7: TfrxMemoView
          Left = 15.118120000000000000
          Top = 139.842610000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1056#1029#1057#8249#1056#8470' '#1057#1027#1057#8225#1056#181#1057#8218':')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 143.622140000000000000
          Top = 139.842610000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'RAC_SHET'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."RAC_SHET"]')
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 166.299320000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1112#1056#1105#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':')
        end
        object Memo10: TfrxMemoView
          Left = 154.960730000000000000
          Top = 166.299320000000000000
          Width = 555.590910000000000000
          Height = 49.133890000000000000
          AutoWidth = True
          DataField = 'KOMISIY'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."KOMISIY"]')
        end
        object Memo11: TfrxMemoView
          Left = 15.118120000000000000
          Top = 215.433210000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039':')
        end
        object Memo12: TfrxMemoView
          Left = 204.094620000000000000
          Top = 215.433210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'PREDSEDATEL'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."PREDSEDATEL"]')
        end
        object Memo13: TfrxMemoView
          Left = 15.118120000000000000
          Top = 238.110390000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1169#1056#181#1056#8470#1057#1027#1057#8218#1056#1030#1057#1107#1056#181#1057#8240#1056#181#1056#1110#1056#1109' '#1056#1029#1056#176' '#1056#1109#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#1105':')
        end
        object Memo14: TfrxMemoView
          Left = 15.118120000000000000
          Top = 260.787570000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1109#1057#1027#1056#1112#1056#1109#1057#8218#1057#1026#1056#181#1056#1030' '#1056#1105#1056#183#1056#1169#1056#181#1056#187#1056#1105#1056#181':')
        end
        object Memo15: TfrxMemoView
          Left = 15.118120000000000000
          Top = 306.141930000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1029#1056#1029#1057#8249#1056#8470' '#1056#1109#1057#8218':')
        end
        object Memo16: TfrxMemoView
          Left = 200.315090000000000000
          Top = 238.110390000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'DEYSTV'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."DEYSTV"]')
        end
        object Memo17: TfrxMemoView
          Left = 143.622140000000000000
          Top = 260.787570000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataField = 'MODEL'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."MODEL"]')
        end
        object Memo18: TfrxMemoView
          Left = 143.622140000000000000
          Top = 283.464750000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'MACHINE'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."MACHINE"]')
        end
        object Memo19: TfrxMemoView
          Left = 132.283550000000000000
          Top = 306.141930000000000000
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          DataField = 'POSTAVHIK'
          DataSet = SQLReportDataSet
          DataSetName = 'SQLDataSet'
          Memo.UTF8 = (
            '[SQLDataSet."POSTAVHIK"]')
        end
        object Memo20: TfrxMemoView
          Left = 15.118120000000000000
          Top = 336.378169999999900000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1105#1056#1112#1056#181#1056#1030#1057#8364#1056#1105#1056#8470' '#1056#1108' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218#1057#1107' '#1056#1111#1056#1109#1056#187#1056#1109#1056#1112#1056#1108#1056#1105)
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1028.032160000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.419312533333000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
        end
      end
    end
  end
  object SQLReportDataSet: TfrxUserDataSet
    UserName = 'SQLDataSet'
    Fields.Strings = (
      '')
    Left = 72
    Top = 72
  end
end
