unit uOwnerForm;

interface

uses System.SysUtils, FMX.Types, System.Classes, FMX.Forms;

procedure Component(Sender:TComponent; var AResult:Tform);

implementation

procedure Component(Sender:TComponent; var AResult:Tform);
begin
  if not (Sender is TForm) then
    Component(Sender.Owner, AResult)
  else
  AResult:= TForm(Sender);
end;


end.
