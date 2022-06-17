unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  ProvaDelphiApp.Commons.View.TarefaBase;

type
  TfTarefa2 = class(TfrmTarefaBase)
    pnlTarefa2: TPanel;
    grpThread1: TGroupBox;
    grpThread2: TGroupBox;
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    lblThread1TempoMs: TLabel;
    lblThread2TempoMs: TLabel;
    edtThread2TempoMs: TEdit;
    lblThread1Progresso: TLabel;
    lblThread2Progresso: TLabel;
    btnExecutarThreads: TButton;
    edtThread1TempoMs: TEdit;
    procedure btnExecutarThreadsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses
  ProvaDelphiApp.Tarefa2.Units.Thread.Controller;

{$R *.dfm}

procedure TfTarefa2.btnExecutarThreadsClick(Sender: TObject);
begin
  inherited;

  TThreadController
    .New
    .SetProgressBar(pbThread1)
    .SetTempoMs(StrToIntDef(edtThread1TempoMs.Text, 0))
    .Executar
    .SetProgressBar(pbThread2)
    .SetTempoMs(StrToIntDef(edtThread2TempoMs.Text, 0))
    .Executar;
end;

initialization
  RegisterClass(TfTarefa2);

end.
