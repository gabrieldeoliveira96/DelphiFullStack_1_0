object DmCon: TDmCon
  OnCreate = DataModuleCreate
  Height = 391
  Width = 524
  PixelsPerInch = 120
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=skillhub'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 80
    Top = 56
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorLib = 
      'C:\Desenvolvimento\DelphiFullStack_1_0\SkillHub\api\exe\libmysql' +
      '.dll'
    Left = 256
    Top = 56
  end
end
