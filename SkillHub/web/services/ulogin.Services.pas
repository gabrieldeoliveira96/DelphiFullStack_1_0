unit ulogin.Services;

interface

uses
  uniGUIMainModule, SysUtils, Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, ulogin.Model;

type

  TLoginServices = class(TUniGUIMainModule)
    RESTLogin: TRESTClient;
    RequestLogin: TRESTRequest;
    ResponseLogin: TRESTResponse;
    RequestCadUsuario: TRESTRequest;
    ResponseCadUsuario: TRESTResponse;
    RESTCadUsuario: TRESTClient;
    RESTAlterarSenha: TRESTClient;
    RequestAlterarSenha: TRESTRequest;
    ResponseAlterarSenha: TRESTResponse;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
  private
    FloginUsuarioModel: TLoginNovoUsuario;
  public
    function CadastrarNovoUsuario(AEmail, ASenha, ANome, ATipoUsuario, ACpf, AFoto: String): boolean;
    function ValidarLogin(AUsuario, ASenha: string): boolean;
    function AlterarSenha(AUsuario, ASenha: string): boolean;
    property ModelUsuario: TLoginNovoUsuario read FloginUsuarioModel write FloginUsuarioModel;
  end;

function LoginServices: TLoginServices;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function LoginServices: TLoginServices;
begin
  Result := TLoginServices(UniApplication.UniMainModule)
end;

procedure TLoginServices.UniGUIMainModuleCreate(Sender: TObject);
begin
  FloginUsuarioModel := TLoginModel.create;
end;

procedure TLoginServices.UniGUIMainModuleDestroy(Sender: TObject);
begin
  if Assigned(FloginUsuarioModel) then
    FreeAndNil(FloginUsuarioModel);

  for var I: integer := ComponentCount -1 downto 0 do
  begin
    if Components[i] is TRESTClient then    
      FreeAndNil(Components[i] as TRESTClient);

    if Components[i] is TRESTResponse then
      FreeAndNil(Components[i] as TRESTResponse);

    if Components[i] is TRESTRequest then
      FreeAndNil(Components[i] as TRESTRequest);         
  end;     
end;

function TLoginServices.AlterarSenha(AUsuario, ASenha: string): boolean;
begin
  var json := '{'+
              '  "cod": "'+AUsuario+'",'+
              '  "senha": "'+ASenha+'"'+
              '}';

   RequestAlterarSenha.Params[0].Value := json;
   RequestAlterarSenha.Execute;

   result := RequestAlterarSenha.Response.StatusCode = 200;
end;

function TLoginServices.CadastrarNovoUsuario(AEmail, ASenha, ANome,
  ATipoUsuario, ACpf, AFoto: String): boolean;
begin
  try
    var
      FloginNovoUsuarioModel: TLoginModel :=  TLoginModel.create;
    try

      FloginNovoUsuarioModel.Email := AEmail;
      FloginNovoUsuarioModel.Senha := ASenha;
      FloginNovoUsuarioModel.Cpf := ACpf;
      FloginNovoUsuarioModel.Foto := AFoto;
      FloginNovoUsuarioModel.Nome := ANome;
      FloginNovoUsuarioModel.TipoUsuario := ATipoUsuario;

      RequestCadUsuario.Params[0].Clear;
      RequestCadUsuario.Params[0].AddValue(FloginNovoUsuarioModel.ObjToJsonString);
      RequestCadUsuario.Execute;

       Result := FloginNovoUsuarioModel.ValidarNovoCadastroDeUsuario(RequestCadUsuario.Response.JSONText);
    Finally
      FreeAndNil(FloginNovoUsuarioModel);
    end;
  except
    on Exception do
    begin
      Result := false;
    end;
  end;
end;

function TLoginServices.ValidarLogin(AUsuario, ASenha: string): boolean;
begin
  Result := false;
  try
    var
      FLogin: TLoginModel := TLoginModel.create;

    try
      FLogin.Email := AUsuario;
      FLogin.Senha := ASenha;

      RequestLogin.Params[0].Clear;
      RequestLogin.Params[0].AddValue(FLogin.ObjToJsonString);
      RequestLogin.Execute;

      Result := FLogin.ValidarLogin(RequestLogin.Response.JSONText);
      FLogin.getInstanciaObj(FloginUsuarioModel);

    finally
      FreeAndNil(FLogin);
    end;

  Except
    on Exception do
    begin
      Result := false;
    end;
  end;
end;

initialization

RegisterMainModuleClass(TLoginServices);

end.
