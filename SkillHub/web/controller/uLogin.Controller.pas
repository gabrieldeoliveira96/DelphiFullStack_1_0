unit uLogin.Controller;

interface

uses  Vcl.Controls, System.SysUtils, Forms, uniGUIForm, System.Classes,
  uniGUIFrame;

type
  TLoginController = class
    private

    public
      procedure getTelaPrincipal(Owner : TComponent);
      procedure getTelaCadastroNovoUsuarioLogin(AOwner: TComponent; AParent: TWinControl);
      function  ValidarLogin(AUsuario, ASenha: String): boolean;
      function  AlterarSenha(AUsuario, ASenha: String): boolean;
      function  CadastrarNovoUsuario(AEmail, ASenha, ANome, ATipoUsuario, ACpf, AFoto: String): boolean;
      
  end;

implementation

uses
  ulogin.Services,uniGUIApplication, uCadastroUsuarioLogin.View, uFrmPrincipal.view;

{ TLoginController }

function TLoginController.ValidarLogin(AUsuario, ASenha: String): boolean;
begin
   Result := False;
   try
     Result := LoginServices.ValidarLogin(AUsuario, ASenha);
   except
     Result := False;
   end;
end;

function TLoginController.AlterarSenha(AUsuario, ASenha: String): boolean;
begin
    Result := False;
   try
     Result := LoginServices.AlterarSenha(AUsuario, ASenha);
   except
     Result := False;
   end;
end;

function TLoginController.CadastrarNovoUsuario(AEmail, ASenha, ANome, ATipoUsuario, ACpf, AFoto: String): boolean;
begin
  Result := False;
  try
     Result := LoginServices.CadastrarNovoUsuario(AEmail, ASenha, ANome, ATipoUsuario, ACpf, AFoto);
  except
     Result := False;
  end;
end;

procedure TLoginController.getTelaCadastroNovoUsuarioLogin(AOwner: TComponent; AParent :TWinControl);
var FrCadUsuario: TFrCadUsuarioLogin;
begin
  FrCadUsuario := TFrCadUsuarioLogin.create(AOwner);
  FrCadUsuario.Parent :=  AParent;
  FrCadUsuario.Show;
end;

procedure TLoginController.getTelaPrincipal(Owner : TComponent);
begin
  TUniFrame(Owner).Parent := nil;
  FreeAndNil(TUniFrame(Owner));

  var frmPrincipal: TFrPrincipal := TFrPrincipal.Create(UniApplication);
  frmPrincipal.Show(
    procedure (Sender : TComponent; Result: Integer)
    begin
      frmPrincipal.Release;
    end);
end;

end.
