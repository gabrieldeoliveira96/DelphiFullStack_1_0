unit uSubCategorias.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItems = class
  private
    FCod: Integer;
    FCodCategoria: Integer;
    FCodSubcategoria: Integer;
    FDescricaoCategoria: string;
    FDescricaoSubcategoria: string;
    FFigurinha: string;
  published
    property Cod: Integer read FCod write FCod;
    property CodCategoria: Integer read FCodCategoria write FCodCategoria;
    property CodSubcategoria: Integer read FCodSubcategoria write FCodSubcategoria;
    property DescricaoCategoria: string read FDescricaoCategoria write FDescricaoCategoria;
    property DescricaoSubcategoria: string read FDescricaoSubcategoria write FDescricaoSubcategoria;
    property Figurinha: string read FFigurinha write FFigurinha;
  end;

  TSubCategoriaModel = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItems>;
    [GenericListReflect]
    FItems: TObjectList<TItems>;
    function GetItems: TObjectList<TItems>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItems> read GetItems;
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

function TSubCategoriaModel.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
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
 RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
