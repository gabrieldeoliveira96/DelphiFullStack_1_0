unit uPrivacidade.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types,
  uIdSSLOpenSSLHeaders;

{$M+}

type
  TPrivacidadeModel = class(TJsonDTO)
  private
    FAcesso               : string;
    FCodUser              : Integer;
    FCompartilhamentoDados: string;
    FConta                : string;
    FDados                : string;
    FNotificacoes         : string;
    FPerfil               : string;
  published
    property Acesso: string read FAcesso write FAcesso;
    property CodUser: Integer read FCodUser write FCodUser;
    property CompartilhamentoDados: string read FCompartilhamentoDados write FCompartilhamentoDados;
    property Conta: string read FConta write FConta;
    property Dados: string read FDados write FDados;
    property Notificacoes: string read FNotificacoes write FNotificacoes;
    property Perfil: string read FPerfil write FPerfil;

    function ObjToJsonString: string;
    function StringJsonToObj(AJsonString:String): TPrivacidadeModel;
  public
  end;

implementation

uses  REST.Json;

function TPrivacidadeModel.ObjToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(self);
end;

function TPrivacidadeModel.StringJsonToObj(AJsonString: String): TPrivacidadeModel;
begin
var NewObj := TJson.JsonToObject<TPrivacidadeModel>(AJsonString);
    FAcesso                   :=  NewObj.Acesso;
    FCodUser                  :=  NewObj.CodUser;
    FCompartilhamentoDados    :=  NewObj.CompartilhamentoDados;
    FConta                    :=  NewObj.Conta;
    FDados                    :=  NewObj.Dados;
    FNotificacoes             :=  NewObj.Notificacoes;
    FPerfil                   :=  NewObj.Perfil;
end;

end.
