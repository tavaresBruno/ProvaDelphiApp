unit ProvaDelphiApp.Tarefa3.Units.DataSet;

interface

uses
  Data.DB, Datasnap.DBClient,
  ProvaDelphiApp.Tarefa3.Interfaces.DataSet;

type
  TTarefa3DataSet = class(TInterfacedObject, ITarefa3DataSet)
  private
    FDsDados: TDataSource;
    FCdsDados: TClientDataSet;

    procedure CriarFieldsDados;

    function SetCdsData(const AValue: OleVariant): ITarefa3DataSet;
    function GetDsDados: TDataSource;
    function GetCdsDados: TClientDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ITarefa3DataSet;
  end;

implementation

uses
  System.SysUtils;

{ TTarefa3DataSet }

constructor TTarefa3DataSet.Create;
begin
  inherited Create;

  FDsDados  := TDataSource.Create(nil);
  FCdsDados := TClientDataSet.Create(nil);
  CriarFieldsDados;
  FDsDados.DataSet := FCdsDados;
end;

procedure TTarefa3DataSet.CriarFieldsDados;
begin
  FCdsDados.Close;
  FCdsDados.FieldDefs.Clear;
  FCdsDados.FieldDefs.Add('IDPROJETO', ftInteger);
  FCdsDados.FieldDefs.Add('NOMEPROJETO', ftString, 30);
  FCdsDados.FieldDefs.Add('VALOR', ftCurrency);
  FCdsDados.CreateDataSet;
  FCdsDados.Open;
end;

destructor TTarefa3DataSet.Destroy;
begin
  FreeAndNil(FDsDados);
  FreeAndNil(FCdsDados);

  inherited;
end;

function TTarefa3DataSet.GetCdsDados: TClientDataSet;
begin
  Result := FCdsDados;
end;

function TTarefa3DataSet.GetDsDados: TDataSource;
begin
  Result := FDsDados;
end;

class function TTarefa3DataSet.New: ITarefa3DataSet;
begin
  Result := Self.Create;
end;

function TTarefa3DataSet.SetCdsData(const AValue: OleVariant): ITarefa3DataSet;
begin
  Result := Self;
  FCdsDados.Data := AValue;
end;

end.
