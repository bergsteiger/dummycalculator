unit PlusTest;

interface

uses
  OperationTest
  ;

type
  TPlusTest = class(TOperationTest)
   protected
    function  GetOp: TOperation; override;
  end;//TPlusTest

implementation

uses
  TestFrameWork,
  SysUtils,
  CalculatorOperationViaLogicBaseTest
  ;

function TPlusTest.GetOp: TOperation;
begin
 Result := opAdd;
end;

initialization
 TestFramework.RegisterTest(TPlusTest.Suite);

end.
