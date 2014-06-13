unit CalculatorOperationViaEtalonTest;

interface

uses
  TestFrameWork,
  Calculator,
  CalculatorOperationViaEtalonBaseTest
  ;

 type
  TCalculatorOperationViaEtalonTest = class(TCalculatorOperationViaEtalonBaseTest)
   private
    procedure CheckOperation(aX1, aX2: Double;
                             anOperation : TCalcOperation); overload;
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
  end;//TCalculatorOperationViaEtalonTest

implementation

uses
  Tests.Logger,
  SysUtils
  ;

{ TCalculatorOperationViaEtalonTest }

procedure TCalculatorOperationViaEtalonTest.CheckOperation(aX1, aX2: Double;
                                                           anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    CheckOperation(aLogger, aX1, aX2, anOperation);
   end
  );
end;

const
 cA = 5;
 cB = 10;

procedure TCalculatorOperationViaEtalonTest.TestDiv;
begin
  CheckOperation(cA, cB, TCalculator.Divide);
end;

procedure TCalculatorOperationViaEtalonTest.TestSub;
begin
  CheckOperation(cA, cB, TCalculator.Sub);
end;

procedure TCalculatorOperationViaEtalonTest.TestMul;
begin
  CheckOperation(cA, cB, TCalculator.Mul);
end;

procedure TCalculatorOperationViaEtalonTest.TestAdd;
begin
  CheckOperation(cA, cB, TCalculator.Add);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaEtalonTest.Suite);
end.
