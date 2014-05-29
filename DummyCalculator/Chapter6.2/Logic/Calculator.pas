unit Calculator;

interface

type
 TCalculator = class
  public
   class function Add(const A, B: string): string;
   class function Sub(const A, B: string): string;
   class function Mul(const A, B: string): string;
   class function Divide(const A, B: string): string;
 end;//TCalculator

implementation

uses
  SysUtils
  ;

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
