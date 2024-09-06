unit uPrivacidade.Services;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, uPrivacidade.Model;

type
  TdmPrivacidadeServices = class(TDataModule)
    RESTPrivacidade: TRESTClient;
    RequestPrivacidade: TRESTRequest;
    ResponsePrivacidade: TRESTResponse;
    RESTAlteraPrivacidade: TRESTClient;
    RequestAlteraPrivacidade: TRESTRequest;
    ResponseAlteraPrivacidade: TRESTResponse;
  private
    { Private declarations }
  public
    function ObterPrivacidadeUsuario(ACodUsuario:string):TPrivacidadeModel;
    function SalvarPrivacidadeUsuario(AModel:TPrivacidadeModel):Boolean;
  end;

var
  dmPrivacidadeServices: TdmPrivacidadeServices;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TdmPrivacidadeServices.ObterPrivacidadeUsuario( ACodUsuario: string): TPrivacidadeModel;
begin
   var url := RESTPrivacidade.BaseURL + '/'+ACodUsuario;
   RESTPrivacidade.BaseURL := url;

   RequestPrivacidade.Execute;
   Var LModel := TPrivacidadeModel.Create;
   LModel.StringJsonToObj(RequestPrivacidade.Response.JSONText);
   Result := LModel;
end;

function TdmPrivacidadeServices.SalvarPrivacidadeUsuario(AModel: TPrivacidadeModel): Boolean;
begin
   RequestAlteraPrivacidade.Params[0].value :=  AModel.ObjToJsonString;
   RequestAlteraPrivacidade.Execute;

   result := RequestAlteraPrivacidade.Response.StatusCode = 200;
end;

end.
