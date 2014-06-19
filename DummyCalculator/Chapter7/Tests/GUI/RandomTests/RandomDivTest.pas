unit RandomDivTest;

interface

uses
  DivTest
  ;

type
  TRandomDivTest = class(TDivTest)
   protected
    function  GetFirstParam: Single; override;
    function  GetSecondParam: Single; override;
  end;//TRandomPlusTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

function TRandomDivTest.GetFirstParam: Single;
begin
 Result := 1000 * Random;
end;

function TRandomDivTest.GetSecondParam: Single;
begin
 Result := 2000 * Random;
end;

initialization
 TestFramework.RegisterTest(TRandomDivTest.Suite);

end.
