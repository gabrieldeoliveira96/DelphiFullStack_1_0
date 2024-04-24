unit uMain.Services;

interface

uses
  uniGUIMainModule, SysUtils, Classes;

type
  TMainServices = class(TUniGUIMainModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainServices: TMainServices;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function MainServices: TMainServices;
begin
  Result := TMainServices(MainServices.GetModuleInstance(TMainServices));
end;

initialization
  RegisterModuleClass(TMainServices);

end.
