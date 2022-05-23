{-----------------------------------------------------------------------------
 Unit Name: UnitUserPWD
 Author:    Admin
 Date:      07-���-2006
 Purpose:
 History:   ���� ���� ������ ������ ����. � ���� ���� ����������� �
 � � ��������� � ���� ������ �� ������� � ���.
 �� ����� ��������� ��� ��������� ������� ���� ������, ����������
 ��� ������������ ����� ������, �������� ��� ������� ��������.
 ����� �� �������� ������ �� ����������� ��������
 ������ ����.
 **********************
 ������� ��������� �� ����� ������, ���� ���������� ������ (������ ������ ������� ��� ����������)
 PageControll (���� �� ���� ��� ��� ������ �� ������) ����� ���� �����������
 ��� ������� ���������� ��� ����������������.
 ��� ������ ����� ���� ������� �����.
 **********************
 � ��� ������ ������ ������ ����. � ���� ��� � �� ��� ���������� ��� � ������
 �� ���������� ���� �� ��������� ����� � ������ ������, �� ����� �������� �������� �������
 ���� ����������� ���� ������ ��� � �����. �� ���-�� ������� ��� �� ��� � ���� ����.
 **********************
 �� �������� � ����������� ����������� ��� �������, ��������
 Public ������� Main �����.
 // 07.07.2006 9:33 GMT+2

 // 11.07.2006 16:45GMT+2
 ����� �������� ����������
 ������� ���� ��������� �����
 1 ����� ����������� � ����� ������ �������������� ����� Close caFree
 ����� ����� ���� �� ������������ � ������ �� ���� ��� ����� �� ����������
 ������ ����� ���� ������ ������� �� ����� ��� ����� ����������
 ������ ��� �� ������ ����� ����������
 **********************
 ��������� ���� WC2006 �������� ������.
 ��� ����� �������. ������ ��� ��� ���������� ��������� � ��������� ������.
-----------------------------------------------------------------------------}


unit UnitUserPWD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,UnitFrameBase, UnitProgramSetings, dxBar, ImgList, ExtCtrls, dxsbar, dxDockControl, dxDockPanel,
  cxPC, cxControls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,UnitDBModul;

type

  PrcRecordPage = ^TrcRecordPage;
  TrcRecordPage = record
    CodePage: integer;
    ParentCode: integer;
    ParentIDControll: integer;
    NamePage: string;
    rcPage:TcxTabSheet;
    //�������� ����� ����� TFrame
    rcFrame:TFrameBase;
  end;

  TfrmMain = class(TForm)
    MainSideBar: TdxSideBar;
    ImageBig: TImageList;
    MainBarManager: TdxBarManager;
    MainSideBarStore: TdxSideBarStore;
    ImageSmall: TImageList;
    ImageListBig48: TImageList;
    MainPageControl: TcxPageControl;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    mnuFile_ConfigPrinter: TdxBarButton;
    mnuFile_ConfigSystem: TdxBarButton;
    mnuFile_ConfigUser: TdxBarButton;
    mnuFile_Exit: TdxBarButton;
    mnuFile: TdxBarSubItem;
    mnuReferense_avto: TdxBarButton;
    mnuReferense_element: TdxBarButton;
    mnuReferense_model: TdxBarButton;
    mnuReferense_model_engine: TdxBarButton;
    mnuReferense_codefailure: TdxBarButton;
    mnuReferense: TdxBarSubItem;
    N11: TdxBarButton;
    mnuDoc: TdxBarSubItem;
    N14: TdxBarButton;
    mnuReport: TdxBarSubItem;
    mnuHelp_Help: TdxBarButton;
    mnuHelp_info: TdxBarButton;
    mnuHelp: TdxBarSubItem;
    procedure FormCreate(Sender: TObject);
    procedure MainSideBarItemClick(Sender: TObject; Item: TdxSideBarItem);
    procedure MainPageControlClose(Sender: TObject; var AllowClose: Boolean);
    procedure mnuReferense_avtoClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure mnuReferense_elementClick(Sender: TObject);
    procedure mnuReferense_modelClick(Sender: TObject);
    procedure mnuReferense_model_engineClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure MainPageControlChange(Sender: TObject);
    procedure N14Click(Sender: TObject);
  private
    { Private declarations }
    m_iPreviosItemIndex: integer;
    m_iCountPage: integer;
    m_lListFrame: TList;

    procedure InitializationForm;

    //Function from worc param create windows
  public
    { Public declarations }
    function GetNewCodePage: integer;
    function GetNamePageFromIndex(const PageIndex:integer): string;
    function GetCaptionPageFromIndex(const PageIndex:integer): string;

    procedure PageFree(const IdPage:integer);
    procedure OpenPage(const PgName:string;IdParent: integer=0;ParentFrame: TFrameBase=nil;
                       const ParentControll: integer=0; const IDItem: integer=0;
                       const pSelect:TrcTypeSelect=rcNotSelect);
    procedure ClosePage(const IdPage: integer);
    procedure ClosePageFromPage(page:TcxTabSheet);
    //����������� ���������� � ��������
    function GetPageInfo(const IDHwnd:integer):PrcRecordPage;

    procedure CloseChildPage(const IdPage:integer);
    procedure SendMSGUpdateTable(const tablename:string);
    procedure SelectChildFrame(const IDItemSelect: TItemSelect;const IDHwnd: integer);

    procedure SetCaptionForm(vframe:TFrameBase; vCaption: string);
    procedure SetFocusFrame(Page:TcxTabSheet);
  end;

