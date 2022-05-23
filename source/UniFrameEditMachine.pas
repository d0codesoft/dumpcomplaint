unit UniFrameEditMachine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDBModul,UnitUserPWD, UnitFrameBase, RzButton, ExtCtrls, StdCtrls, Mask,
  cxPC, cxControls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ADODB,
  DBCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDBExtLookupComboBox, cxDBEdit,
  cxCalendar, cxGroupBox, cxLabel, dxStatusBar, RzPanel, cxDBLabel, cxButtonEdit;

type
  TfrmEditMachine = class(TframeBase)
    RzToolbar1: TRzToolbar;
    tbbtnSave: TRzToolButton;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnPrint: TRzToolButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    browserFaultDBView: TcxGridDBTableView;
    browserFaultLevel: TcxGridLevel;
    browserFault: TcxGrid;
    browserFaultDBViewColumn1: TcxGridDBColumn;
    browserFaultDBViewColumn2: TcxGridDBColumn;
    browserFaultDBViewColumn3: TcxGridDBColumn;
    browserFaultDBViewColumn4: TcxGridDBColumn;
    browserFaultDBViewColumn5: TcxGridDBColumn;
    browserFaultDBViewColumn6: TcxGridDBColumn;
    browserFaultDBViewColumn7: TcxGridDBColumn;
    SQLDataSet: TADODataSet;
    SQLDataSource: TDataSource;
    SQL_Query_model_machine: TADOQuery;
    DataSource_model_machine: TDataSource;
    SQLQuery_model_teg: TADOQuery;
    SQLQuery_model_ted: TADOQuery;
    DataSource_model_teg: TDataSource;
    DataSource_model_ted: TDataSource;
    DataSource_type_engine: TDataSource;
    SQLQuery_type_engine: TADOQuery;
    edtDBO_3: TcxDBLookupComboBox;
    edtDBO_1: TcxDBTextEdit;
    edtDBO_2: TcxDBTextEdit;
    edtDB_1: TcxDBDateEdit;
    edtDB_3: TcxDBTextEdit;
    edtDB_0: TcxDBLookupComboBox;
    edtDB_2: TcxDBDateEdit;
    RzGroupBox1: TcxGroupBox;
    edtDB_4: TcxDBMaskEdit;
    edtDB_5: TcxDBLookupComboBox;
    RzGroupBox2: TcxGroupBox;
    edtDB_6: TcxDBLookupComboBox;
    edtDB_7: TcxDBTextEdit;
    RzGroupBox3: TcxGroupBox;
    edtDB_8: TcxDBTextEdit;
    edtDB_9: TcxDBTextEdit;
    RzGroupBox4: TcxGroupBox;
    RzGroupBox5: TcxGroupBox;
    edtDB_10: TcxDBTextEdit;
    edtDB_11: TcxDBTextEdit;
    RzGroupBox6: TcxGroupBox;
    RzGroupBox7: TcxGroupBox;
    RzGroupBox8: TcxGroupBox;
    RzGroupBox10: TcxGroupBox;
    RzGroupBox11: TcxGroupBox;
    RzGroupBox9: TcxGroupBox;
    RzGroupBox12: TcxGroupBox;
    RzGroupBox13: TcxGroupBox;
    RzLabel1: TcxLabel;
    RzLabel2: TcxLabel;
    RzLabel3: TcxLabel;
    RzLabel4: TcxLabel;
    RzLabel5: TcxLabel;
    RzLabel6: TcxLabel;
    RzLabel7: TcxLabel;
    RzLabel8: TcxLabel;
    RzLabel9: TcxLabel;
    RzLabel10: TcxLabel;
    RzLabel11: TcxLabel;
    RzLabel12: TcxLabel;
    RzLabel13: TcxLabel;
    RzLabel14: TcxLabel;
    RzLabel15: TcxLabel;
    RzLabel16: TcxLabel;
    RzLabel17: TcxLabel;
    RzLabel18: TcxLabel;
    RzLabel19: TcxLabel;
    RzLabel20: TcxLabel;
    RzLabel21: TcxLabel;
    RzLabel22: TcxLabel;
    RzLabel25: TcxLabel;
    RzLabel26: TcxLabel;
    RzLabel24: TcxLabel;
    RzLabel23: TcxLabel;
    RzLabel61: TcxLabel;
    RzLabel27: TcxLabel;
    RzLabel28: TcxLabel;
    RzLabel29: TcxLabel;
    RzLabel30: TcxLabel;
    RzLabel31: TcxLabel;
    RzLabel39: TcxLabel;
    RzLabel40: TcxLabel;
    RzLabel41: TcxLabel;
    RzLabel38: TcxLabel;
    RzLabel42: TcxLabel;
    RzLabel43: TcxLabel;
    RzLabel32: TcxLabel;
    RzLabel33: TcxLabel;
    RzLabel34: TcxLabel;
    RzLabel35: TcxLabel;
    RzLabel36: TcxLabel;
    RzLabel37: TcxLabel;
    RzLabel44: TcxLabel;
    RzLabel45: TcxLabel;
    RzLabel46: TcxLabel;
    RzLabel47: TcxLabel;
    RzLabel48: TcxLabel;
    RzLabel49: TcxLabel;
    RzLabel51: TcxLabel;
    RzLabel50: TcxLabel;
    RzLabel52: TcxLabel;
    RzLabel53: TcxLabel;
    RzLabel54: TcxLabel;
    RzLabel55: TcxLabel;
    RzLabel56: TcxLabel;
    RzLabel57: TcxLabel;
    RzLabel58: TcxLabel;
    RzLabel60: TcxLabel;
    edtDB_12: TcxDBTextEdit;
    edtDB_13: TcxDBTextEdit;
    edtDB_14: TcxDBTextEdit;
    edtDB_15: TcxDBTextEdit;
    edtDB_16: TcxDBTextEdit;
    edtDB_17: TcxDBTextEdit;
    edtDB_18: TcxDBTextEdit;
    edtDB_19: TcxDBTextEdit;
    edtDB_20: TcxDBTextEdit;
    edtDB_21: TcxDBTextEdit;
    edtDB_22: TcxDBTextEdit;
    edtDB_23: TcxDBTextEdit;
    edtDB_24: TcxDBTextEdit;
    edtDB_25: TcxDBTextEdit;
    edtDB_27: TcxDBTextEdit;
    edtDB_28: TcxDBTextEdit;
    edtDB_29: TcxDBTextEdit;
    edtDB_30: TcxDBTextEdit;
    edtDB_31: TcxDBTextEdit;
    edtDB_32: TcxDBTextEdit;
    edtDB_39: TcxDBTextEdit;
    edtDB_40: TcxDBTextEdit;
    edtDB_34: TcxDBTextEdit;
    edtDB_37: TcxDBTextEdit;
    edtDB_35: TcxDBTextEdit;
    edtDB_38: TcxDBTextEdit;
    edtDB_41: TcxDBTextEdit;
    edtDB_42: TcxDBTextEdit;
    edtDB_43: TcxDBTextEdit;
    edtDB_44: TcxDBTextEdit;
    edtDB_45: TcxDBTextEdit;
    edtDB_46: TcxDBTextEdit;
    edtDB_47: TcxDBTextEdit;
    edtDB_48: TcxDBTextEdit;
    edtDB_49: TcxDBTextEdit;
    edtDB_33: TcxDBLookupComboBox;
    edtDB_36: TcxDBLookupComboBox;
    FrameStatusBar: TdxStatusBar;
    lDB_TONAGE: TcxDBLabel;
    cxDBLabel1: TcxDBLabel;
    cxLabel1: TcxLabel;
    edtDB_50: TcxButtonEdit;
    edtDB_51: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    procedure tbbtnSaveClick(Sender: TObject);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDB_50Click(Sender: TObject);
    procedure edtDB_51Click(Sender: TObject);
  private
    { Private declarations }
    m_CurrIDEdit: integer;
  protected
    procedure InitializeFrame; override;

    procedure LoadInfoPredpr;
    procedure LoadInfoQuarry;
  public
    { Public declarations }
    procedure InitializeModul; override;
    procedure SelectChild(const IDItemSelect: TItemSelect;const ParentControll: integer);override;

    procedure UpdateTable(const tablename: string); override;
    procedure SaveItem;
  end;

