object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'IDFmerge'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object IDF1: TSingleESRIgrid
    Left = 184
    Top = 96
  end
  object IDF2: TSingleESRIgrid
    Left = 248
    Top = 96
  end
end
