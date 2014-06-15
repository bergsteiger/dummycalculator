unit CalculatorOperationZeroDivideTest;

interface

uses
  CalculatorOperationViaEtalonBaseTest,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

 type
  TCalculatorOperationZeroDivideTest = class(TCalculatorOperationViaEtalonBaseTest)
   protected
    procedure DoOp(aLogger: TLogger; const anOperation : TCalcOperation); override;
  end;//TCalculatorOperationZeroDivideTest

implementation

uses
  TestFrameWork
  ;

{ TCalculatorOperationViaEtalonTest }

procedure TCalculatorOperationZeroDivideTest.DoOp(aLogger: TLogger; const anOperation : TCalcOperation);
begin
  CheckOperation(aLogger,
                 5,
                 0, anOperation);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationZeroDivideTest.Suite);
end.
