unit ProvaDelphiApp.Tarefa3.Units.Service;

interface

uses
  Datasnap.DBClient,
  ProvaDelphiApp.Tarefa3.Interfaces.Service,
  ProvaDelphiApp.Tarefa3.Interfaces.Projetos;

type
  TTarefa3Service = class(TInterfacedObject, ITarefa3Service)
  private
    FTarefa3Projetos: ITarefa3Projetos;

    procedure ValidarTarefa3Projetos;

    function SetProjetos(const AValue: TClientDataSet): ITarefa3Service;
    function Carregar: ITarefa3Projetos;
    function ObterTotal: Currency;
    function ObterTotalDivisoes: Currency;
  public
    class function New: ITarefa3Service;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  ProvaDelphiApp.Tarefa3.Units.DataSet,
  ProvaDelphiApp.Tarefa3.Units.Projetos,
  ProvaDelphiApp.Tarefa3.Units.Projeto,
  ProvaDelphiApp.Tarefa3.Units.Repository;

{ TTarefa3Service }

function TTarefa3Service.Carregar: ITarefa3Projetos;
begin
  SetProjetos(TTarefa3DataSet
                .New
                .SetCdsData(TTarefa3Repository
                              .New
                              .ConsultarDados)
                .GetCdsDados);
  Result := FTarefa3Projetos;
end;

class function TTarefa3Service.New: ITarefa3Service;
begin
  Result := Self.Create;
end;

function TTarefa3Service.ObterTotal: Currency;
var
  I: Integer;
begin
  Result := 0;
  ValidarTarefa3Projetos;
  for I := 0 to Pred(FTarefa3Projetos.GetCount) do
  begin
    Result := Result + FTarefa3Projetos.GetProjeto(I).GetValor;
  end;
end;

function TTarefa3Service.ObterTotalDivisoes: Currency;
var
  I: Integer;
begin
  Result := 0;
  ValidarTarefa3Projetos;
  for I := Pred(FTarefa3Projetos.GetCount) Downto 1 do
  begin
    Result :=
      Result +
      FTarefa3Projetos.GetProjeto(I).GetValor /
      FTarefa3Projetos.GetProjeto(Pred(I)).GetValor;
  end;
  Result := RoundTo(Result, -2);
end;

function TTarefa3Service.SetProjetos(
  const AValue: TClientDataSet): ITarefa3Service;
begin
  Result := Self;
  FTarefa3Projetos := TTarefa3Projetos.New;
  AValue.First;
  while not AValue.Eof do
  begin
    FTarefa3Projetos.Add(TTarefa3Projeto
                           .New
                           .SetIdProjeto(AValue.FieldByName('IDPROJETO').AsInteger)
                           .SetNomeProjeto(AValue.FieldByName('NOMEPROJETO').AsString)
                           .SetValor(AValue.FieldByName('VALOR').AsCurrency));
    AValue.Delete;
  end;
end;

procedure TTarefa3Service.ValidarTarefa3Projetos;
begin
  if not Assigned(FTarefa3Projetos) then
    raise Exception.Create('Necessário carregar os Projetos!');
end;

end.
