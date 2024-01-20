unit view.principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, uGosBase, uGosEdit, System.Skia, FMX.Skia, uGosObjects, FMX.Ani,
  frame.Servico, ksTabControl, frame.solicitacao, uGosStandard, System.JSON, System.NetEncoding,
  DataSet.Serialize, System.Generics.Collections, frame.categoria;

type
  TfrmPrincipal = class(TForm)
    recBody: TRectangle;
    layoutTopo: TLayout;
    GosEditView1: TGosEditView;
    SkSvg1: TSkSvg;
    Layout2: TLayout;
    btnUsuario: TSkSvg;
    layoutCategoria: TLayout;
    horizontalCategoria: THorzScrollBox;
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
    horizontalProfissao: THorzScrollBox;
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
    procedure btnPedreiroClick(Sender: TObject);
    procedure frameServico1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAnuncioServicoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FListCategoria:TObjectList<TframeCategoria>;
    procedure AbrirAnimacaoServicoInesistente;
    procedure FecharAnimacaoServicoInesistente;

    procedure CarregaCategoria;
    procedure CarregaProfissao;
    procedure CarregaServico;
    {$IFDEF MSWINDOWS}
    procedure AbrirCategoria(Sender: TObject);
    {$ELSE}
    procedure AbrirCategoria(Sender: TObject; const Point: TPointF);
    {$ENDIF}
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses view.Servico.Inesistente, view.usuario, view.pesquisa.servico,
  view.filtro.categoria, view.pesquisa.profissoes, view.descricao.servico,
  view.anuncio.servico, uConnection, uLoading, uFancyDialog, uUrl,
  frame.profissao, controller.imagens, model.servico;

procedure TfrmPrincipal.floatAnimacaoServicoInesistenteFinish(Sender: TObject);
var
 LListCategoria:TObjectList<TframeCategoria>;
 LframeCategoria:TframeCategoria;
begin

  if floatAnimacaoServicoInesistente.Inverse then
    exit;

  if not Assigned(frmServicoInesistente) then
    Application.CreateForm(TfrmServicoInesistente, frmServicoInesistente);

  LListCategoria:= TObjectList<TframeCategoria>.Create;

  for var LFrame in FListCategoria do
  begin
    LframeCategoria:= TframeCategoria.Create(nil);
    LframeCategoria.Clone(LFrame);

    LListCategoria.Add(LframeCategoria);
  end;


  frmServicoInesistente.CarregaTela(LListCategoria);

  frmServicoInesistente.ShowModal(
  procedure(ModalResult:TModalResult)
  begin

    FecharAnimacaoServicoInesistente;

  end);

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tabcontrol.TabIndex:= 0;
  FListCategoria:= TObjectList<TframeCategoria>.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListCategoria);
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

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin

  if not Assigned(frmUsuario) then
    Application.CreateForm(TfrmUsuario, frmUsuario);
  frmUsuario.Show;

end;

procedure TfrmPrincipal.CarregaTela;
begin

  CarregaCategoria;

  CarregaProfissao;

  CarregaServico;
end;

procedure TfrmPrincipal.CarregaCategoria;

var
 LCon:TConnection;
 LResult:string;
 LJa:TJSONArray;
 LFrame:TframeCategoria;
begin

  try
    LCon:= TConnection.Create;
    if not LCon.Get(UrlListaCategoria,[],LResult) then
      exit;

    LJa:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;

    TThread.Synchronize(nil,
    procedure
    begin
      horizontalCategoria.BeginUpdate;
    end);

    for var Ljv in LJa do
    begin

      LFrame:= TframeCategoria.Create(self);
      LFrame.Align:= TAlignLayout.Left;
      LFrame.Name:= 'Frame_'+ Ljv.GetValue<string>('cod')+FormatDateTime('hhmmsszzz',now);

      LFrame.lbl.Text:= Ljv.GetValue<string>('descricao');
      LFrame.img.Svg.Source:= TNetEncoding.Base64.Decode(Ljv.GetValue<string>('figurinha'));

      LFrame.Tag:= Ljv.GetValue<integer>('cod');

      {$IFDEF MSWINDOWS}
      LFrame.OnClick:= AbrirCategoria;
      {$ELSE}
      LFrame.OnTap:= AbrirCategoria;
      {$ENDIF}

      horizontalCategoria.AddObject(LFrame);

      FListCategoria.Add(Lframe);

    end;

    TThread.Synchronize(nil,
    procedure
    begin
      horizontalCategoria.EndUpdate;
    end);



  finally
    FreeAndNil(LCon);
  end;