var
  frmMain: TfrmMain;

  procedure SetCaptionForm(vframe:TFrameBase; vCaption: string);

  //��������� ������� ��������
  //���� �������� ���������� �� ���������� �����
  procedure PageFree(const IdPage:integer);

  //��������� ������������ ����� � ������ � �������� ����� ��������
  procedure SelectChildFrame(const IDItemSelect: TItemSelect; const IDHwnd: integer);

  //��������� ���� ������ � ���������� ������ � �������
  procedure SendMSGUpdateTable(const tablename: string);

  //���������� �������� �������� ���� ��� �������� ������������ �����
  procedure CloseChildPage(const IdPage:integer);

  //������� ����������� ����� � ���������
  //� �������� �������� �������� ���� ����� ������ �������CloseChildPage
  procedure ClosePage(const IdPage:integer);

  //���������� ��������� � ����������� � ����� �� �� ��������������
  function GetPageInfo(const IDHwnd:integer):PrcRecordPage;

  //��������� ������� ���� �� ������� ����� � �� ���������
  //� ������������ ��������� �����
  procedure OpenPage(const PgName:string;IdParent: integer=0;ParentFrame: TFrameBase=nil;
                       const ParentControll: integer=0; const IDItem: integer=0;
                       const pSelect:TrcTypeSelect=rcNotSelect);


implementation

{$R *.dfm}

Uses StrUtils,UnitFrameSpr,UnitSprPredpr,UnitSprQuarry, UnitSprModelMachine,
 UniFrameEditMachine,UnitEditQuarry,UnitJornalReclamation,UnitFrmEditPredpr,
 UnitEditDocRecl,UnitSprUzelMachine,UnitEditElementGroup,UnitSprCodeFaults,
 UnitEditCodeFailure,UnitConfigUser,UnitReportRecl;

{User procedures}
procedure SetCaptionForm(vframe:TFrameBase; vCaption: string);
begin
  frmMain.SetCaptionForm(vframe,vCaption);
end;


procedure PageFree(const IdPage:integer);
begin
  frmMain.PageFree(IdPage);
end;

procedure OpenPage(const PgName:string;IdParent: integer=0;ParentFrame: TFrameBase=nil;
                       const ParentControll: integer=0; const IDItem: integer=0;
                       const pSelect:TrcTypeSelect=rcNotSelect);
begin
  frmMain.OpenPage(PgName,IdParent,ParentFrame,ParentControll,IDItem,pSelect);
end;

