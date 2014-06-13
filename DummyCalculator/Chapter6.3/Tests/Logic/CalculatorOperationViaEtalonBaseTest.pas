unit CalculatorOperationViaEtalonBaseTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger;

 type
  TCalcOperation = function (const A, B: string): string of object;

  TCalculatorOperationViaEtalonBaseTest = class abstract(TTestCase)
   protected
    procedure CheckOperation(aLogger: TLogger;
                             aX1, aX2: string;
                             anOperation : TCalcOperation); overload;
  end;//TCalculatorOperationViaEtalonBaseTest

implementation

procedure TCalculatorOperationViaEtalonBaseTest.CheckOperation(aLogger: TLogger;
                         aX1, aX2: string;
                         anOperation : TCalcOperation);
begin
  aLogger.ToLog(aX1);
  aLogger.ToLog(aX2);
  aLogger.ToLog(anOperation(aX1,aX2))
end;

end.
