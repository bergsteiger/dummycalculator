unit CalculatorOperationTestEtalon;

interface

uses
  TestFrameWork,
  Calculator
  ;

 type
  TCalculatorOperationTestEtalon = class(TTestCase)
   published
    procedure LogicTestDiv;
    procedure LogicTestMul;
    procedure LogicTestAdd;
    procedure LogicTestSub;
  end;//TCalculatorOperationTest

implementation

  uses
    SysUtils,
    Tests.Logger;

const
 cA = '5';
 cB = '10';
{ TCalculatorOperationTest }
function AddArgumentsToLog(aLogger: TLogger;
                           aX1, aX2, aResult: string;
                           aTestCase: TTestCase): Boolean;
begin
  aLogger.OpenTest(aTestCase);
  aLogger.ToLog(aX1);
  aLogger.ToLog(aX2);
  aLogger.ToLog(aResult);
  Result := aLogger.CheckWithEtalon;
end;

procedure TCalculatorOperationTestEtalon.LogicTestDiv;
var
  x1, x2 : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Divide(x2, x1));
  CheckTrue(2 = result);

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

procedure TCalculatorOperationTestEtalon.LogicTestSub;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Sub(x2, x1));
  CheckTrue(5 = result);

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

procedure TCalculatorOperationTestEtalon.LogicTestMul;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Mul(x2, x1));
  CheckTrue(50 = result);

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

procedure TCalculatorOperationTestEtalon.LogicTestAdd;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Add(x2, x1));
  CheckTrue(15 = result);

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationTestEtalon.Suite);
end.
