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
 aForm.Edit1.Text := FloatToStr(aA);
 aForm.Edit2.Text := FloatToStr(aB);
 case GetOp of
  opAdd:
  begin
   aForm.Button1.Click;
   Check((aForm.Edit3.Text) = FloatToStr(aA + aB));
  end;
  opMinus:
  begin
   aForm.Button2.Click;
   Check((aForm.Edit3.Text) = FloatToStr(aA - aB));
  end;
  opMul:
  begin
   aForm.Button3.Click;
   Check((aForm.Edit3.Text) = FloatToStr(aA * aB));
  end;
  opDiv:
  begin
   aForm.Button4.Click;
   Check((aForm.Edit3.Text) = FloatToStr(aA / aB));
  end;
 end;//case GetOp
end;

end.
