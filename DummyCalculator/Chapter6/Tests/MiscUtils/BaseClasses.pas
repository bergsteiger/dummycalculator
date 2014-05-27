unit BaseClasses;

interface

uses
  TestFrameWork;

const
  cEtalonSuffix = '.etalon';
  cTestSuffix = '.out';
  cTestFolder = 'TestSet';

type
  // Паттерн "одиночка"
  TLogger = class
  strict private
    class var Logger: TLogger;
    FFileForOutput,
    FFileEtalon: TextFile;
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
    class function NewInstance: TObject; override;

    procedure OpenTest(aTestCase: TTestCase);
    procedure ToLog(const aParametr: string);
    function CheckWithEtalon : Boolean;
  end;//TLogger

var
  Logger: TLogger;

implementation

uses
  SysUtils,
  vcl.Forms,
  System.Classes,
  Winapi.Windows;

{ TLogger }

function TLogger.CheckWithEtalon : Boolean;
begin
  Result := False;
  if IsExistEtalonFile then
  begin
    CloseFile(FFileForOutput);
    if Is2FilesEqual(FTestFilePath, FEtalonFilePath) then
      Result:= True;
  end
  else
  begin
    Assert(FTestFilePath<>'');
    Assert(FEtalonFilePath<>'');

    CloseFile(FFileForOutput);

    CopyFile(PWideChar(FTestFilePath),
             PWideChar(FEtalonFilePath),
             True);
    Result := True;
  end;
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
      l_msFileEtalon.Free;
    end;
  finally
    l_msFileTest.Free;
  end
end;

function TLogger.IsExistEtalonFile: Boolean;
begin
  Result:= False;
  if FileExists(FEtalonFilePath) then
    Result:= True;
end;

class function TLogger.NewInstance: TObject;
begin
  if not Assigned(Logger) then
  begin
    Logger := TLogger(inherited NewInstance);
  end;
  Result := Logger;
  FTestFolderName := ExtractFileDir(Application.ExeName);
end;

procedure TLogger.OpenOutputFile(const aFileName: string);
begin
  AssignFile(FFileForOutput, aFileName);
  Rewrite(FFileForOutput);
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

  if (TTextRec(FFileForOutput).Mode = fmOpenRead) or
     (TTextRec(FFileForOutput).Mode = fmOpenWrite)  then
  begin
    OpenOutputFile(FTestFilePath);
  end;
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
  Write(FFileForOutput, aParametr + ' ');
end;

initialization

  Logger := TLogger.Create();

end.