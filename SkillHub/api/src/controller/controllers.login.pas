unit controllers.login;

interface

uses Horse, System.JSON, model.login;

procedure Login;
procedure ValidaLogin(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils;

procedure Login;
begin
  THorse.Post('login', ValidaLogin);
end;

procedure ValidaLogin(Req: THorseRequest; Res: THorseResponse);
var
  LdmLogin: TDmLogin;
begin
  try
    LdmLogin := TDmLogin.Create(nil);
    try
      Res.Send<Tjsonobject>(LdmLogin.ValidaLogin(Req.Body<TJSONObject>));
    finally
      Res.Status(200);
      freeAndNil(LdmLogin);
    end;

  except on E: Exception do
    begin
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmLogin);
    end;
  end;
end;

end.
