unit OperationTest;

interface

uses
  CalculatorGUITest,
  MainForm
  ;

type
  TOperation = (opAdd, opMinus, opMul, opDiv, opDivInt);

  TOperationTest = class(TCalculatorGUITest)
   protected
    procedure VisitForm(aForm: TfmMain); override;
    function  GetOp: TOperation; virtual; abstract;
    function  GetFirstParam: Single; virtual;
    function  GetSecondParam: Single; virtual;
  end;//TOperationTest

implementation

uses
  TestFrameWork,
  Calculator,
  SysUtils,
  Math;

const
 c_Epsilon = 0.0001;

function TOperationTest.GetFirstParam: Single;
begin
 Result := 10;
end;

function TOperationTest.GetSecondParam: Single;
begin
 Result := 20;
end;

procedure TOperationTest.VisitForm(aForm: TfmMain);
var
 aA, aB : Single;
begin
 aA := GetFirstParam;
 aB := GetSecondParam;
 aForm.edtFirstArg.Text := FloatToStr(aA);
 aForm.edtSecondArg.Text := FloatToStr(aB);
 case GetOp of
  opAdd:
  begin
   aForm.btnAdd.Click;
   Check(SameValue(StrToFloat(aForm.edtResult.Text), (aA + aB), c_Epsilon));
  end;
  opMinus:
  begin
   aForm.btnMinus.Click;
   Check(SameValue(StrToFloat(aForm.edtResult.Text), (aA - aB), c_Epsilon));
  end;
  opMul:
  begin
   aForm.btnMul.Click;
   Check(SameValue(StrToFloat(aForm.edtResult.Text), (aA * aB), c_Epsilon));
  end;
  opDiv:
  begin
   aForm.btnDiv.Click;
   Check(SameValue(StrToFloat(aForm.edtResult.Text), (aA / aB), c_Epsilon));
  end;
  opDivInt:
  begin
   aForm.btnDivInt.Click;
   Check(SameValue(StrToFloat(aForm.edtResult.Text), (Round(aA) div Round(aB)), c_Epsilon));
  end;
 end;//case GetOp
end;

end.
