unit controllers.usuario;

interface

uses Horse, System.JSON, model.usuario, controller.log;

procedure Usuario;
procedure PostUsuario(Req: THorseRequest; Res: THorseResponse);
procedure GetObterUsuario(Req: THorseRequest; Res: THorseResponse);
procedure EditarSenha(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils;

procedure Usuario;
begin
  THorse.Post('cadastrar/usuario', PostUsuario);
  THorse.Get('obter/usuario/:cod', GetObterUsuario);
  THorse.Put('editar/senha', EditarSenha);
end;

procedure PostUsuario(Req: THorseRequest; Res: THorseResponse);
var
  LdmUsuario: TDmUsuario;
begin
  try
    Log('Cadastrando usuario');
    LdmUsuario := TDmUsuario.Create(nil);
    try
      Res.Send<Tjsonobject>(LdmUsuario.PostUsuario(Req.Body<TJSONObject>));
    finally
      Res.Status(200);
      freeAndNil(LdmUsuario);
    end;

  except on E: Exception do
    begin
      Log('Erro Usuario ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmUsuario);
    end;
  end;
end;

procedure GetObterUsuario(Req: THorseRequest; Res: THorseResponse);
var
  LdmUsuario: TDmUsuario;
begin
  try
    Log('Obter usuario');
    LdmUsuario := TDmUsuario.Create(nil);
    try
      Res.Send<Tjsonobject>(LdmUsuario.ObterUsuario(Req.Params.Items['cod'].ToInteger));
    finally
      Res.Status(200);
      freeAndNil(LdmUsuario);
    end;

  except on E: Exception do
    begin
      Log('Erro Usuario ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmUsuario);
    end;
  end;
end;

procedure EditarSenha(Req: THorseRequest; Res: THorseResponse);
var
  LdmUsuario: TDmUsuario;
  LSenha: string;
  LCod: integer;
  LBody: TJSONObject;
begin
  try
    Log('Editando senha do usuario');
    LdmUsuario := TDmUsuario.Create(nil);
    try
      LBody := Req.Body<TJSONObject>;
      LSenha := LBody.GetValue<string>('senha');
      Lcod := LBody.GetValue<integer>('cod');

      LdmUsuario.EditarSenha(LSenha, LCod);

    finally
      Res.Send('Senha Alterada com sucesso!').Status(200);
      freeAndNil(LdmUsuario);
    end;

  except on E: Exception do
    begin
      Log('Erro Usuario ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmUsuario);
    end;
  end;
end;

end.
