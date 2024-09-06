unit uCadastroUsuarioLogin.View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniImageList, uniButton,
  uniBitBtn, UniFSButton, uniPanel, uniPageControl, uniMenuButton,
  UniFSMenuButton, uniEdit, UniFSEdit, UniFSToggle, uniLabel, uniImage,
  Vcl.Imaging.pngimage, uniTimer, System.StrUtils;

type
  TFrCadUsuarioLogin = class(TUniFrame)
    pgCadastro: TUniPageControl;
    UniImageList1: TUniImageList;
    pgUsuario: TUniTabSheet;
    pgColaborador: TUniTabSheet;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    LblPanelCliente: TUniLabel;
    UniImage2: TUniImage;
    UniImage3: TUniImage;
    UniImage4: TUniImage;
    edtUsuNome: TUniFSEdit;
    edtusuEmail: TUniFSEdit;
    edtUsuSenha: TUniFSEdit;
    edtUsuRepetirSenha: TUniFSEdit;
    btnLogin: TUniFSButton;
    btnNovoUsuario: TUniFSButton;
    UniImage6: TUniImage;
    UniLabel2: TUniLabel;
    LblPanelColaborador: TUniLabel;
    tgUsuario: TUniFSToggle;
    tgColaborador: TUniFSToggle;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniImage5: TUniImage;
    edtColName: TUniFSEdit;
    edtColEmail: TUniFSEdit;
    UniImage8: TUniImage;
    edtColSenha: TUniFSEdit;
    edtColRepetirSenha: TUniFSEdit;
    edtCPF_CNPJ: TUniFSEdit;
    UniFSButton1: TUniFSButton;
    UniFSButton2: TUniFSButton;
    UniPanel3: TUniPanel;
    tmrOnShow: TUniTimer;
    UniImage11: TUniImage;
    UniImage7: TUniImage;
    UniImage9: TUniImage;
    UniImage10: TUniImage;
    UniImage12: TUniImage;
    UniImage13: TUniImage;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnNovoUsuarioClick(Sender: TObject);
    procedure tgUsuarioToggled(const Value: Boolean);
    procedure btnLoginClick(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    procedure CadastrarNovoUsuario;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uHelpersFrames, uConstsHtml, uLogin.Controller;

procedure TFrCadUsuarioLogin.btnLoginClick(Sender: TObject);
begin
  CadastrarNovoUsuario;
end;

procedure TfrCadUsuarioLogin.CadastrarNovoUsuario;
begin
  var Controller : TLoginController := TLoginController.create;
  try
    var TipoUsuario:String :='';
    var Email: string := '';
    var Senha: string := '';
    var Cpf: string := '';
    var Foto: string := '';
    var Nome: string := '';

    if pgCadastro.ActivePage = pgColaborador then
    begin
      Email := edtColEmail.Text;
      Senha := edtColSenha.Text;
      Cpf   := edtCPF_CNPJ.text;
      Nome  := edtColName.Text;
      TipoUsuario := 'colaborador';
      foto  := '*';
      if senha <> edtColRepetirSenha.text  then
      begin
        UniSession.Alert('Informe a mesma senha no campo, "Repetir Senha"');
        Exit;
      end;
    end else
    begin
      Email := edtUsuEmail.Text;
      Senha := edtUsuSenha.Text;
      Nome  := edtUsuNome.Text;
      TipoUsuario := 'cliente';
      Cpf   := '*';
      foto  := '*';

      if senha <> edtColRepetirSenha.text  then
      begin
        UniSession.Alert('Informe a mesma senha no campo, "Repetir Senha"');
        Exit;
      end;
    end;

    if (Email.trim.IsEmpty) or (Senha.Trim.IsEmpty) or (Nome.Trim.IsEmpty) then
    begin
      UniSession.Alert('Dados obrigatorios não preenchidos, revisar:'+#13#13 + 'Nome, Senha e Email');
      exit;
    end;

    if Controller.CadastrarNovoUsuario(Email, Senha, Nome, TipoUsuario, Cpf, Foto) then
      UniSession.Alert('Usuário Cadastrado com sucesso!')
    else
      UniSession.Alert('Erro ao cadastrar novo usuário!');
  finally
    FreeAndNil(Controller);
  end;
end;

procedure TFrCadUsuarioLogin.btnNovoUsuarioClick(Sender: TObject);
begin
  TUniFrame(Self.Owner).Show;
  FreeAndNil(Self);
end;

procedure TFrCadUsuarioLogin.tgUsuarioToggled(const Value: Boolean);
begin
  if Value then
  begin
    pgCadastro.ActivePage := pgColaborador;
    tgColaborador.Toggled := value;
  end else
  begin
    pgCadastro.ActivePage := pgUsuario;
    tgUsuario.Toggled := value;
  end;
end;

procedure TFrCadUsuarioLogin.UniFrameCreate(Sender: TObject);
begin
  LblPanelColaborador.text := DivHtmlLogin
                                  .Replace('[wdt]', (self.Width  - 30).ToString)
                                  .Replace('[hgh]', (self.Height - 310).ToString);

  LblPanelCliente.text := DivHtmlLogin
                                  .Replace('[wdt]', (self.Width  - 30).ToString)
                                  .Replace('[hgh]', (self.Height - 340).ToString);

  Self.CentralizaTela;
  pgCadastro.ActivePage := pgUsuario;
  tgUsuario.TitleOn      := '';
  tgUsuario.TitleOff     := '';
  tgColaborador.TitleOn  := '';
  tgColaborador.TitleOff := '';
end;

procedure TFrCadUsuarioLogin.UniFrameReady(Sender: TObject);
procedure AjustarCss(JsId: String);
begin
  UniSession.JSCode(ModificaCssBordaElementos.Replace('[JSID]',JsId));
end;
begin
  for var i: integer := 0 to Self.ComponentCount -1 do
  begin
    if Components[i] is TUniPanel then
        AjustarCss(TUniPanel(Components[i]).JSId);

    if Components[i] is TUniPageControl then
        AjustarCss(TUniPageControl(Components[i]).JSId);

    if Components[i] is TUniTabSheet then
        AjustarCss(TUniTabSheet(Components[i]).JSId);
  end;
   AjustarCss( self.JSID(UniPanel3.JSId));
end;

procedure TFrCadUsuarioLogin.UniFSButton1Click(Sender: TObject);
begin
   CadastrarNovoUsuario;
end;

end.
