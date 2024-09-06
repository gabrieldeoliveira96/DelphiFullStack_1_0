unit uSubCategorias.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItemsSubCategoriasModel = class
  private
    FCod: Integer;
    FCodCategoria: Integer;
    FCodSubcategoria: Integer;
    FDescricaoCategoria: string;
    FDescricaoSubcategoria: string;
    FDescricao: string;
    FFigurinha: string;
  published
    property Cod: Integer read FCod write FCod;
    property CodCategoria: Integer read FCodCategoria write FCodCategoria;
    property CodSubcategoria: Integer read FCodSubcategoria write FCodSubcategoria;
    property DescricaoCategoria: string read FDescricaoCategoria write FDescricaoCategoria;
    property DescricaoSubcategoria: string read FDescricaoSubcategoria write FDescricaoSubcategoria;
    property Descricao: string read FDescricao write FDescricao;
    property Figurinha: string read FFigurinha write FFigurinha;
  end;

  TSubCategoriaModel = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItemsSubCategoriasModel>;
    [GenericListReflect]
    FItems: TObjectList<TItemsSubCategoriasModel>;
    function GetItems: TObjectList<TItemsSubCategoriasModel>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItemsSubCategoriasModel> read GetItems;
  public
    destructor Destroy; override;
    Function GetListaSubCategoriasModel(AJsonString: String): TSubCategoriaModel;
  end;

implementation

{ TRoot }

destructor TSubCategoriaModel.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TSubCategoriaModel.GetItems: TObjectList<TItemsSubCategoriasModel>;
begin
  Result := ObjectList<TItemsSubCategoriasModel>(FItems, FItemsArray);
end;

function TSubCategoriaModel.GetListaSubCategoriasModel(AJsonString: String): TSubCategoriaModel;
begin
  var newObj: TSubCategoriaModel := TSubCategoriaModel.Create;

  newObj.AsJson := AJsonString;
  Items.Clear;
  Items.AddRange(newObj.FItemsArray) ;

  Result := self;
end;

function TSubCategoriaModel.GetAsJson: string;
begin
 RefreshArray<TItemsSubCategoriasModel>(FItems, FItemsArray);
  Result := inherited;
end;

end.