procedure SelectChildFrame(const IDItemSelect: TItemSelect; const IDHwnd: integer);
begin
  frmMain.SelectChildFrame(IDItemSelect,IDHwnd);
end;

procedure SendMSGUpdateTable(const tablename: string);
begin
  frmMain.SendMSGUpdateTable(tablename);
end;


procedure ClosePage(const IdPage:integer);
begin
  frmMain.ClosePage(IdPage);
end;


procedure CloseChildPage(const IdPage:integer);
begin
   frmMain.CloseChildPage(IdPage);
end;

function GetPageInfo(const IDHwnd:integer):PrcRecordPage;
begin
  Result:= frmMain.GetPageInfo(IDHwnd);
end;


{TfrmMain}


procedure TfrmMain.CloseChildPage(const IdPage: integer);
Var i: integer;
    pRec:PrcRecordPage;
begin
  i:= m_lListFrame.Count;
  While i>0 Do
  begin
     pRec:= PrcRecordPage(m_lListFrame.Items[i-1]);
     if (pRec^.ParentCode=IdPage)Then
     Begin
       //����� ���� ������� �� ��� �� �����
       //� ������ ���� �� ������ ����
       pRec^.rcFrame.CloseFrame;
     End;
     i:= i - 1;
  end;
end;

procedure TfrmMain.ClosePage(const IdPage: integer);
Var i: integer;
    pRec:PrcRecordPage;
begin
  CloseChildPage(IdPage);
  i:= m_lListFrame.Count;
  While i>0 Do
  begin
     pRec:= PrcRecordPage(m_lListFrame.Items[i-1]);
     if (pRec^.CodePage=IdPage)Then
     Begin
       m_lListFrame.Delete(i-1);
       break;
     End;
     i:= i - 1;
  end;
  i:= i - 1;
  if (i>0) then
  begin
    MainPageControl.ActivePage:= PrcRecordPage(m_lListFrame.Items[i-1])^.rcPage;
    PrcRecordPage(m_lListFrame.Items[i-1])^.rcFrame.SetFocusDefault();
  end;
end;

procedure TfrmMain.ClosePageFromPage(page: TcxTabSheet);
Var i: integer;
    pRec:PrcRecordPage;
begin
  ////
  i:= m_lListFrame.Count;
  While i>0 Do
  begin
     pRec:= PrcRecordPage(m_lListFrame.Items[i-1]);
     if (pRec^.rcPage=page)Then
     Begin
        prec^.rcFrame.CloseFrame;
        Exit;
     End;
     i:= i - 1;
  end;
end;

procedure TfrmMain.dxBarButton1Click(Sender: TObject);
begin
  OpenPage('TFrmeSprBelaz');
end;

procedure TfrmMain.dxBarButton2Click(Sender: TObject);
begin
    OpenPage('TfrmSprPredpr');
end;

procedure TfrmMain.dxBarButton3Click(Sender: TObject);
begin
    OpenPage('TfrmSprQuarry');
end;

procedure TfrmMain.dxBarButton5Click(Sender: TObject);
begin
  OpenPage('TfrmJournalReclamation');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitializationForm;
end;

function TfrmMain.GetCaptionPageFromIndex(const PageIndex: integer): string;
begin
  //
  OpenPage('TFrmeSprBelaz');
end;

function TfrmMain.GetNamePageFromIndex(const PageIndex: integer): string;
begin
  case PageIndex of
    1: Result:= 'TFrmeSprBelaz';
    2: Result:= 'TfrmSprPredpr';
    3: Result:= 'TfrmSprQuarry';
    4: Result:= 'TfrmSprModel_Machine';
    10: Result:= 'TfrmJournalReclamation';
    5: Result:= 'TframeNodeMachine';
    6: Result:= 'TfrmCodeFault';
  end;
end;

function TfrmMain.GetNewCodePage: integer;
begin
  m_iCountPage:= m_iCountPage + 1;
  Result:= m_iCountPage;
end;

function TfrmMain.GetPageInfo(const IDHwnd: integer): PrcRecordPage;
Var i: integer;
    pRec:PrcRecordPage;
