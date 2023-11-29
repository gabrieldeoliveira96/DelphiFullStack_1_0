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
    SkLabel1: TSkLabel;
    SkSvg1: TSkSvg;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
