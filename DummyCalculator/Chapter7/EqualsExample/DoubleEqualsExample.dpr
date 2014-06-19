program DoubleEqualsExample;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Math;

var
 nominal, sum : double;
 i: byte;
begin
 nominal := 1.0;
 sum := 0;
 Writeln( FormatFloat('0.0000000000000000', sum) );
 for I := 1 to 10 do
 begin
  sum := sum + 0.1;
  Writeln( FormatFloat('0.0000000000000000', sum) );
 end;

 if SameValue(sum, nominal, 0.00000001)
  then Writeln('Equals sum=' + FloatToStr(sum) + ' nominal=' + FloatToStr(nominal))
  else Writeln('NOT Equals sum=' + FloatToStr(sum) + ' nominal=' + FloatToStr(nominal));

 Readln;
end.
