unit frame.profissao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Objects, uGosObjects, FMX.Layouts;

type
  TframeProfissao = class(TFrame)
    btn: TLayout;
    GosRectangle2: TGosRectangle;
    img: TSkSvg;
    lbl: TSkLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
