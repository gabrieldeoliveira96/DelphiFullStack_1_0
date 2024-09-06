unit model.notificacao;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, controller.log,
  DataSet.Serialize;

type
  TDmNotificacao = class(TDmCon)
    qryGetNotificacao: TFDQuery;
    qryGetNotificacaoCOD: TFDAutoIncField;
    qryGetNotificacaoTITULO: TStringField;
    qryGetNotificacaoDESCRICAO: TStringField;
    qryGetNotificacaoTIPO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNotificacao(Atipo:integer): TJSONArray; overload;
  end;

var
  DmNotificacao: TDmNotificacao;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDmNotificacao }

function TDmNotificacao.GetNotificacao(Atipo:integer): TJSONArray;
begin

  qryGetNotificacao.MacroByName('FILTER').Clear;
  qryGetNotificacao.MacroByName('FILTER').AsRaw := ' where tipo = ' + inttostr(Atipo) +
  ' or tipo = 3';

  qryGetNotificacao.Open;
  Result := qryGetNotificacao.ToJSONArray;

  qryGetNotificacao.Close;

  Log('Retorno: ' + Result.ToString);

end;

end.
