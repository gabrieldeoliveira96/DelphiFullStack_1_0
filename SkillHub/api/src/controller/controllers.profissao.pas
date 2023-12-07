unit controllers.profissao;

interface

uses Horse, System.JSON, model.profissao, controller.log;

procedure Profissao;
procedure GetProfissao(Req: THorseRequest; Res: THorseResponse);

implementation

uses
  System.SysUtils;

procedure Profissao;
begin
  THorse.Get('listar/profissao', GetProfissao);
end;

procedure GetProfissao(Req: THorseRequest; Res: THorseResponse);
var
  LdmProfissao: TDmProfissao;
begin
  try
    Log('Listando Profissao');
    LdmProfissao := TDmProfissao.Create(nil);
    try
      Res.Send<TJSONArray>(LdmProfissao.GetProfissao);
    finally
      Res.Status(200);
      freeAndNil(LdmProfissao);
    end;

  except on E: Exception do
    begin
      Log('Erro Profissao ' + E.Message);
      Res.Send(e.Message).Status(400);
      freeAndNil(LdmProfissao);
    end;
  end;
end;

end.

