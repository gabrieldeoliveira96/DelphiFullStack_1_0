inherited DmUsuario: TDmUsuario
  Height = 250
  Width = 335
  inherited Conexao: TFDConnection
    Left = 51
    Top = 36
  end
  inherited FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 164
    Top = 36
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
    Left = 64
    Top = 134
    object qryInsereUsuarioCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
  object qryObterUsuario: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      ' COD,'
      ' NOME,'
      ' EMAIL,'
      ' CPF,'
      ' FOTO,'
      ' TIPO_USUARIO'
      'FROM USUARIO'
      'WHERE COD = :COD')
    Left = 70
    Top = 205
    ParamData = <
      item
        Name = 'COD'
        ParamType = ptInput
      end>
    object qryObterUsuarioCOD: TFDAutoIncField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryObterUsuarioNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 80
    end
    object qryObterUsuarioEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryObterUsuarioCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 16
    end
    object qryObterUsuarioFOTO: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryObterUsuarioTIPO_USUARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_USUARIO'
      Origin = 'TIPO_USUARIO'
      Size = 11
    end
  end
  object qryEditarSenha: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'update usuario set senha = :senha'
      'where cod = :cod')
    Left = 186
    Top = 128
    ParamData = <
      item
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        Name = 'COD'
        ParamType = ptInput
      end>
  end
end
