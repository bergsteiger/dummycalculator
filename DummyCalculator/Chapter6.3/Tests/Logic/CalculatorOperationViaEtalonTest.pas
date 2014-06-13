unit CalculatorOperationViaEtalonTest;

interface

uses
  TestFrameWork,
  Calculator,
  CalculatorOperationViaEtalonBaseTest,
  Tests.Logger
  ;

 type
  TCalculatorOperationViaEtalonTest = class(TCalculatorOperationViaEtalonBaseTest)
   private
    procedure DoOp(aLogger: TLogger; anOperation : TCalcOperation); override;
  end;//TCalculatorOperationViaEtalonTest

implementation

uses
  SysUtils
  ;

{ TCalculatorOperationViaEtalonTest }

const
 cA = 5;
 cB = 10;

procedure TCalculatorOperationViaEtalonTest.DoOp(aLogger: TLogger; anOperation : TCalcOperation);
begin
  CheckOperation(aLogger,
                 cA,
                 cB, anOperation);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaEtalonTest.Suite);
end.
