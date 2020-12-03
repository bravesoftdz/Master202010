program Mobile_Project;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  uMobileDM in 'uMobileDM.pas' {MobileDM: TDataModule},
  uMobile_Client in 'uMobile_Client.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMobileDM, MobileDM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
