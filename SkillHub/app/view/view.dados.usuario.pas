unit view.dados.usuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Skia, FMX.Effects, FMX.Filter.Effects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TfrmDadosdoUsuario = class(TForm)
    LayoutBody: TLayout;
    Rectangle2: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Layout3: TLayout;
    LayoutNome: TLayout;
    SkLabel2: TSkLabel;
    Line1: TLine;
    LayoutTopo: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    Layout2: TLayout;
    SkSvg1: TSkSvg;
    Circle1: TCircle;
    SkSvg2: TSkSvg;
    ShadowEffect1: TShadowEffect;
    SkLabel1: TSkLabel;
    LayoutCPF: TLayout;
    SkLabel3: TSkLabel;
    Line2: TLine;
    SkLabel4: TSkLabel;
    LayoutEmail: TLayout;
    SkLabel5: TSkLabel;
    Line3: TLine;
    SkLabel7: TSkLabel;
    Layout5: TLayout;
    SkLabel8: TSkLabel;
    Line4: TLine;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosdoUsuario: TfrmDadosdoUsuario;

implementation

{$R *.fmx}

procedure TfrmDadosdoUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmDadosdoUsuario:= nil;
end;

procedure TfrmDadosdoUsuario.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