begin
  Result:= nil;
  i:= m_lListFrame.Count;
  While i>0 Do
  begin
     pRec:= PrcRecordPage(m_lListFrame.Items[i-1]);
     if (pRec^.CodePage=IDHwnd)Then
     Begin
       Result:=pRec;
       Exit;
     End;
     i:= i - 1;
  end;
end;

procedure TfrmMain.InitializationForm;
begin
  m_iPreviosItemIndex:= -1;
  m_lListFrame:= TList.Create;

  RegisterClass(TFrmeSprBelaz);
  RegisterClass(TfrmSprPredpr);
  RegisterClass(TfrmSprQuarry);
  RegisterClass(TfrmSprModel_Machine);
  RegisterClass(TfrmEditMachine);
  RegisterClass(TframeEditQuarry);
  RegisterClass(TfrmJournalReclamation);
  RegisterClass(TframeDocRecl);
  RegisterClass(TframeNodeMachine);
  RegisterClass(TframeEditElementGroup);
  RegisterClass(TfrmEditPredrp);
  RegisterClass(TfrmCodeFault);
  RegisterClass(TframeEditCodeFailure);
  RegisterClass(TfrmConfigUser);
  registerClass(TfrmReportRecl);
end;

procedure TfrmMain.MainPageControlChange(Sender: TObject);
begin
  if MainPageControl.ActivePage<>nil then
  begin
    SetFocusFrame(MainPageControl.ActivePage);
  end;
end;

procedure TfrmMain.MainPageControlClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  AllowClose:= False;
  if MainPageControl.ActivePage<>nil Then
    ClosePageFromPage(MainPageControl.ActivePage);
end;

procedure TfrmMain.MainSideBarItemClick(Sender: TObject; Item: TdxSideBarItem);
begin
  OpenPage(GetNamePageFromIndex(Item.Tag));
end;

procedure TfrmMain.mnuReferense_avtoClick(Sender: TObject);
begin
  OpenPage('TFrmeSprBelaz');
//
end;

procedure TfrmMain.mnuReferense_elementClick(Sender: TObject);
begin
    OpenPage('TframeNodeMachine');
end;

procedure TfrmMain.mnuReferense_modelClick(Sender: TObject);
begin
  OpenPage('TfrmSprModel_Machine');
end;

procedure TfrmMain.mnuReferense_model_engineClick(Sender: TObject);
begin
  //OpenPage(4);
  ShowMessage('�������� �������� ������� �� ��������');
end;

procedure TfrmMain.N14Click(Sender: TObject);
begin
    OpenPage('TfrmReportRecl');
end;

procedure TfrmMain.OpenPage(const PgName:string;
          IdParent: integer=0;ParentFrame: TFrameBase=nil;
          const ParentControll: integer=0;const IDItem: integer=0;const pSelect:TrcTypeSelect=rcNotSelect);
Var pRec:PrcRecordPage;
    i: integer;
    TryFind: Boolean;
    pFrm: TFrameBase;
    pParentID: integer;
begin
  if Length(PgName)=0 then
      Exit;
  if ParentFrame=nil Then
    pParentID:= 0
  else
    pParentID:= ParentFrame.GetIDFrame;

  i:= m_lListFrame.Count;
  TryFind:= False;
  pRec:=nil;
  While i>0 Do
  begin
     pRec:= PrcRecordPage(m_lListFrame.Items[i-1]);
     if (pRec^.NamePage=PgName) and (pRec^.ParentCode=pParentID)
     and (pRec^.ParentIDControll=ParentControll) Then
     Begin
       //���� ������������ � ��� ��������� ������ ���� ���������
       //��������� ��������

       //�� � ��������� ��������� ����������� �� ���������� ��� ��������
       TryFind:= True;
       Break;
     End;
     i:= i - 1;
  end;
  if Not Tryfind then
  Begin
    New(pRec);
    pRec^.rcPage:= TcxTabSheet.Create(Self);
    pRec^.CodePage:= GetNewCodePage;
    pRec^.rcPage.Tag:=pRec^.CodePage;
    pRec^.ParentIDControll:=ParentControll;
    pRec^.ParentCode:= pParentID;
    pRec^.NamePage:= PgName;
    //pRec^.rcPage.Caption:= PgName;
    pRec^.rcPage.PageControl:= MainPageControl;
    m_lListFrame.Add(pRec);

    //������ ������ ��������� ������� ����� ������ �������� ������
    if IDItem<>0 then
      AddParamID(pRec^.CodePage,IDItem);
    if ParentControll<>0 then
      AddParamCtrl(pRec^.CodePage,ParentControll);
    if pSelect<>rcNotSelect then
      AddParamSelect(pRec^.CodePage,1);
    if IdParent<>0 then
      AddParamParentID(pRec^.CodePage,IdParent);

