object LoginServices: TLoginServices
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = UniGUIMainModuleDestroy
  MonitoredKeys.Keys = <>
  Height = 480
  Width = 640
  object RESTLogin: TRESTClient
    BaseURL = 'http://localhost:9000/login'
    Params = <>
    SynchronizedEvents = False
    Left = 56
    Top = 32
  end
  object RequestLogin: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTLogin
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'bodyA2C773ACAA71421EA85F48DC2B0E1639'
        Value = '{'#13#10'  "email":"[]",'#13#10'  "senha":"1234"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponseLogin
    SynchronizedEvents = False
    Left = 136
    Top = 32
  end
  object ResponseLogin: TRESTResponse
    Left = 232
    Top = 32
  end
  object RequestCadUsuario: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTCadUsuario
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'bodyFE35DE3584C94140B3CEBDFAE6C2740F'
        Value = 
          '{'#13#10'  "nome": "zezinho",'#13#10'   "email":"zezinho@teste.com",'#13#10'  "sen' +
          'ha": "123",'#13#10'  "cpf":"123456789",'#13#10'  "tipo_usuario": "colaborado' +
          'r",'#13#10'  "foto":""'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponseCadUsuario
    SynchronizedEvents = False
    Left = 136
    Top = 104
  end
  object ResponseCadUsuario: TRESTResponse
    Left = 232
    Top = 104
  end
  object RESTCadUsuario: TRESTClient
    BaseURL = 'http://localhost:9000/cadastrar/usuario'
    Params = <>
    SynchronizedEvents = False
    Left = 48
    Top = 104
  end
end
