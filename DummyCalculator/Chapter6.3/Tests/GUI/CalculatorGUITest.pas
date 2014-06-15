unit CalculatorGUITest;

interface

uses
  TestFrameWork,
  MainForm,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest,
  CalculatorOperationViaEtalonBaseTest
  ;

type
  TCalculatorGUITest = class abstract(TCalculatorOperationViaEtalonBaseTest)
   protected
     procedure VisitForm(aForm: TfmMain; aLogger: TLogger; anOperation : TOperation); virtual; abstract;
     procedure DoOp(aLogger: TLogger; anOp: TOperation; anOperation : TCalcOperation); override;
  end;//TCalculatorGUITest

implementation

uses
  Forms
  ;

procedure TCalculatorGUITest.DoOp(aLogger: TLogger; anOp: TOperation; anOperation : TCalcOperation);
var
 l_Index : Integer;
begin
 for l_Index := 0 to Screen.FormCount do
  if (Screen.Forms[l_Index] Is TfmMain) then
  begin
   VisitForm(Screen.Forms[l_Index] As TfmMain, aLogger, anOp);
   break;
  end;//Screen.Forms[l_Index] Is TfmMain
end;

end.