//   ������ �� ������ ����� ����� ����� ����� ������ ��� � �����
//   ����������� � � ��������� ������ ������ �� ����� ����
//   ������. ����� ���� ������ ����������
//05.07.2006 ��� ���� ����� ���������� �� ����� �������� �����������

   pFrm:= TFrameBaseClass(FindClass(PgName)).CreateFrm(self,pRec^.CodePage);
   //�������� � ����� � ��� ��� IDE
   //�� ���� ������������� �������� ��������� � ������������
   //�� TFrame ����� ������ �� TForm
   pFrm.BorderStyle:= bsNone;
   pFrm.Parent:= pRec^.rcPage;
   pFrm.Left:= 0;
   pFrm.Top:= 0;
   pFrm.Align:= alClient;
   //****************************
   //pFrm.AutoSize:= True;
   pFrm.InitializeModul;
   pFrm.Visible:= True;
   //**************************


   pRec^.rcFrame:= pFrm;
   MainPageControl.ActivePage:= pRec^.rcPage;
  End
  else
  begin
    //���� ����� �� ����� ����� ������ ������ ��� ��� ���� � ���
    //���� ��� �� ����� ����� �����
    if pRec^.rcPage=nil Then begin
       Exception.Create('Error parametr page');
       Exit;
    end;
    //������ �������� ������ ��������
    MainPageControl.ActivePage:= pRec^.rcPage;
  end;
end;

procedure TfrmMain.PageFree(const IdPage: integer);
Var pPage: PrcRecordPage;
begin
  pPage:=GetPageInfo(IdPage);
  pPage.rcPage.Free;
end;

procedure TfrmMain.SelectChildFrame(const IDItemSelect: TItemSelect; const IDHwnd: integer);
Var pRec,pParentRec:PrcRecordPage;
begin
  pRec:= GetPageInfo(IDHwnd);
  if pRec.ParentCode>0 Then
  begin
    pParentRec:= GetPageInfo(pRec.ParentCode);
    pParentRec.rcFrame.SelectChild(IDItemSelect,pRec.ParentIDControll);
  end;
end;

procedure TfrmMain.SendMSGUpdateTable(const tablename: string);
Var pRec:PrcRecordPage;
    i: integer;
begin
  i:= m_lListFrame.Count;
  While i>0 Do
  begin
     pRec:= PrcRecordPage(m_lListFrame.Items[i-1]);
     pRec.rcFrame.UpdateTable(tablename);
     i:= i - 1;
  end;
end;

procedure TfrmMain.SetCaptionForm(vframe: TFrameBase; vCaption: string);
Var pRec:PrcRecordPage;
begin
  pRec:= GetPageInfo(vframe.GetIDFrame);
  pRec.rcPage.Caption:= vCaption;
end;

procedure TfrmMain.SetFocusFrame(Page: TcxTabSheet);
Var i: integer;
    pRec:PrcRecordPage;
begin
  ////
  i:= m_lListFrame.Count;
  While i>0 Do
  begin
     pRec:= PrcRecordPage(m_lListFrame.Items[i-1]);
     if (pRec^.rcPage=page)Then
     Begin
        prec^.rcFrame.SetFocusDefault;
        Exit;
     End;
     i:= i - 1;
  end;
end;

end.
