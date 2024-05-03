unit model.servico;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.JSON, DataSet.Serialize, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  controller.log;

type
  TDmServico = class(TDmCon)
    qryPostServico: TFDQuery;
    qryPostServicoCOD: TFDAutoIncField;
    qryPostServicoTITULO: TStringField;
    qryPostServicoDESCRICAO: TStringField;
    qryPostServicoCEP: TStringField;
    qryPostServicoENDERECO: TStringField;
    qryPostServicoNUMERO: TStringField;
    qryPostServicoBAIRRO: TStringField;
    qryPostServicoCOMPLEMENTO: TStringField;
    qryPostServicoCATEGORIA: TIntegerField;
    qryPostServicoSUBCATEGORIA: TIntegerField;
    qryPostServicoPROFISSAO: TIntegerField;
    qryPostServicoFOTO: TBlobField;
    qryPostServicoCOD_USUARIO: TIntegerField;
    qryGetServico: TFDQuery;
    qryPostServicoDATA_INGRESSO: TDateField;
    qryPostServicoKM: TFloatField;
    qryPostServicoVALOR: TBCDField;
    qryPostServicoFAVORITADO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function PutFavoritarServico(Ajson: TJSONObject): TJSONObject;
    function PostServico(Ajson: TJSONObject): TJSONObject;
    function GetServico: TJSONArray; overload;
    function GetServico(AcodServico: integer): TJSONObject; overload;
    function GetServico(ADescricaoServico: string): TJSONArray; overload;
    function GetServicoCategoria(AcodCategoria: integer): TJSONArray;
    function GetServicoSubCategoria(AcodSubCategoriaCategoria: integer): TJSONArray;
    function GetServicosFavoritados(ACodUsuario: integer): TJSONArray;
    function GetServicoUsuario(AcodUsuario: integer): TJSONArray;
    function GetServicoProfissao(AcodProfissao: integer): TJSONArray;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmServico }

function TDmServico.GetServico: TJSONArray;
begin
  qryGetServico.Open;
  Result := qryGetServico.ToJSONArray;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;

function TDmServico.GetServico(AcodServico: integer): TJSONObject;
begin
  qryGetServico.MacroByName('FILTER').Clear;
  qryGetServico.MacroByName('FILTER').AsRaw := 'where s.cod = ' + inttostr(AcodServico);
  qryGetServico.Open;
  Result := qryGetServico.ToJSONObject;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;

function TDmServico.GetServico(ADescricaoServico: string): TJSONArray;
begin
  qryGetServico.MacroByName('FILTER').Clear;
  qryGetServico.MacroByName('FILTER').AsRaw := ' where S.DESCRICAO like  '+ QuotedStr('%'+ADescricaoServico+'%')+'  ';
  qryGetServico.Open;
  Result := qryGetServico.ToJSONArray;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;

function TDmServico.GetServicoCategoria(AcodCategoria: integer): TJSONArray;
begin
  qryGetServico.MacroByName('FILTER').Clear;
  qryGetServico.MacroByName('FILTER').AsRaw := 'where s.categoria = ' + inttostr(AcodCategoria);
  qryGetServico.Open;
  Result := qryGetServico.ToJSONArray;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;

function TDmServico.GetServicoProfissao(AcodProfissao: integer): TJSONArray;
begin
  qryGetServico.MacroByName('FILTER').Clear;
  qryGetServico.MacroByName('FILTER').AsRaw := 'where s.profissao = ' + inttostr(AcodProfissao);
  qryGetServico.Open;
  Result := qryGetServico.ToJSONArray;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;


function TDmServico.GetServicosFavoritados(ACodUsuario: integer): TJSONArray;
begin
  qryGetServico.MacroByName('FILTER').Clear;
  qryGetServico.MacroByName('FILTER').AsRaw := 'where s.favoritado = ''S''  and s.cod_usuario = ' + inttostr(AcodUsuario);
  qryGetServico.Open;
  Result := qryGetServico.ToJSONArray;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;

