inherited DmCategoria: TDmCategoria
  PixelsPerInch = 120
  inherited Conexao: TFDConnection
    Connected = True
  end
  object qryGetCategoria: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' COD,'
      ' DESCRICAO,'
      ' FIGURINHA'
      'FROM CATEGORIA')
    Left = 80
    Top = 160
    object qryGetCategoriaCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGetCategoriaDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryGetCategoriaFIGURINHA: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FIGURINHA'
      Origin = 'FIGURINHA'
    end
  end
end
