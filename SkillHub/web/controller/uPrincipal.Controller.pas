unit uPrincipal.Controller;

interface
  uses uImagens.Model,  uImagem.Servicos.Model, uMenu.View, uNotificacao.Services, uNotificacao.Model,
  uImagens.Services, uniGUIApplication, System.SysUtils, System.Classes, uCadastroServico.view,
  Vcl.Controls, uniPanel, uContrataServicos.View, uLogin.Services, uLogin.Model;

type
  TControllerPrincipal = class
    private
       FServices : TImagensServices;
       FServicesNotificacao: TdmNotificacaoServices;
    public
      function getListaCategorias: TImagensWSModel;
      function getListaProfissoes: TImagensWSModel;
      function getListaServicos(AKeyHeader: string = ''; AKeyValue: string =''): TImagemServicoModel;
      function getDadosUsuarioLogado: TLoginNovoUsuario;
      function getNotificacoes: TNotificacaoModel;
      procedure getTelaPesquisa(AOwner: TComponent; objAtual: TComponent);
      procedure getTelaMenuLateral(AOwner: TComponent);
      procedure getTelaNotificacoes(AOwner:TComponent);
      procedure getTelaCadastroServico(AOwner:TComponent);
      procedure getTelaContrataServico(AOwner: TComponent; AModel: TItemsImgServicosModel);
      procedure Favoritar(ACodServico, AFavoritado:string);
      procedure CadastrarNovoServico(AModel: TItemsImgServicosModel);

      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TControllerPrincipal }
uses uPesquisa.view, uNotificacao.View, strUtils;

procedure TControllerPrincipal.CadastrarNovoServico( AModel: TItemsImgServicosModel);
begin
  FServices.CadastrarNovoServico(AModel);
end;

constructor TControllerPrincipal.Create;
begin
  FServices := TImagensServices.Create(nil);
  FServicesNotificacao := TdmNotificacaoServices.Create(nil);
end;

destructor TControllerPrincipal.Destroy;
begin
  if Assigned(FServices) then
     FreeAndNil(FServices);

  if Assigned(FServicesNotificacao) then
     FreeAndNil(FServicesNotificacao);

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

function TControllerPrincipal.getNotificacoes: TNotificacaoModel;
begin
  result :=  FServicesNotificacao.GetNotification(ifthen(getDadosUsuarioLogado.TipoUsuario = 'colaborador', '2','1'));
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

procedure TControllerPrincipal.getTelaCadastroServico(AOwner: TComponent);
begin
   var frCadastroServico := TfrCadastraServico.Create(UniApplication);
      frCadastroServico.Parent := TWinControl(AOwner);

      frCadastroServico.ShowModal(
                             procedure (Sender : TComponent; Result : integer)
                             begin
                               frCadastroServico.Release;
                             end
                          );
end;

procedure TControllerPrincipal.getTelaContrataServico(AOwner: TComponent; AModel: TItemsImgServicosModel);
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

procedure TControllerPrincipal.getTelaNotificacoes(AOwner: TComponent);
begin
   var frNotificacoes := TfrNotificacao.Create(UniApplication);
      frNotificacoes.Parent := TWinControl(AOwner);
      frNotificacoes.ShowModal(
                             procedure (Sender : TComponent; Result : integer)
                             begin
                               frNotificacoes.Release;
                             end
                          );
end;

end.
