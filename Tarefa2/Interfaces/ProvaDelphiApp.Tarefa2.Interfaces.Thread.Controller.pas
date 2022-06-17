unit ProvaDelphiApp.Tarefa2.Interfaces.Thread.Controller;

interface

uses
  Vcl.ComCtrls;

type
  IThreadController = interface
    ['{8C7957C8-0330-41A8-A5B5-A69EF134DBBB}']
    function SetProgressBar(const AValue: TProgressBar): IThreadController;
    function SetTempoMs(const AValue: Integer): IThreadController;
    function Executar: IThreadController;
  end;

implementation

end.
