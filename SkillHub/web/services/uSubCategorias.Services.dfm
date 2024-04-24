object SubCategoriasServices: TSubCategoriasServices
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object RESTSubCategoria: TRESTClient
    BaseURL = 'http://localhost:9000/listar/subcategoria'
    Params = <>
    SynchronizedEvents = False
    Left = 40
    Top = 24
  end
  object RequestSubCategoria: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTSubCategoria
    Params = <
      item
      end>
    Response = ResponseSubCategoria
    SynchronizedEvents = False
    Left = 152
    Top = 24
  end
  object ResponseSubCategoria: TRESTResponse
    Left = 280
    Top = 24
  end
end
