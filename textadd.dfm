object Form4: TForm4
  Left = 999
  Top = 357
  Width = 441
  Height = 416
  BorderIcons = [biSystemMenu]
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1077#1082#1089#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000CCCCCCC0000000000000000000000CCCCCCCCCCCC800000000000000
    0008888888888888888800000000000000888888888888888888800000000000
    0CCCCCCCCCCCCCCCCCCCCC0000000000CCCCCCCCCCCCCCCCCCCCCCC000000007
    7777777777777777777777780000000C88888888888CCCCCCCCCCCCC000000CC
    CCCCCCCCCCCCCCCCCCCCCCCC800000888888888888888CCCCCCCCCCCC00000FF
    FFFFFFFFFFFFFFFFF7777777700008CC88888888888888CCCCCCCCCCC8000CCC
    CCC88888888CCCCCCCCCCCCCC8000877FFFFFFFFFFFFF77888888888880008FF
    FFFFFFFFFFFFFFFF7788888888000CCC8888888888888CCCCCCCCCCCCC0008C8
    888888888888888CCCCCCCCCC80007FFFFFFFFFFFFFFFFFFF777888888000087
    7FFFFFFFFFFFFF7778888888800000CCCCCCCCCCCCCCCCCCCCCCCCCCC0000088
    7777777777777788CCCCCCCC8000000FFFFFFFFFFFFFFFFFF777888800000007
    8877777777778888CCCCCCC8000000008CCCCCCCCCCCCCCCCCCCCC8000000000
    08FFFFFFFFFF777777888800000000000007FFFFFFF777778888800000000000
    00008CCCCCCCCCCC888000000000000000000088CCCCCC888000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFF01FFFFF8003FFFE0000FFFC00007FF800003FF000001FE000
    000FE000000FC0000007C0000007C00000078000000380000003800000038000
    0003800000038000000380000003C0000007C0000007C0000007E000000FE000
    000FF000001FF800003FFE00007FFF0001FFFFC007FFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 16
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 433
    Height = 316
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
    OnKeyPress = RichEdit1KeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 316
    Width = 433
    Height = 72
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 10
      Width = 417
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 8
      Top = 42
      Width = 417
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text (*.txt)|*.txt|All files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 16
    Top = 16
  end
end
