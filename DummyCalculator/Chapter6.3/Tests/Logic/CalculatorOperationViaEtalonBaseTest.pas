unit CalculatorOperationViaEtalonBaseTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

 type
  TCalculatorOperationViaEtalonBaseTest = class abstract(TCalculatorOperationViaLogicBaseTest)
   protected
    procedure CheckOperation(aLogger: TLogger;
                             aX1, aX2: Double;
                             anOperation : TCalcOperation);
  end;//TCalculatorOperationViaEtalonBaseTest

implementation

uses
  System.SysUtils
  ;

procedure TCalculatorOperationViaEtalonBaseTest.CheckOperation(aLogger: TLogger;
                         aX1, aX2: Double;
                         anOperation : TCalcOperation);
begin
  aLogger.ToLog(aX1);
  aLogger.ToLog(aX2);
  aLogger.ToLog(anOperation.rProc(TCalculator.FloatToStr(aX1), TCalculator.FloatToStr(aX2)))
end;

end.
