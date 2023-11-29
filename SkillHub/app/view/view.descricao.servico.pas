unit view.descricao.servico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  uGosBase, uGosStandard, System.Skia, FMX.Skia, FMX.Objects, FMX.Effects;

type
  TfrmDescricaoServico = class(TForm)
    LayoutTopo: TLayout;
    LayoutBotton: TLayout;
    btnLogin: TGosButtonView;
    GosButtonView2: TGosButtonView;
    lblTitulo: TSkLabel;
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    GosButtonView1: TGosButtonView;
    SkLabel1: TSkLabel;
    lblPrestador: TSkLabel;
    SkLabel2: TSkLabel;
    Layout2: TLayout;
    SkSvg1: TSkSvg;
    Layout3: TLayout;
    SkLabel3: TSkLabel;
    SkSvg2: TSkSvg;
    Image1: TImage;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    procedure GosButtonView2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela(ABitmap:TBitmap);
  end;

var
  frmDescricaoServico: TfrmDescricaoServico;

implementation

{$R *.fmx}

procedure TfrmDescricaoServico.CarregaTela(ABitmap: TBitmap);
begin

end;

procedure TfrmDescricaoServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmDescricaoServico:= nil;

end;

procedure TfrmDescricaoServico.GosButtonView2Click(Sender: TObject);
begin
  close;
end;

end.
