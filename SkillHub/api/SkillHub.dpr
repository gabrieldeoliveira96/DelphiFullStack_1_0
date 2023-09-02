program SkillHub;

{$APPTYPE CONSOLE}

{$R *.res}

uses Horse, Horse.Jhonson, System.JSON;

begin

  THorse.Use(Jhonson());

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    var
     LJson:TJSONObject;
    begin
      LJson:= TJSONObject.Create;
      LJson.AddPair('resposta','pong');
      Res.Send<TJSONObject>(LJson);
    end);

  THorse.Listen(9000);
end.
