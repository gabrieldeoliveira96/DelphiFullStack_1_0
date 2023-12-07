unit model.categoria;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, DataSet.Serialize,
  controller.log;

type
  TDmCategoria = class(TDmCon)
    qryGetCategoria: TFDQuery;
    qryGetCategoriaCOD: TFDAutoIncField;
    qryGetCategoriaDESCRICAO: TStringField;
    qryGetCategoriaFIGURINHA: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetCategoria: TJSONArray;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmCon1 }

function TDmCategoria.GetCategoria: TJSONArray;
begin
  qryGetCategoria.Open;
  result := qryGetCategoria.ToJSONArray;
  qryGetCategoria.Close;

  Log('Retorno: '+ Result.ToString);
end;

end.
