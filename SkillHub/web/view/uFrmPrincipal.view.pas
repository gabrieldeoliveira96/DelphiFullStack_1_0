unit uFrmPrincipal.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMain.view, uniLabel,  uPrincipal.Controller,  uImagens.Model, uImagem.Servicos.Model,
  Vcl.Imaging.pngimage, uniImage, uniGUIBaseClasses, uniGUIClasses, uniPanel,
  uniScrollBox, uniButton, uniBitBtn, UniFSButton, uniEdit, UniFSEdit,
  uniGUITypes, uniThreadTimer, uniScreenMask, uniTimer, uniFileUpload;

type
  TFrPrincipal = class(TMainForm)
    pnlTop: TUniPanel;
    lblNotificacao: TUniLabel;
    UniImage1: TUniImage;
    btnCategoria: TUniFSButton;
    pnlCategoria: TUniPanel;
    sbCategoria: TUniScrollBox;
    pnlPesquisa: TUniPanel;
    edtPesqServicos: TUniFSEdit;
    UniImage2: TUniImage;
    pnlProfissoes: TUniPanel;
    UniLabel5: TUniLabel;
    sbProfissoes: TUniScrollBox;
    pnlBottom: TUniPanel;
    sbCardsServicos: TUniScrollBox;
    UniLabel4: TUniLabel;
    UniPanel1: TUniPanel;
    pnlQtdNotific: TUniPanel;
    lbldivNotifi: TUniLabel;
    lblQtdNotific: TUniLabel;
    UniTimer1: TUniTimer;
    lblCadServico: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure AbrirPesquisa(sender: TObject);
    procedure edtPesqServicosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AbrirServico(Sender: TObject);
    procedure UniImage1Click(Sender: TObject);
    procedure lblNotificacaoClick(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure lblCadServicoClick(Sender: TObject);
  private
   const
    TopCategoria  = 180;
    TopPesquisa   = 435;
    TopProfissoes = 506;
    TopBottom     = 800;
    procedure AjustaLatoutNotificacoes;

   var
    FModelImagens : TImagensWSModel;
    FModelServicos: TImagemServicoModel;
    FController: TControllerPrincipal;
    procedure CarregarServicos(AKey:string =''; AValue:String = '');
    procedure CarregarCategorias;
    procedure CarregarProfissoes;
    procedure AjustaPnlPesquisa;
    procedure LimparServicos;

  public
    { Public declarations }
  end;

var
  FrPrincipal: TFrPrincipal;

implementation

{$R *.dfm}

uses uConstsHTML, strUtils, Soap.EncdDecd, IdCoder, IdCoderMIME;

procedure TFrPrincipal.btnCategoriaClick(Sender: TObject);
begin
  pnlCategoria.Collapsed := not pnlCategoria.Collapsed;

  if pnlCategoria.Collapsed then
  begin
    pnlPesquisa.Top   := TopCategoria;
    pnlProfissoes.Top := TopPesquisa   - 200;
    pnlBottom.Top     := TopProfissoes - 15;
  end else
  begin
    pnlPesquisa.Top   := TopPesquisa;
    pnlProfissoes.Top := TopProfissoes;
    pnlBottom.Top     := TopBottom;
  end;
end;

procedure TFrPrincipal.UniFormCreate(Sender: TObject);
begin
  inherited;
    pnlMain.Width  := screen.Width;
    FController := TControllerPrincipal.Create;
end;

procedure TFrPrincipal.UniFormDestroy(Sender: TObject);
begin
  FreeAndNil(FModelImagens);
  FreeAndNil(FModelServicos);
  FreeAndNil(FController);
  inherited;
end;

procedure TFrPrincipal.CarregarServicos(AKey:string =''; AValue:String = '');
begin
 FModelServicos := FController.getListaServicos(AKey,AValue);

 const inicialLeft =15;

 var posLeft : integer := inicialLeft;
 var leftAtual: integer := 0;

 var posTop  : integer := 0;
 var TopAtual: integer := 0;
 var count:integer :=  0;

 for var I: integer := 0 to FModelServicos.Items.Count-1 do
 begin
   if FModelServicos.Items[i].Foto.IsEmpty then
     Continue;

   var pnl: TUniPanel := TUniPanel.Create(sbCardsServicos);
     pnl.Parent := sbCardsServicos;
     pnl.Height := 300;
     pnl.Width  := 300;
     pnl.ScreenMask.WaitData := true;
     pnl.ScreenMask.Enabled := true;
     pnl.ScreenMask.ShowMessage := false;
     pnl.ScreenMask.Color := $00DA6777;

     if i > 0 then
        posLeft := leftAtual + pnl.Width + 100;

     if count = 3 then
     begin
       count := 0;
       posTop :=  pnl.Height + TopAtual + 50;
       posLeft := inicialLeft;
     end;

     topAtual  :=  posTop;
     leftAtual :=  posLeft;
     pnl.Left := posLeft;
     pnl.Top  := posTop;
     pnl.Color := $00FFEEF0;
     pnl.ShowCaption := false;
     pnl.BorderStyle := ubsNone;
     pnl.Font.Name := TFontName('Roboto');
     pnl.Name := 'pnl_Servico_'+FModelServicos.Items[i].Cod.ToString+'_index_'+i.tostring;
     inc(count);
     pnl.OnClick:= AbrirServico;

   var imgHTML: TUniLabel := TUniLabel.Create(pnl);
      imgHTML.Parent := pnl;
      imgHTML.Top  := 18;
      imgHTML.Left := 25;
      imgHTML.Cursor := crHandPoint;
      imgHTML.TextConversion := txtHTML;

      imgHTML.Text :=  ImgServicos
                            .Replace('[base64foto]', FModelServicos.Items[i].foto)
                            .Replace('[nome]', FModelServicos.Items[i].Descricao);
      imgHTML.SendToBack;

   var DivPanelKM: TUniLabel := TUniLabel.Create(pnl);
      DivPanelKM.Parent := pnl;
      DivPanelKM.Top  := 30;
      DivPanelKM.Left := 30;
      DivPanelKM.Cursor := crHandPoint;
      DivPanelKM.TextConversion := txtHTML;
      DivPanelKM.Text := DivHtmlPadraoComValor
                              .Replace('[wdt]','50')
                              .Replace('[hgh]','40')
                              .Replace('[valor]','<br> &nbsp&nbsp&nbsp'+ FModelServicos.Items[i].Km.ToString + ' KM');
      DivPanelKM.BringToFront;

    var DivPanelDescricao: TUniLabel := TUniLabel.Create(pnl);
      DivPanelDescricao.Parent := pnl;
      DivPanelDescricao.Top  := 200;
      DivPanelDescricao.Left := 1;
      DivPanelDescricao.Cursor := crHandPoint;
      DivPanelDescricao.TextConversion := txtHTML;
      DivPanelDescricao.Text := DivHtmlPadrao
                                   .Replace('[wdt]',(pnl.Width-5).ToString)
                                   .Replace('[hgh]',(pnl.Height-220).ToString);
      DivPanelDescricao.BringToFront;


   var lblDescricao: TUniLabel := TUniLabel.Create(pnl);
      lblDescricao.Parent := pnl;
      lblDescricao.Top  := 215;
      lblDescricao.Left := 12;
      lblDescricao.Text := FModelServicos.Items[i].Descricao;
      lblDescricao.Font.Height := 14;
      lblDescricao.Font.Style := [fsBold];
      lblDescricao.BringToFront;

   var lblNome: TUniLabel := TUniLabel.Create(pnl);
      lblNome.Parent := pnl;
      lblNome.Top  := 245;
      lblNome.Left := 12;
      lblNome.Text := FModelServicos.Items[i].Nome;
      lblNome.Font.Color := clGray;
      lblNome.Font.Height := 14;
      lblNome.Font.Style := [fsBold];
      lblNome.BringToFront;

    var imgCheck: TUniLabel := TUniLabel.Create(pnl);
      imgCheck.Parent := pnl;
      imgCheck.Top  := 230;
      imgCheck.Left := 250;
      imgCheck.TextConversion := txtHTML;
      imgCheck.Text := getSvgCheck;
 end;
end;

procedure TFrPrincipal.AbrirServico(Sender: TObject);
begin
  var index: string := TUniPanel(Sender).Name;
  index := copy(index, pos('index_',index)+6);

  FController.getTelaContrataServico(self, FModelServicos.Items[index.ToInteger]);
end;

procedure TFrPrincipal.CarregarCategorias;
begin
 FModelImagens := FController.getListaCategorias;

 const inicialLeft =15;

 var posLeft : integer := inicialLeft;
 var leftAtual: integer := 0;

 var posTop  : integer := 0;
 var TopAtual: integer := 0;
 var count:integer :=  0;

 for var I: integer := 0 to FModelImagens.Items.Count-1 do
 begin
   var pnl: TUniPanel := TUniPanel.Create(sbCategoria);
     pnl.Parent := sbCategoria;
     pnl.Height := 110;
     pnl.Width  := 230;
     pnl.OnClick := AbrirPesquisa;

     if i > 0 then
        posLeft := leftAtual + pnl.Width + 30;

     if count = 3 then
     begin
       count := 0;
       posTop :=  pnl.Height + TopAtual + 10;
       posLeft := inicialLeft;
     end;

     topAtual  :=  posTop;
     leftAtual :=  posLeft;
     pnl.Left := posLeft;
     pnl.Top  := posTop;
     pnl.Color := $00FFEEF0;
     pnl.ShowCaption := false;
     pnl.BorderStyle := ubsNone;
     pnl.Name := 'pnl_categoria_'+FModelImagens.Items[i].Cod.ToString;
     pnl.ScreenMask.WaitData := true;
     pnl.ScreenMask.Enabled := true;
     pnl.ScreenMask.ShowMessage := false;
     pnl.ScreenMask.Color := $00DA6777;
     inc(count);

   var DivPanel: TUniLabel := TUniLabel.Create(pnl);
      DivPanel.Parent := pnl;
      DivPanel.Top  := 1;
      DivPanel.Left := 1;
      DivPanel.Cursor := crHandPoint;
      DivPanel.TextConversion := txtHTML;
      DivPanel.Text := DivHtmlCategoria
                              .Replace('[wdt]',(pnl.Width-5).ToString)
                              .Replace('[hgh]',(pnl.Height-15).ToString);
      DivPanel.SendToBack;

   var lbl: TUniLabel := TUniLabel.Create(pnl);
      lbl.Parent := pnl;
      lbl.Top  := 38;
      lbl.Left := 90;
      lbl.Text := FModelImagens.Items[i].Descricao;
      lbl.Font.Color := clWhite;
      lbl.Font.Height := 14;
      lbl.Font.Style := [fsBold];
      lbl.BringToFront;

   if not FModelImagens.Items[i].Figurinha.IsEmpty then
   begin
      var imgHTML: TUniLabel := TUniLabel.Create(pnl);
      imgHTML.Parent := pnl;
      imgHTML.Top  := 18;
      imgHTML.Left := 25;
      imgHTML.Cursor := crHandPoint;
      imgHTML.TextConversion := txtHTML;

     var dStr : string := DecodeString(FModelImagens.Items[i].Figurinha);

     if not dStr.Contains('fill="') then  // caso não venha com uma cor definida
      dStr := dStr
         .Replace('<svg','<svg fill="#ffffff" ');

     imgHTML.Text :=  dStr
                        .Replace('800px','50px') // Tamanho
                        .Replace('#000000', '#ffffff' )  //cor
                        .Replace('.linesandangles_een{fill:#111918;}',''); // Cor

   end;
 end;
end;

procedure TFrPrincipal.CarregarProfissoes;
begin
 FModelImagens:= FController.getListaProfissoes;

 const inicialLeft =15;

 var posLeft : integer := inicialLeft;
 var leftAtual: integer := 0;

 var posTop  : integer := 0;
 var TopAtual: integer := 0;
 var count:integer :=  0;

 for var I: integer := 0 to FModelImagens.Items.Count-1 do
 begin
  if FModelImagens.Items[i].Figurinha.IsEmpty then
     Continue;

   var pnl: TUniPanel := TUniPanel.Create(sbProfissoes);
     pnl.Parent := sbProfissoes;
     pnl.Height := 150;
     pnl.Width  := 160;
     pnl.OnClick := AbrirPesquisa;
     pnl.ScreenMask.WaitData := true;
     pnl.ScreenMask.Enabled := true;
     pnl.ScreenMask.ShowMessage := false;
     pnl.ScreenMask.Color := $00DA6777;

     if i > 0 then
        posLeft := leftAtual + pnl.Width + 2;

     topAtual  :=  posTop;
     leftAtual :=  posLeft;
     pnl.Left := posLeft;
     pnl.Top  := posTop;
     pnl.Color := $00FFEEF0;
     pnl.ShowCaption := false;
     pnl.BorderStyle := ubsNone;
     pnl.Name := 'pnl_profissao_'+FModelImagens.Items[i].Cod.ToString;
     inc(count);

   var DivPanel: TUniLabel := TUniLabel.Create(pnl);
      DivPanel.Parent := pnl;
      DivPanel.Top  := 1;
      DivPanel.Left := 1;
      DivPanel.Cursor := crHandPoint;
      DivPanel.TextConversion := txtHTML;
      DivPanel.Text := DivHtmlPadrao
                              .Replace('[wdt]',(pnl.Width-60).ToString)
                              .Replace('[hgh]',(pnl.Height-60).ToString);
      DivPanel.SendToBack;

   var lbl: TUniLabel := TUniLabel.Create(pnl);
      lbl.Parent := pnl;
      lbl.Top  := 100;
      lbl.Left := 20;
      lbl.Text := FModelImagens.Items[i].Descricao;
      lbl.Alignment := taCenter;
      lbl.Font.Height := 14;
      lbl.Font.Style := [fsBold];
      lbl.BringToFront;



    var imgHTML: TUniLabel := TUniLabel.Create(pnl);
     imgHTML.Parent := pnl;
     imgHTML.Top  := 18;
     imgHTML.Left := 25;
     imgHTML.Cursor := crHandPoint;
     imgHTML.TextConversion := txtHTML;

    var dStr : string := DecodeString(FModelImagens.Items[i].Figurinha);
    imgHTML.Text :=  dStr
                       .Replace('800px','50px'); // Tamanho

 end;
end;

procedure TFrPrincipal.AbrirPesquisa(sender: TObject);
begin
  FController.getTelaPesquisa(self, sender as TComponent);
end;

procedure TFrPrincipal.AjustaPnlPesquisa;
begin
     UniLabel4.Text := DivHtmlPadrao.Replace('[wdt]',(screen.Width-100).ToString)
                                .Replace('[hgh]',(pnlPesquisa.Height-5).ToString);
end;

procedure TFrPrincipal.AjustaLatoutNotificacoes;
begin
  lbldivNotifi.text := DivHtmlPadraoComValor
                                       .Replace('[wdt]', (pnlQtdNotific.Width - 1).toString)
                                       .Replace('[hgh]',  (pnlQtdNotific.Height -1).toString)
                                       .Replace('[valor]','');
end;

procedure TFrPrincipal.UniFormShow(Sender: TObject);
begin
  lblCadServico.Visible := FController.getDadosUsuarioLogado.TipoUsuario = 'colaborador';
  AjustaLatoutNotificacoes;
  AjustaPnlPesquisa;
  CarregarCategorias;
  CarregarProfissoes;
  CarregarServicos('codUsuarioFavoritos', FController.getDadosUsuarioLogado.cod);
end;

procedure TFrPrincipal.UniImage1Click(Sender: TObject);
begin
  inherited;
  FController.getTelaMenuLateral(self);
end;

procedure TFrPrincipal.UniTimer1Timer(Sender: TObject);
begin
  inherited;
   var model := FController.getNotificacoes;
   try
     lblQtdNotific.text := Model.Items.Count.toString;
   finally
     Model.free;
   end;
end;

procedure TFrPrincipal.edtPesqServicosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
  begin
    LimparServicos;
    CarregarServicos('descricaoServico',edtPesqServicos.Text);
  end;

end;

procedure TFrPrincipal.lblCadServicoClick(Sender: TObject);
begin
  inherited;
  FController.getTelaCadastroServico(self);
end;

procedure TFrPrincipal.lblNotificacaoClick(Sender: TObject);
begin
  inherited;
  FController.getTelaNotificacoes(self);
end;

procedure TFrPrincipal.LimparServicos;
begin
   while sbCardsServicos.ComponentCount > 0 do
     FreeAndNil(sbCardsServicos.Components[0]);
end;

end.

