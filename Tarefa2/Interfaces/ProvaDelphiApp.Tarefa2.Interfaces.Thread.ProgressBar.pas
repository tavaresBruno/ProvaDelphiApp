unit ProvaDelphiApp.Tarefa2.Interfaces.Thread.ProgressBar;

interface

uses
  Vcl.ComCtrls;

type
  IThreadProgressBar = interface
    ['{FC763741-D1EB-4314-BDE9-517A8C608B70}']
    function SetProgressBar(const AValue: TProgressBar): IThreadProgressBar;
    function SetMax(const AValue: Integer): IThreadProgressBar;
    function SetPosition(const AValue: Integer): IThreadProgressBar;
    function GetThreadProgressBar: IThreadProgressBar;
    function AtualizarProgresso: IThreadProgressBar;
  end;

implementation

end.
