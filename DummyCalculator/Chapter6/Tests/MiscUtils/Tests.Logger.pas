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
    FTestFolderName,
    FTestFilePath,
    FEtalonFilePath : string;
  private
    function TestOutputFolderPath: string;
    function TestSetFolderName: string;
    function Is2FilesEqual(const aFilePathTest, aFilePathEtalon: string): Boolean;
    function IsExistEtalonFile: Boolean;
    procedure OpenOutputFile(const aFileName: string);
  public
    constructor Create;
    procedure OpenTest(aTestCase: TTestCase);
    procedure ToLog(const aParametr: string);
    procedure CheckWithEtalon;
  end;//TLogger

var
  Logger : TLogger;

implementation

uses
  SysUtils,
  vcl.Forms,
  System.Classes,
  Winapi.Windows;

{ TLogger }

procedure TLogger.CheckWithEtalon;
begin
  if IsExistEtalonFile then
  begin
    CloseFile(FTestFile);
    Is2FilesEqual(FTestFilePath, FEtalonFilePath);
  end
  else
  begin
    Assert(FTestFilePath<>'');
    Assert(FEtalonFilePath<>'');

    CloseFile(FTestFile);

    CopyFile(PWideChar(FTestFilePath),
             PWideChar(FEtalonFilePath),
             True);
  end;
end;

constructor TLogger.Create;
begin
  FTestFolderName := ExtractFileDir(Application.ExeName);
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

procedure TLogger.OpenOutputFile(const aFileName: string);
begin
  AssignFile(FTestFile, aFileName);
  Rewrite(FTestFile);
end;

procedure TLogger.OpenTest(aTestCase: TTestCase);
var
  l_FileName : string;
begin
  l_FileName := aTestCase.ClassName + aTestCase.GetName;
  FTestFilePath := TestOutputFolderPath + l_FileName + cTestSuffix;
  FEtalonFilePath := TestOutputFolderPath + l_FileName + cEtalonSuffix;

  if not DirectoryExists(TestOutputFolderPath) then
    CreateDir(TestOutputFolderPath);

//  if (TTextRec(FTestFile).Mode = fmOpenRead) or
//     (TTextRec(FTestFile).Mode = fmOpenWrite)  then
//  begin
    OpenOutputFile(FTestFilePath);
//  end;
end;

function TLogger.TestOutputFolderPath: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + TestSetFolderName + '\'
end;

function TLogger.TestSetFolderName: string;
begin
  Result := cTestFolder;
end;

procedure TLogger.ToLog(const aParametr: string);
begin
  Write(FTestFile, aParametr + ' ');
end;

initialization
  Logger := TLogger.Create();

finalization
  FreeAndNil(Logger);

end.
