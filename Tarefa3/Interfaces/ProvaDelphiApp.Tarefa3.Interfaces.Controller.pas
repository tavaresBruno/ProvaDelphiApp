unit ProvaDelphiApp.Tarefa3.Interfaces.Controller;

interface

uses
  Data.DB;

type
  ITarefa3Controller = interface
    ['{235BFCE7-9AB7-46BA-A26A-1D434F1776DC}']
    function GetDsDadosGrid: TDataSource;
    function CarregarProjetos: ITarefa3Controller;
    function ObterTotal: string;
    function ObterTotalDivisoes: string;
  end;

implementation

end.
