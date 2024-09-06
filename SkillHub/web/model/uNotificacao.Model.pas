unit uNotificacao.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItemsNotificacao = class
  private
    FCod: Integer;
    FDescricao: string;
    FTipo: Integer;
    FTitulo: string;
  published
    property Cod: Integer read FCod write FCod;
    property Descricao: string read FDescricao write FDescricao;
    property Tipo: Integer read FTipo write FTipo;
    property Titulo: string read FTitulo write FTitulo;
  end;

  TNotificacaoModel = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItemsNotificacao>;
    [GenericListReflect]
    FItems: TObjectList<TItemsNotificacao>;
    function GetItems: TObjectList<TItemsNotificacao>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItemsNotificacao> read GetItems;
  public
    destructor Destroy; override;
  end;

implementation

{ TRoot }

destructor TNotificacaoModel.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TNotificacaoModel.GetItems: TObjectList<TItemsNotificacao>;
begin
  Result := ObjectList<TItemsNotificacao>(FItems, FItemsArray);
end;

function TNotificacaoModel.GetAsJson: string;
begin
  RefreshArray<TItemsNotificacao>(FItems, FItemsArray);
  Result := inherited;
end;

end.
