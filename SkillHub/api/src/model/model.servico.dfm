inherited DmServico: TDmServico
  PixelsPerInch = 120
  inherited Conexao: TFDConnection
    Connected = True
  end
  object qryPostServico: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from servico')
    Left = 88
    Top = 152
    object qryPostServicoCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPostServicoTITULO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Size = 50
    end
    object qryPostServicoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
    object qryPostServicoCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 12
    end
    object qryPostServicoENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object qryPostServicoNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryPostServicoBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object qryPostServicoCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 255
    end
    object qryPostServicoCATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
    end
    object qryPostServicoSUBCATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SUBCATEGORIA'
      Origin = 'SUBCATEGORIA'
    end
    object qryPostServicoPROFISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
    end
    object qryPostServicoFOTO: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryPostServicoCOD_USUARIO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_USUARIO'
      Origin = 'COD_USUARIO'
    end
    object qryPostServicoDATA_INGRESSO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_INGRESSO'
      Origin = 'DATA_INGRESSO'
    end
  end
  object qryGetServico: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' S.COD,'
      ' S.TITULO,'
      ' S.DESCRICAO,'
      ' S.CEP,'
      ' S.ENDERECO,'
      ' S.NUMERO,'
      ' S.COMPLEMENTO,'
      ' S.BAIRRO,'
      ' S.CATEGORIA,'
      ' C.DESCRICAO AS DESCRICAO_CATEGORIA,'
      ' S.SUBCATEGORIA,'
      ' SC.DESCRICAO AS DESCRICAO_SUBCATEGORIA,'
      ' S.PROFISSAO,'
      ' P.DESCRICAO AS DESCRICAO_PROFISSAO,'
      ' S.FOTO,'
      ' S.COD_USUARIO,'
      ' U.NOME,'
      ' S.DATA_INGRESSO'
      'FROM SERVICO S'
      'JOIN CATEGORIA C ON C.COD = S.COD'
      'JOIN SUBCATEGORIA SC ON SC.COD = S.SUBCATEGORIA'
      'JOIN PROFISSAO P ON P.COD = S.PROFISSAO'
      'JOIN USUARIO U ON U.COD = S.COD_USUARIO'
      '&FILTER')
    Left = 80
    Top = 240
    MacroData = <
      item
        Value = Null
        Name = 'FILTER'
        DataType = mdIdentifier
      end>
    object qryGetServicoCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGetServicoTITULO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Size = 50
    end
    object qryGetServicoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
    object qryGetServicoCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 12
    end
    object qryGetServicoENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object qryGetServicoNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryGetServicoCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 255
    end
    object qryGetServicoBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object qryGetServicoCATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
    end
    object qryGetServicoDESCRICAO_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CATEGORIA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryGetServicoSUBCATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SUBCATEGORIA'
      Origin = 'SUBCATEGORIA'
    end
    object qryGetServicoDESCRICAO_SUBCATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_SUBCATEGORIA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryGetServicoPROFISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
    end
    object qryGetServicoDESCRICAO_PROFISSAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_PROFISSAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryGetServicoFOTO: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryGetServicoCOD_USUARIO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_USUARIO'
      Origin = 'COD_USUARIO'
    end
    object qryGetServicoNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryGetServicoDATA_INGRESSO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_INGRESSO'
      Origin = 'DATA_INGRESSO'
    end
  end
end
