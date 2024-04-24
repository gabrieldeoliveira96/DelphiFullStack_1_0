unit uImagens.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types, REST.Json,
  System.SysUtils;

{$M+}

type
  TItems = class
  private
    [JSONName('cod')]
    FCod: Integer;
    [JSONName('descricao')]
    FDescricao: string;
    [JSONName('figurinha')]
    FFigurinha: string;
  published
    property Cod: Integer read FCod write FCod;
    property Descricao: string read FDescricao write FDescricao;
    property Figurinha: string read FFigurinha write FFigurinha;
  end;

  TImagensWSModel = class(TJsonDTO)
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
    Function GetListaImagensModel(AJsonString: String): TImagensWSModel;
  end;

implementation

{ TRoot }

destructor TImagensWSModel.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TImagensWSModel.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

Function TImagensWSModel.GetListaImagensModel(AJsonString: String): TImagensWSModel;
begin
  var newObj: TImagensWSModel := TImagensWSModel.Create;

  newObj.AsJson := AJsonString;
  Items.Clear;
  Items.AddRange(newObj.FItemsArray) ;

  Result := self;
end;

function TImagensWSModel.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
