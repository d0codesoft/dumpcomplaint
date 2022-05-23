unit UnitModulFoto;

interface

Uses Classes,Forms,Windows,SysUtils ,StrUtils,DB, Dialogs,NativeXml,dxmdaset;

Type
  PutchString = string[255];

  PRcFotoInfo = ^TRcFotoInfo;
  TRcFotoInfo = record
    FileName: PutchString;
    FileDescr: string;
  end;

  TRcListFoto = class(TObject)
  private
    m_strRootDir: string;
    m_iIDRc: integer;
    m_TMPFolder: string;
    m_bLoad: Boolean;
    m_DataSetFoto: TList;
  protected
    Procedure Initialize;
    procedure LoadDirFoto;
    procedure ClearData;
    procedure DeleteAllElement;
    function SetRootFolder(const RootDir: string): Boolean;
    function GetNewNameFile(): string;
    procedure CopyFileFromTMPToRoot;

    procedure DeleteTemDir;
  public
    constructor Create; overload;
    constructor Create(const Id: integer;const RootDir: string); overload;
    destructor Destroy; override;

    function isLoadFoto: Boolean;

    function GetCountFoto(): integer;
    function AddFotoFromFile(const FullFileName:string): boolean;
    function GetFotoName(const index:integer): string;
    function GetFotoFileName(const index:integer): string;
    function GetFotoFullFileName(const index:integer): string;
    function DeleteFoto(const index: integer): Boolean;

    function SaveData(const Id: integer;const RootDir: string): Boolean; overload;
    function SaveData: Boolean;overload;
    function LoadData: Boolean;
  end;


  function IntToStrZeroo(ConvInt: integer;ZerroCount: integer):string;
  function GetTempDirectory: string;
  function GetNewTmpDirectory(const RootTMP: string): string;
  function DeleteDirectory(dirRoot: string): Boolean;

implementation

Uses ShellAPI;

{User pfucntion}
function DeleteDirectory(dirRoot: string): Boolean;
Var sr: TSearchRec;
    Res: integer;
