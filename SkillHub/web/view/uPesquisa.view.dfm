inherited frPesquisa: TfrPesquisa
  ClientHeight = 608
  ClientWidth = 690
  Caption = 'Pesquisa'
  FormStyle = fsStayOnTop
  OnClose = UniFormClose
  Visible = True
  PageMode = True
  Layout = 'anchor'
  ExplicitWidth = 690
  ExplicitHeight = 608
  TextHeight = 14
  inherited UniScrollBox2: TUniScrollBox
    Width = 690
    Height = 608
    ExplicitWidth = 690
    ExplicitHeight = 608
    inherited pnlMain: TUniPanel
      Width = 688
      Height = 606
      ExplicitWidth = 688
      ExplicitHeight = 606
      inherited imgSer1: TUniImage
        Left = 328
        ExplicitLeft = 328
      end
      inherited imgServ3: TUniImage
        Left = 545
        Top = 475
        ExplicitLeft = 545
        ExplicitTop = 475
      end
      inherited UniLabel1: TUniLabel
        Visible = False
      end
      object pnlImage: TUniPanel
        Left = 220
        Top = 10
        Width = 268
        Height = 101
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        BorderStyle = ubsNone
        Caption = ''
        Color = 16772848
      end
      object sbServicos: TUniScrollBox
        Left = 3
        Top = 265
        Width = 674
        Height = 304
        Hint = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 6
        ScrollDirection = sdVertical
      end
      object pnlPesquisa: TUniPanel
        Left = 0
        Top = 112
        Width = 685
        Height = 58
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        ParentColor = True
        DesignSize = (
          685
          58)
        object lblDivPesquisa: TUniLabel
          Left = 0
          Top = 0
          Width = 17
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'DIV'
          TabOrder = 3
        end
        object edtPesqServico: TUniFSEdit
          Left = 39
          Top = 5
          Width = 630
          Height = 46
          Hint = ''
          PasswordStrong.MinChars = 6
          PasswordStrong.Toogle = False
          PasswordStrong.Toltip = False
          PasswordStrong.Progress = False
          PasswordStrong.TextWeak = 'Fraca'
          PasswordStrong.TextMedium = 'Media'
          PasswordStrong.TextStrong = 'Forte'
          PasswordStrong.TextVeryStrong = 'Muito Forte'
          PasswordStrong.TextMinChar = 'Min'
          PasswordStrong.TextLenghtMinChar = 'chars'
          BorderStyle = ubsNone
          Text = ''
          ParentFont = False
          Font.Color = 10329501
          Font.Name = 'Roboto'
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Color = clWhite
          EmptyText = 'Pesquisar Servi'#231'os'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.ShowMessage = False
          ScreenMask.Color = 14313335
          OnKeyUp = edtPesqServicoKeyUp
        end
        object UniImage2: TUniImage
          Left = 4
          Top = 14
          Width = 32
          Height = 33
          Hint = ''
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000290000
            002608060000005936B223000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000002
            FF4944415478DAED984D76DA3010C747A67C2CE1067082C009EA2CFB80573841
            51174D48172127C03901E9A2D0AC949E0078C03AE5047083901384650B89D511
            B26B173016C694E435F39EC1E6A1D14F33D2587F117801460E0DF00A298CB176
            F227BCC9026869FB370DCC29016DF289E6C707831460BF20F681032FE1A3EEF5
            3F0E80B0D0D180774F68B1F3CF205B6C5047B81A364A3A20FC9E0019B95C2639
            9819FC3E72FD3601306995167FEC0DB2C5DA6902D1364265AD380DF1C348C0E3
            98D2F2D4AB0D404C44BA8EFF4F5BDD19559ABF0C1DD2EAEC5676142C222DD633
            B06D5D76483A719851AFC16D0DF937201F62E44ADB3877DB5736C86A006D6BB0
            3718511A12E4E04E3815A33FA5F97210B8E54173888EC49CC6A97371460B573B
            415EE32231811B22C50998E582467015B4A7A3CF5BF934CF5469791208D29DE6
            08905C9835CF02C5089273BCC5B4177CD3EE0139A82020C3DB2E3A29850928AC
            81B53601D107719F8079CA2F4B1E907D910E1D6B62F96CC742EC654E1FFE7373
            0572DB51068754CF16596D2C27368E708C23CCED0350F623E67DF44E2C4C2C47
            9980907C88A9D6F70569670C01A6A7B4907A9690B2AF3E17DF98EE8DF5FAA5A6
            5B365649C36E90EA195B1BE626EB3FC8ED98DA1B2120A455D0F917DCB0D4B686
            B41DE06BF1F2332D1AFB8194FB02BC8EFD76555E90BA488548791CA31976AD74
            6AA4FF7CF484948EFEBC11AE70015D84052875516C24A2A8F148E5E4E3BBEF3B
            403ADB2A55672AD664833659E823B5286E841476CDFA3513EB2E915A86EE2AA8
            BEB17E033353933BFCD9B1EAA254900FCED63FA846B1CA9A784FEB969F7021D7
            804E54758E35FFCE1D85492C285B2FA9812A4BDA26EB9550F4375CCA6F8253A0
            83D7501C063CC16C510122104B3E2D54257F8BA92DD9F2572ACCC78ABC770B3B
            7FD0AD0F0764F970CB543F93F2D71DF95505BA1934F0318BACA52252E408D399
            E24092D2219FCAC30232E630EB7A752E764171888A5A9CF5033DE881952AE8C1
            4FD59641D729D38343DA860BF30671DE1398E796A3F96C2037D92BE47F05F91B
            4FCB9A36F53068240000000049454E44AE426082}
          Proportional = True
        end
      end
      object UniFSButton1: TUniFSButton
        Left = 656
        Top = 3
        Width = 29
        Height = 28
        Hint = ''
        StyleButton = Purple
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'X'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Name = 'Roboto'
        TabOrder = 8
        OnClick = UniFSButton1Click
      end
      object PnlSubCategorias: TUniPanel
        Left = 3
        Top = 176
        Width = 682
        Height = 73
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Color = 16772848
        object lblDivSubCategorias: TUniLabel
          Left = 0
          Top = 0
          Width = 3
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = ''
          Align = alClient
          TabOrder = 1
        end
        object LblDescFiltroSubCategoria: TUniLabel
          Left = 18
          Top = 5
          Width = 115
          Height = 13
          Hint = ''
          Visible = False
          Caption = 'Filtro de subcategorias'
          ParentFont = False
          Font.Color = 10329501
          Font.Height = -12
          Font.Name = 'Roboto'
          TabOrder = 2
        end
      end
    end
  end
end
