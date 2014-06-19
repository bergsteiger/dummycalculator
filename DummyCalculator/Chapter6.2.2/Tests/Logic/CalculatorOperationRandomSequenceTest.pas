unit CalculatorOperationRandomSequenceTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger;

 type
  TCalcOperation = function (const A, B: string): string of object;

  TCalculatorOperationRandomSequenceTest = class(TTestCase)
   private
    procedure CheckOperation(aLogger: TLogger;
                             aX1, aX2: Double;
                             anOperation : TCalcOperation);
    procedure CheckOperationSeq(aLogger: TLogger;
                                anOperation : TCalcOperation);
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
    procedure TestDivInt;
  end;//TCalculatorOperationRandomSequenceTest

implementation

  uses
    SysUtils;

{ TCalculatorOperationRandomSequenceTest }
procedure TCalculatorOperationRandomSequenceTest.CheckOperationSeq(
  aLogger: TLogger;
  anOperation: TCalcOperation);
var
  l_Index, l_ExceptionCount : Integer;
  x1, x2 : single;
begin
  RandSeed := 40000;
  aLogger.OpenTest(Self);

  l_ExceptionCount:= 0;
  for l_Index := 0 to 10000 do
  begin
    try
      x1 := 1000 * Random;
      x2 := 2000 * Random;
      if (l_Index mod 100) = 0 then
        x2 := 0;
      CheckOperation(aLogger,
                     x1,
                     x2, anOperation);
      except
        on E : Exception do
        begin
          aLogger.ToLog(E.ClassName);
          inc(l_ExceptionCount);
        end;
    end;
    end;
  CheckTrue(aLogger.CheckWithEtalon);
  Check(l_ExceptionCount = 0);
end;

procedure TCalculatorOperationRandomSequenceTest.CheckOperation(
  aLogger: TLogger;
  aX1, aX2: Double;
  anOperation : TCalcOperation);
begin
  aLogger.ToLog(aX1);
  aLogger.ToLog(aX2);
  aLogger.ToLog(anOperation(FloatToStr(aX1),FloatToStr(aX2)));
end;

procedure TCalculatorOperationRandomSequenceTest.TestDiv;
begin
  CheckOperationSeq(g_Logger, TCalculator.Divide);
end;

procedure TCalculatorOperationRandomSequenceTest.TestSub;
begin
  CheckOperationSeq(g_Logger, TCalculator.Sub);
end;

procedure TCalculatorOperationRandomSequenceTest.TestMul;
begin
  CheckOperationSeq(g_Logger, TCalculator.Mul);
end;

procedure TCalculatorOperationRandomSequenceTest.TestAdd;
begin
  CheckOperationSeq(g_Logger, TCalculator.Add);
end;

procedure TCalculatorOperationRandomSequenceTest.TestDivInt;
begin
  CheckOperationSeq(g_Logger, TCalculator.DivInt);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationRandomSequenceTest.Suite);
end.