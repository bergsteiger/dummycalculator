unit CalculatorOperationViaLogicBaseTest;

interface

uses
  TestFrameWork
  ;

type
  TCalculatorOperationViaLogicBaseTest = class abstract(TTestCase)
   published
    procedure TestDiv; virtual; abstract;
    procedure TestMul; virtual; abstract;
    procedure TestAdd; virtual; abstract;
    procedure TestSub; virtual; abstract;
  end;//TCalculatorOperationViaLogicBaseTest

implementation

end.
