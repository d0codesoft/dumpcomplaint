unit UnitEditElementGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, DB, ADODB, cxMemo,
  cxRichEdit, cxDBRichEdit, cxTextEdit, cxDBEdit, cxControls, cxContainer,
  cxEdit, cxLabel, RzPanel, RzButton, ExtCtrls;

type
  TframeEditElementGroup = class(TframeBase)
    RzToolbar1: TRzToolbar;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnSave: TRzToolButton;
    tbbtnPrint: TRzToolButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtDB_1: TcxDBTextEdit;
    edtDB_3: TcxTextEdit;
    edtDB_2: TcxDBRichEdit;
    SQLDataSet: TADODataSet;
    SQLDataSource: TDataSource;
    procedure tbbtnSaveClick(Sender: TObject);
    procedure tbbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure InitializeFrame; override;

    procedure BeforeClose;
  public
    { Public declarations }
    procedure InitializeModul; override;
    procedure SaveItem;
  end;

var
  frameEditElementGroup: TframeEditElementGroup;

implementation

{$R *.dfm}

{ TframeEditElementGroup }

procedure TframeEditElementGroup.BeforeClose;
begin
  if (SQLDataSet.State=dsEdit) or (SQLDataset.State=dsInsert) Then
  begin
     if (MessageBox(0, 'Вы хотите сохранить изменения', 'Вопрос', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
     begin
       SaveItem;
     end;
  end;
end;

procedure TframeEditElementGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TframeEditElementGroup.InitializeFrame;
begin
  inherited;

  SQLDataSet.CommandText:= 'select * from TB_MACHINE_ELEMENTS WHERE ID=:IDITEM';
  SQLDataSet.ParamCheck:= True;
  SQLDataSet.Parameters.FindParam('IDITEM').Value:= self.m_ParentID;
  SQLDataSet.Active:= True;
  if Not SQLDataSet.IsEmpty then
  begin
    SQLDataSet.FindFirst;
    edtDB_3.Text:= SQLDataSet.FieldByName('DESCR').AsString;
  end;
  SQLDataSet.Active:= False;
  //
  SQLDataSet.CommandText:= 'select * from TB_MACHINE_ELEMENTS WHERE ID=:IDITEM';
  SQLDataSet.ParamCheck:= True;
  SQLDataSet.Parameters.FindParam('IDITEM').Value:= m_CurrIDEdit;
  SQLDataSet.Active:= True;
  if m_CurrIDEdit<1 then
  begin
    SQLDataSet.Insert;
  end;
end;

procedure TframeEditElementGroup.InitializeModul;
begin
  inherited;
  if m_CurrIDEdit=0 then
    SetCaptionForm(Self,'Новая группа')
  else
    SetCaptionForm(Self,edtDB_1.Text);
end;

procedure TframeEditElementGroup.SaveItem;
begin
  if (SQLDataSet.State=dsEdit) or (SQLDataSet.State=dsInsert) Then
  begin
    SQLDataSet.Post;
    Self.StartUpdateFrame;
    SendMSGUpdateTable('TB_MACHINE_ELEMENTS/GROUP');
    self.EndUpdateFrame;
  end;
end;

procedure TframeEditElementGroup.tbbtnCloseClick(Sender: TObject);
begin
  BeforeClose;
  CloseFrame;
end;

procedure TframeEditElementGroup.tbbtnSaveClick(Sender: TObject);
begin
  SaveItem;
end;

end.
