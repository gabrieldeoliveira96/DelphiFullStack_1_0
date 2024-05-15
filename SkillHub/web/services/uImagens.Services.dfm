object ImagensServices: TImagensServices
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object RESTCategorias: TRESTClient
    BaseURL = 'http://localhost:9000/listar/categoria'
    Params = <>
    SynchronizedEvents = False
    Left = 80
    Top = 24
  end
  object RequestCategorias: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTCategorias
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body2DF337CF547F4EF8BF56303BB0F46D7A'
        Value = 
          '{"senha":"111","email":"q@teste","cpf":"*","foto":"*","nome":"q"' +
          ',"tipo_usuario":"cliente"}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponseCategorias
    SynchronizedEvents = False
    Left = 168
    Top = 24
  end
  object ResponseCategorias: TRESTResponse
    Left = 280
    Top = 24
  end
  object RESTProfissoes: TRESTClient
    BaseURL = 'http://localhost:9000/listar/profissao'
    Params = <>
    SynchronizedEvents = False
    Left = 72
    Top = 104
  end
  object RequestProfissoes: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTProfissoes
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body6ACD2E39597E4BF19C801C0616EE86F6'
        Value = 
          '{"senha":"111","email":"q@teste","cpf":"*","foto":"*","nome":"q"' +
          ',"tipo_usuario":"cliente"}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponseProfissoes
    SynchronizedEvents = False
    Left = 168
    Top = 104
  end
  object ResponseProfissoes: TRESTResponse
    Left = 288
    Top = 104
  end
  object RESTServicos: TRESTClient
    BaseURL = 'http://localhost:9000/listar/servico'
    Params = <>
    SynchronizedEvents = False
    Left = 64
    Top = 184
  end
  object RequestServicos: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTServicos
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body7B50B6648FDF4C34846D453281691A24'
        Value = 
          '{"senha":"111","email":"q@teste","cpf":"*","foto":"*","nome":"q"' +
          ',"tipo_usuario":"cliente"}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponseServicos
    SynchronizedEvents = False
    Left = 168
    Top = 184
  end
  object ResponseServicos: TRESTResponse
    Left = 296
    Top = 184
  end
  object RESTPutFavorito: TRESTClient
    BaseURL = 'http://localhost:9000/favoritar/servico'
    Params = <>
    SynchronizedEvents = False
    Left = 72
    Top = 272
  end
  object RequestPutFavorito: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTPutFavorito
    Method = rmPUT
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'bodyDA66DF1A2BCF454A80D4802981026B57'
        Value = '{'#13#10'  "cod":"1",'#13#10'  "favoritado": "N"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponsePutFavorito
    SynchronizedEvents = False
    Left = 176
    Top = 272
  end
  object ResponsePutFavorito: TRESTResponse
    Left = 304
    Top = 272
  end
  object RESTCadServico: TRESTClient
    BaseURL = 'http://localhost:9000/cadastrar/servico'
    Params = <>
    SynchronizedEvents = False
    Left = 56
    Top = 344
  end
  object RequestCadServico: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTCadServico
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body340AE3516B614F77891D4944F53F1409'
        Value = 
          '{'#13#10'    "titulo":"Problema com impressora",'#13#10'    "descricao":"min' +
          'ha impressora nao esta imprindo",'#13#10'    "cep":"29902400",'#13#10'    "e' +
          'ndereco":"avenida presinte cafe filho",'#13#10'    "numero":"100",'#13#10'  ' +
          '  "bairro":"bnh",'#13#10'    "complemento":"proximo ao supermecado",'#13#10 +
          '    "categoria":"3",'#13#10'    "subcategoria":"4",'#13#10'    "profissao":"' +
          '7",'#13#10'    "foto":"",'#13#10'    "cod_usuario":"11",'#13#10'    "km": 1,'#13#10'    ' +
          '"valor": 100,'#13#10'    "favoritado": "N"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    SynchronizedEvents = False
    Left = 176
    Top = 344
  end
end
