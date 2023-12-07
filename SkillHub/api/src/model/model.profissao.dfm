inherited DmProfissao: TDmProfissao
  PixelsPerInch = 120
  inherited Conexao: TFDConnection
    Connected = True
  end
  object qryGetProfissao: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' COD, '
      ' DESCRICAO,'
      ' FIGURINHA'
      'FROM PROFISSAO')
    Left = 80
    Top = 160
    object qryGetProfissaoCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGetProfissaoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryGetProfissaoFIGURINHA: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FIGURINHA'
      Origin = 'FIGURINHA'
    end
  end
end
