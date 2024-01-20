unit view.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, FMX.Skia,
  FMX.Layouts, FMX.Objects, uGosBase, uGosEdit, uGosStandard, uGosObjects,
  uGosEditTitle, uGosDrawerComponents, FMX.TabControl, FMX.Effects,
  uGosFmxStdCtrls, System.Actions, FMX.ActnList, FMX.Ani, uFancyDialog;

type
  TTipo = (tColaborador, tCliente);
  TfrmLogin = class(TForm)
    Layout1: TLayout;
    SkSvg1: TSkSvg;
    SkLabel1: TSkLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Line1: TLine;
    Layout4: TLayout;
    Layout5: TLayout;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    edtEmail: TGosEditView;
    edtSenha: TGosEditView;
    SkLabel2: TSkLabel;
    btnLogin: TGosButtonView;
    GosButtonView2: TGosButtonView;
    TabControl1: TTabControl;
    tabLogin: TTabItem;
    tabCadastroClienteColaborador: TTabItem;
    recbody: TRectangle;
    recCliente: TRectangle;
    Layout6: TLayout;
    SkSvg4: TSkSvg;
    SkLabel3: TSkLabel;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Line2: TLine;
    Layout8: TLayout;
    SkSvg5: TSkSvg;
    edtNomeCliente: TGosEditView;
    Layout9: TLayout;
    SkSvg6: TSkSvg;
    edtEmailCliente: TGosEditView;
    Layout10: TLayout;
    GosButtonView3: TGosButtonView;
    GosButtonView4: TGosButtonView;
    switch: TGosSwitch;
    Layout11: TLayout;
    GosRectangle1: TGosRectangle;
    ShadowEffect1: TShadowEffect;
    Layout12: TLayout;
    edtSenhaCliente: TGosEditView;
    Layout13: TLayout;
    edtSenhaValidacaoCliente: TGosEditView;
    Line3: TLine;
    Line4: TLine;
    SkSvg9: TSkSvg;
    SkSvg7: TSkSvg;
    SkSvg8: TSkSvg;
    ActionList1: TActionList;
    ctaLogin: TChangeTabAction;
    ctaCliente: TChangeTabAction;
    ctaColaborador: TChangeTabAction;
    recColaborador: TRectangle;
    Layout14: TLayout;
    SkSvg10: TSkSvg;
    Layout15: TLayout;
    SkLabel4: TSkLabel;
    GosRectangle2: TGosRectangle;
    ShadowEffect2: TShadowEffect;
    Layout16: TLayout;
    Rectangle4: TRectangle;
    Line5: TLine;
    Layout17: TLayout;
    SkSvg11: TSkSvg;
    edtNomeColaborador: TGosEditView;
    Layout18: TLayout;
    SkSvg12: TSkSvg;
    edtEmailCadastroColaborador: TGosEditView;
    Layout19: TLayout;
    edtCpfColaborador: TGosEditView;
    SkSvg13: TSkSvg;
    Layout20: TLayout;
    edtSenhaCadastroValidacaoColaborador: TGosEditView;
    SkSvg14: TSkSvg;
    SkSvg15: TSkSvg;
    Line6: TLine;
    Line7: TLine;
    Layout21: TLayout;
    GosButtonView5: TGosButtonView;
    GosButtonView6: TGosButtonView;
    Layout22: TLayout;
    edtSenhaCadastroColaborador: TGosEditView;
    SkSvg16: TSkSvg;
    Line8: TLine;
    tabDocumentos: TTabItem;
    floatCliente: TFloatAnimation;
    floatColaborador: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure GosButtonView2Click(Sender: TObject);
    procedure GosButtonView4Click(Sender: TObject);
    procedure GosButtonView3Click(Sender: TObject);
    procedure switchChange(Sender: TObject);
    procedure floatClienteFinish(Sender: TObject);
    procedure floatColaboradorFinish(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FMsg:TFancyDialog;
    FTipoCadastro: TTipo;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses view.principal, uLoading, uConnection, uUrl, System.JSON;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  LCon:TConnection;
begin

  TLoading.Show(self,'Aguarde');

  TThread.CreateAnonymousThread(
  procedure
  var
   LJo:TJSONObject;
   LResult:string;
  begin
    try
      LCon:= TConnection.Create;
      LJo:= TJSONObject.Create;

      LJo.AddPair('email',edtEmail.Text);
      LJo.AddPair('senha',edtSenha.Text);
      LCon.Post(UrlValidarLogin,[],LJo,LResult);

      if LResult.Equals('{}') then
      begin
        TThread.Synchronize(nil,
        procedure
        begin
          FMsg.Show(TIconDialog.Error,'Erro ao validar login','Usuário ou senha incorretos');
        end);

        exit;
      end;

      TThread.Synchronize(nil,
      procedure
      begin
        if not Assigned(frmPrincipal) then
          Application.CreateForm(TfrmPrincipal, frmPrincipal);
      end);

      frmPrincipal.CarregaTela;

      TThread.Synchronize(nil,
      procedure
      begin
        frmPrincipal.Show;
      end);


    finally

      TThread.Synchronize(nil,
      procedure
      begin
        FreeAndNil(LCon);
        FreeAndNil(LJo);
        TLoading.Hide;
      end);

    end;

  end).Start;

end;

procedure TfrmLogin.floatClienteFinish(Sender: TObject);
begin
  if not floatCliente.Inverse then
    recCliente.Visible:= false;
end;

procedure TfrmLogin.floatColaboradorFinish(Sender: TObject);
begin
  if floatColaborador.Inverse then
    recColaborador.Visible:= false;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition:= TTabPosition.None;
  TabControl1.ActiveTab:= tabLogin;
  recCliente.Visible:= true;
  recColaborador.Visible:= false;
  FMsg:= TFancyDialog.Create(self);
  FTipoCadastro:= tCliente;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FMsg);
