unit Tests.Logger;

interface

uses
  TestFrameWork;

const
  cEtalonSuffix = '.etalon';
  cTestSuffix = '.out';
  cTestFolder = 'TestSet';

type
  TLogger = class
  public
   type
    TLogableAction = reference to procedure (aLogger: TLogger);
  strict private
    FTestFile : TextFile;
    FTestFilePath,
    FEtalonFilePath : string;
  private
    function TestOutputFolderPath: string;
    function Is2FilesEqual(const aFilePathTest, aFilePathEtalon: string): Boolean;
    function IsExistEtalonFile: Boolean;
    procedure OpenTest(aTestCase: TTestCase);
    function CheckWithEtalon: Boolean;
  public
    procedure ToLog(const aParametr: string); overload;
    procedure ToLog(const aParametr: Double); overload;
    class procedure Log(aTestCase: TTestCase; aProc: TLogableAction);
  end;//TLogger

implementation

uses
  SysUtils,
  System.Classes,
  Calculator,
  Winapi.Windows;

{ TLogger }

class procedure TLogger.Log(aTestCase: TTestCase; aProc: TLogableAction);
var
 l_Logger : TLogger;
begin
 l_Logger := TLogger.Create;
 try
  l_Logger.OpenTest(aTestCase);
  try
   aProc(l_Logger);
  finally
   aTestCase.CheckTrue(l_Logger.CheckWithEtalon, 'Выходной файл не совпал с эталоном');
  end;//try..finally
 finally
  FreeAndNil(l_Logger);
 end;//try..finally
end;

function TLogger.CheckWithEtalon: Boolean;
begin
  Assert(FTestFilePath<>'');
  Assert(FEtalonFilePath<>'');

  CloseFile(FTestFile);

  if IsExistEtalonFile then
    Result := Is2FilesEqual(FTestFilePath, FEtalonFilePath)
  else
    Result := CopyFile(PWideChar(FTestFilePath),PWideChar(FEtalonFilePath),True);
end;

function TLogger.Is2FilesEqual(const aFilePathTest,
                                     aFilePathEtalon: string): Boolean;
var
  l_msFileTest, l_msFileEtalon: TMemoryStream;
begin
  Result := False;
  l_msFileTest := TMemoryStream.Create;
  try
    l_msFileTest.LoadFromFile(aFilePathTest);
    l_msFileEtalon := TMemoryStream.Create;
    try
      l_msFileEtalon.LoadFromFile(aFilePathEtalon);
      if l_msFileTest.Size = l_msFileEtalon.Size then
        Result := CompareMem(l_msFileTest.Memory, l_msFileEtalon.memory, l_msFileTest.Size);
    finally
      FreeAndNil(l_msFileEtalon);
    end;
  finally
    FreeAndNil(l_msFileTest);
  end
end;

function TLogger.IsExistEtalonFile: Boolean;
begin
  Result:= FileExists(FEtalonFilePath);
end;

procedure TLogger.OpenTest(aTestCase: TTestCase);
var
  l_FileName : string;
begin
  l_FileName := aTestCase.ClassName + aTestCase.GetName;
  FTestFilePath := TestOutputFolderPath + l_FileName + cTestSuffix;
  FEtalonFilePath := TestOutputFolderPath + l_FileName + cEtalonSuffix;

  if not DirectoryExists(TestOutputFolderPath) then
    ForceDirectories(TestOutputFolderPath);

  AssignFile(FTestFile, FTestFilePath);
  Rewrite(FTestFile);
end;

function TLogger.TestOutputFolderPath: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + cTestFolder + '\'
end;

procedure TLogger.ToLog(const aParametr: Double);
begin
  ToLog(TCalculator.FloatToStr(aParametr));
end;

procedure TLogger.ToLog(const aParametr: string);
begin
  Writeln(FTestFile, aParametr + ' ');
end;

end.
