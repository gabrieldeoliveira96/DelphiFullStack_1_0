unit uNotificacao.View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniTimer, uniScrollBox, uniPanel,
  uniLabel;

type
  TfrNotificacao = class(TUniForm)
    UniTimer1: TUniTimer;
    sbNotificacao: TUniScrollBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
  private
    procedure CriarNotificacoes;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
   uniGUIApplication,  uPrincipal.Controller;

procedure TfrNotificacao.CriarNotificacoes;
begin
  var Controller := TControllerPrincipal.create;
  var model := Controller.getNotificacoes;
  try
     for var i := 0 to model.Items.Count -1 do
     begin
       var pnl := TuniPanel.Create(sbNotificacao);
       pnl.parent := sbNotificacao;
       pnl.Align := AlTop;
       pnl.Height := 80;
       pnl.color := clWhite;
       //pnl.BorderStyle := ubsNone;

       Var lblTitulo := TUniLabel.Create(pnl);
       lblTitulo.parent := pnl;
       lblTitulo.font.color :=  $00DA6777;
       lblTitulo.font.size := 12;
       lblTitulo.text := Model.Items[i].Titulo;
       lblTitulo.top := 2;
       lblTitulo.Left := 4;

       Var lblDescricao := TUniLabel.Create(pnl);
       lblDescricao.parent := pnl;
       lblDescricao.font.color :=  $00141414;
       lblDescricao.font.size := 10;
       lblDescricao.text := Model.Items[i].Descricao;
       lblDescricao.top := 18;
//       lblDescricao.Align := AlTop;
       lblDescricao.Left := 6;
     end;

  finally

  end;
end;

procedure TfrNotificacao.UniFormCreate(Sender: TObject);
begin
     self.left := trunc((screen.Width * 70) / 100);
     CriarNotificacoes;
end;

procedure TfrNotificacao.UniTimer1Timer(Sender: TObject);
begin
  var X  := mouse.CursorPos.X;
  var Y  := mouse.CursorPos.Y;
  if ((X < self.Left) or (Y > self.Height)) then
    Close;
end;

end.
