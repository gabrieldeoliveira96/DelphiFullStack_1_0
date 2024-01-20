unit view.filtro.categoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Effects, FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Objects, frame.servico, System.JSON, System.Generics.Collections,
  frame.subcategoria;

type
  TTipoFiltro = (ReformasEReparos, ServicosDomesticos, DesignETecnologia,
  Assitencia, Consultoria, Veiculo);

  TfrmFiltroCategoria = class(TForm)
    LayoutTopo: TLayout;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    Layout1: TLayout;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    btnPesquisa: TSpeedButton;
    FillRGBEffect2: TFillRGBEffect;
    Layout2: TLayout;
    LayoutCategoria: TLayout;
    VertScrollBox1: TVertScrollBox;
    LayoutFiltros: TLayout;
    Rectangle1: TRectangle;
    CheckBox1: TCheckBox;
    Layout3: TLayout;
    StyleBook1: TStyleBook;
    ShadowEffect1: TShadowEffect;
    Layout4: TLayout;
    SkLabel4: TSkLabel;
    Layout5: TLayout;
    CheckBox2: TCheckBox;
    ShadowEffect2: TShadowEffect;
    SkLabel5: TSkLabel;
    Layout6: TLayout;
    CheckBox3: TCheckBox;
    ShadowEffect3: TShadowEffect;
    SkLabel6: TSkLabel;
    Layout7: TLayout;
    CheckBox4: TCheckBox;
    ShadowEffect4: TShadowEffect;
    SkLabel7: TSkLabel;
    Layout8: TLayout;
    CheckBox5: TCheckBox;
    ShadowEffect5: TShadowEffect;
    SkLabel8: TSkLabel;
    Layout9: TLayout;
    CheckBox6: TCheckBox;
    ShadowEffect6: TShadowEffect;
    SkLabel9: TSkLabel;
    Layout10: TLayout;
    CheckBox7: TCheckBox;
    ShadowEffect7: TShadowEffect;
    SkLabel10: TSkLabel;
    frameServico1: TframeServico;
    frameServico2: TframeServico;
    frameServico3: TframeServico;
    frameServico4: TframeServico;
    frameServico5: TframeServico;
    VertScrollBox2: TVertScrollBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCod:integer;
    FListCategoria: TObjectList<TframeServico>;
    FListCheckSubCategoria: TObjectList<TframeSubCategoria>;
    procedure CarregaServico(ACategoria:integer);
    procedure CarregaSubCategoria(ACategoria: integer);
    procedure FiltraCategoria(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela(AFiltro:TTipoFiltro; ASvg, AText:string; ACod:integer);
  end;

var
  frmFiltroCategoria: TfrmFiltroCategoria;

implementation

{$R *.fmx}

uses view.pesquisa.servico, uConnection, uUrl, controller.imagens;

procedure TfrmFiltroCategoria.btnPesquisaClick(Sender: TObject);
begin

  if not Assigned(frmPesquisaServico) then
    application.CreateForm(TfrmPesquisaServico, frmPesquisaServico);

  frmPesquisaServico.CarregaTela;
  frmPesquisaServico.Show;

end;

procedure TfrmFiltroCategoria.CarregaTela(AFiltro:TTipoFiltro; ASvg, AText:string; ACod:integer);
var
 LRectFiltro:TRectangle;
 LSvg:TSkSvg;
 LLabel:TSkLabel;
begin
  FCod:= ACod;

  LRectFiltro:= TRectangle.Create(self);
  LRectFiltro.Height:= 124;
  LRectFiltro.Width:= 100;
  LRectFiltro.XRadius:= 25;
  LRectFiltro.YRadius:= 25;
  LRectFiltro.Align:= TAlignLayout.Center;
  LRectFiltro.Fill.Color:= $FF7767DA;
  LRectFiltro.Stroke.Kind:= TBrushKind.None;

  LSvg:= TSkSvg.Create(self);
  LSvg.Svg.Source:= ASvg;
  LSvg.Align:= TAlignLayout.Client;
  LSvg.Margins.Top:= 8;
  LSvg.Margins.Left:= 8;
  LSvg.Margins.Right:= 8;
  LSvg.Margins.Bottom:= 8;
  LSvg.Svg.OverrideColor:= TAlphaColors.White;

  LLabel:= TSkLabel.Create(self);
  LLabel.Text:= AText;
  LLabel.Align:= TAlignLayout.Bottom;
  LLabel.TextSettings.Font.Weight:= TFontWeight.Semibold;
  LLabel.TextSettings.FontColor:= TAlphaColors.White;
  LLabel.TextSettings.HorzAlign:= TSkTextHorzAlign.Center;
  LLabel.Margins.Bottom:= 16;

  LRectFiltro.AddObject(LSvg);
  LRectFiltro.AddObject(LLabel);

  LayoutCategoria.AddObject(LRectFiltro);

  CarregaServico(FCod);
  CarregaSubCategoria(FCod);

  case AFiltro of
    ReformasEReparos: ;
    ServicosDomesticos: ;
    DesignETecnologia: ;
    Assitencia: ;
    Consultoria: ;
    Veiculo: ;
  end;
end;

procedure TfrmFiltroCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  frmFiltroCategoria:= nil;
end;

procedure TfrmFiltroCategoria.FormCreate(Sender: TObject);
begin
  FListCategoria:= TObjectList<TframeServico>.Create;
  FListCheckSubCategoria:= TObjectList<TframeSubCategoria>.Create;
end;

procedure TfrmFiltroCategoria.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListCategoria);
  FreeAndNil(FListCheckSubCategoria);
