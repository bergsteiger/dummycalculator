program DummyCalculator;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {fmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
