unit RandomPlusTest;

interface

uses
  PlusTest
  ;

type
  TRandomPlusTest = class(TPlusTest)
   protected
    function  GetFirstParam: Single; override;
    function  GetSecondParam: Single; override;
  end;//TRandomPlusTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

function TRandomPlusTest.GetFirstParam: Single;
begin
 Result := 1000 * Random;
end;

function TRandomPlusTest.GetSecondParam: Single;
begin
 Result := 2000 * Random;
end;

initialization
 TestFramework.RegisterTest(TRandomPlusTest.Suite);

end.
