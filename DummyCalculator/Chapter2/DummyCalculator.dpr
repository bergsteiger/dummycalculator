program DummyCalculator;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {fmMain},
  GUITestRunner,
  FirstTest in 'Tests\FirstTest.pas',
  CalculatorGUITest in 'Tests\CalculatorGUITest.pas',
  PlusTest in 'Tests\PlusTest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  GUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
