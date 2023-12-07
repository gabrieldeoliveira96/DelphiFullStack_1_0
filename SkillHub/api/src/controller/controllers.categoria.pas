unit controllers.categoria;

interface

uses Horse, System.JSON, model.categoria, controller.log;

procedure Categoria;
procedure GetCategoria(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils;

procedure Categoria;
begin
  THorse.Get('listar/categoria', GetCategoria);
end;

procedure GetCategoria(Req: THorseRequest; Res: THorseResponse);
var
  LDmCategoria: TDmCategoria;
begin
  try
    Log('Listando categoria');
    LDmCategoria := TDmCategoria.Create(nil);
    try
      Res.Send<TJSONArray>(LDmCategoria.GetCategoria);
    finally
      Res.Status(200);
      freeAndNil(LDmCategoria);
    end;

  except on E: Exception do
    begin
      Log('Erro Categoria ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LDmCategoria);
    end;
  end;
end;

end.
