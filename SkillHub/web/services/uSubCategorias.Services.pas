unit uSubCategorias.Services;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, uSubCategorias.Model;

type
  TSubCategoriasServices = class(TDataModule)
    RESTSubCategoria: TRESTClient;
    RequestSubCategoria: TRESTRequest;
    ResponseSubCategoria: TRESTResponse;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FModelSubCategorias: TSubCategoriaModel;
  public
    function getListaSubCategorias(ACodCategoria: string):TSubCategoriaModel;
  end;

var
  SubCategoriasServices: TSubCategoriasServices;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TSubCategoriasServices.DataModuleCreate(Sender: TObject);
begin
  FModelSubCategorias := TSubCategoriaModel.create;
end;

procedure TSubCategoriasServices.DataModuleDestroy(Sender: TObject);
begin
  if assigned(FModelSubCategorias) then
    FreeAndNil(FModelSubCategorias);

  while (ComponentCount) > 0 do
    FreeAndNil(Components[0]);
end;

function TSubCategoriasServices.getListaSubCategorias(ACodCategoria: string): TSubCategoriaModel;
begin
   if not ACodCategoria.trim.isEmpty then
   begin
      var UrlParams := RESTSubCategoria.baseUrl + '/'+ACodCategoria;
      RESTSubCategoria.baseUrl := UrlParams;
   end;
   RequestSubCategoria.Execute;

   Result := FModelSubCategorias.GetListaSubCategoriasModel(RequestSubCategoria.Response.JSONText);   
end;

end.
