unit DivTest;

interface

uses
  OperationTest
  ;

type
  TDivTest = class(TOperationTest)
   protected
    function  GetOp: TOperation; override;
  end;//TDivTest

implementation

uses
  TestFrameWork,
  SysUtils,
  CalculatorOperationViaLogicBaseTest
  ;

function TDivTest.GetOp: TOperation;
begin
 Result := opDiv;
end;

initialization
 TestFramework.RegisterTest(TDivTest.Suite);

end.
