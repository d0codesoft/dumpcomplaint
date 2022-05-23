unit UnitBaseFramePgCtrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxControls, cxPC;

type
  TframePageController = class(TFrame)
    frmPageControl: TcxPageControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
