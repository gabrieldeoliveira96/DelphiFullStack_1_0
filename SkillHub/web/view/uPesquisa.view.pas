unit uPesquisa.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  uImagem.Servicos.Model, uPrincipal.Controller,
  uMain.view, uniButton, uniBitBtn, UniFSButton, uniGUIClasses, uniEdit,
  UniFSEdit, uniLabel, Vcl.Imaging.pngimage, uniImage, uniPanel, Vcl.Controls,
  Vcl.Forms, uniGUIBaseClasses, uniScrollBox, Vcl.Dialogs, uniGUITypes,
  uniRadioButton;

type
  TfrPesquisa = class(TMainForm)
    pnlImage: TUniPanel;
    sbServicos: TUniScrollBox;
    pnlPesquisa: TUniPanel;
    lblDivPesquisa: TUniLabel;
    edtPesqServico: TUniFSEdit;
    UniImage2: TUniImage;
    UniFSButton1: TUniFSButton;
    PnlSubCategorias: TUniPanel;
    lblDivSubCategorias: TUniLabel;
    LblDescFiltroSubCategoria: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);
    procedure OnFilterServicoPorSubCategorias(Sender: TObject);
    procedure edtPesqServicoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbrirServico(Sender: TObject);
  private
    FModel: TImagemServicoModel;
    FController: TControllerPrincipal;
    procedure AjustaPnlPesquisa;
    procedure RenderizaPainelPesquisado;
    procedure CarregarServicos(AKey: String = ''; AValue: string = '');
    procedure getListaSubCategorias;
    procedure LimparServicos;
  public
    PanelAtualClicado: TUniPanel;
  end;

implementation

{$R *.dfm}

uses uConstsHTML,uSubCategorias.Model, uSubCategorias.Controller;

procedure TfrPesquisa.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FModel);
  FreeAndNil(FController);
end;

procedure TfrPesquisa.UniFormShow(Sender: TObject);
begin
  // inherited;
  FController := TControllerPrincipal.Create;
  CarregarServicos;
  RenderizaPainelPesquisado;
  AjustaPnlPesquisa;
  getListaSubCategorias;
end;

procedure TfrPesquisa.UniFSButton1Click(Sender: TObject);
begin
 // inherited;
 Close;
end;

procedure TfrPesquisa.edtPesqServicoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    LimparServicos;
    CarregarServicos('descricaoServico',edtPesqServico.Text);
  end;

end;

