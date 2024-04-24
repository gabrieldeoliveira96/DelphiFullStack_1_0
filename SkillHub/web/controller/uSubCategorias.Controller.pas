unit uSubCategorias.Controller;

interface

uses uSubCategorias.Services, System.SysUtils, System.Classes,
  Vcl.Controls, uSubCategorias.Model;

type
 TSubCategoriasController = class
   private
     FSubCategoriasServices: TSubCategoriasServices;
   public
     function getListaSubCategorias(ACodCategoria: string):TSubCategoriaModel;
     constructor Create();
     Destructor Destroy;
 end;

implementation

{ TSubCategoriasController }

constructor TSubCategoriasController.Create();
begin
  FSubCategoriasServices := TSubCategoriasServices.create(nil);
end;

destructor TSubCategoriasController.Destroy;
begin
  FreeAndNil(FSubCategoriasServices);
end;

function TSubCategoriasController.getListaSubCategorias(ACodCategoria: string): TSubCategoriaModel;
begin
  Result := FSubCategoriasServices.getListaSubCategorias(ACodCategoria);
end;

end.
