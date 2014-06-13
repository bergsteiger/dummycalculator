unit CalculatorOperationRandomSequenceTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger,
  CalculatorOperationViaEtalonBaseTest
  ;

 type
  TCalculatorOperationRandomSequenceTest = class(TCalculatorOperationViaEtalonBaseTest)
   private
    procedure CheckOperationSeq(anOperation : TCalcOperation);
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

procedure TCalculatorOperationRandomSequenceTest.CheckOperationSeq(anOperation: TCalcOperation);
begin
  RandSeed := 40000;
  TLogger.Log(Self, procedure (aLogger: TLogger)
   var
    l_Index : Integer;
   begin
    for l_Index := 0 to 10000 do
      CheckOperation(aLogger,
                     1000 * Random,
                     2000 * Random + 1, anOperation);
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