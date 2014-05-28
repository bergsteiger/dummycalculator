unit CalculatorOperationTest;

interface

uses
  TestFrameWork,
  Calculator
  ;

 type
  TCalculatorOperationTest = class(TTestCase)
   published
    procedure LogicTestDiv;
    procedure LogicTestMul;
    procedure LogicTestAdd;
    procedure LogicTestSub;
    procedure LogicTestSubError;
  end;//TCalculatorOperationTest

implementation

  uses
   SysUtils;

const
 cA = '5';
 cB = '10';
{ TCalculatorOperationTest }

procedure TCalculatorOperationTest.LogicTestDiv;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Divide(x2, x1));
  CheckTrue(2 = result);
end;

procedure TCalculatorOperationTest.LogicTestSub;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Sub(x2, x1));
  CheckTrue(5 = result);

end;

procedure TCalculatorOperationTest.LogicTestSubError;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Sub(x2, x1));
  CheckFalse(7 = result);
end;

procedure TCalculatorOperationTest.LogicTestMul;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Mul(x2, x1));
  CheckTrue(50 = result);
end;

procedure TCalculatorOperationTest.LogicTestAdd;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Add(x2, x1));
  CheckTrue(15 = result);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationTest.Suite);
end.
