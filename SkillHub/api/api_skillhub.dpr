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
  controllers.login in 'src\controller\controllers.login.pas',
  model.categoria in 'src\model\model.categoria.pas' {DmCategoria: TDataModule},
  controllers.categoria in 'src\controller\controllers.categoria.pas',
  model.profissao in 'src\model\model.profissao.pas' {DmProfissao: TDataModule},
  controllers.profissao in 'src\controller\controllers.profissao.pas',
  model.subcategoria in 'src\model\model.subcategoria.pas' {DmSubCategoria: TDataModule},
  controllers.subcategoria in 'src\controller\controllers.subcategoria.pas',
  model.servico in 'src\model\model.servico.pas' {DmServico: TDataModule},
  controllers.servico in 'src\controller\controllers.servico.pas',
  controller.log in 'src\controller\controller.log.pas',
  controllers.notificacao in 'src\controller\controllers.notificacao.pas',
  model.notificacao in 'src\model\model.notificacao.pas' {DmNotificacao: TDataModule},
  model.privacidade in 'src\model\model.privacidade.pas' {dmPrivacidade: TDataModule},
  controllers.privacidade in 'src\controller\controllers.privacidade.pas';

begin
  THorse.Use(Jhonson);
  controllers.usuario.Usuario;
  controllers.login.Login;
  controllers.categoria.Categoria;
  controllers.profissao.Profissao;
  controllers.subcategoria.SubCategoria;
  controllers.servico.Servico;
  controllers.notificacao.Notificacao;
  controllers.privacidade.privacidade;

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000);
end.
