unit uFrLogin.view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uConstsHtml,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniLabel, uniButton, uniBitBtn,
  UniFSButton, uniEdit, UniFSEdit, frxSVGGraphic, uniImage, Vcl.Imaging.pngimage,
  uniScreenMask, uniScrollBox, uniPanel, uniGUIForm;

type
  TFrLogin = class(TUniFrame)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edtUsrLogin: TUniFSEdit;
    edtSenhaLogin: TUniFSEdit;
    btnLogin: TUniFSButton;
    btnNovoUsuario: TUniFSButton;
    UniImage1: TUniImage;
    UniImage2: TUniImage;
    UniLabel3: TUniLabel;
    UniScreenMask1: TUniScreenMask;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnNovoUsuarioClick(Sender: TObject);
  private
  public
    //MainController: TMainController;
  end;

implementation

{$R *.dfm}

uses uLogin.Controller, uHelpersFrames;

procedure TFrLogin.btnLoginClick(Sender: TObject);
begin
  if Trim(edtUsrLogin.Text).IsEmpty then
    raise Exception.Create('Informar o E-mail do usuário para logar!');

  if Trim(edtSenhaLogin.Text).IsEmpty then
    raise Exception.Create('Informar a senha do usuário para logar!');

  var Controller: TLoginController := TLoginController.Create;
  try
    if Controller.ValidarLogin(edtUsrLogin.Text, edtSenhaLogin.Text) then
      Controller.getTelaPrincipal(Self)
    else
      UniSession.Alert('Usuário ou senha informados, é invalido!');
    finally
      FreeAndNil(Controller);
    end;
end;

procedure TFrLogin.btnNovoUsuarioClick(Sender: TObject);
begin
 var controller: TLoginController  := TLoginController.Create;
  try
    Self.Hide;
    controller.getTelaCadastroNovoUsuarioLogin(Self, Self.Parent);
  finally
    FreeAndNil(controller);
  end;
end;

procedure TFrLogin.UniFrameCreate(Sender: TObject);
begin
   UniLabel1.Text := DivHtmlLogin
                                  .Replace('[wdt]', (self.Width  - 30).ToString)
                                  .Replace('[hgh]', (self.Height - 200).ToString);

   self.CentralizaTela;
end;

end.
