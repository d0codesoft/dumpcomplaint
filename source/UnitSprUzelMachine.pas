unit UnitSprUzelMachine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel,UnitFrameBase, UnitDBModul, UnitUserPWD, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, ADODB, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter,
  ComCtrls, dxtree, dxdbtree, RzButton, Menus;

type
  TframeNodeMachine = class(TframeBase)
    RzToolbar1: TRzToolbar;
    browserTreeView: TdxDBTreeView;
    cxSplitter1: TcxSplitter;
    browserDBView: TcxGridDBTableView;
    browserLevel: TcxGridLevel;
    browser: TcxGrid;
    SQLDataSourceGroup: TDataSource;
    SQLDataSourceItem: TDataSource;
    SQLQueryItem: TADOQuery;
    SQLQueryGroup: TADOQuery;
    browserDBViewID: TcxGridDBColumn;
    browserDBViewDESCR: TcxGridDBColumn;
    browserDBViewPARENT_ID: TcxGridDBColumn;
    browserDBViewISGROUP: TcxGridDBColumn;
    browserDBViewCODE: TcxGridDBColumn;
    browserDBViewINFO: TcxGridDBColumn;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnNew: TRzToolButton;
    tbbtnEdit: TRzToolButton;
    tbbtnDelete: TRzToolButton;
    SpacerSelect: TRzSpacer;
    tbbtnSelect: TRzToolButton;
    RzSpacer3: TRzSpacer;
    tbbtnFilter: TRzToolButton;
    PopupMenuGroup: TPopupMenu;
    mnuTreeViewGroup_AddNew: TMenuItem;
    mnuTreeViewGroup_Edit: TMenuItem;
    mnuTreeViewGroup_Delete: TMenuItem;
    procedure tbbtnCloseClick(Sender: TObject);
    procedure browserDBViewDblClick(Sender: TObject);
    procedure browserTreeViewDblClick(Sender: TObject);
    procedure tbbtnEditClick(Sender: TObject);
    procedure tbbtnNewClick(Sender: TObject);
    procedure SQLQueryItemBeforePost(DataSet: TDataSet);
    procedure mnuTreeViewGroup_AddNewClick(Sender: TObject);
    procedure browserTreeViewCreateNewKeyValue(Sender: TObject;
      var NewKeyValue: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure browserDBViewKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    m_idGroup: integer;
  protected
    procedure InitializeFrame; override;

    procedure FilterItems;
    procedure SelectItem;
    procedure AddNewGroup(idParent:integer);
  public
    { Public declarations }
    procedure InitializeModul; override;
    procedure UpdateTable(const tablename: string); override;
    { Public declarations }
  end;

var
  frameNodeMachine: TframeNodeMachine;

implementation

{$R *.dfm}

{ TframeNodeMachine }

procedure TframeNodeMachine.AddNewGroup(idParent: integer);
begin
  frmMain.OpenPage('TframeEditElementGroup',idParent,nil,0,0);
end;

procedure TframeNodeMachine.browserDBViewDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TframeNodeMachine.browserDBViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
    SelectItem;
end;

procedure TframeNodeMachine.browserTreeViewCreateNewKeyValue(Sender: TObject;
  var NewKeyValue: Variant);
begin
  SQLDataSourceGroup.DataSet.Insert;
  SQLDataSourceGroup.DataSet.FieldByName('ISGROUP').AsBoolean:=true;
  if browserTreeView.DBSelected<>nil Then
  begin
    m_idGroup:= browserTreeView.DBSelected.KeyFieldValue;
    if m_idGroup=1 then
      m_idGroup:= 0;
    SQLDataSourceGroup.DataSet.FieldByName('PARENT_ID').AsInteger:=m_idGroup;
  end;
  SQLDataSourceGroup.DataSet.Post;
  NewKeyValue:= SQLDataSourceGroup.DataSet.FieldByName('ID').AsInteger;
end;

procedure TframeNodeMachine.browserTreeViewDblClick(Sender: TObject);
begin
  if browserTreeView.DBSelected<>nil Then
  begin
    m_idGroup:= browserTreeView.DBSelected.KeyFieldValue;
    if m_idGroup=1 then
      m_idGroup:= 0;
    FilterItems;
  end;
end;

procedure TframeNodeMachine.FilterItems;
Var pFilter:TcxDataFilterCriteria;
begin
  pFilter:= browserDBView.DataController.Filter;
  //The filtered items
  if m_idGroup=0 then
  begin
    pFilter.BeginUpdate;
    pFilter.Active:= False;
    pFilter.EndUpdate;
  end
  else
  begin
    pFilter.BeginUpdate;
    pFilter.Root.Clear;
    pFilter.Root.BoolOperatorKind:= fboAnd;
{Если группировка по группе}
    pFilter.Root.AddItem(browserDBViewPARENT_ID,foEqual,m_idGroup,intToStr(m_idGroup));
    pFilter.Active:= True;
    pFilter.EndUpdate;
  end;
end;

procedure TframeNodeMachine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TframeNodeMachine.FormShow(Sender: TObject);
begin
  browser.SetFocus;
end;

procedure TframeNodeMachine.InitializeFrame;
begin
  inherited;
  //Сдесь инициализируем форму
  SQLQueryGroup.Open;
  SQLQueryItem.Open;
end;

procedure TframeNodeMachine.InitializeModul;
begin
  inherited;
  //а тута уже опосля инициализации
  SetCaptionForm(Self,'Каталог узлов');
end;

procedure TframeNodeMachine.mnuTreeViewGroup_AddNewClick(Sender: TObject);
begin
  //Djn ntgt
  if browserTreeView.DBSelected<>nil Then
  begin
    m_idGroup:= browserTreeView.DBSelected.KeyFieldValue;
    if m_idGroup=1 then
      m_idGroup:= 0;
    AddNewGroup(m_idGroup);
  end;
end;

procedure TframeNodeMachine.SelectItem;
Var idSelect: Integer;
    infoSelect: TItemSelect;
begin
  if browserDBView.Controller.FocusedRecord<>nil then
  begin
    idSelect:=browserDBView.Controller.FocusedRecord.Values[browserDBViewID.Index];
    if m_select>0 then
    begin
      infoSelect.Descr:= ''+browserDBView.Controller.FocusedRecord.Values[browserDBViewCODE.Index]+
      ' '+browserDBView.Controller.FocusedRecord.Values[browserDBViewDESCR.Index];
      infoSelect.IDItem:= idSelect;
      SelectChildFrame(infoSelect,self.m_IDHWND);
      if m_select=1 then
      begin
        CloseFrame;
        Exit;
      end;
    end
    else
    begin
      //frmMain.OpenPage('TfrmEditPredrp',0,nil,idSelect,idSelect);
    end;
  end;
end;

procedure TframeNodeMachine.SQLQueryItemBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('PARENT_ID').AsInteger:= m_idGroup;
  DataSet.FieldByName('ISGROUP').AsBoolean:= FALSE;
end;

procedure TframeNodeMachine.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TframeNodeMachine.tbbtnEditClick(Sender: TObject);
begin
  if browserDBView.Controller.FocusedRecord<>nil then
  begin
    browserDBView.DataController.Edit;
  end;
end;

procedure TframeNodeMachine.tbbtnNewClick(Sender: TObject);
begin
    browserDBView.DataController.Insert;
    browserDBView.DataController.Edit;
    browserDBView.Controller.EditingController.Edit.SetFocus;
end;

procedure TframeNodeMachine.UpdateTable(const tablename: string);
Var VarP: integer;
begin
  inherited;
  if isUpdate then
    Exit;

  if tablename='TB_MACHINE_ELEMENTS/GROUP' then
  begin
    VarP:= 0;
    if Not SQLQueryGroup.IsEmpty then
      VarP:= SQLQueryGroup.FieldValues['ID'];

    SQLQueryGroup.Requery();

    if VarP>0 then
      SQLQueryGroup.Locate('ID',VarP,[]);
  end;
end;

end.
