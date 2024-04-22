object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'PdfTools - by Strak'
  ClientHeight = 494
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 438
    Top = 382
    Width = 180
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 199
    Top = 336
    Width = 180
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tamanho'
  end
  object Label4: TLabel
    Left = 199
    Top = 382
    Width = 180
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome:'
  end
  object Button1: TButton
    Left = 199
    Top = 428
    Width = 180
    Height = 25
    Caption = 'Dividir pdf'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 33
    Width = 185
    Height = 420
    DirLabel = Label1
    ItemHeight = 16
    TabOrder = 1
    OnChange = DirectoryListBox1Change
    OnClick = DirectoryListBox1Click
  end
  object Edit1: TEdit
    Left = 438
    Top = 401
    Width = 180
    Height = 21
    TabOrder = 2
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 8
    Width = 185
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 3
  end
  object Button3: TButton
    Left = 438
    Top = 428
    Width = 180
    Height = 25
    Caption = 'Juntar pdfs'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 479
    Width = 622
    Height = 15
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 5
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 620
      Height = 13
      Align = alClient
      Alignment = taCenter
      Caption = 'Z:\Acad2007\PdfToolsbyStrak'
      ExplicitWidth = 144
    end
  end
  object ListBox1: TListBox
    Left = 199
    Top = 8
    Width = 180
    Height = 326
    ItemHeight = 13
    TabOrder = 6
  end
  object Button4: TButton
    Left = 385
    Top = 120
    Width = 47
    Height = 25
    Caption = '>'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 385
    Top = 213
    Width = 47
    Height = 25
    Caption = '<'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 385
    Top = 151
    Width = 47
    Height = 25
    Caption = '>>'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 385
    Top = 182
    Width = 47
    Height = 25
    Caption = '<<'
    TabOrder = 10
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 438
    Top = 336
    Width = 83
    Height = 25
    Caption = 'Up'
    TabOrder = 11
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 536
    Top = 336
    Width = 82
    Height = 25
    Caption = 'Down'
    TabOrder = 12
    OnClick = Button9Click
  end
  object ListBox2: TListBox
    Left = 438
    Top = 8
    Width = 180
    Height = 322
    ItemHeight = 13
    TabOrder = 13
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 457
    Width = 616
    Height = 19
    Align = alBottom
    BevelOuter = bvLowered
    Caption = 'Panel2'
    TabOrder = 14
    object Gauge1: TGauge
      Left = 1
      Top = 1
      Width = 614
      Height = 17
      Align = alClient
      Progress = 0
      ExplicitLeft = 85
      ExplicitTop = -59
      ExplicitWidth = 100
      ExplicitHeight = 100
    end
  end
  object ComboBox1: TComboBox
    Left = 199
    Top = 355
    Width = 180
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 15
    Text = '  1  Mbytes'
    Items.Strings = (
      '500 Kbytes'
      '  1  Mbytes'
      '  2  Mbytes'
      '  5  Mbytes'
      ' 10 Mbytes'
      ' 20 Mbytes'
      ' 30 Mbytes'
      ' 50 Mbytes')
  end
  object Edit2: TEdit
    Left = 199
    Top = 401
    Width = 180
    Height = 21
    TabOrder = 16
  end
end
