unit CalculatorOperationViaEtalonBaseTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger;

 type
  TCalcOperation = function (const A, B: string): string of object;

  TCalculatorOperationViaEtalonBaseTest = class abstract(TTestCase)
   protected
    procedure CheckOperation(aLogger: TLogger;
                             aX1, aX2: Double;
                             anOperation : TCalcOperation);
    procedure DoOp(aLogger: TLogger; anOperation : TCalcOperation); overload; virtual; abstract;
    procedure DoOp(anOperation : TCalcOperation); overload;
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
  aLogger.ToLog(anOperation(FloatToStr(aX1), FloatToStr(aX2)))
end;

procedure TCalculatorOperationViaEtalonBaseTest.DoOp(anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    DoOp(aLogger, anOperation);
   end
  );
end;

end.