implementation

{$R *.dfm}

{ TfrmEditMachine }

procedure TfrmEditMachine.edtDB_50Click(Sender: TObject);
begin
  ///
  OpenPage('TfrmSprPredpr',self.m_IDHWND,Self,edtDB_50.Tag,SQLDataSource.DataSet.FieldByName('ID_ADVENTURE').AsInteger,rcSelect);
end;

procedure TfrmEditMachine.edtDB_51Click(Sender: TObject);
begin
  OpenPage('TfrmSprQuarry',self.m_IDHWND,Self,edtDB_51.Tag,SQLDataSource.DataSet.FieldByName('ID_QUARRY').AsInteger,rcSelect);
end;

procedure TfrmEditMachine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmEditMachine.InitializeFrame;
begin
  inherited;

  SQLDataSet.CommandText:= 'SELECT * FROM TB_MACHINE WHERE ID=:IDITEM';
  SQLDataSet.ParamCheck:= True;
  SQLDataSet.Parameters.FindParam('IDITEM').Value:= m_CurrIDEdit;
  SQLDataSet.Active:= True;
  if m_CurrIDEdit<1 then
  begin
    SQLDataSet.Insert;
  end;

  SQL_Query_model_machine.Active:= True;
  DataSource_model_teg.DataSet.Active:= True;
  DataSource_model_ted.DataSet.Active:= True;
  DataSource_type_engine.DataSet.Active:= True;
  LoadInfoPredpr;
  LoadInfoQuarry;
