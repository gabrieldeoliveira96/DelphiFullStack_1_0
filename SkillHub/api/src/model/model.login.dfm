inherited DmLogin: TDmLogin
  Height = 200
  Width = 268
  inherited Conexao: TFDConnection
    Connected = True
    Left = 41
    Top = 29
  end
  inherited FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 123
    Top = 92
  end
  object qryValidaLogin: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' COD,'
      ' NOME,'
      ' EMAIL,'
      ' CPF,'
      ' TIPO_USUARIO,'
      ' FOTO'
      'FROM USUARIO'
      'WHERE EMAIL = :EMAIL AND SENHA = :SENHA')
    Left = 51
    Top = 107
    ParamData = <
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
    object qryValidaLoginCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryValidaLoginNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 80
    end
    object qryValidaLoginEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryValidaLoginCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 16
    end
    object qryValidaLoginTIPO_USUARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_USUARIO'
      Origin = 'TIPO_USUARIO'
      Size = 11
    end
    object qryValidaLoginFOTO: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
end
