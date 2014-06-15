unit CalculatorOperationViaGUITest;

interface

uses
  CalculatorGUITest,
  MainForm,
  Tests.Logger,
  CalculatorOperationViaLogicBaseTest
  ;

type
  TCalculatorOperationViaGUITest = class(TCalculatorGUITest)
   protected
    procedure VisitForm(aForm: TfmMain; aLogger: TLogger; anOperation : TOperation); override;
    function  GetFirstParam: Single; virtual;
    function  GetSecondParam: Single; virtual;
  end;//TCalculatorOperationViaGUITest

implementation

uses
  TestFrameWork,
  Calculator,
  SysUtils
  ;

function TCalculatorOperationViaGUITest.GetFirstParam: Single;
begin
 Result := 10;
end;

function TCalculatorOperationViaGUITest.GetSecondParam: Single;
begin
 Result := 20;
end;

procedure TCalculatorOperationViaGUITest.VisitForm(aForm: TfmMain; aLogger: TLogger; anOperation : TOperation);
begin
 aForm.Edit1.Text := FloatToStr(GetFirstParam);
 aForm.Edit2.Text := FloatToStr(GetSecondParam);
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
 TestFramework.RegisterTest(TCalculatorOperationViaGUITest.Suite);
 end.
