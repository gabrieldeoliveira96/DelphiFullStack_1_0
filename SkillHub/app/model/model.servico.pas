unit model.servico;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmServico = class(TdmCon)
    memServico: TFDMemTable;
    memServicoTITULO: TStringField;
    memServicoDESCRICAO: TStringField;
    memServicoCEP: TStringField;
    memServicoENDERECO: TStringField;
    memServicoNUMERO: TStringField;
    memServicoCOMPLEMENTO: TStringField;
    memServicoBAIRRO: TStringField;
    memServicoCATEGORIA: TIntegerField;
    memServicoDESCRICAO_CATEGORIA: TStringField;
    memServicoSUBCATEGORIA: TIntegerField;
    memServicoDESCRICAO_SUBCATEGORIA: TStringField;
    memServicoPROFISSAO: TIntegerField;
    memServicoDESCRICAO_PROFISSAO: TStringField;
    memServicoCOD_USUARIO: TIntegerField;
    memServicoNOME: TStringField;
    memServicoDATA_INGRESSO: TDateField;
    memServicoKM: TFloatField;
    memServicoVALOR: TFloatField;
    memServicoCOD: TIntegerField;
    memServicoFOTO: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmServico: TdmServico;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
