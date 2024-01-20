unit model.con;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmCon = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCon: TdmCon;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
