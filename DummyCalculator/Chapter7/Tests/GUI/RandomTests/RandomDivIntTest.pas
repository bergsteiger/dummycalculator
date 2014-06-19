unit RandomDivIntTest;

interface

uses
  DivIntTest
  ;

type
  TRandomDivIntTest = class(TDivIntTest)
   protected
    function  GetFirstParam: Single; override;
    function  GetSecondParam: Single; override;
  end;//TRandomPlusTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

function TRandomDivIntTest.GetFirstParam: Single;
begin
 Result := 1000 * Random;
end;

function TRandomDivIntTest.GetSecondParam: Single;
begin
 Result := 2000 * Random;
end;

initialization
 TestFramework.RegisterTest(TRandomDivIntTest.Suite);

end.
