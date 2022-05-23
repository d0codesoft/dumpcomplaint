unit UnitConfigUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, RzPanel, RzButton, cxPC, ExtCtrls;

type
  TfrmConfigUser = class(TframeBase)
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
    browserViewID_USER: TcxGridDBColumn;
    browserViewUSER_NAME: TcxGridDBColumn;
    browserViewUSER_DESCR: TcxGridDBColumn;
    browserViewADMIN_FUNCTION: TcxGridDBColumn;
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

    procedure SelectedItem;
  public
    { Public declarations }
    procedure UpdateTable(const tablename: string); override;

    procedure InitializeModul; override;
  end;

implementation

{$R *.dfm}

procedure TfrmConfigUser.browserViewDblClick(Sender: TObject);
begin
  SelectedItem;
end;

procedure TfrmConfigUser.browserViewIDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := $00F7EAD9;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    frmMain.ImageSmall.Draw(ACanvas.Canvas,AViewInfo.Bounds.Left, AViewInfo.Bounds.Top,1);
    ADone:= True;
end;

procedure TfrmConfigUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmConfigUser.InitializeFrame;
begin
  inherited;
  //
  //Инициализируем переменные
  //и также открываем датасет
  browserADOQuery.Active:=TRUE;
end;

procedure TfrmConfigUser.InitializeModul;
begin
  inherited;
  SetCaptionForm(self,'Пользователи системы');
end;

procedure TfrmConfigUser.SelectedItem;
begin
  ///Not implement
end;

procedure TfrmConfigUser.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmConfigUser.tbbtnItemNewClick(Sender: TObject);
begin
  //frmMain.OpenPage('TframeEditQuarry',0,nil,0,0);
end;

procedure TfrmConfigUser.UpdateTable(const tablename: string);
Var VarP:integer;
begin
  inherited;
  if isUpdate then
    Exit;

  if tablename='TB_SYS_USER' then
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
