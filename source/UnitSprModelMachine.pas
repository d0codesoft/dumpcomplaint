unit UnitSprModelMachine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ADODB, RzPanel, RzButton, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid,cxPC, StdCtrls, ComCtrls, DBCtrls, RzDBEdit;

type
  TfrmSprModel_Machine = class(TframeBase)
    browser: TcxGrid;
    browserView: TcxGridDBTableView;
    browserLevel: TcxGridLevel;
    RzToolbar1: TRzToolbar;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnItemNew: TRzToolButton;
    tbbtnItemEdit: TRzToolButton;
    tbbtnItemDelete: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    browserADOQuery: TADOQuery;
    SqlDataSource: TDataSource;
    RzDBRichEdit1: TRzDBRichEdit;
    Splitter1: TSplitter;
    browserViewID: TcxGridDBColumn;
    browserViewDESCR: TcxGridDBColumn;
    browserViewTONNAGE: TcxGridDBColumn;
    browserViewFOTO_MACHINE: TcxGridDBColumn;
    browserViewMACHINE_TYPE_DESCR: TcxGridDBColumn;
    procedure browserViewIDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure browserViewDblClick(Sender: TObject);
    procedure browserViewKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure InitializeFrame; override;
    procedure SelectItem;
  public
    { Public declarations }
    { Public declarations }
    procedure InitializeModul;override;
    procedure UpdateTable(const tablename: string); override;

  end;

implementation

{$R *.dfm}

procedure TfrmSprModel_Machine.browserViewDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmSprModel_Machine.browserViewIDCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := $00F7EAD9;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
    frmMain.ImageSmall.Draw(ACanvas.Canvas,AViewInfo.Bounds.Left, AViewInfo.Bounds.Top,1);
    ADone:= True;
end;

procedure TfrmSprModel_Machine.browserViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
   SelectItem;
end;

procedure TfrmSprModel_Machine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmSprModel_Machine.InitializeFrame;
begin
  inherited;
  //
  //Инициализируем переменные
  //и также открываем датасет
  browserADOQuery.Active:=TRUE;
end;

procedure TfrmSprModel_Machine.InitializeModul;
begin
  inherited;
  if m_select>0 then
    SetCaptionForm(Self,'Выбор модели траспорта')
  else
    SetCaptionForm(Self,'Модели транспортных средств');
end;

procedure TfrmSprModel_Machine.SelectItem;
Var idSelect: Integer;
    infoSelect: TItemSelect;
begin
  if browserView.Controller.FocusedRecord<>nil then
  begin
    idSelect:=browserView.Controller.FocusedRecord.Values[browserViewID.Index];
    if m_select>0 then
    begin
      infoSelect.Descr:= ''+browserView.Controller.FocusedRecord.Values[browserViewID.Index];
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
      //frmMain.OpenPage('TframeEditCodeFailure',0,nil,idSelect,idSelect);
    end;
  end;
end;

procedure TfrmSprModel_Machine.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmSprModel_Machine.UpdateTable(const tablename: string);
Var VarP: integer;
begin
  inherited;
  if isUpdate then
    Exit;

  if tablename='TB_MODEL_MACHINE' then
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
