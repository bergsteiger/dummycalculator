unit CalculatorOperationViaLogicTest;

interface

uses
  TestFrameWork,
  Calculator,
  CalculatorOperationViaLogicBaseTest
  ;

 type
  TCalculatorOperationViaLogicTest = class(TCalculatorOperationViaLogicBaseTest)
   protected
    procedure DoOpPrim(anOp: TOperation; anOperation : TCalcOperation); override;
   published
    procedure TestSubError;
  end;//TCalculatorOperationViaLogicTest

implementation

uses
  SysUtils
  ;

const
 cA = '5';
 cB = '10';

{ TCalculatorOperationViaLogicTest }

procedure TCalculatorOperationViaLogicTest.DoOpPrim(anOp: TOperation; anOperation : TCalcOperation);
begin
  case anOp of
   opAdd:
    CheckTrue(15 = StrToFloat(anOperation(cA, cB)));
   opSub:
    CheckTrue(-5 = StrToFloat(anOperation(cA, cB)));
   opMul:
    CheckTrue(50 = StrToFloat(anOperation(cA, cB)));
   opDiv:
    CheckTrue(2 = TCalculator.StrToFloat(anOperation(cA, cB)));
   else
    Assert(false, 'Неизвестная операция');
  end;//case anOp
end;

procedure TCalculatorOperationViaLogicTest.TestSubError;
begin
  CheckFalse(7 = StrToFloat(TCalculator.Sub(cA, cB)));
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaLogicTest.Suite);
end.