begin
  Result:= False;
  if  Length(dirRoot)=0 Then
    Exit;
  Res:=FindFirst(dirRoot+'\*.*',faAnyFile,sr);
  if Res=0 Then
  begin
    While Res=0 Do
    begin
      if (sr.Name='.') or (sr.Name='..') Then
      begin
        Res:= FindNext(sr);
        Continue;
      end;

      if ((sr.Attr and faDirectory) = faDirectory) or
      (sr.Attr = faDirectory) Then
      begin
        FileSetAttr(dirRoot+'\'+sr.Name, faDirectory ); // сброс всяких
        // read-only
        DeleteDirectory(dirRoot+'\'+sr.Name); //рекурсивно удаляем содержимое
        RemoveDir(dirRoot + '\'+sr.Name); // удаляем теперь уже пустую
      end
      else
      begin
        FileSetAttr(dirRoot+'\'+sr.Name, 0); // сброс всяких read-only
        DeleteFile(dirRoot+'\'+sr.Name); // удаляем файл
      end;
      Res:= FindNext(sr);
    end;
  end;
  FindClose(sr);
  RemoveDir(dirRoot);
  result:= true;
end;


function GetNewTmpDirectory(const RootTMP: string): string;
Var i: integer;
    vStr: string;
begin
  Result:= '';
  if DirectoryExists(RootTMP)=False then
    Exit;

 for i := 1 to 999 do
   begin
     vStr:= '~RTMP'+IntToStrZeroo(i,3);
     if DirectoryExists(RootTMP+vStr)=False then
     begin
      {$I-}
      MkDir(RootTMP+vStr);
      {$I+}
      if IOResult=0 then
      begin
        result:= RootTMP+vStr+'\';
        Exit;
      end;
     end;
   end;
end;

function GetTempDirectory: string;
Var vChar: PChar;
    res: DWORD;
    resTemp: string;
begin
  vChar:= AllocMem((MAX_PATH*2)+1);
  res:= GetTempPath((MAX_PATH*2)+1,vChar);
  SetString(resTemp,vChar,res);
  if RightStr(resTemp,1)<>'\' then
    resTemp:= resTemp + '\';
  Result:= resTemp;
end;


function IntToStrZeroo(ConvInt: integer;ZerroCount: integer):string;
Var Res: string;
begin
  Res:= IntTostr(ConvInt);
  if length(Res)<ZerroCount then
    Res:= DupeString('0',ZerroCount-length(Res))+Res;
  Result:= Res;
end;

{ TRcListFoto }

constructor TRcListFoto.Create;
begin
  inherited;
  //Not implement
  m_bLoad:= True;
  m_TMPFolder:= '';
  m_iIDRc:= 0;
  m_DataSetFoto:= TList.Create;
  Initialize;
end;

function TRcListFoto.AddFotoFromFile(const FullFileName: string): boolean;
Var NewName: string;
    vInfoFoto: PRcFotoInfo;
    PatchFiledir: string;
begin
  Result:= False;
  if m_bLoad = false then
    Exit;

  Result:= False;
  if FileExists(FullFileName) then
  begin
    if m_iIDRc<1 then
       PatchFiledir:= m_TMPFolder
    else
      PatchFiledir:= m_strRootDir;

     NewName:= GetNewNameFile();
     if CopyFile(PChar(FullFileName),PChar(PatchFiledir + '\'+NewName),True) Then
     begin
        New(vInfoFoto);
        vInfoFoto^.FileName:= NewName;
        vInfoFoto^.FileDescr:= NewName;
        m_DataSetFoto.Add(vInfoFoto);
        Result:= True;
     end;
  end;
end;

procedure TRcListFoto.ClearData;
begin
  DeleteAllElement;
end;

procedure TRcListFoto.CopyFileFromTMPToRoot;
Var vInfoFoto: PRcFotoInfo;
    iCount: integer;
begin
  iCount:= m_DataSetFoto.Count;
  While iCOunt>0 Do
  Begin
     vInfoFoto:= m_DataSetFoto.Items[iCount-1];
     CopyFile(PChar(m_TMPFolder+vInfoFoto^.FileName),PChar(m_strRootDir+vInfoFoto^.FileName),false);
     DeleteFile(m_TMPFolder+vInfoFoto^.FileName);
     iCOunt:= iCount - 1;
  End;
end;

constructor TRcListFoto.Create(const Id: integer;const RootDir: string);
begin
  inherited Create;

  m_TMPFolder:= '';
  m_iIDRc:= Id;

  m_bLoad:= SetRootFolder(RootDir);
  m_DataSetFoto:= TList.Create;
  Initialize;
  LoadDirFoto;
end;

procedure TRcListFoto.DeleteAllElement;
Var vInfoFoto: PRcFotoInfo;
    iCount: integer;
begin
  iCount:= m_DataSetFoto.Count;
  While iCOunt>0 Do
  Begin
     vInfoFoto:= m_DataSetFoto.Items[iCount-1];
     Dispose(vInfoFoto);
     m_DataSetFoto.Delete(iCount-1);
    iCOunt:= iCount - 1;
  End;
end;

function TRcListFoto.DeleteFoto(const index: integer): Boolean;
Var vInfoFoto: PRcFotoInfo;
begin
  Result:= False;
  if Not m_bLoad then
    Exit;

  if m_DataSetFoto.Count<=index then
  begin
     vInfoFoto:= m_DataSetFoto.Items[index-1];
     Dispose(vInfoFoto);
     m_DataSetFoto.Delete(index-1);
     Result:= True;
  end;
end;

procedure TRcListFoto.DeleteTemDir;
begin
  if m_bLoad = false then
    Exit;
  if Length(m_TMPFolder)=0 then
    Exit;
  if DirectoryExists(m_TMPFolder) then
  begin
    DeleteDirectory(MidStr(m_TMPFolder,1,Length(m_TMPFolder)-1));
  end;
end;

destructor TRcListFoto.Destroy;
begin
  DeleteTemDir;
  DeleteAllElement;
  m_DataSetFoto.Free;
  inherited;
end;

function TRcListFoto.GetCountFoto: integer;
begin
  result:= m_DataSetFoto.Count;
end;

function TRcListFoto.GetFotoFileName(const index: integer): string;
begin
  Result:= '';
  if Not m_bLoad then
    Exit;

  if m_DataSetFoto.Count>=index then
  begin
     Result:= PRcFotoInfo(m_DataSetFoto.Items[index-1])^.FileName;
     Exit;
  end;
end;

function TRcListFoto.GetFotoFullFileName(const index: integer): string;
Var DirRoot: string;
begin
  Result:= '';
  if Not m_bLoad then
    Exit;
  if Self.m_iIDRc<1 Then
    DirRoot:= Self.m_TMPFolder
  else
    DirRoot:= Self.m_strRootDir+'\';


  if m_DataSetFoto.Count>=index then
  begin
     Result:= DirRoot+PRcFotoInfo(m_DataSetFoto.Items[index-1])^.FileDescr;
     Exit;
  end;
end;

function TRcListFoto.GetFotoName(const index: integer): string;
begin
  Result:= '';
  if Not m_bLoad then
    Exit;

  if m_DataSetFoto.Count>=index then
  begin
     Result:= PRcFotoInfo(m_DataSetFoto.Items[index-1])^.FileDescr;
     Exit;
  end;
end;

function TRcListFoto.GetNewNameFile: string;
Var i: integer;
    strName: string;
    DirRoot: string;
begin
  if Self.m_iIDRc<1 Then
    DirRoot:= Self.m_TMPFolder
  else
    DirRoot:= Self.m_strRootDir;

  for I := 1 to 999999 do
    begin
      strName:= IntToStrZeroo(i,6);
      if Not FileExists(DirRoot+'\RC'+strName+'.jpg') then
      begin
        Result:= 'RC'+strName+'.jpg';
        Exit;
      end;
    end;
  Result:= '';
end;

procedure TRcListFoto.Initialize;
begin
  if (Not m_bLoad) then
    Exit;

  if (m_iIDRc<1) then
  begin
    //теперя проверяем налие директории
    //И сохраняем все фацлф в
    //А тута проверяем наличие обыкновенной директории
    m_TMPFolder:= GetNewTmpDirectory(GetTempDirectory());
  end
  else
  begin
    //А тута проверяем наличие обыкновенной директории
    if DirectoryExists(m_strRootDir)=false then
    begin
      {$I-}
      MkDir(m_strRootDir);
      {$I+}
      if IOResult<>0 then
      begin
        m_bLoad:= False;
        ShowMessage('Ошибка создания директории '+m_strRootDir);
      end;
    end;
  end;
end;

function TRcListFoto.isLoadFoto: Boolean;
begin
  Result:= m_bLoad;
end;

function TRcListFoto.LoadData: Boolean;
begin
  Result:= True;
  LoadDirFoto;
end;

procedure TRcListFoto.LoadDirFoto;
Var i: integer;
    iCount: integer;
    dbXml: TNativeXml;
    vInfoFoto: PRcFotoInfo;
begin
  if (Not m_bLoad) then
    Exit;

  if (m_iIDRc<1) then
  begin
    Exit;
  end;

  Self.DeleteAllElement;


  if FileExists(m_strRootDir+'\FOTORC.db') then
  begin
     dbXml:= TNativeXml.Create;
     dbXml.LoadFromFile(m_strRootDir+'\FOTORC.db');
     iCount:= dbXml.Root.NodeCount;
     For i:=1 To iCount Do
     begin
       if dbXml.Root.Nodes[i-1].Name<>'RCINFO' Then
       begin
          if dbXml.Root.Nodes[i-1].AttributeCount>0 Then
          begin
             New(vInfoFoto);
             vInfoFoto.FileName:=dbXml.Root.Nodes[i-1].AttributeValue[0];
             vInfoFoto.FileDescr:= dbXml.Root.Nodes[i-1].ValueAsString;
             m_DataSetFoto.Add(vInfoFoto);
          end;
       end;
     end;
  end;

  iCount:= m_DataSetFoto.Count;
  While iCount>0 Do
  begin
    if Not FileExists(m_strRootDir+'\'+PRcFotoInfo(m_DataSetFoto.Items[iCount-1])^.FileName) then
    begin
      m_DataSetFoto.Delete(iCount-1);
    end;
    iCount:= iCount - 1;
  End;
end;

function TRcListFoto.SaveData: Boolean;
Var vInfoFoto: PRcFotoInfo;
    iCount: integer;
    dbXml: TNativeXml;
    NewNode: TXMLNode;
begin
  Result:= False;
  if (Not m_bLoad) then
    Exit;

  if (m_iIDRc<1) then
    Exit;

  dbXml:= TNativeXml.Create;
  dbXml.Root.Name:= 'RC_FOTO';
  NewNode:= dbXml.Root.NodeNew('RCINFO');
  NewNode.ValueAsInteger:= m_DataSetFoto.Count;
  NewNode.AttributeAdd('ID_RC',m_iIDRc);

  iCount:= 0;
  While iCount<m_DataSetFoto.Count Do
  begin
    vInfoFoto:= m_DataSetFoto.Items[iCount];
    NewNode:= dbXml.Root.NodeNew(ChangeFileExt(vInfoFoto.FileName,''));
    NewNode.AttributeAdd('FILENAME',vInfoFoto.FileName);
    NewNode.ValueAsString:= vInfoFoto.FileDescr;
    iCount:= iCount + 1;
  end;
  dbXml.SaveToFile(m_strRootDir+'\FOTORC.db');
  Result:= True;
end;

function TRcListFoto.SaveData(const Id: integer; const RootDir: string): Boolean;
begin
  Result:= False;
  if (Not m_bLoad) then
    Exit;

  if (m_iIDRc>0) then
  begin
    //TMP
    m_TMPFolder:= m_strRootDir;
    m_iIDRc:= Id;
    SetRootFolder(RootDir);
    Self.CopyFileFromTMPToRoot;
  end
  else
  begin
    m_iIDRc:= Id;
    SetRootFolder(RootDir);
  end;
  m_TMPFolder:= '';
  SaveData;
  Result:= True;
end;

function TRcListFoto.SetRootFolder(const RootDir: string): Boolean;
begin
  Result:= False;
  m_strRootDir:= RootDir;

  if DirectoryExists(m_strRootDir)=False then
     Exit;

  if RightStr(m_strRootDir,1)<>'\' then
    m_strRootDir:= m_strRootDir + '\';

  m_strRootDir:= m_strRootDir + 'RC'+ IntToStrZeroo(m_iIDRc,6);
  Result:= True;
end;

end.
