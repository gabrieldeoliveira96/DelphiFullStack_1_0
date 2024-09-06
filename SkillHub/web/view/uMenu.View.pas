unit uMenu.View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniLabel,
  Vcl.Imaging.pngimage, uniImage, UniFSToggle, uniTimer, uniImageList,
  uniThreadTimer, uniMemo, uPrivacidade.Model;

type
  TfrMenuLateral = class(TUniForm)
    UniPanel1: TUniPanel;
    pnlDadosConta: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    lblNome: TUniLabel;
    LblCpf: TUniLabel;
    lblEmail: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    pnlHeadPrivacidade: TUniPanel;
    PnlPrivacidade: TUniPanel;
    UniLabel9: TUniLabel;
    UniLabel12: TUniLabel;
    UniImage1: TUniImage;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    tgDados: TUniFSToggle;
    tgAcesso: TUniFSToggle;
    tgPerfil: TUniFSToggle;
    TgNotif: TUniFSToggle;
    TgConta: TUniFSToggle;
    TgCompDados: TUniFSToggle;
    pnlBottom: TUniPanel;
    UniLabel21: TUniLabel;
    UniImage2: TUniImage;
    UniImageList1: TUniImageList;
    lblTipoConta: TUniLabel;
    UniTimer1: TUniTimer;
    procedure UniPanel1Click(Sender: TObject);
    procedure pnlHeadPrivacidadeClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniLabel21Click(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure UniLabel4Click(Sender: TObject);
    procedure PromptCallback(Sender: TComponent; AResult: integer; Atext:string);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDeveFecharTela: boolean;
    FCodUsuario: string;
    procedure PreencherDadosUsuario;
    procedure PreencherDadosPrivacidade;
    procedure AtualizaPrivacidade;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses uPrincipal.Controller, uLogin.Controller, uPrivacidade.Controller,
StrUtils;

procedure TfrMenuLateral.UniFormClose(Sender: TObject;  var Action: TCloseAction);
begin
   AtualizaPrivacidade;
end;

procedure TfrMenuLateral.UniFormCreate(Sender: TObject);
begin
  for var I := 0 to ComponentCount -1 do
  begin
    if Components[i] is TUniFSToggle then
    begin
       TUniFSToggle(Components[i]).TitleOn  := '';
       TUniFSToggle(Components[i]).TitleOff := '';
    end;
  end;
  FDeveFecharTela := true;
end;

procedure TfrMenuLateral.UniFormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_ESCAPE then
    close;
end;

procedure TfrMenuLateral.UniFormShow(Sender: TObject);
begin
  self.left := trunc((screen.Width * 70) / 100);
  PreencherDadosUsuario;
  PreencherDadosPrivacidade;
end;

procedure TfrMenuLateral.PreencherDadosPrivacidade;
begin
  var Controller := TPrivacidadeController.Create;
  try
    var Model := Controller.ObterPrivacidadeUsuario(FCodUsuario);
    tgDados.Toggled :=  Model.Dados  = 'S';
    tgAcesso.Toggled := Model.Acesso = 'S';
    tgPerfil.Toggled := Model.Perfil = 'S';
    TgNotif.Toggled :=  Model.Notificacoes = 'S';
    TgConta.Toggled :=  Model.Conta = 'S';
    TgCompDados.Toggled := Model.CompartilhamentoDados = 'S';
  finally
     Controller.Free;
  end;
end;

procedure TfrMenuLateral.AtualizaPrivacidade;
begin
  var Controller := TPrivacidadeController.Create;
  var Model      := TPrivacidadeModel.Create;
  try
      Model.CodUser               :=  FCodUsuario.ToInteger;
      Model.Dados                 :=  ifthen(tgDados.Toggled,'S','N');
      Model.Acesso                :=  ifthen(tgAcesso.Toggled,'S','N');
      Model.Perfil                :=  ifthen(tgPerfil.Toggled,'S','N');
      Model.Notificacoes          :=  ifthen(TgNotif.Toggled,'S','N');
      Model.Conta                 :=  ifthen(TgConta.Toggled,'S','N');
      Model.CompartilhamentoDados :=  ifthen(TgCompDados.Toggled,'S','N');
      Controller.SalvarPrivacidadeUsuario(Model);
  finally
     Model.Free;
     Controller.Free;
  end;
end;

procedure TfrMenuLateral.PreencherDadosUsuario;
begin
 var controller := TControllerPrincipal.Create;
 try
    var model := controller.getDadosUsuarioLogado;
    lblNome.text  :=  model.Nome;
    LblCpf.Text   :=  model.Cpf;
    lblEmail.text :=  model.Email;
    FCodUsuario   :=  model.Cod;
    lblTipoConta.Text := 'Conta '+ model.TipoUsuario;
 finally
   controller.Free;
 end;
end;

procedure TfrMenuLateral.PromptCallback(Sender: TComponent; AResult: integer; Atext: string);
begin
  if AResult = mrOK then
  begin
    var controller := TLoginController.Create;
    try
      if controller.AlterarSenha(FCodUsuario, Atext) then
        ShowMessage('Senha alterada com sucesso!')
      else
        ShowMessage('Erro ao alterar a senha!');

    finally
        FDeveFecharTela := true;
       controller.Free;
    end;
  end;
end;

procedure TfrMenuLateral.UniLabel21Click(Sender: TObject);
begin
   UniApplication.Restart;
end;

procedure TfrMenuLateral.UniLabel4Click(Sender: TObject);
begin
  FDeveFecharTela := false;
  Prompt('Informe a nova senha:', '', MtInformation, MBokCancel, PromptCallback);
end;

procedure TfrMenuLateral.UniPanel1Click(Sender: TObject);
begin
   pnlDadosConta.Collapsed := not pnlDadosConta.Collapsed;
   pnlPrivacidade.Collapsed := true;
   if pnlDadosConta.Collapsed then
   begin
      pnlHeadPrivacidade.top  := pnlDadosConta.Top+51;
      pnlPrivacidade.Top      := pnlDadosConta.Top+65;
      pnlDadosConta.Height    := 0;
      self.Height := 173;
   end else
   begin
      pnlHeadPrivacidade.top  :=  308;
      pnlPrivacidade.Top      :=  320;
      pnlDadosConta.Height    :=  304;
      self.Height := 500;
   end;
end;

procedure TfrMenuLateral.UniTimer1Timer(Sender: TObject);
begin
  var X  := mouse.CursorPos.X;
  var Y  := mouse.CursorPos.Y;
   if ((X < self.Left) or (Y > self.Height)) and (FDeveFecharTela) then
     Close;
end;

procedure TfrMenuLateral.pnlHeadPrivacidadeClick(Sender: TObject);
begin
   if not pnlDadosConta.Collapsed then
     UniPanel1Click(sender);

   pnlPrivacidade.Collapsed := not pnlPrivacidade.Collapsed;

   if not pnlPrivacidade.Collapsed then
   begin
     pnlPrivacidade.Height := 333;
     self.Height := 500;
   end
   else
   begin
     pnlPrivacidade.Height := 0;
     self.Height := 173;
   end;
end;

end.
