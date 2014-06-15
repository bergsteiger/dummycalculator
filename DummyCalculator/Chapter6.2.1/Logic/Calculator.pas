unit Calculator;

interface

type
 TCalculator = class
  public
   class function Add(const A, B: string): string;
   class function Sub(const A, B: string): string;
   class function Mul(const A, B: string): string;
   class function Divide(const A, B: string): string;
   class function FloatToStr(aValue: Double): string;
   class function StrToFloat(aValue: string): Double;
 end;//TCalculator

implementation

uses
  SysUtils
  ;

class function TCalculator.FloatToStr(aValue: Double): string;
var
 l_FS : TFormatSettings;
begin
  l_FS := TFormatSettings.Create;
  l_FS.DecimalSeparator := '.';
  Result := SysUtils.FloatToStr(aValue, l_FS);
end;

class function TCalculator.StrToFloat(aValue: string): Double;
var
 l_FS : TFormatSettings;
begin
  l_FS := TFormatSettings.Create;
  l_FS.DecimalSeparator := '.';
  Result := SysUtils.StrToFloat(aValue, l_FS);
end;

class function TCalculator.Add(const A, B: string): string;
var
  x1, x2, x3 : single;
begin
  x1 := StrToFloat(A);
  x2 := StrToFloat(B);
  x3 := x1 + x2;
  Result := FloatToStr(x3);
end;

class function TCalculator.Sub(const A, B: string): string;
var
  x1, x2, x3 : single;
begin
  x1 := StrToFloat(A);
  x2 := StrToFloat(B);
  x3 := x1 - x2;
  Result := FloatToStr(x3);
end;

class function TCalculator.Mul(const A, B: string): string;
var
  x1, x2, x3 : single;
begin
  x1 := StrToFloat(A);
  x2 := StrToFloat(B);
  x3 := x1 * x2;
  Result := FloatToStr(x3);
end;

class function TCalculator.Divide(const A, B: string): string;
var
  x1, x2, x3 : single;
begin
  x1 := StrToFloat(A);
  x2 := StrToFloat(B);
  x3 := x1 / x2;
  Result := FloatToStr(x3);
end;

end.
