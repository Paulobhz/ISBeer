program ISBeer;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  Datamodule in 'Datamodule.pas' {DataM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDataM, DataM);
  Application.Run;
end.
