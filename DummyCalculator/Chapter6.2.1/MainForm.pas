unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfmMain = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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

procedure TfmMain.Button1Click(Sender: TObject);
begin
 Edit3.Text := TCalculator.Add(Edit1.Text, Edit2.Text);
end;

procedure TfmMain.Button2Click(Sender: TObject);
begin
 Edit3.Text := TCalculator.Sub(Edit1.Text, Edit2.Text);
end;

procedure TfmMain.Button3Click(Sender: TObject);
begin
 Edit3.Text := TCalculator.Mul(Edit1.Text, Edit2.Text);
end;

procedure TfmMain.Button4Click(Sender: TObject);
begin
 Edit3.Text := TCalculator.Divide(Edit1.Text, Edit2.Text);
end;

procedure TfmMain.Button5Click(Sender: TObject);
begin
 Edit3.Text := TCalculator.DivInt(Edit1.Text, Edit2.Text);
end;

end.
