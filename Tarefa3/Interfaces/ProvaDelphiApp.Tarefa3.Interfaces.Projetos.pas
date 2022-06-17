unit ProvaDelphiApp.Tarefa3.Interfaces.Projetos;

interface

uses
  ProvaDelphiApp.Tarefa3.Interfaces.Projeto;

type
  ITarefa3Projetos = interface
    ['{56E8060B-FED8-448D-B477-68DC2FDFA836}']
    function Add(AValue: ITarefa3Projeto): ITarefa3Projetos;
    function GetProjeto(AIndex: Integer): ITarefa3Projeto;
    function GetCount: Integer;
  end;

implementation

end.
