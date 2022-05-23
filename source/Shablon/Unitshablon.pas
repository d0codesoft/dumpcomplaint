unit UnitSprQuarry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, RzPanel, RzButton, cxPC, ExtCtrls;

type
  TfrmShablon = class(TframeBase)
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
    browserView: TcxGridDBTableView;
    browserLevel: TcxGridLevel;
    browser: TcxGrid;
    browserViewID: TcxGridDBColumn;
    browserViewDESCR: TcxGridDBColumn;
    browserViewCOUNTRY: TcxGridDBColumn;
    browserViewREGION: TcxGridDBColumn;
    browserViewDATE_COMMENCEMENT_WORKS: TcxGridDBColumn;
    browserViewDEPTH_QUARRY: TcxGridDBColumn;
    browserViewID_ADVENTURE: TcxGridDBColumn;
    browserViewADVENTURE_DESCR: TcxGridDBColumn;
    procedure browserViewIDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure browserViewDblClick(Sender: TObject);
    procedure tbbtnItemNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure InitializeFrame; override;
  public
    { Public declarations }
    procedure UpdateTable(const tablename: string); override;

    procedure InitializeModul; override;
  end;

implementation

{$R *.dfm}

procedure TfrmShablon.browserViewDblClick(Sender: TObject);
Var idSelect: Integer;
begin
  if Not (browserView.Controller.FocusedRecord=nil) then
  begin
    idSelect:=browserView.Controller.FocusedRecord.Values[browserViewID.Index];
    frmMain.OpenPage('TframeEditQuarry',0,nil,idSelect,idSelect);
  end;
end;

procedure TfrmShablon.browserViewIDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := $00F7EAD9;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    frmMain.ImageSmall.Draw(ACanvas.Canvas,AViewInfo.Bounds.Left, AViewInfo.Bounds.Top,1);
    ADone:= True;
end;

procedure TfrmShablon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmShablon.InitializeFrame;
begin
  inherited;
  //
  //Инициализируем переменные
  //и также открываем датасет
  browserADOQuery.Active:=TRUE;
end;

procedure TfrmShablon.InitializeModul;
begin
  inherited;
  SetCaptionform(Self,'');
end;

procedure TfrmShablon.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmShablon.tbbtnItemNewClick(Sender: TObject);
begin
  frmMain.OpenPage('TframeEditQuarry',0,nil,0,0);
end;

procedure TfrmShablon.UpdateTable(const tablename: string);
Var VarP:integer;
begin
  inherited;
  if isUpdate then
    Exit;

  if tablename='TB_QUARRY' then
  begin
	VarP:= 0;
	if Not browserADOQuery.isEmpty Then
		VarP:= browserADOQuery.FieldValues['ID'];
    browserADOQuery.Requery();
    if VarP<>0 Then
		browserADOQuery.Locate('ID',VarP,[]);
  end;
end;

end.
