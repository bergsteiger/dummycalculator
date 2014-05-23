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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.Button1Click(Sender: TObject);
var
  x1, x2, x3 : single;
  s : string;
begin
  x1 := StrToFloat(Edit1.Text);
  x2 := StrToFloat(Edit2.Text);
  x3 := x1 + x2;
  Edit3.Text := FloatToStr(x3);
end;

procedure TfmMain.Button2Click(Sender: TObject);
var
  x1, x2, x3 : single;
  s : string;
begin
  x1 := StrToFloat(Edit1.Text);
  x2 := StrToFloat(Edit2.Text);
  x3 := x1 - x2;
  Edit3.Text := FloatToStr(x3);
end;

procedure TfmMain.Button3Click(Sender: TObject);
var
  x1, x2, x3 : single;
  s : string;
begin
  x1 := StrToFloat(Edit1.Text);
  x2 := StrToFloat(Edit2.Text);
  x3 := x1 * x2;
  Edit3.Text := FloatToStr(x3);
end;

procedure TfmMain.Button4Click(Sender: TObject);
var
  x1, x2, x3 : single;
  s : string;
begin
  x1 := StrToFloat(Edit1.Text);
  x2 := StrToFloat(Edit2.Text);
  x3 := x1 / x2;
  Edit3.Text := FloatToStr(x3);
end;

end.
