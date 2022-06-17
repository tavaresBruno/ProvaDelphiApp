unit ProvaDelphiApp.Tarefa2.Units.Thread;

interface

uses
  System.Classes,
  ProvaDelphiApp.Tarefa2.Interfaces.Thread.ProgressBar;

type
  TTarefa2Thread = class(TThread)
  private
    FTempoMs: Integer;
    FProgresso: Integer;
    FProgressBar: IThreadProgressBar;

    procedure AtualizarProgresso;
  protected
    procedure Execute; override;
  public
    constructor Create;
    procedure Executar(ATempoMs: Integer; AProgressBar: IThreadProgressBar);
  end;

implementation

{ TTarefa2Thread }

procedure TTarefa2Thread.AtualizarProgresso;
begin
  FProgressBar
    .SetPosition(FProgresso)
    .AtualizarProgresso;
end;

constructor TTarefa2Thread.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
end;

procedure TTarefa2Thread.Executar(ATempoMs: Integer;
  AProgressBar: IThreadProgressBar);
begin
  FTempoMs        := ATempoMs;
  FProgressBar    := AProgressBar;
  Self.Start;
end;

procedure TTarefa2Thread.Execute;
var
  I: Integer;
begin
  inherited;

  for I := 0 to 100 do
  begin
    FProgresso := I;
    Self.Synchronize(AtualizarProgresso);
    Sleep(FTempoMs);
  end;
end;

end.
