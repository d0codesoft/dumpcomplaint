unit UnitSprQuarry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, RzPanel, RzButton, cxPC, ExtCtrls;

type
  TfrmSprQuarry = class(TframeBase)
    FrameToolbar: TRzToolbar;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnItemNew: TRzToolButton;
    tbbtnItemEdit: TRzToolButton;
    tbbtnItemDelete: TRzToolButton;
    SqlDataSource: TDataSource;
    browserADOQuery: TADOQuery;
    RzSpacer2: TRzSpacer;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    browserDBView: TcxGridDBTableView;
    browserLevel: TcxGridLevel;
    browser: TcxGrid;
    browserDBViewID: TcxGridDBColumn;
    browserDBViewDESCR: TcxGridDBColumn;
    browserDBViewCOUNTRY: TcxGridDBColumn;
    browserDBViewREGION: TcxGridDBColumn;
    browserDBViewDATE_COMMENCEMENT_WORKS: TcxGridDBColumn;
    browserDBViewDEPTH_QUARRY: TcxGridDBColumn;
    browserDBViewID_ADVENTURE: TcxGridDBColumn;
    browserDBViewADVENTURE_DESCR: TcxGridDBColumn;
    procedure browserDBViewIDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure browserDBViewDblClick(Sender: TObject);
    procedure tbbtnItemNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure browserDBViewKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure InitializeFrame; override;
    procedure SelectItem;
  public
    { Public declarations }
    procedure UpdateTable(const tablename: string); override;

    procedure InitializeModul; override;
  end;

implementation

{$R *.dfm}

procedure TfrmSprQuarry.browserDBViewDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmSprQuarry.browserDBViewIDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := $00F7EAD9;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    frmMain.ImageSmall.Draw(ACanvas.Canvas,AViewInfo.Bounds.Left, AViewInfo.Bounds.Top,1);
    ADone:= True;
end;

procedure TfrmSprQuarry.browserDBViewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   SelectItem;
end;

procedure TfrmSprQuarry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmSprQuarry.InitializeFrame;
begin
  inherited;
  //
  //Инициализируем переменные
  //и также открываем датасет
  browserADOQuery.Active:=TRUE;
end;

procedure TfrmSprQuarry.InitializeModul;
begin
  inherited;
  SetCaptionForm(Self, 'Карьеры');
end;

procedure TfrmSprQuarry.SelectItem;
Var idSelect: Integer;
    infoSelect: TItemSelect;
begin
  if browserDBView.Controller.FocusedRecord<>nil then
  begin
    idSelect:=browserDBView.Controller.FocusedRecord.Values[browserDBViewID.Index];
    if m_select>0 then
    begin
      infoSelect.Descr:= browserDBView.Controller.FocusedRecord.Values[browserDBViewDESCR.Index];
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
      frmMain.OpenPage('TframeEditQuarry',0,nil,idSelect,idSelect);
    end;
  end;
end;

procedure TfrmSprQuarry.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmSprQuarry.tbbtnItemNewClick(Sender: TObject);
begin
  frmMain.OpenPage('TframeEditQuarry',0,nil,0,0);
end;

procedure TfrmSprQuarry.UpdateTable(const tablename: string);
Var VarP:integer;
begin
  inherited;
  if isUpdate then
    Exit;

  if tablename='TB_QUARRY' then
  begin
    VarP:= 0;
    if Not browserADOQuery.IsEmpty then
      VarP:= browserADOQuery.FieldValues['ID'];

    browserADOQuery.Requery();

    if VarP>0 then
      browserADOQuery.Locate('ID',VarP,[]);
  end;
end;

end.
