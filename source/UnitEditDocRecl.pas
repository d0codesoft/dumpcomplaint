unit UnitEditDocRecl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul,UnitProgramSetings, UnitUserPWD, cxMemo, cxRichEdit,
  cxDBRichEdit, cxGroupBox, cxPC, cxDBLabel, cxMaskEdit, cxButtonEdit, cxDBEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxCurrencyEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckGroup, cxDBCheckGroup, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, RzButton,
  ExtCtrls, RzPanel, cxCalendar, cxDBExtLookupComboBox, dxmdaset, ADODB,
  cxImage, cxListBox, ExtDlgs,UnitModulFoto,UnitFormFotoView;

type
  TframeDocRecl = class(TframeBase)
    Label1: TcxLabel;
    Label2: TcxLabel;
    edtDB_1: TcxDBTextEdit;
    Label4: TcxLabel;
    ItemPageControl: TcxPageControl;
    TabSheet_1: TcxTabSheet;
    TabSheet_2: TcxTabSheet;
    TabSheet_3: TcxTabSheet;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    edtDB_10: TcxDBRichEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    edtDB_7: TcxButtonEdit;
    cxLabel9: TcxLabel;
    edtDB_8: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    edtDB_9: TcxButtonEdit;
    edtDB_3: TcxDBDateEdit;
    edtDB_4: TcxDBDateEdit;
    RzToolbar1: TRzToolbar;
    tbbtnElements_new: TRzToolButton;
    tbbtnElements_Delete: TRzToolButton;
    browsDetail: TcxGrid;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    edtDB_16: TcxDBCheckGroup;
    edtDB_11: TcxDBDateEdit;
    edtDB_12: TcxDBDateEdit;
    edtDB_13: TcxDBDateEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    edtDB_15: TcxDBRichEdit;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    RzToolbar2: TRzToolbar;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnSave: TRzToolButton;
    SQLDataSet: TADODataSet;
    SQLDataSource: TDataSource;
    edtDB_2: TcxButtonEdit;
    edtDB_5: TcxDBCurrencyEdit;
    edtDB_6: TcxDBCurrencyEdit;
    SQLVidRemonta: TdxMemData;
    SQLDataSourceVR: TDataSource;
    SQLVidRemontaID: TIntegerField;
    SQLVidRemontaDESCR: TStringField;
    edtDB_14: TcxDBLookupComboBox;
    browsDetailLevelD: TcxGridLevel;
    browsDetailTableViewD: TcxGridTableView;
    browsDetailDColumnID: TcxGridColumn;
    browsDetailDColumnDescr_Element: TcxGridColumn;
    browsDetailDColumnElement_ID: TcxGridColumn;
    browsDetailDKvo: TcxGridColumn;
    browsDetailDSerialOut: TcxGridColumn;
    browsDetailDSerialIn: TcxGridColumn;
    TabSheet_4: TcxTabSheet;
    RzToolbar3: TRzToolbar;
    tbbtnFoto_new: TRzToolButton;
    tbbtnFoto_delete: TRzToolButton;
    SQLQueryFoto: TADOQuery;
    SQLDataSourceFoto: TDataSource;
    tbbtnPrint: TRzToolButton;
    OpenPictureDlg: TOpenPictureDialog;
    FotoList: TcxListBox;
    labelPredpr: TcxLabel;
    procedure edtDB_2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtDB_7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDB_9PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SQLQueryTableBeforePost(DataSet: TDataSet);
    procedure tbbtnElements_newClick(Sender: TObject);
    procedure tbbtnElements_DeleteClick(Sender: TObject);
    procedure tbbtnFoto_newClick(Sender: TObject);
    procedure tbbtnSaveClick(Sender: TObject);
    procedure FotoListDblClick(Sender: TObject);
    procedure tbbtnFoto_deleteClick(Sender: TObject);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure browsDetailDColumnDescr_ElementPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
    m_ManagerFoto:TRcListFoto;
    m_ManagerFotoView: TFormFotoView;
  protected
    procedure InitializeFrame; override;

    procedure LoadInfoelemet_Failure;
    procedure LoadInfoCodeFailure;
    procedure RefreshItemMachine;
    procedure LoadFoto;
    procedure LoadElementZamena;
    procedure SaveElementZamena;
    procedure AddNewFoto;
    procedure ChangeFotoDraw;

    procedure InitializeFotoView;
    procedure CloseFotoView;
    procedure SetviewFoto(Index:integer);
    procedure DeleteFotoList;
  public
    { Public declarations }
    procedure SelectChild(const IDItemSelect: TItemSelect;const ParentControll: integer);override;
    procedure InitializeModul; override;
    procedure SaveEdit;

    procedure FotoCloseWindow;
  end;

