unit view.anuncio.servico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Layouts, FMX.Skia, uGosBase, uGosEdit, FMX.Objects, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmAnuncioServico = class(TForm)
    LayoutTop: TLayout;
    SkSvg1: TSkSvg;
    VertScrollBox1: TVertScrollBox;
    LayoutEndereco: TLayout;
    Rectangle1: TRectangle;
    Line1: TLine;
    GosEditView1: TGosEditView;
    GosEditView2: TGosEditView;
    LayoutTitulo: TLayout;
    Rectangle2: TRectangle;
    Line2: TLine;
    GosEditView3: TGosEditView;
    GosEditView4: TGosEditView;
    GosEditView5: TGosEditView;
    Line3: TLine;
    LayoutServico: TLayout;
    Rectangle3: TRectangle;
    Line6: TLine;
    GosEditView8: TGosEditView;
    GosEditView9: TGosEditView;
    GosEditView10: TGosEditView;
    Line7: TLine;
    GosEditView11: TGosEditView;
    GosEditView12: TGosEditView;
    Line8: TLine;
    Line9: TLine;
    Rectangle4: TRectangle;
    SkSvg2: TSkSvg;
    Layout1: TLayout;
    Layout2: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnuncioServico: TfrmAnuncioServico;

implementation

{$R *.fmx}

procedure TfrmAnuncioServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmAnuncioServico:= nil;
end;

procedure TfrmAnuncioServico.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
