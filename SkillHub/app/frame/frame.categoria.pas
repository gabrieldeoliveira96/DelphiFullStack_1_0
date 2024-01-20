unit frame.categoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Objects, uGosObjects;

type
  TframeCategoria = class(TFrame)
    btn: TGosRectangle;
    lbl: TSkLabel;
    img: TSkSvg;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
