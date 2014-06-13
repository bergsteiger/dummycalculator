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
   protected
    procedure DoOp(aLogger: TLogger; anOperation : TCalcOperation); override;
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

initialization
 TestFramework.RegisterTest(TCalculatorOperationRandomSequenceTest.Suite);
end.