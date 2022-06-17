unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys, FireDAC.Phys.SQLite, Vcl.StdCtrls,
  Vcl.ExtCtrls, uspQuery, ProvaDelphiApp.Commons.View.TarefaBase;

type
  TfTarefa1 = class(TfrmTarefaBase)
    spQuery: TspQuery;
    pnlTarefa1: TPanel;
    grpColunas: TGroupBox;
    grpTabelas: TGroupBox;
    grpCondicoes: TGroupBox;
    btnGeraSQL: TButton;
    grpSQLGerado: TGroupBox;
    mmoColunas: TMemo;
    mmoTabelas: TMemo;
    mmoCondicoes: TMemo;
    mmoSQLGerado: TMemo;
    procedure btnGeraSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  inherited;
  spQuery.spColunas   := TStringList(mmoColunas.Lines);
  spQuery.spTabelas   := TStringList(mmoTabelas.Lines);
  spQuery.spCondicoes := TStringList(mmoCondicoes.Lines);
  spQuery.GeraSQL;
  mmoSQLGerado.Lines := spQuery.SQL;
end;

initialization
  RegisterClass(TfTarefa1);

end.
