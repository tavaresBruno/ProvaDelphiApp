unit ProvaDelphiApp.Tarefa3.Interfaces.Service;

interface

uses
  Datasnap.DBClient,
  ProvaDelphiApp.Tarefa3.Interfaces.Projetos;

type
  ITarefa3Service = interface
    ['{57CDE35E-EA80-4F00-836B-8F1242DC5C70}']
    function SetProjetos(const AValue: TClientDataSet): ITarefa3Service;
    function Carregar: ITarefa3Projetos;
    function ObterTotal: Currency;
    function ObterTotalDivisoes: Currency;
  end;

implementation

end.
