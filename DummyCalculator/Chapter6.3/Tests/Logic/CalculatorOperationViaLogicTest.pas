unit CalculatorOperationViaLogicTest;

interface

uses
  TestFrameWork,
  Calculator,
  CalculatorOperationViaLogicBaseTest
  ;

 type
  TCalculatorOperationViaLogicTest = class(TCalculatorOperationViaLogicBaseTest)
   published
    procedure TestDiv; override;
    procedure TestMul; override;
    procedure TestAdd; override;
    procedure TestSub; override;
    procedure TestSubError;
  end;//TCalculatorOperationViaLogicTest

implementation

uses
  SysUtils
  ;

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