end;

procedure TfrmEditMachine.InitializeModul;
begin
  inherited;
  if m_CurrIDEdit<1 then
    SetCaptionForm(self,'Новый автомобиль')
  else
    SetCaptionForm(self,'Шасси № '+edtDBO_1.Text);
end;

procedure TfrmEditMachine.LoadInfoPredpr;
Var vSQLDataSet: TADOQuery;
begin
  vSQLDataSet:= TADOQuery.Create(self);
  if SQLDataSet.FieldByName('ID_ADVENTURE').AsInteger=0 then
  begin
    edtDB_50.Text:= '';
    Exit;
  end;

  Try
  vSQLDataSet.Connection:= RCDataModule.DBConn;
  vSQLDataSet.SQL.Add('SELECT * FROM TB_ADVENTURE WHERE ID=:IDITEM');
  vSQLDataSet.ParamCheck:= True;
  vSQLDataSet.Parameters.ParamByName('IDITEM').Value:= SQLDataSet.FieldByName('ID_ADVENTURE').AsInteger;
  vSQLDataSet.Open;
  if vSQLDataSet.IsEmpty then
    Exit;
  if vSQLDataSet.FindFirst then
  begin
    if Not vSQLDataSet.FieldByName('DESCR').IsNull then
      edtDB_50.Text:= vSQLDataSet.FieldByName('DESCR').AsString;
  end;
  vSQLDataSet.Close;
  Finally
     vSQLDataSet.Free;
  End;
end;

procedure TfrmEditMachine.LoadInfoQuarry;
Var vSQLDataSet: TADOQuery;
begin
  vSQLDataSet:= TADOQuery.Create(self);
  if SQLDataSet.FieldByName('ID_QUARRY').AsInteger=0 then
  begin
    edtDB_51.Text:= '';
    Exit;
  end;
  Try
  vSQLDataSet.Connection:= RCDataModule.DBConn;
  vSQLDataSet.SQL.Add('SELECT * FROM TB_QUARRY WHERE ID=:IDITEM');
  vSQLDataSet.ParamCheck:= True;
  vSQLDataSet.Parameters.ParamByName('IDITEM').Value:= SQLDataSet.FieldByName('ID_ADVENTURE').AsInteger;
  vSQLDataSet.Open;
  if vSQLDataSet.IsEmpty then
    Exit;
  if vSQLDataSet.FindFirst then
  begin
    if Not vSQLDataSet.FieldByName('DESCR').IsNull then
      edtDB_51.Text:= vSQLDataSet.FieldByName('DESCR').AsString;
  end;
  vSQLDataSet.Close;
  Finally
    vSQLDataSet.Free;
  End;
end;

procedure TfrmEditMachine.SaveItem;
Begin
  if (SQLDataSet.State=dsEdit) or (SQLDataSet.State=dsInsert) then
  begin
    SQLDataSet.FieldByName('DESCR').AsString:= '№'+Trim(edtDBO_1.Text)+' '+Trim(edtDBO_3.Text);
    SQLDataSet.Post;
    self.StartUpdateFrame;
    SendMSGUpdateTable('TB_MACHINE');
    self.EndUpdateFrame;
  end;
end;

procedure TfrmEditMachine.SelectChild(const IDItemSelect: TItemSelect;
  const ParentControll: integer);
begin
  if ParentControll=edtDB_50.Tag then
  begin
    edtDB_50.Text:= IDItemSelect.Descr;
    if SQLDataSource.State<>dsEdit Then
       SQLDataSource.Edit;
    SQLDataSource.DataSet.FieldByName('ID_ADVENTURE').Value:= IDItemSelect.IDItem;
  end
  else if ParentControll=edtDB_51.Tag then
  begin
    edtDB_51.Text:= IDItemSelect.Descr;
    if SQLDataSource.State<>dsEdit Then
       SQLDataSource.Edit;
    SQLDataSource.DataSet.FieldByName('ID_QUARRY').Value:= IDItemSelect.IDItem;
  end;
end;

procedure TfrmEditMachine.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmEditMachine.tbbtnSaveClick(Sender: TObject);
begin
  SaveItem;
end;

procedure TfrmEditMachine.UpdateTable(const tablename: string);
begin
  inherited;
  if isUpdate then
    Exit;

end;

end.
