unit uContrataServicos.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMain.view, uniLabel,uImagem.Servicos.Model,
  Vcl.Imaging.pngimage, uniImage, uniPanel, uniGUIBaseClasses, uniGUIClasses,
  uniScrollBox, uniButton, uniBitBtn, UniFSButton, uniImageList, uConstsHTML;

type
  TfrContrataServico = class(TMainForm)
    UniPanel1: TUniPanel;
    lblImgServico: TUniLabel;
    PnlDiv: TUniPanel;
    lblDivPrincipal: TUniLabel;
    pnlDivPreco: TUniPanel;
    lblDivPreco: TUniLabel;
    UniImage1: TUniImage;
    lblTitulo: TUniLabel;
    lblDescricao: TUniLabel;
    lblLocalizacao: TUniLabel;
    lblKM: TUniLabel;
    btnFavoritar: TUniFSButton;
    UniImageList1: TUniImageList;
    UniFSButton2: TUniFSButton;
    UniFSButton3: TUniFSButton;
    UniImage2: TUniImage;
    lblNome: TUniLabel;
    lblPreco: TUniLabel;
    procedure UniFSButton3Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFSButton2Click(Sender: TObject);
    procedure btnFavoritarClick(Sender: TObject);
  private
    FModel: TItemsImgServicosModel;
    procedure Favoritar;
  public
    property Mode: TItemsImgServicosModel read FModel write FModel;
  end;

var
  frContrataServico: TfrContrataServico;

implementation

uses uPrincipal.Controller;
{$R *.dfm}

procedure TfrContrataServico.UniFormShow(Sender: TObject);
begin
  if Self.parent.name = 'FrPrincipal' then
  begin
    Self.Position := poScreenCenter;
    Self.FormStyle := fsNormal;
  end;

 lblImgServico.Text := ImgServicos.Replace('[base64foto]',
                          FModel.Foto).Replace('[nome]',
                          FModel.Descricao);
                          
 lblDivPrincipal.text := DivHtmlPadrao.replace('[hgh]', PnlDiv.Height.tostring)
                                      .replace('[wdt]', PnlDiv.width.toString);

 lblDivPreco.text := DivHtmlPadraoComValor.replace('[hgh]', pnlDivPreco.Height.tostring)
                                          .replace('[wdt]', pnlDivPreco.width.toString)
                                          .replace('[valor]', '');
 lblPreco.Text  := 'R$ ' + FModel.Valor.ToString;                                         
 lblTitulo.text      := FModel.Titulo;
 lblKM.text          := FModel.km.toString + ' KM';
 lblDescricao.text   := FModel.Descricao;                                         
 lblLocalizacao.Text := FModel.Endereco; 
 lblNome.text        := FModel.Nome;

 if FModel.Favoritado = 'N' then
  btnFavoritar.ImageIndex := 0
 else
  btnFavoritar.ImageIndex := 1;


end;

procedure TfrContrataServico.UniFSButton2Click(Sender: TObject);
begin
 ShowMessage('Serviço contradado!');
end;

procedure TfrContrataServico.UniFSButton3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrContrataServico.btnFavoritarClick(Sender: TObject);
begin
  inherited;
  Favoritar;
end;

procedure TfrContrataServico.Favoritar;
begin
  var Controller := TControllerPrincipal.create;
  try
     if FModel.Favoritado = 'N' then
     begin
      Controller.Favoritar(FModel.cod.toString, 'S');
      FModel.Favoritado := 'S';
      btnFavoritar.ImageIndex := 1;
     end
     else
     begin
       Controller.Favoritar(FModel.cod.Tostring, 'N');
       FModel.Favoritado := 'N';
       btnFavoritar.ImageIndex := 0;
     end;
  finally
    Controller.Free;
  end;
end;

end.
