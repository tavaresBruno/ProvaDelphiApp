unit ProvaDelphiApp.Tarefa3.Units.Projeto;

interface

uses
  ProvaDelphiApp.Tarefa3.Interfaces.Projeto;

type
  TTarefa3Projeto = class(TInterfacedObject, ITarefa3Projeto)
  private
    FIdProjeto: Integer;
    FNomeProjeto: string;
    FValor: Currency;

    function SetIdProjeto(const AValue: Integer): ITarefa3Projeto;
    function SetNomeProjeto(const AValue: string): ITarefa3Projeto;
    function SetValor(const AValue: Currency): ITarefa3Projeto;

    function GetIdProjeto: Integer;
    function GetNomeProjeto: string;
    function GetValor: Currency;
  public
    class function New: ITarefa3Projeto;
  end;

implementation

{ TTarefa3Projeto }

function TTarefa3Projeto.GetIdProjeto: Integer;
begin
  Result := FIdProjeto;
end;

function TTarefa3Projeto.GetNomeProjeto: string;
begin
  Result := FNomeProjeto;
end;

function TTarefa3Projeto.GetValor: Currency;
begin
  Result := FValor;
end;

class function TTarefa3Projeto.New: ITarefa3Projeto;
begin
  Result := Self.Create;
end;

function TTarefa3Projeto.SetIdProjeto(const AValue: Integer): ITarefa3Projeto;
begin
  Result     := Self;
  FIdProjeto := AValue;
end;

function TTarefa3Projeto.SetNomeProjeto(const AValue: string): ITarefa3Projeto;
begin
  Result       := Self;
  FNomeProjeto := AValue;
end;

function TTarefa3Projeto.SetValor(const AValue: Currency): ITarefa3Projeto;
begin
  Result := Self;
  FValor := AValue;
end;

end.
