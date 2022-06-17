unit ProvaDelphiApp.Commons.Util.Interfaces;

interface

uses
  Vcl.Forms;

type
  ICommonsUtilForm = interface
    ['{5C347A76-EA3A-4842-BC3E-D0A1080AC91B}']
    function SetMDIForm(const AValue: TForm): ICommonsUtilForm;
    function SetClassName(const AValue: string): ICommonsUtilForm;
    function Abrir: ICommonsUtilForm;
  end;

implementation

end.
