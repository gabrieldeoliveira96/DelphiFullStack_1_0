object dmPrivacidade: TdmPrivacidade
  Height = 205
  Width = 330
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=skillhub'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 51
    Top = 36
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Desenvolvimento\DelphiFullStack_1_0\SkillHub\api\exe\libmysql' +
      '.dll'
    Left = 164
    Top = 36
  end
  object qryPrivacidade: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from privacidade where cod_user = :cod')
    Left = 50
    Top = 112
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qryPrivacidadecod_user: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_user'
      Origin = 'cod_user'
    end
    object qryPrivacidadedados: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dados'
      Origin = 'dados'
      FixedChar = True
      Size = 1
    end
    object qryPrivacidadeacesso: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'acesso'
      Origin = 'acesso'
      FixedChar = True
      Size = 1
    end
    object qryPrivacidadeperfil: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'perfil'
      Origin = 'perfil'
      FixedChar = True
      Size = 1
    end
    object qryPrivacidadenotificacoes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'notificacoes'
      Origin = 'notificacoes'
      FixedChar = True
      Size = 1
    end
    object qryPrivacidadeconta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'conta'
      Origin = 'conta'
      FixedChar = True
      Size = 1
    end
    object qryPrivacidadecompartilhamento_dados: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'compartilhamento_dados'
      Origin = 'compartilhamento_dados'
      FixedChar = True
      Size = 1
    end
  end
end
