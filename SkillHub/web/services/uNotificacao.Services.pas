unit uNotificacao.Services;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client, REST.JSON,
  Data.Bind.Components, Data.Bind.ObjectScope, uNotificacao.Model;

type
  TdmNotificacaoServices = class(TDataModule)
    RESTNotificacao: TRESTClient;
    RequestNotificacao: TRESTRequest;
  private
    { Private declarations }
  public
    function GetNotification(ATipoNotificacao: string): TNotificacaoModel;
  end;

var
  dmNotificacaoServices: TdmNotificacaoServices;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmNotificacaoServices }

function TdmNotificacaoServices.GetNotification(ATipoNotificacao: string): TNotificacaoModel;
const URL_Notificacao = 'http://localhost:9000/obter/notificacao/';
begin
  if ATipoNotificacao.Trim.isEmpty then
    raise Exception.Create('Informar o tipo de usuario para notificção!');

  var url := URL_Notificacao + ATipoNotificacao;
  RestNotificacao.baseUrl := url;
  RequestNotificacao.execute;

  Result := TJson.JsonToObject<TNotificacaoModel>('{ "Items": '+  RequestNotificacao.Response.JsonText + '}' );
end;

end.
