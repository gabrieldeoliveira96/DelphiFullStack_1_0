inherited DmUsuario: TDmUsuario
  PixelsPerInch = 120
  inherited Conexao: TFDConnection
    Connected = True
  end
  object qryInsereUsuario: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' COD,'
      ' NOME,'
      ' EMAIL,'
      ' SENHA,'
      ' CPF,'
      ' TIPO_USUARIO,'
      ' FOTO'
      'FROM USUARIO')
    Left = 80
    Top = 168
    object qryInsereUsuarioCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryInsereUsuarioNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 80
    end
    object qryInsereUsuarioEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryInsereUsuarioSENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 25
    end
    object qryInsereUsuarioCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 16
    end
    object qryInsereUsuarioTIPO_USUARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_USUARIO'
      Origin = 'TIPO_USUARIO'
      Size = 11
    end
    object qryInsereUsuarioFOTO: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
end
