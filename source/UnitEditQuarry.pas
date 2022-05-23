unit UnitEditQuarry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, DB, ADODB, cxCurrencyEdit, cxDBEdit, cxDropDownEdit, cxCalendar, cxGroupBox, cxMaskEdit, cxButtonEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, cxPc, RzPanel, RzButton, ExtCtrls;

type
  TframeEditQuarry = class(TframeBase)
    RzToolbar1: TRzToolbar;
    tbbtnSave: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnClose: TRzToolButton;
    cxLabel1: TcxLabel;
    cxLabel6: TcxLabel;
    edtDB_0: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    edtDB_4: TcxDBTextEdit;
    edtDB_5: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    edtDB_3: TcxDBDateEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edtDB_2: TcxDBCurrencyEdit;
    SQLDataSet: TADODataSet;
    SQLDataSource: TDataSource;
    edtDB_1: TcxButtonEdit;
    RzSpacer2: TRzSpacer;
    RzToolButton3: TRzToolButton;
    procedure edtDB_1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure tbbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  protected
    procedure InitializeFrame; override;
  public
    { Public declarations }
    procedure SelectChild(const IDItemSelect: TItemSelect;const ParentControll: integer);override;
    procedure InitializeModul; override;
    procedure SaveEdit;
  end;

var
  frameEditQuarry: TframeEditQuarry;

implementation

{$R *.dfm}

procedure TframeEditQuarry.edtDB_1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  //Click predpr
  OpenPage('TfrmSprPredpr',self.m_IDHWND,Self,edtDB_1.TAG,SQLDataSource.DataSet.FieldByName('ID').AsInteger,rcSelect);
end;


procedure TframeEditQuarry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TframeEditQuarry.InitializeFrame;
begin
  inherited;
  //
  SQLDataSet.CommandText:= 'SELECT * FROM TB_QUARRY WHERE ID=:IDITEM';
  SQLDataSet.ParamCheck:= True;
  SQLDataSet.Parameters.FindParam('IDITEM').Value:= m_CurrIDEdit;
  SQLDataSet.Active:= True;
  if m_CurrIDEdit<1 then
  begin
    SQLDataSet.Insert;
  end;
end;

procedure TframeEditQuarry.InitializeModul;
begin
  inherited;
  if (Self.Parent is TcxTabSheet) Then
  begin
     TcxTabSheet(Self.Parent).Caption:= 'Карьер '+edtDB_0.Text;
  end;
end;

procedure TframeEditQuarry.SaveEdit;
begin
  if (SQLDataSource.State=dsEdit) or (SQLDataSource.State=dsInsert) Then
  begin
    SQLDataSource.DataSet.Post;
    self.StartUpdateFrame;
    SendMSGUpdateTable('TB_QUARRY');
    self.EndUpdateFrame;
  end;
end;

procedure TframeEditQuarry.SelectChild(const IDItemSelect: TItemSelect; const ParentControll: integer);
begin
  inherited;
  if ParentControll=1 then
  begin
    edtDB_1.Text:= IDItemSelect.Descr;
    if SQLDataSource.State<>dsEdit Then
       SQLDataSource.Edit;
    SQLDataSource.DataSet.FieldByName('ID_ADVENTURE').Value:= IDItemSelect.IDItem;
  end;
end;

procedure TframeEditQuarry.tbbtnCloseClick(Sender: TObject);
begin
 CloseFrame;
end;

procedure TframeEditQuarry.tbbtnSaveClick(Sender: TObject);
begin
  SaveEdit;
end;

end.