procedure TfrPesquisa.CarregarServicos(AKey: String = ''; AValue: string = '');
begin
  try
    var KeyHeader:  string;
    var KeyValue:   string;

    if  (AKey.Trim.IsEmpty or AValue.Trim.IsEmpty) then
    begin

     var lHeader:string := PanelAtualClicado.Name;
     lHeader := lHeader.Replace('pnl_', '');
     KeyHeader := Copy(lHeader,0, pos('_', lHeader) - 1);

     KeyValue := Copy(lHeader, pos('_', lHeader) + 1);
    end else
    begin
      KeyHeader := AKey;
      KeyValue := AValue;
    end;

    FModel := FController.getListaServicos(KeyHeader, KeyValue);
    try
      const
        inicialLeft = 15;

      var
        posTop: integer := 0;
      var
        TopAtual: integer := 0;
      var
        count: integer := 0;

      for var I := 0 to FModel.Items.count - 1 do
      begin
        if FModel.Items[I].Foto.IsEmpty then
          Continue;

        var
          pnl: TUniPanel := TUniPanel.Create(sbServicos);
        pnl.Parent := sbServicos;
        pnl.Height := 180;
        pnl.Width  := 650;
        pnl.OnClick := AbrirServico;
        pnl.ScreenMask.WaitData := true;
        pnl.ScreenMask.Enabled := true;
        pnl.ScreenMask.ShowMessage := false;
        pnl.ScreenMask.Color := $00DA6777;


        if count = 1 then
        begin
          count := 0;
          posTop := pnl.Height + TopAtual + 10;
        end;

        TopAtual := posTop;
        pnl.Left := inicialLeft;
        pnl.Top := posTop;
        pnl.Color := $00FFEEF0;
        pnl.ShowCaption := false;
        pnl.BorderStyle := ubsNone;
        pnl.Font.Name := TFontName('Roboto');
        pnl.Name := 'pnl_Servico_' + FModel.Items[I].Cod.ToString + '_index_'+i.tostring;
        inc(count);

        var
          imgHTML: TUniLabel := TUniLabel.Create(pnl);
        imgHTML.Parent := pnl;
        imgHTML.Top := 18;
        imgHTML.Left := 25;
        imgHTML.Cursor := crHandPoint;
        imgHTML.TextConversion := txtHTML;

        imgHTML.Text := ImgServicos.Replace('[base64foto]',
          FModel.Items[I].Foto).Replace('[nome]',
          FModel.Items[I].Descricao);
        imgHTML.SendToBack;

        var
          DivPanelDescricao: TUniLabel := TUniLabel.Create(pnl);
        DivPanelDescricao.Parent := pnl;
        DivPanelDescricao.Top := 15;
        DivPanelDescricao.Left := 260;
        DivPanelDescricao.Cursor := crHandPoint;
        DivPanelDescricao.TextConversion := txtHTML;
        DivPanelDescricao.Text := DivHtmlPadrao.Replace('[wdt]',
                                   (pnl.Width - 260).ToString).Replace('[hgh]',
                                    (pnl.Height -12).ToString);
        DivPanelDescricao.BringToFront;

        if FModel.Items[I].Favoritado = 'S' then
        begin
          var
            imgCheck: TUniLabel := TUniLabel.Create(pnl);
          imgCheck.Parent := pnl;
          imgCheck.Top := 8;
          imgCheck.Left := 260;
          imgCheck.TextConversion := txtHTML;
          imgCheck.Text :=  getSvgCheck;
        end;

        var
          DivPanelKM: TUniLabel := TUniLabel.Create(pnl);
        DivPanelKM.Parent := pnl;
        DivPanelKM.Top := 112;
        DivPanelKM.Left := 470;
        DivPanelKM.Cursor := crHandPoint;
        DivPanelKM.TextConversion := txtHTML;
        DivPanelKM.Text := DivHtmlPadraoComValor.Replace('[wdt]', '60')
          .Replace('[hgh]', '30').Replace('[valor]', '');
        DivPanelKM.BringToFront;


         var
          lblKmValor: TUniLabel := TUniLabel.Create(pnl);
        lblKmValor.Parent := pnl;
        lblKmValor.Top := 120;
        lblKmValor.Left := 476;
        lblKmValor.Text := FModel.Items[I].Km.ToString + ' KM';
        lblKmValor.Font.Color := clWhite;
        lblKmValor.Font.Height := 16;
        lblKmValor.Font.Style := [fsBold];
        lblKmValor.BringToFront;

        var
          lblDescricao: TUniLabel := TUniLabel.Create(pnl);
        lblDescricao.Parent := pnl;
        lblDescricao.Top  := 50;
        lblDescricao.Left := 280;
        lblDescricao.Text := FModel.Items[I].Titulo;
        lblDescricao.Font.Height := 18;
        lblDescricao.Font.Style := [fsBold];
        lblDescricao.BringToFront;

        var
          lblNome: TUniLabel := TUniLabel.Create(pnl);
        lblNome.Parent := pnl;
        lblNome.Top := 85;
        lblNome.Left := 280;
        lblNome.Text := '👷 '+FModel.Items[I].Nome;
        lblNome.Font.Color := clGray;
        lblNome.Font.Height := 16;
        lblNome.Font.Style := [fsBold];
        lblNome.BringToFront;

        var
          lblLocalizacao: TUniLabel := TUniLabel.Create(pnl);
        lblLocalizacao.Parent := pnl;
        lblLocalizacao.Top := 120;
        lblLocalizacao.Left := 280;
        lblLocalizacao.Text := '📌 '+FModel.Items[I].Endereco;
        lblLocalizacao.Font.Color := clGray;
        lblLocalizacao.Font.Height := 14;
        lblLocalizacao.Font.Style := [fsBold];
        lblLocalizacao.BringToFront;

        var
          lblPreco: TUniLabel := TUniLabel.Create(pnl);
        lblPreco.Parent := pnl;
        lblPreco.Top := 120;
        lblPreco.Left := 550;
        lblPreco.Text := FormatFloat('R$ 0,.00',FModel.Items[I].Valor);
        lblPreco.Font.Color := $00DA6777;
        lblPreco.Font.Height := 16;
        lblPreco.Font.Style := [fsBold];
        lblPreco.BringToFront;
      end;

    finally
