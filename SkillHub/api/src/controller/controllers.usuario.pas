unit controllers.usuario;

interface

uses Horse, System.JSON, model.usuario, controller.log;

procedure Usuario;
procedure PostUsuario(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils;

procedure Usuario;
begin
  THorse.Post('cadastrar/usuario', PostUsuario);
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

end.