end;

procedure TfrmPrincipal.CarregaProfissao;
var
 LCon:TConnection;
 LResult:string;
 LJa:TJSONArray;
 LFrame:TframeProfissao;
begin

  try
    LCon:= TConnection.Create;
    if not LCon.Get(UrlListaProfissao,[],LResult) then
      exit;

    LJa:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;

    TThread.Synchronize(nil,
    procedure
    begin
      horizontalProfissao.BeginUpdate;
    end);

    for var Ljv in LJa do
    begin

      LFrame:= TframeProfissao.Create(self);
      LFrame.Align:= TAlignLayout.Left;
      LFrame.Name:= 'Frame_'+ Ljv.GetValue<string>('cod')+FormatDateTime('hhmmsszzz',now);

      LFrame.lbl.Text:= Ljv.GetValue<string>('descricao');
      LFrame.img.Svg.Source:= TNetEncoding.Base64.Decode(Ljv.GetValue<string>('figurinha'));

      horizontalProfissao.AddObject(LFrame);

    end;

    TThread.Synchronize(nil,
    procedure
    begin
      horizontalProfissao.EndUpdate;
    end);


  finally
    FreeAndNil(LCon);
  end;
end;

procedure TfrmPrincipal.CarregaServico;
var
 LCon:TConnection;
 LResult:string;
 LJa:TJSONArray;
 LJaMemtable:TJSONArray;
 LFrame:TframeServico;
 LBitmap:TBitmap;
begin

  try
    LCon:= TConnection.Create;
    if not LCon.Get(UrlListaServico,[],LResult) then
      exit;

    LJa:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;
    LJaMemtable:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;

    dmservico.memServico.LoadFromJSON(LJaMemtable);
    TThread.Synchronize(nil,
    procedure
    begin
      scrolBody.BeginUpdate;
    end);

    for var Ljv in LJa do
    begin

      LFrame:= TframeServico.Create(self);
      LFrame.Align:= TAlignLayout.Top;
      LFrame.Margins.Left:= 16;
      LFrame.Margins.Right:= 16;
      LFrame.Margins.Top:= 16;
      LFrame.Name:= 'Frame_'+ Ljv.GetValue<string>('cod')+FormatDateTime('hhmmsszzz',now);

      LFrame.lblTexto.Text:= Ljv.GetValue<string>('titulo');
      LFrame.lblkm.Text:= Ljv.GetValue<string>('km') + ' km';
      LFrame.Tag:= Ljv.GetValue<integer>('cod');

      LBitmap:= controller.imagens.BitmapFromBase64(Ljv.GetValue<string>('foto'));
      LFrame.recImg.Fill.Bitmap.Bitmap:= LBitmap;

      scrolBody.AddObject(LFrame);

    end;

    TThread.Synchronize(nil,
    procedure
    begin
      scrolBody.EndUpdate;
    end);


  finally
    FreeAndNil(LCon);
  end;
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


{$IFDEF MSWINDOWS}
procedure TfrmPrincipal.AbrirCategoria(Sender: TObject);
{$ELSE}
procedure TfrmPrincipal.AbrirCategoria(Sender: TObject; const Point: TPointF);
{$ENDIF}
var
 LFrame:TframeCategoria;
begin

  LFrame:= TframeCategoria(Sender);

  if not Assigned(frmFiltroCategoria) then
    Application.CreateForm(TfrmFiltroCategoria, frmFiltroCategoria);

  frmFiltroCategoria.CarregaTela(TTipoFiltro.ReformasEReparos,
    LFrame.img.Svg.Source, LFrame.lbl.Text, LFrame.Tag);
  frmFiltroCategoria.Show;

end;



end.
