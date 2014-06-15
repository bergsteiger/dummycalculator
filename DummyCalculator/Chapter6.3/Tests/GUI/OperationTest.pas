unit OperationTest;

interface

uses
  CalculatorGUITest,
  MainForm,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

type
  TOperationViaGUITest = class(TCalculatorGUITest)
   protected
    procedure VisitForm(aForm: TfmMain; aLogger: TLogger; anOperation : TOperation); override;
    function  GetFirstParam: Single; virtual;
    function  GetSecondParam: Single; virtual;
  end;//TOperationTest

implementation

uses
  TestFrameWork,
  Calculator,
  SysUtils
  ;

function TOperationViaGUITest.GetFirstParam: Single;
begin
 Result := 10;
end;

function TOperationViaGUITest.GetSecondParam: Single;
begin
 Result := 20;
end;

procedure TOperationViaGUITest.VisitForm(aForm: TfmMain; aLogger: TLogger; anOperation : TOperation);
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
   aForm.Button1.Click;
  opSub:
   aForm.Button2.Click;
  opMul:
   aForm.Button3.Click;
  opDiv:
   aForm.Button4.Click;
  else
   Assert(false, 'Неизвестная операция');
 end;//case GetOp
 aLogger.ToLog(aForm.Edit3.Text);
end;

initialization
 TestFramework.RegisterTest(TOperationViaGUITest.Suite);
 end.
