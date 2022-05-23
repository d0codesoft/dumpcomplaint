unit UnitReportRecl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase, UnitDBModul, UnitUserPWD, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, RzPanel, RzButton, cxPC, ExtCtrls, frxClass, frxADOComponents,
  frxPreview, frxDBSet;

type
  TfrmReportRecl = class(TframeBase)
    FrameToolbar: TRzToolbar;
    tbbtnClose: TRzToolButton;
    SQLPreview: TfrxPreview;
    SQLReportDataSet: TfrxUserDataSet;
    SQLReport: TfrxReport;
    procedure tbbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure InitializeFrame; override;
  public
    { Public declarations }
    procedure UpdateTable(const tablename: string); override;

    procedure InitializeModul; override;
  end;

implementation

{$R *.dfm}
Uses UnitProgramSetings;


procedure TfrmReportRecl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmReportRecl.InitializeFrame;
begin
  inherited;


  SQLReportDataSet.Fields.Add('DateReport');
  SQLReportDataSet.Fields.Add('PREDPR');
  SQLReportDataSet.Fields.Add('OTGRUZKA');
  SQLReportDataSet.Fields.Add('RAC_SHET');
  SQLReportDataSet.Fields.Add('KOMISIY');
  SQLReportDataSet.Fields.Add('PREDSEDATEL');
  SQLReportDataSet.Fields.Add('DEYSTV');
  SQLReportDataSet.Fields.Add('MODEL');
  SQLReportDataSet.Fields.Add('MACHINE');
  SQLReportDataSet.Fields.Add('POSTAVHIK');
  SQLReportDataSet.Fields.Add('DATE_START');
  SQLReportDataSet.Fields.Add('PROBEG');
  SQLReportDataSet.Fields.Add('DATA_POLOMKA');
  SQLReportDataSet.Fields.Add('DOROGA');
  SQLReportDataSet.Fields.Add('SKOROST');
  SQLReportDataSet.Fields.Add('GRUZ');
  SQLReportDataSet.Fields.Add('POLOMKA');
  SQLReportDataSet.Fields.Add('INFO');
  SQLReportDataSet.Fields.Add('KOSIY_MNENIE');
  SQLReportDataSet.Fields.Add('KOMISIY_REHENIE');

  SQLReport.LoadFromFile(GetProgramInfo(rcInfoDirReport)+'\Report_1.rp');
  SQLReport.ShowReport();
  //
  //Инициализируем переменные
  //и также открываем датасет
end;

procedure TfrmReportRecl.InitializeModul;
begin
  inherited;
  SetCaptionform(Self,'');
end;

procedure TfrmReportRecl.tbbtnCloseClick(Sender: TObject);
begin
  CloseFrame;
end;

procedure TfrmReportRecl.UpdateTable(const tablename: string);
Var VarP:integer;
begin
  inherited;
end;

end.
