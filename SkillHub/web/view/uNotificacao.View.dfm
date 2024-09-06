object frNotificacao: TfrNotificacao
  Left = 0
  Top = 20
  ClientHeight = 341
  ClientWidth = 272
  Caption = 'frNotificacao'
  Color = clWhite
  BorderStyle = bsNone
  FormStyle = fsMDIChild
  Position = poDesigned
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Visible = True
  PageMode = True
  ScreenMask.Color = clWhite
  OnCreate = UniFormCreate
  TextHeight = 15
  object sbNotificacao: TUniScrollBox
    Left = 0
    Top = 0
    Width = 272
    Height = 341
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollDirection = sdVertical
    ExplicitLeft = 48
    ExplicitTop = 24
    ExplicitWidth = 256
    ExplicitHeight = 256
  end
  object UniTimer1: TUniTimer
    Interval = 4000
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 216
    Top = 34
  end
end
