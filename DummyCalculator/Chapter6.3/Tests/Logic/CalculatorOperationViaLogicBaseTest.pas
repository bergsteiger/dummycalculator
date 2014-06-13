unit CalculatorOperationViaLogicBaseTest;

interface

uses
  TestFrameWork,
  Calculator
  ;

type
  TOperation = (opAdd, opSub, opMul, opDiv);
  TCalcOperation = function (const A, B: string): string of object;

  TCalculatorOperationViaLogicBaseTest = class abstract(TTestCase)
   protected
    procedure DoOpPrim(anOp: TOperation; anOperation : TCalcOperation); virtual; abstract;
   published
    procedure TestDiv; virtual;
    procedure TestMul; virtual;
    procedure TestAdd; virtual;
    procedure TestSub; virtual;
  end;//TCalculatorOperationViaLogicBaseTest

implementation

procedure TCalculatorOperationViaLogicBaseTest.TestDiv;
begin
  DoOpPrim(opDiv, TCalculator.Divide);
end;

procedure TCalculatorOperationViaLogicBaseTest.TestSub;
begin
  DoOpPrim(opSub, TCalculator.Sub);
end;

procedure TCalculatorOperationViaLogicBaseTest.TestMul;
begin
  DoOpPrim(opMul, TCalculator.Mul);
end;

procedure TCalculatorOperationViaLogicBaseTest.TestAdd;
begin
  DoOpPrim(opAdd, TCalculator.Add);
end;

end.