var
  frameDocRecl: TframeDocRecl;

implementation

{$R *.dfm}
USes jpeg;

{ TframeDocRecl }

procedure TframeDocRecl.AddNewFoto;
Var i: integer;
begin
  if OpenPictureDlg.Execute Then
  begin
    if OpenPictureDlg.Files.Count>0 Then
    begin
      for i := 0 to OpenPictureDlg.Files.Count - 1 do
      begin
        if m_ManagerFoto.AddFotoFromFile(OpenPictureDlg.Files.Strings[i]) Then
          FotoList.AddItem(ExtractFileName(OpenPictureDlg.Files.Strings[i]),nil);
      end;
    end
    else
    begin
      if m_ManagerFoto.AddFotoFromFile(OpenPictureDlg.FileName) Then
        FotoList.AddItem(ExtractFileName(OpenPictureDlg.FileName),nil);
    end;
  end;
end;

procedure TframeDocRecl.browsDetailDColumnDescr_ElementPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
Var ind: integer;
begin
  //Select Machine
  if browsDetailTableViewD.Controller.FocusedRecord<>nil then
  begin
    ind:= 0;
    if browsDetailTableViewD.Controller.FocusedRecord.Values[browsDetailDColumnElement_ID.Index]<>Null Then
      ind:=browsDetailTableViewD.Controller.FocusedRecord.Values[browsDetailDColumnElement_ID.Index];
    m_activeControll:= BrowsDetail;
    OpenPage('TframeNodeMachine',0,Self,10,ind,rcSelect);
  end;
end;

procedure TframeDocRecl.ChangeFotoDraw;
begin
 if FotoList.ItemIndex<0 Then
    Exit;
   Self.SetviewFoto(FotoList.ItemIndex+1);
end;

procedure TframeDocRecl.CloseFotoView;
begin
  if m_ManagerFotoView=nil then
    Exit;
  m_ManagerFotoView.Close;
  m_ManagerFotoView.Free;
end;

procedure TframeDocRecl.DeleteFotoList;
begin
 if FotoList.ItemIndex<0 Then
    Exit;
 if m_ManagerFotoView<>nil then
 begin
   if m_ManagerFotoView.GetCurrentFotoIndex=FotoList.ItemIndex+1 then
   begin
      m_ManagerFotoView.Close;
   end;
 end;
 m_ManagerFoto.DeleteFoto(FotoList.ItemIndex+1);
end;

procedure TframeDocRecl.edtDB_2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //Select Machine
  OpenPage('TFrmeSprBelaz',self.m_IDHWND,Self,edtDB_2.TAG,SQLDataSource.DataSet.FieldByName('MACHINE_ID').AsInteger,rcSelect);
end;

procedure TframeDocRecl.edtDB_7PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //Select uzel
  m_activeControll:= edtDB_7;
  OpenPage('TframeNodeMachine',0,Self,edtDB_7.TAG,SQLDataSource.DataSet.FieldByName('FAILUR_ELEMENTS_ID').AsInteger,rcSelect);
end;

procedure TframeDocRecl.edtDB_9PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  m_activeControll:= edtDB_9;
  OpenPage('TfrmCodeFault',0,Self,edtDB_9.TAG,SQLDataSource.DataSet.FieldByName('CODE_FAILURE_ID').AsInteger,rcSelect);
end;

procedure TframeDocRecl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseFotoView;
  m_ManagerFoto.Free;
  Action:= caFree;
end;

procedure TframeDocRecl.FotoCloseWindow;
begin
  //
  m_ManagerFotoView:= nil;
end;

procedure TframeDocRecl.FotoListDblClick(Sender: TObject);
begin
  ChangeFotoDraw;
