unit frame.notificacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Layouts, FMX.Objects, FMX.Skia;

type
  TFrameNotificacao = class(TFrame)
    SkLabel1: TSkLabel;
    Circle1: TCircle;
    Layout1: TLayout;
    Layout2: TLayout;
    SkLabel2: TSkLabel;
    Line1: TLine;
    SkLabel3: TSkLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
