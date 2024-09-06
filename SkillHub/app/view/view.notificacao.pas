unit view.notificacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.Layouts, frame.notificacao, uFancyDialog, System.JSON;

type
  TfrmNotificacao = class(TForm)
    LayoutTopo: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    LayoutBody: TLayout;
    VertScrollBox1: TVertScrollBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FMsg:TFancyDialog;
  public
    { Public declarations }
    procedure CarregaTela(AtipoUsuario:integer);
  end;

var
  frmNotificacao: TfrmNotificacao;

implementation

{$R *.fmx}

uses uConnection, uUrl;

procedure TfrmNotificacao.CarregaTela(AtipoUsuario:integer);
var
 LCon:TConnection;
 LResult:string;
 LJa:TJSONArray;
 LFrame:TFrameNotificacao;
begin

  try
    LCon:= TConnection.Create;
    if not LCon.Get(UrlObterNotificacao,[AtipoUsuario.ToString],LResult) then
    begin
      FMsg.Show(TIconDialog.Error,'Aviso','Erro a buscar nova notificação');
      exit;
    end;

    LJa:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;

    for var LJo in LJa do
    begin
      LFrame:= TFrameNotificacao.Create(self);
      LFrame.Name:= 'Frame_'+
        LJo.GetValue<string>('cod')+
        FormatDateTime('hhmmsszzz',now);
      LFrame.Align:= TAlignLayout.Top;

      LFrame.SkLabel1.Text:= LJo.GetValue<string>('titulo');
      LFrame.SkLabel2.Text:= LJo.GetValue<string>('descricao');

      VertScrollBox1.AddObject(LFrame);

    end;

  finally
    FreeAndNil(LCon);
  end;


end;

procedure TfrmNotificacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmNotificacao:= nil;
end;

procedure TfrmNotificacao.FormCreate(Sender: TObject);
begin
  FMsg:= TFancyDialog.Create(self);
end;

procedure TfrmNotificacao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FMsg);
end;

procedure TfrmNotificacao.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
