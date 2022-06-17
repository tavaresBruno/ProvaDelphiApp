unit ProvaDelphiApp.Tarefa3.Interfaces.Projeto;

interface

type
  ITarefa3Projeto = interface
    ['{D62DE671-6C77-4E4E-AEB4-0DEB2BAC1416}']
    function SetIdProjeto(const AValue: Integer): ITarefa3Projeto;
    function SetNomeProjeto(const AValue: string): ITarefa3Projeto;
    function SetValor(const AValue: Currency): ITarefa3Projeto;

    function GetIdProjeto: Integer;
    function GetNomeProjeto: string;
    function GetValor: Currency;
  end;

implementation

end.
