unit CalculatorOperationViaEtalonTest;

interface

uses
  TestFrameWork,
  Calculator
  ;

 type
  TCalculatorOperationViaEtalonTest = class(TTestCase)
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
  end;//TCalculatorOperationViaEtalonTest

implementation

  uses
    SysUtils,
    Tests.Logger;

const
 cA = '5';
 cB = '10';
{ TCalculatorOperationViaEtalonTest }
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

procedure TCalculatorOperationViaEtalonTest.TestDiv;
var
  x1, x2 : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Divide(x2, x1));

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

procedure TCalculatorOperationViaEtalonTest.TestSub;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Sub(x2, x1));

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

procedure TCalculatorOperationViaEtalonTest.TestMul;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Mul(x2, x1));

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

procedure TCalculatorOperationViaEtalonTest.TestAdd;
var
  x1, x2  : string;
  result : Single;
begin
  x1:= cA;
  x2:= cB;
  result := StrToFloat(TCalculator.Add(x2, x1));

  CheckTrue(AddArgumentsToLog(g_Logger, x1, x2, FloatToStr(result), Self));
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaEtalonTest.Suite);
end.
