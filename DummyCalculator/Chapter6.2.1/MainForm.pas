unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfmMain = class(TForm)
    edtFirstArg: TEdit;
    edtSecondArg: TEdit;
    edtResult: TEdit;
    btnAdd: TButton;
    btnMinus: TButton;
    btnMul: TButton;
    btnDiv: TButton;
    btnDivInt: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure btnMulClick(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
    procedure btnDivIntClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
  Calculator
  ;

{$R *.dfm}

procedure TfmMain.btnAddClick(Sender: TObject);
begin
 edtResult.Text := TCalculator.Add(edtFirstArg.Text, edtSecondArg.Text);
end;

procedure TfmMain.btnMinusClick(Sender: TObject);
begin
 edtResult.Text := TCalculator.Sub(edtFirstArg.Text, edtSecondArg.Text);
end;

procedure TfmMain.btnMulClick(Sender: TObject);
begin
 edtResult.Text := TCalculator.Mul(edtFirstArg.Text, edtSecondArg.Text);
end;

procedure TfmMain.btnDivClick(Sender: TObject);
begin
 edtResult.Text := TCalculator.Divide(edtFirstArg.Text, edtSecondArg.Text);
end;

procedure TfmMain.btnDivIntClick(Sender: TObject);
begin
 edtResult.Text := TCalculator.DivInt(edtFirstArg.Text, edtSecondArg.Text);
end;

end.
