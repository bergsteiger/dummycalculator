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
    SysUtils,
    BaseClasses;

const
 cA = '5';
 cB = '10';
{ TCalculatorOperationTest }
function AddArgumentsToLog(aLogger: TLogger;
                           aX1, aX2, aResult: string;
                           aTestCase: TTestCase): Boolean;
begin
  Result:= False;

  aLogger.OpenTest(aTestCase);
  aLogger.ToLog(aX1);
  aLogger.ToLog(aX2);
  aLogger.ToLog(aResult);
  aLogger.CheckWithEtalon;

  Result:= True;
end;

procedure TCalculatorOperationTest.LogicTestDiv;
var
  x1, x2 : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Divide(x2, x1));
  CheckTrue(2 = result);

  AddArgumentsToLog(Logger, x1, x2, FloatToStr(result), Self);
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

  AddArgumentsToLog(Logger, x1, x2, FloatToStr(result), Self);
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

  AddArgumentsToLog(Logger, x1, x2, FloatToStr(result), Self);
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

  AddArgumentsToLog(Logger, x1, x2, FloatToStr(result), Self);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationTest.Suite);
end.
