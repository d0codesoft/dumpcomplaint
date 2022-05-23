unit UnitFrameBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs;

Const
    rcErrorParam = -1;

type

  TObjItem = class(TObject)
  public
    IDItem: integer;
  end;

  TItemSelect = record
    Descr: string;
    IDItem: integer;
  end;

  TrcTypeSelect = (rcNotSelect,rcSelect,rcMultiSelect);
  TrcTypeVal = (rcValString,rcValInt,rcUnknown,rcFrameParent);
  TrcTypeParam = (rcParamID,rcParamParentID,rcParamCtrl,rcParamParent,rcParamSelect,
    rcParamMultiSelect,rcParamDescr);

  PrcParam = ^TRcParam;
  TrcParam  = record
    pCode: integer;
    pTypeParam: TrcTypeParam;
    pTypeVal: TrcTypeVal;
    PVal: Pointer;
  end;

  TFrameBaseClass = class of TFrameBase;

  //Временно делаем как тформ
  //TFrame
  TFrameBase = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    m_IDHWND: integer;
    m_Update: Boolean;
    m_select: Byte; //0-not select; 1-select; 2 -multi select;
    m_CurrIDEdit: integer; //Текущие передаваемый идентификатор
    m_ParentID: integer;
    m_activeControll: TWinControl;
    //элемента

    procedure InitializeFrame; virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    constructor CreateFrm(AOwner: TComponent;idWnd: integer);
    destructor Destroy; override;
    procedure CloseFrame; 

    {User virtual}
    procedure InitializeModul; virtual;
    procedure UpdateTable(const tablename: string); virtual;
    procedure SelectChild(const IDItemSelect: TItemSelect;const ParentControll: integer);virtual;

    {user not virtual}
    procedure StartUpdateFrame;
    procedure EndUpdateFrame;
    function isUpdate: boolean;
    procedure SetFocusDefault;

    property GetIDFrame: integer read m_IDHWND;
  end;

//Реализовать выборку параметов при открытии формы каждая форма сам
//састоятельно выбирает свои параметры
//procedure GetParams;
function GetFistParams(const id_HWND:integer): integer;
function GetNextParams(const id_HWND:integer; var pHandl:integer): PrcParam;
procedure DeleteAllParams(const id_HWND:integer);

procedure AddParamID    (const id_HWND:integer;vParam:integer);
procedure AddParamParentID(const id_HWND:integer;vParam:integer);
procedure AddParamCtrl  (const id_HWND:integer;vParam:integer);
procedure AddParamParent(const id_HWND:integer;vParam:integer);overload;
procedure AddParamParent(const id_HWND:integer;vParam:TFrame);overload;
procedure AddParamSelect(const id_HWND:integer;vParam:integer);
procedure AddParamMultiSelect(const id_HWND:integer;vParam:integer);


implementation

{$R *.dfm}
Uses UnitUserPWD;

Var  m_lpListParam: TList;


{Процедуры для передачи параметров фрамам}
procedure AddParamParentID(const id_HWND:integer;vParam:integer);
Var pPar: PrcParam;
    pInt: PInteger;
begin
  New(pPar);
  pPar.pTypeVal:= rcValInt;
  pPar.pTypeParam:= rcParamParentID;
  pPar.pCode:= id_HWND;
  New(pInt);
  pInt^:= vParam;
  pPar.PVal:= pInt;
  m_lpListParam.Add(pPar);
end;

procedure AddParamID    (const id_HWND:integer;vParam:integer);
Var pPar: PrcParam;
    pInt: PInteger;
begin
  New(pPar);
  pPar.pTypeVal:= rcValInt;
  pPar.pTypeParam:= rcParamID;
  pPar.pCode:= id_HWND;
  New(pInt);
  pInt^:= vParam;
  pPar.PVal:= pInt;
  m_lpListParam.Add(pPar);
end;

procedure AddParamCtrl  (const id_HWND:integer;vParam:integer);
Var pPar: PrcParam;
    pInt: PInteger;
begin
  New(pPar);
  pPar.pTypeVal:= rcValInt;
  pPar.pTypeParam:= rcParamCtrl;
  pPar.pCode:= id_HWND;
  New(pInt);
  pInt^:= vParam;
  pPar.PVal:= pInt;
  m_lpListParam.Add(pPar);
end;

procedure AddParamParent(const id_HWND:integer;vParam:integer);
Var pPar: PrcParam;
    pInt: PInteger;
begin
  New(pPar);
  pPar.pTypeVal:= rcValInt;
  pPar.pTypeParam:= rcParamParent;
  pPar.pCode:= id_HWND;
  New(pInt);
  pInt^:= vParam;
  pPar.PVal:= pInt;
  m_lpListParam.Add(pPar);
end;

procedure AddParamParent(const id_HWND:integer;vParam:TFrame);overload;
Var pPar: PrcParam;
    pInt: Pointer;
begin
  New(pPar);
  pPar.pTypeVal:= rcValInt;
  pPar.pTypeParam:= rcParamParent;
  pPar.pCode:= id_HWND;
  pInt:= @vParam;
  pPar.PVal:= pInt;
  m_lpListParam.Add(pPar);
end;

procedure AddParamSelect(const id_HWND:integer;vParam:integer);
Var pPar: PrcParam;
    pInt: PInteger;
