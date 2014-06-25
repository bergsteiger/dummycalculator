unit RandomMinusTest;

interface

uses
  MinusTest
  ;

type
  TRandomMinusTest = class(TMinusTest)
   protected
    function  GetFirstParam: Single; override;
    function  GetSecondParam: Single; override;
  end;//TRandomPlusTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

function TRandomMinusTest.GetFirstParam: Single;
begin
 Result := 1000 * Random;
end;

function TRandomMinusTest.GetSecondParam: Single;
begin
 Result := 2000 * Random;
end;

initialization
 TestFramework.RegisterTest(TRandomMinusTest.Suite);

end.
