inherited frContrataServico: TfrContrataServico
  ClientHeight = 406
  ClientWidth = 730
  Caption = 'frContrataServico'
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  LayoutConfig.Padding = '5'
  LayoutConfig.BodyPadding = '5'
  ExplicitWidth = 746
  ExplicitHeight = 445
  TextHeight = 14
  inherited UniScrollBox2: TUniScrollBox
    Width = 730
    Height = 406
    ExplicitWidth = 730
    ExplicitHeight = 406
    inherited pnlMain: TUniPanel
      Width = 728
      Height = 404
      ExplicitWidth = 728
      ExplicitHeight = 404
      inherited imgSer1: TUniImage
        Left = 368
        ExplicitLeft = 368
      end
      inherited imgServ3: TUniImage
        Left = 585
        Top = 273
        ExplicitLeft = 585
        ExplicitTop = 273
      end
      inherited UniLabel1: TUniLabel
        Visible = False
      end
      object UniPanel1: TUniPanel
        Left = 32
        Top = 78
        Width = 273
        Height = 297
        Hint = ''
        TabOrder = 5
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Color = 16772848
        object lblImgServico: TUniLabel
          Left = 0
          Top = 0
          Width = 69
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'lblImgServico'
          Align = alClient
          TabOrder = 1
        end
      end
      object PnlDiv: TUniPanel
        Left = 336
        Top = 64
        Width = 377
        Height = 297
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Color = 16772848
        object lblDivPrincipal: TUniLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'lblDIVPrincipal'
          Align = alClient
          TabOrder = 1
        end
        object pnlDivPreco: TUniPanel
          Left = 32
          Top = 216
          Width = 145
          Height = 62
          Hint = ''
          ParentFont = False
          Font.Color = clWhite
          Font.Name = 'Roboto'
          TabOrder = 2
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = 'R$ 50,00'
          Color = clWhite
          object lblDivPreco: TUniLabel
            Left = 0
            Top = 0
            Width = 73
            Height = 13
            Hint = ''
            TextConversion = txtHTML
            Caption = 'lblDIVPrincipal'
            Align = alClient
            ParentColor = False
            Color = clWhite
            TabOrder = 1
          end
          object lblPreco: TUniLabel
            Left = 31
            Top = 22
            Width = 61
            Height = 20
            Hint = ''
            Caption = 'lblPreco'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = 20
            Font.Name = 'Roboto'
            TabOrder = 2
          end
        end
        object UniImage1: TUniImage
          Left = 24
          Top = 67
          Width = 17
          Height = 14
          Hint = ''
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000170000
            00220806000000B49D42BE000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000002
            0C4944415478DAAD96ED718240108639B500D28176A01D4005D10A341544FCF8
            ADF9EBC7600762053115682A900E2415C40694BC6B0E0795DB3BC49D61703CF6
            D965F7BD3D84C5D8743A754AA5D22B7E3671D9711CDB7229144284A7D369351C
            0EB72A7FC1409780552D8D2148846BDCEBF5562CDCF77D1BD98C00EDEAA01941
            16FD7EDF53C267B3D90EB77A5E70CAC272B9EC7A9E77B882CFE773FF918CB937
            1012DC017859149CB2D660305827F0BD49F372641F21FB9A409D49669F9AE7A9
            866B24F003474A82E469730E78D615C89A24D7611E0A2B954A0B4D8A92FFA0AA
            EAF178A484B8E60742A71074BF9606DF04D8A9DEE0AC7FC06326EB2FECC0A66A
            1DBE016E6D552975F00FC0C7AA75ECE431321CA9D659386C0B49B94CE65477E5
            9B099D0C3535DF336F1D0A6D74340643CCBD550B66D0864B8AFA2550B72E00BE
            A5B72D2E0A404047F73012EA089A84F2F56C9D431EA3729EB7BFAEEB792D51D9
            652A3E61DC26E010E006FDBEC065F737D67F4D1FB548CEF3E80AFE840057E03B
            78810077E04C38D96432A9434A14C0444107801B591B4DA83C729C4EE753276B
            41705E50D002B777D5BA6EB0B170194025D10819D7385F2D9C3E90B0C136B7FF
            AB065A2EB8CC3EB052870282053880DF747E4670C8B32E8F34E3AC8DE1327B2A
            8D83267EA3898E898F313C91268DD2AC8FCE4270399A7F519297E45BF0697032
            1ACD9CAE0BC169EE983432B13FFDF02D4C15D099660000000049454E44AE4260
            82}
          Proportional = True
        end
        object lblTitulo: TUniLabel
          Left = 24
          Top = 24
          Width = 58
          Height = 19
          Hint = ''
          Caption = 'lblTitulo'
          ParentFont = False
          Font.Color = 14313335
          Font.Height = -16
          Font.Name = 'Roboto'
          TabOrder = 4
        end
        object lblDescricao: TUniLabel
          Left = 32
          Top = 96
          Width = 62
          Height = 13
          Hint = ''
          Caption = 'lblDescricao'
          ParentFont = False
          Font.Color = 10329501
          Font.Height = 13
          Font.Name = 'Roboto'
          TabOrder = 5
        end
        object lblLocalizacao: TUniLabel
          Left = 47
          Top = 67
          Width = 50
          Height = 13
          Hint = ''
          Caption = 'S'#227'o Paulo'
          ParentFont = False
          Font.Color = 10329501
          Font.Height = 13
          Font.Name = 'Roboto'
          TabOrder = 6
        end
        object lblKM: TUniLabel
          Left = 266
          Top = 230
          Width = 69
          Height = 30
          Hint = ''
          Caption = '10 km'
          ParentFont = False
          Font.Color = 14313335
          Font.Height = 30
          Font.Name = 'Roboto'
          TabOrder = 7
        end
        object UniImage2: TUniImage
          Left = 24
          Top = 191
          Width = 17
          Height = 14
          Hint = ''
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000240000
            00230806000000FC05A820000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000002
            084944415478DAD5D84D4EC2401400E0F7A6268A2B3881B813650137B027309C
            403C012D07B053D706EA09F008DC006E200BA5EEAC27809D26CA3CA71013F96D
            87690BBE0D2494CEC7BC37338F22EC59E0AE01A980B8E517018EC6DC3B1DEF04
            C4ADB7BC609F0D24A80350F1CF470120F65180CBBD529009C8B55F1B0204976F
            F39BEFCC3CB77566A70A729A7E0788EA0A5F1920E54C9554C606B996EF0824AE
            FA8BE54C75E54CD5120585454B486FCA98DF410C34F97DA99F18688B542D0ED3
            77DB253339903D1C415411470D44B9429C5A8A0471EBB942C89E74303310D4B8
            77DE4D00E45FCAFAE9698350DCF056F93109905641A730434F79C2C3913E4854
            B9571E6883C2706C5FA68C2E3538815C65A7B1AE8C73916E1DC974D9325D5E62
            20BD598A3F3B4AA05971436FE1748F8A311256554E7EA5C3550D85814C95A9DA
            866CD90F3DD7090D670D4CCE0A3D001C7BDB346C5A1D63B88B03B0E284E1F458
            31C464106769A7064A23FE2F282CE86F832A72D5E40D10450276B2FEA6E21DD1
            187DC9D783890854D2B81114220483EB15CDBC6AC46EFE5782C27F15C43E1C20
            B034106B46C4C74DB025D014831FE13151491CF367C664EA57EE514B20FD7655
            0595AB2EEE557320DE941B1EB14E069869C803DBBD6B5DF0B520FD364339C66E
            FBBCB00134A40C3133C042E33607BAB55FBA0878952167A93559B1CAC22719D9
            44AC55B6EBD83BD00F2263EC24EC0E5DD00000000049454E44AE426082}
          Proportional = True
        end
        object lblNome: TUniLabel
          Left = 47
          Top = 191
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'Nome'
          ParentFont = False
          Font.Color = 14313335
          Font.Name = 'Roboto'
          TabOrder = 9
        end
      end
      object btnFavoritar: TUniFSButton
        Left = 336
        Top = 376
        Width = 176
        Height = 49
        Hint = ''
        StyleButton = GoogleSilverRound
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'Favoritar'
        ParentFont = False
        Font.Color = 14313335
        Font.Height = 13
        Font.Name = 'Roboto'
        TabOrder = 7
        Images = UniImageList1
        ImageIndex = 0
        OnClick = btnFavoritarClick
      end
      object UniFSButton2: TUniFSButton
        Left = 553
        Top = 376
        Width = 176
        Height = 49
        Hint = ''
        StyleButton = Purple
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'Contratar'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = 13
        Font.Name = 'Roboto'
        TabOrder = 8
        Images = UniImageList1
        OnClick = UniFSButton2Click
      end
      object UniFSButton3: TUniFSButton
        Left = 684
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
        TabOrder = 9
        OnClick = UniFSButton3Click
      end
    end
  end
  object UniImageList1: TUniImageList
    DefaultOutputFormat = toPng
    Left = 240
    Top = 272
    Bitmap = {
      494C010102000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000361A1E8000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000361A1E8000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DA6676FFDA6676FFDA6676FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DA6676FFDA6576FFDA6676FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DA6676FF8F434ECF000000008F434ECFDA6676FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D96575FFD66274FDD86474FFD26272FBDA6676FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DA6676FF36191D7F00000000000000000000000036191D7FDA66
      76FF000000000000000000000000000000000000000000000000000000000000
      000000000000D96474FFDA6576FFDA6576FFDA6576FFDA6576FFD66374FDDA66
      76FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DA6676FF55272D9F00000000000000000000000000000000000000004420
      258FDA6676FF0000000000000000000000000000000000000000000000000000
      0000D96574FFD86574FFD96575FFDA6574FFDA6575FFDA6576FFDB6576FFDA64
      76FFDA6676FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000361A
      1E80DA6676FF0000000000000000000000000000000000000000000000000000
      0000DA6676FF36191E800000000000000000000000000000000000000000361A
      1D80DA6576FFD96476FFDA6576FFDB6476FFDA6576FFDB6475FFDA6676FFD964
      74FFDA6476FF36191E8000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DA66
      76FF000000000000000000000000000000000000000000000000000000000000
      000000000000DA6676FF0000000000000000000000000000000000000000D965
      74FFD96575FFDA6576FFD86475FEDB6675FFD96575FFDB6676FFDB6676FFDA66
      76FFD96474FFDA6475FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E0E1060BF5A
      68EF000000000000000000000000000000000000000000000000000000000000
      000000000000A74E5ADF150A0B500000000000000000000000001E0E1060D765
      75FED76475FEDA6576FFDA6575FFDB6576FFDA6676FFDA6676FFD96575FEDA66
      76FFDA6576FFDA6576FF140A0B50000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B3942BF1E0E
      1060000000000000000000000000000000000000000000000000000000000000
      0000000000001E0E10607B3943C00000000000000000000000007A3942BFD663
      73FDDA6476FFDA6676FFD66373FDDA6575FFD96575FFDA6575FFDA6575FFDA65
      76FFDA6576FFDA6576FF7A3942BF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D060740DA66
      76FF000000000000000000000000000000000000000000000000000000000000
      000000000000C05968EF0D0607400000000000000000000000000D060740D965
      75FFDA6576FFDA6475FFDA6575FFD96575FFD96575FFDB6576FFDA6475FFD965
      75FFD96576FFDA6576FF0D060740000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DA66
      76FF00000000000000000000000000000000DA6676FF00000000000000000000
      000000000000DA6676FF0000000000000000000000000000000000000000D965
      75FFDA6576FFDB6576FFD76474FEDB6676FFDA6476FFDB6576FFD96474FFD864
      74FFDA6676FFDB6575FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000301
      0120DA6676FF55282E9F44212590DA6676FFA74E5ADFDA6676FF442125906730
      38AFDA6676FF0301012000000000000000000000000000000000000000000301
      0120D96575FFD36172FBD96676FEDA6476FFB35361E7D96574FFDA6576FFD865
      76FED96575FF0301012000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004420258F673038AF00000000000000000000000055272D9F4420
      258F000000000000000000000000000000000000000000000000000000000000
      0000000000004420258F663038AF00000000000000000000000055272D9F4420
      258F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
