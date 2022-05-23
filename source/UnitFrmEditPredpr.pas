unit UnitFrmEditPredpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul,UnitUserPWD, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxDBEdit, DB, ADODB, RzPanel, RzButton,
  ExtCtrls;

type
  TfrmEditPredrp = class(TframeBase)
    RzToolbar1: TRzToolbar;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnSave: TRzToolButton;
    tbbtnPrint: TRzToolButton;
    SQLDataSource: TDataSource;
    SQLDataSet: TADODataSet;
    edtDB_1: TcxDBTextEdit;
    edtDB_2: TcxDBTextEdit;
    edtDB_3: TcxDBTextEdit;
    edtDB_4: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbbtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitializeFrame; override;
  public
    { Public declarations }
    procedure InitializeModul; override;
    procedure UpdateTable(const tablename: string); override;

    procedure SaveItem;
  end;

var
  frmEditPredrp: TfrmEditPredrp;

implementation

{$R *.dfm}

procedure TfrmEditPredrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TfrmEditPredrp.InitializeFrame;
begin
  inherited;
  //Тута открываем набор из рекордсет

  SQLDataSet.CommandText:= 'SELECT * FROM TB_ADVENTURE WHERE ID=:IDITEM';
  SQLDataSet.ParamCheck:= True;
  SQLDataSet.Parameters.FindParam('IDITEM').Value:= m_CurrIDEdit;
  SQLDataSet.Active:= True;
  if m_CurrIDEdit<1 then
  begin
    SQLDataSet.Insert;
  end;
end;

procedure TfrmEditPredrp.InitializeModul;
begin
  inherited;
  //Вот здеся инициализируем модуль
  SetCaptionForm(Self,'Сведения о предприятии');
end;

procedure TfrmEditPredrp.SaveItem;
begin
  if (SQLDataSource.State=dsEdit) or (SQLDataSource.State=dsInsert) Then
  begin
    SQLDataSource.DataSet.Post;
    self.StartUpdateFrame;
    SendMSGUpdateTable('TB_ADVENTURE');
    self.EndUpdateFrame;
  end;
end;

procedure TfrmEditPredrp.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmEditPredrp.UpdateTable(const tablename: string);
begin
  inherited;
  //а вот тута мы и обновим рекорд сет
end;

end.
