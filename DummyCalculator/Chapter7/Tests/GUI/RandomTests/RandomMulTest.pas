unit RandomMulTest;

interface

uses
  MulTest
  ;

type
  TRandomMulTest = class(TMulTest)
   protected
    function  GetFirstParam: Single; override;
    function  GetSecondParam: Single; override;
  end;//TRandomPlusTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

function TRandomMulTest.GetFirstParam: Single;
begin
 Result := 1000 * Random;
end;

function TRandomMulTest.GetSecondParam: Single;
begin
 Result := 2000 * Random;
end;

initialization
 TestFramework.RegisterTest(TRandomMulTest.Suite);

end.
