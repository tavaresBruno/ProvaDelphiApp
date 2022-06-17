unit ProvaDelphiApp.Tarefa3.Interfaces.DataSet;

interface

uses
  Data.DB, Datasnap.DBClient;

type
  ITarefa3DataSet = interface
    ['{AEC8A7D3-DB15-4FB7-A97C-B6CBEFA274E8}']
    function SetCdsData(const AValue: OleVariant): ITarefa3DataSet;
    function GetDsDados: TDataSource;
    function GetCdsDados: TClientDataSet;
  end;

implementation

end.
