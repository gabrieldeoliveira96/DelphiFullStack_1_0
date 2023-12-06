program api_skillhub;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  model.con in 'src\model\model.con.pas' {DmCon: TDataModule},
  model.usuario in 'src\model\model.usuario.pas' {DmUsuario: TDataModule},
  controllers.usuario in 'src\controller\controllers.usuario.pas',
  model.login in 'src\model\model.login.pas' {DmLogin: TDataModule},
  controllers.login in 'src\controller\controllers.login.pas';

begin
  THorse.Use(Jhonson);
  controllers.usuario.Usuario;
  controllers.login.Login;

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000);
end.
