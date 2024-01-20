unit uUrl;

interface
  const PortaServer = '9000';
  const IpServer = 'localhost';
  const UrlServidor = 'http://'+IpServer+':'+PortaServer+'/';

  const UrlValidarLogin = UrlServidor+'login';
  const UrlCadastrarUsuario = UrlServidor+'cadastrar/usuario';
  const UrlListaCategoria = UrlServidor+'listar/categoria';
  const UrlListaProfissao = UrlServidor+'listar/profissao';
  const UrlListaServico = UrlServidor+'listar/servico';
  const UrlListaSubCategoria = UrlServidor+'listar/subcategoria';


implementation

end.