end;

procedure TfrmFiltroCategoria.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmFiltroCategoria.CarregaServico(ACategoria:integer);
var
 LCon:TConnection;
 LResult:string;
 LJa:TJSONArray;
 LFrame:TframeServico;
 LBitmap:TBitmap;
 LHeader:TParameter;
 LList:TList<TParameter>;
begin

  try
    LList:= TList<TParameter>.Create;
    LHeader.key:= 'categoria';
    LHeader.Value:= ACategoria.ToString;

    LList.Add(LHeader);

    LCon:= TConnection.Create;
    if not LCon.Get(UrlListaServico,LList,LResult) then
      exit;

    LJa:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;

    TThread.Synchronize(nil,
    procedure
    begin
       VertScrollBox1.BeginUpdate;
    end);

    for var Ljv in LJa do
    begin

      LFrame:= TframeServico.Create(self);
      LFrame.Align:= TAlignLayout.Top;
      LFrame.Margins.Left:= 16;
      LFrame.Margins.Right:= 16;
      LFrame.Margins.Top:= 16;
      LFrame.Name:= 'Frame_'+ Ljv.GetValue<string>('cod')+FormatDateTime('hhmmsszzz',now);

      LFrame.lblTexto.Text:= Ljv.GetValue<string>('titulo');
      LFrame.lblkm.Text:= Ljv.GetValue<string>('km') + ' km';
      LFrame.Tag := Ljv.GetValue<integer>('cod');
      LFrame.TagString := Ljv.GetValue<string>('subcategoria');

      LBitmap:= controller.imagens.BitmapFromBase64(Ljv.GetValue<string>('foto'));
      LFrame.recImg.Fill.Bitmap.Bitmap:= LBitmap;

      VertScrollBox1.AddObject(LFrame);
      FListCategoria.Add(LFrame);

    end;

    TThread.Synchronize(nil,
    procedure
    begin
      VertScrollBox1.EndUpdate;
    end);


  finally
    FreeAndNil(LCon);
    FreeAndNil(LList);
  end;
end;

procedure TfrmFiltroCategoria.CarregaSubCategoria(ACategoria:integer);
var
 LCon:TConnection;
 LResult:string;
 LJa:TJSONArray;
 LFrame:TframeSubCategoria;
 LHeight:single;
begin

  try
    LCon:= TConnection.Create;
    if not LCon.Get(UrlListaSubCategoria,[ACategoria.ToString],LResult) then
      exit;

    LJa:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;

    TThread.Synchronize(nil,
    procedure
    begin
       VertScrollBox2.BeginUpdate;
    end);

    LHeight:= 0;
    for var Ljv in LJa do
    begin

      LFrame:= TframeSubCategoria.Create(self);
      LFrame.Align:= TAlignLayout.Top;
      LFrame.Name:= 'Frame_'+ Ljv.GetValue<string>('codSubcategoria')+FormatDateTime('hhmmsszzz',now);

      LFrame.lbl.Text:= Ljv.GetValue<string>('descricaoSubcategoria');
      LFrame.CheckBox.OnChange:= FiltraCategoria;
      LFrame.CheckBox.Tag:= Ljv.GetValue<integer>('codSubcategoria');


      VertScrollBox2.AddObject(LFrame);
      LHeight:= LHeight + LFrame.Height;

      FListCheckSubCategoria.Add(LFrame);

    end;

    TThread.Synchronize(nil,
    procedure
    begin
      VertScrollBox2.EndUpdate;
    end);


    LHeight:= LHeight + 24;

    Rectangle1.Height:= LHeight;

  finally
    FreeAndNil(LCon);
  end;
end;

procedure TfrmFiltroCategoria.FiltraCategoria(Sender:TObject);
begin

  if TCheckBox(Sender).IsChecked then
  begin
    for var LFrame in FListCheckSubCategoria do
      if TCheckBox(Sender) <> LFrame.CheckBox then
        LFrame.CheckBox.IsChecked:= false;
  end;

  if not TCheckBox(Sender).IsChecked then
  begin
    for var LFrame in FListCategoria do
      LFrame.Visible:= true;

    exit;
  end;


  for var LFrame in FListCategoria do
  begin
    if LFrame.TagString.ToInteger = TCheckBox(Sender).Tag then
      LFrame.Visible:= true
    else
    LFrame.Visible:= false;

  end;


end;

end.
