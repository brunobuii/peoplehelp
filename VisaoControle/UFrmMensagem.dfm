object FrmMensagem: TFrmMensagem
  Left = 0
  Top = 0
  Caption = 'Mensagem'
  ClientHeight = 401
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 224
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 614
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 1
  end
  object ListBox2: TListBox
    Left = 0
    Top = 8
    Width = 209
    Height = 393
    Align = alCustom
    ItemHeight = 13
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 215
    Top = 8
    Width = 482
    Height = 273
    Align = alCustom
    ItemHeight = 13
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 215
    Top = 287
    Width = 482
    Height = 75
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
end
