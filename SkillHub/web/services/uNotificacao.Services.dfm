object dmNotificacaoServices: TdmNotificacaoServices
  Height = 480
  Width = 640
  object RESTNotificacao: TRESTClient
    BaseURL = 'http://localhost:9000/obter/notificacao'
    Params = <>
    SynchronizedEvents = False
    Left = 48
    Top = 16
  end
  object RequestNotificacao: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTNotificacao
    Params = <>
    SynchronizedEvents = False
    Left = 152
    Top = 16
  end
end
