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
  strict private
    FTestFile : TextFile;
    FTestFilePath,
    FEtalonFilePath : string;
  private
    function TestOutputFolderPath: string;
    function Is2FilesEqual(const aFilePathTest, aFilePathEtalon: string): Boolean;
    function IsExistEtalonFile: Boolean;
  public
    class constructor Create;
    class destructor Destroy;
    procedure OpenTest(aTestCase: TTestCase);
    procedure ToLog(const aParametr: string); overload;
    procedure ToLog(const aParametr: Double); overload;
    function CheckWithEtalon: Boolean;
  end;//TLogger

var
  g_Logger : TLogger;

implementation

uses
  SysUtils,
  System.Classes,
  Calculator,
  Winapi.Windows;

{ TLogger }

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

class destructor TLogger.Destroy;
begin
  FreeAndNil(g_Logger);
end;

class constructor TLogger.Create;
begin
  g_Logger := TLogger.Create;
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
