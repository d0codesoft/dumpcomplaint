program reclamation;

uses
  Forms,
  UnitUserPWD in 'UnitUserPWD.pas' {frmMain},
  UnitUSER in 'UnitUSER.pas' {frmStart},
  UnitDBModul in 'UnitDBModul.pas' {RCDataModule: TDataModule},
  UnitShow in 'UnitShow.pas' {frmShow},
  UnitFrameSpr in 'UnitFrameSpr.pas' {FrmeSprBelaz: TFrame},
  UnitFrameBase in 'UnitFrameBase.pas' {frameBase: TFrame},
  UniFrameEditMachine in 'UniFrameEditMachine.pas' {frmEditMachine: TFrame},
  UnitSprPredpr in 'UnitSprPredpr.pas' {frmSprPredpr: TFrame},
  UnitSprQuarry in 'UnitSprQuarry.pas' {frmSprQuarry: TFrame},
  UnitSprModelMachine in 'UnitSprModelMachine.pas' {frmSprModel_Machine: TFrame},
  UnitEditQuarry in 'UnitEditQuarry.pas' {frameEditQuarry},
  UnitFrmEditPredpr in 'UnitFrmEditPredpr.pas' {frmEditPredrp},
  UnitJornalReclamation in 'UnitJornalReclamation.pas' {frmJournalReclamation},
  UnitDLG_date in 'UnitDLG_date.pas' {frmDLG_Date},
  UnitEditDocRecl in 'UnitEditDocRecl.pas' {frameDocRecl},
  UnitSprUzelMachine in 'UnitSprUzelMachine.pas' {frameNodeMachine},
  UnitEditElementGroup in 'UnitEditElementGroup.pas' {frameEditElementGroup},
  UnitSprCodeFaults in 'UnitSprCodeFaults.pas' {frmCodeFault},
  UnitEditCodeFailure in 'UnitEditCodeFailure.pas' {frameEditCodeFailure},
  UnitModulFoto in 'UnitModulFoto.pas',
  UnitFormFotoView in 'UnitFormFotoView.pas' {FormFotoView},
  UnitProgramSetings in 'UnitProgramSetings.pas',
  UnitconfigUser in 'UnitconfigUser.pas' {frmConfigUser},
  UnitReportRecl in 'UnitReportRecl.pas' {frmReportRecl};

{$R *.res}
Var
  pFrmPWD: TfrmStart;
  resModal: integer;

begin
  Application.Initialize;

  Application.CreateForm(TRCDataModule, RCDataModule);
  if Not RCDataModule.DBConn.Connected then
  begin
    Application.Terminate;
    Exit;
  end;

  pFrmPWD:= TfrmStart.Create(nil);
  resModal:= pFrmPWD.ShowModal;
  if  resModal<> PWD_OK Then
  begin
    pFrmPWD.Free;
    Application.Terminate;
    Exit;
  end;

  Application.CreateForm(TfrmMain, frmMain);
  pFrmPWD.Free;
  Application.Run;
end.
