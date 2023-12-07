inherited DmSubCategoria: TDmSubCategoria
  PixelsPerInch = 120
  inherited Conexao: TFDConnection
    Connected = True
  end
  object qryGetSubCategoria: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' SC.COD,'
      ' SC.DESCRICAO,'
      ' SC.COD_CATEGORIA,'
      ' '
      ' C.DESCRICAO AS DESCRICAO_CATEGORIA'
      'FROM SUBCATEGORIA SC'
      'JOIN CATEGORIA C ON C.COD = SC.COD_CATEGORIA')
    Left = 80
    Top = 160
    object qryGetSubCategoriaCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGetSubCategoriaDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryGetSubCategoriaCOD_CATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_CATEGORIA'
      Origin = 'COD_CATEGORIA'
    end
    object qryGetSubCategoriaDESCRICAO_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CATEGORIA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qryGetObterSubCategoria: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      ' C.COD,'
      ' C.DESCRICAO AS DESCRICAO_CATEGORIA,'
      ' C.FIGURINHA,'
      ' '
      ' SC.COD AS COD_SUBCATEGORIA,'
      ' SC.DESCRICAO AS DESCRICAO_SUBCATEGORIA,'
      ' SC.COD_CATEGORIA'
      'FROM CATEGORIA C'
      'JOIN SUBCATEGORIA SC ON SC.COD_CATEGORIA = C.COD'
      'WHERE C.COD = :COD')
    Left = 80
    Top = 248
    ParamData = <
      item
        Name = 'COD'
        ParamType = ptInput
      end>
    object qryGetObterSubCategoriaCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryGetObterSubCategoriaDESCRICAO_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CATEGORIA'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryGetObterSubCategoriaFIGURINHA: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FIGURINHA'
      Origin = 'FIGURINHA'
    end
    object qryGetObterSubCategoriaCOD_SUBCATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_SUBCATEGORIA'
      Origin = 'COD'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryGetObterSubCategoriaDESCRICAO_SUBCATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_SUBCATEGORIA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryGetObterSubCategoriaCOD_CATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_CATEGORIA'
      Origin = 'COD_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
