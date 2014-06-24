program DummyCalculator;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {fmMain},
  GUITestRunner,
  FirstTest in 'Tests\FirstTest.pas',
  CalculatorGUITest in 'Tests\GUI\CalculatorGUITest.pas',
  PlusTest in 'Tests\GUI\PlusTest.pas',
  OperationTest in 'Tests\GUI\OperationTest.pas',
  MinusTest in 'Tests\GUI\MinusTest.pas',
  MulTest in 'Tests\GUI\MulTest.pas',
  DivTest in 'Tests\GUI\DivTest.pas',
  RandomPlusTest in 'Tests\GUI\RandomPlusTest.pas',
  Calculator in 'Logic\Calculator.pas',
  CalculatorOperationViaEtalonTest in 'Tests\Logic\CalculatorOperationViaEtalonTest.pas',
  Tests.Logger in 'Tests\Utils\Tests.Logger.pas',
  CalculatorOperationViaLogicTest in 'Tests\Logic\CalculatorOperationViaLogicTest.pas',
  CalculatorOperationRandomSequenceTest in 'Tests\Logic\CalculatorOperationRandomSequenceTest.pas',
  divinttest in 'tests\gui\divinttest.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  GUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
