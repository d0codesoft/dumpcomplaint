unit UnitDLG_date;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxLabel;

type
  TfrmDLG_Date = class(TForm)
    cxLabel1: TcxLabel;
    edtDate: TcxDateEdit;
    btnOK: TcxButton;
    btnCansel: TcxButton;
  private
    function GetDate: TDateTime;
    procedure SetDate(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    property Data: TDateTime read GetDate write SetDate;  
  end;

var
  frmDLG_Date: TfrmDLG_Date;

implementation

{$R *.dfm}

{ TForm1 }

function TfrmDLG_Date.GetDate: TDateTime;
begin
  Result:= edtDate.Date;
end;

procedure TfrmDLG_Date.SetDate(const Value: TDateTime);
begin
  edtDate.Date:= Value;
end;

end.
