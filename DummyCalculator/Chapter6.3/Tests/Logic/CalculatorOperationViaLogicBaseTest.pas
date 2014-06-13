unit CalculatorOperationViaLogicBaseTest;

interface

uses
  TestFrameWork,
  Calculator
  ;

type
  TOperation = (opAdd, opMinus, opMul, opDiv);
  TCalcOperation = function (const A, B: string): string of object;

  TCalculatorOperationViaLogicBaseTest = class abstract(TTestCase)
   protected
    procedure DoOpPrim(anOp: TOperation; anOperation : TCalcOperation); virtual; abstract;
   published
    procedure TestDiv; virtual; abstract;
    procedure TestMul; virtual; abstract;
    procedure TestAdd; virtual; abstract;
    procedure TestSub; virtual; abstract;
  end;//TCalculatorOperationViaLogicBaseTest

implementation

end.
