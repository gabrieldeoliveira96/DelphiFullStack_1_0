unit view.principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, uGosBase, uGosEdit, System.Skia, FMX.Skia, uGosObjects, FMX.Ani,
  frame.Servico, ksTabControl, frame.solicitacao, uGosStandard;

type
  TfrmPrincipal = class(TForm)
    recBody: TRectangle;
    layoutTopo: TLayout;
    GosEditView1: TGosEditView;
    SkSvg1: TSkSvg;
    Layout2: TLayout;
    btnUsuario: TSkSvg;
    layoutCategoria: TLayout;
    HorzScrollBox1: THorzScrollBox;
    lblReformasReparos: TSkLabel;
    imgReformasReparos: TSkSvg;
    btnReformaseReparos: TGosRectangle;
    btnServicosDomesticos: TGosRectangle;
    lblServicoDomestico: TSkLabel;
    imgServicoDomestico: TSkSvg;
    btnDesignETecnoligia: TGosRectangle;
    SkLabel3: TSkLabel;
    SkSvg5: TSkSvg;
    btnAssistencia: TGosRectangle;
    SkLabel4: TSkLabel;
    SkSvg6: TSkSvg;
    btnVeiculo: TGosRectangle;
    SkLabel5: TSkLabel;
    SkSvg7: TSkSvg;
    btnConsultoria: TGosRectangle;
    SkLabel6: TSkLabel;
    SkSvg8: TSkSvg;
    SkLabel7: TSkLabel;
    CalloutRectangle1: TCalloutRectangle;
    LayoutSolicitar: TLayout;
    Rectangle5: TRectangle;
    CalloutRectangle2: TCalloutRectangle;
    CalloutRectangle3: TCalloutRectangle;
    SkLabel8: TSkLabel;
    Layout1: TLayout;
    SkLabel9: TSkLabel;
    recAnimacaoServicosInesistentes: TRectangle;
    floatAnimacaoServicoInesistente: TFloatAnimation;
    floatOpacidadeServicoInesistente: TFloatAnimation;
    floatAnimacaoLosango: TFloatAnimation;
    layoutProfissoes: TLayout;
    HorzScrollBox2: THorzScrollBox;
    GosRectangle1: TGosRectangle;
    SkLabel10: TSkLabel;
    SkSvg9: TSkSvg;
    SkLabel16: TSkLabel;
    btnCarpinteiro: TLayout;
    btnPedreiro: TLayout;
    GosRectangle2: TGosRectangle;
    imgPedreito: TSkSvg;
    lblPedreiro: TSkLabel;
    btnEletricista: TLayout;
    GosRectangle3: TGosRectangle;
    SkSvg11: TSkSvg;
    SkLabel12: TSkLabel;
    btnJardineiro: TLayout;
    GosRectangle4: TGosRectangle;
    SkSvg12: TSkSvg;
    SkLabel13: TSkLabel;
    btnMotorista: TLayout;
    GosRectangle5: TGosRectangle;
    SkSvg13: TSkSvg;
    SkLabel14: TSkLabel;
    btnMecanico: TLayout;
    GosRectangle6: TGosRectangle;
    SkSvg14: TSkSvg;
    SkLabel15: TSkLabel;
    scrolBody: TVertScrollBox;
    Rectangle1: TRectangle;
    frameServico1: TframeServico;
    tabControl: TksTabControl;
    tabInicio: TksTabItem;
    tabSolicitação: TksTabItem;
    recBodySolicitacao: TRectangle;
    VertScrollBox1: TVertScrollBox;
    FrameSolicitacao1: TFrameSolicitacao;
    FrameSolicitacao2: TFrameSolicitacao;
    FrameSolicitacao3: TFrameSolicitacao;
    FrameSolicitacao4: TFrameSolicitacao;
    FrameSolicitacao5: TFrameSolicitacao;
    tabColaborador: TksTabItem;
    recBodyColaborador: TRectangle;
    VertScrollBox2: TVertScrollBox;
    btnAnuncioServico: TGosButtonView;
    SkLabel1: TSkLabel;
    SkSvg2: TSkSvg;
    Layout3: TLayout;
    SkLabel2: TSkLabel;
    frameServico2: TframeServico;
    frameServico3: TframeServico;
    frameServico4: TframeServico;
    frameServico5: TframeServico;
    frameServico6: TframeServico;
    procedure Rectangle5Click(Sender: TObject);
    procedure floatAnimacaoServicoInesistenteFinish(Sender: TObject);
    procedure scrolBodyViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
    procedure btnUsuarioClick(Sender: TObject);
    procedure GosEditView1Click(Sender: TObject);
    procedure btnReformaseReparosClick(Sender: TObject);
    procedure btnServicosDomesticosClick(Sender: TObject);
    procedure btnPedreiroClick(Sender: TObject);
    procedure frameServico1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAnuncioServicoClick(Sender: TObject);
  private
    procedure AbrirAnimacaoServicoInesistente;
    procedure FecharAnimacaoServicoInesistente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses view.Servico.Inesistente, view.usuario, view.pesquisa.servico,
  view.filtro.categoria, view.pesquisa.profissoes, view.descricao.servico,
  view.anuncio.servico;

