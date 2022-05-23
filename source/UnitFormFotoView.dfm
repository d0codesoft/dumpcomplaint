object FormFotoView: TFormFotoView
  Left = 0
  Top = 0
  Caption = 'FormFotoView'
  ClientHeight = 556
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object BrowseImage: TImageEn
    Left = 0
    Top = 29
    Width = 654
    Height = 527
    ParentCtl3D = False
    MouseInteract = [miScroll]
    ImageEnVersion = '2.2.3'
    Align = alClient
    TabOrder = 0
  end
  object MainTollbar: TRzToolbar
    Left = 0
    Top = 0
    Width = 654
    Height = 29
    Images = frmMain.ImageSmall
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 1
    ToolbarControls = (
      tbbtnClose
      RzSpacer1
      tbbtnUp
      tbbtnDown
      RzSpacer2
      tbbtnZoomReal
      tbbtnZoomEnlarge
      tbbtnZoomMiniature)
    object tbbtnClose: TRzToolButton
      Left = 4
      Top = 2
      Width = 77
      ImageIndex = 24
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1047#1072#1082#1088#1099#1090#1100
    end
    object tbbtnUp: TRzToolButton
      Left = 89
      Top = 2
      Width = 28
      ImageIndex = 8
      ShowCaption = True
      UseToolbarShowCaption = False
      OnClick = tbbtnUpClick
    end
    object tbbtnDown: TRzToolButton
      Left = 117
      Top = 2
      Width = 28
      ImageIndex = 9
      ShowCaption = True
      UseToolbarShowCaption = False
      OnClick = tbbtnDownClick
    end
    object tbbtnZoomReal: TRzToolButton
      Left = 153
      Top = 2
      Width = 132
      ImageIndex = 14
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1056#1077#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088
      OnClick = tbbtnZoomRealClick
    end
    object tbbtnZoomEnlarge: TRzToolButton
      Left = 285
      Top = 2
      Width = 90
      ImageIndex = 15
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100
      OnClick = tbbtnZoomEnlargeClick
    end
    object tbbtnZoomMiniature: TRzToolButton
      Left = 375
      Top = 2
      Width = 94
      ImageIndex = 16
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #1059#1084#1077#1085#1100#1096#1080#1090#1100
      OnClick = tbbtnZoomMiniatureClick
    end
    object RzSpacer1: TRzSpacer
      Left = 81
      Top = 2
    end
    object RzSpacer2: TRzSpacer
      Left = 145
      Top = 2
    end
  end
end
