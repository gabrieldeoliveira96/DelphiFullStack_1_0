object dmPrivacidadeServices: TdmPrivacidadeServices
  Height = 480
  Width = 640
  object RESTPrivacidade: TRESTClient
    BaseURL = 'http://localhost:9000/obter/privacidade/usuario'
    Params = <>
    SynchronizedEvents = False
    Left = 40
    Top = 32
  end
  object RequestPrivacidade: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTPrivacidade
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'bodyDD9DA01458DE4796B6ABE4A81C95FB32'
        Value = '{'#13#10'  "cod":"11",'#13#10'  "senha": "555"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponsePrivacidade
    SynchronizedEvents = False
    Left = 128
    Top = 40
  end
  object ResponsePrivacidade: TRESTResponse
    Left = 232
    Top = 32
  end
  object RESTAlteraPrivacidade: TRESTClient
    BaseURL = 'http://localhost:9000/cadastrar/privacidade/usuario'
    Params = <>
    SynchronizedEvents = False
    Left = 40
    Top = 136
  end
  object RequestAlteraPrivacidade: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTAlteraPrivacidade
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'bodyEA736BAB8C8E4FA99804E3E0D227351D'
        Value = 
          '{'#13#10'    "codUser": 18,'#13#10'    "dados": "S",'#13#10'    "acesso": "N",'#13#10'  ' +
          '  "perfil": "S",'#13#10'    "notificacoes": "N",'#13#10'    "conta": "N",'#13#10' ' +
          '   "compartilhamentoDados": "S"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Response = ResponseAlteraPrivacidade
    SynchronizedEvents = False
    Left = 112
    Top = 144
  end
  object ResponseAlteraPrivacidade: TRESTResponse
    Left = 200
    Top = 152
  end
end
