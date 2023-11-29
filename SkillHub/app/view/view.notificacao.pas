unit view.notificacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.Layouts, frame.notificacao;

type
  TfrmNotificacao = class(TForm)
    LayoutTopo: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    LayoutBody: TLayout;
    VertScrollBox1: TVertScrollBox;
    FrameNotificacao1: TFrameNotificacao;
    FrameNotificacao2: TFrameNotificacao;
    FrameNotificacao3: TFrameNotificacao;
    FrameNotificacao4: TFrameNotificacao;
    FrameNotificacao5: TFrameNotificacao;
    FrameNotificacao6: TFrameNotificacao;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotificacao: TfrmNotificacao;

implementation

{$R *.fmx}

procedure TfrmNotificacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmNotificacao:= nil;
end;

procedure TfrmNotificacao.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
