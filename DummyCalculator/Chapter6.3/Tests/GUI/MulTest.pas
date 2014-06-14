unit MulTest;

interface

uses
  OperationTest
  ;

type
  TMulTest = class(TOperationTest)
   protected
    function  GetOp: TOperation; override;
  end;//TMulTest

implementation

uses
  TestFrameWork,
  SysUtils,
  CalculatorOperationViaLogicBaseTest
  ;

function TMulTest.GetOp: TOperation;
begin
 Result := opMul;
end;

initialization
 TestFramework.RegisterTest(TMulTest.Suite);

end.