end;

procedure TframeDocRecl.InitializeFotoView;
begin
  if m_ManagerFotoView=nil then
    m_ManagerFotoView:= TFormFotoView.Create(Self);
  m_ManagerFotoView.Caption:= 'Фото по реклмаци на '+edtDB_2.Text;
  m_ManagerFotoView.SetProvaderFoto(m_ManagerFoto);
  m_ManagerFotoView.SetFoto(1);
  m_ManagerFotoView.Visible:= True;
end;

procedure TframeDocRecl.InitializeFrame;
begin
  inherited;
  //Bybdsd
  SQLDataSet.CommandText:= 'SELECT * FROM TB_RECLAMATION WHERE ID=:IDITEM';
  SQLDataSet.ParamCheck:= True;
  SQLDataSet.Parameters.FindParam('IDITEM').Value:= m_CurrIDEdit;
  SQLDataSet.Active:= True;

  if m_CurrIDEdit<1 then
  begin
    SQLDataSet.Insert;
  end;

  SQLVidRemonta.Active:= True;
  SQLDataSet.Active:= True;
  RefreshItemMachine;
  LoadInfoCodeFailure;
  LoadInfoelemet_Failure;
  LoadElementZamena;
  LoadFoto;
end;

procedure TframeDocRecl.InitializeModul;
begin
  inherited;
  SetCaptionForm(Self,'Формуляр рекламационного дела');
end;

procedure TframeDocRecl.LoadElementZamena;
Var indexRecord: integer;
    SQLQueryTable : TADOQuery;
begin
  //Здеся или тута все сохраним
  SQLQueryTable:= TADOQuery.Create(Self);
  SQLQueryTable.Connection:= RCDataModule.DBConn;
  //
  //Пока остановимся на том что я немогу до конца понять как удалить все
  //рекорды одновременно
  //browsDetailTableViewD.Controller.SelectAllRecords;
  //browsDetailTableViewD.Controller.DeleteSelection;
  browsDetailTableViewD.DataController.SetRecordCount(0);

  SQLQueryTable.Active:= False;
  SQLQueryTable.SQL.Clear;
  SQLQueryTable.SQL.Add('SELECT * FROM TB_QUERY_RECLAMATION_TABLE');
  SQLQueryTable.ParamCheck:= True;
  SQLQueryTable.Parameters.Items[0].Value:= SQLDataSet.FieldByName('ID').AsInteger;
  SQLQueryTable.Active:= True;
  if SQLQueryTable.IsEmpty then
    Exit;

  SQLQueryTable.FindFirst;
  While NOT SQLQueryTable.Eof Do
  begin
    indexRecord:= browsDetailTableViewD.DataController.AppendRecord;
    browsDetailTableViewD.DataController.SetValue(indexRecord,browsDetailDColumnID.Index,SQLQueryTable.FieldByName('ID').asInteger);

    if Not SQLQueryTable.FieldByName('QUANTITY').IsNull then
    browsDetailTableViewD.DataController.SetValue(indexRecord,browsDetailDKvo.Index,SQLQueryTable.FieldByName('QUANTITY').AsFloat);

    if Not SQLQueryTable.FieldByName('WORKS_NUBBER_RECIVED').IsNull then
    browsDetailTableViewD.DataController.SetValue(indexRecord,browsDetailDSerialOut.Index,SQLQueryTable.FieldByName('WORKS_NUBBER_RECIVED').asString);

    if Not SQLQueryTable.FieldByName('WORKS_NUMBER_MOUNT').IsNull then
    browsDetailTableViewD.DataController.SetValue(indexRecord,browsDetailDSerialIn.Index,SQLQueryTable.FieldByName('WORKS_NUMBER_MOUNT').asString);

    if Not SQLQueryTable.FieldByName('MACHINE_ELEMENTS_DESCR').IsNull then
    browsDetailTableViewD.DataController.SetValue(indexRecord,browsDetailDColumnDescr_Element.Index,SQLQueryTable.FieldByName('MACHINE_ELEMENTS_DESCR').asString);

    if Not SQLQueryTable.FieldByName('ELEMENT_ID').IsNull then
    browsDetailTableViewD.DataController.SetValue(indexRecord,browsDetailDColumnElement_ID.Index,SQLQueryTable.FieldByName('ELEMENT_ID').asInteger);

    SQLQueryTable.Next;
  end;
  SQLQueryTable.Active:= False;
  SQLQueryTable.Free;
