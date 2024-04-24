unit uPesquisa.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMain.view, uniLabel,
  Vcl.Imaging.pngimage, uniImage, uniPanel, uniGUIBaseClasses, uniGUIClasses,
  uniScrollBox, uniEdit, UniFSEdit, uniGUITypes, uniButton, uniBitBtn,
  UniFSButton, uniCheckBox, uniRadioButton;

type
  TfrPesquisa = class(TMainForm)
    pnlImage: TUniPanel;
    sbServicos: TUniScrollBox;
    pnlPesquisa: TUniPanel;
    lblDivPesquisa: TUniLabel;
    UniFSEdit1: TUniFSEdit;
    UniImage2: TUniImage;
    UniFSButton1: TUniFSButton;
    PnlSubCategorias: TUniPanel;
    lblDivSubCategorias: TUniLabel;
    LblDescFiltroSubCategoria: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);
  private
    procedure AjustaPnlPesquisa;
    procedure RenderizaPainelPesquisado;
    procedure CarregarServicos;
    procedure getListaSubCategorias;
  public
    PanelAtualClicado: TUniPanel;
  end;

implementation

{$R *.dfm}

uses uConstsHTML, uPrincipal.Controller, uImagem.Servicos.Model,
     uSubCategorias.Controller, uSubCategorias.Model;

procedure TfrPesquisa.UniFormShow(Sender: TObject);
begin
  // inherited;
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

procedure TfrPesquisa.CarregarServicos;
begin
  var
  Controller := TControllerPrincipal.Create;
  try
    var
      KeyHeader: string := PanelAtualClicado.Name;
      // pnl_categoria_1
    KeyHeader := KeyHeader.Replace('pnl_', '');
    var
    Model := Controller.getListaServicos(Copy(KeyHeader,0, pos('_', KeyHeader) - 1), Copy(KeyHeader, pos('_', KeyHeader) + 1));
    try
      const
        inicialLeft = 15;

      var
        posTop: integer := 0;
      var
        TopAtual: integer := 0;
      var
        count: integer := 0;

      for var I := 0 to Model.Items.count - 1 do
      begin
        if Model.Items[I].Foto.IsEmpty then
          Continue;

        var
          pnl: TUniPanel := TUniPanel.Create(sbServicos);
        pnl.Parent := sbServicos;
        pnl.Height := 180;
        pnl.Width  := 650;

        if count = 1 then
        begin
          count := 0;
          posTop := pnl.Height + TopAtual + 50;
        end;

        TopAtual := posTop;
        pnl.Left := inicialLeft;
        pnl.Top := posTop;
        pnl.Color := $00FFEEF0;
        pnl.ShowCaption := false;
        pnl.BorderStyle := ubsNone;
        pnl.Font.Name := TFontName('Roboto');
        pnl.Name := 'pnl_Servico_' + Model.Items[I].Cod.ToString;
        inc(count);

        var
          imgHTML: TUniLabel := TUniLabel.Create(pnl);
        imgHTML.Parent := pnl;
        imgHTML.Top := 18;
        imgHTML.Left := 25;
        imgHTML.Cursor := crHandPoint;
        imgHTML.TextConversion := txtHTML;

        imgHTML.Text := ImgServicos.Replace('[base64foto]',
          Model.Items[I].Foto).Replace('[nome]',
          Model.Items[I].Descricao);
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

        var
          DivPanelKM: TUniLabel := TUniLabel.Create(pnl);
        DivPanelKM.Parent := pnl;
        DivPanelKM.Top := 112;
        DivPanelKM.Left := 470;
        DivPanelKM.Cursor := crHandPoint;
        DivPanelKM.TextConversion := txtHTML;
        DivPanelKM.Text := DivHtmlPadraoComValor.Replace('[wdt]', '60')
          .Replace('[hgh]', '30').Replace('[valor]', '<br> &nbsp&nbsp&nbsp' +
          Model.Items[I].Km.ToString + ' KM');
        DivPanelKM.BringToFront;

        var
          lblDescricao: TUniLabel := TUniLabel.Create(pnl);
        lblDescricao.Parent := pnl;
        lblDescricao.Top  := 50;
        lblDescricao.Left := 280;
        lblDescricao.Text := Model.Items[I].Descricao;
        lblDescricao.Font.Height := 18;
        lblDescricao.Font.Style := [fsBold];
        lblDescricao.BringToFront;

        var
          lblNome: TUniLabel := TUniLabel.Create(pnl);
        lblNome.Parent := pnl;
        lblNome.Top := 85;
        lblNome.Left := 280;
        lblNome.Text := '👷 '+Model.Items[I].Nome;
        lblNome.Font.Color := clGray;
        lblNome.Font.Height := 16;
        lblNome.Font.Style := [fsBold];
        lblNome.BringToFront;

        var
          lblLocalizacao: TUniLabel := TUniLabel.Create(pnl);
        lblLocalizacao.Parent := pnl;
        lblLocalizacao.Top := 120;
        lblLocalizacao.Left := 280;
        lblLocalizacao.Text := '📌 '+Model.Items[I].Endereco;
        lblLocalizacao.Font.Color := clGray;
        lblLocalizacao.Font.Height := 14;
        lblLocalizacao.Font.Style := [fsBold];
        lblLocalizacao.BringToFront;

        var
          lblPreco: TUniLabel := TUniLabel.Create(pnl);
        lblPreco.Parent := pnl;
        lblPreco.Top := 120;
        lblPreco.Left := 550;
        lblPreco.Text := FormatFloat('R$ 0,.00',Model.Items[I].Valor);
        lblPreco.Font.Color := $00DA6777;
        lblPreco.Font.Height := 16;
        lblPreco.Font.Style := [fsBold];
        lblPreco.BringToFront;

//        var
//          imgCheck: TUniLabel := TUniLabel.Create(pnl);
//        imgCheck.Parent := pnl;
//        imgCheck.Top := 230;
//        imgCheck.Left := 250;
//        imgCheck.TextConversion := txtHTML;
//        imgCheck.Text :=  getSvgCheck;
      end;

    finally
      FreeAndNil(Model);
    end;
  finally
    FreeAndNil(Controller);
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
      ckSubCategorias.Name := 'chk_subcategorias_'+Model.Items[i].CodSubcategoria.ToString();
      ckSubCategorias.font.Color := $009D9D9D;
      ckSubCategorias.Color := clWhite;
      ckSubCategorias.font.Size := 9;
      ckSubCategorias.Height := 20;
      ckSubCategorias.Width  := 100;
      ckSubCategorias.Caption := Model.Items[i].DescricaoSubcategoria;

      ckSubCategorias.Top := 20;

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

end.
