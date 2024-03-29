unit controllers.servico;

interface

uses Horse, System.JSON, model.servico, controller.log;

procedure Servico;
procedure PostServico(Req: THorseRequest; Res: THorseResponse);
procedure GetServico(Req: THorseRequest; Res: THorseResponse);
procedure GetObterServico(Req: THorseRequest; Res: THorseResponse);
procedure GetServicoUsuario(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils;

procedure Servico;
begin
  THorse.Post('cadastrar/servico', PostServico);
  THorse.Get('listar/servico', GetServico);
  THorse.Get('listar/servico/:cod', GetObterServico);
  THorse.Get('listar/servico/usuario/:cod', GetServicoUsuario);
end;

procedure PostServico(Req: THorseRequest; Res: THorseResponse);
var
  LdmServico: TDmServico;
begin
  try
    Log('Inserindo Servico');
    LdmServico := TDmServico.Create(nil);
    try
      Res.Send<TJSONObject>(LdmServico.PostServico(req.Body<TJSONObject>));
    finally
      Res.Status(200);
      freeAndNil(LdmServico);
    end;

  except on E: Exception do
    begin
      Log('Erro Inserir Servico ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmServico);
    end;
  end;
end;

procedure GetServico(Req: THorseRequest; Res: THorseResponse);
var
  LdmServico: TDmServico;
begin
  try
    Log('Listando servico');
    LdmServico := TDmServico.Create(nil);
    try
      if req.Headers.ContainsKey('categoria') then
        Res.Send<TJSONArray>(
          LdmServico.GetServicoCategoria(req.Headers.Items['categoria'].ToInteger))
      else
      Res.Send<TJSONArray>(LdmServico.GetServico);
    finally
      Res.Status(200);
      freeAndNil(LdmServico);
    end;

  except on E: Exception do
    begin
      Log('Erro Servico ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmServico);
    end;
  end;
end;

procedure GetObterServico(Req: THorseRequest; Res: THorseResponse);
var
  LdmServico: TDmServico;
begin
  try
    Log('Obtendo Servico');
    LdmServico := TDmServico.Create(nil);
    try
      Res.Send<TJSONObject>(LdmServico.GetServico(req.Params.Items['cod'].ToInteger));
    finally
      Res.Status(200);
      freeAndNil(LdmServico);
    end;

  except on E: Exception do
    begin
      Log('Erro Servico ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmServico);
    end;
  end;
end;

procedure GetServicoUsuario(Req: THorseRequest; Res: THorseResponse);
var
  LdmServico: TDmServico;
begin
  try
    Log('Listando Servico por usuario');
    LdmServico := TDmServico.Create(nil);
    try
      Res.Send<TJSONArray>(LdmServico.GetServicoUsuario(req.Params.Items['cod'].ToInteger));
    finally
      Res.Status(200);
      freeAndNil(LdmServico);
    end;

  except on E: Exception do
    begin
      Log('Erro Servico ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmServico);
    end;
  end;
end;


end.
