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
    procedure CheckOperation(aX1, aX2: string;
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

procedure TCalculatorOperationViaEtalonTest.CheckOperation(aX1, aX2: string;
                                                           anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    CheckOperation(aLogger, StrToFloat(aX1), StrToFloat(aX2), anOperation);
   end
  );
end;

const
 cA = '5';
 cB = '10';

procedure TCalculatorOperationViaEtalonTest.TestDiv;
var
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Divide);
end;

procedure TCalculatorOperationViaEtalonTest.TestSub;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Sub);
end;

procedure TCalculatorOperationViaEtalonTest.TestMul;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Mul);
end;

procedure TCalculatorOperationViaEtalonTest.TestAdd;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;

  CheckOperation(x1, x2, TCalculator.Add);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaEtalonTest.Suite);
end.
