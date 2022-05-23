object RCDataModule: TRCDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 468
  Width = 556
  object DBConn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\De' +
      'lphiProject\reclamation\RCdb.mdb;Mode=Share Deny None;Extended P' +
      'roperties="";Persist Security Info=False;Jet OLEDB:System databa' +
      'se="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password=rec' +
      'lamation;Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode' +
      '=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Tra' +
      'nsactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create ' +
      'System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB' +
      ':Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without Re' +
      'plica Repair=False;Jet OLEDB:SFP=False'
    IsolationLevel = ilReadCommitted
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 24
  end
  object SYS_SQL_USER: TADOQuery
    Connection = DBConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_SYS_USER')
    Left = 112
    Top = 24
  end
  object MianGridViewRepository: TcxGridViewRepository
    Left = 408
    Top = 208
    object MianGridViewRepositoryDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
  end
  object ImageList1: TImageList
    Left = 416
    Top = 304
  end
  object SQLDataSourse_type_process: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300696400190000000100
      06006465736372000100000000010A000000D2E5F5EFF0EEF6E5F1F101010000
      00010E000000D5EEE72E20F2F0E0EDF1EFEEF0F2}
    ReadOnly = True
    SortOptions = []
    SortedField = 'id'
    Left = 96
    Top = 96
    object SQLDataSourse_type_processid: TIntegerField
      FieldName = 'id'
    end
    object SQLDataSourse_type_processdescr: TStringField
      FieldName = 'descr'
      Size = 25
    end
  end
  object DataSource_type_process: TDataSource
    AutoEdit = False
    DataSet = SQLDataSourse_type_process
    Left = 96
    Top = 152
  end
  object DataSource_type_guarant: TDataSource
    AutoEdit = False
    DataSet = SQLDataSurse_DataSource_type_guarant
    Left = 264
    Top = 144
  end
  object SQLDataSurse_DataSource_type_guarant: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300496400190000000100
      06006465736372000101000000010A000000CAEEEBEEECE5F2F0E0E601020000
      000109000000CDE0F0E0E1EEF2EAE0}
    ReadOnly = True
    SortOptions = []
    Left = 264
    Top = 80
    object SQLDataSurse_DataSource_type_guarantId: TIntegerField
      FieldName = 'Id'
    end
    object SQLDataSurse_DataSource_type_guarantdescr: TStringField
      FieldName = 'descr'
      Size = 25
    end
  end
end
