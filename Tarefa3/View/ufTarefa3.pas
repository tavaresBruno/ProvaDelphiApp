unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls,
  ProvaDelphiApp.Commons.View.TarefaBase,
  ProvaDelphiApp.Tarefa3.Interfaces.Controller;

type
  TfTarefa3 = class(TfrmTarefaBase)
    pnlTarefa3: TPanel;
    grpProjetos: TGroupBox;
    dbgrdProjetos: TDBGrid;
    pnlTotal: TPanel;
    pnlTotalDivisoes: TPanel;
    btnTotal: TButton;
    lblTotal: TLabel;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    lblTotalDivisoes: TLabel;
    btnTotalDivisoes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    FTarefa3Controller: ITarefa3Controller;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

uses
  ProvaDelphiApp.Tarefa3.Units.Controller;

{$R *.dfm}

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
  inherited;
  edtTotal.Text := FTarefa3Controller.ObterTotal;
end;

procedure TfTarefa3.btnTotalDivisoesClick(Sender: TObject);
begin
  inherited;
  edtTotalDivisoes.Text := FTarefa3Controller.ObterTotalDivisoes;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  inherited;

  FTarefa3Controller := TTarefa3Controller.New;
  dbgrdProjetos.DataSource := FTarefa3Controller.GetDsDadosGrid;
end;

procedure TfTarefa3.FormShow(Sender: TObject);
begin
  inherited;
  FTarefa3Controller.CarregarProjetos;
end;

initialization
  RegisterClass(TfTarefa3);

end.
