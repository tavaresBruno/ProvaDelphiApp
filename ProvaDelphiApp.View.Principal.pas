unit ProvaDelphiApp.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    mmTarefas: TMainMenu;
    mniTarefas: TMenuItem;
    mniTarefa1: TMenuItem;
    mniTarefa2: TMenuItem;
    mniTarefa3: TMenuItem;
    procedure mniTarefa1Click(Sender: TObject);
    procedure mniTarefa2Click(Sender: TObject);
    procedure mniTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ProvaDelphiApp.Commons.Util.Form;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.mniTarefa1Click(Sender: TObject);
begin
  TCommonsUtilForm
    .New
    .SetMDIForm(Self)
    .SetClassName('TfTarefa1')
    .Abrir;
end;

procedure TfrmPrincipal.mniTarefa2Click(Sender: TObject);
begin
  TCommonsUtilForm
    .New
    .SetMDIForm(Self)
    .SetClassName('TfTarefa2')
    .Abrir;
end;

procedure TfrmPrincipal.mniTarefa3Click(Sender: TObject);
begin
  TCommonsUtilForm
    .New
    .SetMDIForm(Self)
    .SetClassName('TfTarefa3')
    .Abrir;
end;

end.
