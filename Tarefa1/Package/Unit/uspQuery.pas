unit uspQuery;

interface

uses
  System.Classes,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    FspCondicoes: TStringList;
    FspColunas  : TStringList;
    FspTabelas  : TStringList;
    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);
  public
    procedure GeraSQL;

    function FormatarColunas  : string;
    function FormatarCondicoes: string;
    procedure ValidarGeraSQL;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property spCondicoes: TStringList read FspCondicoes write SetspCondicoes;
    property spColunas  : TStringList read FspColunas   write SetspColunas;
    property spTabelas  : TStringList read FspTabelas   write SetspTabelas;
  end;

implementation

uses
  System.SysUtils;

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FspCondicoes := TStringList.Create;
  FspColunas   := TStringList.Create;
  FspTabelas   := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  FreeAndNil(FspCondicoes);
  FreeAndNil(FspColunas);
  FreeAndNil(FspTabelas);
  inherited;
end;

function TspQuery.FormatarColunas: string;
var
  I: Integer;
begin
  Result := EmptyStr;

  if FspColunas.Text.Trim.IsEmpty then Exit('*');

  for I := 0 to Pred(FspColunas.Count) do
  begin
    if not FspColunas.Strings[I].Trim.IsEmpty then
    begin
      Result := Result + FspColunas.Strings[I].Trim.ToUpper + ', ' +sLineBreak;
    end;
  end;

  Result := Result
              .Trim
              .Trim([',']);
end;

function TspQuery.FormatarCondicoes: string;
begin
  if FspCondicoes.Text.Trim.IsEmpty then Exit(EmptyStr);

  Result := 'WHERE' + sLineBreak;
  Result := Result  + FspCondicoes.Text.Trim.ToUpper;
end;

procedure TspQuery.GeraSQL;
begin
  ValidarGeraSQL;

  Self.SQL.Clear;
  Self.SQL.Add('SELECT');
  Self.SQL.Add(FormatarColunas);
  Self.SQL.Add('FROM');
  Self.SQL.Add(FspTabelas.Text.Trim.ToUpper);
  Self.SQL.Add(FormatarCondicoes);
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  FspColunas.Assign(Value);
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  FspCondicoes.Assign(Value);
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  if (Value.Count > 1) then
    raise Exception.Create('Permitido infomar apenas uma tabela!');

  FspTabelas.Assign(Value);
end;

procedure TspQuery.ValidarGeraSQL;
begin
  if FspTabelas.Text.Trim.IsEmpty then
    raise Exception.Create('Necessário informar uma tabela!');
end;

end.
