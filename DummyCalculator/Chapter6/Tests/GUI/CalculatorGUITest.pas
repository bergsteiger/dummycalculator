unit CalculatorGUITest;

interface

uses
  TestFrameWork,
  MainForm,
  Tests.Logger
  ;

type
  TCalculatorGUITest = class(TTestCase)
   protected
    procedure VisitForm(aForm: TfmMain); virtual; abstract;
   published
    procedure DoIt;
  end;//TCalculatorGUITest

implementation

uses
  Forms
  ;

procedure TCalculatorGUITest.DoIt;
var
 l_Index : Integer;
begin
 for l_Index := 0 to Screen.FormCount do
  if (Screen.Forms[l_Index] Is TfmMain) then
  begin
   VisitForm(Screen.Forms[l_Index] As TfmMain);
   break;
  end;//Screen.Forms[l_Index] Is TfmMain
end;

end.
