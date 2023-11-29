unit view.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, FMX.Skia,
  FMX.Layouts, FMX.Objects, uGosBase, uGosEdit, uGosStandard, uGosObjects,
  uGosEditTitle, uGosDrawerComponents, FMX.TabControl, FMX.Effects,
  uGosFmxStdCtrls, System.Actions, FMX.ActnList, FMX.Ani;

type
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
    GosEditView1: TGosEditView;
    GosEditView2: TGosEditView;
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
    GosEditView3: TGosEditView;
    Layout9: TLayout;
    SkSvg6: TSkSvg;
    GosEditView4: TGosEditView;
    Layout10: TLayout;
    GosButtonView3: TGosButtonView;
    GosButtonView4: TGosButtonView;
    switch: TGosSwitch;
    Layout11: TLayout;
    GosRectangle1: TGosRectangle;
    ShadowEffect1: TShadowEffect;
    Layout12: TLayout;
    GosEditView5: TGosEditView;
    Layout13: TLayout;
    GosEditView6: TGosEditView;
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
    GosEditView7: TGosEditView;
    Layout18: TLayout;
    SkSvg12: TSkSvg;
    GosEditView8: TGosEditView;
    Layout19: TLayout;
    edtCpf: TGosEditView;
    SkSvg13: TSkSvg;
    Layout20: TLayout;
    GosEditView10: TGosEditView;
    SkSvg14: TSkSvg;
    SkSvg15: TSkSvg;
    Line6: TLine;
    Line7: TLine;
    Layout21: TLayout;
    GosButtonView5: TGosButtonView;
    GosButtonView6: TGosButtonView;
    Layout22: TLayout;
    GosEditView11: TGosEditView;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses view.principal;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin

  //mensagem de aguarde
  TThread.CreateAnonymousThread(
  procedure
  begin
    try
      TThread.Synchronize(nil,
      procedure
      begin
        if not Assigned(frmPrincipal) then
          Application.CreateForm(TfrmPrincipal, frmPrincipal);
      end);

      //CarreTela - processo de consultas para abertura da tela principal

      TThread.Synchronize(nil,
      procedure
      begin
        frmPrincipal.Show;
      end);


    finally

      TThread.Synchronize(nil,
      procedure
      begin
       //finalizo o aguarde
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
end;

procedure TfrmLogin.GosButtonView2Click(Sender: TObject);
begin
  ctaCliente.Execute;
end;

procedure TfrmLogin.GosButtonView3Click(Sender: TObject);
begin
  ctaLogin.Execute;
end;

procedure TfrmLogin.GosButtonView4Click(Sender: TObject);
begin
  ctaLogin.Execute;
end;

procedure TfrmLogin.switchChange(Sender: TObject);
begin
  if recCliente.Visible then
  begin
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
