unit CalculatorOperationViaGUIWithZeroTest;

interface

uses
  CalculatorOperationViaGUITest
  ;

type
  TCalculatorOperationViaGUIWithZeroTest = class(TCalculatorOperationViaGUITest)
   protected
    function  GetSecondParam: Single; override;
  end;//TCalculatorOperationViaGUIWithZeroTest

implementation

uses
 TestFramework
 ;

function TCalculatorOperationViaGUIWithZeroTest.GetSecondParam: Single;
begin
 Result := 0;
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationViaGUIWithZeroTest.Suite);
end.
