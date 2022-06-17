unit ProvaDelphiApp.Test.Units.Tarefa3.Service;

interface

uses
  DUnitX.TestFramework, Datasnap.DBClient,
  ProvaDelphiApp.Tarefa3.Interfaces.Service;

type
  [TestFixture]
  TTarefa3ServiceTest = class
  private
    FTarefa3Service: ITarefa3Service;
    FCdsDadosTest: TClientDataSet;
    procedure GerarDadosTest;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('TesteObterTotal','550')]
    procedure ObterTotalTest(const AResultado: Currency);
    [Test]
    [TestCase('TesteTotalDivisoes','11.83')]
    procedure ObterTotalDivisoesTest(const AResultado: Currency);
  end;

implementation

uses
  System.SysUtils,
  Data.DB,
  ProvaDelphiApp.Tarefa3.Units.Service,
  ProvaDelphiApp.Tarefa3.Units.DataSet;

procedure TTarefa3ServiceTest.GerarDadosTest;
var
  I: Integer;
begin
  for I := 1 to 10 do
  begin
    FCdsDadosTest.Append;
    FCdsDadosTest.FieldByName('IDPROJETO').AsInteger  := I;
    FCdsDadosTest.FieldByName('NOMEPROJETO').AsString := 'Projeto ' + IntToStr(I);
    FCdsDadosTest.FieldByName('VALOR').AsCurrency     := (I * 10);
    FCdsDadosTest.Post;
  end;
end;

procedure TTarefa3ServiceTest.ObterTotalDivisoesTest(const AResultado: Currency);
begin
  Assert.AreEqual(FTarefa3Service.ObterTotalDivisoes, AResultado);
end;

procedure TTarefa3ServiceTest.ObterTotalTest(const AResultado: Currency);
begin
  Assert.AreEqual(FTarefa3Service.ObterTotal, AResultado);
end;

procedure TTarefa3ServiceTest.Setup;
begin
  FCdsDadosTest := TTarefa3DataSet
                     .New
                     .GetCdsDados;
  GerarDadosTest;
  FTarefa3Service := TTarefa3Service
                       .New
                       .SetProjetos(FCdsDadosTest);
end;

procedure TTarefa3ServiceTest.TearDown;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TTarefa3ServiceTest);

end.
