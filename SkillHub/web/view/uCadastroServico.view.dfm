inherited frCadastraServico: TfrCadastraServico
  Caption = 'Cadastro Servi'#231'o'
  ExplicitTop = -13
  TextHeight = 14
  inherited UniScrollBox2: TUniScrollBox
    inherited pnlMain: TUniPanel
      ExplicitLeft = -1
      ExplicitTop = -1
      inherited UniLabel1: TUniLabel
        Visible = False
      end
      object UniPanel1: TUniPanel
        Left = 4
        Top = 67
        Width = 326
        Height = 302
        Hint = ''
        TabOrder = 5
        Caption = ''
        Color = 16772848
        OnClick = UniPanel1Click
        object lblImage: TUniLabel
          Left = 1
          Top = 1
          Width = 43
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'lblImage'
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 168
          ExplicitTop = 80
          ExplicitWidth = 49
        end
      end
      object UniPanel2: TUniPanel
        AlignWithMargins = True
        Left = 4
        Top = 5
        Width = 808
        Height = 56
        Hint = ''
        Margins.Top = 4
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Height = 19
        Font.Name = 'Roboto'
        TabOrder = 6
        Caption = 'Cadastrar novo servi'#231'o'
        Color = 14313335
      end
      object UniPanel3: TUniPanel
        Left = 335
        Top = 239
        Width = 477
        Height = 130
        Hint = ''
        TabOrder = 7
        Caption = ''
        object cbCategoria: TUniFSComboBox
          Left = 32
          Top = 36
          Width = 433
          Height = 25
          Hint = ''
          Style = csDropDownList
          Text = ''
          ParentFont = False
          Font.Color = 1315860
          Font.Height = 15
          Font.Name = 'Roboto'
          TabOrder = 1
          AnyMatch = True
          IconItems = <>
          Value = '-1'
        end
        object UniLabel2: TUniLabel
          Left = 32
          Top = 16
          Width = 54
          Height = 13
          Hint = ''
          Caption = 'Categorias'
          TabOrder = 2
        end
        object UniLabel3: TUniLabel
          Left = 271
          Top = 72
          Width = 54
          Height = 13
          Hint = ''
          Caption = 'Profiss'#245'es'
          TabOrder = 3
        end
        object CbProfissoes: TUniFSComboBox
          Left = 271
          Top = 92
          Width = 194
          Height = 25
          Hint = ''
          Style = csDropDownList
          Text = ''
          ParentFont = False
          Font.Color = 1315860
          Font.Height = 15
          Font.Name = 'Roboto'
          TabOrder = 4
          AnyMatch = True
          IconItems = <>
          Value = '-1'
        end
        object UniLabel4: TUniLabel
          Left = 32
          Top = 73
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Subcategoria'
          TabOrder = 5
        end
        object cbSubcategoria: TUniFSComboBox
          Left = 32
          Top = 92
          Width = 233
          Height = 25
          Hint = ''
          Style = csDropDownList
          Text = ''
          ParentFont = False
          Font.Color = 1315860
          Font.Height = 15
          Font.Name = 'Roboto'
          TabOrder = 6
          AnyMatch = True
          IconItems = <>
          Value = '-1'
        end
      end
      object UniPanel4: TUniPanel
        Left = 335
        Top = 67
        Width = 477
        Height = 166
        Hint = ''
        TabOrder = 8
        Caption = ''
        object UniLabel5: TUniLabel
          Left = 32
          Top = 9
          Width = 29
          Height = 13
          Hint = ''
          Caption = 'Titulo'
          TabOrder = 1
        end
        object UniLabel7: TUniLabel
          Left = 32
          Top = 57
          Width = 50
          Height = 13
          Hint = ''
          Caption = 'Descri'#231#227'o'
          TabOrder = 2
        end
        object edtTitulo: TUniFSEdit
          Left = 32
          Top = 22
          Width = 433
          Height = 29
          Hint = ''
          PasswordStrong.MinChars = 6
          PasswordStrong.Toogle = False
          PasswordStrong.Toltip = False
          PasswordStrong.Progress = False
          Text = ''
          TabOrder = 3
          EmptyText = 'Informar o titulo do servi'#231'o'
        end
        object mDescricao: TUniMemo
          Left = 32
          Top = 73
          Width = 433
          Height = 90
          Hint = ''
          Lines.Strings = (
            '')
          TabOrder = 4
          EmptyText = 'Descri'#231#227'o do servi'#231'o....'
        end
      end
      object UniPanel5: TUniPanel
        Left = 4
        Top = 375
        Width = 808
        Height = 130
        Hint = ''
        TabOrder = 9
        Caption = ''
        object UniLabel6: TUniLabel
          Left = 16
          Top = 9
          Width = 76
          Height = 13
          Hint = ''
          Caption = 'Rua (Endere'#231'o)'
          TabOrder = 1
        end
        object UniLabel8: TUniLabel
          Left = 432
          Top = 9
          Width = 40
          Height = 13
          Hint = ''
          Caption = 'Numero'
          TabOrder = 2
        end
        object edtEndereco: TUniFSEdit
          Left = 16
          Top = 28
          Width = 401
          Height = 29
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
          Text = ''
          TabOrder = 3
          EmptyText = 'Rua:.....'
        end
        object edtEndNumero: TUniFSCalcEdit
          Left = 432
          Top = 28
          Width = 40
          Height = 29
          Hint = ''
          TabOrder = 4
          EmptyText = '0'
          DecimalPrecision = 0
          DecimalSeparator = #0
        end
        object edtBairro: TUniFSEdit
          Left = 478
          Top = 28
          Width = 318
          Height = 29
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
          Text = ''
          TabOrder = 5
          EmptyText = 'Bairro.....'
        end
        object UniLabel9: TUniLabel
          Left = 485
          Top = 9
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'Bairro'
          TabOrder = 6
        end
        object UniLabel10: TUniLabel
          Left = 16
          Top = 65
          Width = 70
          Height = 13
          Hint = ''
          Caption = 'Complemento'
          TabOrder = 7
        end
        object edtComplemento: TUniFSEdit
          Left = 16
          Top = 84
          Width = 397
          Height = 29
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
          Text = ''
          TabOrder = 8
          EmptyText = 'Casa 12'
        end
        object UniLabel11: TUniLabel
          Left = 432
          Top = 65
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'Cep'
          TabOrder = 9
        end
        object edtCep: TUniFSMaskEdit
          Left = 432
          Top = 84
          Width = 129
          Height = 29
          Hint = ''
          MaskUnMask = False
          Text = ''
          TabOrder = 10
          EmptyText = '00000-000'
        end
        object UniLabel12: TUniLabel
          Left = 576
          Top = 65
          Width = 17
          Height = 13
          Hint = ''
          Caption = 'Km'
          TabOrder = 11
        end
        object edtKM: TUniFSCalcEdit
          Left = 576
          Top = 84
          Width = 80
          Height = 29
          Hint = ''
          TabOrder = 12
          EmptyText = '0'
          DecimalPrecision = 0
          DecimalSeparator = #0
        end
      end
      object UniPanel6: TUniPanel
        AlignWithMargins = True
        Left = 4
        Top = 511
        Width = 808
        Height = 51
        Hint = ''
        Margins.Bottom = 4
        Align = alBottom
        TabOrder = 10
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        ExplicitLeft = 5
        object btnGravar: TUniFSButton
          Left = 585
          Top = 12
          Width = 95
          Height = 36
          Hint = ''
          StyleButton = Purple
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = 'Gravar'
          ParentFont = False
          Font.Color = clWhite
          Font.Name = 'Roboto'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object BtnCancelar: TUniFSButton
          Left = 710
          Top = 11
          Width = 95
          Height = 36
          Hint = ''
          StyleButton = GoogleDanger
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = 'Cancelar'
          ParentFont = False
          Font.Color = clWhite
          Font.Name = 'Roboto'
          TabOrder = 2
          OnClick = BtnCancelarClick
        end
        object UniLabel13: TUniLabel
          Left = 3
          Top = 3
          Width = 81
          Height = 13
          Hint = ''
          Caption = 'Valor do servi'#231'o'
          TabOrder = 3
        end
        object edtValorServico: TUniFSCalcEdit
          Left = 3
          Top = 22
          Width = 150
          Height = 29
          Hint = ''
          TabOrder = 4
          EmptyText = '0,00'
          DecimalSeparator = ','
        end
      end
    end
  end
  object UniFSButton1: TUniFSButton
    Left = 781
    Top = 9
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
    TabOrder = 1
    OnClick = UniFSButton1Click
  end
  object upImg: TUniFileUpload
    Filter = '*.png'
    Title = 'Selecionar o arquivo de imagem'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Aguarde'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Procurar'
    Messages.NoFileError = 'Selecione o arquivo'
    Messages.BrowseText = 'Procurar'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    ButtonOnly = True
    OnCompleted = upImgCompleted
    Left = 264
    Top = 91
  end
  object UniTimer1: TUniTimer
    Interval = 1
    RunOnce = True
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 208
    Top = 96
  end
end
