unit view.pesquisa.profissoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  System.Skia, FMX.Skia, frame.servico;

type
  TfrmPesquisaProfissoes = class(TForm)
    LayoutTopo: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    imgProfissao: TSkSvg;
    Layout3: TLayout;
    lblProfissao: TSkLabel;
    VertScrollBox1: TVertScrollBox;
    frameServico1: TframeServico;
    frameServico2: TframeServico;
    frameServico3: TframeServico;
    frameServico4: TframeServico;
    frameServico5: TframeServico;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela(ASvg, ATexto: string);
  end;

var
  frmPesquisaProfissoes: TfrmPesquisaProfissoes;

implementation

{$R *.fmx}

procedure TfrmPesquisaProfissoes.CarregaTela(ASvg, ATexto: string);
begin
  imgProfissao.Svg.source:= ASvg;
  lblProfissao.text:= ATexto;

end;

procedure TfrmPesquisaProfissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmPesquisaProfissoes:= nil;
end;

procedure TfrmPesquisaProfissoes.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
