unit view.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, FMX.Skia,
  FMX.Layouts, FMX.Objects, uGosBase, uGosEdit, uGosStandard, uGosObjects,
  uGosEditTitle, uGosDrawerComponents;

type
  TfrmLogin = class(TForm)
    Layout1: TLayout;
    SkSvg1: TSkSvg;
    SkLabel1: TSkLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Line1: TLine;
    Layout4: TLayout;
    Layout5: TLayout;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    GosEditView1: TGosEditView;
    GosEditView2: TGosEditView;
    SkLabel2: TSkLabel;
    GosButtonView1: TGosButtonView;
    GosButtonView2: TGosButtonView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

end.
