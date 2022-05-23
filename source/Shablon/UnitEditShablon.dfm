object frameEditCodeFailure: TframeEditCodeFailure
  Left = 0
  Top = 0
  Caption = 'frameEditQuarry'
  ClientHeight = 409
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 564
    Height = 34
    Images = frmMain.ImageSmall
    RowHeight = 30
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      tbbtnSave
      RzSpacer1
      tbbtnClose
      RzSpacer2
      RzToolButton3)
    object tbbtnSave: TRzToolButton
      Left = 4
      Top = 5
      ImageIndex = 23
      OnClick = tbbtnSaveClick
    end
    object RzSpacer1: TRzSpacer
      Left = 29
      Top = 2
      Width = 10
      Height = 30
    end
    object tbbtnClose: TRzToolButton
      Left = 39
      Top = 5
      ImageIndex = 24
      OnClick = tbbtnCloseClick
    end
    object RzSpacer2: TRzSpacer
      Left = 64
      Top = 5
    end
    object RzToolButton3: TRzToolButton
      Left = 72
      Top = 5
      ImageIndex = 82
    end
  end
  object SQLDataSet: TADODataSet
    Connection = RCDataModule.DBConn
    CommandText = 'select * from TB_QUARRY WHERE ID=:EDTID'
    Parameters = <
      item
        Name = 'EDTID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    Left = 48
    Top = 40
  end
  object SQLDataSource: TDataSource
    DataSet = SQLDataSet
    Left = 80
    Top = 40
  end
end
