unit model.subcategoria;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, Dataset.Serialize,
  controller.log;

type
  TDmSubCategoria = class(TDmCon)
    qryGetSubCategoria: TFDQuery;
    qryGetSubCategoriaCOD: TFDAutoIncField;
    qryGetSubCategoriaDESCRICAO: TStringField;
    qryGetSubCategoriaCOD_CATEGORIA: TIntegerField;
    qryGetSubCategoriaDESCRICAO_CATEGORIA: TStringField;
    qryGetObterSubCategoria: TFDQuery;
    qryGetObterSubCategoriaCOD: TFDAutoIncField;
    qryGetObterSubCategoriaDESCRICAO_CATEGORIA: TStringField;
    qryGetObterSubCategoriaFIGURINHA: TBlobField;
    qryGetObterSubCategoriaCOD_SUBCATEGORIA: TIntegerField;
    qryGetObterSubCategoriaDESCRICAO_SUBCATEGORIA: TStringField;
    qryGetObterSubCategoriaCOD_CATEGORIA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetSubCategoria: TJSonArray;
    function GetObterSubCategoria(ACodCategoria: integer): TJSonArray;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmSubCategoria }

function TDmSubCategoria.GetObterSubCategoria(ACodCategoria: integer): TJSonArray;
begin
  qryGetObterSubCategoria.Close;
  qryGetObterSubCategoria.ParamByName('COD').AsInteger := ACodCategoria;
  qryGetObterSubCategoria.Open;

  Result := qryGetObterSubCategoria.ToJSONArray;
  Log('Retorno: ' + Result.ToString);
end;

function TDmSubCategoria.GetSubCategoria: TJSonArray;
begin
 qryGetSubCategoria.Open;
 Result := qryGetSubCategoria.ToJSONArray;

 qryGetSubCategoria.Close;

 Log('Retorno: ' + Result.ToString);
end;

end.
