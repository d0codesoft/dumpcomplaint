unit UnitJornalReclamation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul,UnitUserPWD, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls;

type
  TfrmJournalReclamation = class(TframeBase)
    RzToolbar1: TRzToolbar;
    tbbtnClose: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tbbtnPeriod: TRzToolButton;
    browserDBView: TcxGridDBTableView;
    browserLevel: TcxGridLevel;
    browser: TcxGrid;
    SQLQuery: TADOQuery;
    SQLDataSource: TDataSource;
    browserDBViewID: TcxGridDBColumn;
    browserDBViewADVENTURE_ID: TcxGridDBColumn;
    browserDBViewMACHINE_ID: TcxGridDBColumn;
    browserDBViewDATE_FILURE: TcxGridDBColumn;
    browserDBViewDATE_NOTIFI: TcxGridDBColumn;
    browserDBViewFAILUR_ELEMENTS_ID: TcxGridDBColumn;
    browserDBViewSTATUS_RECL: TcxGridDBColumn;
    browserDBViewTB_ADVENTUREDESCR: TcxGridDBColumn;
    browserDBViewTB_MACHINEDESCR: TcxGridDBColumn;
    browserDBViewNUMBER_CHASSIS: TcxGridDBColumn;
    browserDBViewNUMBER_RECLAMATION: TcxGridDBColumn;
    browserDBViewMACHINE_ELEMENT: TcxGridDBColumn;
    RzSpacer2: TRzSpacer;
    tbbtnNewDoc: TRzToolButton;
    tbbtnEditDoc: TRzToolButton;
    tbbtnDeleteDoc: TRzToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbbtnPeriodClick(Sender: TObject);
    procedure browserDBViewDblClick(Sender: TObject);
    procedure tbbtnNewDocClick(Sender: TObject);
    procedure tbbtnEditDocClick(Sender: TObject);
    procedure tbbtnCloseClick(Sender: TObject);
  private
    { Private declarations }
    m_MinDate: TDateTime;
  protected
    procedure InitializeFrame; override;

    procedure RefreshSQLDataSet;
    procedure RefreshMinDate;
    procedure SelectItem;
  public
    procedure InitializeModul; override;
    procedure UpdateTable(const tablename: string); override;
    { Public declarations }
    procedure ChangePeriod;
  end;

var
  frmJournalReclamation: TfrmJournalReclamation;

implementation

{$R *.dfm}

Uses DateUtils,UnitDLG_date;

{ TfrmJournalReclamation }

procedure TfrmJournalReclamation.browserDBViewDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmJournalReclamation.ChangePeriod;
Var DlgDate: TfrmDLG_Date;
begin
  DlgDate:= TfrmDLG_Date.Create(Self);
  DlgDate.Data:= m_MinDate;
  if DlgDate.ShowModal=mrOK Then
  begin
     m_MinDate:= DlgDate.Data;
     RefreshMinDate;
     RefreshSQLDataSet;
  end;
  DlgDate.Free;
end;

procedure TfrmJournalReclamation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmJournalReclamation.InitializeFrame;
begin
  inherited;
  //
  //Инициализируем переменные
  //и также открываем датасет
  //SQLQuery.Active:= True;
  m_MinDate:= StartOfAYear(YearOf(Today));
  RefreshMinDate;
  RefreshSQLDataSet;
end;

procedure TfrmJournalReclamation.InitializeModul;
begin
  inherited;
  SetCaptionForm(Self,'Журнал рекламаций');
end;

procedure TfrmJournalReclamation.RefreshMinDate;
begin
  tbbtnPeriod.Caption:= 'Начало :'+DateToStr(m_MinDate);
end;

procedure TfrmJournalReclamation.RefreshSQLDataSet;
Var Par: ADODB.TParameter;
begin
  if SQLQuery.Active then
    SQLQuery.Active:= False;

  Par:= SQLQuery.Parameters.FindParam('[:MinDate]');
  if Par=nil then
  begin
     Par:= SQLQuery.Parameters.AddParameter;
     par.Name:= '[:MinDate]';
  end;

  Par.Value:= m_MinDate;
  SQLQuery.Active:= True;
end;

procedure TfrmJournalReclamation.SelectItem;
Var idSelect: Integer;
    infoSelect: TItemSelect;
begin
  if browserDBView.Controller.FocusedRecord<>nil then
  begin
    idSelect:=browserDBView.Controller.FocusedRecord.Values[browserDBViewID.Index];
    if m_select>0 then
    begin
      infoSelect.Descr:= browserDBView.Controller.FocusedRecord.Values[browserDBViewNUMBER_RECLAMATION.Index];
      infoSelect.IDItem:= idSelect;
      SelectChildFrame(infoSelect,self.m_IDHWND);
      if m_select=1 then
      begin
        CloseFrame;
        Exit;
      end;
    end
    else
    begin
      frmMain.OpenPage('TframeDocRecl',0,nil,idSelect,idSelect);
    end;
  end;
end;

procedure TfrmJournalReclamation.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmJournalReclamation.tbbtnEditDocClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmJournalReclamation.tbbtnNewDocClick(Sender: TObject);
begin
  frmMain.OpenPage('TframeDocRecl',0,nil,0,0);
end;

procedure TfrmJournalReclamation.tbbtnPeriodClick(Sender: TObject);
begin
  ChangePeriod;
end;

procedure TfrmJournalReclamation.UpdateTable(const tablename: string);
Var VarP: integer;
begin
  inherited;

  if tablename='TB_RECLAMATION' then
  begin
    VarP:= 0;
    if Not SQLQuery.IsEmpty then
      VarP:= SQLQuery.FieldValues['ID'];

    SQLQuery.Requery();

    if VarP>0 then
      SQLQuery.Locate('ID',VarP,[]);
  end;
  //
end;

end.
