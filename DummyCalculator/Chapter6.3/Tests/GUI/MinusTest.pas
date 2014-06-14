unit MinusTest;

interface

uses
  OperationTest
  ;

type
  TMinusTest = class(TOperationTest)
   protected
    function  GetOp: TOperation; override;
  end;//TMinusTest

implementation

uses
  TestFrameWork,
  SysUtils,
  CalculatorOperationViaLogicBaseTest
  ;

function TMinusTest.GetOp: TOperation;
begin
 Result := opSub;
end;

initialization
 TestFramework.RegisterTest(TMinusTest.Suite);

end.
