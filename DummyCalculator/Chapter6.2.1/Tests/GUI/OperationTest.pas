unit OperationTest;

interface

uses
  CalculatorGUITest,
  MainForm
  ;

type
  TOperation = (opAdd, opMinus, opMul, opDiv);

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
  SysUtils
  ;

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
   Check((aForm.edtResult.Text) = TCalculator.FloatToStr(aA + aB));
  end;
  opMinus:
  begin
   aForm.btnMinus.Click;
   Check((aForm.edtResult.Text) = TCalculator.FloatToStr(aA - aB));
  end;
  opMul:
  begin
   aForm.btnMul.Click;
   Check((aForm.edtResult.Text) = TCalculator.FloatToStr(aA * aB));
  end;
  opDiv:
  begin
   aForm.btnDiv.Click;
   Check((aForm.edtResult.Text) = TCalculator.FloatToStr(aA / aB));
  end;
 end;//case GetOp
end;

end.