end;

procedure TframeDocRecl.LoadFoto;
Var i,iCount: integer;
begin
  if m_CurrIDEdit<1 then
  begin
    m_ManagerFoto:= TRcListFoto.Create();
    Exit;
  end
  else
    m_ManagerFoto:= TRcListFoto.Create(SQLDataSet.FieldByName('ID').AsInteger,GetProgramInfo(rcInfoDirFoto));

  iCount:=  m_ManagerFoto.GetCountFoto;
  for i:=1 To iCount Do
  begin
      FotoList.AddItem(m_ManagerFoto.GetFotoFileName(i),nil);
  end;
end;

procedure TframeDocRecl.LoadInfoCodeFailure;
Var vSQLQuery: TADOQuery;
begin
   SQLDataSet.FieldByName('CODE_FAILURE_ID').IsNull;
  if SQLDataSet.FieldByName('CODE_FAILURE_ID').AsInteger=0 then
      Exit;

  vSQLQuery:= TADOQuery.Create(Self);
  vSQLQuery.Connection:= RCDataModule.DBConn;
  vSQLQuery.SQL.Add('SELECT * FROM TB_CODE_FAILURE WHERE ID=:IDITEM');
  vSQLQuery.ParamCheck:= True;
  vSQLQuery.Parameters.Items[0].Value:= SQLDataSet.FieldByName('CODE_FAILURE_ID').AsInteger;
  vSQLQuery.Open;
  if Not vSQLQuery.IsEmpty then
  begin
    vSQLQuery.FindFirst;
    if not vSQLQuery.FieldByName('CODE').isNull then
    begin
      edtDB_9.Text:= vSQLQuery.FieldByName('CODE').AsString+' ';
    end;
    if not vSQLQuery.FieldByName('DESCR').isNull then
    begin
      edtDB_9.Text:= edtDB_9.Text + vSQLQuery.FieldByName('DESCR').AsString;
    end;
  end;
  vSQLQuery.Close;
  vSQLQuery.Free;
end;

procedure TframeDocRecl.LoadInfoelemet_Failure;
Var vSQLQuery: TADOQuery;
begin
   SQLDataSet.FieldByName('FAILUR_ELEMENTS_ID').IsNull;
  if SQLDataSet.FieldByName('FAILUR_ELEMENTS_ID').AsInteger=0 then
      Exit;

  vSQLQuery:= TADOQuery.Create(Self);
  vSQLQuery.Connection:= RCDataModule.DBConn;
  vSQLQuery.SQL.Add('SELECT * FROM TB_MACHINE_ELEMENTS WHERE ID=:IDITEM');
  vSQLQuery.ParamCheck:= True;
  vSQLQuery.Parameters.Items[0].Value:= SQLDataSet.FieldByName('FAILUR_ELEMENTS_ID').AsInteger;
  vSQLQuery.Open;
  if Not vSQLQuery.IsEmpty then
  begin
    vSQLQuery.FindFirst;
    if not vSQLQuery.FieldByName('CODE').isNull then
    begin
      edtDB_7.Text:= vSQLQuery.FieldByName('CODE').AsString+' ';
    end;
    if not vSQLQuery.FieldByName('DESCR').isNull then
    begin
      edtDB_7.Text:= edtDB_7.Text + vSQLQuery.FieldByName('DESCR').AsString;
    end;
  end;
  vSQLQuery.Close;
  vSQLQuery.Free;
end;

