unit uPrincipal.Controller;

interface
  uses uImagens.Model,  uImagem.Servicos.Model,
   uImagens.Services, uniGUIApplication, System.SysUtils, System.Classes,
  Vcl.Controls, uniPanel;
type
  TControllerPrincipal = class
    private
       FServices : TImagensServices;
    public
      function getListaCategorias: TImagensWSModel;
      function getListaProfissoes: TImagensWSModel;
      function getListaServicos(AKeyHeader: string = ''; AKeyValue: string =''): TImagemServicoModel;
      procedure getTelaPesquisa(AOwner: TComponent; objAtual: TComponent);
      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TControllerPrincipal }
uses uPesquisa.view;

constructor TControllerPrincipal.Create;
begin
  FServices := TImagensServices.Create(nil);
end;

destructor TControllerPrincipal.Destroy;
begin
  if Assigned(FServices) then
     FreeAndNil(FServices);
  
  inherited;
end;

function TControllerPrincipal.getListaCategorias: TImagensWSModel;
begin
  Result := FServices.getListaCategorias;
end;

function TControllerPrincipal.getListaProfissoes: TImagensWSModel;
begin
  Result := FServices.getListaProfissoes;
end;

function TControllerPrincipal.getListaServicos(AKeyHeader: string = ''; AKeyValue: string =''): TImagemServicoModel;
begin
  Result := FServices.getListaServicos(AKeyHeader, AKeyValue);
end;

procedure TControllerPrincipal.getTelaPesquisa(AOwner: TComponent; objAtual: TComponent);
begin
  var frPesquisa := TfrPesquisa.Create(UniApplication);
      frPesquisa.Parent := (AOwner as TWinControl);

      if objAtual is TUniPanel then
        frPesquisa.PanelAtualClicado :=  objAtual as TUniPanel;

      frPesquisa.ShowModal(
                             procedure (Sender : TComponent; Result : integer)
                             begin
                               frPesquisa.Release;
                             end
                          );
end;

end.
