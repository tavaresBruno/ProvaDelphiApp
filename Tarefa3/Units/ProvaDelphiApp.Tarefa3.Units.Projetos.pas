unit ProvaDelphiApp.Tarefa3.Units.Projetos;

interface

uses
  System.Classes,
  ProvaDelphiApp.Tarefa3.Interfaces.Projeto,
  ProvaDelphiApp.Tarefa3.Interfaces.Projetos;

type
  TTarefa3Projetos = class(TInterfacedObject, ITarefa3Projetos)
  private
    FProjetosList: IInterfaceList;

    function Add(AValue: ITarefa3Projeto): ITarefa3Projetos;
    function GetProjeto(AIndex: Integer): ITarefa3Projeto;
    function GetCount: Integer;
  public
    constructor Create;
    class function New: ITarefa3Projetos;
  end;

implementation

{ TTarefa3Projetos }

function TTarefa3Projetos.Add(AValue: ITarefa3Projeto): ITarefa3Projetos;
begin
  Result := Self;
  FProjetosList.Add(AValue);
end;

constructor TTarefa3Projetos.Create;
begin
  inherited Create;

  FProjetosList := TInterfaceList.Create;
end;

function TTarefa3Projetos.GetCount: Integer;
begin
  Result := FProjetosList.Count;
end;

function TTarefa3Projetos.GetProjeto(AIndex: Integer): ITarefa3Projeto;
begin
  Result := ITarefa3Projeto(FProjetosList.Items[AIndex]);
end;

class function TTarefa3Projetos.New: ITarefa3Projetos;
begin
  Result := Self.Create;
end;

end.
