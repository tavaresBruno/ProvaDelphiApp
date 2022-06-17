program ProvaDelphiAppTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  ProvaDelphiApp.Test.Units.spQuery in 'Units\ProvaDelphiApp.Test.Units.spQuery.pas',
  ProvaDelphiApp.Test.Units.Tarefa3.Service in 'Units\ProvaDelphiApp.Test.Units.Tarefa3.Service.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.DataSet in '..\Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.DataSet.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Service in '..\Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Service.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Projetos in '..\Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Projetos.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Projeto in '..\Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Projeto.pas',
  ProvaDelphiApp.Tarefa3.Units.Service in '..\Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Service.pas',
  ProvaDelphiApp.Tarefa3.Units.Projetos in '..\Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Projetos.pas',
  ProvaDelphiApp.Tarefa3.Units.Projeto in '..\Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Projeto.pas',
  ProvaDelphiApp.Tarefa3.Units.Repository in '..\Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Repository.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Repository in '..\Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Repository.pas',
  ProvaDelphiApp.Tarefa3.Units.DataSet in '..\Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.DataSet.pas';

{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
