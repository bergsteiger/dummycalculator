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
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue('2' = TCalculator.Divide(x2, x1));
end;

procedure TCalculatorOperationViaLogicTest.TestSub;
var
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue('5' = TCalculator.Sub(x2, x1));
end;

procedure TCalculatorOperationViaLogicTest.TestSubError;
var
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;
  CheckFalse('7' = TCalculator.Sub(x2, x1));
end;

procedure TCalculatorOperationViaLogicTest.TestMul;
var
  x1, x2: string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue('50' = TCalculator.Mul(x2, x1));
end;

procedure TCalculatorOperationViaLogicTest.TestAdd;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue('15' = TCalculator.Add(x2, x1));
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaLogicTest.Suite);
end.
