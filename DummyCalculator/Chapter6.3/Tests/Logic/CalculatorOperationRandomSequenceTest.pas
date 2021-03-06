unit CalculatorOperationRandomSequenceTest;

interface

uses
  CalculatorOperationViaEtalonBaseTest,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

 type
  TCalculatorOperationRandomSequenceTest = class(TCalculatorOperationViaEtalonBaseTest)
   protected
    procedure DoOp(aLogger: TLogger; const anOperation : TCalcOperation); override;
    procedure ProprocessParams(var theX1, theX2 : Double); virtual;
  end;//TCalculatorOperationRandomSequenceTest

implementation

uses
  TestFrameWork
  ;

{ TCalculatorOperationRandomSequenceTest }

procedure TCalculatorOperationRandomSequenceTest.ProprocessParams(var theX1, theX2 : Double);
begin
end;

procedure TCalculatorOperationRandomSequenceTest.DoOp(aLogger: TLogger; const anOperation : TCalcOperation);
var
 l_Index : Integer;
 l_x1, l_x2 : Double;
begin
  RandSeed := 40000;
  for l_Index := 0 to 10000 do
  begin
    l_x1 := 1000 * Random;
    l_x2 := 2000 * Random;
    ProprocessParams(l_x1, l_x2);
    CheckOperation(aLogger,
                   l_x1,
                   l_x2, anOperation);
  end;//for l_Index
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationRandomSequenceTest.Suite);
end.