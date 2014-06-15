unit CalculatorOperationViaLogicBaseTest;

interface

uses
  TestFrameWork,
  Calculator,
  Tests.Logger
  ;

type
  TCalcOperationCode = (opAdd, opSub, opMul, opDiv, opDivInt, opModInt);
  TCalcOperationProc = function (const A, B: string): string of object;

  TCalcOperation = record
   public
    rCode : TCalcOperationCode;
    function rProc : TCalcOperationProc;
    constructor Create(aCode: TCalcOperationCode);
  end;//TCalcOperation

  TCalculatorOperationViaLogicBaseTest = class abstract(TTestCase)
   private
    procedure DoOpPrim(anOperation: TCalcOperation);
   protected
    procedure DoOp(aLogger: TLogger; const anOperation : TCalcOperation); virtual; abstract;
   published
    procedure TestDiv;
    procedure TestMul;
    procedure TestAdd;
    procedure TestSub;
    procedure TestDivInt;
    procedure TestModInt;
  end;//TCalculatorOperationViaLogicBaseTest

implementation

constructor TCalcOperation.Create(aCode: TCalcOperationCode);
begin
  rCode := aCode;
end;

function TCalcOperation.rProc : TCalcOperationProc;
begin
 case rCode of
   opAdd:
    Result := TCalculator.Add;
   opSub:
    Result := TCalculator.Sub;
   opMul:
    Result := TCalculator.Mul;
   opDiv:
    Result := TCalculator.Divide;
   opDivInt:
    Result := TCalculator.DivInt;
   opModInt:
    Result := TCalculator.ModInt;
   else
    Assert(false, 'Неизвестная операция');
 end;//case rCode
end;

procedure TCalculatorOperationViaLogicBaseTest.TestDiv;
begin
  DoOpPrim(TCalcOperation.Create(opDiv));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestSub;
begin
  DoOpPrim(TCalcOperation.Create(opSub));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestMul;
begin
  DoOpPrim(TCalcOperation.Create(opMul));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestAdd;
begin
  DoOpPrim(TCalcOperation.Create(opAdd));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestDivInt;
begin
  DoOpPrim(TCalcOperation.Create(opDivInt));
end;

procedure TCalculatorOperationViaLogicBaseTest.TestModInt;
begin
  DoOpPrim(TCalcOperation.Create(opModInt));
end;

procedure TCalculatorOperationViaLogicBaseTest.DoOpPrim(anOperation : TCalcOperation);
begin
  TLogger.Log(Self, procedure (aLogger: TLogger)
   begin
    DoOp(aLogger, anOperation);
   end
  );
end;

end.
