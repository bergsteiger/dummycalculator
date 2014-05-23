program DummyCalculator;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {fmMain},
  GUITestRunner,
  FirstTest in 'Tests\FirstTest.pas',
  CalculatorGUITest in 'Tests\CalculatorGUITest.pas',
  PlusTest in 'Tests\PlusTest.pas',
  OperationTest in 'Tests\OperationTest.pas',

  MinusTest in 'Tests\MinusTest.pas',
  MulTest in 'Tests\MulTest.pas',
  DivTest in 'Tests\DivTest.pas'
  ;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  GUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
