unit frame.subcategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Effects, FMX.Controls.Presentation, FMX.Layouts;

type
  TframeSubCategoria = class(TFrame)
    Layout10: TLayout;
    CheckBox: TCheckBox;
    ShadowEffect7: TShadowEffect;
    lbl: TSkLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