procedure TframeDocRecl.RefreshItemMachine;
Var vSQLQuery: TADOQuery;
begin
  edtDB_2.Text:= '';
  labelPredpr.Caption:= '';

  if SQLDataSet.FieldByName('MACHINE_ID').IsNull then
    Exit;

  if SQLDataSet.FieldByName('MACHINE_ID').asInteger=0 then
    Exit;


  vSQLQuery:= TADOQuery.Create(Self);
  vSQLQuery.Connection:= RCDataModule.DBConn;
  vSQLQuery.SQL.Add('SELECT * FROM TB_QUERY_MACHINE');
  vSQLQuery.ParamCheck:= True;
  vSQLQuery.Parameters.Items[0].Value:=SQLDataSet.FieldByName('MACHINE_ID').AsInteger;
  vSQLQuery.Active:= True;
  if Not vSQLQuery.IsEmpty then
  begin
    if vSQLQuery.FindFirst Then
    begin
      if Not vSQLQuery.FieldByName('MACHINE_DESCR').IsNull then
        edtDB_2.Text:= vSQLQuery.FieldByName('MACHINE_DESCR').AsString;
      if Not vSQLQuery.FieldByName('ADVENTURE_DESCR').IsNull then
        labelPredpr.Caption:= vSQLQuery.FieldByName('ADVENTURE_DESCR').AsString;
      if Not vSQLQuery.FieldByName('ID_ADVENTURE').IsNull then
      begin
        if SQLDataSet.FieldByName('ADVENTURE_ID').AsInteger<>vSQLQuery.FieldByName('ID_ADVENTURE').AsInteger then
        begin
          if Not((SQLDataSet.State=dsEdit) or (SQLDataSet.State=dsInsert)) then
             SQLDataSet.Edit;
          SQLDataSet.FieldByName('ADVENTURE_ID').AsInteger:= vSQLQuery.FieldByName('ID_ADVENTURE').AsInteger;
        end;
      end;
    end;
  end;
  vSQLQuery.Active:=False;
  vSQLQuery.Free;
end;

procedure TframeDocRecl.SaveEdit;
begin
  //Сохраним данные
  if (SQLDataSet.State=dsEdit) or (SQLDataSet.State=dsInsert) then
    SQLDataSet.Post;
  m_CurrIDEdit:= SQLDataSet.FieldByName('ID').AsInteger;
  SaveElementZamena;
  if m_CurrIDEdit<1 Then
     m_ManagerFoto.SaveData(SQLDataSet.FieldByName('ID').AsInteger,GetProgramInfo(rcInfoDirFoto))
  else
     m_ManagerFoto.SaveData;
  SendMSGUpdateTable('TB_RECLAMATION');
end;

procedure TframeDocRecl.SaveElementZamena;
Var i:integer;
    SQLQueryTable : TADOQuery;
begin
  //Здеся или тута все сохраним
  RCDataModule.DBConn.BeginTrans;
  SQLQueryTable:= TADOQuery.Create(Self);
  SQLQueryTable.Connection:= RCDataModule.DBConn;
  SQLQueryTable.SQL.Clear;
  SQLQueryTable.SQL.Add('DELETE FROM TB_RECLAMATION_TABLE WHERE RECLAMATION_ID=:IDITEM');
  SQLQueryTable.ParamCheck:= True;
  SQLQueryTable.Parameters.Items[0].Value:= SQLDataSet.FieldByName('ID').AsInteger;
  SQLQueryTable.ExecSQL;

  SQLQueryTable.SQL.Clear;
  SQLQueryTable.SQL.Add('INSERT INTO TB_RECLAMATION_TABLE (RECLAMATION_ID,ELEMENT_ID,QUANTITY,WORKS_NUBBER_RECIVED,WORKS_NUMBER_MOUNT)');
  SQLQueryTable.SQL.Add('VALUES (:IDELEMENT,:ELEMENTID,:KVO,:NUM1,:NUM2)');
  SQLQueryTable.ParamCheck:= True;
  for i:=1 To browsDetailTableViewD.DataController.RecordCount Do
  begin
    SQLQueryTable.Parameters.Items[0].DataType:= ftInteger;
    SQLQueryTable.Parameters.Items[0].Value:= SQLDataSet.FieldByName('ID').AsInteger;
    SQLQueryTable.Parameters.Items[1].DataType:= ftInteger;
    SQLQueryTable.Parameters.Items[1].Value:= browsDetailTableViewD.DataController.GetValue(i-1,browsDetailDColumnElement_ID.Index);
    SQLQueryTable.Parameters.Items[2].Value:= browsDetailTableViewD.DataController.GetValue(i-1,browsDetailDKvo.Index);
    SQLQueryTable.Parameters.Items[3].Value:= browsDetailTableViewD.DataController.GetValue(i-1,browsDetailDSerialOut.Index);
    SQLQueryTable.Parameters.Items[4].Value:= browsDetailTableViewD.DataController.GetValue(i-1,browsDetailDSerialIn.Index);
    SQLQueryTable.ExecSQL;
  end;
  SQLQueryTable.Free;
  RCDataModule.DBConn.CommitTrans;
