unit uCadastroServico.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMain.view, uniLabel,
  Vcl.Imaging.pngimage, uniImage, uniPanel, uniGUIBaseClasses, uniGUIClasses,
  uniScrollBox, uniFileUpload, uniButton, uniBitBtn, UniFSButton, uniEdit,
  UniFSEdit, uniMultiItem, uniComboBox, UniFSCombobox, uniTimer, uniMemo,
  UniFSMaskEdit, UniFSCalcEdit;

type
  TfrCadastraServico = class(TMainForm)
    UniPanel1: TUniPanel;
    lblImage: TUniLabel;
    upImg: TUniFileUpload;
    UniFSButton1: TUniFSButton;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    cbCategoria: TUniFSComboBox;
    UniLabel2: TUniLabel;
    UniTimer1: TUniTimer;
    UniLabel3: TUniLabel;
    CbProfissoes: TUniFSComboBox;
    UniLabel4: TUniLabel;
    cbSubcategoria: TUniFSComboBox;
    UniPanel4: TUniPanel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    edtTitulo: TUniFSEdit;
    mDescricao: TUniMemo;
    UniPanel5: TUniPanel;
    UniLabel6: TUniLabel;
    UniLabel8: TUniLabel;
    edtEndereco: TUniFSEdit;
    edtEndNumero: TUniFSCalcEdit;
    edtBairro: TUniFSEdit;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    edtComplemento: TUniFSEdit;
    UniLabel11: TUniLabel;
    edtCep: TUniFSMaskEdit;
    UniPanel6: TUniPanel;
    btnGravar: TUniFSButton;
    BtnCancelar: TUniFSButton;
    UniLabel12: TUniLabel;
    edtKM: TUniFSCalcEdit;
    UniLabel13: TUniLabel;
    edtValorServico: TUniFSCalcEdit;
    procedure UniFormShow(Sender: TObject);
    procedure UniPanel1Click(Sender: TObject);
    procedure upImgCompleted(Sender: TObject; AStream: TFileStream);
    procedure UniFSButton1Click(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FBase64Image:String;
   function StreamToBase64(AStream: TStream):string;
    procedure LoadNoImage;
    procedure carregarComboCategoria;
    procedure carregarComboProfissao;
    procedure carregarComboSubcategoria;
    procedure LimparComponentes;
    procedure GravarServico;
  public
    { Public declarations }
  end;

var
  frCadastraServico: TfrCadastraServico;

implementation

{$R *.dfm}
uses ServerModule, IdCoderMIME, uConstsHTML,
    uPrincipal.Controller, uSubCategorias.Controller, uImagem.Servicos.Model;

procedure TfrCadastraServico.LoadNoImage;
begin
  var img := TUniImage.Create(self);
  var LStream := TMemoryStream.Create;
  try
    img.Picture.LoadFromFile(UniServerModule.FilesFolder+'noImage.png');
    img.Picture.SaveToStream(LStream);

    lblImage.Text := NewImgServicos
                           .replace('[base64foto]',StreamToBase64(LStream)  )
                           .Replace('[nome]','noImage');
  finally
    img.free;
    LStream.free;
  end;
end;

function TfrCadastraServico.StreamToBase64(AStream: TStream): string;
begin
  var Encoder := TIdEncoderMIME.Create(self);
  try
   AStream.Position := 0;
   result := Encoder.EncodeStream(AStream);
  finally
    Encoder.Free;
  end;
end;

procedure TfrCadastraServico.UniFormShow(Sender: TObject);
begin
 LoadNoImage;
end;

procedure TfrCadastraServico.UniFSButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrCadastraServico.UniPanel1Click(Sender: TObject);
begin
  inherited;
  upImg.Execute;
end;

procedure TfrCadastraServico.UniTimer1Timer(Sender: TObject);
begin
  inherited;
  carregarComboCategoria;
  carregarComboProfissao;
  carregarComboSubcategoria;
end;

procedure TfrCadastraServico.upImgCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  inherited;
  FBase64Image := StreamToBase64(upImg.Files[0].Stream);

  lblImage.Text := ImgServicos
                           .replace('[base64foto]', FBase64Image)
                           .Replace('[nome]','noImage');
end;


procedure TfrCadastraServico.BtnCancelarClick(Sender: TObject);
begin
  LimparComponentes;
end;


procedure TfrCadastraServico.LimparComponentes;
begin
  for var i := 0 to self.ComponentCount -1 do
  begin
    if Components[i] is TUniFSCalcEdit then
      TUniFSCalcEdit(Components[i]).Text := '';

    if Components[i] is TUniFSMaskEdit then
      TUniFSMaskEdit(Components[i]).Text := '';

    if Components[i] is TUniMemo then
      TUniMemo(Components[i]).Lines.Clear;

    if Components[i] is TUniFSEdit then
      TUniFSEdit(Components[i]).Text := '';

    if Components[i] is TUniFSComboBox then
      TUniFSComboBox(Components[i]).ItemIndex := -1;
  end;
end;

procedure TfrCadastraServico.btnGravarClick(Sender: TObject);
begin
  GravarServico;
end;

procedure TfrCadastraServico.GravarServico;
begin
  var controller := TControllerPrincipal.Create;
  var model := TItemsImgServicosModel.Create;
  try
    model.Titulo        := edtTitulo.Text;
    model.Descricao     := mDescricao.Text;
    model.Categoria     := cbCategoria.Value.ToInteger();
    model.Subcategoria  := cbSubcategoria.Value.ToInteger();
    model.Profissao     := CbProfissoes.Value.ToInteger();
    model.Foto          := FBase64Image;
    model.Cod_Usuario   := controller.getDadosUsuarioLogado.Cod.ToInteger();
    model.Km            := StrToInt(edtKM.Text);
    model.Valor         := edtValorServico.Value;
    model.Favoritado    := 'N';
    model.Cep           := edtCep.Text;
    model.Endereco      := edtEndereco.Text;
    model.Numero        := edtEndNumero.text;
    model.Bairro        := edtBairro.Text;
    model.Complemento   := edtComplemento.Text;

    try
      controller.CadastrarNovoServico(model);
      UniSession.Alert('Serviço cadastrado com sucesso!');
    except
      on E:Exception do
        UniSession.Alert('Erro ao gravar o serviço: '+ E.Message);
    end;
  finally
    model.Free;
    controller.Free;
  end;
end;

procedure TfrCadastraServico.carregarComboCategoria;
begin
  var controller := TControllerPrincipal.Create;
  var model := controller.getListaCategorias;
  try

    for var I := 0 to model.Items.Count-1 do
    begin
      cbCategoria.Items.Add(model.Items[i].Cod.ToString + ' - '+model.Items[i].Descricao);
      cbCategoria.ValueList.Add(model.Items[i].Cod.ToString);
    end;
    cbCategoria.ItemIndex := 0;
  finally
     model.free;
     controller.Free;
  end;
end;


procedure TfrCadastraServico.carregarComboProfissao;
begin
  var controller := TControllerPrincipal.Create;
  var model := controller.getListaProfissoes;
  try

    for var I := 0 to model.Items.Count-1 do
    begin
      CbProfissoes.Items.Add(model.Items[i].Cod.ToString + ' - '+model.Items[i].Descricao);
      CbProfissoes.ValueList.Add(model.Items[i].Cod.ToString);
    end;
    CbProfissoes.ItemIndex := 0;
  finally
     model.free;
     controller.Free;
  end;
end;


procedure TfrCadastraServico.carregarComboSubcategoria;
begin
  var controller := TSubCategoriasController.Create;
  var model := controller.getListaSubCategorias('');
  try

    for var I := 0 to model.Items.Count-1 do
    begin
      cbSubcategoria.Items.Add(model.Items[i].Cod.ToString + ' - '+model.Items[i].Descricao);
      cbSubcategoria.ValueList.Add(model.Items[i].Cod.ToString);
    end;
    cbSubcategoria.ItemIndex := 0;
  finally
     model.free;
     controller.Free;
  end;
end;


end.
