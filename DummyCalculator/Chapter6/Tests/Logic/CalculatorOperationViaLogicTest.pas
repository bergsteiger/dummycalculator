unit CalculatorOperationViaLogicTest;

interface

uses
  TestFrameWork,
  Calculator
  ;

 type
  TCalculatorOperationViaLogicTest = class(TTestCase)
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
    procedure TestSubError;
  end;//TCalculatorOperationViaLogicTest

implementation

  uses
   SysUtils;

const
 cA = '5';
 cB = '10';
{ TCalculatorOperationViaLogicTest }

procedure TCalculatorOperationViaLogicTest.TestDiv;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Divide(x2, x1));
  CheckTrue(2 = result);
end;

procedure TCalculatorOperationViaLogicTest.TestSub;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Sub(x2, x1));
  CheckTrue(5 = result);

end;

procedure TCalculatorOperationViaLogicTest.TestSubError;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Sub(x2, x1));
  CheckFalse(7 = result);
end;

procedure TCalculatorOperationViaLogicTest.TestMul;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Mul(x2, x1));
  CheckTrue(50 = result);
end;

procedure TCalculatorOperationViaLogicTest.TestAdd;
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
 TestFramework.RegisterTest(TCalculatorOperationViaLogicTest.Suite);
end.
