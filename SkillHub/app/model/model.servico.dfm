inherited dmServico: TdmServico
  PixelsPerInch = 120
  object memServico: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 136
    object memServicoCOD: TIntegerField
      FieldName = 'COD'
    end
    object memServicoTITULO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Size = 50
    end
    object memServicoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
    object memServicoCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 12
    end
    object memServicoENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object memServicoNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object memServicoCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 255
    end
    object memServicoBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object memServicoCATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
    end
    object memServicoDESCRICAO_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CATEGORIA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object memServicoSUBCATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SUBCATEGORIA'
      Origin = 'SUBCATEGORIA'
    end
    object memServicoDESCRICAO_SUBCATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_SUBCATEGORIA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object memServicoPROFISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
    end
    object memServicoDESCRICAO_PROFISSAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_PROFISSAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object memServicoCOD_USUARIO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_USUARIO'
      Origin = 'COD_USUARIO'
    end
    object memServicoNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 80
    end
    object memServicoDATA_INGRESSO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_INGRESSO'
      Origin = 'DATA_INGRESSO'
    end
    object memServicoKM: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'KM'
      Origin = 'KM'
    end
    object memServicoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object memServicoFOTO: TMemoField
      FieldName = 'FOTO'
      BlobType = ftMemo
    end
  end
end
