unit uMain.view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniHTMLFrame, uniImage, Vcl.Imaging.pngimage, uniLabel, uniScrollBox;

type
  TMainForm = class(TUniForm)
    pnlMain: TUniPanel;
    imgSer1: TUniImage;
    imgServ2: TUniImage;
    imgServ3: TUniImage;
    UniLabel1: TUniLabel;
    UniScrollBox2: TUniScrollBox;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, uniGUIApplication, uMain.Controller;

function MainForm: TMainForm;
begin
  var controller : TMainController := TMainController.Create;
  try
    Result := TMainForm(Controller.getMainServices(TMainForm));
  finally
    FreeAndNil(Controller);
  end;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
var clogin: TMainController;
begin
 cLogin := TMainController.create();
 try
   clogin.getTelaLogin(self);
 finally
  FreeAndNil(cLogin);
 end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