procedure TfrmPrincipal.floatAnimacaoServicoInesistenteFinish(Sender: TObject);
begin
  if floatAnimacaoServicoInesistente.Inverse then
    exit;

  if not Assigned(frmServicoInesistente) then
    Application.CreateForm(TfrmServicoInesistente, frmServicoInesistente);
  frmServicoInesistente.ShowModal(
  procedure(ModalResult:TModalResult)
  begin

    FecharAnimacaoServicoInesistente;

  end);

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tabcontrol.TabIndex:= 0;
end;

procedure TfrmPrincipal.frameServico1Click(Sender: TObject);
begin
  if not Assigned(frmDescricaoServico) then
    Application.CreateForm(TfrmDescricaoServico, frmDescricaoServico);

  frmDescricaoServico.Show;

end;

procedure TfrmPrincipal.GosEditView1Click(Sender: TObject);
begin
  //Mensagem de Aguarde
  //Thread

  //Syncronize
  if not Assigned(frmPesquisaServico) then
    Application.CreateForm(TfrmPesquisaServico, frmPesquisaServico);

  //fora do syncronize
  frmPesquisaServico.CarregaTela;

  //Syncronize
  frmPesquisaServico.Show;

end;

procedure TfrmPrincipal.Rectangle5Click(Sender: TObject);
begin
  AbrirAnimacaoServicoInesistente;
end;

procedure TfrmPrincipal.scrolBodyViewportPositionChange(Sender: TObject;
  const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
begin
  if scrolBody.Margins.Top < layoutTopo.Height then
    scrolBody.Margins.Top:= -NewViewportPosition.Y

end;

procedure TfrmPrincipal.AbrirAnimacaoServicoInesistente;
begin
  recAnimacaoServicosInesistentes.Visible:= true;

  floatAnimacaoServicoInesistente.Inverse:= false;
  floatAnimacaoServicoInesistente.StartValue:= 0;
  floatAnimacaoServicoInesistente.StopValue:= self.Height*2;
  floatAnimacaoServicoInesistente.Start;

  floatOpacidadeServicoInesistente.Inverse:= false;
  floatOpacidadeServicoInesistente.StartValue:= 1;
  floatOpacidadeServicoInesistente.StopValue:= 0;
  floatOpacidadeServicoInesistente.Start;

  floatAnimacaoLosango.Inverse:= false;
  floatAnimacaoLosango.StartValue:= 200;
  floatAnimacaoLosango.StopValue:= -50;
  floatAnimacaoLosango.Start;

end;


procedure TfrmPrincipal.btnAnuncioServicoClick(Sender: TObject);
begin
  if not Assigned(frmAnuncioServico) then
    Application.CreateForm(TfrmAnuncioServico, frmAnuncioServico);

  frmAnuncioServico.Show;


end;

procedure TfrmPrincipal.btnPedreiroClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaProfissoes) then
    Application.CreateForm(TfrmPesquisaProfissoes, frmPesquisaProfissoes);

  frmPesquisaProfissoes.CarregaTela(imgPedreito.Svg.Source, lblPedreiro.Text);

  frmPesquisaProfissoes.Show;

end;

procedure TfrmPrincipal.btnReformaseReparosClick(Sender: TObject);
begin
  if not Assigned(frmFiltroCategoria) then
    Application.CreateForm(TfrmFiltroCategoria, frmFiltroCategoria);

  frmFiltroCategoria.CarregaTela(TTipoFiltro.ReformasEReparos, imgReformasReparos.Svg.Source, lblReformasReparos.Text);
  frmFiltroCategoria.Show;

end;

procedure TfrmPrincipal.btnServicosDomesticosClick(Sender: TObject);
begin
  if not Assigned(frmFiltroCategoria) then
    Application.CreateForm(TfrmFiltroCategoria, frmFiltroCategoria);

  frmFiltroCategoria.CarregaTela(TTipoFiltro.ReformasEReparos, imgServicoDomestico.Svg.Source, lblServicoDomestico.Text);
  frmFiltroCategoria.Show;


end;

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin

  if not Assigned(frmUsuario) then
    Application.CreateForm(TfrmUsuario, frmUsuario);
  frmUsuario.Show;

end;

procedure TfrmPrincipal.FecharAnimacaoServicoInesistente;
begin
  floatAnimacaoServicoInesistente.Inverse:= true;
  floatAnimacaoServicoInesistente.Start;

  floatOpacidadeServicoInesistente.Inverse:= true;
  floatOpacidadeServicoInesistente.Start;

  floatAnimacaoLosango.Inverse:= true;
  floatAnimacaoLosango.Start;

end;


end.
