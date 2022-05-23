{-----------------------------------------------------------------------------
 Unit Name: UnitUserPWD
 Author:    Admin
 Date:      07-Лип-2006
 Purpose:
 History:   Итак было жаркое летнее утро. В этот день проснувшись я
 я и посмотрев в окно ничего не заметил а зря.
 На линии горизонта уже показалря огненый диск солнца, заливающий
 все пространство ярким светом, наполняя его горячим воздухом.
 Внизу на площадке ничего не происходило обычного
 просто утро.
 **********************
 Система построена на такой логике, есть глобальный обьект (правда тяжело назвать его глобальным)
 PageControll (даже не знаю как это звучит на руском) корый есть контейнером
 для фреймов содержащих всю функциональность.
 Все фреймы имеют один базовый класс.
 **********************
 И вот настал жаркий летний день. В этот как и во все предыдущие дни я ничего
 не подозревая ехал на машрутном такси в строну работы, за окном мелькали знакомые пейзажи
 мимо проносиилсь теже машины что и вчера. Но что-то шептало мне не так в этом мире.
 **********************
 За создание и уничтожение контейнеров для фреймов, отвечают
 Public функции Main формы.
 // 07.07.2006 9:33 GMT+2

 // 11.07.2006 16:45GMT+2
 Вроде начинает прояснятся
 Выловил пару серьезных багов
 1 нужно обязательно в новый формах переопределять метод Close caFree
 иначе форма сама не уничтожается и ничего из того что нужно не происходит
 правда можно было самому вызвать но както так лючше правильнее
 скажем так ей виднее когда выгрузится
 **********************
 Чемпионат мира WC2006 выиграла Италия.
 Что очень приятно. Правда все это омрачилось скандалом с удалением Зидана.
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
    //Временно потом будет TFrame
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
    //Возвратщает информацию о старнице
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

  //Процедура удаляет закладку
  //если закрытие происходит по требованию формы
  procedure PageFree(const IdPage:integer);

  //Сообщение родительской форме о выборе в дочерней формы элемента
  procedure SelectChildFrame(const IDItemSelect: TItemSelect; const IDHwnd: integer);

  //Сообщение всем формам о обновлении данных в таблице
  procedure SendMSGUpdateTable(const tablename: string);

  //Инициирует закрытие дочерних форм при закрытии родительской формы
  procedure CloseChildPage(const IdPage:integer);

  //Удаляет регистрацию формы в закладках
  //и вызывает закрытие дочерних форм путем вызова функцииCloseChildPage
  procedure ClosePage(const IdPage:integer);

  //Возвращает структуру с информацией о форме по ее идентификатору
  function GetPageInfo(const IDHwnd:integer):PrcRecordPage;

  //Открывает создает если не создана форма и ее окружение
  //и регистрирует параметры формы
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
       //Форма сама закроет то что ей нужно
       //и удалит себя из списка форм
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
  ShowMessage('Извините временно функция не работает');
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
       //Если наименование и код совпадают значит пора открывать
       //требуемую закладку

       //Да и незабудем проверить зависимость по владельцам при закрытии
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

    //Теперь вложим параметры которые форма должна получить сейчас
    if IDItem<>0 then
      AddParamID(pRec^.CodePage,IDItem);
    if ParentControll<>0 then
      AddParamCtrl(pRec^.CodePage,ParentControll);
    if pSelect<>rcNotSelect then
      AddParamSelect(pRec^.CodePage,1);
    if IdParent<>0 then
      AddParamParentID(pRec^.CodePage,IdParent);

//   Теперь на данном этапе будут много много текста что в корне
//   неправильно и я протестую против такого но иначе пока
//   нельзя. Токмо руки дойдут переделаем
//05.07.2006 Уже руки дошли переделали на более приятную конструкцию

   pFrm:= TFrameBaseClass(FindClass(PgName)).CreateFrm(self,pRec^.CodePage);
   //Временно в связи с тем что IDE
   //не дает возсмможности работать нормально с наследниками
   //от TFrame будем лобать от TForm
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
    //Если нашли то тогда будем делать только так как есть у нас
    //если нет то тогда можно иначе
    if pRec^.rcPage=nil Then begin
       Exception.Create('Error parametr page');
       Exit;
    end;
    //Делаем активным текщую закладку
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
