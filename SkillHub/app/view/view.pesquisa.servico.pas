unit view.pesquisa.servico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uGosBase,
  uGosEdit, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.Filter.Effects,
  FMX.Controls.Presentation, FMX.StdCtrls, frame.Servico;

type
  TfrmPesquisaServico = class(TForm)
    layoutTopo: TLayout;
    Rectangle1: TRectangle;
    GosEditView1: TGosEditView;
    Layout2: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    LayoutBody: TLayout;
    VertScrollBox1: TVertScrollBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure BuscarUltimosTresPedidos;
  public
    { Public declarations }
    procedure CarregaTela;
  end;

var
  frmPesquisaServico: TfrmPesquisaServico;

implementation

{$R *.fmx}

{ TForm1 }

procedure TfrmPesquisaServico.BuscarUltimosTresPedidos;
var
 LFrame:TframeServico;
begin

  //Select dos ultimos 3 pedidos
  for var i := 0 to 2 do
  begin

    LFrame:= TframeServico.Create(self);
    LFrame.Name:= 'Frame'+i.ToString;
    LFrame.Align:= TAlignLayout.Top;
    LFrame.Margins.Left:= 16;
    LFrame.Margins.Right:= 16;
    LFrame.Margins.Top:= 16;
    LFrame.Margins.Bottom:= 16;

    VertScrollBox1.AddObject(LFrame);

  end;

end;

procedure TfrmPesquisaServico.CarregaTela;
begin
  BuscarUltimosTresPedidos;
end;

procedure TfrmPesquisaServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmPesquisaServico:= nil;
end;

procedure TfrmPesquisaServico.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
