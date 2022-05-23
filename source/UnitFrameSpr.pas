unit UnitFrameSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul,UnitUserPWD, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, RzButton, ExtCtrls,
  RzPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC, ADODB;

type
  TFrmeSprBelaz = class(TframeBase)
    browserDBView: TcxGridDBTableView;
    browserLevel: TcxGridLevel;
    browser: TcxGrid;
    ToolbarSpr: TRzToolbar;
    tbtnNewItem: TRzToolButton;
    tbtnEditItem: TRzToolButton;
    tbtnDelItem: TRzToolButton;
    tbtbFilterItem: TRzToolButton;
    browserDataSource: TDataSource;
    browserDBViewMACHINE_ID: TcxGridDBColumn;
    browserDBViewMACHINE_DESCR: TcxGridDBColumn;
    browserDBViewMODEL_ID: TcxGridDBColumn;
    browserDBViewMACHINE_NUMBER_CHASSIS: TcxGridDBColumn;
    browserDBViewMACHINE_NUMBER_GARAGE: TcxGridDBColumn;
    browserDBViewMACHINE_DATE_IN_EXPOITATION: TcxGridDBColumn;
    browserDBViewMACHINE_TYPE_PROCESS: TcxGridDBColumn;
    browserDBViewTYPE_ENGINE_ID: TcxGridDBColumn;
    browserDBViewMACHINE_NUMBER_ENGINE: TcxGridDBColumn;
    browserDBViewMACHINE_DATE_PRODUCTION_ENGINE: TcxGridDBColumn;
    browserDBViewMACHINE_TYPE_GUARANTEE: TcxGridDBColumn;
    browserDBViewMACHINE_GUARANTEE: TcxGridDBColumn;
    browserDBViewMACHINE_NUMBER_CAB_CAR_FRAME: TcxGridDBColumn;
    browserDBViewMACHINE_NUMBER_CAB: TcxGridDBColumn;
    browserDBViewMACHINE_MACHINE_RUN: TcxGridDBColumn;
    browserDBViewTB_MODEL_MACHINEID: TcxGridDBColumn;
    browserDBViewMACHINE_MODEL_DESCR: TcxGridDBColumn;
    browserDBViewMACHINE_MODEL_TONNAGE: TcxGridDBColumn;
    browserDBViewTYPE_MACHINE: TcxGridDBColumn;
    browserDBViewTB_TYPE_ENGINEID: TcxGridDBColumn;
    browserDBViewMACHINE_ENGINE_DESCR: TcxGridDBColumn;
    browserDBViewTB_MACHINE_TYPEID: TcxGridDBColumn;
    browserDBViewMACHINE_TYPE_DESCR: TcxGridDBColumn;
    browserDBViewID_ADVENTURE: TcxGridDBColumn;
    browserDBViewID_QUARRY: TcxGridDBColumn;
    browserDBViewMACHINE_QUARRY_DESCR: TcxGridDBColumn;
    browserDBViewMACHINE_ADVENTURE_DESCR: TcxGridDBColumn;
    browserADOQuery: TADOQuery;
    RzSpacer1: TRzSpacer;
    tbbtnClose: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzToolButton1: TRzToolButton;
    procedure browserDBViewMACHINE_IDCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure tbtnNewItemClick(Sender: TObject);
    procedure browserDBViewDblClick(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure browserDBViewKeyPress(Sender: TObject; var Key: Char);
  private
    function GetCurrentIDItem: integer;
    procedure SetCurrentIDItem(const Value: integer);
    { Private declarations }
  protected
    procedure InitializeFrame; override;

    procedure SelectItem;
  public
    procedure InitializeModul; override;
    procedure UpdateTable(const tablename: string); override;

    { Public declarations }
    function AddNewItem: Boolean;
    function EditItemFromID(const IDItem: integer): Boolean;
    function DeleteItemFromID(const IDItem: integer) : Boolean;

    property CurrentIDItem: integer read GetCurrentIDItem write SetCurrentIDItem;
  end;

implementation

{$R *.dfm}

{ TFrmeSprBelaz }

function TFrmeSprBelaz.AddNewItem: Boolean;
begin
  //
  frmMain.OpenPage('TfrmEditMachine',0,nil,0,0);
  Result:= True;
end;

procedure TFrmeSprBelaz.browserDBViewDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TFrmeSprBelaz.browserDBViewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   SelectItem;
end;

procedure TFrmeSprBelaz.browserDBViewMACHINE_IDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Style := bsSolid;
  ACanvas.Canvas.Brush.Color := $00F7EAD9;
  ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  frmMain.ImageSmall.Draw(ACanvas.Canvas,AViewInfo.Bounds.Left, AViewInfo.Bounds.Top,1);
  ADone:= True;
  //Del:= Sender.DataController.GetValue(AViewInfo.GridRecord.Index,XTableViewDEL.Index);
  //SetBkMode(ACanvas.Handle, TRANSPARENT);
  // Bounds.Top, Bounds.Left, Bounds.Bottom and Bounds.Right
end;

function TFrmeSprBelaz.DeleteItemFromID(const IDItem: integer): Boolean;
begin
  Result:= True;
end;

function TFrmeSprBelaz.EditItemFromID(const IDItem: integer): Boolean;
begin
  Result:= True;
end;

procedure TFrmeSprBelaz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

function TFrmeSprBelaz.GetCurrentIDItem: integer;
begin
  Result:= -1;
  if Not browserADOQuery.Active then
    Exit;

  if (Not browserADOQuery.Eof) and (NOT browserADOQuery.Bof) then
    Result:= browserADOQuery.FieldByName('MACHINE_ID').AsInteger;
end;

procedure TFrmeSprBelaz.InitializeFrame;
begin
  inherited;
  //
  //Инициализируем переменные
  //и также открываем датасет
  browserADOQuery.Active:=TRUE;
end;

procedure TFrmeSprBelaz.InitializeModul;
begin
  inherited;
  SetCaptionForm(Self,'Справочник автотранспорта');
end;

procedure TFrmeSprBelaz.RzToolButton1Click(Sender: TObject);
begin
  browserADOQuery.Requery();
end;

procedure TFrmeSprBelaz.SelectItem;
Var idSelect: Integer;
    infoSelect: TItemSelect;
begin
  if browserDBView.Controller.FocusedRecord<>nil then
  begin
    idSelect:=browserDBView.Controller.FocusedRecord.Values[browserDBViewMACHINE_ID.Index];
    if m_select>0 then
    begin
      infoSelect.Descr:= browserDBView.Controller.FocusedRecord.Values[browserDBViewMACHINE_DESCR.Index];
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
      frmMain.OpenPage('TfrmEditMachine',0,nil,idSelect,idSelect);
    end;
  end;
end;

procedure TFrmeSprBelaz.SetCurrentIDItem(const Value: integer);
begin
  if (Value<0) or (Not browserADOQuery.Active) then
     Exit;
  browserADOQuery.Locate('MACHINE_ID',Value,[]);
end;

procedure TFrmeSprBelaz.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TFrmeSprBelaz.tbtnNewItemClick(Sender: TObject);
begin
  self.AddNewItem;
end;

procedure TFrmeSprBelaz.UpdateTable(const tablename: string);
Var varP: integer;
begin
  inherited;
  if isUpdate then
    Exit;

  if tablename='TB_MACHINE' then
  begin
    VarP:= 0;
    if Not browserADOQuery.IsEmpty then
      VarP:= browserADOQuery.FieldValues['MACHINE_ID'];

    browserADOQuery.Requery();

    if VarP>0 then
      browserADOQuery.Locate('MACHINE_ID',VarP,[]);
  end;
end;

end.
