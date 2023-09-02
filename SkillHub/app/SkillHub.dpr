program SkillHub;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  view.login in 'view\view.login.pas' {frmLogin},
  view.splash in 'view\view.splash.pas' {frmSplash};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
