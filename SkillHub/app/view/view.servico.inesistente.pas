unit view.servico.inesistente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Skia, FMX.Skia, FMX.Effects,
  FMX.Filter.Effects, FMX.Layouts, FMX.Objects, uGosObjects, frame.servico,
  frame.categoria, FMX.ListBox, System.Generics.Collections;

type
  TfrmServicoInesistente = class(TForm)
    LayoutTopo: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    btnPesquisa: TSpeedButton;
    FillRGBEffect2: TFillRGBEffect;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    btnReformaseReparos: TGosRectangle;
    lblReformasReparos: TSkLabel;
    imgReformasReparos: TSkSvg;
    btnAssistencia: TGosRectangle;
    SkLabel4: TSkLabel;
    SkSvg6: TSkSvg;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    btnConsultoria: TGosRectangle;
    SkLabel5: TSkLabel;
    SkSvg8: TSkSvg;
    GosRectangle1: TGosRectangle;
    SkLabel8: TSkLabel;
    SkSvg2: TSkSvg;
    btnDesignETecnoligia: TGosRectangle;
    SkLabel9: TSkLabel;
    SkSvg1: TSkSvg;
    btnVeiculo: TGosRectangle;
    SkLabel6: TSkLabel;
    SkSvg7: TSkSvg;
    LayoutFiltro: TLayout;
    VertScrollBox1: TVertScrollBox;
    SkLabel7: TSkLabel;
    frameServico1: TframeServico;
    frameServico2: TframeServico;
    frameServico3: TframeServico;
    frameServico4: TframeServico;
    frameServico5: TframeServico;
    lbFiltro: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela(ACategoria:TObjectList<TframeCategoria>);
  end;

var
  frmServicoInesistente: TfrmServicoInesistente;

implementation

{$R *.fmx}

uses view.pesquisa.servico;

procedure TfrmServicoInesistente.btnPesquisaClick(Sender: TObject);
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

procedure TfrmServicoInesistente.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmServicoInesistente.CarregaTela(
  ACategoria: TObjectList<TframeCategoria>);
var
 LListBoxItem:TListBoxItem;
begin

  for var LFrame in ACategoria do
  begin
    LListBoxItem:= TListBoxItem.Create(nil);
    LListBoxItem.Height:= 150;
    LListBoxItem.Text:= EmptyStr;





    LListBoxItem.AddObject(LFrame);


    lbFiltro.AddObject(LListBoxItem);

  end;


end;

procedure TfrmServicoInesistente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.cafree;
  frmServicoInesistente:= nil;
end;

procedure TfrmServicoInesistente.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
