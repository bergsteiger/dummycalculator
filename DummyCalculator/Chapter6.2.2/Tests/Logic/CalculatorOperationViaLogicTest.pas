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
    procedure TestDivInt;
    procedure TestZeroDiv;
    procedure TestZeroDivInt;
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
  CheckTrue(2 = StrToFloat(TCalculator.Divide(x2, x1)));
end;

procedure TCalculatorOperationViaLogicTest.TestDivInt;
var
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue(2 = StrToFloat(TCalculator.DivInt(x2, x1)));
end;

procedure TCalculatorOperationViaLogicTest.TestSub;
var
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue(5 = StrToFloat(TCalculator.Sub(x2, x1)));
end;

procedure TCalculatorOperationViaLogicTest.TestSubError;
var
  x1, x2 : string;
begin
  x1:= cA;
  x2:= cB;
  CheckFalse(7 = StrToFloat(TCalculator.Sub(x2, x1)));
end;

procedure TCalculatorOperationViaLogicTest.TestZeroDiv;
var
  x1, x2: string;
begin
  x1:= cA;
  x2:= '0';
  CheckTrue(c_ZeroDivideMessageError = TCalculator.Divide(x1, x2));
end;

procedure TCalculatorOperationViaLogicTest.TestZeroDivInt;
var
  x1, x2: string;
begin
  x1:= cA;
  x2:= '0';
  CheckTrue(c_ZeroDivideMessageError = TCalculator.DivInt(x1, x2));
end;

procedure TCalculatorOperationViaLogicTest.TestMul;
var
  x1, x2: string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue(50 = StrToFloat(TCalculator.Mul(x2, x1)));
end;

procedure TCalculatorOperationViaLogicTest.TestAdd;
var
  x1, x2  : string;
begin
  x1:= cA;
  x2:= cB;
  CheckTrue(15 = StrToFloat(TCalculator.Add(x2, x1)));
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaLogicTest.Suite);
end.
