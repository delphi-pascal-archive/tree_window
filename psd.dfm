object Form3: TForm3
  Left = 755
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  ClientHeight = 38
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object RichEdit2: TRichEdit
    Left = 120
    Top = 0
    Width = 57
    Height = 25
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
    WordWrap = False
  end
  object Edit6: TEdit
    Left = 16
    Top = 0
    Width = 97
    Height = 24
    TabOrder = 3
    Visible = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 177
    Height = 24
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 192
    Top = 8
    Width = 81
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 1
    OnClick = Button1Click
  end
end
