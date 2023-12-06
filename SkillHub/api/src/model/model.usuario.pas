unit model.usuario;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON;

type
  TDmUsuario = class(TDmCon)
    qryInsereUsuario: TFDQuery;
    qryInsereUsuarioCOD: TFDAutoIncField;
    qryInsereUsuarioNOME: TStringField;
    qryInsereUsuarioEMAIL: TStringField;
    qryInsereUsuarioSENHA: TStringField;
    qryInsereUsuarioCPF: TStringField;
    qryInsereUsuarioTIPO_USUARIO: TStringField;
    qryInsereUsuarioFOTO: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    function PostUsuario(Ajson: Tjsonobject): TJSONObject;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmUsuario }

function TDmUsuario.PostUsuario(Ajson: Tjsonobject): TJSONObject;
var
  Ljo: TJSONObject;
begin
  qryInsereUsuario.Open;
  qryInsereUsuario.Append;

  qryInsereUsuarioNOME.AsString := Ajson.GetValue<string>('nome');
  qryInsereUsuarioEMAIL.AsString := Ajson.GetValue<string>('email');
  qryInsereUsuarioSENHA.AsString := Ajson.GetValue<string>('senha');
  qryInsereUsuarioCPF.AsString := Ajson.GetValue<string>('cpf');
  qryInsereUsuarioTIPO_USUARIO.AsString := Ajson.GetValue<string>('tipo_usuario');
  qryInsereUsuarioFOTO.AsString := Ajson.GetValue<string>('foto');

  qryInsereUsuario.Post;

  Ljo := TJSONObject.Create;
  Ljo.AddPair('sucesso', 'Usuario Cadastrado!');
  Result := Ljo;
end;

end.
