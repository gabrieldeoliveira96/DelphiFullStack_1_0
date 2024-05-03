inherited DmServico: TDmServico
  Height = 273
  Width = 346
  inherited Conexao: TFDConnection
    Connected = True
    Left = 41
    Top = 29
  end
  inherited FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 238
    Top = 73
  end
  object qryPostServico: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from servico')
    Left = 56
    Top = 98
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
    object qryPostServicoKM: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'KM'
      Origin = 'KM'
    end
    object qryPostServicoVALOR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 10
      Size = 2
    end
    object qryPostServicoFAVORITADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FAVORITADO'
      Origin = 'FAVORITADO'
      FixedChar = True
      Size = 1
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
      ' S.CATEGORIA,  '
      ' S.KM,'
      ' C.DESCRICAO AS DESCRICAO_CATEGORIA,'
      ' S.SUBCATEGORIA,'
      ' SC.DESCRICAO AS DESCRICAO_SUBCATEGORIA,'
      ' S.PROFISSAO,'
      ' P.DESCRICAO AS DESCRICAO_PROFISSAO,'
      ' S.FOTO,'
      ' S.COD_USUARIO,'
      ' U.NOME,'
      ' S.DATA_INGRESSO,'
      ' S.VALOR,'
      ' S.FAVORITADO'
      'FROM SERVICO S'
      'JOIN CATEGORIA C ON C.COD = S.CATEGORIA'
      'JOIN SUBCATEGORIA SC ON SC.COD = S.SUBCATEGORIA'
      'JOIN PROFISSAO P ON P.COD = S.PROFISSAO'
      'JOIN USUARIO U ON U.COD = S.COD_USUARIO'
      '&FILTER')
    Left = 198
    Top = 166
    MacroData = <
      item
        Value = Null
        Name = 'FILTER'
        DataType = mdIdentifier
      end>
  end
end
