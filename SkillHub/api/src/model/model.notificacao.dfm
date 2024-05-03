inherited DmNotificacao: TDmNotificacao
  Height = 410
  Width = 565
  PixelsPerInch = 120
  inherited Conexao: TFDConnection
    Connected = True
  end
  object qryGetNotificacao: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from notificacao'
      '&FILTER')
    Left = 152
    Top = 280
    MacroData = <
      item
        Value = Null
        Name = 'FILTER'
        DataType = mdIdentifier
      end>
    object qryGetNotificacaoCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryGetNotificacaoTITULO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Size = 30
    end
    object qryGetNotificacaoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
    object qryGetNotificacaoTIPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
end
