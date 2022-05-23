unit UnitSprCodeFaults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, RzPanel, RzButton, cxPC, ExtCtrls, cxSplitter, cxContainer,
  cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit;

type
  TfrmCodeFault = class(TframeBase)
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
    browserViewCODE: TcxGridDBColumn;
    cxDBRichEdit1: TcxDBRichEdit;
    cxSplitter1: TcxSplitter;
    procedure browserViewIDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure browserViewDblClick(Sender: TObject);
    procedure tbbtnItemNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure browserViewKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCodeFault.browserViewDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmCodeFault.browserViewIDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := $00F7EAD9;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    frmMain.ImageSmall.Draw(ACanvas.Canvas,AViewInfo.Bounds.Left, AViewInfo.Bounds.Top,1);
    ADone:= True;
end;

procedure TfrmCodeFault.browserViewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   SelectItem;
end;

procedure TfrmCodeFault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmCodeFault.InitializeFrame;
begin
  inherited;
  //
  //Инициализируем переменные
  //и также открываем датасет
  browserADOQuery.Active:=TRUE;
end;

procedure TfrmCodeFault.InitializeModul;
begin
  inherited;
  SetCaptionForm(self,'Коды отказов');
end;

procedure TfrmCodeFault.SelectItem;
Var idSelect: Integer;
    infoSelect: TItemSelect;
begin
  if browserView.Controller.FocusedRecord<>nil then
  begin
    idSelect:=browserView.Controller.FocusedRecord.Values[browserViewID.Index];
    if m_select>0 then
    begin
      infoSelect.Descr:= ''+browserView.Controller.FocusedRecord.Values[browserViewCODE.Index]+' '+
      browserView.Controller.FocusedRecord.Values[browserViewDESCR.Index];
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
      frmMain.OpenPage('TframeEditCodeFailure',0,nil,idSelect,idSelect);
    end;
  end;
end;

procedure TfrmCodeFault.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmCodeFault.tbbtnItemNewClick(Sender: TObject);
begin
  frmMain.OpenPage('TframeEditCodeFailure',0,nil,0,0);
end;

procedure TfrmCodeFault.UpdateTable(const tablename: string);
Var VarP:integer;
begin
  inherited;
  if isUpdate then
    Exit;
  if tablename='TB_CODE_FAILURE' then
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
