unit uPrincipal.Controller;

interface
  uses uImagens.Model,  uImagem.Servicos.Model, uMenu.View,
   uImagens.Services, uniGUIApplication, System.SysUtils, System.Classes,
  Vcl.Controls, uniPanel, uContrataServicos.View, uLogin.Services, uLogin.Model;

type
  TControllerPrincipal = class
    private
       FServices : TImagensServices;
    public
      function getListaCategorias: TImagensWSModel;
      function getListaProfissoes: TImagensWSModel;
      function getListaServicos(AKeyHeader: string = ''; AKeyValue: string =''): TImagemServicoModel;
      function getDadosUsuarioLogado: TLoginNovoUsuario;
      procedure getTelaPesquisa(AOwner: TComponent; objAtual: TComponent);
      procedure getTelaMenuLateral(AOwner: TComponent);
      procedure getTelaContrataServico(AOwner: TComponent; AModel: TItems);
      procedure Favoritar(ACodServico, AFavoritado:string);

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

procedure TControllerPrincipal.Favoritar(ACodServico, AFavoritado: string);
begin
  FServices.FavoritarServico(ACodServico, AFavoritado);
end;

function TControllerPrincipal.getDadosUsuarioLogado: TLoginNovoUsuario;
begin
  Result := LoginServices.ModelUsuario;
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

procedure TControllerPrincipal.getTelaContrataServico(AOwner: TComponent; AModel: TItems);
begin
  var frContrataServico := TfrContrataServico.Create(UniApplication);
      frContrataServico.Parent := TWinControl(AOwner);

      frContrataServico.Mode := AModel;
      frContrataServico.ShowModal(
                             procedure (Sender : TComponent; Result : integer)
                             begin
                               frContrataServico.Release;
                             end
                          );
end;

procedure TControllerPrincipal.getTelaMenuLateral(AOwner: TComponent);
begin
     var frMenuLateral := TfrMenuLateral.Create(UniApplication);
      frMenuLateral.Parent := TWinControl(AOwner);
      frMenuLateral.ShowModal(
                             procedure (Sender : TComponent; Result : integer)
                             begin
                               frMenuLateral.Release;
                             end
                          );
end;

end.
