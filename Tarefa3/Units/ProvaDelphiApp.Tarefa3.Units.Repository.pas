unit ProvaDelphiApp.Tarefa3.Units.Repository;

interface

uses
  Datasnap.DBClient,
  ProvaDelphiApp.Tarefa3.Interfaces.Repository;

type
  TTarefa3Repository = class(TInterfacedObject, ITarefa3Repository)
  private
    FCdsDadosRepository: TClientDataSet;

    procedure GerarDados;

    function ConsultarDados: OleVariant;
  public
    class function New: ITarefa3Repository;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  ProvaDelphiApp.Tarefa3.Units.DataSet;

{ TTarefa3Repository }

function TTarefa3Repository.ConsultarDados: OleVariant;
begin
  FCdsDadosRepository := TTarefa3DataSet
                           .New
                           .GetCdsDados;
  GerarDados;
  Result := FCdsDadosRepository.Data;
end;

procedure TTarefa3Repository.GerarDados;
var
  I: Integer;
begin
  for I := 1 to 10 do
  begin
    FCdsDadosRepository.Append;
    FCdsDadosRepository.FieldByName('IDPROJETO').AsInteger  := I;
    FCdsDadosRepository.FieldByName('NOMEPROJETO').AsString := 'Projeto ' + IntToStr(I);
    FCdsDadosRepository.FieldByName('VALOR').AsCurrency     := RoundTo(((0.1 + Random) * 1000), -2);
    FCdsDadosRepository.Post;
  end;
end;

class function TTarefa3Repository.New: ITarefa3Repository;
begin
  Result := Self.Create;
end;

end.
