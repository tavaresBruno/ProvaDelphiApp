unit ProvaDelphiApp.Tarefa2.Units.Thread.ProgressBar;

interface

uses
  Vcl.ComCtrls,
  ProvaDelphiApp.Tarefa2.Interfaces.Thread.ProgressBar;

type
  TThreadProgressBar = class(TInterfacedObject, IThreadProgressBar)
  private
    FProgressBar: TProgressBar;
    FMax: Integer;
    FPosition: Integer;

    function SetProgressBar(const AValue: TProgressBar): IThreadProgressBar;
    function SetMax(const AValue: Integer): IThreadProgressBar;
    function SetPosition(const AValue: Integer): IThreadProgressBar;
    function GetThreadProgressBar: IThreadProgressBar;
    function AtualizarProgresso: IThreadProgressBar;
  public
    constructor Create;
    class function New: IThreadProgressBar;
  end;

implementation

{ TThreadProgressBar }

function TThreadProgressBar.AtualizarProgresso: IThreadProgressBar;
begin
  Result := Self;
  FProgressBar.Position := FPosition;
end;

constructor TThreadProgressBar.Create;
begin
  inherited Create;

  FPosition := 0;
end;

function TThreadProgressBar.GetThreadProgressBar: IThreadProgressBar;
begin
  Result := Self;
  FProgressBar.Position := FPosition;
  FProgressBar.Max      := FMax;
end;

class function TThreadProgressBar.New: IThreadProgressBar;
begin
  Result := Self.Create;
end;

function TThreadProgressBar.SetMax(const AValue: Integer): IThreadProgressBar;
begin
  Result := Self;
  FMax   := AValue;
end;

function TThreadProgressBar.SetPosition(
  const AValue: Integer): IThreadProgressBar;
begin
  Result    := Self;
  FPosition := AValue;
end;

function TThreadProgressBar.SetProgressBar(
  const AValue: TProgressBar): IThreadProgressBar;
begin
  Result       := Self;
  FProgressBar := AValue;
end;

end.
