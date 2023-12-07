unit model.usuario;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, controller.log, DataSet.Serialize;

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
    qryObterUsuario: TFDQuery;
    qryObterUsuarioCOD: TFDAutoIncField;
    qryObterUsuarioNOME: TStringField;
    qryObterUsuarioEMAIL: TStringField;
    qryObterUsuarioCPF: TStringField;
    qryObterUsuarioFOTO: TBlobField;
    qryObterUsuarioTIPO_USUARIO: TStringField;
    qryEditarSenha: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function PostUsuario(Ajson: Tjsonobject): TJSONObject;
    function ObterUsuario(ACodUsuario: integer): TJSONObject;

    procedure EditarSenha(Asenha: string; ACod: integer);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmUsuario }

procedure TDmUsuario.EditarSenha(Asenha: string; ACod: integer);
begin
  qryEditarSenha.Close;
  qryEditarSenha.ParamByName('SENHA').AsString := Asenha;
  qryEditarSenha.ParamByName('COD').AsInteger := ACod;
  qryEditarSenha.ExecSQL;
end;

function TDmUsuario.ObterUsuario(ACodUsuario: integer): TJSONObject;
begin
  qryObterUsuario.Close;
  qryObterUsuario.ParamByName('COD').AsInteger := ACodUsuario;
  qryObterUsuario.Open;

  Result := qryObterUsuario.ToJSONObject;

  Log('Rertono: ' + result.ToString);
end;

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

  Log('Retorno: ' + Ajson.ToString);
end;

end.