function TDmServico.GetServicoSubCategoria(AcodSubCategoriaCategoria: integer): TJSONArray;
begin
  qryGetServico.MacroByName('FILTER').Clear;
  qryGetServico.MacroByName('FILTER').AsRaw := 'where  S.SUBCATEGORIA = ' + inttostr(AcodSubCategoriaCategoria);
  qryGetServico.Open;
  Result := qryGetServico.ToJSONArray;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;

function TDmServico.GetServicoUsuario(AcodUsuario: integer): TJSONArray;
begin
  qryGetServico.MacroByName('FILTER').Clear;
  qryGetServico.MacroByName('FILTER').AsRaw := 'where s.cod_usuario = ' + inttostr(AcodUsuario);
  qryGetServico.Open;
  Result := qryGetServico.ToJSONArray;

  qryGetServico.Close;

  Log('Retorno: ' + Result.ToString);
end;

function TDmServico.PostServico(Ajson: TJSONObject): TJSONObject;
var
  Ljo: TJSONObject;
begin
  qryPostServico.Open;
  qryPostServico.Append;

  qryPostServicoTITULO.AsString := Ajson.GetValue<string>('titulo');
  qryPostServicoDESCRICAO.AsString := Ajson.GetValue<string>('descricao');
  qryPostServicoCEP.AsString := Ajson.GetValue<string>('cep');
  qryPostServicoENDERECO.AsString := Ajson.GetValue<string>('endereco');
  qryPostServicoNUMERO.AsString := Ajson.GetValue<string>('numero');
  qryPostServicoBAIRRO.AsString := Ajson.GetValue<string>('bairro');
  qryPostServicoCOMPLEMENTO.AsString := Ajson.GetValue<string>('complemento');
  qryPostServicoCATEGORIA.AsString := Ajson.GetValue<string>('categoria');
  qryPostServicoSUBCATEGORIA.AsString := Ajson.GetValue<string>('subcategoria');
  qryPostServicoPROFISSAO.AsString := Ajson.GetValue<string>('profissao');
  qryPostServicoFOTO.AsString := Ajson.GetValue<string>('foto');
  qryPostServicoCOD_USUARIO.AsString := Ajson.GetValue<string>('cod_usuario');
  qryPostServicoDATA_INGRESSO.AsDateTime := date;
  qryPostServicoKM.AsInteger   :=  Ajson.GetValue<integer>('km');
  qryPostServicoVALOR.AsFloat  :=  Ajson.GetValue<double>('valor');
  qryPostServicoFAVORITADO.AsString := Ajson.GetValue<string>('favoritado');
  qryPostServico.Post;

  Ljo := TJSONObject.Create;
  Ljo.AddPair('mensagem', 'Serviço Cadastrado com Sucesso!');

  Result := Ljo;

  Log('Json recebido: ' + Ajson.ToString);
end;

function TDmServico.PutFavoritarServico(Ajson: TJSONObject): TJSONObject;
begin
    var sql := qryPostServico.SQL.Text;
    var Ljo := TJSONObject.Create;
    try
      qryPostServico.SQL.Text := sql + ' WHERE cod = '+ Ajson.GetValue<string>('cod');
      qryPostServico.Open;

      if  Ajson.GetValue<string>('favoritado').Contains('S') or  Ajson.GetValue<string>('favoritado').Contains('N') then
      begin
        qryPostServico.Edit;
        qryPostServicoFAVORITADO.AsString :=  Ajson.GetValue<string>('favoritado');
        qryPostServico.Post;

        Ljo.AddPair('mensagem', 'Favorito editado para o valor: '+Ajson.GetValue<string>('favoritado'));
      end else
        Ljo.AddPair('mensagem', 'Valor informado é invalido: '+Ajson.GetValue<string>('favoritado'));
    finally
      qryPostServico.Close;
    end;
end;

end.
