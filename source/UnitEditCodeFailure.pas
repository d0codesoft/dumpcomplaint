unit UnitEditCodeFailure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, DB, ADODB, cxCurrencyEdit, cxDBEdit, cxDropDownEdit, cxCalendar, cxGroupBox, cxMaskEdit, cxButtonEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, cxPc, RzPanel, RzButton, ExtCtrls,
  cxMemo, cxRichEdit, cxDBRichEdit;

type
  TframeEditCodeFailure = class(TframeBase)
    RzToolbar1: TRzToolbar;
    tbbtnSave: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnClose: TRzToolButton;
    SQLDataSet: TADODataSet;
    SQLDataSource: TDataSource;
    RzSpacer2: TRzSpacer;
    RzToolButton3: TRzToolButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtDB_1: TcxDBTextEdit;
    edtDB_2: TcxDBTextEdit;
    edtDB_3: TcxDBRichEdit;
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
  frameEditQuarry: TframeEditCodeFailure;

implementation

{$R *.dfm}

procedure TframeEditCodeFailure.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TframeEditCodeFailure.InitializeFrame;
begin
  inherited;
  //
  SQLDataSet.CommandText:= 'select * from TB_CODE_FAILURE WHERE ID=:IDITEM';
  SQLDataSet.ParamCheck:= True;
  SQLDataSet.Parameters.FindParam('IDITEM').Value:= m_CurrIDEdit;
  SQLDataSet.Active:= True;
  if m_CurrIDEdit<1 then
  begin
    SQLDataSet.Insert;
  end;
end;

procedure TframeEditCodeFailure.InitializeModul;
begin
  inherited;
  if m_CurrIDEdit=0 then
    SetCaptionForm(Self,'Новый код отказа')
  else
    SetCaptionForm(Self,edtDB_1.Text);
end;

procedure TframeEditCodeFailure.SaveEdit;
begin
  if (SQLDataSource.State=dsEdit) or (SQLDataSource.State=dsInsert) Then
  begin
    SQLDataSource.DataSet.Post;
    self.StartUpdateFrame;
    SendMSGUpdateTable('TB_CODE_FAILURE');
    self.EndUpdateFrame;
  end;
end;

procedure TframeEditCodeFailure.SelectChild(const IDItemSelect: TItemSelect; const ParentControll: integer);
begin
  inherited;
end;

procedure TframeEditCodeFailure.tbbtnCloseClick(Sender: TObject);
begin
 CloseFrame;
end;

procedure TframeEditCodeFailure.tbbtnSaveClick(Sender: TObject);
begin
  SaveEdit;
end;

end.