//      FreeAndNil(Model);
    end;
  finally
  //  FreeAndNil(FController);
  end;
end;

procedure TfrPesquisa.RenderizaPainelPesquisado;
begin
  for var I := 0 to PanelAtualClicado.ComponentCount - 1 do
  begin
    if PanelAtualClicado.Components[I] is TUniLabel then
    begin
      var
      lblPai := PanelAtualClicado.Components[I] as TUniLabel;
      var
      lblLocal := TUniLabel.Create(pnlImage);
      lblLocal.Parent := pnlImage;
      lblLocal.Top := lblPai.Top;
      lblLocal.Left := lblPai.Left;
      lblLocal.TextConversion := lblPai.TextConversion;
      lblLocal.Text := lblPai.Text;
      lblLocal.Font := lblPai.Font;
    end;

  end;
end;

procedure TfrPesquisa.AbrirServico(Sender: TObject);
begin
  var index: string := TUniPanel(Sender).Name;
  index := copy(index, pos('index_',index)+6);

  FController.getTelaContrataServico(self, FModel.Items[index.ToInteger]);
end;

procedure TfrPesquisa.AjustaPnlPesquisa;
begin
  lblDivPesquisa.Text := DivHtmlPadrao.Replace('[wdt]',
    (pnlPesquisa.Width - 5).ToString).Replace('[hgh]', (pnlPesquisa.Height - 5)
    .ToString);
end;

procedure TfrPesquisa.getListaSubCategorias;
begin

  var nomePanel: String :=  PanelAtualClicado.Name;
  if not nomePanel.Contains('categoria') then
   Exit;

  LblDescFiltroSubCategoria.Visible := true;
  nomePanel := nomePanel.Replace('pnl_', '');
  var categoria :=  Copy(nomePanel, pos('_', nomePanel) + 1);
  var leftCk := 20;

  var Controller := TSubCategoriasController.Create;
  var Model:= Controller.getListaSubCategorias(categoria);

  lblDivSubCategorias.Text := DivHtmlPadrao.Replace('[wdt]',(PnlSubCategorias.Width - 10).ToString)
                                                        .Replace('[hgh]',(PnlSubCategorias.Height +1).ToString);
  try

    for var i := 0 to Model.Items.Count -1 do
    begin

      var ckSubCategorias :=   TUniRadioButton.Create(PnlSubCategorias);
      ckSubCategorias.Parent := PnlSubCategorias;
      ckSubCategorias.Name := 'rb_subcategorias_'+Model.Items[i].CodSubcategoria.ToString();
      ckSubCategorias.font.Color := $009D9D9D;
      ckSubCategorias.Color := clWhite;
      ckSubCategorias.font.Size := 9;
      ckSubCategorias.Height := 22;
      ckSubCategorias.Width  := 115;
      ckSubCategorias.Caption := Model.Items[i].DescricaoSubcategoria;
      ckSubCategorias.OnClick := OnFilterServicoPorSubCategorias;
      ckSubCategorias.Top := 20;
      ckSubCategorias.ScreenMask.WaitData := true;
      ckSubCategorias.ScreenMask.Enabled := true;
      ckSubCategorias.ScreenMask.ShowMessage := false;
      ckSubCategorias.ScreenMask.Color := $00DA6777;

      if i = 0 then
        ckSubCategorias.Left := leftCk
      else
        ckSubCategorias.Left := leftCk + 130;

        leftCk := ckSubCategorias.Left;
    end;


  finally
   FreeAndNil(Controller);

   if Assigned(Model) then
     FreeAndNil(Model);
  end;
end;

procedure TfrPesquisa.OnFilterServicoPorSubCategorias(Sender: TObject);
begin
  var rbLocal := Sender as TUniRadioButton;
  try
    if rbLocal.Checked then
    begin
     var
      KeyValue: string := rbLocal.Name;
      KeyValue    :=  KeyValue.Replace('rb_', '');
      KeyValue    := Copy(KeyValue, pos('_', KeyValue) + 1);
      LimparServicos;
      CarregarServicos('subcategoria', KeyValue);
    end;
  finally

  end;
end;

procedure TfrPesquisa.LimparServicos;
begin
   while sbServicos.ComponentCount > 0 do
     FreeAndNil(sbServicos.Components[0]);
end;

end.