begin
  New(pPar);
  pPar.pTypeVal:= rcValInt;
  pPar.pTypeParam:= rcParamSelect;
  pPar.pCode:= id_HWND;
  New(pInt);
  pInt^:= vParam;
  pPar.PVal:= pInt;
  m_lpListParam.Add(pPar);
end;

procedure AddParamMultiSelect(const id_HWND:integer;vParam:integer);
Var pPar: PrcParam;
    pInt: PInteger;
begin
  New(pPar);
  pPar.pTypeVal:= rcValInt;
  pPar.pTypeParam:= rcParamMultiSelect;
  pPar.pCode:= id_HWND;
  New(pInt);
  pInt^:= vParam;
  pPar.PVal:= pInt;
  m_lpListParam.Add(pPar);
end;
{************************************************************}

Procedure DelAllParams;
Var iCount: integer;
    pRec:PrcParam;
begin
  iCount:= m_lpListParam.Count;
  While iCount>0 Do
  begin
    pRec:= PrcParam(m_lpListParam.Items[iCount-1]);
    if pRec^.pTypeVal=rcValString Then
      Dispose(PString(pRec^.PVal))
    else if pRec^.pTypeVal=rcValInt Then
      Dispose(PInt(pRec^.PVal));

      //К большому сожалению если неопределен тогда и не знаеш
      //какой размер удаляемого элемента
    m_lpListParam.Delete(iCount-1);
    iCount:= iCount - 1;
  end;
end;

procedure DeleteAllParams(const id_HWND: integer);
Var iCount: integer;
    pRec:PrcParam;
begin
  iCount:= m_lpListParam.Count;
  While iCount>0 Do
  begin
    pRec:= PrcParam(m_lpListParam.Items[iCount-1]);
    if pRec^.pCode=id_HWND then
    begin
      if pRec^.pTypeVal=rcValString Then
        Dispose(PString(pRec^.PVal))
      else if pRec^.pTypeVal=rcValInt Then
        Dispose(PInt(pRec^.PVal));

      //К большому сожалению если неопределен тогда и не знаеш
      //какой размер удаляемого элемента
      m_lpListParam.Delete(iCount-1);
    end;
    iCount:= iCount - 1;
  end;
end;

function GetFistParams(const id_HWND: integer): integer;
Var iCount:integer;
    pRec:PrcParam;
begin
  result:= rcErrorParam;
  iCount:= 0;
  While iCount<m_lpListParam.Count Do
  begin
    pRec:= m_lpListParam.Items[iCount];

    if pRec.pCode=id_HWND then
    begin
      result:= iCount+1;
      Exit;
    end;
    iCount:= iCount;
  end;
end;

function GetNextParams(const id_HWND:integer;
var pHandl:integer): PrcParam;
Var pRec:PrcParam;
    iCount: integer;
begin
  Result:= nil;
  if (pHandl<0) or (pHandl>m_lpListParam.Count) then
    Exit;

  for iCount := pHandl to m_lpListParam.Count do
  begin
    pRec:= m_lpListParam.Items[iCount-1];

    if pRec.pCode=id_HWND then
    begin
      pHandl:= iCount+1;
      Result:= pRec;
      Exit;
    end;
  end;
  pHandl:= rcErrorParam;
end;

{ TframeBase }

procedure TFrameBase.CloseFrame;
begin
  Self.Visible:= False;
  Self.Parent:= nil;
  PageFree(Self.m_IDHWND);
  Close;
end;

constructor TFrameBase.Create(AOwner: TComponent);
begin
  inherited;
  InitializeFrame;
end;

constructor TFrameBase.CreateFrm(AOwner: TComponent; idWnd: integer);
begin
  m_IDHWND:= idWnd;
  Create(AOwner);
end;

destructor TFrameBase.Destroy;
begin
  ClosePage(Self.m_IDHWND);
  inherited;
end;

procedure TFrameBase.EndUpdateFrame;
begin
  m_Update:=False;
end;

procedure TFrameBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TframeBase.InitializeFrame;
Var Hndl: integer;
    Param:PrcParam;
begin
  m_activeControll:=nil; 
  m_select:= 0;

  Hndl:= GetFistParams(Self.m_IDHWND);
  if Hndl<>rcErrorParam then
  begin
    While True Do
    begin
      Param:= GetNextParams(Self.m_IDHWND,Hndl);
      if Param=nil then
        break;
      Case Param.pTypeParam of
        rcParamSelect:m_select:=1;
        rcParamMultiSelect:m_select:=2;
        rcParamParent:;
        rcParamID:m_CurrIDEdit:=PInteger(Param^.PVal)^;
        rcParamParentID:m_ParentID:=PInteger(Param^.PVal)^;
        rcParamCtrl:;
      End;
    end;
  end;
  DeleteAllParams(m_IDHWND);
end;

procedure TFrameBase.InitializeModul;
begin
  //not implement
end;

function TFrameBase.isUpdate: boolean;
begin
  result:= m_Update;
end;

procedure TFrameBase.SelectChild(const IDItemSelect: TItemSelect; const ParentControll: integer);
begin
  //not implement
end;

procedure TFrameBase.SetFocusDefault;
begin
  if m_activeControll<>nil then
    m_activeControll.SetFocus
  else
    Self.SetFocus;
end;

procedure TFrameBase.StartUpdateFrame;
begin
  m_Update:= True;
end;

procedure TFrameBase.UpdateTable(const tablename: string);
begin
  /// Not inmplement
end;

initialization
    m_lpListParam:= TList.Create;

finalization
    DelAllParams;
    m_lpListParam.Free;
end.