end;

procedure TfrmLogin.GosButtonView2Click(Sender: TObject);
begin
  ctaCliente.Execute;
end;

procedure TfrmLogin.GosButtonView3Click(Sender: TObject);
var
 LCon:TConnection;
begin

  TLoading.Show(self,'Aguarde, enviando cadastro');

  TThread.CreateAnonymousThread(
  procedure
  var
    Ljo:TJSONObject;
    LResult:string;
  begin

    try
      LCon:= TConnection.Create;

      Ljo:= TJSONObject.Create;

      if FTipoCadastro = tCliente then
      begin

        Ljo.AddPair('nome', edtNomeCliente.Text);
        Ljo.AddPair('email', edtEmailCliente.Text);
        Ljo.AddPair('senha', edtSenhaCliente.Text);
        Ljo.AddPair('tipo_usuario', 'cliente');
        Ljo.AddPair('cpf', '');

      end;

      if FTipoCadastro = tColaborador then
      begin

        Ljo.AddPair('nome', edtNomeColaborador.Text);
        Ljo.AddPair('email', edtEmailCadastroColaborador.Text);
        Ljo.AddPair('senha', edtSenhaCadastroColaborador.Text);
        Ljo.AddPair('tipo_usuario', 'colaborador');
        Ljo.AddPair('cpf', edtCpfColaborador.Text);

      end;

      Ljo.AddPair('foto', '');

      if not LCon.Post(UrlCadastrarUsuario,[], Ljo, LResult) then
      begin
        FMsg.Show(TIconDialog.Error,'Erro ao cadastrar usuário','Tente novamente');
        exit;
      end;

      ctaLogin.Execute;

    finally

      TThread.Synchronize(nil,
      procedure
      begin

        FreeAndNil(LCon);
        FreeAndNil(Ljo);
        TLoading.Hide;


      end);

    end;

  end).Start;


end;

procedure TfrmLogin.GosButtonView4Click(Sender: TObject);
begin
  ctaLogin.Execute;
end;

procedure TfrmLogin.switchChange(Sender: TObject);
begin
  if recCliente.Visible then
  begin
    FTipoCadastro:= tColaborador;
    floatCliente.Inverse:= false;
    floatCliente.StartValue:= 1;
    floatCliente.StopValue:= 0;
    floatCliente.Duration:= 0.3;
    floatCliente.Start;

    recColaborador.Visible:= true;
    floatColaborador.Inverse:= false;
    floatColaborador.StartValue:= 0;
    floatColaborador.StopValue:= 1;
    floatColaborador.Duration:= 0.3;
    floatColaborador.Start;

    switch.Parent:= GosRectangle2;
    exit;
  end;

  if recColaborador.Visible then
  begin

    FTipoCadastro:= tCliente;
    recCliente.Visible:= true;
    floatCliente.Inverse:= true;
    floatCliente.Start;

    floatColaborador.Inverse:= true;
    floatColaborador.Start;

    switch.Parent:= GosRectangle1;

    exit;
  end;

end;

end.
