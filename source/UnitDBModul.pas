unit UnitDBModul;

interface

uses
  SysUtils, Classes, DB, ADODB, FIBDataSet, pFIBDataSet, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ImgList, Controls, dxmdaset;

type
  TRCDataModule = class(TDataModule)
    DBConn: TADOConnection;
    SYS_SQL_USER: TADOQuery;
    MianGridViewRepository: TcxGridViewRepository;
    MianGridViewRepositoryDBTableView1: TcxGridDBTableView;
    ImageList1: TImageList;
    SQLDataSourse_type_process: TdxMemData;
    SQLDataSourse_type_processid: TIntegerField;
    SQLDataSourse_type_processdescr: TStringField;
    DataSource_type_process: TDataSource;
    DataSource_type_guarant: TDataSource;
    SQLDataSurse_DataSource_type_guarant: TdxMemData;
    SQLDataSurse_DataSource_type_guarantId: TIntegerField;
    SQLDataSurse_DataSource_type_guarantdescr: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetHashPWD(wPWD: string): string; 
  public
    { Public declarations }
    function VerifyPWDUser(const NameUser,Pwd: string): Boolean;

  end;

var
  RCDataModule: TRCDataModule;

  function isAdministrative: Boolean;

implementation

{$R *.dfm}

Uses StrUtils,UnitProgramSetings;

Var glIDUser: integer;
    glisadmin: Boolean;

{user}
function isAdministrative: Boolean;
begin
  result:= glisadmin;
end;

{TRCDataModule}


procedure TRCDataModule.DataModuleCreate(Sender: TObject);
begin
  self.DBConn.Close;
  self.DBConn.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source='+GetDirectoryProgram()+
  '\RCdb.mdb;Mode=Share Deny None;Extended Properties="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password=reclamation;Jet OLEDB:Engine Type=5;';
  self.DBConn.ConnectionString:= self.DBConn.ConnectionString + 'Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;';
  self.DBConn.ConnectionString:= self.DBConn.ConnectionString + 'Jet OLEDB:Don''t Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';
  self.DBConn.Open;

  //Временно откроем общие талицы которые используются при редактировании
  //Дальше посмострим вобще конечно я считаю это неправильно
  DataSource_type_guarant.DataSet.Active:= True;
  DataSource_type_process.DataSet.Active:= True;
end;

procedure TRCDataModule.DataModuleDestroy(Sender: TObject);
begin
  self.DBConn.Close;
end;

function TRCDataModule.GetHashPWD(wPWD: string): string;
Var pLen: integer;
    CodeIn: byte;
    CodeChar: Char;
    HeshPWD: string;
begin
  Result:= '';
  pLen := Length(wPWD);
  if pLen=0 then
    Exit;

  While pLen>0 Do
  begin
    CodeChar:= wPWD[pLen];
    CodeIn:= Ord(CodeChar);
    CodeIn:= CodeIn - pLen*2;
    if CodeIn<0 then
      CodeIn:= CodeIn * (-1);
    CodeChar:= Chr(CodeIn);
    HeshPWD:= HeshPWD + CodeChar;
    pLen:= pLen - 1;
  end;
  Result:= HeshPWD;
end;

function TRCDataModule.VerifyPWDUser(const NameUser, Pwd: string): Boolean;
Var hashPWD: string;
begin
  Result:= False;
  if SYS_SQL_USER.Active Then
    SYS_SQL_USER.Close;

  SYS_SQL_USER.SQL.Clear;
  SYS_SQL_USER.SQL.Add('SELECT * FROM TB_SYS_USER WHERE USER_DESCR=:DESCRU');
  SYS_SQL_USER.ParamCheck:= True;
  SYS_SQL_USER.Parameters.Items[0].Value:= NameUser;
  SYS_SQL_USER.Active:= True;
  if (Not RCDataModule.SYS_SQL_USER.IsEmpty) and (SYS_SQL_USER.FindFirst) Then
  begin
      hashPWD:=SYS_SQL_USER.FieldByName('USER_PWD').AsString;
      if hashPWD=GetHashPWD(Pwd) then
      begin
        glIDUser:= SYS_SQL_USER.FieldByName('ID_USER').AsInteger;
        glisadmin:= SYS_SQL_USER.FieldByName('ADMIN_FUNCTION').AsBoolean;
        Result:= True;
      end;
  end;
  SYS_SQL_USER.Close;
  SYS_SQL_USER.SQL.Clear;
  SYS_SQL_USER.SQL.Add('SELECT * FROM TB_SYS_USER');
end;

initialization
  glIDUser:= 0;

finalization

end.
