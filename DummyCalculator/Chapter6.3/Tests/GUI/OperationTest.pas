unit OperationTest;

interface

uses
  CalculatorGUITest,
  MainForm,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

type
  TOperation = CalculatorOperationViaLogicBaseTest.TOperation;
  TOperationTest = class(TCalculatorGUITest)
   protected
    procedure VisitForm(aForm: TfmMain; aLogger: TLogger; anOperation : TOperation); override;
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

procedure TOperationTest.VisitForm(aForm: TfmMain; aLogger: TLogger; anOperation : TOperation);
var
 aA, aB : Single;
begin
 aA := GetFirstParam;
 aB := GetSecondParam;
 aForm.Edit1.Text := FloatToStr(aA);
 aForm.Edit2.Text := FloatToStr(aB);
 aLogger.ToLog(aForm.Edit1.Text);
 aLogger.ToLog(aForm.Edit2.Text);
 case anOperation of
  opAdd:
  begin
   aForm.Button1.Click;
   //Check((aForm.Edit3.Text) = TCalculator.FloatToStr(aA + aB));
  end;
  opSub:
  begin
   aForm.Button2.Click;
   //Check((aForm.Edit3.Text) = TCalculator.FloatToStr(aA - aB));
  end;
  opMul:
  begin
   aForm.Button3.Click;
   //Check((aForm.Edit3.Text) = TCalculator.FloatToStr(aA * aB));
  end;
  opDiv:
  begin
   aForm.Button4.Click;
   //Check((aForm.Edit3.Text) = TCalculator.FloatToStr(aA / aB));
  end;
  else
   Assert(false, 'Неизвестная операция');
 end;//case GetOp
 aLogger.ToLog(aForm.Edit3.Text);
end;

initialization
 TestFramework.RegisterTest(TOperationTest.Suite);
 end.
