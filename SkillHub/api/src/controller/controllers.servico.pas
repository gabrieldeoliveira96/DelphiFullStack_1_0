unit controllers.servico;

interface

uses Horse, System.JSON, model.servico, controller.log;

procedure Servico;
procedure PutServico(Req: THorseRequest; Res: THorseResponse);
procedure PostServico(Req: THorseRequest; Res: THorseResponse);
procedure GetServico(Req: THorseRequest; Res: THorseResponse);
procedure GetObterServico(Req: THorseRequest; Res: THorseResponse);
procedure GetServicoUsuario(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils, StrUtils;

procedure Servico;
begin
  THorse.Put('favoritar/servico', PutServico);
  THorse.Post('cadastrar/servico', PostServico);
  THorse.Get('listar/servico', GetServico);
  THorse.Get('listar/servico/:cod', GetObterServico);
  THorse.Get('listar/servico/usuario/:cod', GetServicoUsuario);
end;

procedure PutServico(Req: THorseRequest; Res: THorseResponse);
begin
  var LdmServico := TDmServico.Create(nil);
  try
    Log('Atualizando favorito');
    try
      Res.Send<TJSONObject>(LdmServico.PutFavoritarServico(req.Body<TJSONObject>));
    finally
      Res.Status(200);
      freeAndNil(LdmServico);
    end;

  except on E: Exception do
    begin
      Log('Erro atualizar favorito ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmServico);
    end;
  end;
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
      var parametro :='';

      if req.Headers.ContainsKey('categoria') then
         parametro := 'categoria';
      if req.Headers.ContainsKey('profissao') then
         parametro := 'profissao';
      if req.Headers.ContainsKey('descricaoServico') then
         parametro := 'descricaoServico';
      if req.Headers.ContainsKey('subcategoria') then
         parametro := 'subcategoria';
      if req.Headers.ContainsKey('codUsuarioFavoritos') then
         parametro := 'codUsuarioFavoritos';

      Case AnsiIndexStr(parametro , ['categoria', 'profissao', 'descricaoServico','subcategoria','codUsuarioFavoritos']) of
        0: Res.Send<TJSONArray>(LdmServico.GetServicoCategoria(req.Headers.Items[parametro].ToInteger));
        1: Res.Send<TJSONArray>(LdmServico.GetServicoProfissao(req.Headers.Items[parametro].ToInteger));
        2: Res.Send<TJSONArray>(LdmServico.GetServico(req.Headers.Items[parametro]));
        3: Res.Send<TJSONArray>(LdmServico.GetServicoSubCategoria(req.Headers.Items[parametro].ToInteger));
        4: Res.Send<TJSONArray>(LdmServico.GetServicosFavoritados(req.Headers.Items[parametro].ToInteger));
        else
          Res.Send<TJSONArray>(LdmServico.GetServico);
      End;


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
