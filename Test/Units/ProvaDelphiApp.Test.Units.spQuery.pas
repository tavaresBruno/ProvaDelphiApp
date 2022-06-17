unit ProvaDelphiApp.Test.Units.spQuery;

interface

uses
  DUnitX.TestFramework, FireDAC.DApt, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys,
  FireDAC.Phys.SQLite, uspQuery;

type
  [TestFixture]
  TspQueryTest = class
  private
    FspQuery: TspQuery;
    FspTabelasList: TStringList;
    FspCondicoesList: TStringList;
    FspColunasList: TStringList;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure MaximoTabelaTest;
    [Test]
    procedure GeraSQLSemPropriedadesTest;
    [Test]
    [TestCase('TesteSemColuna',',Tabela,Condicao,SELECT * FROM TABELA WHERE CONDICAO')]
    [TestCase('TesteSemColunaSemCondicao',',Tabela,,SELECT * FROM TABELA ')]
    [TestCase('TesteComColunaSemCondicao','Coluna1;Coluna2|Tabela||SELECT COLUNA1,  COLUNA2 FROM TABELA ', '|')]
    [TestCase('TesteComColunaComCondicao','Coluna1;Coluna2|Tabela|Condicao|SELECT COLUNA1,  COLUNA2 FROM TABELA WHERE CONDICAO', '|')]
    procedure GeraSQLTest(const AColunas: string; const ATabelas: string;
      const ACondicoes: string; const AResultado: string);
  end;

implementation

uses
  System.SysUtils;

procedure TspQueryTest.Setup;
begin
  FspQuery         := TspQuery.Create(nil);
  FspTabelasList   := TStringList.Create;
  FspCondicoesList := TStringList.Create;
  FspColunasList   := TStringList.Create;

  FspTabelasList.Delimiter   := ';';
  FspCondicoesList.Delimiter := ';';
  FspColunasList.Delimiter   := ';';
end;

procedure TspQueryTest.TearDown;
begin
  FreeAndNil(FspQuery);
  FreeAndNil(FspTabelasList);
  FreeAndNil(FspCondicoesList);
  FreeAndNil(FspColunasList);
end;

procedure TspQueryTest.GeraSQLTest(const AColunas: string; const ATabelas: string;
  const ACondicoes: string; const AResultado: string);
begin
  FspColunasList.DelimitedText   := AColunas;
  FspTabelasList.DelimitedText   := ATabelas;
  FspCondicoesList.DelimitedText := ACondicoes;

  FspQuery.spColunas   := FspColunasList;
  FspQuery.spTabelas   := FspTabelasList;
  FspQuery.spCondicoes := FspCondicoesList;
  FspQuery.GeraSQL;

  Assert.AreEqual(StringReplace(FspQuery.SQL.Text, sLineBreak, ' ', [rfReplaceAll]), AResultado);
end;

procedure TspQueryTest.GeraSQLSemPropriedadesTest;
begin
  Assert.WillRaise(FspQuery.GeraSQL);
end;

procedure TspQueryTest.MaximoTabelaTest;
begin
  FspTabelasList.Clear;
  FspTabelasList.Add('TabelaTest1');
  FspTabelasList.Add('TabelaTest2');
  Assert.WillRaise(
    procedure
    begin
      FspQuery.spTabelas := FspTabelasList;
    end);
end;

initialization
  TDUnitX.RegisterTestFixture(TspQueryTest);

end.
