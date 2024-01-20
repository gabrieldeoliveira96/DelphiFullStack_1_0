unit view.pesquisa.servico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uGosBase,
  uGosEdit, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.Filter.Effects,
  FMX.Controls.Presentation, FMX.StdCtrls, frame.Servico,
  System.Generics.Collections;

type
  TfrmPesquisaServico = class(TForm)
    layoutTopo: TLayout;
    Rectangle1: TRectangle;
    GosEditView1: TGosEditView;
    Layout2: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    LayoutBody: TLayout;
    VertScrollBox1: TVertScrollBox;
    btnPesquisa: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    FListServico: TObjectList<TframeServico>;
    procedure BuscarUltimosTresPedidos;
    procedure BuscaServico;
    procedure ExibeServico(AQtdUltimosPedidos: integer = -1);
  public
    { Public declarations }
    procedure CarregaTela;
  end;

var
  frmPesquisaServico: TfrmPesquisaServico;

implementation

{$R *.fmx}

uses model.servico, controller.imagens;

{ TForm1 }

procedure TfrmPesquisaServico.btnPesquisaClick(Sender: TObject);
begin
  FListServico.Clear;

  if btnPesquisa.Tag = 0 then
  begin
    BuscaServico;
    btnPesquisa.StyleLookup:= 'stoptoolbuttonbordered';
    btnPesquisa.Tag:= 1;
    exit;
  end;

  if btnPesquisa.Tag = 1 then
  begin
    BuscarUltimosTresPedidos;
    GosEditView1.Text:= EmptyStr;
    btnPesquisa.StyleLookup:= 'searchtoolbuttonbordered';
    btnPesquisa.Tag:= 0;
    exit;
  end;


end;

procedure TfrmPesquisaServico.BuscarUltimosTresPedidos;
begin


  ExibeServico(3);

end;

procedure TfrmPesquisaServico.BuscaServico;
begin

  try


    dmServico.memServico.Filtered:= true;

    dmServico.memServico.Filter:= 'TITULO like ''%'+GosEditView1.Text+'%''';

    ExibeServico;

  finally

    dmServico.memServico.Filtered:= false;
  end;


end;

procedure TfrmPesquisaServico.CarregaTela;
begin
  BuscarUltimosTresPedidos;
end;

procedure TfrmPesquisaServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmPesquisaServico:= nil;
end;

procedure TfrmPesquisaServico.FormCreate(Sender: TObject);
begin
  FListServico:= TObjectList<TframeServico>.Create;
end;

procedure TfrmPesquisaServico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListServico);
end;

procedure TfrmPesquisaServico.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPesquisaServico.ExibeServico(AQtdUltimosPedidos: integer = -1);
var
 LFrame:TframeServico;
 LBitmap:TBitmap;
 LCount:integer;
begin

  LCount:= 0;

  TThread.Synchronize(nil,
  procedure
  begin
     VertScrollBox1.BeginUpdate;
  end);

  dmServico.memServico.First;
  while not dmServico.memServico.Eof do
  begin


    if LCount = AQtdUltimosPedidos then
      break;

    Inc(LCount);

    LFrame:= TframeServico.Create(self);
    LFrame.Align:= TAlignLayout.Top;
    LFrame.Margins.Left:= 16;
    LFrame.Margins.Right:= 16;
    LFrame.Margins.Top:= 16;
    LFrame.Name:= 'Frame_'+
      dmServico.memServicoCOD.AsString+
      Random(378472).ToString+
      FormatDateTime('hhmmsszzz',now);

    LFrame.lblTexto.Text:= dmServico.memServicoTITULO.AsString;
    LFrame.lblkm.Text:= dmServico.memServicokm.AsString  + ' km';
    LFrame.Tag := dmServico.memServicocod.AsInteger;
    LFrame.TagString := dmServico.memServicosubcategoria.AsString;

    LBitmap:= controller.imagens.BitmapFromBase64(dmServico.memServicofoto.AsString);
    LFrame.recImg.Fill.Bitmap.Bitmap:= LBitmap;

    VertScrollBox1.AddObject(LFrame);
    FListServico.Add(LFrame);

    dmServico.memServico.Next;
  end;

  TThread.Synchronize(nil,
  procedure
  begin
    VertScrollBox1.EndUpdate;
  end);



end;


end.
