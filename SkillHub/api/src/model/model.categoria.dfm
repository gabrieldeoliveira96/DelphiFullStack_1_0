inherited DmCategoria: TDmCategoria
  Height = 250
  Width = 335
  inherited Conexao: TFDConnection
    Connected = True
    Left = 51
    Top = 36
  end
  inherited FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 154
    Top = 115
  end
  object qryGetCategoria: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' COD,'
      ' DESCRICAO,'
      ' FIGURINHA'
      'FROM CATEGORIA')
    Left = 64
    Top = 128
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
