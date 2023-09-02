unit view.splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia,
  FMX.Layouts, FMX.Skia, FMX.Ani;

type
  TfrmSplash = class(TForm)
    imgPadrao: TSkSvg;
    SkLabel1: TSkLabel;
    Layout1: TLayout;
    imgPiscando: TSkSvg;
    FloatWith: TFloatAnimation;
    FloatHeight: TFloatAnimation;
    procedure imgPadraoClick(Sender: TObject);
    procedure FloatHeightFinish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

uses
  view.login;

{$R *.fmx}

procedure TfrmSplash.FloatHeightFinish(Sender: TObject);
begin
  if not Assigned(frmlogin) then
    Application.CreateForm(TfrmLogin,frmLogin);
  frmLogin.show;

end;

procedure TfrmSplash.imgPadraoClick(Sender: TObject);
begin
  imgPadrao.Visible:= false;
  imgPiscando.Visible:= true;

  FloatWith.StartValue:= 150;
  FloatWith.StopValue:= 300;
  FloatWith.Start;

  FloatHeight.StartValue:= 250;
  FloatHeight.StopValue:= 500;
  FloatHeight.Start;

end;

end.
