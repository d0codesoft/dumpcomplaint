unit UnitFormFotoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitFrameBase,UnitModulFoto,UnitUserPWD, RzButton, ExtCtrls, RzPanel, ieview, imageenview, imageen;

type
  TFormFotoView = class(TForm)
    BrowseImage: TImageEn;
    MainTollbar: TRzToolbar;
    tbbtnClose: TRzToolButton;
    tbbtnUp: TRzToolButton;
    tbbtnDown: TRzToolButton;
    tbbtnZoomReal: TRzToolButton;
    tbbtnZoomEnlarge: TRzToolButton;
    tbbtnZoomMiniature: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzSpacer2: TRzSpacer;
    procedure tbbtnZoomRealClick(Sender: TObject);
    procedure tbbtnZoomEnlargeClick(Sender: TObject);
    procedure tbbtnZoomMiniatureClick(Sender: TObject);
    procedure tbbtnUpClick(Sender: TObject);
    procedure tbbtnDownClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    m_Prov: TRcListFoto;
    m_CurrIndex: integer;
  public
    { Public declarations }
    procedure SetFoto(index:integer);
    procedure SetProvaderFoto(vProv:TRcListFoto);
    property GetCurrentFotoIndex: integer read m_CurrIndex;
  end;

var
  FormFotoView: TFormFotoView;

implementation

{$R *.dfm}

Uses UnitEditDocRecl;

{ TFormFotoView }

procedure TFormFotoView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Self.Owner is TframeDocRecl) Then
     TframeDocRecl(Self.Owner).FotoCloseWindow;
  Action:= caFree;
end;

procedure TFormFotoView.SetFoto(index: integer);
Var vFileName: string;
begin
  if m_Prov=nil then
    exit;
  vFileName:= m_Prov.GetFotoFullFileName(index);
  if Length(vFileName)=0 Then
    Exit;

  m_CurrIndex:= index;
  BrowseImage.IO.LoadFromFile(vFileName);
end;

procedure TFormFotoView.SetProvaderFoto(vProv: TRcListFoto);
begin
  m_Prov:= vProv;
end;

procedure TFormFotoView.tbbtnDownClick(Sender: TObject);
begin
  if m_CurrIndex<m_Prov.GetCountFoto then
  begin
    SetFoto(m_CurrIndex + 1);
  end;
end;

procedure TFormFotoView.tbbtnUpClick(Sender: TObject);
begin
  if (m_CurrIndex>1) then
  begin
    SetFoto(m_CurrIndex - 1);
  end;
end;

procedure TFormFotoView.tbbtnZoomEnlargeClick(Sender: TObject);
Var tZoom: double;
begin
  tZoom:= BrowseImage.Zoom;
  if tZoom<201 then
    BrowseImage.Zoom:= tZoom + 20;
end;

procedure TFormFotoView.tbbtnZoomMiniatureClick(Sender: TObject);
begin
  if BrowseImage.Zoom>40 then
    BrowseImage.Zoom:= BrowseImage.Zoom - 20;
end;

procedure TFormFotoView.tbbtnZoomRealClick(Sender: TObject);
begin
  BrowseImage.Zoom:= 100;
end;

end.
