unit UnitProgramSetings;

interface

Uses Windows,SysUtils,Registry, Forms;

type
   TRcTypeProgramInfo = (rcInfoDirProgram,rcInfoDirFoto,rcInfoDirReport,rcNameRegister,
   rcUserDefault);

function GetDirectoryProgram: string;
function GetProgramInfo(const info:TRcTypeProgramInfo): string;
procedure SetProgramInfo(const info:TRcTypeProgramInfo;const Value:string);

implementation

Var DirFoto: string;
    DirReport:string;
//Var m_RcRegistry:TRegistry;

function GetDirectoryProgram: string;
begin
  Result:= ExcludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName));
end;


function GetProgramInfo(const info:TRcTypeProgramInfo): string;
var m_RcRegistry:TRegistry;
begin
  Result:= '';
  case info of
     rcInfoDirProgram: Result:= GetDirectoryProgram();
     rcInfoDirFoto:   Result:= DirFoto;
     rcInfoDirReport: Result:= DirReport;
     rcNameRegister:  Result:= '';
     rcUserDefault:
       begin
          m_RcRegistry:=TRegistry.Create;
          m_RcRegistry.RootKey:= HKEY_LOCAL_MACHINE;
          m_RcRegistry.OpenKey('SOFTWARE\BELAZ\RECLAMATION\SYSTEM',TRUE);
          Result := m_RcRegistry.ReadString('DefaultUser');
          m_RcRegistry.Free;
       end;
  end;
end;

procedure SetProgramInfo(const info:TRcTypeProgramInfo;const Value:string);
var m_RcRegistry:TRegistry;
begin
  m_RcRegistry:=TRegistry.Create;
  m_RcRegistry.RootKey:= HKEY_LOCAL_MACHINE;
  m_RcRegistry.OpenKey('SOFTWARE\BELAZ\RECLAMATION\SYSTEM',TRUE);

  case info of
     rcInfoDirFoto:     m_RcRegistry.WriteString('DirFoto',Value);
     rcNameRegister:    m_RcRegistry.WriteString('Register',Value);
     rcUserDefault:     m_RcRegistry.WriteString('DefaultUser',Value);
     rcInfoDirReport:   m_RcRegistry.WriteString('DirReport',Value);
  end;
  m_RcRegistry.Free;
end;

procedure InitializeProgramRegistry;
var m_RcRegistry:TRegistry;
begin
  m_RcRegistry:=TRegistry.Create;
  m_RcRegistry.RootKey:= HKEY_LOCAL_MACHINE;
  if m_RcRegistry.OpenKey('SOFTWARE\BELAZ\RECLAMATION\SYSTEM',False)=false Then
  begin
    m_RcRegistry.OpenKey('SOFTWARE\BELAZ\RECLAMATION\SYSTEM',True);
    m_RcRegistry.WriteString('Version','1.0');
    m_RcRegistry.WriteString('AliasDB','RCdb.mdb');
    m_RcRegistry.WriteString('DirFoto',GetDirectoryProgram()+'\DATA_FOTO');
    m_RcRegistry.WriteString('DirReport',GetDirectoryProgram()+'\REPORT');
    m_RcRegistry.WriteString('DefaultUser','Администратор');
  end;
  DirFoto:= m_RcRegistry.ReadString('DirFoto');
  DirReport:= m_RcRegistry.ReadString('DirReport');
  if DirReport='' then
    m_RcRegistry.WriteString('DirReport',GetDirectoryProgram()+'\REPORT');
  DirReport:= m_RcRegistry.ReadString('DirReport');


  if Not DirectoryExists(DirFoto) then
  begin
    {$I-}
    MkDir(DirFoto);
    {$I+}
    if IOResult<>0 then
    begin
      DirFoto:='';
    end;
  end;
  m_RcRegistry.Free;
end;

initialization
  InitializeProgramRegistry;

finalization

end.