end;

procedure TframeDocRecl.SelectChild(const IDItemSelect: TItemSelect;
  const ParentControll: integer);
begin
  inherited;
  //А сдеся проверим часто нам передают кроме привета
  if ParentControll=edtDB_2.Tag then
  begin
    edtDB_2.Text:= IDItemSelect.Descr;
    if SQLDataSource.State<>dsEdit Then
       SQLDataSource.Edit;
    SQLDataSet.FieldByName('MACHINE_ID').Value:= IDItemSelect.IDItem;
    RefreshItemMachine;
  end
  else if ParentControll=edtDB_7.Tag then
  begin
    edtDB_7.Text:= IDItemSelect.Descr;
    if SQLDataSource.State<>dsEdit Then
       SQLDataSource.Edit;
    SQLDataSet.FieldByName('FAILUR_ELEMENTS_ID').Value:= IDItemSelect.IDItem;
    //RefreshItemMachine;
  end
  else if ParentControll=edtDB_9.Tag then
  begin
    edtDB_9.Text:= IDItemSelect.Descr;
    if SQLDataSource.State<>dsEdit Then
       SQLDataSource.Edit;
    SQLDataSet.FieldByName('CODE_FAILURE_ID').Value:= IDItemSelect.IDItem;
    //RefreshItemMachine;
  end
  else if ParentControll=10 then
  begin
    if browsDetailTableViewD.Controller.FocusedRecord<>nil then
    begin
      browsDetailTableViewD.Controller.FocusedRecord.Values[browsDetailDColumnElement_ID.Index]:=IDItemSelect.IDItem;
      browsDetailTableViewD.Controller.FocusedRecord.Values[browsDetailDColumnDescr_Element.Index]:=IDItemSelect.Descr;
    end;
  end;
end;

procedure TframeDocRecl.SetviewFoto(Index: integer);
begin
  if m_ManagerFotoView=nil then
    InitializeFotoView;
  m_ManagerFotoView.SetFoto(Index);
end;

procedure TframeDocRecl.SQLQueryTableBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('RECLAMATION_ID').AsInteger:= SQLDataSet.FieldByName('ID').AsInteger;
end;

procedure TframeDocRecl.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TframeDocRecl.tbbtnElements_DeleteClick(Sender: TObject);
begin
  if browsDetailTableViewD.Controller.FocusedRecord<>nil Then
  begin
    browsDetailTableViewD.DataController.DeleteRecord(browsDetailTableViewD.DataController.FocusedRecordIndex);
  end;
end;

procedure TframeDocRecl.tbbtnElements_newClick(Sender: TObject);
Var ind: integer;
begin
  Ind:= browsDetailTableViewD.DataController.AppendRecord;
  browsDetailTableViewD.DataController.SetValue(ind,browsDetailDColumnID.Index,browsDetailTableViewD.DataController.RecordCount);
  //browsDetailTableViewD.DataController.SetValue(ind,browsDetailDKvo.Index,browsDetailTableViewD.DataController.RecordCount);
//  browsDetailTableViewD.DataController.Post;
  //browsDetailTableViewD.Controller.
  //browsDetailTableViewD.Controller.FocusedRecord.Values[]:=browsDetailTableViewD.Controller.Create();
  //browsDetailTableViewD.DataController.Post;
  //browsDetailTableViewD.DataController.Edit;
end;

procedure TframeDocRecl.tbbtnFoto_deleteClick(Sender: TObject);
begin
  DeleteFotoList;
end;

procedure TframeDocRecl.tbbtnFoto_newClick(Sender: TObject);
begin
  //Add new foto
  AddNewFoto;
end;

procedure TframeDocRecl.tbbtnSaveClick(Sender: TObject);
begin
  Self.SaveEdit;
end;

end.
