unit controllers.privacidade;

interface

uses Horse, System.JSON, model.privacidade, controller.log;

procedure Privacidade;
procedure PostPrivacidade(Req: THorseRequest; Res: THorseResponse);
procedure GetPrivacidade(Req: THorseRequest; Res: THorseResponse);

implementation
uses
  System.SysUtils;

procedure Privacidade;
begin
  THorse.Post('cadastrar/privacidade/usuario', PostPrivacidade);
  THorse.Get('obter/privacidade/usuario/:cod', GetPrivacidade);
end;

procedure PostPrivacidade(Req: THorseRequest; Res: THorseResponse);
 var
  LdmPrivacidade: TdmPrivacidade;
begin
  try
    Log('Cadastrando privacidade usuario');
    LdmPrivacidade := TdmPrivacidade.Create(nil);
    try
      Res.Send<Tjsonobject>(LdmPrivacidade.IncluirPrivacidade(Req.Body<TJSONObject>));
    finally
      Res.Status(200);
      freeAndNil(LdmPrivacidade);
    end;

  except on E: Exception do
    begin
      Log('Erro privacidade Usuario ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmPrivacidade);
    end;
  end;
end;

procedure GetPrivacidade(Req: THorseRequest; Res: THorseResponse);
var
  LdmPrivacidade: TdmPrivacidade;
begin
  try
    Log('Obter usuario');
    LdmPrivacidade := TdmPrivacidade.Create(nil);
    try
      Res.Send<Tjsonobject>(LdmPrivacidade.BuscarPrivacidade(Req.Params.Items['cod'].ToInteger));
    finally
      Res.Status(200);
      freeAndNil(LdmPrivacidade);
    end;

  except on E: Exception do
    begin
      Log('Erro Usuario ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmPrivacidade);
    end;
  end;
end;

end.
