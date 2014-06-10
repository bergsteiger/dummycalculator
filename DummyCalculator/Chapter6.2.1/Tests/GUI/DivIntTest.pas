unit DivIntTest;

interface

uses
  OperationTest
  ;

type
  TDivIntTest = class(TOperationTest)
   protected
    function  GetOp: TOperation; override;
  end;//TPlusTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

function TDivIntTest.GetOp: TOperation;
begin
 Result := opDivInt;
end;

initialization
 TestFramework.RegisterTest(TDivIntTest.Suite);

end.
