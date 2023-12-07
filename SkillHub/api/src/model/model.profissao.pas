unit model.profissao;

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
  TDmProfissao = class(TDmCon)
    qryGetProfissao: TFDQuery;
    qryGetProfissaoCOD: TFDAutoIncField;
    qryGetProfissaoDESCRICAO: TStringField;
    qryGetProfissaoFIGURINHA: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetProfissao: TJSONArray;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmProfissao }

function TDmProfissao.GetProfissao: TJSONArray;
begin
  qryGetProfissao.Open;
  Result := qryGetProfissao.ToJSONArray;

  qryGetProfissao.Close;

  Log('Retorno: ' + Result.ToString);
end;

end.
