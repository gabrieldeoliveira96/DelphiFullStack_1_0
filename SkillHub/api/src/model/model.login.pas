unit model.login;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, DataSet.Serialize,
  controller.log;

type
  TDmLogin = class(TDmCon)
    qryValidaLogin: TFDQuery;
    qryValidaLoginCOD: TFDAutoIncField;
    qryValidaLoginNOME: TStringField;
    qryValidaLoginEMAIL: TStringField;
    qryValidaLoginCPF: TStringField;
    qryValidaLoginTIPO_USUARIO: TStringField;
    qryValidaLoginFOTO: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidaLogin(Ajson: TJSONObject): TJSONObject;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmLogin }

function TDmLogin.ValidaLogin(Ajson: TJSONObject): TJSONObject;
var
  Ljo: TJSONObject;
begin
  qryValidaLogin.Close;
  qryValidaLogin.ParamByName('EMAIL').AsString := Ajson.GetValue<string>('email');
  qryValidaLogin.ParamByName('SENHA').AsString := Ajson.GetValue<string>('senha');
  qryValidaLogin.Open;

  Result := qryValidaLogin.ToJSONObject;

  Log('Retorno: Usuario Logado: '+ qryValidaLoginEMAIL.AsString);
  if qryValidaLogin.RecordCount > 0 then
    Result := qryValidaLogin.ToJSONObject
  else
  begin
    Ljo := TJSONObject.Create;
    Ljo.AddPair('mensagem', 'Usuário não encontrado');

    result := Ljo;
  end;

end;

end.
