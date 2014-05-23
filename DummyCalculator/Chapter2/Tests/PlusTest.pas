unit PlusTest;

interface

uses
  CalculatorGUITest,
  MainForm
  ;

type
  TPlusTest = class(TCalculatorGUITest)
   protected
    procedure VisitForm(aForm: TfmMain); override;
  end;//TPlusTest

implementation

uses
  TestFrameWork,
  SysUtils
  ;

procedure TPlusTest.VisitForm(aForm: TfmMain);
const
 aA = 10;
 aB = 20;
begin
 aForm.Edit1.Text := IntToStr(aA);
 aForm.Edit2.Text := IntToStr(aB);
 aForm.Button1.Click;
 Check(StrToInt(aForm.Edit3.Text) = aA + aB);
end;

initialization
 TestFramework.RegisterTest(TPlusTest.Suite);

end.
