unit Calculator;

interface

type
 TCalculator = class
  public
   // --- далее идут операции калькулятора ---
   class function Add(const A, B: string): string;
   class function Sub(const A, B: string): string;
   class function Mul(const A, B: string): string;
   class function Divide(const A, B: string): string;
   class function DivInt(const A, B: string): string;
   class function ModInt(const A, B: string): string;
   // --- далее идёт "вспомогательный мусор" ---
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
  try
   x3 := x1 / x2;
  except
   on EZeroDivide do
   begin
    Result := 'Деление на 0';
    Exit;
   end;//on EZeroDivide
  end;//try..except
  Result := FloatToStr(x3);
end;

class function TCalculator.DivInt(const A, B: string): string;
var
  x1, x2, x3 : Integer;
begin
  x1 := Round(StrToFloat(A));
  x2 := Round(StrToFloat(B));
  try
   x3 := x1 div x2;
  except
   on EDivByZero do
   begin
    Result := 'Деление на 0';
    Exit;
   end;//on EDivByZero
  end;//try..except
  Result := FloatToStr(x3);
end;

class function TCalculator.ModInt(const A, B: string): string;
var
  x1, x2, x3 : Integer;
begin
 Assert(false, 'Не реализовано');
(*  x1 := Round(StrToFloat(A));
  x2 := Round(StrToFloat(B));
  try
   x3 := x1 mod x2;
  except
   on EDivByZero do
   begin
    Result := 'Деление на 0';
    Exit;
   end;//on EDivByZero
  end;//try..except
  Result := FloatToStr(x3);*)
end;

end.
