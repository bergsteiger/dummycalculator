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
    procedure DoOpPrim(anOp: TOperation; anOperation : TCalcOperation);
    procedure CheckOperation(aLogger: TLogger;
                             aX1, aX2: Double;
                             anOperation : TCalcOperation);
    procedure DoOp(aLogger: TLogger; anOperation : TCalcOperation); virtual; abstract;
   published
    procedure TestDiv; override;
    procedure TestMul; override;
    procedure TestAdd; override;
    procedure TestSub; override;
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

procedure TCalculatorOperationViaEtalonBaseTest.DoOpPrim(anOp: TOperation; anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    DoOp(aLogger, anOperation);
   end
  );
end;

procedure TCalculatorOperationViaEtalonBaseTest.TestDiv;
begin
  DoOpPrim(opDiv, TCalculator.Divide);
end;

procedure TCalculatorOperationViaEtalonBaseTest.TestSub;
begin
  DoOpPrim(opSub, TCalculator.Sub);
end;

procedure TCalculatorOperationViaEtalonBaseTest.TestMul;
begin
  DoOpPrim(opMul, TCalculator.Mul);
end;

procedure TCalculatorOperationViaEtalonBaseTest.TestAdd;
begin
  DoOpPrim(opAdd, TCalculator.Add);
end;

end.
