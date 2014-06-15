unit CalculatorOperationViaEtalonBaseTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

 type
  TCalculatorOperationViaEtalonBaseTest = class abstract(TCalculatorOperationViaLogicBaseTest)
   protected
    procedure DoOpPrim(anOp: TOperation; anOperation : TCalcOperation); override;
    procedure CheckOperation(aLogger: TLogger;
                             aX1, aX2: Double;
                             anOperation : TCalcOperation);
    procedure DoOp(aLogger: TLogger; anOp: TOperation; anOperation : TCalcOperation); virtual; abstract;
  end;//TCalculatorOperationViaEtalonBaseTest

implementation

uses
  System.SysUtils
  ;

procedure TCalculatorOperationViaEtalonBaseTest.CheckOperation(aLogger: TLogger;
                         aX1, aX2: Double;
                         anOperation : TCalcOperation);
begin
  aLogger.ToLog(aX1);
  aLogger.ToLog(aX2);
  aLogger.ToLog(anOperation(TCalculator.FloatToStr(aX1), TCalculator.FloatToStr(aX2)))
end;

procedure TCalculatorOperationViaEtalonBaseTest.DoOpPrim(anOp: TOperation; anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    DoOp(aLogger, anOp, anOperation);
   end
  );
end;

end.
