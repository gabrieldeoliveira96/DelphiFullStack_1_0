unit model.con;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.IniFiles, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDmCon = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LerIni;
  public
    { Public declarations }
  end;

var
  DmCon: TDmCon;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmCon }

procedure TDmCon.DataModuleCreate(Sender: TObject);
begin
  LerIni;
  Conexao.Connected := true;
end;

procedure TDmCon.LerIni;
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  try
    Conexao.Params.Values['DriverID'] := 'MySQL';
    Conexao.Params.Values['Server'] := ArquivoINI.ReadString('CONEXAO','SERVER', '');
    Conexao.Params.Values['Database'] := ArquivoINI.ReadString('CONEXAO','DATABASE', '');
    Conexao.Params.Values['User_Name'] := ArquivoINI.ReadString('CONEXAO','USERNAME', 'root');
    Conexao.Params.Values['Password'] := ArquivoINI.ReadString('CONEXAO', 'PASSWORD', 'root');
  finally
    ArquivoINI.Free;
  end;
end;

end.
