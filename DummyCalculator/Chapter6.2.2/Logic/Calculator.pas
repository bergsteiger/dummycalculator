unit Calculator;

interface

const
  c_ZeroDivideMessageError = 'Деление на 0';

type
 TCalculator = class
  public
   class function Add(const A, B: string): string;
   class function Sub(const A, B: string): string;
   class function Mul(const A, B: string): string;
   class function Divide(const A, B: string): string;
   class function FloatToStr(aValue: Double): string;
   class function DivInt(const A, B: string): string;
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
  if x2=0 then
  begin
    Result := c_ZeroDivideMessageError;
    exit;
  end;
  x3 := x1 / x2;
  Result := FloatToStr(x3);
end;

class function TCalculator.DivInt(const A, B: string): string;
var
  x1, x2, x3  : Integer;
begin
  x1 := round(StrToFloat(A));
  x2 := round(StrToFloat(B));
  try
    x3 := x1 div x2;
  except
    on EDivByZero do
    begin
      Result:= c_ZeroDivideMessageError;
      Exit;
    end;
  end;
  Result := FloatToStr(x3);
end;

end.
