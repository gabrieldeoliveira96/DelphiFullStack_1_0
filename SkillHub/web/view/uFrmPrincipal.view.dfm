inherited FrPrincipal: TFrPrincipal
  Left = 494
  Caption = 'FrPrincipal'
  WindowState = wsMaximized
  Position = poDesigned
  AutoScroll = True
  PageMode = True
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 14
  inherited UniScrollBox2: TUniScrollBox
    ScrollDirection = sdVertical
    ScrollHeight = 963
    inherited pnlMain: TUniPanel
      Width = 799
      Height = 963
      Align = alTop
      ParentAlignmentControl = False
      ExplicitWidth = 799
      ExplicitHeight = 963
      DesignSize = (
        799
        963)
      inherited imgSer1: TUniImage
        Left = 388
        Top = -24
        Width = 0
        Height = 123
        Anchors = [akLeft, akTop, akRight, akBottom]
        ExplicitLeft = 388
        ExplicitTop = -24
        ExplicitWidth = 0
        ExplicitHeight = 123
      end
      inherited imgServ2: TUniImage
        Left = 5
        Top = 287
        ExplicitLeft = 5
        ExplicitTop = 287
      end
      inherited imgServ3: TUniImage
        Left = 665
        Top = 803
        ExplicitLeft = 665
        ExplicitTop = 803
      end
      object pnlBottom: TUniPanel [3]
        Left = 11
        Top = 747
        Width = 777
        Height = 201
        Hint = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 6
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        ParentColor = True
        object sbCardsServicos: TUniScrollBox
          Left = 0
          Top = 0
          Width = 777
          Height = 201
          Hint = ''
          Align = alClient
          Color = 16772848
          TabOrder = 1
          ScrollDirection = sdVertical
          ScrollHeight = 154
          ScrollWidth = 1045
          object UniPanel2: TUniPanel
            Left = 842
            Top = 28
            Width = 203
            Height = 126
            Hint = ''
            TabOrder = 0
            Caption = 'UniPanel1'
            object UniLabel10: TUniLabel
              Left = 1
              Top = 1
              Width = 51
              Height = 13
              Hint = ''
              Caption = 'UniLabel4'
              Align = alClient
              TabOrder = 1
            end
          end
        end
      end
      object pnlCategoria: TUniPanel [4]
        Left = 11
        Top = 151
        Width = 777
        Height = 237
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        ParentColor = True
        object sbCategoria: TUniScrollBox
          Left = 0
          Top = 0
          Width = 777
          Height = 237
          Hint = ''
          Align = alClient
          TabOrder = 1
          ScrollDirection = sdVertical
        end
      end
      object pnlPesquisa: TUniPanel [5]
        Left = 16
        Top = 408
        Width = 777
        Height = 58
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        ParentColor = True
        DesignSize = (
          777
          58)
        object UniLabel4: TUniLabel
          Left = 0
          Top = 0
          Width = 17
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'DIV'
          TabOrder = 3
        end
        object UniFSEdit1: TUniFSEdit
          Left = 39
          Top = 5
          Width = 708
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
      object pnlProfissoes: TUniPanel [6]
        Left = 11
        Top = 472
        Width = 795
        Height = 279
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Color = 16772848
        DesignSize = (
          795
          279)
        object UniLabel5: TUniLabel
          Left = 3
          Top = 23
          Width = 61
          Height = 15
          Hint = ''
          Caption = 'Profiss'#245'es'
          ParentFont = False
          Font.Height = 15
          Font.Name = 'Roboto'
          TabOrder = 1
        end
        object sbProfissoes: TUniScrollBox
          Left = 2
          Top = 44
          Width = 776
          Height = 221
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          Color = 16772848
          TabOrder = 2
          ScrollDirection = sdHorizontal
        end
      end
      object pnlTop: TUniPanel [7]
        Left = 451
        Top = 25
        Width = 345
        Height = 54
        Hint = ''
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 10
        BorderStyle = ubsNone
        Alignment = taRightJustify
        ShowCaption = False
        Caption = ''
        ParentColor = True
        DesignSize = (
          345
          54)
        object UniLabel2: TUniLabel
          Left = 101
          Top = 24
          Width = 52
          Height = 15
          Cursor = crHandPoint
          Hint = ''
          Caption = 'Favoritos'
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Color = 14313335
          Font.Height = 15
          Font.Name = 'Roboto'
          TabOrder = 1
        end
        object UniLabel3: TUniLabel
          Left = 190
          Top = 24
          Width = 72
          Height = 15
          Cursor = crHandPoint
          Hint = ''
          Caption = 'Notifica'#231#245'es'
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Color = 14313335
          Font.Height = 15
          Font.Name = 'Roboto'
          TabOrder = 2
        end
        object UniImage1: TUniImage
          Left = 283
          Top = 0
          Width = 45
          Height = 54
          Hint = ''
          Margins.Right = 10
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000B50000
            00B508060000001953BEA90000000473424954080808087C0864880000000970
            48597300002E2300002E230178A53F760000001974455874536F667477617265
            007777772E696E6B73636170652E6F72679BEE3C1A000019CC4944415478DAED
            9D098C245779C7ABBBBAABAABBCE3EE6D8D95DAF174709200B73183087401104
            221B833102148708ECD80627D8241048108A4320818444C260CEF8088460E160
            9B1536770E292860676DD6C6C8445CBBF6EECEDD479DDD557DE5FB6A7696D9DD
            39BAA7ABEA5557BDDFAAB68FE9AEFEAAEADFAFFFEFFA5E86A18C4CAD56DBCFB0
            EC8B5926F7EC6C36F3749665CECB64B36A86C9C8D96CB608CFF1994C86852D83
            AF87E732EBEFEDF7FB03BC1D0070B707372E3CE70C9881094FE8BD1EF354BFDF
            FB29BCF248AFD77BB052A91C277DBC934666FC5D2497E5E56589E78BAF6732FD
            57B059F6A25C2E77209763359665233B6F20F87EA7D3D5BBDDEE93BD7EEF3166
            90FD0FDB36EE9D9B9B73489F9FB84245BD8146A371008AD56B73D9DC2B392EFF
            8C5C3EA76633F13B45FDC180E982D03DAFF30468FE7BFD7EF7CE52A9F424E9B8
            E242FCAE58C4341AC6EBF279F6ED2C9B7B21CFE7CB99188A781840E00E94E63F
            EE767B5F5214E99FE038BAA46322C5645EC131000F9B330CEB7AB011D7F33C7F
            210BBE82744C41035EBCD76EBB8F77BB9DCFA9AA7A1B08BC4F3AA628498DA8B1
            44E638F66610F245E0891327E4AD8092BBE779DE11D7ED7EA85C56EE271D4F14
            245AD4E091B56C96BD99E3F8B70A0257261D0F69D0A2B8AE779F9319BC675696
            9749C713168914F5EAAAFEC242217FAB20F0176F6C4EA3AC81CD8A604F0EB75A
            9D7756ABEA61D2F1044DA22EB8AEEB57E5F2DCDF1604FEFC49ADF04509D42F18
            10F7D196E7BEBFA26977938E27281271E5C12F5FC1F3F95B0B05611FE9582695
            76DBAB7B5EFB46A858DE453A967199685163E50FC4FC6910F35ED2B1248556AB
            7DBCDDF16E28ABEA3748C7B25B2652D4CD66F3825C2E7FAF28162F221D4B5201
            71FFAAD5722EAF542A4F908E6554264AD4F3F3F3454992FF15C47C05AD00860F
            562841DCDF761CFB4DD3D3D316E97886656284D16C9AEF1045E1965C2EC7938E
            256D74BADDB663B76ED234E536D2B10C43EC456D1846956573F7178B854B48C7
            92761CA7FD53C7B15E313535B5403A96ED88B5A89B4DE3FD60353E9CCBA5A707
            30EEF47ABDAE65391F8052FB63A463D98A588ABA56AB298250F80E2D9DE38B6D
            3B8FB96EFB6550913448C77236B11375BD6E5C2E49C2DDF97CBE403A16CAF674
            3A5D172CC95B344DBE87742C1B8995A8755DFF8C24493764B359D2A15086047B
            25C18EDCA928D21F928E659D5888FAE8D181303DDDFA2F6A372617AC44DAB6F9
            823834FD111775BD5E7F96284ADFE7B8BC423A16CA78789E67D8B6FD9272B9FC
            13927110153576734B72F19E1CCBE648C641098E2E603ACE1524BBD989891A04
            FD1E4511FF81F60C260FEC89340CEBDDA5927A0B89CF2722A8A66E7E5691C577
            D0E1A1C9052B90A6697F4A55E51BA3FEECC85505DFE02FC9B2F896A83F974206
            CB72BE0AD7FB4D517E66A4A2D64DEB6E458AF60029E4312DE7EBF0CBFCBAA83E
            2F32519BA6F53D49125F19D5E751E28565D9DF9165E977A3F8AC48446D18E6BD
            70405746F15994F862DBCE0350B05D1EF6E7842E6AF0D07782A7BA3AECCFA14C
            0650627F190AB850EB54A18A1A5B3954457A47989F41993CA0A0BB5555E59BC2
            DA7F68A2D675F32628A13F419BED2867B3365EC47AAFA228FF18C6FE43515C5D
            D72F5325E97EDAB142D98AB50E1AFBCA52493914F4BE03171D8EE59015E511DA
            F54DD9896EAFD73174FDD9414FEE0D54D43831B652A9CE735C5E8DF6F4502615
            CFEB98BADE9C0B72745FA0A2B66DFBF162B17861F4A78632C9D8B6734492C4E7
            06B5BFC0448D03FCC1F8DF40E6B450261D5DB76ED734F9BA20F61588A831ED97
            A24A5F8B63D6FDA8E976BB8CEB7A8CD7E9329D4E87E9F5FA7E6D1F2A46B8F60B
            83AD412C9B65F2F93CC3E5730CCF734C2E47AB1F787E74CB7A4D104356C75621
            540C55499216E12209A44F0C295A6D173B1530AB11CEDB1BF9FD791077A12030
            F013CC1484F4A635017FDD027F3D3DAEBF1E5BD470317F248AC5E7903E215183
            258B61588C0E1B96CE4181A5B6AA488C025B1AE76ADA8E735812C5178CB38FB1
            448D79395455FE08E91311256825E0B8B1B7D4177658A0A0354D61345566D2D6
            81659AE6581D33BB3E5B2B2B2B7B34AD743C4D89661CA7CDACD6EABBB218BB05
            ADC954B5ECDB93B4800973DAEDF63EB0B54BBB79FFAE459DA6E63B289C997AA3
            E997D0A4805F44A652D652536A8FD3CCB7AB33D434CDEBA176F879D2071E0550
            6A300B8B2B7E8B0669049E676667AB4C5AD661D275F33AB060B78FFABE91458D
            ABC0964AA5D534641F459BB1B0B81CA9DDD809B4237BF64C33F9143403C2796F
            9F3C992B1D3C98698FF2BE91456D9AF621492A4636358714D8A271727E09976C
            231DCA39403D86D93B37938AF66DCB72EE9165F18DA3BC6724511B86F1745114
            9F48FAE83BEC30414163E7495CC1121B859D742B82A3F96CBBF37445117E36EC
            7B4612A765B79E108BC233481F689860A5707E610957AD221DCA8E608BC81C58
            91A4E338AD1F8FB214CAD0A2C66C4A9A26073EF6356ED4EA645B3946A5545299
            7229D98322D772889897A9AAFACD615E3FB4A8E1DB7222E9AB6061E98CB663D2
            D8BB77C66F194932AD56FBA962B1706098D70E25EA46C3BC52D3A47B491F5898
            A0ED38797291713DF24D77A3C2717966DFDE3D4CD29BB0755D7F93A6695FDDE9
            75439D0628A517A1949E217D5061A21B26B3BADA201DC6AEC15E471C2F9264A0
            B49E87D27A47B7B0A3A87169644551BE4CFA80C2043DDB53C7E763D97C372CD8
            BC77DEFE3D89EF716C36AD37944AF27DDBBD66C73300A5F45128A5CF277D3061
            629A16B3BC52271DC6D84C4F551859164987112A4EABFD4BB158F88DED5EB3AD
            A85757F5E797CBF2FF26FDDB8F5EBA1D836EF0711104DE6FBB4E32F8AB5AAF9B
            9754ABEA435BBD665BB5DAB673183CCCC5A40F244CB00B1CAD4752386FFF9CDF
            319364C03D3C288AC5176DF5F72D458D8B728AA2B89CF4DEC3464367EAB02585
            7259634A5AB2571AC15E46CBB2AAAAAA6EEA19B711B57507F8B36B481F40D8CC
            2F2CFBD3B092425A7A19A11EF4794591374D69B7A5A85DD733382E2F930E3E4C
            D09F1D3D76C2BF4D0A58FF3978FEBEC4B782785E47E7794EDBF41C6CF624A60D
            2B29CA03A4030F1B1C237D022A894963FFBE5986E338D261844EA361BEB65C56
            EE3FFBF94D456DDBF6C3C562F179A4830E1BCB7298A5E555D26104CECC749591
            A422E93042072A8C0F4185F19CB537CF1135FC14B3DD6ECF4DC3DCC3A45512D7
            49436511C1B98C2CCBF260B5CE98017D8EA875DDFC6345913E453AE028A8D51A
            FEACF0A4A1A90A53A968E3EF680200AB7C5D45D3CE98F2758EA86DDB79AC582C
            3C8B74B051B0B252670C93F8AAC381A3C812333555261D4624388EF3235114CF
            B0CA67881AAC47B6D7EB7B2C9B4DBCF54096976B8C69D9A4C3081C591299E9E9
            0AE9302201AC720FAC32B7D1829C21EA7A5D7F4BA9A47C8974A051B1B25AF7B3
            2C250DCCF054ADA6A3A44674DD7AA3A6C9F7AC3F3E43D4A669FDBB2489AF201D
            6454D46A4DF0D49333CB655830B313E608490B6099BF05BABD74FDF119A2765D
            4FE7B87CF2ABCDA74041A3B09346A552F2D395A505D7F39A02CF97D61F9F1675
            A3D138A0AAEAB1A4F7446DC4765ACCE2E20AE9300267CFEC1403957DD26144C6
            DAC8BDFABE6AB57A121FFF5AD4BAF9214D91FE9274805192B4117AEBA461A4DE
            D940DDE86655953F8CF74F8B1A7CC90FE1DB7DC9EE773B991C7BF2849FE72329
            601E90F30F247A7EF4A65896F33FB22CBE14EF9F16B5EBBAE0A7B9D4F8E97596
            965619CB7648871118D83D8EDDE46963A3AFF6458DF9F12AD5AA99C6E52DB0F3
            65250153B9D6999E2A33B29CEC09B89BD1EF0FE03A2E4BB3B3B3B6AF625DB7FE
            4051C47F211D189993D1070B723211C34FB1928FD6238D2B10208661FCBEAAAA
            7765D61E585F003FF256D241912229164412C17ACCA4CF7AAC639AF61D8A225D
            EB8BDAB2EC4747C9559634263533D3D9E0A45B21C50B21398EF388288A17FBA2
            6EBB6E83E7B8F474416D028A7A1292426E455AA6716D47BBEDD50B05BEE28BBA
            0764D36AC44E81F31471BEE2A492F6521A0119F773B91C9BA9D56AFBCBE5F253
            A4038A034BCB357F3DC4490313D860221B0AE6AA599DCBD49ACD379755F52BA4
            838903B8BECBF1130B13D51983ABE7EEDFB727F1C9D78705D392650CC3F83B59
            96FF9C743071C1715AFEC24593C2ECEC1423A6689CC74E340DE36F3286697F4D
            968A57900E264E4C4AE2F534245C1F15D3B4EECBA465E6F8A8C4DD5FA76976CB
            28C02FEDE10CFCF7CB4241781AE960E206F6302E2EADFA76246EA0DDC04E9634
            0D131E9656ABFD8B8CD36A2D1704618A743071047BCE5757E33539174B689C54
            4B05BD3920EAA58CEB792697CFA76F04CC08606E90460CF283A07F2E510FBD2D
            9ED731339D4EC7CBE57279D2C1C41DEC9C419F8DCD7E51837985D03F63AF2165
            7BBADDAE9781FF7A2C367652760447F461A9AD479800073B562AE512432FD170
            60EF3888BAD78713460DDA08789E07E23670B650689F8123EED06AE0CA5B94E1
            8182A79FF1FFA3B58E5D01FECDAF4462D35F10BD90D82B88335770952DA8E790
            3EBC896400A0A80754D3E381CD7FE8B9D73677A4B518799E630A82E0FBE54281
            A7AD1A6382D7223348C2948F9881A71467AAE38615CBFE004A713CCBA0D76C26
            EB97C838DB1B372AE2E0A125352551F82535F5D49424E17B6ADAFA4149127E21
            4DDBA92949C26FA7A63D8A9424E1F728BAAE67721C1DFB414906FED80F1CD524
            087CBAA721531243BBED2EE2D0D35F1404E102D2C15028410085F4CFE9CC174A
            A2F067BE18A67D48968AAF231D0C851204FE1CC566D3FAA8AA8A7F413A180A25
            08FCD9E434EF072549349BE6EB6986264AA2F03334E11D9A4B8F92044EE7D2C3
            07EDB65BE779AE34EE4E291492B4DB5EAD50E0ABEBF9A97F248AC5E7900E8A42
            1907C7693D0C3A7EFEFA4A0277CAB27835E9A0289471D075EB764D93AF4BFD9A
            2F94E470C69A2FF3F3F3C59999199BD61529930AA6AF585A5A12E7E6E69C8DEB
            2836398EA3E97F281389EB7A0D41E0CB78FFB4A84DD3FE8124155F443A380A65
            375896FD7D59965E86F74F8B5AD7CD0F2A8AF457A483A35076836E9A1FD014E5
            2378FFB4A81B8DC60130D9C7E81C5CCAA48133C86BB5DADCD4D4D4023E3E43C1
            695D9F9C32D9785EA7C1F35C79FDF119A2364DEBBB9224FE0EE920299451B06D
            E71BA0DBD7AC3F3E43D4BAAE5FA528CA97490749A18C02AEC8552AC9F7AD3F3E
            43D4E04DB2BD5ECF63E9FA6523816DA4FDFEC04F2F36C0DBFE5AB2C83E78BDCD
            B2BA61BD257BAAEE827D03996CC64F4796C55BDA573012A0D72EC89587737A3A
            43E739B542CBB28F8862F1D9A4838D0B28503F2F5E772D375E17B75ECFCF91D7
            EBC2D6EF3141662344ADB359966173AC9F730F13AEE74EE5DDCBE7D66EA9F07F
            0D588F87C17A3C7FE373E788BAD96CBE5D55D5CF910E960428605C9FDC753DC6
            F53AFE6D17C41C3772206ECC96CA7379FF16976F4EABD09B4DF3EA5249F9C2C6
            E7CE11F59A05E9BB2C9BCD910E386CD01AA0881DA7CDB4DA6D5FC4938A9F12B8
            203045D850E469689A8502A70B5FF033AC07B2E99143917EB8582C5C4C3AE830
            40ABE0B45AFE2A00B6DD3AED7F930496DAA258F0572328140A4C52F5ED38AD07
            C12A9FD30BBEE9E1EABA7E99A2280F900E3A48D0461886C518A64D64312252A0
            279715895164D1B72D49A2D1685C562E97BF79F6F35B7E87E1A7D8E0B8BC4C3A
            F071C1252C9ABAE12F6191F6F4F2495A47C6F33C9DE7796DB3BF6D296AC3306F
            9365E95AD2C1EF162C99718D71CB0A6FB1A149459270C52F0D4AEEC96DB9352C
            EB73AA2CDFB0D9DFB611B551154571399B9DACDCD558F96B360DA6011B5DF963
            6BB09D5CD3147F9BB44A25AE7E6159565555D5FA667FDFF668A032F51054185F
            40FA208605ADC6F24A6DA25B31A206ADC8CC74056E39D2A10C0DFCFAFE5096C5
            176FF5F76D45BDB2D2BCB852510E4FC23719977E5B5D6DD0D27917E0F59DAA96
            18B09BA443D911BCBE7AABF5DC92281ED9F27876DA89E3B47E55280807491FCC
            76A07746CB41190F5CBFB15A29C7BA0910B39A827BF8CDED5EB363F8714E4B86
            DFDAE5E51A6385B8F26CDAC01692E9E96A6C858D69C54A25E5D076AF192A7428
            AD17A0B49E257D401B41412F81A0C35C4A39ADAC09BB12BB0A64BBED9E001DEE
            DFE9754345DD681857689AFC35D207B59195D5BADF99420907F4D7D353E5F177
            1420BA6EBD117478CF4EAF1BFAAB085EE62941E077FC964401FA67F4D19470A9
            54344653E33111AAD5728F158BC3D5ED8616755DD72FD364F901D23F49ADB6CB
            CCCF2F118D214DEC9D9BF107489104ADA66138AFD634E9BBC3BC7E2485DAB6FD
            78B158BC90D4C1E1E0A3E3271663391C34A960AFE3FE7D7B880E6D857AD3A392
            240E9DEB712451379BCD0B2449FA39CBB2448A6BEAA3C9804D7D535532FEBAD7
            EB0FEA75EBB7A6A7D59F0FFB9E91C56918E67D5089787DD40787BD84274E2E46
            FDB19453ECDB3BEB8FD98E1ACBB2BF027AFBBD51DE33B2A831EF5EB53A55CFE7
            73911AADF98565ACAC46F991940DE00484B93DD12EB7D9E9745B274FE6CA070F
            6646BAF0BBB2110DC3B8062A8D7744757038A6E3F88985A83E8EB205E8ADA31C
            B6AAEBE6F59AA6DC36EAFB76ED8DD1BC178B858BA238B85AADE98F89A690059B
            F7B0992F0A1CA7F58828167735FB6AD7A25E34CDE98A209CCC45309DE2E4FC92
            3F979042166CDAC326BEB0E9F67A5DB7DDDE2749D2AEDA6EC76AC568368DF7A9
            AAFCF7611FE4D163C7FDBC1A14B260B3DEC1F3F785FE398661BC5B55D58FEFF6
            FD6337CD45B10CF42F7F4557C48B0B173CEDBC50F76F59CE83B22C8E95527A6C
            51D76A354596E5C57C3E5F08EB40A9A8E34398A2EE743A4EB3D99C999E9E1EAB
            3322904E947ADDB85C55C5AF87D5EB74ECC913D8081FCABE29C38319A3CE3FB0
            37947D0F00D3342F05DBF1ED71F71558CFA0AE9BB72A8AF4CE300E7861619971
            681B35718AC502B367762A947D1B96758B2ACB7F1AC4BE02EDEEB62CFB51512C
            06DECCD768E84C1D360A59CA25D54FB110349BE5C31B8740457DF4E840989BF3
            16835E10A9DBED314F3E7532C85D5276C181F3E6024F88E37A5E73619EDB336A
            AFE176043E30A95EAF5F0815C72341B75F2F2CAE60837CD0E152864404EB311B
            B0F580C2AAD36A39CF5214E5FF82DC6F28A3ED745DBF5492A40782CC19826974
            B1AB9CCE168F1E1C43BF7FDF2C93CF07D7458EA3EF6CDB0AA462784EBC619D08
            A838DE24CBE227829C5440BD351982F6D2583099A6F92E10F427C38837D471D1
            61B4882C2DADD2D9E3118293706766AA81EED330CC8FABAAF2EEB0620E7DB0BF
            6158FF0C25F6DB82DA1F7ECB1741D8D45F870F36E1CDCE54039D556E9AF617A1
            A07B5B9871473283050EE45E492A5E19E43E69029B70C11C7B984432484CD33A
            A42872E8134C229B960507F46D49125F1DE43E71D2004EF1C24A242518704D99
            6AB5ECAF481024B6ED7C0BAEFFA5511C43A4730D75D3FA8A22896F0E729F34CB
            6930A0C38052142A851A1374A25BD374A08416239B0218F9045AF0D87780C7BE
            26E8FDBA9EC7ACACD469C6D35D80730FA7A6CA0C1F42E653C3B4BFA02AD2D551
            1E0F9159E1BA6E7E12847D631839444CCB66EA759DA6511802EC1F2B97554696
            C4C0F7BDD66C6785DACAB115C432D3E0D276B22C7F261BC2D0BEB5136AFB6DDA
            695ADF65585836EB4FCD525539947C796B1D2BCE9FC0FE436987DE09A2E9969A
            4DEB55A2283C90CBB1A1CCE6C4E4374DDDC45F8644AEC2352A587EA09035D8C2
            1A268C5DDF8E63BF368C9EC261219ED6B256AB3D5392A41F043D086A23FD5325
            B7AE1BA96C29C1160DB0010C58BED3CB4787010E4EF25CF745418FE51815E2A2
            468E1F1F144AE5D67F8B11ACDD683B2DBFE44E430E11CCD58125330E460A1BB0
            1B3F6E34EA97ECDFBF9F78AF582C44BD0E562025A978631479DBB022892B77E1
            B21A492ABDB1F207E7905164C92FA1C3C69FB162DB9F086A807F10C44AD448BD
            5EBF4C92E47F830B528CEA33DBAEE7AFB388229FC48A254EB3C2311A925C6404
            3EBAC4599ED771DAEDD61B48FAE7CD889DA8114C6D26CBCA3725497C79D49F8D
            A5368E2B419B82B946E2D8A183B61857D3425B81E33348E4B803BBF11854085F
            3AEE24D950CE0FE900B6C3308C3F2B148B1FCDB12C91F58751D0E8BDB124774F
            6D244A722C8951B8B809B0A1572695271C17B9771CE77DE3E4E5089B588B1A31
            4D733A9B65BF518CA012390C286A5FE05EC72FD5D19BF7BA3DA603B7E394EA28
            D23CF861CC078DBE38077E98E7F2BE9051D471C0B29DC79941F195B29C59261D
            CB76C45ED4EB60524A51287C1ABC76B0236D0204D338A0E8B14D1C058E59A5F0
            5F7F437A872C9B85939EF1C757A090B1528CA2C50E91B882D9476DBB7543A9A4
            7C91742CC33031A24670626FA562DF268A85ABC2E889A49C09F60C82D53854AB
            4957053931366C264AD4EB349BCD83F93C771778CB4B48AF419344D6EA12EE4F
            7BBDCC158A22FC8C743CA332D18AC009BE20EECF82B8C34DF0962270152CCFEB
            BE7DD84583E2C8448B7A1D4C7B2608F9CF80B8C34FC99950DA6D77C971DBEFAA
            68DADDA463199744887A9D46C3BC92E3731F2B08FC05D496EC0CDA0C10F32F5C
            B7F3DE9D96469E241279E5C1733F0F6CC9A704817F6190B9479242BF8F15C0F6
            43DD2CF34725513C423A9EA049F405C734C3B95CFE831CC7BF5510B878AD494C
            00ECD6765DEF3E273378CFAC2CC7BAAD791C122DEA8D60A512047E33C773CF23
            D54349826EB7D7F53CEFE16EB7F3D7711BA31116A911F53AE023B3755DBF46C8
            E76F8012FCA25C2E26DD7501D2C335535CF731CFEB7D5AD3E42F42FD22553324
            5227EAB381CAE5CB41D6EF020FFE729ECF9727B58289D6024AE4C39D4EEF76A8
            F4DD9536216F6432AF6048ACACACECE138E15AA85CBE8AE3F2174229AEC5B1E3
            12BBE13BDD6EB3E3757F02F7BFEB79EDDBA7A6A6E84293A7A0A2DE061C022B08
            E29520EEDF66D9CC45D96CEE603ECF6A6C840335C04AF4A1F46DF6FBDDA3BDDE
            E0D1C1A0F79FB66D1F9A9B9BA30905B7808A7A17589635D3E90C5EC264FBCF61
            33D96782C8CF839F7B0D36194AF662369BE1E13E0B9B2FFECC1A7EBBF0E0D450
            3EB8E9C3D6EBF7072E0817056AC2E306DC3FDE1BF49F60FA9947F2F9EC0F77BB
            96609AF97FA3DC309FBA08735F0000000049454E44AE426082}
          Proportional = True
          Align = alRight
          LayoutConfig.Padding = '0'
        end
        object UniPanel1: TUniPanel
          Left = 328
          Top = 0
          Width = 17
          Height = 54
          Hint = ''
          Align = alRight
          TabOrder = 4
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          Color = 16772848
        end
      end
      object btnCategoria: TUniFSButton [8]
        Left = 20
        Top = 106
        Width = 105
        Height = 38
        Hint = ''
        StyleButton = GoogleSilverRound
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'Categorias '
        TabOrder = 5
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
        ScreenMask.ShowMessage = False
        ScreenMask.Color = 14313335
        ScreenMask.Opacity = 0.200000002980232200
        OnClick = btnCategoriaClick
      end
      inherited UniLabel1: TUniLabel
        Left = 16
        Top = 41
        AutoSize = False
        Anchors = [akTop]
        ExplicitLeft = 16
        ExplicitTop = 41
      end
    end
  end
end