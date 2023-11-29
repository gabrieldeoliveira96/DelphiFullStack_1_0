program SkillHub;

uses
  System.StartUpCopy,
  FMX.Forms,
  Project.Startup in 'features\Project.Startup.pas',
  FMX.Skia,
  view.login in 'view\view.login.pas' {frmLogin},
  view.splash in 'view\view.splash.pas' {frmSplash},
  view.principal in 'view\view.principal.pas' {frmPrincipal},
  view.servico.inesistente in 'view\view.servico.inesistente.pas' {frmServicoInesistente},
  frame.servico in 'frame\frame.servico.pas' {frameServico: TFrame},
  view.usuario in 'view\view.usuario.pas' {frmUsuario},
  view.notificacao in 'view\view.notificacao.pas' {frmNotificacao},
  frame.notificacao in 'frame\frame.notificacao.pas' {FrameNotificacao: TFrame},
  view.dados.usuario in 'view\view.dados.usuario.pas' {frmDadosdoUsuario},
  view.pesquisa.servico in 'view\view.pesquisa.servico.pas' {frmPesquisaServico},
  view.filtro.categoria in 'view\view.filtro.categoria.pas' {frmFiltroCategoria},
  view.pesquisa.profissoes in 'view\view.pesquisa.profissoes.pas' {frmPesquisaProfissoes},
  view.descricao.servico in 'view\view.descricao.servico.pas' {frmDescricaoServico},
  frame.solicitacao in 'frame\frame.solicitacao.pas' {FrameSolicitacao: TFrame},
  view.anuncio.servico in 'view\view.anuncio.servico.pas' {frmAnuncioServico};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmPesquisaServico, frmPesquisaServico);
  Application.CreateForm(TfrmFiltroCategoria, frmFiltroCategoria);
  Application.CreateForm(TfrmPesquisaProfissoes, frmPesquisaProfissoes);
  Application.CreateForm(TfrmDescricaoServico, frmDescricaoServico);
  Application.CreateForm(TfrmAnuncioServico, frmAnuncioServico);
  Application.Run;
end.
