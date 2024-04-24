unit uImagens.Services;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, uImagens.Model, uImagem.Servicos.Model,
  uniGUIMainModule;

type
  TImagensServices = class(TDataModule)
    RESTCategorias: TRESTClient;
    RequestCategorias: TRESTRequest;
    ResponseCategorias: TRESTResponse;
    RESTProfissoes: TRESTClient;
    RequestProfissoes: TRESTRequest;
    ResponseProfissoes: TRESTResponse;
    RESTServicos: TRESTClient;
    RequestServicos: TRESTRequest;
    ResponseServicos: TRESTResponse;
    procedure DataModuleDestroy(Sender: TObject);
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    FModelImagens: TImagensWSModel;
    FModelImagensServicos: TImagemServicoModel;
  public
    Function getListaCategorias: TImagensWSModel;
    Function getListaProfissoes: TImagensWSModel;
    Function getListaServicos(AKeyHeader: string = ''; AKeyValue: string ='' ): TImagemServicoModel;
  end;

var
  ImagensServices: TImagensServices;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TImagensServices.DataModuleDestroy(Sender: TObject);
begin
  while (ComponentCount) > 0 do
    FreeAndNil(Components[0]);
end;

function TImagensServices.getListaCategorias: TImagensWSModel;
begin
   RequestCategorias.Execute;
   Result := FModelImagens.GetListaImagensModel(RequestCategorias.Response.JSONText);
end;

function TImagensServices.getListaProfissoes: TImagensWSModel;
begin
   RequestProfissoes.Execute;
   Result := FModelImagens.GetListaImagensModel(RequestProfissoes.Response.JSONText);
end;

function TImagensServices.getListaServicos(AKeyHeader: string = ''; AKeyValue: string ='' ): TImagemServicoModel;
begin
   if not (AKeyHeader.Trim.IsEmpty and AKeyValue.Trim.IsEmpty ) then
   begin
     RequestServicos.Params.Clear;
     RequestServicos.Params.AddHeader(AKeyHeader, AKeyValue);
   end;

   RequestServicos.Execute;
   Result := FModelImagensServicos.GetListaImagensModel(RequestServicos.Response.JSONText);
end;

procedure TImagensServices.UniGUIMainModuleCreate(Sender: TObject);
begin
   FModelImagens         := TImagensWSModel.Create;
   FModelImagensServicos := TImagemServicoModel.Create;
end;

end.
