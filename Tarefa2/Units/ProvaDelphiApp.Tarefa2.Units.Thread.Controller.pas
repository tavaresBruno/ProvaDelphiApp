unit ProvaDelphiApp.Tarefa2.Units.Thread.Controller;

interface

uses
  Vcl.ComCtrls,
  ProvaDelphiApp.Tarefa2.Interfaces.Thread.Controller,
  ProvaDelphiApp.Tarefa2.Units.Thread;

type
  TThreadController = class(TInterfacedObject, IThreadController)
  private
    FProgressBar: TProgressBar;
    FTempoMs: Integer;
    FTarefa2Thread: TTarefa2Thread;

    function SetProgressBar(const AValue: TProgressBar): IThreadController;
    function SetTempoMs(const AValue: Integer): IThreadController;
    function Executar: IThreadController;
  public
    class function New: IThreadController;
  end;
implementation

uses
  System.SysUtils,
  ProvaDelphiApp.Tarefa2.Units.Thread.ProgressBar;

{ TThreadProgressBar }

function TThreadController.Executar: IThreadController;
begin
  Result := Self;

  FTarefa2Thread := TTarefa2Thread.Create;
  try
    FTarefa2Thread.Executar(FTempoMs,
      TThreadProgressBar
        .New
        .SetProgressBar(FProgressBar)
        .SetMax(100)
        .GetThreadProgressBar);
  except
    on E: Exception do
      raise Exception.Create(E.ClassName + E.Message);
  end;
end;

class function TThreadController.New: IThreadController;
begin
  Result := Self.Create;
end;

function TThreadController.SetProgressBar(
  const AValue: TProgressBar): IThreadController;
begin
  Result       := Self;
  FProgressBar := AValue;
end;

function TThreadController.SetTempoMs(
  const AValue: Integer): IThreadController;
begin
  Result   := Self;
  FTempoMs := AValue;
end;

end.
