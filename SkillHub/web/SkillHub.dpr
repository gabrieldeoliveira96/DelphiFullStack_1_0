program SkillHub;

uses
  Forms,
  ServerModule in 'server-config\ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  ulogin.Services in 'services\ulogin.Services.pas' {LoginServices: TUniGUIMainModule},
  uMain.view in 'view\uMain.view.pas' {MainForm: TUniForm},
  uConstsHtml in 'utils\uConstsHtml.pas',
  uFrLogin.view in 'view\uFrLogin.view.pas' {FrLogin: TUniFrame},
  uLogin.Controller in 'controller\uLogin.Controller.pas',
  uMain.Controller in 'controller\uMain.Controller.pas',
  uMain.Services in 'services\uMain.Services.pas' {MainServices: TDataModule},
  uLogin.Model in 'model\uLogin.Model.pas',
  uCadastroUsuarioLogin.View in 'view\uCadastroUsuarioLogin.View.pas' {FrCadUsuarioLogin: TUniFrame},
  uHelpersFrames in 'helpers\uHelpersFrames.pas',
  uFrmPrincipal.view in 'view\uFrmPrincipal.view.pas' {FrPrincipal: TUniForm},
  uImagens.Model in 'model\uImagens.Model.pas',
  uImagens.Services in 'services\uImagens.Services.pas' {ImagensServices: TDataModule},
  uPrincipal.Controller in 'controller\uPrincipal.Controller.pas',
  uImagem.Servicos.Model in 'model\uImagem.Servicos.Model.pas',
  uPesquisa.view in 'view\uPesquisa.view.pas' {frPesquisa: TUniForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := false;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
