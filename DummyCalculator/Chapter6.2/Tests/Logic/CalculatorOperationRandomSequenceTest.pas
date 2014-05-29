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
  end;//TCalculatorOperationRandomSequenceTest

implementation

  uses
    SysUtils;


const
 cA = '5';
 cB = '10';
{ TCalculatorOperationViaEtalonTest }
procedure TCalculatorOperationRandomSequenceTest.CheckOperationSeq(
  aLogger: TLogger;
  anOperation: TCalcOperation);
begin
  aLogger.OpenTest(Self);
  CheckOperation(aLogger, 5, 10, anOperation);
  CheckTrue(aLogger.CheckWithEtalon);
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

initialization
 TestFramework.RegisterTest(TCalculatorOperationRandomSequenceTest.Suite);
end.