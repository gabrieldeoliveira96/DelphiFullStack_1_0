unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Menus, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Layouts, uGosAguardeBallon,
  FMX.Effects, uGosStandard, FMX.Edit, FMX.Objects, uGosObjects, uGosBase,
  uGosEdit, uGosAguardeText, FMX.TabControl, uGosDrawerButtons,
  uGosDrawerComponents, uGosEditTitle, uGosMessage, uGosQrCode, uGosToast_v2,
  uGosToast_v1, uGosLoadButton;

type
  TForm1 = class(TForm)
    GosEditView1: TGosEditView;
    GosRectangle1: TGosRectangle;
    Edit1: TEdit;
    GosTextView1: TGosTextView;
    GosButtonView1: TGosButtonView;
    Button1: TButton;
    ShadowEffect1: TShadowEffect;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Button2: TButton;
    GosAguardeBallon1: TGosAguardeBallon;
    TabItem3: TTabItem;
    Button3: TButton;
    GosAguardeText1: TGosAguardeText;
    TabItem4: TTabItem;
    GosDrawerButtons1: TGosDrawerButtons;
    Button4: TButton;
    TabItem5: TTabItem;
    GosDrawerComponents1: TGosDrawerComponents;
    GosRectangle2: TGosRectangle;
    Button5: TButton;
    Label1: TLabel;
    GosEditView2: TGosEditView;
    TabItem6: TTabItem;
    GosEditTitle1: TGosEditTitle;
    GosEditTitle2: TGosEditTitle;
    TabItem7: TTabItem;
    Button6: TButton;
    GosMessage1: TGosMessage;
    TabItem8: TTabItem;
    Button7: TButton;
    GosQrCode1: TGosQrCode;
    TabItem9: TTabItem;
    GosToast_v1: TGosToast_v1;
    GosToast_v2: TGosToast_v2;
    Button8: TButton;
    TabItem10: TTabItem;
    GosLoadButton1: TGosLoadButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure GosLoadButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  GosAguardeBallon1.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   GosAguardeBallon1.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  GosAguardeText1.Mensagem:= 'Aguarde, Processando informações';
  GosAguardeText1.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  GosDrawerButtons1.Show;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  GosDrawerComponents1.Show;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  GosMessage1.Show(TIconDialog.Success, 'Sucesso','Cadastro finalizado',
  'Ok',
  procedure
  begin
    ShowMessage('Metodo anonimo');
  end,
  'Sair',
  procedure
  begin
    ShowMessage('Sair');
  end);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  GosQrCode1.Menssage:= 'Olá';
  GosQrCode1.Show;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
//  GosToast_v1.Menssage:= 'Toast V1';
//  GosToast_v1.Show;

//  GosToast_v2.Mensagem:= 'Toast V2';
  GosToast_v2.Show;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  GosLoadButton1.Start;
end;

procedure TForm1.GosLoadButton1Click(Sender: TObject);
begin
  GosLoadButton1.Text:= 'Salvar';
  GosLoadButton1.Start;
  Tthread.CreateAnonymousThread(
  procedure
  begin
    sleep(3000);

    TThread.Synchronize(nil,
    procedure
    begin

      GosLoadButton1.Stop;
    end);

  end).Start;
end;

end.
