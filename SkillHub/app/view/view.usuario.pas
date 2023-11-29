unit view.usuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Skia, FMX.Objects, FMX.Skia,
  FMX.Effects, FMX.Filter.Effects;

type
  TfrmUsuario = class(TForm)
    LayoutTopo: TLayout;
    Layout1: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    SkSvg1: TSkSvg;
    Rectangle1: TRectangle;
    skLabel1: TSkLabel;
    Layout2: TLayout;
    LayoutBody: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    LayoutFavoritos: TLayout;
    SkLabel2: TSkLabel;
    Line1: TLine;
    LayoutNotificacoes: TLayout;
    SkLabel3: TSkLabel;
    Line2: TLine;
    LayoutDadosDaConta: TLayout;
    SkLabel4: TSkLabel;
    Line3: TLine;
    LayoutPrivacidade: TLayout;
    SkLabel5: TSkLabel;
    Line4: TLine;
    VertScrollBox1: TVertScrollBox;
    Layout4: TLayout;
    SkLabel6: TSkLabel;
    procedure LayoutNotificacoesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LayoutDadosDaContaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.fmx}

uses view.notificacao, view.dados.usuario;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmUsuario:= nil;
end;

procedure TfrmUsuario.LayoutDadosDaContaClick(Sender: TObject);
begin
  if not Assigned(frmDadosdoUsuario) then
    Application.CreateForm(TfrmDadosdoUsuario, frmDadosdoUsuario);
  frmDadosdoUsuario.Show;

end;

procedure TfrmUsuario.LayoutNotificacoesClick(Sender: TObject);
begin
  if not Assigned(frmNotificacao) then
    Application.CreateForm(TfrmNotificacao, frmNotificacao);
  frmNotificacao.Show;

end;

procedure TfrmUsuario.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
