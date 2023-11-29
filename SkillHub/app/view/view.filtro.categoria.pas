unit view.filtro.categoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Effects, FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Objects, frame.servico;

type
  TTipoFiltro = (ReformasEReparos, ServicosDomesticos, DesignETecnologia,
  Assitencia, Consultoria, Veiculo);

  TfrmFiltroCategoria = class(TForm)
    LayoutTopo: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    Layout1: TLayout;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    btnPesquisa: TSpeedButton;
    FillRGBEffect2: TFillRGBEffect;
    Layout2: TLayout;
    LayoutCategoria: TLayout;
    VertScrollBox1: TVertScrollBox;
    LayoutFiltros: TLayout;
    Rectangle1: TRectangle;
    CheckBox1: TCheckBox;
    Layout3: TLayout;
    StyleBook1: TStyleBook;
    ShadowEffect1: TShadowEffect;
    Layout4: TLayout;
    SkLabel4: TSkLabel;
    Layout5: TLayout;
    CheckBox2: TCheckBox;
    ShadowEffect2: TShadowEffect;
    SkLabel5: TSkLabel;
    Layout6: TLayout;
    CheckBox3: TCheckBox;
    ShadowEffect3: TShadowEffect;
    SkLabel6: TSkLabel;
    Layout7: TLayout;
    CheckBox4: TCheckBox;
    ShadowEffect4: TShadowEffect;
    SkLabel7: TSkLabel;
    Layout8: TLayout;
    CheckBox5: TCheckBox;
    ShadowEffect5: TShadowEffect;
    SkLabel8: TSkLabel;
    Layout9: TLayout;
    CheckBox6: TCheckBox;
    ShadowEffect6: TShadowEffect;
    SkLabel9: TSkLabel;
    Layout10: TLayout;
    CheckBox7: TCheckBox;
    ShadowEffect7: TShadowEffect;
    SkLabel10: TSkLabel;
    frameServico1: TframeServico;
    frameServico2: TframeServico;
    frameServico3: TframeServico;
    frameServico4: TframeServico;
    frameServico5: TframeServico;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela(AFiltro:TTipoFiltro; ASvg, AText:string);
  end;

var
  frmFiltroCategoria: TfrmFiltroCategoria;

implementation

{$R *.fmx}

uses view.pesquisa.servico;

procedure TfrmFiltroCategoria.btnPesquisaClick(Sender: TObject);
begin

  if not Assigned(frmPesquisaServico) then
    application.CreateForm(TfrmPesquisaServico, frmPesquisaServico);

  frmPesquisaServico.CarregaTela;
  frmPesquisaServico.Show;

end;

procedure TfrmFiltroCategoria.CarregaTela(AFiltro:TTipoFiltro; ASvg, AText:string);
var
 LRectFiltro:TRectangle;
 LSvg:TSkSvg;
 LLabel:TSkLabel;
begin

  LRectFiltro:= TRectangle.Create(self);
  LRectFiltro.Height:= 124;
  LRectFiltro.Width:= 100;
  LRectFiltro.XRadius:= 25;
  LRectFiltro.YRadius:= 25;
  LRectFiltro.Align:= TAlignLayout.Center;
  LRectFiltro.Fill.Color:= $FF7767DA;
  LRectFiltro.Stroke.Kind:= TBrushKind.None;

  LSvg:= TSkSvg.Create(self);
  LSvg.Svg.Source:= ASvg;
  LSvg.Align:= TAlignLayout.Client;
  LSvg.Margins.Top:= 8;
  LSvg.Margins.Left:= 8;
  LSvg.Margins.Right:= 8;
  LSvg.Margins.Bottom:= 8;
  LSvg.Svg.OverrideColor:= TAlphaColors.White;

  LLabel:= TSkLabel.Create(self);
  LLabel.Text:= AText;
  LLabel.Align:= TAlignLayout.Bottom;
  LLabel.TextSettings.Font.Weight:= TFontWeight.Semibold;
  LLabel.TextSettings.FontColor:= TAlphaColors.White;
  LLabel.TextSettings.HorzAlign:= TSkTextHorzAlign.Center;
  LLabel.Margins.Bottom:= 16;

  LRectFiltro.AddObject(LSvg);
  LRectFiltro.AddObject(LLabel);

  LayoutCategoria.AddObject(LRectFiltro);




  case AFiltro of
    ReformasEReparos: ;
    ServicosDomesticos: ;
    DesignETecnologia: ;
    Assitencia: ;
    Consultoria: ;
    Veiculo: ;
  end;
end;

procedure TfrmFiltroCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmFiltroCategoria:= nil;
end;

procedure TfrmFiltroCategoria.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
