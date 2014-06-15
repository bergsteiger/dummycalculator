unit CalculatorOperationViaEtalonTest;

interface

uses
  CalculatorOperationViaEtalonBaseTest,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

 type
  TCalculatorOperationViaEtalonTest = class(TCalculatorOperationViaEtalonBaseTest)
   protected
    procedure DoOp(aLogger: TLogger; const anOperation : TCalcOperation); override;
  end;//TCalculatorOperationViaEtalonTest

implementation

uses
  TestFrameWork
  ;

{ TCalculatorOperationViaEtalonTest }

procedure TCalculatorOperationViaEtalonTest.DoOp(aLogger: TLogger; const anOperation : TCalcOperation);
begin
  CheckOperation(aLogger,
                 5,
                 10, anOperation);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaEtalonTest.Suite);
end.
