unit CalculatorOperationRandomSequenceTest;

interface

uses
  TestFrameWork,
  Calculator,
  CalculatorOperationViaEtalonBaseTest,
  Tests.Logger
  ;

 type
  TCalculatorOperationRandomSequenceTest = class(TCalculatorOperationViaEtalonBaseTest)
   private
    procedure CheckOperationSeq(anOperation : TCalcOperation);
   protected
    procedure DoOp(aLogger: TLogger; anOperation : TCalcOperation); override;
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
  end;//TCalculatorOperationRandomSequenceTest

implementation

uses
  SysUtils
  ;

{ TCalculatorOperationRandomSequenceTest }

procedure TCalculatorOperationRandomSequenceTest.DoOp(aLogger: TLogger; anOperation : TCalcOperation);
var
 l_Index : Integer;
begin
  RandSeed := 40000;
  for l_Index := 0 to 10000 do
    CheckOperation(aLogger,
                   1000 * Random,
                   2000 * Random + 1, anOperation);
end;

procedure TCalculatorOperationRandomSequenceTest.CheckOperationSeq(anOperation: TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    DoOp(aLogger, anOperation);
   end
  );
end;

procedure TCalculatorOperationRandomSequenceTest.TestDiv;
begin
  CheckOperationSeq(TCalculator.Divide);
end;

procedure TCalculatorOperationRandomSequenceTest.TestSub;
begin
  CheckOperationSeq(TCalculator.Sub);
end;

procedure TCalculatorOperationRandomSequenceTest.TestMul;
begin
  CheckOperationSeq(TCalculator.Mul);
end;

procedure TCalculatorOperationRandomSequenceTest.TestAdd;
begin
  CheckOperationSeq(TCalculator.Add);
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationRandomSequenceTest.Suite);
end.