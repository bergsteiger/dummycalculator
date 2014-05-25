unit BaseClasses;

interface

const
  cEtalonSuffix = '.etalon';
  cTestSuffix = '.out';
  cTestDirecory = 'TestSet';

type
  // Паттерн "одиночка"
  TLogger = class
  strict private
    class var Instance: TLogger;
    FFileForOutput,
    FFileEtalon: TextFile;
    FTestFolderName : string;
  public
    class function NewInstance: TObject; override;

    function OutputPath: string;
    function TestSetFolderName: string;
    procedure OpenOutputFile(const aFileName: string);
    procedure CloseOutputFile;

    procedure CheckWithEtalon(const aFileName: string);
    procedure CheckOutputWithInput(const aSt: string;
                                   const anExtraFileName: string = '');
    procedure ToLog(const aFileName: string;
                    const aParametr: string);
    procedure CheckEtalonInFolder(aHeaderBegin: AnsiChar);
      {* Сравнивает файлы в папке с названием класса с эталонами в папке с суффиксом '_Etalon'. }
    procedure ClearTestFolder;
    function OutputFolderNameWitEtalons: string;
       {* Директория для эталонов. }
  end;//TLogger

var
  Logger: TLogger;

implementation

uses
  SysUtils,
  vcl.Forms;

{ TSingleton }

procedure TLogger.CheckEtalonInFolder(aHeaderBegin: AnsiChar);
begin

end;

procedure TLogger.CheckOutputWithInput(const aSt: string;
                                       const anExtraFileName: string = '');
begin

end;

procedure TLogger.CheckWithEtalon(const aFileName: string);
begin

end;

procedure TLogger.ClearTestFolder;
begin

end;

procedure TLogger.CloseOutputFile;
begin
  CloseFile(FFileForOutput);
end;

class function TLogger.NewInstance: TObject;
begin
  if not Assigned(Instance) then
  begin
    Instance := TLogger(inherited NewInstance);
  end;
  Result := Instance;
  FTestFolderName := ExtractFileDir(Application.ExeName);
end;

procedure TLogger.OpenOutputFile(const aFileName: string);
begin
  AssignFile(FFileForOutput, aFileName);
  Rewrite(FFileForOutput);
end;

function TLogger.OutputFolderNameWitEtalons: string;
begin

end;

function TLogger.OutputPath: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + TestSetFolderName + '\'
end;

function TLogger.TestSetFolderName: string;
begin
  Result := cTestDirecory;
end;

procedure TLogger.ToLog(const aFileName: string;
                        const aParametr: string);
var
  l_FilePath : string;
begin
  Assert(aFileName<>'');
  l_FilePath := OutputPath + aFileName + cTestSuffix;

  if not DirectoryExists(OutputPath) then
    CreateDir(OutputPath);

  if (TTextRec(FFileForOutput).Mode = fmOpenRead) or
     (TTextRec(FFileForOutput).Mode = fmOpenWrite)  then
  begin
    OpenOutputFile(l_FilePath);
  end;

  Write(FFileForOutput, aParametr + ' ');
end;

initialization

end.