object DmCon: TDmCon
  OnCreate = DataModuleCreate
  Height = 313
  Width = 419
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=skillhub'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 64
    Top = 45
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Desenvolvimento\DelphiFullStack_1_0\SkillHub\api\exe\libmysql' +
      '.dll'
    Left = 192
    Top = 144
  end
end
