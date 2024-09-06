unit view.anuncio.servico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Layouts, FMX.Skia, uGosBase, uGosEdit, FMX.Objects, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls, uGosStandard,
  uConnection, uUrl, System.JSON, uFancyDialog;

type
  TfrmAnuncioServico = class(TForm)
    LayoutTop: TLayout;
    SkSvg1: TSkSvg;
    VertScrollBox1: TVertScrollBox;
    LayoutEndereco: TLayout;
    Rectangle1: TRectangle;
    Line1: TLine;
    edtCategoria: TGosEditView;
    edtSubCategoria: TGosEditView;
    LayoutTitulo: TLayout;
    Rectangle2: TRectangle;
    Line2: TLine;
    edtTitulo: TGosEditView;
    edtDescricao: TGosEditView;
    edtProfissao: TGosEditView;
    Line3: TLine;
    LayoutServico: TLayout;
    Rectangle3: TRectangle;
    Line6: TLine;
    edtCep: TGosEditView;
    edtEndereco: TGosEditView;
    edtBairro: TGosEditView;
    Line7: TLine;
    edtNumero: TGosEditView;
    edtComplemento: TGosEditView;
    Line8: TLine;
    Line9: TLine;
    Rectangle4: TRectangle;
    SkSvg2: TSkSvg;
    Layout1: TLayout;
    Layout2: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    Layout3: TLayout;
    btnSalvar: TGosButtonView;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FMsg:TFancyDialog;
  public
    { Public declarations }
    procedure CarregaTela;
  end;

var
  frmAnuncioServico: TfrmAnuncioServico;

implementation

{$R *.fmx}

procedure TfrmAnuncioServico.btnSalvarClick(Sender: TObject);
var
 LCon:TConnection;
 LResult:string;
 LJo:TJSONObject;
begin
  try
    LCon:= TConnection.Create;

    LJo:= TJSONObject.Create;
    LJo.AddPair('titulo',edtTitulo.Text);
    LJo.AddPair('descricao',edtDescricao.Text);
    LJo.AddPair('cep',edtCep.Text);
    LJo.AddPair('endereco',edtEndereco.Text);
    LJo.AddPair('bairro',edtBairro.Text);
    LJo.AddPair('numero',edtNumero.Text);
    LJo.AddPair('complemento',edtComplemento.Text);
    LJo.AddPair('categoria',edtCategoria.Text);
    LJo.AddPair('subcategoria',edtSubCategoria.Text);
    LJo.AddPair('profissao',edtProfissao.Text);



    if not LCon.Post(UrlCadastroServico,[],LJo,LResult) then
      exit;

    LJo:= TJSONObject.ParseJSONValue(LResult) as TJSONObject;


    FMsg.Show(TIconDialog.Success,'Sucesso!','Anúncio cadatrado');

  finally
    FreeAndNil(LCon);
  end;

end;

procedure TfrmAnuncioServico.CarregaTela;
begin
//
end;

procedure TfrmAnuncioServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmAnuncioServico:= nil;
end;

procedure TfrmAnuncioServico.FormCreate(Sender: TObject);
begin
  FMsg:= TFancyDialog.Create(self);
end;

procedure TfrmAnuncioServico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FMsg);
end;

procedure TfrmAnuncioServico.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
