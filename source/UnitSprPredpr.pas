unit UnitSprPredpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, RzButton, ExtCtrls, RzPanel,UnitUserPWD,UnitDBModul, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,cxPC, ADODB;

type
  TfrmSprPredpr = class(TframeBase)
    RzToolbar1: TRzToolbar;
    tbbtnItemNew: TRzToolButton;
    tbbtnItemEdit: TRzToolButton;
    tbbtnItemDelete: TRzToolButton;
    browserDBSprView: TcxGridDBTableView;
    browserSpr: TcxGridLevel;
    browser: TcxGrid;
    RzSpacer1: TRzSpacer;
    tbbtnItemSort: TRzToolButton;
    RzSpacer2: TRzSpacer;
    tbbtnItemFilter: TRzToolButton;
    SQLQuerySpr: TADOQuery;
    SQLDataSource: TDataSource;
    browserDBSprViewID: TcxGridDBColumn;
    browserDBSprViewDESCR: TcxGridDBColumn;
    browserDBSprViewADRESS: TcxGridDBColumn;
    browserDBSprViewTEL: TcxGridDBColumn;
    browserDBSprViewDIRECTOR: TcxGridDBColumn;
    RzToolButton1: TRzToolButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure browserDBSprViewIDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure browserDBSprViewDblClick(Sender: TObject);
    procedure tbbtnItemNewClick(Sender: TObject);
    procedure tbbtnItemEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzToolButton1Click(Sender: TObject);
    procedure browserDBSprViewKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure InitializeFrame; override;

    procedure SelectItem;
  public
    { Public declarations }
    procedure InitializeModul; override;
    procedure AddNewItem;
  end;

implementation

{$R *.dfm}

procedure TfrmSprPredpr.AddNewItem;
begin
  //frmMain.OpenPage('TfrmEditPredrp',0,nil,0,0);
  frmMain.OpenPage('TfrmEditPredrp',0,nil,0,0);
  //SQLDataSource.DataSet.Append;
end;

procedure TfrmSprPredpr.browserDBSprViewDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmSprPredpr.browserDBSprViewIDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := $00F7EAD9;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    frmMain.ImageSmall.Draw(ACanvas.Canvas,AViewInfo.Bounds.Left, AViewInfo.Bounds.Top,1);
    ADone:= True;
end;

procedure TfrmSprPredpr.browserDBSprViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
   SelectItem;
end;

procedure TfrmSprPredpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmSprPredpr.InitializeFrame;
begin
  inherited;
  SQLQuerySpr.Active:=TRUE;
end;

procedure TfrmSprPredpr.InitializeModul;
begin
  inherited;
  if m_select>0 then
    SetCaptionForm(Self,'Выбор предприятия')
  else
    SetCaptionForm(Self,'Предприятия');
end;

procedure TfrmSprPredpr.RzToolButton1Click(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmSprPredpr.SelectItem;
Var idSelect: Integer;
    infoSelect: TItemSelect;
begin
  if browserDBSprView.Controller.FocusedRecord<>nil then
  begin
    idSelect:=browserDBSprView.Controller.FocusedRecord.Values[browserDBSprViewID.Index];
    if m_select>0 then
    begin
      infoSelect.Descr:= browserDBSprView.Controller.FocusedRecord.Values[browserDBSprViewDESCR.Index];
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
      frmMain.OpenPage('TfrmEditPredrp',0,nil,idSelect,idSelect);
    end;
  end;
end;

procedure TfrmSprPredpr.tbbtnItemEditClick(Sender: TObject);
begin
  //SQLDataSource.DataSet.Post;
end;

procedure TfrmSprPredpr.tbbtnItemNewClick(Sender: TObject);
begin
  //
  AddNewItem;
end;

end.
