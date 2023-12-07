unit controllers.subcategoria;
interface

uses Horse, System.JSON, model.subcategoria, controller.log;

procedure SubCategoria;
procedure GetSubCategoria(Req: THorseRequest; Res: THorseResponse);
procedure GetObterSubCategoria(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils;

procedure SubCategoria;
begin
  THorse.Get('listar/subcategoria', GetSubCategoria);
  THorse.Get('listar/subcategoria/:cod', GetObterSubCategoria);
end;

procedure GetSubCategoria(Req: THorseRequest; Res: THorseResponse);
var
  LDmsubCategoria: TDmSubCategoria;
begin
  try
    Log('Listando SubCategoria');
    LDmsubCategoria := TDmSubCategoria.Create(nil);
    try
      Res.Send<TJSONArray>(LDmsubCategoria.GetSubCategoria);
    finally
      Res.Status(200);
      freeAndNil(LDmsubCategoria);
    end;

  except on E: Exception do
    begin
      Log('Erro SubCategoria ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LDmsubCategoria);
    end;
  end;
end;

procedure GetObterSubCategoria(Req: THorseRequest; Res: THorseResponse);
var
  LDmsubCategoria: TDmSubCategoria;
begin
  try
    Log('Obtendo SubCategoria');
    LDmsubCategoria := TDmSubCategoria.Create(nil);
    try
      Res.Send<TJSONArray>(LDmsubCategoria.GetObterSubCategoria(req.Params.Items['cod'].ToInteger));
    finally
      Res.Status(200);
      freeAndNil(LDmsubCategoria);
    end;

  except on E: Exception do
    begin
      Log('Erro SubCategoria ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LDmsubCategoria);
    end;
  end;
end;

end.
