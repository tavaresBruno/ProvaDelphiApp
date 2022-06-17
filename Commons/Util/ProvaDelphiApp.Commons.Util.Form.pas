unit ProvaDelphiApp.Commons.Util.Form;

interface

uses
  Vcl.Forms,
  ProvaDelphiApp.Commons.Util.Interfaces;

type
  TCommonsUtilForm = class(TInterfacedObject, ICommonsUtilForm)
  private
    FMDIForm: TForm;
    FClassName: string;
    FMDIChildForm: TForm;

    procedure VerificarMDIChildAberto;
    procedure CriarMDIChild;

    function SetMDIForm(const AValue: TForm): ICommonsUtilForm;
    function SetClassName(const AValue: string): ICommonsUtilForm;
    function Abrir: ICommonsUtilForm;
  public
    constructor Create;
    class function New: ICommonsUtilForm;
  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TCommonsUtilForm }

function TCommonsUtilForm.Abrir: ICommonsUtilForm;
begin
  Result := Self;

  VerificarMDIChildAberto;

  if Assigned(FMDIChildForm) then
  begin
    FMDIChildForm.Show;
    Exit;
  end;

  CriarMDIChild;
end;

constructor TCommonsUtilForm.Create;
begin
  inherited Create;

  FMDIChildForm := nil;
end;

procedure TCommonsUtilForm.CriarMDIChild;
var
  FormClass: TFormClass;
begin
  try
    FormClass     := TFormClass(FindClass(FClassName));
    FMDIChildForm := FormClass.Create(Application);
  except
    on E: Exception do
      raise Exception.Create(E.ClassName + E.Message);
  end;
end;

procedure TCommonsUtilForm.VerificarMDIChildAberto;
var
  I: Integer;
begin
  for I := 0 to Pred(FMDIForm.MDIChildCount) do
  begin
    if (FMDIForm.MDIChildren[I].ClassName = FClassName) then
    begin
      FMDIChildForm := FMDIForm.MDIChildren[I];
      Exit;
    end;
  end;
end;

class function TCommonsUtilForm.New: ICommonsUtilForm;
begin
  Result := Self.Create;
end;

function TCommonsUtilForm.SetClassName(const AValue: string): ICommonsUtilForm;
begin
  Result     := Self;
  FClassName := AValue;
end;

function TCommonsUtilForm.SetMDIForm(const AValue: TForm): ICommonsUtilForm;
begin
  Result   := Self;
  FMDIForm := AValue;
end;

end.
