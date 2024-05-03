unit controllers.notificacao;

interface

uses Horse, System.JSON, model.notificacao, controller.log, System.SysUtils;

procedure Notificacao;
procedure GetNotificacao(Req: THorseRequest; Res: THorseResponse);

implementation

procedure Notificacao;
begin
//  THorse.Post('cadastrar/notificacao', PostUsuario);
  THorse.Get('obter/notificacao/:tipo', GetNotificacao);
end;

procedure GetNotificacao(Req: THorseRequest; Res: THorseResponse);
var
  LdmNotificao: TDmNotificacao;
begin
  try
    Log('Obter Notificação');
    LdmNotificao := TDmNotificacao.Create(nil);
    try
      Res.Send<TJSONArray>(LdmNotificao.GetNotificacao(req.Params.Items['tipo'].ToInteger));
    finally
      Res.Status(200);
      freeAndNil(LdmNotificao);
    end;

  except on E: Exception do
    begin
      Log('Erro Notificação ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmNotificao);
    end;
  end;
end;

end.
