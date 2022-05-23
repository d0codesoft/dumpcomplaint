unit UnitShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxProgressBar, jpeg, ExtCtrls;

type
  TfrmShow = class(TForm)
    TimerShow: TTimer;
    Image1: TImage;
    ProgressBarMin: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    m_Count: integer;
  public
    { Public declarations }
  end;

var
  frmShow: TfrmShow;

implementation

{$R *.dfm}

procedure TfrmShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerShow.Enabled:= False;
  //Action := caFree;
end;

procedure TfrmShow.FormCreate(Sender: TObject);
begin
  ProgressBarMin.Properties.Min:= 0;
  ProgressBarMin.Properties.Max:= 100;
  ProgressBarMin.Position:= 0;
end;

procedure TfrmShow.TimerShowTimer(Sender: TObject);
begin
  m_Count:= m_Count + 1;
  ProgressBarMin.Position:= m_Count;
  if m_Count=100 then
    Close;
end;

end.
