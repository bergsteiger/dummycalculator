program DummyCalculator;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {fmMain},
  GUITestRunner,
  FirstTest in 'Tests\FirstTest.pas',
  CalculatorGUITest in 'Tests\GUI\CalculatorGUITest.pas',
  CalculatorOperationViaGUITest in 'Tests\GUI\CalculatorOperationViaGUITest.pas',
  Calculator in 'Logic\Calculator.pas',
  CalculatorOperationViaEtalonTest in 'Tests\Logic\CalculatorOperationViaEtalonTest.pas',
  Tests.Logger in 'Tests\Utils\Tests.Logger.pas',
  CalculatorOperationViaLogicTest in 'Tests\Logic\CalculatorOperationViaLogicTest.pas',
  CalculatorOperationRandomSequenceTest in 'Tests\Logic\CalculatorOperationRandomSequenceTest.pas',
  CalculatorOperationViaEtalonBaseTest in 'Tests\Logic\CalculatorOperationViaEtalonBaseTest.pas',
  CalculatorOperationViaLogicBaseTest in 'Tests\Logic\CalculatorOperationViaLogicBaseTest.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  GUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
