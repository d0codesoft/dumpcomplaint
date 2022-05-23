unit UnitUSER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, Mask, RzEdit,
  RzLabel, RzCmboBx, cxGraphics, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit;

CONST PWD_OK = 1;
      PWD_ERROR = 2;

type
  TfrmStart = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btnClose: TcxButton;
    btnSavePAssword: TcxButton;
    btnOK: TcxButton;
    ComboSelectUser: TcxComboBox;
    EditPWD: TcxTextEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSavePAsswordClick(Sender: TObject);
  private
    { Private declarations }
    m_ErrorPWD: byte;
  public
    { Public declarations }
  end;

var
  frmStart: TfrmStart;

implementation

{$R *.dfm}
Uses UnitDBModul,UnitUserPWD,UnitProgramSetings;

CONST MAX_ERROR_PWD=5;

procedure TfrmStart.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStart.btnOKClick(Sender: TObject);
Var sItem: string;
begin
  if ComboSelectUser.ItemIndex=-1 Then
     Exit;
  sItem:= ComboSelectUser.Properties.Items.Strings[ComboSelectUser.ItemIndex];
  if RCDataModule.VerifyPWDUser(sItem,EditPWD.Text) Then
  begin
    Self.ModalResult:= PWD_OK;
    //Close;
  end
  else
  begin
    MessageBox(0, 'Неверный пароль, пропробуйте еще раз, и еще раз, и еще ...',
     'Ошибка', MB_ICONEXCLAMATION or MB_OK or MB_APPLMODAL);
    m_ErrorPWD:= m_ErrorPWD + 1;
    if m_ErrorPWD=MAX_ERROR_PWD then
        Self.ModalResult:= PWD_ERROR;
        //Self.Close;
  end;
end;

procedure TfrmStart.btnSavePAsswordClick(Sender: TObject);
begin
  btnOKClick(Sender);
end;

procedure TfrmStart.FormCreate(Sender: TObject);
Var sItem, sVal: string;
  DefUser: string;
  ind: integer;
begin
  ind:= -1;
  m_ErrorPWD:= 0;
  //Self.ModalResult:= PWD_ERROR;
  DefUser:= GetProgramInfo(rcUserDefault);
  RCDataModule.SYS_SQL_USER.Active:= False;
  RCDataModule.SYS_SQL_USER.SQL.Clear;
  RCDataModule.SYS_SQL_USER.SQL.add('SELECT ID_USER,USER_NAME,USER_DESCR FROM TB_SYS_USER');
  RCDataModule.SYS_SQL_USER.Active:= True;
  if RCDataModule.SYS_SQL_USER.Active then
  begin
    if (Not RCDataModule.SYS_SQL_USER.IsEmpty) and (RCDataModule.SYS_SQL_USER.FindFirst) Then
    begin
      While Not RCDataModule.SYS_SQL_USER.Eof do
      Begin
        sItem:= RCDataModule.SYS_SQL_USER.FieldByName('USER_NAME').ASString;
        if RCDataModule.SYS_SQL_USER.FieldByName('USER_DESCR').IsNull then
          sVal:= sItem
        else
          sVal:=RCDataModule.SYS_SQL_USER.FieldByName('USER_DESCR').ASString;
        ComboSelectUser.Properties.Items.Add(sVal);
        if DefUser=sVal then
           ind:= ComboSelectUser.Properties.Items.Count-1;
        RCDataModule.SYS_SQL_USER.Next;
      End;
    end;
  end;
  RCDataModule.SYS_SQL_USER.Active:= False;
  ComboSelectUser.ItemIndex:= ind;
end;

end.
