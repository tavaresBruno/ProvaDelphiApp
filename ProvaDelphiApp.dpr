program ProvaDelphiApp;

uses
  Vcl.Forms,
  ProvaDelphiApp.View.Principal in 'ProvaDelphiApp.View.Principal.pas' {frmPrincipal},
  ProvaDelphiApp.Commons.Util.Interfaces in 'Commons\Util\ProvaDelphiApp.Commons.Util.Interfaces.pas',
  ProvaDelphiApp.Commons.Util.Form in 'Commons\Util\ProvaDelphiApp.Commons.Util.Form.pas',
  ProvaDelphiApp.Commons.View.TarefaBase in 'Commons\View\ProvaDelphiApp.Commons.View.TarefaBase.pas' {frmTarefaBase},
  ufTarefa1 in 'Tarefa1\View\ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'Tarefa2\View\ufTarefa2.pas' {fTarefa2},
  ufTarefa3 in 'Tarefa3\View\ufTarefa3.pas' {fTarefa3},
  ProvaDelphiApp.Tarefa2.Units.Thread in 'Tarefa2\Units\ProvaDelphiApp.Tarefa2.Units.Thread.pas',
  ProvaDelphiApp.Tarefa2.Interfaces.Thread.ProgressBar in 'Tarefa2\Interfaces\ProvaDelphiApp.Tarefa2.Interfaces.Thread.ProgressBar.pas',
  ProvaDelphiApp.Tarefa2.Units.Thread.ProgressBar in 'Tarefa2\Units\ProvaDelphiApp.Tarefa2.Units.Thread.ProgressBar.pas',
  ProvaDelphiApp.Tarefa2.Interfaces.Thread.Controller in 'Tarefa2\Interfaces\ProvaDelphiApp.Tarefa2.Interfaces.Thread.Controller.pas',
  ProvaDelphiApp.Tarefa2.Units.Thread.Controller in 'Tarefa2\Units\ProvaDelphiApp.Tarefa2.Units.Thread.Controller.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.DataSet in 'Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.DataSet.pas',
  ProvaDelphiApp.Tarefa3.Units.DataSet in 'Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.DataSet.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Controller in 'Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Controller.pas',
  ProvaDelphiApp.Tarefa3.Units.Controller in 'Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Controller.pas',
  ProvaDelphiApp.Tarefa3.Units.Service in 'Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Service.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Service in 'Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Service.pas',
  ProvaDelphiApp.Tarefa3.Units.Repository in 'Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Repository.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Repository in 'Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Repository.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Projeto in 'Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Projeto.pas',
  ProvaDelphiApp.Tarefa3.Units.Projeto in 'Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Projeto.pas',
  ProvaDelphiApp.Tarefa3.Interfaces.Projetos in 'Tarefa3\Interfaces\ProvaDelphiApp.Tarefa3.Interfaces.Projetos.pas',
  ProvaDelphiApp.Tarefa3.Units.Projetos in 'Tarefa3\Units\ProvaDelphiApp.Tarefa3.Units.Projetos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
