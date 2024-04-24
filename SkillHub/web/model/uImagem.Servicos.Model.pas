unit uImagem.Servicos.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItems = class
  private
    FBairro: string;
    FCategoria: Integer;
    FCep: string;
    FCod: Integer;
    FCodUsuario: Integer;
    FComplemento: string;
    [SuppressZero]
    FDataIngresso: TDateTime;
    FDescricao: string;
    FDescricaoCategoria: string;
    FDescricaoProfissao: string;
    FDescricaoSubcategoria: string;
    FEndereco: string;
    FFoto: string;
    FKm: Integer;
    FNome: string;
    FNumero: string;
    FProfissao: Integer;
    FSubcategoria: Integer;
    FTitulo: string;
    FValor: Double;
  published
    property Bairro: string read FBairro write FBairro;
    property Categoria: Integer read FCategoria write FCategoria;
    property Cep: string read FCep write FCep;
    property Cod: Integer read FCod write FCod;
    property CodUsuario: Integer read FCodUsuario write FCodUsuario;
    property Complemento: string read FComplemento write FComplemento;
    property DataIngresso: TDateTime read FDataIngresso write FDataIngresso;
    property Descricao: string read FDescricao write FDescricao;
    property DescricaoCategoria: string read FDescricaoCategoria write FDescricaoCategoria;
    property DescricaoProfissao: string read FDescricaoProfissao write FDescricaoProfissao;
    property DescricaoSubcategoria: string read FDescricaoSubcategoria write FDescricaoSubcategoria;
    property Endereco: string read FEndereco write FEndereco;
    property Foto: string read FFoto write FFoto;
    property Km: Integer read FKm write FKm;
    property Nome: string read FNome write FNome;
    property Numero: string read FNumero write FNumero;
    property Profissao: Integer read FProfissao write FProfissao;
    property Subcategoria: Integer read FSubcategoria write FSubcategoria;
    property Titulo: string read FTitulo write FTitulo;
    property Valor: Double read FValor write FValor;
  end;

  TImagemServicoModel = class(TJsonDTO)
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
    function GetListaImagensModel(AJsonString: String): TImagemServicoModel;
  end;

implementation

{ TRoot }

destructor TImagemServicoModel.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TImagemServicoModel.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

Function TImagemServicoModel.GetListaImagensModel(AJsonString: String): TImagemServicoModel;
begin
  var newObj: TImagemServicoModel := TImagemServicoModel.Create;

  newObj.AsJson := AJsonString;
  Items.Clear;
  Items.AddRange(newObj.FItemsArray) ;

  Result := self;
end;

function TImagemServicoModel.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
