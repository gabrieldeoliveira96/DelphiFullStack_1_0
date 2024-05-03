unit model.privacidade;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, DataSet.Serialize, System.JSON;

type
  TdmPrivacidade = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryPrivacidade: TFDQuery;
    qryPrivacidadecod_user: TIntegerField;
    qryPrivacidadedados: TStringField;
    qryPrivacidadeacesso: TStringField;
    qryPrivacidadeperfil: TStringField;
    qryPrivacidadenotificacoes: TStringField;
    qryPrivacidadeconta: TStringField;
    qryPrivacidadecompartilhamento_dados: TStringField;
  private
    { Private declarations }
  public
    function BuscarPrivacidade(ACodUser:integer): TJSONObject;
    function IncluirPrivacidade(jsonBody:TJSONObject): TJSONObject;
  end;

var
  dmPrivacidade: TdmPrivacidade;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModule1 }

function TdmPrivacidade.BuscarPrivacidade(ACodUser: integer): TJSONObject;
begin
  qryPrivacidade.ParamByName('cod').AsInteger := ACodUser;
  qryPrivacidade.Open;
  Result := qryPrivacidade.ToJSONObject;
end;

function TdmPrivacidade.IncluirPrivacidade(jsonBody: TJSONObject): TJSONObject;
begin
  qryPrivacidade.ParamByName('cod').AsInteger := jsonBody.GetValue<integer>('codUser');
  qryPrivacidade.Open;

  if qryPrivacidade.RecordCount > 0 then
    qryPrivacidade.Edit
  else
  begin
    qryPrivacidade.Append;
    qryPrivacidadecod_user.AsInteger := jsonBody.GetValue<integer>('codUser');
  end;

   qryPrivacidadeDados.AsString :=  jsonBody.GetValue<string>('dados');
   qryPrivacidadeAcesso.AsString :=  jsonBody.GetValue<string>('acesso');
   qryPrivacidadePerfil.AsString :=  jsonBody.GetValue<string>('perfil');
   qryPrivacidadeNotificacoes.AsString :=  jsonBody.GetValue<string>('notificacoes');
   qryPrivacidadeConta.AsString :=  jsonBody.GetValue<string>('conta');
   qryPrivacidadeCompartilhamento_dados.AsString :=  jsonBody.GetValue<string>('compartilhamentoDados');

   qryPrivacidade.Post;
end;

end.
