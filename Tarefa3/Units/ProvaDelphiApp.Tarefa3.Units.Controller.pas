unit ProvaDelphiApp.Tarefa3.Units.Controller;

interface

uses
  Data.DB, Datasnap.DBClient,
  ProvaDelphiApp.Tarefa3.Interfaces.Controller,
  ProvaDelphiApp.Tarefa3.Interfaces.Service,
  ProvaDelphiApp.Tarefa3.Interfaces.Projetos,
  ProvaDelphiApp.Tarefa3.Interfaces.DataSet;

type
  TTarefa3Controller = class(TInterfacedObject, ITarefa3Controller)
  private
    FTarefa3Service : ITarefa3Service;
    FTarefa3DataSet : ITarefa3DataSet;
    FTarefa3Projetos: ITarefa3Projetos;

    FDsDadosGrid : TDataSource;
    FCdsDadosGrid: TClientDataSet;

    procedure CarregarGrid;

    function GetDsDadosGrid: TDataSource;
    function CarregarProjetos: ITarefa3Controller;
    function ObterTotal: string;
    function ObterTotalDivisoes: string;
  public
    constructor Create;
    class function New: ITarefa3Controller;
  end;

implementation

uses
  System.SysUtils,
  ProvaDelphiApp.Tarefa3.Units.DataSet,
  ProvaDelphiApp.Tarefa3.Units.Service;

{ TTarefa3Controller }

function TTarefa3Controller.CarregarProjetos: ITarefa3Controller;
begin
  Result := Self;
  FTarefa3Service  := TTarefa3Service.New;
  FTarefa3Projetos := FTarefa3Service.Carregar;
  CarregarGrid;
end;

procedure TTarefa3Controller.CarregarGrid;
var
  I: Integer;
begin
  FCdsDadosGrid.EmptyDataSet;
  try
    FCdsDadosGrid.DisableControls;
    for I := 0 to Pred(FTarefa3Projetos.GetCount) do
    begin
      FCdsDadosGrid.Append;
      FCdsDadosGrid.FieldByName('IDPROJETO').AsInteger  := FTarefa3Projetos.GetProjeto(I).GetIdProjeto;
      FCdsDadosGrid.FieldByName('NOMEPROJETO').AsString := FTarefa3Projetos.GetProjeto(I).GetNomeProjeto;
      FCdsDadosGrid.FieldByName('VALOR').AsCurrency     := FTarefa3Projetos.GetProjeto(I).GetValor;
      FCdsDadosGrid.Post;
    end;
  finally
    FCdsDadosGrid.First;
    FCdsDadosGrid.EnableControls;
  end;
end;

constructor TTarefa3Controller.Create;
begin
  inherited Create;

  FTarefa3DataSet := TTarefa3DataSet.New;
  FDsDadosGrid    := FTarefa3DataSet.GetDsDados;
  FCdsDadosGrid   := FTarefa3DataSet.GetCdsDados;
end;

function TTarefa3Controller.GetDsDadosGrid: TDataSource;
begin
  Result := FDsDadosGrid;
end;

class function TTarefa3Controller.New: ITarefa3Controller;
begin
  Result := Self.Create;
end;

function TTarefa3Controller.ObterTotal: string;
begin
  Result := CurrToStrF(FTarefa3Service.ObterTotal, ffNumber, 2);
end;

function TTarefa3Controller.ObterTotalDivisoes: string;
begin
  Result := CurrToStrF(FTarefa3Service.ObterTotalDivisoes, ffNumber, 2);
end;

end.
