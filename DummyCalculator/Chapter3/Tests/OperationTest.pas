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
  end;//TOperationTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

procedure TOperationTest.VisitForm(aForm: TfmMain);
const
 aA = 10;
 aB = 20;
begin
 aForm.Edit1.Text := IntToStr(aA);
 aForm.Edit2.Text := IntToStr(aB);
 case GetOp of
  opAdd:
  begin
   aForm.Button1.Click;
   Check(StrToFloat(aForm.Edit3.Text) = aA + aB);
  end;
  opMinus:
  begin
   aForm.Button2.Click;
   Check(StrToFloat(aForm.Edit3.Text) = aA - aB);
  end;
  opMul:
  begin
   aForm.Button3.Click;
   Check(StrToFloat(aForm.Edit3.Text) = aA * aB);
  end;
  opDiv:
  begin
   aForm.Button4.Click;
   Check(StrToFloat(aForm.Edit3.Text) = aA / aB);
  end;
 end;//case GetOp
end;

end.
