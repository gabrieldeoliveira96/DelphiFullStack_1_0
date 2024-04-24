unit uMain.Controller;

interface

uses uFrLogin.view, Vcl.Controls, uMain.Services, System.Classes;

Type
 TMainController = class
   private
    frlogin: TFrLogin;
   public
     procedure getTelaLogin(AParent: TWinControl);
     procedure LimparTelaLogin();
     function getMainServices(Owner: TClass): TComponent;
 end;

implementation

uses System.SysUtils, Forms, uniGUIForm,
  uniGUIApplication;

Function TMainController.getMainServices(Owner: TClass): TComponent;
begin
  Result := MainServices.GetFormInstance(Owner);
end;

procedure TMainController.getTelaLogin(AParent: TWinControl);
begin
 if not assigned(frlogin) then
   frlogin := TFrLogin.create(AParent);

// frlogin.MainController := self;
 frlogin.Parent := AParent;
 frLogin.Show;
 frLogin.BringToFront;
end;

procedure TMainController.LimparTelaLogin;
begin
   if assigned(frlogin) then
   begin
     FreeAndNil(frlogin);
     FreeAndNil(TUniForm(FindClass(frlogin.Parent.Name)));
   end;
end;

end.
