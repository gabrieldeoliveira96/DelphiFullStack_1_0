unit frame.solicitacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Effects, FMX.Objects, FMX.Skia, FMX.Layouts;

type
  TFrameSolicitacao = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    Circle1: TCircle;
    lblNome: TSkLabel;
    Line1: TLine;
    SkLabel3: TSkLabel;
    Circle2: TCircle;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
