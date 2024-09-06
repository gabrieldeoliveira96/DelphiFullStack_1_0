unit view.usuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Skia, FMX.Objects, FMX.Skia,
  FMX.Effects, FMX.Filter.Effects, System.JSON, uLoading, uFancyDialog,
  view.principal;

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
    lblSair: TSkLabel;
    procedure LayoutNotificacoesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LayoutDadosDaContaClick(Sender: TObject);
    procedure lblSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FUsuario:TUsuario;
    FMsg:TFancyDialog;
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela(AUsuario: TUsuario);
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.fmx}

uses view.notificacao, view.dados.usuario, uConnection, uUrl;

procedure TfrmUsuario.CarregaTela(AUsuario: TUsuario);
begin

  FUsuario:= AUsuario;

  TThread.Synchronize(nil,
  procedure
  begin
    skLabel1.Text:= FUsuario.Nome;
  end);

end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmUsuario:= nil;
end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  FMsg:= TFancyDialog.Create(self);
end;

procedure TfrmUsuario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FMsg);
end;

procedure TfrmUsuario.LayoutDadosDaContaClick(Sender: TObject);
begin
  if not Assigned(frmDadosdoUsuario) then
    Application.CreateForm(TfrmDadosdoUsuario, frmDadosdoUsuario);
  frmDadosdoUsuario.CarregaTela(FUsuario);
  frmDadosdoUsuario.Show;

end;

procedure TfrmUsuario.LayoutNotificacoesClick(Sender: TObject);
begin
  TLoading.Show(self,'Aguarde');

  TThread.CreateAnonymousThread(
  procedure
  begin
    try
      TThread.Synchronize(nil,
      procedure
      begin
        if not Assigned(frmNotificacao) then
          Application.CreateForm(TfrmNotificacao, frmNotificacao);
      end);

      if FUsuario.Tipo = TTipoUsuario.Cliente then
        frmNotificacao.CarregaTela(1);
      if FUsuario.Tipo = TTipoUsuario.Colaborador then
        frmNotificacao.CarregaTela(2);

      TThread.Synchronize(nil,
      procedure
      begin
        frmNotificacao.Show;
      end);
    finally
      TThread.Synchronize(nil,
      procedure
      begin
        TLoading.Hide;

      end)
    end;
  end).Start;

end;

procedure TfrmUsuario.lblSairClick(Sender: TObject);
begin
  FMsg.Show(TIconDialog.Question,
  'Confirme',
  'Confirme para sair do aplicativo',
  'Confirmar',
  procedure
  begin
    Application.Terminate;
  end,
  'Cancelar');

end;

procedure TfrmUsuario.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
