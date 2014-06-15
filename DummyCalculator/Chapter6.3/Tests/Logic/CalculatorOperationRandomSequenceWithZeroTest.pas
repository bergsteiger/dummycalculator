unit CalculatorOperationRandomSequenceWithZeroTest;

interface

uses
  CalculatorOperationRandomSequenceTest
  ;

 type
  TCalculatorOperationRandomSequenceWithZeroTest = class(TCalculatorOperationRandomSequenceTest)
   protected
    procedure ProprocessParams(var theX1, theX2 : Double); override;
  end;//TCalculatorOperationRandomSequenceTest

implementation

uses
  TestFrameWork
  ;

{ TCalculatorOperationRandomSequenceWithZeroTest }

procedure TCalculatorOperationRandomSequenceWithZeroTest.ProprocessParams(var theX1, theX2 : Double);
begin
 if (Round(theX2) mod 10 = 0) then
  theX2 := 0;
end;

initialization
 TestFramework.RegisterTest(TCalculatorOperationRandomSequenceWithZeroTest.Suite);
end.