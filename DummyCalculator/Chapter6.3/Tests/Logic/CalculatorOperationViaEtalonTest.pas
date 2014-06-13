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
    procedure CheckOperation(aX1, aX2: Double;
                             anOperation : TCalcOperation); overload;
    procedure DoOp(aLogger: TLogger; anOperation : TCalcOperation); override;
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
  end;//TCalculatorOperationViaEtalonTest

implementation

uses
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

procedure TCalculatorOperationViaEtalonTest.DoOp(aLogger: TLogger; anOperation : TCalcOperation);
begin
  CheckOperation(aLogger,
                 cA,
                 cB, anOperation);
end;

procedure TCalculatorOperationViaEtalonTest.TestDiv;
begin
  DoOp(TCalculator.Divide);
end;

procedure TCalculatorOperationViaEtalonTest.TestSub;
begin
  DoOp(TCalculator.Sub);
end;

procedure TCalculatorOperationViaEtalonTest.TestMul;
begin
  DoOp(TCalculator.Mul);
end;

procedure TCalculatorOperationViaEtalonTest.TestAdd;
begin
  DoOp(TCalculator.Add);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaEtalonTest.Suite);
end.
