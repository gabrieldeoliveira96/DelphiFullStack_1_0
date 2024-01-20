unit frame.servico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, System.Skia, FMX.Skia;

type
  TframeServico = class(TFrame)
    recImg: TRectangle;
    Rectangle2: TRectangle;
    lblTexto: TSkLabel;
    Rectangle3: TRectangle;
    lblKm: TSkLabel;
    SkSvg1: TSkSvg;
    procedure FrameClick(Sender: TObject);
    procedure FrameTap(Sender: TObject; const Point: TPointF);
  private
    procedure AbrirDescricao;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses view.descricao.servico, model.servico, Data.DB, uFancyDialog, uOwnerForm;

procedure TframeServico.FrameClick(Sender: TObject);
begin
  AbrirDescricao;
end;

procedure TframeServico.FrameTap(Sender: TObject; const Point: TPointF);
begin
  AbrirDescricao;
end;

procedure TframeServico.AbrirDescricao;
begin
  if not dmServico.memServico.Locate('cod',self.Tag , [loCaseInsensitive,loPartialKey]) then
  begin
    var LMsg:TFancyDialog;
    var LForm:Tform;
    Component(self, LForm);
    LMsg:= TFancyDialog.Create(LForm);
    LMsg.Show(TIconDialog.Error,'Não encontrado','Resgistro não encontrado','OK',
    procedure
    begin
      FreeAndNil(LMsg);
    end);
    exit;
  end;


  if not Assigned(frmDescricaoServico) then
    Application.CreateForm(TfrmDescricaoServico, frmDescricaoServico);

  frmDescricaoServico.CarregaTela(self.Tag, recImg.Fill.Bitmap.Bitmap);
  frmDescricaoServico.show;
end;

end.
