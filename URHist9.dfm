object FRHist9: TFRHist9
  Left = 342
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Hist'#243'rico Escolar (RVHE)'
  ClientHeight = 264
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 226
    Align = alClient
    TabOrder = 0
    TabStop = True
    object SBLocAlu: TSpeedButton
      Left = 109
      Top = 24
      Width = 25
      Height = 25
      Hint = 'Localiza os  Alunos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SBLocAluClick
    end
    object Label2: TLabel
      Left = 12
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Aluno'
    end
    object Label3: TLabel
      Left = 12
      Top = 61
      Width = 53
      Height = 13
      Caption = 'Habilita'#231#227'o'
    end
    object LNomAlu: TLabel
      Left = 139
      Top = 31
      Width = 50
      Height = 14
      Caption = 'LNomAlu'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNomHab: TLabel
      Left = 66
      Top = 79
      Width = 52
      Height = 14
      Caption = 'LNomHab'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 12
      Top = 180
      Width = 91
      Height = 13
      Caption = 'Data de Expedi'#231#227'o'
    end
    object MERA: TCurrencyEdit
      Tag = 1
      Left = 8
      Top = 26
      Width = 95
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '000'#39'.'#39'00'#39'.'#39'0000'#39'.'#39'0'
      MaxLength = 13
      TabOrder = 0
      OnEnter = MERAEnter
      OnExit = MERAExit
    end
    object CBEmissao: TCheckBox
      Left = 13
      Top = 109
      Width = 161
      Height = 17
      Caption = 'Tronco Comum e Habilita'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBLCBHab: TRxDBLookupCombo
      Left = 12
      Top = 75
      Width = 45
      Height = 21
      DropDownCount = 8
      DropDownWidth = 350
      LookupField = 'hab_Codigo'
      LookupDisplay = 'hab_codigo;hab_nome'
      LookupSource = DSHab
      TabOrder = 1
      OnCloseUp = DBLCBHabCloseUp
      OnDropDown = DBLCBHabDropDown
      OnExit = DBLCBHabExit
    end
    object RGHist: TRadioGroup
      Tag = 1
      Left = 166
      Top = 167
      Width = 146
      Height = 49
      Caption = '&Hist'#243'rico'
      Items.Strings = (
        'Comum'
        'p/ An'#225'lise de Curr'#237'culo')
      TabOrder = 7
      TabStop = True
    end
    object RGOrd: TRadioGroup
      Left = 209
      Top = 101
      Width = 83
      Height = 59
      Caption = 'Ordenar por'
      ItemIndex = 0
      Items.Strings = (
        'N. Ordem'
        'Ref. MEC')
      TabOrder = 3
      Visible = False
    end
    object DEExp: TDateEdit
      Left = 12
      Top = 194
      Width = 99
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 6
      OnExit = DEExpExit
    end
    object RGTipo: TRadioGroup
      Tag = 1
      Left = 335
      Top = 167
      Width = 96
      Height = 49
      Caption = 'Tipo'
      Items.Strings = (
        'Normal'
        'Completa')
      TabOrder = 8
      TabStop = True
      OnExit = RGTipoExit
    end
    object CBAtualiza: TCheckBox
      Left = 312
      Top = 110
      Width = 161
      Height = 17
      Caption = 'Atualiza GED'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = CBAtualizaClick
    end
    object CBValida: TCheckBox
      Left = 409
      Top = 110
      Width = 135
      Height = 17
      Caption = 'Valida Hist'#243'rico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 226
    Width = 548
    Height = 38
    Align = alBottom
    TabOrder = 1
    TabStop = True
    object b_cancela: TBitBtn
      Left = 11
      Top = 7
      Width = 75
      Height = 25
      Hint = 'Cancela a Operacao'
      Cancel = True
      Caption = '&Cancela'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = b_cancelaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object b_ok: TBitBtn
      Left = 92
      Top = 6
      Width = 75
      Height = 25
      Hint = 'Confirma a Opera'#231#227'o'
      Caption = '&Ok'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = b_okClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF5555555555555C055555
        55555555588FF55555555555CCC05555555555558888F55555555555CCC05555
        555555558888FF555555555CCCCC05555555555888888F55555555CCCCCC0555
        5555558888888FF5555558CC05CCC05555555888858888F555558C05555CC055
        55558885555888FF55555555555CCC05555555555558888F555555555555CC05
        555555555555888FF555555555555CC05555555555555888FF5555555555558C
        05555555555555888FF5555555555558C05555555555555888FF555555555555
        5CC0555555555555588855555555555555555555555555555555}
      NumGlyphs = 2
    end
    object B_Finaliza: TBitBtn
      Left = 494
      Top = 8
      Width = 25
      Height = 24
      Hint = 'Finaliza'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = B_FinalizaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
  end
  object QDadAlu: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      
        'Select f.fac_codigo,f.fac_nome,c.cur_nomcur,c.cur_autndc,c.cur_c' +
        'odigo,c.cur_autdcp,c.cur_anosem,'
      
        'c.cur_autdata,p.pes_nome,p.pes_rg,p.pes_estexp,p.pes_nompai,p.pe' +
        's_nommae,'
      
        'p.pes_datnas,p.pes_locnas,p.nac_codigo,p.pes_titulo,p.pes_zonael' +
        ',p.pes_municipio,'
      
        'p.pes_sexo,p.pes_reserv,p.pes_regmil,p.pes_cirmil,a.alu_ra,a.alu' +
        '_foring,a.alu_inives,'
      
        'a.alu_fimves,a.alu_totpon,a.alu_entidade,a.alu_nrlivro,a.alu_nrf' +
        'olha,a.alu_datreg, alu_anoing,'
      'alu_seming, cur_area, alu_periodo'
      
        'from sca_alunos a,crp_pessoas p,sca_cursos c,outer sca_faculdade' +
        ' f'
      'where a.pes_nro = p.pes_nro and a.cur_codigo = c.cur_codigo and'
      'c.fac_codigo = f.fac_codigo and a.alu_ra =:ra')
    Left = 176
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end>
  end
  object Qconsalu: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select * from sca_alunos a, crp_pessoas p, sca_cursos c'
      
        'where a.pes_nro = p.pes_nro and a.cur_codigo = c.cur_codigo and ' +
        'a.alu_ra = :ra')
    Left = 206
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ra'
        ParamType = ptUnknown
      end>
  end
  object Qconscur: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select cur_codigo from sca_cursos where cur_codigo = :codcur and'
      'cur_codigo  in (select cur_codigo from sca_habilitacao)  ')
    Left = 242
    Top = 8
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'codcur'
        ParamType = ptUnknown
      end>
  end
  object Qconsccl: TQuery
    DatabaseName = 'unoeste'
    RequestLive = True
    SQL.Strings = (
      
        'select * from sca_alu_hab where alu_ra = :ra and hab_codigo = :h' +
        'ab')
    Left = 362
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'hab'
        ParamType = ptUnknown
      end>
  end
  object QCurSup: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_alu_cursup'
      'where alu_ra =:ra and hab_codigo =:codhab')
    Left = 268
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codhab'
        ParamType = ptUnknown
      end>
  end
  object SPACur1: TStoredProc
    DatabaseName = 'unoeste'
    StoredProcName = 'retorna_disc'
    Left = 176
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = '2'
        ParamType = ptInput
      end>
    object RA: TFloatField
      FieldName = '(expression)'
    end
    object SPACur1codhab: TSmallintField
      FieldName = '(expression)_1'
    end
    object SPACur1coddis: TIntegerField
      FieldName = '(expression)_2'
    end
    object SPACur1expression_3: TSmallintField
      FieldName = '(expression)_3'
    end
    object SPACur1expression_4: TSmallintField
      FieldName = '(expression)_4'
    end
  end
  object QLocalidade: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select * from cep_local l, outer cep_estado e'
      'where l.loc_uf = e.loc_uf and l.loc_codigo =:cod')
    Left = 168
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
  end
  object QNacional: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_nacionalidade'
      'where nac_codigo =:cod')
    Left = 232
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
  end
  object QObserv: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select distinct obs_codigo,obs_observ1 from sca_observacoes'
      'where alu_ra =:ra and hab_codigo =:codhab and'
      '           ((obs_codigo < 90) or (obs_codigo > 99))'
      'order by obs_codigo')
    Left = 120
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ra'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'codhab'
        ParamType = ptInput
      end>
  end
  object QDocComprob: TQuery
    DatabaseName = 'unoeste'
    RequestLive = True
    SQL.Strings = (
      'Select d.dis_codigo,d.dis_nomdisc,g.gra_chteor,g.gra_chprat'
      'from sca_disciplinas d,sca_grades g'
      'where d.dis_codigo = g.dis_codigo and d.dis_codigo =:coddis'
      'and g.grl_codgra =:codgra')
    Left = 484
    Top = 57
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'coddis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codgra'
        ParamType = ptUnknown
      end>
  end
  object QAdiciona: TQuery
    OnCalcFields = QAdicionaCalcFields
    DatabaseName = 'unoeste'
    SQL.Strings = (
      
        'select *, decode(a.tit_codigo,5,"DOUTOR",10,"DOUTOR",t.tit_descr' +
        'icao) titulacao from sca_adicionais a, sca_alunos al, sca_cursos' +
        ' c, outer sca_titulacao t'
      'where a.alu_ra = al.alu_ra and al.cur_codigo = c.cur_codigo and '
      
        '      a.tit_codigo = t.tit_codigo and a.alu_ra =:ra and hab_codi' +
        'go =:codhab'
      'order by adi_nro')
    Left = 129
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ra'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'codhab'
        ParamType = ptInput
      end>
    object QAdicionaadi_nro: TSmallintField
      FieldName = 'adi_nro'
      Origin = 'sca_adicionais.adi_nro'
    end
    object QAdicionaalu_ra: TFloatField
      FieldName = 'alu_ra'
      Origin = 'sca_adicionais.alu_ra'
    end
    object QAdicionahab_codigo: TSmallintField
      FieldName = 'hab_codigo'
      Origin = 'sca_adicionais.hab_codigo'
    end
    object QAdicionaadi_nomdis: TStringField
      FieldName = 'adi_nomdis'
      Origin = 'sca_adicionais.adi_nomdis'
      Size = 50
    end
    object QAdicionaadi_cghora: TSmallintField
      FieldName = 'adi_cghora'
      Origin = 'sca_adicionais.adi_cghora'
    end
    object QAdicionaadi_medfin: TStringField
      FieldName = 'adi_medfin'
      Origin = 'sca_adicionais.adi_medfin'
      Size = 10
    end
    object QAdicionaadi_pfreq: TStringField
      FieldName = 'adi_pfreq'
      Origin = 'sca_adicionais.adi_pfreq'
      Size = 5
    end
    object QAdicionaadi_codobs: TSmallintField
      FieldName = 'adi_codobs'
      Origin = 'sca_adicionais.adi_codobs'
    end
    object QAdicionaadi_perlet: TIntegerField
      FieldName = 'adi_perlet'
      Origin = 'sca_adicionais.adi_perlet'
    end
    object QAdicionaadi_perchar: TStringField
      FieldName = 'adi_perchar'
      Origin = 'sca_adicionais.adi_perchar'
      Size = 15
    end
    object QAdicionahr: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'hr'
      Calculated = True
    end
    object QAdicionaadi_chreal: TFloatField
      FieldName = 'adi_chreal'
      Origin = 'UNOESTE.sca_adicionais.adi_chreal'
    end
    object QAdicionaadi_nomeprof: TStringField
      FieldName = 'adi_nomeprof'
      FixedChar = True
      Size = 70
    end
    object QAdicionaadi_cpf: TFloatField
      FieldName = 'adi_cpf'
    end
    object QAdicionatit_codigo: TSmallintField
      FieldName = 'tit_codigo'
    end
    object QAdicionacur_anosem: TSmallintField
      FieldName = 'cur_anosem'
    end
    object QAdicionatit_descricao: TStringField
      FieldName = 'tit_descricao'
      FixedChar = True
      Size = 17
    end
    object QAdicionatitulacao: TStringField
      FieldName = 'titulacao'
      FixedChar = True
      Size = 17
    end
  end
  object QConsEq: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_equivalencia'
      
        'where alu_ra =:ra and hab_codigo =:codhab and dis_codigo =:coddi' +
        's'
      'order by equ_nrodis')
    Left = 194
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codhab'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'coddis'
        ParamType = ptUnknown
      end>
  end
  object SPFicha: TStoredProc
    DatabaseName = 'unoeste'
    StoredProcName = 'ficha_escolar'
    Left = 146
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '3'
        ParamType = ptInput
      end>
  end
  object QRFicha: TQuery
    OnCalcFields = QRFichaCalcFields
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_rficha')
    Left = 336
    Top = 86
    object QRFichaalu_ra: TFloatField
      FieldName = 'alu_ra'
      Origin = 'sca_rficha.alu_ra'
    end
    object QRFichahab_codigo: TSmallintField
      FieldName = 'hab_codigo'
      Origin = 'sca_rficha.hab_codigo'
    end
    object QRFichadis_codigo: TIntegerField
      FieldName = 'dis_codigo'
      Origin = 'sca_rficha.dis_codigo'
    end
    object QRFichahis_sitfin: TStringField
      FieldName = 'his_sitfin'
      Origin = 'sca_rficha.his_sitfin'
      Size = 1
    end
    object QRFichahis_codlan: TSmallintField
      FieldName = 'his_codlan'
      Origin = 'sca_rficha.his_codlan'
    end
    object QRFichahis_anoref: TSmallintField
      FieldName = 'his_anoref'
      Origin = 'sca_rficha.his_anoref'
    end
    object QRFichahis_semref: TSmallintField
      FieldName = 'his_semref'
      Origin = 'sca_rficha.his_semref'
    end
    object QRFichahis_sequencia: TSmallintField
      FieldName = 'his_sequencia'
      Origin = 'sca_rficha.his_sequencia'
    end
    object QRFichagra_nordem: TSmallintField
      FieldName = 'gra_nordem'
      Origin = 'sca_rficha.gra_nordem'
    end
    object QRFichadis_nomdisc: TStringField
      FieldName = 'dis_nomdisc'
      Origin = 'sca_rficha.dis_nomdisc'
      Size = 75
    end
    object QRFichahis_medfin: TFloatField
      FieldName = 'his_medfin'
      Origin = 'sca_rficha.his_medfin'
    end
    object QRFichahis_pfreq: TFloatField
      FieldName = 'his_pfreq'
      Origin = 'sca_rficha.his_pfreq'
    end
    object QRFichahis_chminima: TSmallintField
      FieldName = 'his_chminima'
      Origin = 'sca_rficha.his_chminima'
    end
    object QRFichagra_cont: TSmallintField
      FieldName = 'gra_cont'
      Origin = 'sca_rficha.gra_cont'
    end
    object QRFichahis_perlet: TSmallintField
      FieldName = 'his_perlet'
      Origin = 'sca_rficha.his_perlet'
    end
    object QRFichahis_medbi1: TFloatField
      FieldName = 'his_medbi1'
      Origin = 'sca_rficha.his_medbi1'
    end
    object QRFichahis_medbi2: TFloatField
      FieldName = 'his_medbi2'
      Origin = 'sca_rficha.his_medbi2'
    end
    object QRFichahis_medbi3: TFloatField
      FieldName = 'his_medbi3'
      Origin = 'sca_rficha.his_medbi3'
    end
    object QRFichahis_medbi4: TFloatField
      FieldName = 'his_medbi4'
      Origin = 'sca_rficha.his_medbi4'
    end
    object QRFichahis_perano: TStringField
      FieldName = 'his_perano'
      Origin = 'sca_rficha.his_perano'
      Size = 13
    end
    object QRFichahis_disequ: TIntegerField
      FieldName = 'his_disequ'
      Origin = 'sca_rficha.his_disequ'
    end
    object QRFichatermo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'termo'
      Calculated = True
    end
    object QRFichagra_regime: TSmallintField
      FieldName = 'gra_regime'
      Origin = 'sca_rficha.gra_regime'
    end
    object QRFichahis_codobs: TSmallintField
      FieldName = 'his_codobs'
      Origin = 'sca_rficha.his_codobs'
    end
    object ch: TStringField
      FieldKind = fkCalculated
      FieldName = 'ch'
      Size = 6
      Calculated = True
    end
    object QRFichagra_anoter: TStringField
      FieldName = 'gra_anoter'
      Origin = 'sca_rficha.gra_anoter'
      Size = 1
    end
    object QRFichadis_controle: TSmallintField
      FieldName = 'dis_controle'
      Origin = 'sca_rficha.dis_controle'
    end
    object QRFichacer_seq: TIntegerField
      FieldName = 'cer_seq'
      Origin = 'sca_rficha.cer_seq'
    end
    object QRFicharfi_horas: TSmallintField
      FieldName = 'rfi_horas'
      Origin = 'sca_rficha.rfi_horas'
    end
    object QRFichagra_nordem2: TSmallintField
      FieldName = 'gra_nordem2'
      Origin = 'UNOESTE.sca_rficha.gra_nordem2'
    end
    object QRFichadco_complemento: TStringField
      FieldName = 'dco_complemento'
      Origin = 'UNOESTE.sca_rficha.dco_complemento'
      FixedChar = True
      Size = 30
    end
    object nomdisc: TStringField
      FieldKind = fkCalculated
      FieldName = 'nomdisc'
      Size = 80
      Calculated = True
    end
    object QRFichadco_periodo: TStringField
      FieldName = 'dco_periodo'
      Origin = 'UNOESTE.sca_rficha.dco_periodo'
      FixedChar = True
      Size = 10
    end
    object QRFichahis_anomat: TSmallintField
      FieldName = 'his_anomat'
      Origin = 'UNOESTE.sca_rficha.his_anomat'
    end
    object QRFichahis_serie: TSmallintField
      FieldName = 'his_serie'
      Origin = 'UNOESTE.sca_rficha.his_serie'
    end
    object QRFichahis_ncursado: TSmallintField
      FieldName = 'his_ncursado'
      Origin = 'UNOESTE.sca_rficha.his_ncursado'
    end
    object QRFichahis_regesp: TStringField
      FieldName = 'his_regesp'
      Origin = 'UNOESTE.sca_rficha.his_regesp'
      FixedChar = True
      Size = 1
    end
    object QRFichahis_obrigatorio: TStringField
      FieldName = 'his_obrigatorio'
      Origin = 'UNOESTE.sca_rficha.his_obrigatorio'
      FixedChar = True
      Size = 1
    end
    object QRFichahis_regime: TSmallintField
      FieldName = 'his_regime'
      Origin = 'UNOESTE.sca_rficha.his_regime'
    end
    object QRFichahis_user: TStringField
      FieldName = 'his_user'
      Origin = 'UNOESTE.sca_rficha.his_user'
      FixedChar = True
      Size = 10
    end
    object QRFichahis_dtinicio: TDateTimeField
      FieldName = 'his_dtinicio'
      Origin = 'UNOESTE.sca_rficha.his_dtinicio'
    end
    object QRFichahis_dtfim: TDateTimeField
      FieldName = 'his_dtfim'
      Origin = 'UNOESTE.sca_rficha.his_dtfim'
    end
    object QRFichahis_anomatreal: TSmallintField
      FieldName = 'his_anomatreal'
      Origin = 'UNOESTE.sca_rficha.his_anomatreal'
    end
    object QRFichagra_per: TStringField
      FieldName = 'gra_per'
      Origin = 'UNOESTE.sca_rficha.gra_per'
      FixedChar = True
      Size = 1
    end
    object QRFichagra_chhoras: TSmallintField
      FieldName = 'gra_chhoras'
      Origin = 'UNOESTE.sca_rficha.gra_chhoras'
    end
    object QRFichahis_converte: TStringField
      FieldName = 'his_converte'
      Origin = 'UNOESTE.sca_rficha.his_converte'
      FixedChar = True
      Size = 1
    end
    object QRFichahis_codtur: TStringField
      FieldName = 'his_codtur'
      Origin = 'UNOESTE.sca_rficha.his_codtur'
      FixedChar = True
      Size = 3
    end
    object QRFichalab_turma: TSmallintField
      FieldName = 'lab_turma'
      Origin = 'UNOESTE.sca_rficha.lab_turma'
    end
    object QRFichadst_codmestre: TIntegerField
      FieldName = 'dst_codmestre'
      Origin = 'UNOESTE.sca_rficha.dst_codmestre'
    end
  end
  object QObsCompl: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select * from sca_obscompl')
    Left = 214
    Top = 78
  end
  object MTHab: TMemoryTable
    TableName = 'MTHab'
    Left = 80
    Top = 52
    object MTHabhab_Codigo: TSmallintField
      DisplayWidth = 3
      FieldName = 'hab_Codigo'
    end
    object MTHabHab_Nome: TStringField
      FieldName = 'Hab_Nome'
      Size = 40
    end
  end
  object QConsAdi: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_adicionais'
      'where alu_ra =:ra and hab_codigo =:codhab'
      'order by adi_nro')
    Left = 303
    Top = 44
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codhab'
        ParamType = ptUnknown
      end>
  end
  object Qconshab: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select * from sca_habilitacao where hab_codigo = :hab '
      'and cur_codigo = :codcur')
    Left = 332
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hab'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codcur'
        ParamType = ptUnknown
      end>
  end
  object DSHab: TDataSource
    DataSet = MTHab
    Left = 98
    Top = 52
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DSFicha
    UserName = 'DBPipeline1'
    Left = 200
    Top = 161
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'alu_ra'
      FieldName = 'alu_ra'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'cer_seq'
      FieldName = 'cer_seq'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'dis_codigo'
      FieldName = 'dis_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'hab_codigo'
      FieldName = 'hab_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ch'
      FieldName = 'ch'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'chmask'
      FieldName = 'chmask'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ch2'
      FieldName = 'ch2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'perlet'
      FieldName = 'perlet'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'sitfin'
      FieldName = 'sitfin'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'medfin'
      FieldName = 'medfin'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'obs'
      FieldName = 'obs'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'nomdisc'
      FieldName = 'nomdisc'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'termo'
      FieldName = 'termo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'horas'
      FieldName = 'horas'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'chcursando'
      FieldName = 'chcursando'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'chacursar'
      FieldName = 'chacursar'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'his_anoref'
      FieldName = 'his_anoref'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'his_semref'
      FieldName = 'his_semref'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'dst_codmestre'
      FieldName = 'dst_codmestre'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'his_codtur'
      FieldName = 'his_codtur'
      FieldLength = 20
      DisplayWidth = 20
      Position = 19
    end
    object ppDBPipeline1ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'lab_turma'
      FieldName = 'lab_turma'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
  end
  object RHistor: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    OnStartSecondPass = RHistorStartSecondPass
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = RHistorBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    PreviewFormSettings.SinglePageOnly = True
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowCancelDialog = False
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 170
    Top = 161
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object HBHistor: TppHeaderBand
      BeforePrint = HBHistorBeforePrint
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 27516
      mmPrintPosition = 0
      object ppShape53: TppShape
        DesignLayer = ppDesignLayer6
        UserName = 'Shape501'
        Brush.Color = 16119285
        mmHeight = 3969
        mmLeft = 0
        mmTop = 19315
        mmWidth = 195580
        BandType = 0
        LayerName = Foreground5
      end
      object ppLine55: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 27252
        mmWidth = 195580
        BandType = 0
        LayerName = Foreground5
      end
      object LContinua: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'LContinua'
        HyperlinkEnabled = False
        Caption = 'Continua'#231#227'o do Hist'#243'rico Escolar de...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 19315
        mmWidth = 56621
        BandType = 0
        LayerName = Foreground5
      end
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer6
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        AutoSize = True
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D6167654E500000FFD8FFE000104A46494600010101012C01
          2C0000FFED002C50686F746F73686F7020332E30003842494D03ED0000000000
          10012C000000010001012C000000010001FFE100224578696600004D4D002A00
          000008000101120003000000010001000000000000FFE202404943435F50524F
          46494C450001010000023041444245021000006D6E74725247422058595A2007
          CF00060003000000000000616373704150504C000000006E6F6E650000000000
          00000000000000000000000000F6D6000100000000D32D414442450000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000A63707274000000FC00000032646573630000013000
          00006B777470740000019C00000014626B7074000001B0000000147254524300
          0001C40000000E67545243000001D40000000E62545243000001E40000000E72
          58595A000001F4000000146758595A00000208000000146258595A0000021C00
          0000147465787400000000436F7079726967687420313939392041646F626520
          53797374656D7320496E636F72706F7261746564000000646573630000000000
          00001141646F6265205247422028313939382900000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000058595A20000000000000F35100010000000116CC58595A200000000000
          0000000000000000000000637572760000000000000001023300006375727600
          00000000000001023300006375727600000000000000010233000058595A2000
          00000000009C1800004FA5000004FC58595A20000000000000348D0000A02C00
          000F9558595A2000000000000026310000102F0000BE9CFFDB00430002010102
          0101020202020202020203050303030303060404030507060707070607070809
          0B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB0043
          01020202030303060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0CFFC0001108003C02DA03012200021101031101FFC4001E0000030002020301
          0000000000000000000007080609050A02030401FFC4005D1000010302040204
          0A04070B08050D0000010203040506000708111221091331D214171922415155
          579496153261710A1623338191B4363738395262727576A1B12442737492B2B3
          D325829395D11A262A34354446535463A4C3D4FFC4001C010100010501010000
          0000000000000000000501020304060708FFC400421100010302030407050506
          04070000000001000211030405122106314151135261718191D20722A1B1F014
          233272C1153334B2D1E1162436423553626373B3F1FFDA000C03010002110311
          003F00DA974A46BB2E5D0AD9169552DBA3D0AB0F5C1527A13C8A9F5BC2DA50C9
          7014F56A49DF7F5EFCB1197FE5096691FF00E0ACBFFD733FE6E1C1F8449FBD26
          5A7F5F4AFD90E354C9ED18E5B13BDAF4EE4B18E81A7C97CF9B7DB578BD8E3552
          DED2B963006C011C5A09DE1760CD036A32ADAAFD2D5B97DD6E0D3A9B52ACAE52
          5D8F078FA8475525C693C3C64AB98402773DA4E1B7599AAA7522548404A96C32
          B70057612124F3FD5898FA18FF008BB2C5FF004B51FDBDFC52D74FEE6AA1FEAC
          EFFB871D0DABCBA831CEDE40F92F69C06E6AD7C26DEBD532E7536927992D049F
          35A964FE109E69948DECACBFECF4199FF370F4E8E9E96DBE758BA978D6557EDA
          B4E974F7A992A717E9FE11D78535C1C23CF594EC788EFCB1A9247D41F762C3E8
          31FE1F507FB3D51FFF004E397B3C42E1F5D8D73F425780ECCED9635718BDBDBD
          7B82E639E011A6A27B96EBB063D151A8314A84F4992F351E3C7429C75C756108
          6D206E54A51E4001DA4F218997347A62B20F2BAA6E4255E2AB82532B28713438
          2ECE6D247FF7520367F428E3ABA95A9D312F701DEBE89BEC52CEC9A1F7755AC0
          7AC409EE9550E0C4756F74E7E4256E7A197EA5745250A3B75D3286EF569FB496
          CAC81FA314C64F67BD9F9FF6C8ACD9972522E4A6EE12B7A0C80E752A3D89713F
          590AFE6A8038B695CD2A8629B81F1586C31DC3AF5D92D2BB5E7907027CB7ACB7
          060C6139D9A8EB1B4E740454EF7BA2916DC47490D196F6CE4823B436D8DD6E11
          EA4A4E32B9C1A25C60291AD5A9D261A955C1AD1BC930078959B60C46F5AE9D5C
          85A54D5B2CCEBB2A2849D83D1A84E06D5F68EB0A4FF76330CA4E975C87CDFAAB
          3023DE8DD0E74858434CD722394E0E13D8038B1D57EB58C6BB6F6DDC72878F35
          094B6AB07AB53A2A7754C9FCC3FAAA63063C23C844A610EB6B4B8DB890A4A927
          70A07B083E918F3DF6C6D29F460C4F99E1D28D92390358914CACDED0E6D5E29E
          07A0D21972A2F34AF4A565A050850F485281185B41E9DCC87993034B9178C541
          3B75AED096503EDF35455FDD8D675ED069873C4F7A82B8DA8C2285434AADCB03
          870CC34EFD7456660C2DB20B57996FA9F86E3B635DD48AF38C242DE8ADACB52E
          38F5AD8584B891B9DB729DBEDC32719D8F6B8666990A5EDEE6957A62AD070734
          EE20823CC2306306CF2D4AD8BA6CB79154BE2E7A55BB11E252CF84BBBBB248ED
          0D349DD6E11EA4A4ED8992B5D3CF9174A9EB65845EF536D2793D1A8A12DABEEE
          B1C42BFBB18AADD51A661EE00A8DBFDA0C36C5DD1DDD76B1DC8B84F96F56A63F
          15F54E245CBDE9BCC84BEAA688D2AB55CB64B8764B958A538D33BFDAE365C4A4
          7DAA2062AAB5AECA65F16EC4AB51AA30AAB4C9EDF5B1A5C47D2F30FA0FF9C95A
          49047DC715A5714EAFEEDC0ACD87E31637C09B3ACD7C6FCA418EF1BC2D746BC7
          A68F3034A9AACBAAC2A35AB66D4699415460CC89A24F5EE75919A74F1703813C
          8AC81B0EC03197F46074AFDEDAE1D40D4AD2B8ADCB569306150DEAA25EA68901
          E53887986C24F58E287090E9F46FC8620BE994FE31ECC6FE9C0FD823E3D3D159
          AC2B5B44FA89A9DD976C5AD4BA6CCA0BF4C42298C21E783AB7D8701216B40E1D
          9B573DFD2396219B79505CE573BDD92BE7AA5B778951DAB75B5DDC96DBB6AB81
          0620341200DDB96FCF062146FF0008472456A00D1B31523D7F45C73B7FF91860
          69A7A60B2B35579CD4AB16D981793359AC25E5B0B9F4E6998E034D29D571292F
          288F35076E5DBB625DB7745C60382F70B6DB3C0EE2AB68D1BA639CE20000EA49
          DC1557831E999399A7427644875B618610A71C71C50421B481B9512790007693
          D98963377A68720B292ACF4117549B9E5B0A297116FC15CD6D247A03DE6B4AFF
          00AAB23192A556304BCC296C4316B2B060A97B55B4C1DD98813DD3BFC155B831
          1151FA7EF21EA7352D3EDDF54D6D479BD228A95A13F786DD5ABF50C539905AA7
          CBED4FD09CA858975D26E2658DBAF6D870A6445DFB3AD656038DEFFCE4807D18
          B69DC5279863815AB876D26157EFE8ECEE18F7720E13E5BD307060C18CCA6D18
          3060C11183060C11183060C11183060C11183060C11183060C11183060C11183
          060C11183060C11183060C11183060C11183060C117039A77148B432D6E0AAC4
          EAFC2A994D932D9EB13C48E36D95AD3B8F48DD237188B6EAE911CC3A3F446E5B
          E75322DFFC74BA6551DA9BC505461F0CA9DD43BC0D71EE9F33B3CE3B1E7CF167
          66E50E4DCD959725361A03B2EA14B95199413B712D6CAD291BFDA48C6A41ECEF
          B5F31BA2272632268F546E667047B928D45936825B5FD2D0A445A995BE5E636E
          26DB4A13C5C6AD93B7A7B76D5B8796EE3C0F9E8B9AC76F1F41C435F9669BA3B5
          D2D88EDD7455E64BF487DD95BE953CC1C98B9E2D29AB3187954EB6273318B6F1
          9ED436263919D70AC85A94C38EAD3E68FCD7A79E30EC9DE925CCACC0CA9D3BD5
          659B6DB9D9A798F55B4EAEB6E9CAE04458EB968654D27ACF3563A96C9249DF9F
          21BF2C0B3132F6AB71E67EB02EFB69A2F5E19459876F5F7446C76BEE42A5A152
          18F590F455486C8F4F10C2E7497536EB7A77D11CD6925B6A6E74D6A436827729
          4ADC9EA037F4EC0818C5D23E627EB300A0C62376DAFD0B9E752F23BBA56340F0
          D7C08544C5E93BBEE2744DDC9997363508E6F506E07ECCF044435086E5585493
          19B4F53C7C5B754B4A8A78B99071CB5133AF5379E3AACCDAB0ECABAF2AA870B2
          AFE858D21CAC5B72653931E974F4BCE2925A7D20243A97760476148E7B13840D
          C7644C7BA596569FD31166D9AF66AC3CE7715B6CC98CD5296F3AD91EA54C481B
          766E31E57F46D34C8E935D4C275075B628EE78750C50C395BA8D37AD49A6A7C2
          36F045A78F63D57D7DF6DF9769C03DC779DDA6F8DD3FD9627621727207D480D7
          F4665C58096B2A124BA0EFF7786A401C5523796756A0EE1D6A53B25EDBBB32DE
          8D52A6E5A43BAAAF529B6C489AC4D9E6518AF06509928534D29452A485151480
          41DC9C2FE374AA6655CBA79B461187635BD993726694BCAD975E792EBD6FC25C
          6E6E4F4345614BE204250DA9CDB8F724EDCB1C648C84CBDD5BF4A5D1E954FABD
          C7F88C9C88A74EA24BA05C3369CEC98C2A25A6497DB5A5D75B2D2BEAB84F1100
          9DC8C2FF0026B35ECCCBED0EC2CB6CDAB129377E5151B376B36155AAF250231B
          563B2B2B873A4750DF175AA5AD4853FBB6AE7B952893BD5CE703BE06BFA7D4AC
          8FBCB90F79E94B5A4BC025C48D0B6387BA209F7877954D5DB9EDA88D3464AEA0
          245F11EDBB85397F6DAABB675E71A9620C5AC2FA95A9C8EFC30FAD414D282772
          080A04F338E11DD56E78672EA5F2F72FEC8B86C2B6555FCA3837FCF9556B79EA
          825C94E3A96DC69094486CA104AD24733B049EDDC627472E18F49CA4D5FD9F95
          F7C57F30720289964B7E9D327541CAAC4A3D59C6D7D64289317B971B0D0E2290
          A504F9A0F31B9CD6C5D44D8FA65D7EE505C17F5CD4BB568D234DF4C82D4B9CB2
          96DC7D525B525B1B03E714A1676FE69C03E779D3BFB4F1571C45C4B1A6A16B24
          024BBFEB7030FD246900EF8DFAAA0727FA462B2F69073AEEACC1A551A957C642
          CCAAD1EBAC5396B553EA1262B5D630EB01678C21E2A4009512413DBCF18D69BF
          5E799F71E8B73E2A97E46B761E6CE4F43912D6C4486B442287294DCF86B53656
          49078D493E70DF80F6624DBE155ECECCAEBD69D6E437212B5799E8816DB5588E
          F466AA14380843CB98EA36EB0475A9A403B0DCA38B61D98CE33D9FCC5C8FD46E
          7D40CCFF00C488F373C324AAB2E37E2AF85269EF4AA446710949123CFEB7C1D6
          BDF6E5B706DE9C505676F9FAD7FB79AB7F6BDD00D7E6716B46527812E0ECA4F6
          FEEE3F314E3B475B39E793762E46662662CDCBCBB32EF392652A9B31BA451E45
          2EA56DBD52642E3AF894FBADBEDA55BA57E6A4F2E5DBCB95A2E786A53513AA4C
          EDB5F2F2E9CACB728195F5E8F496115CB7254C90FA5E8A97828ADA7D20EC491C
          C7AB084ADE7D5A3ABFD1DE94F23F2EEB08BBAF68955B524D7E2535A71C16F45A
          7B095CB764B9C3C2D7011C3CCF320EDBE38C971B4C1235F1A9D4EA0ABB1E9138
          DD51451D2E572A54E2E3060A3AD204471215E714F356E47A08F48BCC800E9DFD
          9CD53F68548A6195A584B752FCA24D37170CF07880639E8B6579C77B5C9943A4
          5BA2E39122972EEFB62D1955175F6E3A9309E9CC43538A525A2AE20D17504849
          56FC276DFD38912CED7367AE5165264966AE60CDCBBBB32EF3666526054A2D2A
          8D229953B75552402C3A95A9F71B7D0851D960A524F2DBB7714BEA42A945ADF4
          755F936DC928976F4BCBB9EF531F42D4B4BD1554D70B2B0A579C414709DD5CCE
          FCF9E35FD373EAD3D58E8134C591197D576EEDCC05542D5FA6A9F4D69C74D063
          C14A5C96F495F0F0B41BE1DB99E677DB7DB196B3C83A1E1A296C62EDD4EB00CA
          841C92D00FE27660008FF74EEDDC6551D756A673D350199B9DAF65255EC8B72D
          9C8E9ABA33316B14572A2FDDB536180FC9696E25E4783349DC369280A512773F
          6529A3BD4447D58E97AC8CC68D10D3D376D29A9AE45E2E3115D3BA5D6C1F484B
          895807D200C459969A9AB47411987AB9B67326B11ADBACD6EEB9F7A5BD1A5A54
          95DC9127C44F5498600FCBAFAD4F56528DC851E7B6C76A57A27728EB1919D1D3
          9516D57E1BD4FACC4A3F854B8AF0297232E43CE49EAD40F34A921D00A4F30411
          E8C28BC9744F39F359708BAA8FB9CAE79248797099CA43E1A238693A69313AEF
          53DD6F5CD9EF7F647E65EA02CC9962C7CB6CBCAC4F8F4FB4E6D1DD7A65C74DA7
          BBD5CA94B9C1D1D43AAD9C2DA52D948E1D8EFDA72ABD75699D39F9AC6A558993
          95CB0ADDA0D4B2D29F7FA1FB9288FCF71C4C97CB7C00B4EA36F356D9ECDB92BD
          6313CDA7A81B7B4D5D18F9DB905714D4C5CDE8955B86DCA65AE5A59A95717519
          0B30DE8CD01C4EB4E25F0A0B4EE0049DCF66FC7663E5CE4CE54EBAAC6B535135
          36A8B43B6321E854B656E55A6410AA93320B651D6455256AF352F72278796FDA
          06308A84812794EBF50A05F88D70D6455FC5933CBF286B897489D72EE888E034
          D554D9BBA8ACEDB1B34726323DEBAB2EE959899871EA950AB5DE686EAE9CCB31
          57BB51E1C271E495BEB4A920F1B9B79A481E70DB90A65C1AB6A96515C11A6C9C
          B7B62E6B22B731A35CA8511D7E05DF4A43016CC9623B5238A3B9C7C4141676E4
          361EB53676663E976E1B4326AC0AE5BD47A9E9F6B30AA46DACC27EB93128B7EA
          91DE215144B58EB9A52CF11EB16F004A00D941208CB7A332F4AC5C194D9FB4B8
          576DC57F653DB9569106C2B86B4EAA4BF362884A2FB6890B014FB4D39B252BE6
          0F3D8EDC864065D949F23D9F5AA93A35CBEEBA2354991A6579310C07504091C4
          541BE60AC1AD0D756A358E8C5B8F51D5AAE6594A80FDBDE1944A544B7E437222
          CAFA4DB8C54FA94F942D1D587BCD4EC77520EFC88352E98A83A8A17842A9E655
          E595D5AB52553D4E781D0EDE970A687969429B3D638F293C23756E36DCF2ECC4
          5B18FF00E8B28DB6DFF174EDF7FD3987A74744FD22D2F3661359397344A8660C
          FA22D97E322BF549CA532034B7F66E4B8A693B29093B8008E606C0918A5276AD
          93C01DFCFE6B161B7353A7B76D4A939A9D377BCF20973B34C0839B70D2442CD3
          59B9FD9AB43D64652E54E5B56AD3B78DFD49AC4F953AB54572A61A5424B6B484
          A10F347CE0A50EDF483E8D8ADD3D25D9856A69773B5BB8E05A8E66E6565D51EC
          880ED35A74D26B93A638CB70DD4B4B595A7F3A4ADBE33B701E637D87D1AFCCA9
          8D9D5D29BA72B765D62E6A13332DEB9D666D02AAED327B650D32A010FB442D20
          EDB280ED04838C1755FA698B9579D39079079254FA3B75893724CCD5ACBD73CB
          9531BA83F01003522A0F02A7DD2B79440FE73681C862AF73E5C41E31F01FAABA
          F2E2F5B56BD5A6E301D906B3AB98C0006C4021CECD32B3CAB7489660D1FA25F3
          0B3424336FB39B196D53996F55D9F0352A9EDCF8B554455FE4B8F8B84B2E2140
          7176AB7FB30D6D43EAA6EACB1D4269A6D9A67D1669B9AD539B16B9D7462B7381
          A8097D3D4AB88701E3277DC2B972C4239D36BE62DBF61EB77282E5A7D1275E37
          7D269B9A1121DB0890B85212A90CA672E3A1E1D6923A842940EE7882B6E5B61D
          F766A3AC9D66EB4747EC6595C306F076D15D4ABB5E4D3C977E838C6988692651
          DB66565CDD010A215BF2DB98DEDE95D113AE9F3D562A58A56205373C877DDB60
          EF24552D7E9CCB60BBB0AA4FA30F52B726ADB46F6FDF3760A68ADD4E6D463BC2
          0C72C31C2C4E79846C82A510781B4EFCF99DF1373BD2839913B22E98961767D3
          6EDBD3392A596D4DACD4222D34BA1C461D504C879A0E02EBA109D80E34A54A3B
          9D80D8F1DD0D9D201935949A3AB2F2F2E2CC1A1526F476B7518C292F173AFEB6
          4551E2C27920A7758711B73FF387673DB01CACCC8B2AC7D1E5628F9AD60C1BB7
          2AAEBCF6B8E937254E63AB4356A6F254599AAEAD0549F3F74718523838BEB73D
          8BA525AD8770D7E083147D5B0A0595C071A7EF19DCE867E2892379D786A782AB
          AD63AB1152BEECA9553B05D954B5C0996C5FD2EDF5B34FAAB2E13E1511E82DC9
          2B4BCDF9BC2B042799DF7F4617D1F5A94CFECF8A95D375DF775E57B560E5EDC9
          58B72B91A0D024C79B29505BE721A754F2908471292AD94927852A1DA71C5F46
          1D7E1D1F58F99B66E565F35FCC1C80A350604983266541CAAC2A2D5D6E90B851
          262F72B6FA90545214A09F341E63728FA1E6ACBCB6E8B5D4E40A4AD62E0BFB39
          EBB66525083B29D9151911E3900FAC345D3CBD58AE7D03A4F1E3C95C6F4B1B4E
          E33BA1BD248CC4839370047E213A03BC8D0EAA97E8B3D7DDFBAACBEEE7A46624
          1A2D35DA850E05EB69350232995B94598F49691D6F1295C4E24B4D6EA1B0F3F1
          6AE35A76F59799BA33D7C69AEA39809CBA8F40AB50DFCA38ABB4FC3523AA4321
          E86991E12362A2F36384A3B775EE3B31B2A0B2403C2719A813961DBC29CC02E2
          B3A83A95C125EC306779901C3E703B96BABF0893F7A4CB4FEBE95FB21C6A993D
          A31B59FC224FDE932D3FAFA57EC871AA64F68C7258C7F16EF0F92F9DFDA77FA8
          2AF733F942DE5F431FF17658BFE96A3FB7BF8A5AE9FDCD543FD59DFF0070E269
          E863FE2ECB17FD2D47F6F7F14B5D3FB9AA87FAB3BFEE1C75365FC353FCA3E4BE
          84D99FF825AFFE267F205D6751F507DD8B0BA0D0F0EBE211F55BD52FF06711EA
          3EA0FBB17F7E0FF64E48B87507745F2E2149A7DB34AFA31A5EFB0724CA5A5452
          3D7C2D34A247F3D38E3F0E6975CB00E6BE67D89A0FAB8F5B358261E0F80D4FC0
          2F87A6B75C957CCBCE7A8E54D0E7BD16D1B4D6966AADB2E148AB4ED82D49736F
          ACDB5B84841E456144EFB2768F325F236EDD445F4C5B565D0E657EB2F20BA186
          38521A6D3B02E2D6A210840240E25103720769031EED4655DFB8350B7F4E92A2
          B912EE4A938E28FA4996EE3611F83A96E4472366BD594D215350ED36121C23CE
          4B7C2FB8520FA8AB63FF005463335A6F2F32BCEF27C8292A146A6D36D31A374F
          203DCEF06B412009D06823E2A2CD42747CE6F696ED76EB97A5A2F53E8CE38964
          CE8D2D998C32B51D92970B4A5146E7902A0013CB7DCED8C534DFA8EBA74AF9AD
          02EFB4A7391A74458122395911EA6C6FBAA3BC9EC52143973E693B286C4637B5
          AEEB5E25DFA32CD28331A4BAC2AD79EEEC46FB2DB614E20FDE168491F6818EBD
          08595A52AF4900E2B88DA0B4AAD3489E6B26DAECEB367310A2EB0A8ED4660491
          2083CC01D9C1760BBD75996F5B3A287B3A5842A4519541455E2C72AF3DE75D48
          0D4727D0A2F292D93E83B9C68833AF3B2E6D43E65546ECBBAA6F556B552592A5
          A89EAE3A37F359693D88692392523D5B9DC924D9F985744B3D00166305C51439
          7508079F6B489D29C4A7EE0509FD5880A492233A41D8842883EAE58C98B5D3EA
          646F0CA0F895B9ED13682E2FBECB49C61A6931E4702E70DFE1C396BCD3D3227A
          37B39F5236435725A7663D2A85238BC1A64B9AC4244BE12412D07560AD3B8238
          80E1DC1E7CB0B0CD6CA5B9323EF99D6CDDB469942AE40D83F124A47104A86E95
          02094AD0A1CC292483EBC7621C86B722DA59216852E134866253E890E3328427
          842529610072C6B3FF000882DD8D1336F2D6AA86D225CDA44D8AEAC0E6B434FB
          4A403F71757B7DE7196F70A651B7E95A4C889521B51ECEAD70CC17EDF4AA38D4
          6E5CD3106480604488274D4E8BCFA0E35CD58A4E633593771D41E9D43AB32E3B
          6EA9F5F12A9D21B495AE325479F54E202D494F625483B6C17B618BD38FAEAACE
          57C3A6E54DA5507A9936BD08CFAF4D8CE143E888A5290DC64281DD1D694ACAC8
          D8F0240DF659C6BFF40F517697ADCCA67995942FF1AA0B7B8F4A56E04287E94A
          88FD386274C8D4DEA874895F48755BA62354F8ED0F42502132A03F5AD47F4E2C
          65ED41605B3C627B2256A5B6D4DEB3641F443CE6150530788616E689F023B8C2
          9CACBB2EAB9837453E8341A6CAAAD5EA8F08F0E1446F8DD7DC3D894A47E924F6
          000924004E1DF99FD16B9ED93F604BB9AB7623E8A453D93225AE24F8D31D8AD8
          1BA96B6DA5A97C291B92403B0049E437C343A0828D067EB7254D9BD5072936CC
          C7E329C200438B75868904FA7816B1F728E371F2A7D36A31971DD7E13CD3C92D
          ADB53892169236208DF9820ED8BB0EC2E9D7A26A3C99E0B63633D9FD9E2F863A
          F2E6A39AE2486C44088D4C833AF768BADA58F7CD632D6EEA7D7EDFA9CCA3D6A9
          6E87A24D8AE703AC287A41F483E949DC287220838DEA68FF005C70F3E3441E34
          6AEDB6C4BB7A0CBFC61659F350DC888D953A500F62569095A47A03807A31A28B
          D29CCD1EF3ACC38E3863C3A84961A1EA421E5A523F5018D8A7437D9F3F38F435
          A80B262BBC2ED68AE2440A56C943D229EA403F715251BE31E0F59ECAC698E20F
          985A7ECD314BBB5C4AA5952321ED769C3334120FC23B6541DA84D415C7A9FCD8
          AA5E7744B724D46A6E12D34544B5018DC96E3B40FD56D0081B0ED3BA8EE4938C
          EF4E7D1D19BBAA9B3D770D9F6D32FD0D2F29844D9B3DA86D485A4ECA0DF19E25
          F09E4481B0208DF704612D54A4CBA054E4C09F19E873A0BAB8F263BA92971875
          0A295A140F614A81047D98D9EF4377490D996A65352F28EF39B16D9A8525F793
          46A849586E1D45B79E53BD52DC3C9B792B5A80E2D92B1B6C78B9635ACA9D3AD5
          E2E1D13F3501B3165678A62A6963354B73C9990097C8D0920C4EBE3A2D7B6A13
          4D37B6962F945BD7CD11CA2D4DD6049636750F3329A248E36DC412950DC107D2
          0F2206295E855D5BD5F2775334CB024CD79DB46FD75717C116A2A6E1CFE02A69
          F6C7F9A5653D5AF6FADC492772918D8AEB57A38ACFD77D66DDA95C55CB8696BB
          7E33CCC6FA2D6C04BC87948592AEB1B5EFCD036DB61CCE16D933D07D9739239B
          56DDE34DBAAF79550B62A0D54A3B325D8A59756D9DC257C2C83C27D3B107126C
          C2EBD1B80FA3F841E7C38AEF6D7D9EE2D86636CBAC30CD26B8412E125BA66046
          93C476AD7374CA7F18F6637F4E0FEC11F09DD3CE99AF5D555ED22DDB128FF4DD
          622C35CF758F0A663F0B295A10A5713AA4A4F9CE206DBEFCFB30E2E994FE31EC
          C6FE9C1FD823E1A1F83DBFC35ABDFD9097FB544C5BD18A9745877125798D5C2A
          8E25B6556C6B921AFACF0637FE23BA41F925A7918B521EEF07FDF703FE76280E
          8BFE8D0CEAD3AEB5ED3BBAF0B3BE89B7E98D4E4C995F4A447FAB2E4475B4798D
          BAA51DD4A0390F4E36D18FC58DC7DF896A786526383813A777F45EE586FB21C1
          EC6EE9DE51A950BA9B838496C483227DC1A78AD44F4EC6BA2B174E6BBF939409
          EEC3B72DF6DA5D7C30E149AA4B5A438965C23B5A690A41E1EC2B51DC1E04E215
          C98C91BAF50D9830ED6B368B2EBD5D9A14A6E331C29E1427EB2D6B51094213B8
          DD4A200DC7A4818CB35DB567AB9AD3CD892F9DDC55DB5241E7BF24485A123F42
          5207E8C599F83A31E970B30734AA935D891E5314EA7C465C79C4A086D6EBEB58
          049EC25B6F7FE88C45906E2E72B8F13E4178CD463F69F6B8DBDE5421AE7B87E5
          6B64802741A0F3330A5CD40F45FE75699AC17AE8BA6D34228314812A5C09ECCD
          4C3048014EA50AE24A4920716DC2091B91BE1519339CD72E9FF32A99765A5547
          E8F5EA4B816CBED9E4B4EFE734E27B16D2872520F220E3B0EEA32A140BAF4FF7
          C5364CDA6498F3ADF9EC38D190DAB8D2A8CE0236DF1D6DD9254C364F694249FD
          58ADEDB36839B90EF593DA0ECADBECDDE50A986D474381224890E691B8803985
          D923499A8285AA5D3B5A77DC16931D170420EBF1C2B8BC1642496DE6B7F4F038
          95807D2003E9C31B111F403551DA8683D6CB8A25102E6A830D027B12432E91FE
          D38AC5B989FB7A85F49AE3C42FA6F66B107DF6156F7953F13D8D27BE35F8A306
          0C18CCA6D183060C11183060C11183060C11183060C11183060C11183060C111
          83060C11183060C11183060C11183060C11183060C117E11C431F1356CD3D8AC
          2EA08830D33DC4F0AA4A58487943D457B711FD78FBB0610A8403BD7A510196DC
          754969B4A9FE6E10800B9CB6E7EBE5EBC7ADAA2C461B69088D1D08615C6DA434
          901B3EB036E47ED18FA89DB1F81409ED182405E9FA358F0C123A96BAF09E00E7
          00E309F56FDBB617957CF3B1A2667C8B6E736FA2A889EC529C94F519E308CD79
          943CD4632BAB2D75AA6DC41092BE65694FD6206195BE278BBB4D972D5338AB77
          4C799396C3D7BD26AD1E94B98D9A74988D43871DE92B64A77EB9A521D711E7FD
          661A206E06F6BA782D4BC7546B5BD13675D74E1053E18F008EA4BCD888829DA2
          85809041E2D837BFA39F2E1F5FA31E2F44A63CD4C616DC2521C3FE54DA928D94
          55D9D60F4EE3F95DB890AC1D1E5E369DA74C6EAB6FC6BAD4C3AA6A75327D4223
          11A54B34E6E30A90EA5090901D4B8A2E12A9452E71EC163871CED7F49F7357EB
          339976DFA6ADB35475EA84F725347F19D97AE3855068B89FAC7C1A230EA3677B
          0AB811BA4938B731E4B59B7958B67A223B3E87D4774D1548B82DA66BEE5A90BC
          09A92D406AA1E04D3210CAA3BCB750852761C0AE2532E721B9D93B9E4463947E
          1D2E484ADC6A02FAA508E9529283C0ADF608E7D8773B70FF0076265A1E912BD4
          DBADA9DF41521A14BAAD3DDA638975A0A8119ABAAA139C4B5B7E6D3E02FB4381
          3B02096FD04631EB0F47B795AD44846B16FC5BB94D1547994D9B3A2478D32618
          5D426A63A94276017C7BBAB2A94A4B9C7B71A024B31E215A2EEBE80D2DFF000F
          82A96BB98D6FD0E88DD66A2E18CC353C539A5BF1561D0F2A5262009494F1F0A9
          D5240501C252A0ADF879E39C7598353E275698B23A82B6D4A504AFABF42D3B9E
          CFB47EBC4A972E962EF93594BABB6A9B5975FAE37360CB7A7B49FA052DDD8FD5
          1C793C5E7EEFC571A3B37BA8A99E05EDC8E3EAB3727AEACBCC80CEAFA72871A9
          06BD6EADE622415B058F084D35E6A425A431BAB84B89052A70A9D5A5682B515F
          12520E3C42AB6F2B6687D3D2278EF83BF48E03CD53D05BA753DA4AA3086C21D5
          F57BB7C084AD4091C3B8ED3BEE36FBF1C4DAF5CB6B30E00A8C04C296DC87E4B0
          16B8E12E38E47796C3DC94028F0B885277ECEC3D8462521A49BBAE5B5E9CF40A
          226DEA34B712A450A2C8824C074D3A03089C95BA85A1A3D64778F1B49EBD2149
          581C6B5A464B41D39DF14BCDFB46A4E512008B43AFBF505CE8F26307CC67EA15
          871D6DC52B7708E09915696DAE1490A7B8CA949423140E3C951B7B54B80E88C7
          FF0035DDCA77A76CDD445A14FCC672CC90ECD627225334B2A5D31F103C25E603
          ED45F08E0EA7AC534A49082AE7C4076903197C5552E931D6EB260C66B72952D0
          5084EE9241048D8723BF2F4613752D2CCBBBB33AFF00AF4FA8D56199F508F3AD
          F69B9FFE44D496E94C466E62D948DCBAD3C959485288DDB6D413BA5271856556
          922AADDD16A3B59B468F02DEA554E33F2690E3CC4A612E3144930DC9810374AD
          4EC875ADB71C643495AC255C93525D3B95FD3DC074164C9207609893BF86AA87
          A1576D8CD1A2D1EBD05EA4D6624A604FA74BE143BBB476FCAB648DC0E637236D
          8F6F3C7210EEE812AA72E221D505C22D071C5A1496945C242421C23856774904
          24920EC0F32311ED0F49D7EC5A05A34F6ED0A4D2BE80B6D54653911F8282E155
          22A311616B1F9429329E69C4A50528E070AD614E8213F5666E8F2EF72C9AAD16
          816DD1130A751A041610DBB152B83259A4CC643AD75A0A1BDA53C80B74254E70
          AD4A6C7179C281C62616365F57C998D233C77F2EEE7A2A66E9BF2D2B77372D6A
          0D4CC66EEAB95996AA371432B71D4464A56F00F7090DEC95820150E2E7B6FB1C
          6270B5599797BCBA79A63554B8DFA8C89D119F01B7A4CB50F029288D214AD9A3
          C0DA5D75002CEC9505712491CF18C6A8327EF6BDEAB6A5CB6AC18EE5C3695124
          BB09326621AE1A82E44021A52892365328960AB7237006FE70C61B6A696EE4CA
          ABDADE5C5A25CB3E8D4776B11DA550AE0669CF06DE954E5B0E3E14F37D636B44
          6754A46EA20F229F3B025D3A054AD71722A16B19A48D609D0E5E5C47BD3E0AA1
          ACC2A2A692A893D9A6F810495A987D0D96C800A89E02363B04A8F67A09C636AC
          F1B46839702B61F718A4224354E6986A03BD7B8FB8A425A61B8E9471A96BEB11
          C294A798583D9CF18167669EAA57EE77AAE48F4AA74BF0662DC6A1CA79680F47
          F05ADB926604717340315641DBEB851473DC8C7399F39266664F45A15A94A6CC
          7895A83527E0C69661CA92CB5250EBA962495254CBFC291C0E71A08E1090B46E
          149B892B69F52A8CE5ADDC34EDE5F2F92FB685A9ACB9B8E75128D06A6CC845C0
          D32B8894D3DE11817BAC2CB4EA8B7D5B2EACB2EF0B4E14AC96D436DF607F1AD4
          7E5D52AFA144666253560EAE2FF93D29E5212F0EBB660B886CA7AC73C1DFEAD1
          BF139D59E10774EEA5A064A66450A816053156FC275EB2DE454E23ED561BF050
          801F261CC6481E1125092D36DC809202D6B74AD241EB3DF174B375DBD9E56A4E
          8CC31221D23E8759AA09C111DB6E331293352FC427F2F25D5BEA2D3DC2A2D874
          ECB6F80872DCCEE4B545CDC900E4E2381FAF1DDFA3928DA81B3AE8A157EBACBF
          3511ECF614F54DC9946970DF84DF51D79F31F690E1DDA1C5B241DC11EB18FAF2
          C3386DBCDC972DCA5098D5469ACB2A931EA14D7A04D8ED3C14A6945B79095F56
          B09514A86E9250A1BEE92061B4ECA7B8E5690EE6A354588CABDAEDA4D4DF9E84
          BE92DAA7CC6DDD9BEB3B3811C6DB4957604369F40C7C797367DD132ECA857EAB
          6BCAA326AB41A65A6222EA519D9119A63C2DC7A62CB6B537C2172421284AD4B2
          125440DF61749D256C0AD5B33011BC49D0FD08D166B9699F766E70D7DE6A8534
          C89CDC44CA696EC17A319B114B284C88EB7109EBD82B0471B6549DF6F42924F9
          595993654E99494D11515A7AEC54C5442CC12C198622F81F2A3C239A55FCAEDF
          46F85B64765B5E766D66D19555B71A6BF106D166CE4259A9B2E1AB2972618765
          B7CC703286A225C097385C515A9213BA4157C796B94F7AD93725BC1FB710FC6C
          BF6AE05B0FB55163FE9E54E921C610D24905AF3372B2EF084A80038C1E2140E2
          AC65C56869737E0798FD33790E7AB82EEBCACDCBAAFDBD4EAB3F488153B9E708
          1498CA6D1D74D7F854E10DA40E23C29429455D89039918E32939E762DC716E68
          EC496DD8B406DD7EA3C74F7531DF6D2E38DBAB694A4044801D69C6D45B2BF3D1
          B7691BF8E79E5D4CBEEAF624B811633CE5BF73C6A94875C5252B663A1A7D2B29
          27993BAD1E68E67F4613792DA65BE6CBA947A24C54A16CB4FB4D545522B26633
          542D549D9A894CB249EA41690D30A400924BCA052A4B416AA9266005755AB59B
          572B592DEEEC1FAFC134693AA6CB7A35367314E98E36DD3A43519B870E8F202E
          6ADE71D69BF05690D6F2029C61F4F1321437657B9D93BE3EFAC6A0B2FE8D6B51
          AAC67332E0DC0D3750A588501C94ECE2E2DB4365B69B4159754A712027878F92
          B9798AD91B6FE42E64E5DD318F00A2A9E9F41A3C6B4E2CB8B3A1B929E64CE79E
          91528E97D496D2EA58284B697485071D59295251F94C82E5D3BD6A5D914E4D36
          D9930A974993468ADD01BABB71EA829B0DA75C21A9A87366A4F85BE165C4BC95
          2D2C1FCA02BC5B99D1B96BB6E6E4B7566B1D53F5F40894D485A93B16E8A95BB1
          98973268B93A8768F2451262E24A2EB4A75BE09059EA42B812B2415829E15056
          C411862046E37F5E12990193974DAB53B2D9B9853550ACCB3D9811845523AB35
          1756532084803F36C32CA039C29E2EB9D200E2230EDDB17B49892A42D9D51EDC
          D5041EE8FEBC56BA7F0893F7A4CB4FEBE95FB21C6A993DA31B7BFC204B0DEAEE
          962D8AEB4852D16F5C8D87C804F036FB0E35C5F771F00FFAC31A84C71D8C822E
          893D8BE68F6A34DCCC7EA17716B48F203E60ADE5F431FF0017658BFE96A3FB7B
          F8A5AE9FDCD543FD59DFF70E225E81ECFAA35DBA5772C533A3A2E1B46A1256A8
          4A580F3915F70BC87929ED524296B4123B0A46FB6E37A9F53B9B517283262B75
          158724D4E445721D229EC20B92AAD39C414B11986C79CE38B591C80E43894760
          091D359546FD958E074007C97BBECC5E513B3F6F583BDD6D3683DED6C11E0442
          EBC367DA553BF6E6A6D128B05FA955EAF21B890E2329E27243AB3B2503EF3E9F
          40DC9E431B8FE8EEC998192958A3DA10AAAC1A7D91E15167C86DCE14DD173BED
          A153CB637F3D982C252C03B0F3DC583CDB389BF49BA566F49D4EAB3B32B34DA7
          E6643A7F5975DCE5497A9D94D4D711F944217CD2F559F49E16DB4EE53C40EDC2
          3F2B5968AE81484E6A445BF4F9346994AB7386D5B65F054FDAB4475F4ED266EF
          F56A1517525D5EFBAC25AE12770B2A87C32D4D27073B79F87D7F6E71E6DB05B3
          E6C6BB6B571F7AF234EA80663BE46B1C406F0A9974CF9E5FBF75E9FDA1A8FED6
          EE3641F83A3FB91CD8FEB0A6FF00C17F1ADFCF2FDFBAF4FED0D47F6B771B20FC
          1D1FDC8E6C7F58537FE0BF8D2C2FF8D1E3F22B95D80FF5533BEA7F2B95BFAC5F
          E09599FF00D93AA7EC8EE3AEAB3F9947F447F863B156B17F825667FF0064EA9F
          B23B8EBAACFE651FD11FE18D9DA0FDE33B8A9DF6C9FC65B7E577CC2BAF307F88
          32C8FEDB2BF6A99884E4FF00EACEFF00415FE07179DED4D766F401DA4EB692A4
          43BC4BCE9FE4A4CD928DFF00DA5A7F5E20C92098CEEC373C0AD87AF91C475FEF
          A7F91AB89DAF1EFDA4FF00C8A5F22BB2AE55FEF676F7F5646FF828C6B3BF08A3
          F76F953FEA153FF8B1B1B25C8CAE47B9725AD1A8C4712EC59F458721A5A4EE14
          8530820FEA38D677E1115723C8CD6CB2A6A56932A2D26749711BF34A1C7DA4A0
          FE92D2FF00D938E93163FE4CF87CC2F73F688F6FF866A19DF93F99AA3ED0BFF0
          D2CA7FED653BFE3A70C4E984FE317CC4FE940FD823E301D04C176A3ADBCA6699
          415ACDD5017B01E84BA16A3FA12927F46189D31F4F760F48A5F8A753B264B74F
          7DB3FCA4184C807F5A4FEAC738D1FE48FE61F22BC32903FE17A87FEFB7FF005B
          94C0A752C8DD4B081D9B956D8F1F0F6FFF00A86FFED47FE38B43A0B3E8897AD2
          9B4FABC7852C546D99888CD49650EA54E21D8EE1D8281E7C0951E5CF6071B833
          9596C247EE7685FF0077B3DDC6C596126E29F481F1E0A77657D9EBF19B1178CB
          80CD488CB3BBB7305D6AFC2D9DFF003CCFFDA0C6D53F075DD43B9659A1C2B42C
          0ACC2DF8540FFEECAF5611F75F4D25DF44BAAAB0A3E59E503AC429AFC76D6AA4
          BA4AD087548492439B6E400797AF14DE8ABA43AE7CDED21E75DF8E5AB6550EA7
          97F155220B14B86E331A52D3114F0EB871EEAD8803911C8E32E1CCA14EE0383E
          489E1D9DEB7B61ED70BB4C65B5A95D17B981FA7465BA0699D64EE1E6B9CE91EE
          888A56AAAA52AF3B264C3B72FD713BCA6DE494C1AE148D81778412DBDB003AD0
          083B00A079286A6F3C34EF7AE9C6E95512F8B6AA56FCD24A5BF096B762581CB7
          69D4EEDBA9FE8A8FDBB62B61F84079C276FF00CDCCBCF8395FF3F1B08D285E71
          7A4074416FD7331ADDB72A49BA5A93E1B4E114AE18EAE4BCCA4A52E152927850
          0F1716E09DC118CEFA16B7AF3D01876FDDA296BCC2767F6AEE9E70979A75E0B8
          FBA729D409239C91A8EF20AD47E923A4B734748536346A555DCAF5AED101CA05
          59C53D1423D2195735B07D5C0787D6838DC668CF5B367EB672D4D72DA75C8B3E
          114B555A4C950F0AA63AA1B80ADB9290AD8F0383CD5007B08291A92E954D0F52
          B4519DD4D8F6DCB7DEB62EB8AECE811A439D63F4E536B097192B3CD680549285
          1F3B6241DCA788F17D1479C154CA3D75D8A29EF3898B744D140A8B0144224B0F
          820710F4F03810B1EA29FB4E3059DDD6B6AFF67AA644C7777289D98DA4C5302C
          5860B883B333306104CE59882D3CB50637470057CDD329FC63D98DFD381FB047
          C343F07B7F86B57BFB212FF6A8985B74D053DD81D2397F97125224229EF367D0
          A4982C0047E9047E8C653D04799949CBDD75B516AB29B88ABA2872A91056E282
          52B925C65E437B9F4AC34A091E956C3B48C67A640BCD7AC572960F6D3DBD26A1
          81D3BB7F6B880B77B80F663F03893E918FC52C6DDA31D2AFAD975C2D6AFF000C
          4CD6FED7D57F6B770B15AD08FAEA4277ECE2207F8E1B1AEBA53D45D6966C477C
          70BA9BB6A4B23EC5485AD27FD950C591F83B51A8B5BBF73469953874F9B25DA7
          D3E530DC9610E90843AFA1652140EDB171BDF6F58FB31CA36974B5CB262495F1
          658E06715DA2761A5FD197BDFAC4C4663BA4728DEB5BA1E681FCE31FEDA70784
          37FF00CD67FED07FE38ECAB99B6B5BF64E5CD7EB0C5BD6EA9EA55364CC6C3B01
          AEACA9B694B1C5B01CB74F3E7D98D41B3D399980A650A397393DC4A4827FE837
          7B48FF004D8CF5EC994633BF7F67F75D2ED27B3EB1C11D4DB885F119E622913B
          A27FDDDAAD0FC1F5752BD0C540A54950FC6D9DCD2771F998D8B9B1337452EA6E
          B3AB2D3248BAAB745B7A852935D9505B8F468AA8D196DB686885F0A94A3C44A9
          409DFF00CD18A671396800A2D0D32217D15B1F4E953C16D9945D99A1820C448E
          71AC23060C18D85D223060C18223060C18223060C18223060C18223060C18223
          060C18223060C18223060C18223060C18223060C18223060C18223060C1822F1
          77EA8FBC7F8E221CADCFDBAF2DE8B1AE3928BD25A65DBB5494A6EAF523558B5F
          942B11A332F46692F2D6C2584C81C4DFE478D0EA5213BA0AD37011BE382732BA
          DA7A9EC445DBF455C48CC3F15A65509B2DB6CBFB75CD84EDB0439B0E24F62B61
          BEF8B1CD2772D2BBB67D5735CC74113F18FE9F425246D2D545DB5F76619716DB
          A48B7E195CF66A0876348A93CA7AA4D35E0E80EAC34ADA025659595A8971C415
          20B7C4AC655AEABC287021489D41A754046B6E3D6AA9E050DE663F5B229B2E73
          6969F5BA404A3C1DB68A4A14B73AC5AC0470701A32364CDA109CA7AD9B5EDE69
          7498CE4384A4D3D906232E0505B6D9E1F352A0A50206C0F12B7ED3BFBD59576C
          AEAB0A71B7A8866D3619A7C47CC168B91A31494F528570EE96F8491C2396CA23
          6D89C532BB9AC3F65B981F79AFD7D76F8A995DD555F79757D5D14A90D40BAEA8
          2B1E10A1023BCA811E2B34CA2ADC651C4F7F92F1AE7A97D6B8B5A1246E527ACD
          93CF44D5DDE32EE834AF07B650BAD549DA7D2DF319FE181D5D79FA671C84F5A3
          ADDDB692B09496BF28AE0DF62141DB07212C7A5D3E3448D675AF1E2C39699EC3
          2DD2D84A199094A50979202760E04A1090A1CF64A46FB018FAEA39416A55E0C8
          8D2ADAA0C98F2DB71A7DA76034B43A871EF085A540A79853C4B877ED5F9DDBCF
          00D7735632CEE413F79A6B0A75B9B5875CB222DC5363B96F54E6437A34B5B319
          D933E2CC8E9A6D39D7D7197C68430C05CA1BBA790E246CDBAB59C79563533768
          CDE624FD2544810A7C3AC53A934D31E4BEBF0862BF129CDA9E610E0EBDF5252E
          9404969292E290A504A54E6281AB6475975E8E96675A56D4C6504292DBD4C656
          904329606C0A76E4CA52DFF41294F60031E333222C9A8CEA84991685B2FC9AB1
          DE6BCE53195392FCF439F94514EEAF3DB6D5CF7F39093DA01C32BB9A3AD2E893
          F79A70F39FEDF14B297A93B96BF93B94D5AA3336E53AA7988D97241A8A1D7A34
          409A54A9C78021C428EEB8E07351D92A51F3B61BADAEED675D598949EAA052A6
          502049149DE534DADB7A2BEF269331494C852C25D4ADB9AB67AB4B6140278CAB
          856529A26EED3A5A17B41B7204EA2539547B5E5BB32252C446BC014A71879829
          5B252525203EB50000D95B1FB0F2F33296D6A8569DA948B7284FD41F65B8EE4A
          5C1694F2DB6D495B682B29DCA52A42081BEC0A13EA1B32BB9AABED6E9E08CF1B
          BE427BB594B9C92D41D4B366B37C437BE8F30E91123D4297362467584486242A
          62504758A2A740F05DC3BC2D85951E147084A96A7D3A5E398F6FDA5644D0E54E
          345CC3A751E9F15EBB6AEAAD0FA40C1973254F4A50F95A1A75B69B425AEB51BA
          D615C08E1217515B995D6D59F326C8A4DBF46A648A905096E4484DB2B95C4B52
          CF19481C5BAD6B573DF9AD47D271E757CB6B7AE0B45AA04EA1522650986DB69A
          A7BF11B722B686C00DA52D91C202401B6C396DCB15CA79ABCDA55765739FA89F
          193FD3453548D50DFD9A14BA44CA3CAB7ED984BA859CA710613B3243E2A6EB2A
          90D15975090D70AB852427894956FBA4EC4F2B68EAFEEBBEAECA7D1E9A8B648A
          BD769F1A2D4570A5263AE04A813E6071B429C0B74810C043AAEA92E0709EAD20
          02A7E4DCADB6AA502445916FD15E8D2CC72FB4B84D943A6394960A86DB12D94A
          783F93C236DB6C7A28593768DAF5012E9B6C5BF4F941EF090EC6A7B4D2C3BF95
          FCA6E9483C5F977B9F6FE557FCA3BD035DCD5ADB4B90E07A4EFF008F9247E9FF
          0055356BB2BD97745522149A7DC1476C4B584C87A4429629ADCE297253ABD9C5
          942D3E604A9412B4AD4E052820AB33DF3A6F0A08CF3A045BA6BB12557AA0FBB6
          EC86A5A90ED159A7C34BD3D319439B60348695B0EC54851ED38B0E9B93768D1A
          B712A70ED8B7E2D46034DB11A5334F690F476DB429B4210B09DD294A16A4800E
          C12A23B3963D951CA5B5AAF2DD912EDBA1497DF12438E3B01A5AD6243696E402
          4A773D6A1084AFF9494241DC018A161222558FB1B87D3C86A6B3F0223FA9EF52
          ED42F5BA205AB9A170AA55D10037722E8ECD75CB954E448519DA9438CE066129
          65B614CB2E3A52E96FCD282ADFCEC356E4CC4392191398350B6EE17AEE9369D4
          1D6596EB2F3927E8D7488E4C371EDFAD7928EB78B894A52C759C0547836C30A3
          E43D9512E1AA559AB4ADC454AB6D38C54248A7B5D64E6DC0038974F0F9E14129
          0A0ADF7006F8FBE9B9616DD1ECD16EC4A051A3500023E8E6A1B688BB15711FC9
          81C3CD5E71E5CCF3EDC5C1A55F4ACAAB27DED60EBDBAEBC398DF3BB8A5C512BD
          75E79E54D5188F51834AAF522E1A8525C7E1B8F446A5A22497584AC6C56E35BE
          CDACA42940941493C2A38F8B3DA257E566859D028774D6D770B8622D14D86AEA
          21311DA96DAE7D426F09E15B6B60783A1A583E7B9E6007896DB76996451A8B55
          5CF8749A6C59AE8742DF663210E2BAD73AD737501B9E373CF57AD5CCF3C71B76
          64CDA57DDC906B35AB6A8754AB5302444992A136EBF18257D62421646E9017E7
          0D8F23CF02DD1677DB3DD4F2CEBA713F52A52CABD425D1051754D7EB970CF45C
          B4E8F328EF08EFD5832D49A94E6935231DA4ACC3EA994A10632525054CA093C4
          57B67345BAE7663E9874F2B76BD729FC68934866A931B9D2204FA8A7E8D90E2F
          AD7505B7775B8D254AD88E2DB7EC38A0AD9CBDA0D9736A3268F45A552A4561EF
          089EEC388DB0B9AEF3F3DC2900AD5BA94773BF3513E938F92E4CA1B56F0B4625
          02AB6E512A343A796CC58122136E468C5B1C2D94208E14F08DC0D80D81D86281
          879AD6658566B60BE748E3CC1FEDBBCD234660579CD33478E6E0A82FADBEFF00
          160D704A489A695F4F2A125EEB80FCE299096BAE1CF75716FC5CF1E9AC660D72
          DCD2FE6886ABF5252AD3B8A5D3A955376615CB115B931F70A789E25F54A71D64
          AD44AB66FCE513B92FB5E535ACBA69846DBA0986A8229663F8035D51880F108F
          C3C3B7540F3E0DB877F463F62655DB302931A0316F511A830A23F023C74C1683
          4CC77B84BCCA53C3B0439C29E24EDB2B846FBE194F3579B3AB1F8BFDB1C7EBB5
          62F94B734BABE70669C49139D9116975B871A1B4B738911526950DD5B681E8DD
          6B52C8F5A89F4E30ACC1CCFB872AB50B78CB7A7D4ABB478D67469D4CA14480B7
          0469266AD82B21A0B71DE251471A827743683B03B1DDB76DE52DAD66B109AA45
          B943A6374E75C7A2A62C1699119C713C0E2D1C291C2A5279288E647238E5850A
          10AD9A9089185454C08C6506C75C5A0A2A0DF176F0F11276DF6DC938BA0ACEEB
          7A8E6019A0824F1E33E713F051C53B3DEE8AAE9B92A8975D767D46953EB0AA95
          61C8EE4290A42EBABA7324A1C424B68434EC85A1253B23C151E941C7B6B5A80B
          82D9954AB6515CBA19A7D1B32DAA78A91892E72EA707E986232202E5842D2787
          AC7C385C5870A586D24A8AD4715B3360D0D88D5065147A6259AB25689CD88A8E
          09895ADC5AC3836D9614A75D51077DCB8B279A8EFE3072E6814BB5E2D1235129
          51E8D05485C682D454223B0A42FAC4A92D81C2921638810370AE7DBCF16E43CD
          69FECFAF000A9AC01C7878F1E3AA9FD753B92FCCC4B6EA148BA2E376A75EAA35
          568B4965F2D53A93446E710F499401E171326236869A6D4090EB8A5A36D9C5A3
          00B33342B7588709DADDDB79AE35C14181705469F4E98A727CCA8BB3E6B29A64
          32852551BAD294A086CA1294C2512503AE5E2ADAB645D995DAFD2EAB32D5B7E4
          D4A86D34C53E53901B53D09B695C4DA1B56DBA5285125207204F2C7AAB3A7CB1
          2E18D3999D66DAF29AA9CC4D465A5CA632A1264A42807D7E6F9CE00B5F9C79F9
          EAE7CCEE2C2AAFB0AA4C877C4FD73E7A24558771DE761E6D598CDEF5A7AB2E14
          D2ADA92D53AE50551EA6E535F7DD5C98296825C0B52492E15A4EC943896F878B
          6A9127700FAF18DD1726ED2B72B14EA8C0B66830EA1498A20C294CC0690FC48E
          0101A42C2789280090120EC028FACE325C5CD10B76D283A934B5C675EFF8AC3B
          50192947D45E4D5C364D792A552EE186A8AE291F5D857228751FCF42C2563ED4
          8C694F3B7A2CF32325F305CA0BD3ECB9C564AA23EFD7A3524CE6FD0E2112D6DE
          FF00684297C279138DEEE38FB92D2A55E54FF04ABD369F54884F1753323A1F6F
          7F5F0AC118D2BDC3E9DC4176842E676A7632CB1B0D7D690F6E808E5C8EFF000D
          345A31CB9D06C8A2DC511DBAB35AC7B4A525CE16E15B95355C970AC91D8CC6A7
          F11E23D9B9581CFD58AE6D1B359C934428B14DE566CDACB5D43752ACBDF4EE69
          5D0D9042D9A6C10568A5B2AD882EAF62904150411C62D9B9B4B545ACF0B54BAB
          5C366D3C91D742B62435486E47D8A5B2DA5D1F7A560FDB8E3A1E8CAC9A2D0665
          2A80D556D56EA449A9CCA44E5B354AB0DFB1F9CAE294A1F73A0F3EDC6952C385
          29C9F5F5D90B9AC3B632961E5E2DA3DDDE49333F5C5B90F3CC3450F66966C43C
          919B42B4205B112B97EC594645A59534778D4E3D126A8EE2AB5D90924CDA8711
          E3092A296CF9DC44FE58581A07D2FD6F4FD97B54ABDF15335DCCDBF66A6AF73D
          40AFAC1D6F0F0B5190A1CBAB651BA470809DCAB87CDDB19D644E95B2F34DF1E4
          B5655A749A139249F0994DB65C972F73B92EBEB2A757B9E7E728F3C30CA411B6
          37ADED0B5D9DE75E0380FEFE503705D560FB3CFA15BED574E05C346B47E16E91
          330333A34986868D1AD0175B9CF2FDFBAF4FED0D47F6B771B20FC1D1FDC8E6C7
          F58537FE0BF8C8EF4E855CA9BAAF0ABD564D6EFE448A9CF9131D4B7508C1095B
          8EA96A090639206EA3B6E4F2C501A09D145A9A33A6DCF1AD69D5F9ADDC0FC77A
          49AA4869E282D21694F070368D86CB3BEFBFA310B87DA3D9741E488D7E457956
          C5ECF5CDB6D136E6A39B965FB899D5AEEC59E6B17F825667FF0064EA9FB23B8E
          BAACFE651FD11FE18ECA39B36544CC8CB0B8ADD9EE486A0D7699269F216C2825
          D4B6EB4A428A4904056CA3B6E08DFD0710537D06D944001F4EE6172007FED18B
          FF00F3636319B67557B4B780533ED4704AF7D7341D44810D2359E63902B22D00
          641C4D4FF436A2C498EA6326BE2A6D3121437116426738E32EEDEA4B89413B7A
          0118D52E6BE545C391D98753B56EAA63F48AF521D2D488EE8DBEE7107B16DA87
          34AC7250231D803483A7DA2E98722297675BF22A72A974F7A43ADB93DD438F92
          EBCA715BA90840DB751DBCDECC7B7505A4CCBBD52D29A857DDAD4DAE88E0A634
          8582D4B880EFF9B79052E206FCF60AD8FA462FB8C2FA6A0C830E6803B0ADDC5F
          607F6B61368EA6F0DAD4E9B5B3AE522068788832418E274E5A5EC80E949CE6D3
          665EC7B56DDB8203F428208871EA74E44B30924EFC0DAC90A08DFB124903D000
          E5852675677DD3A89CC399755E3577EB55C9C12871F5A5284B684FD56D084809
          4213B9D9291B732799249DA8DF7D04B92D166B6B8750BFA0A1C24F54DD59A712
          9FB0171952BFBF0C0CA7E85DC86CAE9CCD45EB7EA775496B85C6D35E9EA94C25
          5CB9965210DABEE5248C468B0BAAB149CFD0769FE8B8466C963D7C5B86D6B905
          8DDC0B9E408E432F01B9491D069A2BAB5DB9B2D66F56A0BB16DBB79B75AA1ADE
          414FD2731C496D4EB60F6B6D214B1C5D856B006FC2AD98BD3B3A28AADE229B9B
          B6CC17679A442FA3AE18F1DB2B7511D0A5299941239A928E25A17B7624A15D89
          511B1FA653A3D269EC458AC331A3466D2D34D34808434848D825291C80039003
          90C7B9680E27650041F5E271B865316DF679ED9ED5EB54360AC99819C19CE99F
          78BA35CFD68EC888E5A4F15D6A72EF312B79517A532E5B6AA726915AA4BC2443
          991D438DA56C46E37DC28104820821409041071465E9D32B9FD7B5A1228EEDCF
          4BA7372D92C3D2A9D496A3CB5248D8F0B9CF8091E940047A08C6CB33ABA21B22
          F3D2B126A726D77ADCA948595BD22DF94A801D51ED51686ED6E7D7C1B9C28ADD
          E823C9A975F71A7AAF984EB2827641AA4748E5F6A6383FDF88436175409631F0
          3BCAF29A9B258FE12F75A5ADD06B5DD573DB3DA401BE3BFBD6A421427AA73588
          D1997A4C992E2596596905C75E5A8EC94252372A513C801B9271BB4E8EBD083B
          937A0FAA59976B26256B31199522B8C8014B84992C750860F3D8A9B68277FE79
          50F46193A73E8F2CA2D2C559B9D695A311BACA1040AACE717367241E4781C709
          EAF7F4F004EF8770000E5CB12786E17D09352A192577DB0FECF8616E75E5EBC3
          DEE040026003BF53049234DC204EF95D6FB3DF226E2D36669D56CDBA21B912AB
          4870A388A486E635B9E090D1FF0039B5800823D641D88230C8D35F49266DE942
          CD55BB6957A17D025E5BEDC1A8C044B6E32D677596C9D9490A3CCA78B87724ED
          B93BEEE33F74BD606A6E82CD36F9B5E997030C93D438F20A244527B4B4F20871
          1BFA785401F4EF894F303A09724D9587E14CBEE9C9717F9A66AEDB8848F50EB5
          95ABF5938D0AD85D6A0FCF41F03C415C6629B038960F726EB0BB80D699832E6B
          80E460107F5E4B577A8BD4F5EDAAFBE5BB86F9AC1AB5423B022C64B6C2186223
          5BEFC0DB6800241277279927B49D86290E854D25D5F38F5394CBF644375BB46C
          275728CB5A4A5B973F80A5A61B3FE729057D62F6FAA129079A862D9CB4E840C8
          6B45D627CDA6DC77329202BA8AB5594A609FB50C86C287D87718AD6CFB3E9361
          DB50E9144A640A452A0361B8D0E1B09658613DBB25090001F763359616F75415
          EB3A7F5529B2BECFAEAB5F3715C52B07C1CD00925CE1BB31206834E73BB45ADF
          E9EBD0F55AF2FA33382D880F543E898429B71C78ED95BADC74294A665F08E652
          8E35A1647D54F02BB0288D54B0FAE2BC875A5A90B4282D0B42B62920EE0823B0
          83CC118ED10B40712428020FA0E25CCEEE879C87CF7AC48AA49B55EB6EA72165
          6F48B7E52A007547B545A00B3B9F4908DCE372F70F2E71A8C2A9ED03D97BAFAE
          9F8B61F5031CED5CD74C4F30403A9E2237EB2B4F70BA4333D29F0DA61ACDBBFD
          2D3280840357714400360373B93FA4E294E898D6666C66F6BC6CDA05D198976D
          7A893599E64419D3D4EB0F14437569E249EDD94011F68C3E267410E4F372DD4A
          6BB98A94A56401F4944E43E1B0C6D227450E5CE9873FE8B7ADBF56BCE5556948
          90865B9F363B91D41D656DAB8928610A3E6A8EDB2873DBB71AF42856151A4BB4
          91C4AE3F67308C769E2B6C6B5D17303DB233BCC8044882214AFD3B5A1FABD9B9
          BEFE7050E0BB2ED9B950D22B8A6504FD1735090D875C03EAB6EA128F3BB02D2A
          048E24EF1064767BDD9A6DCC58975D97587E895C86953697DB4A5C4B8DAB6E26
          DC42814AD0AD86E95023903C88047655A9532355E9CFC4971D995164B6A69E65
          E4071B750A1B14A92791047220F23893336FA13B20B34A73F5266DEA9DA725DE
          25AD340A82A2B0A3CCF265616DA7EE4A40C67BBC3DD9CD5A461757B69ECCEB9B
          E763384D614C9398824821DCDA403BCEBC20F1E0B58D9DBD2E99E79F797B3AD7
          AC5CB02151EA8C98F39BA5D35B88E4C688D94DA9C1BA82543910929DC6E0F224
          627AB36CDAB6615D74FA1D0E9D2EAD58AABC98F0E1456CB8F4970F625291FE3D
          806E4EC06F8DBC585D02992936738A9753CC19886B63D5AEAAC212AE7D84A184
          9FEFC54DA6FD0F656693C386C6B429D4A9CEB61B7AA2E15499EF27D292FB854B
          093E948213F663036C6AD677DE3BF55CDE1FECFB19C7EE1B5B13BB0E6B77925C
          E747200803E3E6BE2E8FCD31AF48BA51B56CB96B65CABC56572EAAE347742E63
          CB2E3A01F4A5254100FA4201C366AD7453682E2113A7C286A701290FBE86CA80
          F48E2237C7DFD98C073834C39719F750852EF8B0ED1BBE5539B5B315DAC52999
          8B8C8510A52505C49290480481DA40C4E86E4686B382FA3EDED1B696ACB6B502
          1803402780D37EBC164BE31A81EDBA3FC6B5DEC1E31A81EDBA3FC6B5DEC2A7C9
          CBA7FF0072995BF2CC4EE60F272E9FFDCA656FCB313B98B65FC8266BBEAB7CCF
          A535BC63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E
          5989DCC1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD
          1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974F
          FEE532B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503
          DB747F8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097
          F2099AEFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E
          5D3FFB94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA5
          35BC63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E59
          89DCC1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1F
          E35AEF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFE
          E532B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB
          747F8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2
          099AEFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D
          3FFB94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535
          BC63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989
          DCC1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE3
          5AEF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE5
          32B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB74
          7F8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F209
          9AEFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3F
          FB94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC
          63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DC
          C1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35A
          EF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532
          B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F
          8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099A
          EFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FFB
          94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC63
          503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DCC1
          E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35AEF
          60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532B7
          E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F8D
          6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099AEF
          AADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FFB94
          CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC6350
          3DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DCC1E4
          E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35AEF60
          F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532B7E5
          989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F8D6B
          BD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099AEFAA
          DF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FFB94CA
          DF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC63503D
          B747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DCC1E4E5
          D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35AEF60F1
          8D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532B7E598
          9DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F8D6BBD
          854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099AEFAADF
          33E94D98D7E5126C86D966AF4B75D7541284225B6A52C9EC00056E4E395E21EB
          C282D5D0764958F7353EB346CA4CB9A555E952112A14D896FC565F88F20EE971
          0B4A014A81E608E630DD27638B9B98EF59E93AAC7DE803B8CFCC05FFD9}
        mmHeight = 15875
        mmLeft = 0
        mmTop = 0
        mmWidth = 193146
        BandType = 0
        LayerName = Foreground5
      end
      object LEndereco2: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'LEndereco1'
        AutoSize = False
        Caption = 
          'Campus I Rua Jos'#233' Bongiovani, 700 - Cidade Universit'#225'ria - CEP 1' +
          '9050-920 - Presidente Prudente - SP - Tel: 18 3229-1000 - Campus' +
          ' II - Rodovia Raposo Tavares, KM 572 - Bairro Limoeiro - CEP 190' +
          '67-175 - Presidente Prudente - SP - Tel: 18 3229-2000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 5
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3439
        mmLeft = 0
        mmTop = 16140
        mmWidth = 193726
        BandType = 0
        LayerName = Foreground5
      end
    end
    object DBDisc: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        Tag = 100
        DesignLayer = ppDesignLayer6
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'dis_codigo'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 265
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground5
      end
      object DBTNomDisc: TppDBText
        Tag = 100
        DesignLayer = ppDesignLayer6
        UserName = 'DBTNomDisc'
        HyperlinkEnabled = False
        DataField = 'nomdisc'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 17463
        mmTop = 265
        mmWidth = 99484
        BandType = 4
        LayerName = Foreground5
      end
      object DBTChMin: TppDBText
        Tag = 100
        DesignLayer = ppDesignLayer6
        UserName = 'DBTChMin'
        HyperlinkEnabled = False
        DataField = 'chmask'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 118534
        mmTop = 265
        mmWidth = 8996
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 0
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line101'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 191135
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line102'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 16404
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine13: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 117475
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 128323
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine15: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 141288
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine16: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 161396
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine17: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3556
        mmLeft = 182034
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBTChMin1'
        HyperlinkEnabled = False
        DataField = 'medfin'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 265
        mmWidth = 11906
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'perlet'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 265
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText10: TppDBText
        Tag = 100
        DesignLayer = ppDesignLayer6
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'sitfin'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 162719
        mmTop = 265
        mmWidth = 17463
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBTChMin2'
        HyperlinkEnabled = False
        DataField = 'obs'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 184150
        mmTop = 265
        mmWidth = 8996
        BandType = 4
        LayerName = Foreground5
      end
    end
    object FBHistor: TppFooterBand
      BeforePrint = FBHistorBeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6614
      mmPrintPosition = 0
      object LPagina: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'LPagina'
        HyperlinkEnabled = False
        Caption = 'P'#225'gina : 2 de 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 1588
        mmWidth = 21696
        BandType = 8
        LayerName = Foreground5
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2114
        mmLeft = 0
        mmTop = 0
        mmWidth = 195580
        BandType = 8
        LayerName = Foreground5
      end
    end
    object SBHistor: TppSummaryBand
      BeforePrint = SBHistorBeforePrint
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 46302
      mmPrintPosition = 0
      object ppRegion2: TppRegion
        DesignLayer = ppDesignLayer6
        UserName = 'Region2'
        Caption = 'Region2'
        Pen.Style = psClear
        ShiftRelativeTo = Memo
        mmHeight = 42628
        mmLeft = 0
        mmTop = 3660
        mmWidth = 192352
        BandType = 7
        LayerName = Foreground5
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object BarCode: Tpp2DBarCode
          DesignLayer = ppDesignLayer6
          UserName = 'TwoDBarCode1'
          AlignBarcode = ahLeft
          AutoScale = True
          AutoSize = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          MaxiCodeSettings.BarHeight = 8
          MaxiCodeSettings.CarrierPostalCode = '000000000'
          MaxiCodeSettings.HorPixelsPerMM = 4.000000000000000000
          MaxiCodeSettings.VerPixelsPerMM = 4.000000000000000000
          PDF417Settings.BarHeight = 8
          PDF417Settings.RelativeBarHeight = True
          QRCodeSettings.QuietZone = 4
          DataMatrixSettings.QuietZone = 4
          BarCodeType = bcQRCode
          Data = 'https://www.unoeste.br/historicoescolar/'
          PrintHumanReadable = False
          mmHeight = 32808
          mmLeft = 2385
          mmTop = 4988
          mmWidth = 32808
          BandType = 7
          LayerName = Foreground5
        end
        object LCodVal: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LCodVal'
          Caption = 'C'#243'digo de verifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 37045
          mmWidth = 27781
          BandType = 7
          LayerName = Foreground5
        end
        object LHistorico: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LCodVal1'
          Caption = 'Hist'#243'rico escolar digital'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3705
          mmLeft = 3175
          mmTop = 41013
          mmWidth = 29369
          BandType = 7
          LayerName = Foreground5
        end
      end
      object Memo: TppMemo
        DesignLayer = ppDesignLayer6
        UserName = 'Memo'
        KeepTogether = True
        Caption = 'Memo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        mmHeight = 1818
        mmLeft = 0
        mmTop = 1057
        mmWidth = 195580
        BandType = 7
        LayerName = Foreground5
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'alu_ra'
      DataPipeline = ppDBPipeline1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand2BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 20108
        mmPrintPosition = 0
        object ppShape2: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape2'
          ReprintOnOverFlow = True
          mmHeight = 20108
          mmLeft = 0
          mmTop = 0
          mmWidth = 195527
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LCidade2: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LCidade2'
          HyperlinkEnabled = False
          Caption = 'LCidade2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 7938
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LOriginal1: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Original Assinado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 87300
          mmTop = 2101
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LPortaria1: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LPortaria1'
          AutoSize = False
          Caption = 'Segundo a Portaria 554/2019/MEC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 87300
          mmTop = 5823
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LAssinante1: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LAssinante1'
          AutoSize = False
          Caption = 'LAssinante1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 87300
          mmTop = 9528
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LCargo1: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LCargo1'
          AutoSize = False
          Caption = 'LCargo1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 87300
          mmTop = 13232
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LOriginal2: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LOriginal2'
          AutoSize = False
          Caption = 'Original Assinado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 141360
          mmTop = 2117
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LPortaria2: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LPortaria2'
          AutoSize = False
          Caption = 'Segundo a Portaria 554/2019/MEC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 141360
          mmTop = 5821
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LCargo2: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LCargo2'
          AutoSize = False
          Caption = 'LCargo2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 141360
          mmTop = 13229
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object LAssinante2: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LAssinante2'
          AutoSize = False
          Caption = 'LAssinante2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 141360
          mmTop = 9525
          mmWidth = 51073
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'alu_ra'
      DataPipeline = ppDBPipeline1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      NewFile = False
      object GHBHistor: TppGroupHeaderBand
        AfterPrint = GHBHistorAfterPrint
        BeforePrint = GHBHistorBeforePrint
        Background.Brush.Style = bsClear
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 94721
        mmPrintPosition = 0
        object LEndereco: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LEndereco'
          AutoSize = False
          Caption = 
            'Campus I Rua Jos'#233' Bongiovani, 700 - Cidade Universit'#225'ria - CEP 1' +
            '9050-920 - Presidente Prudente - SP - Tel: 18 3229-1000 - Campus' +
            ' II - Rodovia Raposo Tavares, KM 572 - Bairro Limoeiro - CEP 190' +
            '67-175 - Presidente Prudente - SP - Tel: 18 3229-2000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 5
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3439
          mmLeft = 0
          mmTop = 16149
          mmWidth = 193726
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object SCab: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'SCab'
          Brush.Color = 16119285
          mmHeight = 69850
          mmLeft = 127
          mmTop = 18785
          mmWidth = 195527
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape13: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape102'
          mmHeight = 6879
          mmLeft = 170921
          mmTop = 45508
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape15: TppShape
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Shape11'
          mmHeight = 4498
          mmLeft = 127
          mmTop = 89165
          mmWidth = 195398
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape16: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape16'
          mmHeight = 6879
          mmLeft = 1058
          mmTop = 45508
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape10: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape10'
          mmHeight = 6879
          mmLeft = 118004
          mmTop = 45508
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape9: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape9'
          mmHeight = 6879
          mmLeft = 25665
          mmTop = 37835
          mmWidth = 153459
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape7: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape7'
          mmHeight = 6879
          mmLeft = 1058
          mmTop = 37835
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape4: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape4'
          mmHeight = 13229
          mmLeft = 1058
          mmTop = 19579
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LFac: TppLabel
          Tag = 100
          DesignLayer = ppDesignLayer6
          UserName = 'LFac'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LFac'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 20373
          mmWidth = 192352
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LCurso: TppLabel
          Tag = 100
          DesignLayer = ppDesignLayer6
          UserName = 'LFac1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LCurso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 24606
          mmWidth = 192352
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LHab: TppLabel
          Tag = 100
          DesignLayer = ppDesignLayer6
          UserName = 'LHab'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LHab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 28840
          mmWidth = 192352
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label3'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'HIST'#211'RICO ESCOLAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 33338
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Reg. Acad'#234'mico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 1852
          mmTop = 37835
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LRA: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LFac2'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LRA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 40746
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel7: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = 'Nome do Aluno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 26458
          mmTop = 37835
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LAluno: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LAluno'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LAluno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 26723
          mmTop = 40481
          mmWidth = 151607
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel8: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label8'
          HyperlinkEnabled = False
          Caption = 'R.G.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 118798
          mmTop = 45508
          mmWidth = 4233
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LRG: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LRG'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LRG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 48419
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape11: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape101'
          mmHeight = 6879
          mmLeft = 159809
          mmTop = 45508
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LEst: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LRG1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LEst'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 160867
          mmTop = 48419
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel10: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = 'Est. Exp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 160602
          mmTop = 45508
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel17: TppLabel
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Label17'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 1588
          mmTop = 90223
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine4: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 16404
          mmTop = 89165
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel18: TppLabel
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Label18'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'Disciplina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 52652
          mmTop = 90223
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine5: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line5'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 117475
          mmTop = 89165
          mmWidth = 2647
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel19: TppLabel
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Label19'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'C. H.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 118534
          mmTop = 90223
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine6: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 128323
          mmTop = 89165
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel20: TppLabel
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Label20'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'P/Letivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 145521
          mmTop = 90223
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine7: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line7'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 141288
          mmTop = 89165
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel21: TppLabel
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Label201'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'M'#233'dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 130440
          mmTop = 90223
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine8: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line8'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 161396
          mmTop = 89165
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel22: TppLabel
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Label22'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'Sit. Fin.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 165629
          mmTop = 90223
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine9: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line9'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 182034
          mmTop = 89165
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel23: TppLabel
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Label23'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'Obs.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 185209
          mmTop = 90223
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel13: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label13'
          HyperlinkEnabled = False
          Caption = 'Data de Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 1852
          mmTop = 45508
          mmWidth = 20320
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LDatNas: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LDatNas'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LDatNas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 48154
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine54: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line54'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 0
          mmTop = 89165
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel38: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Label38'
          HyperlinkEnabled = False
          Caption = 'Ingresso por Curso Superior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 1058
          mmTop = 53181
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine60: TppLine
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Line12'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 29898
          mmTop = 54504
          mmWidth = 165100
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine61: TppLine
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Line61'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 24606
          mmLeft = 194734
          mmTop = 54769
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine62: TppLine
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Line62'
          Weight = 0.750000000000000000
          mmHeight = 4498
          mmLeft = 1058
          mmTop = 79375
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine63: TppLine
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Line63'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 23548
          mmLeft = 1058
          mmTop = 56092
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape33: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Shape33'
          mmHeight = 6879
          mmLeft = 1852
          mmTop = 56092
          mmWidth = 192088
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel39: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Label39'
          HyperlinkEnabled = False
          Caption = 'Curso Superior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 2646
          mmTop = 56092
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LCurSup: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'LFac3'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LCurSup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 59002
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object SRegDiploma: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'SRegDiploma'
          mmHeight = 6879
          mmLeft = 1852
          mmTop = 64029
          mmWidth = 38118
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LRegDiploma: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'LRegDiploma'
          HyperlinkEnabled = False
          Caption = 'N'#186' Reg. Diploma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 2646
          mmTop = 64029
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LRegDipl: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'LDatNas4'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LRegDipl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 66675
          mmWidth = 35738
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object SLivro: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'SLivro'
          mmHeight = 6879
          mmLeft = 44458
          mmTop = 64029
          mmWidth = 34408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LLivro: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Label401'
          HyperlinkEnabled = False
          Caption = 'N'#186' do Livro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 45252
          mmTop = 64029
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LNLivro: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'LNLivro'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LNLivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 45517
          mmTop = 66675
          mmWidth = 32293
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object SFolha: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'SFolha'
          mmHeight = 6879
          mmLeft = 82560
          mmTop = 64029
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LFolha: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Label402'
          HyperlinkEnabled = False
          Caption = 'N'#186' da Folha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 83354
          mmTop = 64029
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LNFolha: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'LNFolha'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LNFolha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 83618
          mmTop = 66675
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape37: TppShape
          Tag = 10
          DesignLayer = ppDesignLayer6
          UserName = 'Shape37'
          mmHeight = 6879
          mmLeft = 112977
          mmTop = 64029
          mmWidth = 80963
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel43: TppLabel
          Tag = 10
          DesignLayer = ppDesignLayer6
          UserName = 'Label403'
          HyperlinkEnabled = False
          Caption = 'N'#186' do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 113772
          mmTop = 64029
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LNProc: TppLabel
          Tag = 10
          DesignLayer = ppDesignLayer6
          UserName = 'LNProc'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LNProc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 114036
          mmTop = 66675
          mmWidth = 79110
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape38: TppShape
          Tag = 10
          DesignLayer = ppDesignLayer6
          UserName = 'Shape38'
          mmHeight = 6879
          mmLeft = 1852
          mmTop = 71967
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel44: TppLabel
          Tag = 10
          DesignLayer = ppDesignLayer6
          UserName = 'Label404'
          HyperlinkEnabled = False
          Caption = 'Data do Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 2646
          mmTop = 71967
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LDatReg: TppLabel
          Tag = 10
          DesignLayer = ppDesignLayer6
          UserName = 'LDatReg'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LDatReg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 74613
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object SLocalReg: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'SLocalReg'
          mmHeight = 6879
          mmLeft = 31485
          mmTop = 71967
          mmWidth = 162454
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LLocalReg: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'LLocalReg'
          HyperlinkEnabled = False
          Caption = 'Local do Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 32279
          mmTop = 71967
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LLocReg: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'LDatReg1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LLocReg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 32544
          mmTop = 74613
          mmWidth = 160338
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel46: TppLabel
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Label46'
          HyperlinkEnabled = False
          Caption = 'Ingresso por Vestibular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 1058
          mmTop = 53181
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine64: TppLine
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Line64'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 24871
          mmTop = 54504
          mmWidth = 170127
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine65: TppLine
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Line65'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7938
          mmLeft = 1058
          mmTop = 55827
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine66: TppLine
          Tag = 4
          DesignLayer = ppDesignLayer6
          UserName = 'Line66'
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 191135
          mmTop = 89165
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape40: TppShape
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Shape40'
          mmHeight = 6879
          mmLeft = 1852
          mmTop = 56092
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel47: TppLabel
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Label47'
          HyperlinkEnabled = False
          Caption = 'Per'#237'odo do Vestibular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 2646
          mmTop = 56092
          mmWidth = 21971
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LDatVest: TppLabel
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'LDatReg2'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LDatVest'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 58738
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine67: TppLine
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Line67'
          Weight = 0.750000000000000000
          mmHeight = 1322
          mmLeft = 1323
          mmTop = 63500
          mmWidth = 193675
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape43: TppShape
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Shape43'
          mmHeight = 6879
          mmLeft = 81756
          mmTop = 56092
          mmWidth = 112184
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LEntidade: TppLabel
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'LEntidade'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LEntidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 82815
          mmTop = 58738
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel51: TppLabel
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Label501'
          HyperlinkEnabled = False
          Caption = 'Entidade Realizadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 82550
          mmTop = 56092
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape44: TppShape
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Shape402'
          mmHeight = 6879
          mmLeft = 1058
          mmTop = 80963
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel49: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Label49'
          HyperlinkEnabled = False
          Caption = 'Conclusao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 1852
          mmTop = 80963
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LConclusao: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'LConclusao'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LConclusao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 83608
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape45: TppShape
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Shape45'
          mmHeight = 6879
          mmLeft = 32808
          mmTop = 80963
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel52: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Label52'
          HyperlinkEnabled = False
          Caption = 'Col. de Grau'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 33602
          mmTop = 80963
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LColGra: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'LConclusao1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LColGra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 33867
          mmTop = 83608
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape46: TppShape
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Shape46'
          mmHeight = 6879
          mmLeft = 65881
          mmTop = 80963
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LExpedicao: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'LExpedicao'
          HyperlinkEnabled = False
          Caption = 'Exp. Diploma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 66675
          mmTop = 80963
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LExpDipl: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'LExpDipl'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LExpDipl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 66940
          mmTop = 83608
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape47: TppShape
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Shape47'
          mmHeight = 6879
          mmLeft = 98954
          mmTop = 80963
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LNLivro2: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'LNLivro1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LNLivro2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 100013
          mmTop = 83608
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel55: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Label55'
          HyperlinkEnabled = False
          Caption = 'N'#186' do Livro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 99748
          mmTop = 80963
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape48: TppShape
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Shape48'
          mmHeight = 6879
          mmLeft = 134144
          mmTop = 80963
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LNFolha2: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'LNFolha1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LNFolha2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 135202
          mmTop = 83608
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel57: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Label57'
          HyperlinkEnabled = False
          Caption = 'N'#186' da Folha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 134938
          mmTop = 80963
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape49: TppShape
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Shape49'
          mmHeight = 6879
          mmLeft = 168275
          mmTop = 80963
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel58: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'Label58'
          HyperlinkEnabled = False
          Caption = 'Data do Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 169069
          mmTop = 80963
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LDatReg2: TppLabel
          Tag = 3
          DesignLayer = ppDesignLayer6
          UserName = 'LDatReg3'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LDatReg2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 169334
          mmTop = 83608
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape52: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape52'
          mmHeight = 6879
          mmLeft = 179652
          mmTop = 37835
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel53: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label101'
          HyperlinkEnabled = False
          Caption = 'P'#225'gina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 180446
          mmTop = 37835
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLine50: TppLine
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Line50'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8731
          mmLeft = 194734
          mmTop = 54769
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LPag: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LPag'
          HyperlinkEnabled = False
          Caption = 'LPag'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 180711
          mmTop = 40746
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape20: TppShape
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'Shape20'
          mmHeight = 6879
          mmLeft = 168275
          mmTop = 80963
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LDatConcl: TppLabel
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'LDatConcl'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LDatConcl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 169334
          mmTop = 83608
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel5: TppLabel
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'LTitDatReg1'
          HyperlinkEnabled = False
          Caption = 'Data de Conclus'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 169069
          mmTop = 80963
          mmWidth = 19135
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape6: TppShape
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'Shape6'
          mmHeight = 6879
          mmLeft = 134144
          mmTop = 80963
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LIngresso: TppLabel
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'LIngresso'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LIngresso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 135202
          mmTop = 83608
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel2: TppLabel
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'LTitFol1'
          HyperlinkEnabled = False
          Caption = 'Ingresso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 134938
          mmTop = 80963
          mmWidth = 8805
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape5: TppShape
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'Shape5'
          mmHeight = 6879
          mmLeft = 1058
          mmTop = 80963
          mmWidth = 124354
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LQualif: TppLabel
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'LConclusao2'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LQualif'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 83608
          mmWidth = 121709
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LTitQua: TppLabel
          Tag = 5
          DesignLayer = ppDesignLayer6
          UserName = 'LTitQua'
          HyperlinkEnabled = False
          Caption = 'Qualifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 1852
          mmTop = 80963
          mmWidth = 12658
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape19: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape19'
          mmHeight = 6879
          mmLeft = 73554
          mmTop = 45508
          mmWidth = 43656
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LNasc: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LNasc'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LNasc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 74613
          mmTop = 48154
          mmWidth = 41804
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel14: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label14'
          HyperlinkEnabled = False
          Caption = 'Nacionalidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 74348
          mmTop = 45508
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape17: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape17'
          mmHeight = 6879
          mmLeft = 23548
          mmTop = 45508
          mmWidth = 49213
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LLocNas: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LDatNas1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LLocNas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 24606
          mmTop = 48154
          mmWidth = 47361
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel15: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label15'
          HyperlinkEnabled = False
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 24342
          mmTop = 45508
          mmWidth = 7112
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape42: TppShape
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'Shape42'
          mmHeight = 6879
          mmLeft = 52652
          mmTop = 56092
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LTpPonto: TppLabel
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'LTpPonto'
          HyperlinkEnabled = False
          Caption = 'Pontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 53446
          mmTop = 56092
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LPontos: TppLabel
          Tag = 2
          DesignLayer = ppDesignLayer6
          UserName = 'LPeriodo1'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LPontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 53711
          mmTop = 58738
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape12: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape12'
          mmHeight = 6879
          mmLeft = 144727
          mmTop = 45508
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LOrg: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LOrg'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LOrg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 145521
          mmTop = 48419
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel11: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label102'
          HyperlinkEnabled = False
          Caption = 'Org. Exp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 145521
          mmTop = 45508
          mmWidth = 9440
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LCPF: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LRG2'
          HyperlinkEnabled = False
          AutoSize = False
          Caption = 'LCPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 171715
          mmTop = 48419
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel12: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'CPF '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2582
          mmLeft = 171715
          mmTop = 45508
          mmWidth = 4826
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppImage2: TppImage
          DesignLayer = ppDesignLayer6
          UserName = 'Image2'
          AlignHorizontal = ahCenter
          AlignVertical = avCenter
          AutoSize = True
          MaintainAspectRatio = False
          Picture.Data = {
            0A544A504547496D6167654E500000FFD8FFE000104A46494600010101012C01
            2C0000FFED002C50686F746F73686F7020332E30003842494D03ED0000000000
            10012C000000010001012C000000010001FFE100224578696600004D4D002A00
            000008000101120003000000010001000000000000FFE202404943435F50524F
            46494C450001010000023041444245021000006D6E74725247422058595A2007
            CF00060003000000000000616373704150504C000000006E6F6E650000000000
            00000000000000000000000000F6D6000100000000D32D414442450000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000A63707274000000FC00000032646573630000013000
            00006B777470740000019C00000014626B7074000001B0000000147254524300
            0001C40000000E67545243000001D40000000E62545243000001E40000000E72
            58595A000001F4000000146758595A00000208000000146258595A0000021C00
            0000147465787400000000436F7079726967687420313939392041646F626520
            53797374656D7320496E636F72706F7261746564000000646573630000000000
            00001141646F6265205247422028313939382900000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000058595A20000000000000F35100010000000116CC58595A200000000000
            0000000000000000000000637572760000000000000001023300006375727600
            00000000000001023300006375727600000000000000010233000058595A2000
            00000000009C1800004FA5000004FC58595A20000000000000348D0000A02C00
            000F9558595A2000000000000026310000102F0000BE9CFFDB00430002010102
            0101020202020202020203050303030303060404030507060707070607070809
            0B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB0043
            01020202030303060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0CFFC0001108003C02DA03012200021101031101FFC4001E0000030002020301
            0000000000000000000007080609050A02030401FFC4005D1000010302040204
            0A04070B08050D0000010203040506000708111221091331D214171922415155
            579496153261710A1623338191B4363738395262727576A1B12442737492B2B3
            D325829395D11A262A34354446535463A4C3D4FFC4001C010100010501010000
            0000000000000000000501020304060708FFC400421100010302030407050506
            04070000000001000211030405122106314151135261718191D20722A1B1F014
            233272C1153334B2D1E1162436423553626373B3F1FFDA000C03010002110311
            003F00DA974A46BB2E5D0AD9169552DBA3D0AB0F5C1527A13C8A9F5BC2DA50C9
            7014F56A49DF7F5EFCB1197FE5096691FF00E0ACBFFD733FE6E1C1F8449FBD26
            5A7F5F4AFD90E354C9ED18E5B13BDAF4EE4B18E81A7C97CF9B7DB578BD8E3552
            DED2B963006C011C5A09DE1760CD036A32ADAAFD2D5B97DD6E0D3A9B52ACAE52
            5D8F078FA8475525C693C3C64AB98402773DA4E1B7599AAA7522548404A96C32
            B70057612124F3FD5898FA18FF008BB2C5FF004B51FDBDFC52D74FEE6AA1FEAC
            EFFB871D0DABCBA831CEDE40F92F69C06E6AD7C26DEBD532E7536927992D049F
            35A964FE109E69948DECACBFECF4199FF370F4E8E9E96DBE758BA978D6557EDA
            B4E974F7A992A717E9FE11D78535C1C23CF594EC788EFCB1A9247D41F762C3E8
            31FE1F507FB3D51FFF004E397B3C42E1F5D8D73F425780ECCED9635718BDBDBD
            7B82E639E011A6A27B96EBB063D151A8314A84F4992F351E3C7429C75C756108
            6D206E54A51E4001DA4F218997347A62B20F2BAA6E4255E2AB82532B28713438
            2ECE6D247FF7520367F428E3ABA95A9D312F701DEBE89BEC52CEC9A1F7755AC0
            7AC409EE9550E0C4756F74E7E4256E7A197EA5745250A3B75D3286EF569FB496
            CAC81FA314C64F67BD9F9FF6C8ACD9972522E4A6EE12B7A0C80E752A3D89713F
            590AFE6A8038B695CD2A8629B81F1586C31DC3AF5D92D2BB5E7907027CB7ACB7
            060C6139D9A8EB1B4E740454EF7BA2916DC47490D196F6CE4823B436D8DD6E11
            EA4A4E32B9C1A25C60291AD5A9D261A955C1AD1BC930078959B60C46F5AE9D5C
            85A54D5B2CCEBB2A2849D83D1A84E06D5F68EB0A4FF76330CA4E975C87CDFAAB
            3023DE8DD0E74858434CD722394E0E13D8038B1D57EB58C6BB6F6DDC72878F35
            094B6AB07AB53A2A7754C9FCC3FAAA63063C23C844A610EB6B4B8DB890A4A927
            70A07B083E918F3DF6C6D29F460C4F99E1D28D92390358914CACDED0E6D5E29E
            07A0D21972A2F34AF4A565A050850F485281185B41E9DCC87993034B9178C541
            3B75AED096503EDF35455FDD8D675ED069873C4F7A82B8DA8C2285434AADCB03
            870CC34EFD7456660C2DB20B57996FA9F86E3B635DD48AF38C242DE8ADACB52E
            38F5AD8584B891B9DB729DBEDC32719D8F6B8666990A5EDEE6957A62AD070734
            EE20823CC2306306CF2D4AD8BA6CB79154BE2E7A55BB11E252CF84BBBBB248ED
            0D349DD6E11EA4A4ED8992B5D3CF9174A9EB65845EF536D2793D1A8A12DABEEE
            B1C42BFBB18AADD51A661EE00A8DBFDA0C36C5DD1DDD76B1DC8B84F96F56A63F
            15F54E245CBDE9BCC84BEAA688D2AB55CB64B8764B958A538D33BFDAE365C4A4
            7DAA2062AAB5AECA65F16EC4AB51AA30AAB4C9EDF5B1A5C47D2F30FA0FF9C95A
            49047DC715A5714EAFEEDC0ACD87E31637C09B3ACD7C6FCA418EF1BC2D746BC7
            A68F3034A9AACBAAC2A35AB66D4699415460CC89A24F5EE75919A74F1703813C
            8AC81B0EC03197F46074AFDEDAE1D40D4AD2B8ADCB569306150DEAA25EA68901
            E53887986C24F58E287090E9F46FC8620BE994FE31ECC6FE9C0FD823E3D3D159
            AC2B5B44FA89A9DD976C5AD4BA6CCA0BF4C42298C21E783AB7D8701216B40E1D
            9B573DFD2396219B79505CE573BDD92BE7AA5B778951DAB75B5DDC96DBB6AB81
            0620341200DDB96FCF062146FF0008472456A00D1B31523D7F45C73B7FF91860
            69A7A60B2B35579CD4AB16D981793359AC25E5B0B9F4E6998E034D29D571292F
            288F35076E5DBB625DB7745C60382F70B6DB3C0EE2AB68D1BA639CE20000EA49
            DC1557831E999399A7427644875B618610A71C71C50421B481B9512790007693
            D98963377A68720B292ACF4117549B9E5B0A297116FC15CD6D247A03DE6B4AFF
            00AAB23192A556304BCC296C4316B2B060A97B55B4C1DD98813DD3BFC155B831
            1151FA7EF21EA7352D3EDDF54D6D479BD228A95A13F786DD5ABF50C539905AA7
            CBED4FD09CA858975D26E2658DBAF6D870A6445DFB3AD656038DEFFCE4807D18
            B69DC5279863815AB876D26157EFE8ECEE18F7720E13E5BD307060C18CCA6D18
            3060C11183060C11183060C11183060C11183060C11183060C11183060C11183
            060C11183060C11183060C11183060C11183060C117039A77148B432D6E0AAC4
            EAFC2A994D932D9EB13C48E36D95AD3B8F48DD237188B6EAE911CC3A3F446E5B
            E75322DFFC74BA6551DA9BC505461F0CA9DD43BC0D71EE9F33B3CE3B1E7CF167
            66E50E4DCD959725361A03B2EA14B95199413B712D6CAD291BFDA48C6A41ECEF
            B5F31BA2272632268F546E667047B928D45936825B5FD2D0A445A995BE5E636E
            26DB4A13C5C6AD93B7A7B76D5B8796EE3C0F9E8B9AC76F1F41C435F9669BA3B5
            D2D88EDD7455E64BF487DD95BE953CC1C98B9E2D29AB3187954EB6273318B6F1
            9ED436263919D70AC85A94C38EAD3E68FCD7A79E30EC9DE925CCACC0CA9D3BD5
            659B6DB9D9A798F55B4EAEB6E9CAE04458EB968654D27ACF3563A96C9249DF9F
            21BF2C0B3132F6AB71E67EB02EFB69A2F5E19459876F5F7446C76BEE42A5A152
            18F590F455486C8F4F10C2E7497536EB7A77D11CD6925B6A6E74D6A436827729
            4ADC9EA037F4EC0818C5D23E627EB300A0C62376DAFD0B9E752F23BBA56340F0
            D7C08544C5E93BBEE2744DDC9997363508E6F506E07ECCF044435086E5585493
            19B4F53C7C5B754B4A8A78B99071CB5133AF5379E3AACCDAB0ECABAF2AA870B2
            AFE858D21CAC5B72653931E974F4BCE2925A7D20243A97760476148E7B13840D
            C7644C7BA596569FD31166D9AF66AC3CE7715B6CC98CD5296F3AD91EA54C481B
            766E31E57F46D34C8E935D4C275075B628EE78750C50C395BA8D37AD49A6A7C2
            36F045A78F63D57D7DF6DF9769C03DC779DDA6F8DD3FD9627621727207D480D7
            F4665C58096B2A124BA0EFF7786A401C5523796756A0EE1D6A53B25EDBBB32DE
            8D52A6E5A43BAAAF529B6C489AC4D9E6518AF06509928534D29452A485151480
            41DC9C2FE374AA6655CBA79B461187635BD993726694BCAD975E792EBD6FC25C
            6E6E4F4345614BE204250DA9CDB8F724EDCB1C648C84CBDD5BF4A5D1E954FABD
            C7F88C9C88A74EA24BA05C3369CEC98C2A25A6497DB5A5D75B2D2BEAB84F1100
            9DC8C2FF0026B35ECCCBED0EC2CB6CDAB129377E5151B376B36155AAF250231B
            563B2B2B873A4750DF175AA5AD4853FBB6AE7B952893BD5CE703BE06BFA7D4AC
            8FBCB90F79E94B5A4BC025C48D0B6387BA209F7877954D5DB9EDA88D3464AEA0
            245F11EDBB85397F6DAABB675E71A9620C5AC2FA95A9C8EFC30FAD414D282772
            080A04F338E11DD56E78672EA5F2F72FEC8B86C2B6555FCA3837FCF9556B79EA
            825C94E3A96DC69094486CA104AD24733B049EDDC627472E18F49CA4D5FD9F95
            F7C57F30720289964B7E9D327541CAAC4A3D59C6D7D64289317B971B0D0E2290
            A504F9A0F31B9CD6C5D44D8FA65D7EE505C17F5CD4BB568D234DF4C82D4B9CB2
            96DC7D525B525B1B03E714A1676FE69C03E779D3BFB4F1571C45C4B1A6A16B24
            024BBFEB7030FD246900EF8DFAAA0727FA462B2F69073AEEACC1A551A957C642
            CCAAD1EBAC5396B553EA1262B5D630EB01678C21E2A4009512413DBCF18D69BF
            5E799F71E8B73E2A97E46B761E6CE4F43912D6C4486B442287294DCF86B53656
            49078D493E70DF80F6624DBE155ECECCAEBD69D6E437212B5799E8816DB5588E
            F466AA14380843CB98EA36EB0475A9A403B0DCA38B61D98CE33D9FCC5C8FD46E
            7D40CCFF00C488F373C324AAB2E37E2AF85269EF4AA446710949123CFEB7C1D6
            BDF6E5B706DE9C505676F9FAD7FB79AB7F6BDD00D7E6716B46527812E0ECA4F6
            FEEE3F314E3B475B39E793762E46662662CDCBCBB32EF392652A9B31BA451E45
            2EA56DBD52642E3AF894FBADBEDA55BA57E6A4F2E5DBCB95A2E786A53513AA4C
            EDB5F2F2E9CACB728195F5E8F496115CB7254C90FA5E8A97828ADA7D20EC491C
            C7AB084ADE7D5A3ABFD1DE94F23F2EEB08BBAF68955B524D7E2535A71C16F45A
            7B095CB764B9C3C2D7011C3CCF320EDBE38C971B4C1235F1A9D4EA0ABB1E9138
            DD51451D2E572A54E2E3060A3AD204471215E714F356E47A08F48BCC800E9DFD
            9CD53F68548A6195A584B752FCA24D37170CF07880639E8B6579C77B5C9943A4
            5BA2E39122972EEFB62D1955175F6E3A9309E9CC43538A525A2AE20D17504849
            56FC276DFD38912CED7367AE5165264966AE60CDCBBBB32EF3666526054A2D2A
            8D229953B75552402C3A95A9F71B7D0851D960A524F2DBB7714BEA42A945ADF4
            755F936DC928976F4BCBB9EF531F42D4B4BD1554D70B2B0A579C414709DD5CCE
            FCF9E35FD373EAD3D58E8134C591197D576EEDCC05542D5FA6A9F4D69C74D063
            C14A5C96F495F0F0B41BE1DB99E677DB7DB196B3C83A1E1A296C62EDD4EB00CA
            841C92D00FE27660008FF74EEDDC6551D756A673D350199B9DAF65255EC8B72D
            9C8E9ABA33316B14572A2FDDB536180FC9696E25E4783349DC369280A512773F
            6529A3BD4447D58E97AC8CC68D10D3D376D29A9AE45E2E3115D3BA5D6C1F484B
            895807D200C459969A9AB47411987AB9B67326B11ADBACD6EEB9F7A5BD1A5A54
            95DC9127C44F5498600FCBAFAD4F56528DC851E7B6C76A57A27728EB1919D1D3
            9516D57E1BD4FACC4A3F854B8AF0297232E43CE49EAD40F34A921D00A4F30411
            E8C28BC9744F39F359708BAA8FB9CAE79248797099CA43E1A238693A69313AEF
            53DD6F5CD9EF7F647E65EA02CC9962C7CB6CBCAC4F8F4FB4E6D1DD7A65C74DA7
            BBD5CA94B9C1D1D43AAD9C2DA52D948E1D8EFDA72ABD75699D39F9AC6A558993
            95CB0ADDA0D4B2D29F7FA1FB9288FCF71C4C97CB7C00B4EA36F356D9ECDB92BD
            6313CDA7A81B7B4D5D18F9DB905714D4C5CDE8955B86DCA65AE5A59A95717519
            0B30DE8CD01C4EB4E25F0A0B4EE0049DCF66FC7663E5CE4CE54EBAAC6B535135
            36A8B43B6321E854B656E55A6410AA93320B651D6455256AF352F72278796FDA
            06308A84812794EBF50A05F88D70D6455FC5933CBF286B897489D72EE888E034
            D554D9BBA8ACEDB1B34726323DEBAB2EE959899871EA950AB5DE686EAE9CCB31
            57BB51E1C271E495BEB4A920F1B9B79A481E70DB90A65C1AB6A96515C11A6C9C
            B7B62E6B22B731A35CA8511D7E05DF4A43016CC9623B5238A3B9C7C4141676E4
            361EB53676663E976E1B4326AC0AE5BD47A9E9F6B30AA46DACC27EB93128B7EA
            91DE215144B58EB9A52CF11EB16F004A00D941208CB7A332F4AC5C194D9FB4B8
            576DC57F653DB9569106C2B86B4EAA4BF362884A2FB6890B014FB4D39B252BE6
            0F3D8EDC864065D949F23D9F5AA93A35CBEEBA2354991A6579310C07504091C4
            541BE60AC1AD0D756A358E8C5B8F51D5AAE6594A80FDBDE1944A544B7E437222
            CAFA4DB8C54FA94F942D1D587BCD4EC77520EFC88352E98A83A8A17842A9E655
            E595D5AB52553D4E781D0EDE970A687969429B3D638F293C23756E36DCF2ECC4
            5B18FF00E8B28DB6DFF174EDF7FD3987A74744FD22D2F3661359397344A8660C
            FA22D97E322BF549CA532034B7F66E4B8A693B29093B8008E606C0918A5276AD
            93C01DFCFE6B161B7353A7B76D4A939A9D377BCF20973B34C0839B70D2442CD3
            59B9FD9AB43D64652E54E5B56AD3B78DFD49AC4F953AB54572A61A5424B6B484
            A10F347CE0A50EDF483E8D8ADD3D25D9856A69773B5BB8E05A8E66E6565D51EC
            880ED35A74D26B93A638CB70DD4B4B595A7F3A4ADBE33B701E637D87D1AFCCA9
            8D9D5D29BA72B765D62E6A13332DEB9D666D02AAED327B650D32A010FB442D20
            EDB280ED04838C1755FA698B9579D39079079254FA3B75893724CCD5ACBD73CB
            9531BA83F01003522A0F02A7DD2B79440FE73681C862AF73E5C41E31F01FAABA
            F2E2F5B56BD5A6E301D906B3AB98C0006C4021CECD32B3CAB7489660D1FA25F3
            0B3424336FB39B196D53996F55D9F0352A9EDCF8B554455FE4B8F8B84B2E2140
            7176AB7FB30D6D43EAA6EACB1D4269A6D9A67D1669B9AD539B16B9D7462B7381
            A8097D3D4AB88701E3277DC2B972C4239D36BE62DBF61EB77282E5A7D1275E37
            7D269B9A1121DB0890B85212A90CA672E3A1E1D6923A842940EE7882B6E5B61D
            F766A3AC9D66EB4747EC6595C306F076D15D4ABB5E4D3C977E838C6988692651
            DB66565CDD010A215BF2DB98DEDE95D113AE9F3D562A58A56205373C877DDB60
            EF24552D7E9CCB60BBB0AA4FA30F52B726ADB46F6FDF3760A68ADD4E6D463BC2
            0C72C31C2C4E79846C82A510781B4EFCF99DF1373BD2839913B22E98961767D3
            6EDBD3392A596D4DACD4222D34BA1C461D504C879A0E02EBA109D80E34A54A3B
            9D80D8F1DD0D9D201935949A3AB2F2F2E2CC1A1526F476B7518C292F173AFEB6
            4551E2C27920A7758711B73FF387673DB01CACCC8B2AC7D1E5628F9AD60C1BB7
            2AAEBCF6B8E937254E63AB4356A6F254599AAEAD0549F3F74718523838BEB73D
            8BA525AD8770D7E083147D5B0A0595C071A7EF19DCE867E2892379D786A782AB
            AD63AB1152BEECA9553B05D954B5C0996C5FD2EDF5B34FAAB2E13E1511E82DC9
            2B4BCDF9BC2B042799DF7F4617D1F5A94CFECF8A95D375DF775E57B560E5EDC9
            58B72B91A0D024C79B29505BE721A754F2908471292AD94927852A1DA71C5F46
            1D7E1D1F58F99B66E565F35FCC1C80A350604983266541CAAC2A2D5D6E90B851
            262F72B6FA90545214A09F341E63728FA1E6ACBCB6E8B5D4E40A4AD62E0BFB39
            EBB66525083B29D9151911E3900FAC345D3CBD58AE7D03A4F1E3C95C6F4B1B4E
            E33BA1BD248CC4839370047E213A03BC8D0EAA97E8B3D7DDFBAACBEEE7A46624
            1A2D35DA850E05EB69350232995B94598F49691D6F1295C4E24B4D6EA1B0F3F1
            6AE35A76F59799BA33D7C69AEA39809CBA8F40AB50DFCA38ABB4FC3523AA4321
            E86991E12362A2F36384A3B775EE3B31B2A0B2403C2719A813961DBC29CC02E2
            B3A83A95C125EC306779901C3E703B96BABF0893F7A4CB4FEBE95FB21C6A993D
            A31B59FC224FDE932D3FAFA57EC871AA64F68C7258C7F16EF0F92F9DFDA77FA8
            2AF733F942DE5F431FF17658BFE96A3FB7BF8A5AE9FDCD543FD59DFF0070E269
            E863FE2ECB17FD2D47F6F7F14B5D3FB9AA87FAB3BFEE1C75365FC353FCA3E4BE
            84D99FF825AFFE267F205D6751F507DD8B0BA0D0F0EBE211F55BD52FF06711EA
            3EA0FBB17F7E0FF64E48B87507745F2E2149A7DB34AFA31A5EFB0724CA5A5452
            3D7C2D34A247F3D38E3F0E6975CB00E6BE67D89A0FAB8F5B358261E0F80D4FC0
            2F87A6B75C957CCBCE7A8E54D0E7BD16D1B4D6966AADB2E148AB4ED82D49736F
            ACDB5B84841E456144EFB2768F325F236EDD445F4C5B565D0E657EB2F20BA186
            38521A6D3B02E2D6A210840240E25103720769031EED4655DFB8350B7F4E92A2
            B912EE4A938E28FA4996EE3611F83A96E4472366BD594D215350ED36121C23CE
            4B7C2FB8520FA8AB63FF005463335A6F2F32BCEF27C8292A146A6D36D31A374F
            203DCEF06B412009D06823E2A2CD42747CE6F696ED76EB97A5A2F53E8CE38964
            CE8D2D998C32B51D92970B4A5146E7902A0013CB7DCED8C534DFA8EBA74AF9AD
            02EFB4A7391A74458122395911EA6C6FBAA3BC9EC52143973E693B286C4637B5
            AEEB5E25DFA32CD28331A4BAC2AD79EEEC46FB2DB614E20FDE168491F6818EBD
            08595A52AF4900E2B88DA0B4AAD3489E6B26DAECEB367310A2EB0A8ED4660491
            2083CC01D9C1760BBD75996F5B3A287B3A5842A4519541455E2C72AF3DE75D48
            0D4727D0A2F292D93E83B9C68833AF3B2E6D43E65546ECBBAA6F556B552592A5
            A89EAE3A37F359693D88692392523D5B9DC924D9F985744B3D00166305C51439
            7508079F6B489D29C4A7EE0509FD5880A492233A41D8842883EAE58C98B5D3EA
            646F0CA0F895B9ED13682E2FBECB49C61A6931E4702E70DFE1C396BCD3D3227A
            37B39F5236435725A7663D2A85238BC1A64B9AC4244BE12412D07560AD3B8238
            80E1DC1E7CB0B0CD6CA5B9323EF99D6CDDB469942AE40D83F124A47104A86E95
            02094AD0A1CC292483EBC7621C86B722DA59216852E134866253E890E3328427
            842529610072C6B3FF000882DD8D1336F2D6AA86D225CDA44D8AEAC0E6B434FB
            4A403F71757B7DE7196F70A651B7E95A4C889521B51ECEAD70CC17EDF4AA38D4
            6E5CD3106480604488274D4E8BCFA0E35CD58A4E633593771D41E9D43AB32E3B
            6EA9F5F12A9D21B495AE325479F54E202D494F625483B6C17B618BD38FAEAACE
            57C3A6E54DA5507A9936BD08CFAF4D8CE143E888A5290DC64281DD1D694ACAC8
            D8F0240DF659C6BFF40F517697ADCCA67995942FF1AA0B7B8F4A56E04287E94A
            88FD386274C8D4DEA874895F48755BA62354F8ED0F42502132A03F5AD47F4E2C
            65ED41605B3C627B2256A5B6D4DEB3641F443CE6150530788616E689F023B8C2
            9CACBB2EAB9837453E8341A6CAAAD5EA8F08F0E1446F8DD7DC3D894A47E924F6
            000924004E1DF99FD16B9ED93F604BB9AB7623E8A453D93225AE24F8D31D8AD8
            1BA96B6DA5A97C291B92403B0049E437C343A0828D067EB7254D9BD5072936CC
            C7E329C200438B75868904FA7816B1F728E371F2A7D36A31971DD7E13CD3C92D
            ADB53892169236208DF9820ED8BB0EC2E9D7A26A3C99E0B63633D9FD9E2F863A
            F2E6A39AE2486C44088D4C833AF768BADA58F7CD632D6EEA7D7EDFA9CCA3D6A9
            6E87A24D8AE703AC287A41F483E949DC287220838DEA68FF005C70F3E3441E34
            6AEDB6C4BB7A0CBFC61659F350DC888D953A500F62569095A47A03807A31A28B
            D29CCD1EF3ACC38E3863C3A84961A1EA421E5A523F5018D8A7437D9F3F38F435
            A80B262BBC2ED68AE2440A56C943D229EA403F715251BE31E0F59ECAC698E20F
            985A7ECD314BBB5C4AA5952321ED769C3334120FC23B6541DA84D415C7A9FCD8
            AA5E7744B724D46A6E12D34544B5018DC96E3B40FD56D0081B0ED3BA8EE4938C
            EF4E7D1D19BBAA9B3D770D9F6D32FD0D2F29844D9B3DA86D485A4ECA0DF19E25
            F09E4481B0208DF704612D54A4CBA054E4C09F19E873A0BAB8F263BA92971875
            0A295A140F614A81047D98D9EF4377490D996A65352F28EF39B16D9A8525F793
            46A849586E1D45B79E53BD52DC3C9B792B5A80E2D92B1B6C78B9635ACA9D3AD5
            E2E1D13F3501B3165678A62A6963354B73C9990097C8D0920C4EBE3A2D7B6A13
            4D37B6962F945BD7CD11CA2D4DD6049636750F3329A248E36DC412950DC107D2
            0F2206295E855D5BD5F2775334CB024CD79DB46FD75717C116A2A6E1CFE02A69
            F6C7F9A5653D5AF6FADC492772918D8AEB57A38ACFD77D66DDA95C55CB8696BB
            7E33CCC6FA2D6C04BC87948592AEB1B5EFCD036DB61CCE16D933D07D9739239B
            56DDE34DBAAF79550B62A0D54A3B325D8A59756D9DC257C2C83C27D3B107126C
            C2EBD1B80FA3F841E7C38AEF6D7D9EE2D86636CBAC30CD26B8412E125BA66046
            93C476AD7374CA7F18F6637F4E0FEC11F09DD3CE99AF5D555ED22DDB128FF4DD
            622C35CF758F0A663F0B295A10A5713AA4A4F9CE206DBEFCFB30E2E994FE31EC
            C6FE9C1FD823E1A1F83DBFC35ABDFD9097FB544C5BD18A9745877125798D5C2A
            8E25B6556C6B921AFACF0637FE23BA41F925A7918B521EEF07FDF703FE76280E
            8BFE8D0CEAD3AEB5ED3BBAF0B3BE89B7E98D4E4C995F4A447FAB2E4475B4798D
            BAA51DD4A0390F4E36D18FC58DC7DF896A786526383813A777F45EE586FB21C1
            EC6EE9DE51A950BA9B838496C483227DC1A78AD44F4EC6BA2B174E6BBF939409
            EEC3B72DF6DA5D7C30E149AA4B5A438965C23B5A690A41E1EC2B51DC1E04E215
            C98C91BAF50D9830ED6B368B2EBD5D9A14A6E331C29E1427EB2D6B51094213B8
            DD4A200DC7A4818CB35DB567AB9AD3CD892F9DDC55DB5241E7BF24485A123F42
            5207E8C599F83A31E970B30734AA935D891E5314EA7C465C79C4A086D6EBEB58
            049EC25B6F7FE88C45906E2E72B8F13E4178CD463F69F6B8DBDE5421AE7B87E5
            6B64802741A0F3330A5CD40F45FE75699AC17AE8BA6D34228314812A5C09ECCD
            4C3048014EA50AE24A4920716DC2091B91BE1519339CD72E9FF32A99765A5547
            E8F5EA4B816CBED9E4B4EFE734E27B16D2872520F220E3B0EEA32A140BAF4FF7
            C5364CDA6498F3ADF9EC38D190DAB8D2A8CE0236DF1D6DD9254C364F694249FD
            58ADEDB36839B90EF593DA0ECADBECDDE50A986D474381224890E691B8803985
            D923499A8285AA5D3B5A77DC16931D170420EBF1C2B8BC1642496DE6B7F4F038
            95807D2003E9C31B111F403551DA8683D6CB8A25102E6A830D027B12432E91FE
            D38AC5B989FB7A85F49AE3C42FA6F66B107DF6156F7953F13D8D27BE35F8A306
            0C18CCA6D183060C11183060C11183060C11183060C11183060C11183060C111
            83060C11183060C11183060C11183060C11183060C117E11C431F1356CD3D8AC
            2EA08830D33DC4F0AA4A58487943D457B711FD78FBB0610A8403BD7A510196DC
            754969B4A9FE6E10800B9CB6E7EBE5EBC7ADAA2C461B69088D1D08615C6DA434
            901B3EB036E47ED18FA89DB1F81409ED182405E9FA358F0C123A96BAF09E00E7
            00E309F56FDBB617957CF3B1A2667C8B6E736FA2A889EC529C94F519E308CD79
            943CD4632BAB2D75AA6DC41092BE65694FD6206195BE278BBB4D972D5338AB77
            4C799396C3D7BD26AD1E94B98D9A74988D43871DE92B64A77EB9A521D711E7FD
            661A206E06F6BA782D4BC7546B5BD13675D74E1053E18F008EA4BCD888829DA2
            85809041E2D837BFA39F2E1F5FA31E2F44A63CD4C616DC2521C3FE54DA928D94
            55D9D60F4EE3F95DB890AC1D1E5E369DA74C6EAB6FC6BAD4C3AA6A75327D4223
            11A54B34E6E30A90EA5090901D4B8A2E12A9452E71EC163871CED7F49F7357EB
            339976DFA6ADB35475EA84F725347F19D97AE3855068B89FAC7C1A230EA3677B
            0AB811BA4938B731E4B59B7958B67A223B3E87D4774D1548B82DA66BEE5A90BC
            09A92D406AA1E04D3210CAA3BCB750852761C0AE2532E721B9D93B9E4463947E
            1D2E484ADC6A02FAA508E9529283C0ADF608E7D8773B70FF0076265A1E912BD4
            DBADA9DF41521A14BAAD3DDA638975A0A8119ABAAA139C4B5B7E6D3E02FB4381
            3B02096FD04631EB0F47B795AD44846B16FC5BB94D1547994D9B3A2478D32618
            5D426A63A94276017C7BBAB2A94A4B9C7B71A024B31E215A2EEBE80D2DFF000F
            82A96BB98D6FD0E88DD66A2E18CC353C539A5BF1561D0F2A5262009494F1F0A9
            D5240501C252A0ADF879E39C7598353E275698B23A82B6D4A504AFABF42D3B9E
            CFB47EBC4A972E962EF93594BABB6A9B5975FAE37360CB7A7B49FA052DDD8FD5
            1C793C5E7EEFC571A3B37BA8A99E05EDC8E3EAB3727AEACBCC80CEAFA72871A9
            06BD6EADE622415B058F084D35E6A425A431BAB84B89052A70A9D5A5682B515F
            12520E3C42AB6F2B6687D3D2278EF83BF48E03CD53D05BA753DA4AA3086C21D5
            F57BB7C084AD4091C3B8ED3BEE36FBF1C4DAF5CB6B30E00A8C04C296DC87E4B0
            16B8E12E38E47796C3DC94028F0B885277ECEC3D8462521A49BBAE5B5E9CF40A
            226DEA34B712A450A2C8824C074D3A03089C95BA85A1A3D64778F1B49EBD2149
            581C6B5A464B41D39DF14BCDFB46A4E512008B43AFBF505CE8F26307CC67EA15
            871D6DC52B7708E09915696DAE1490A7B8CA949423140E3C951B7B54B80E88C7
            FF0035DDCA77A76CDD445A14FCC672CC90ECD627225334B2A5D31F103C25E603
            ED45F08E0EA7AC534A49082AE7C4076903197C5552E931D6EB260C66B72952D0
            5084EE9241048D8723BF2F4613752D2CCBBBB33AFF00AF4FA8D56199F508F3AD
            F69B9FFE44D496E94C466E62D948DCBAD3C959485288DDB6D413BA5271856556
            922AADDD16A3B59B468F02DEA554E33F2690E3CC4A612E3144930DC9810374AD
            4EC875ADB71C643495AC255C93525D3B95FD3DC074164C9207609893BF86AA87
            A1576D8CD1A2D1EBD05EA4D6624A604FA74BE143BBB476FCAB648DC0E637236D
            8F6F3C7210EEE812AA72E221D505C22D071C5A1496945C242421C23856774904
            24920EC0F32311ED0F49D7EC5A05A34F6ED0A4D2BE80B6D54653911F8282E155
            22A311616B1F9429329E69C4A50528E070AD614E8213F5666E8F2EF72C9AAD16
            816DD1130A751A041610DBB152B83259A4CC643AD75A0A1BDA53C80B74254E70
            AD4A6C7179C281C62616365F57C998D233C77F2EEE7A2A66E9BF2D2B77372D6A
            0D4CC66EEAB95996AA371432B71D4464A56F00F7090DEC95820150E2E7B6FB1C
            6270B5599797BCBA79A63554B8DFA8C89D119F01B7A4CB50F029288D214AD9A3
            C0DA5D75002CEC9505712491CF18C6A8327EF6BDEAB6A5CB6AC18EE5C3695124
            BB09326621AE1A82E44021A52892365328960AB7237006FE70C61B6A696EE4CA
            ABDADE5C5A25CB3E8D4776B11DA550AE0669CF06DE954E5B0E3E14F37D636B44
            6754A46EA20F229F3B025D3A054AD71722A16B19A48D609D0E5E5C47BD3E0AA1
            ACC2A2A692A893D9A6F810495A987D0D96C800A89E02363B04A8F67A09C636AC
            F1B46839702B61F718A4224354E6986A03BD7B8FB8A425A61B8E9471A96BEB11
            C294A798583D9CF18167669EAA57EE77AAE48F4AA74BF0662DC6A1CA79680F47
            F05ADB926604717340315641DBEB851473DC8C7399F39266664F45A15A94A6CC
            7895A83527E0C69661CA92CB5250EBA962495254CBFC291C0E71A08E1090B46E
            149B892B69F52A8CE5ADDC34EDE5F2F92FB685A9ACB9B8E75128D06A6CC845C0
            D32B8894D3DE11817BAC2CB4EA8B7D5B2EACB2EF0B4E14AC96D436DF607F1AD4
            7E5D52AFA144666253560EAE2FF93D29E5212F0EBB660B886CA7AC73C1DFEAD1
            BF139D59E10774EEA5A064A66450A816053156FC275EB2DE454E23ED561BF050
            801F261CC6481E1125092D36DC809202D6B74AD241EB3DF174B375DBD9E56A4E
            8CC31221D23E8759AA09C111DB6E331293352FC427F2F25D5BEA2D3DC2A2D874
            ECB6F80872DCCEE4B545CDC900E4E2381FAF1DDFA3928DA81B3AE8A157EBACBF
            3511ECF614F54DC9946970DF84DF51D79F31F690E1DDA1C5B241DC11EB18FAF2
            C3386DBCDC972DCA5098D5469ACB2A931EA14D7A04D8ED3C14A6945B79095F56
            B09514A86E9250A1BEE92061B4ECA7B8E5690EE6A354588CABDAEDA4D4DF9E84
            BE92DAA7CC6DDD9BEB3B3811C6DB4957604369F40C7C797367DD132ECA857EAB
            6BCAA326AB41A65A6222EA519D9119A63C2DC7A62CB6B537C2172421284AD4B2
            125440DF61749D256C0AD5B33011BC49D0FD08D166B9699F766E70D7DE6A8534
            C89CDC44CA696EC17A319B114B284C88EB7109EBD82B0471B6549DF6F42924F9
            595993654E99494D11515A7AEC54C5442CC12C198622F81F2A3C239A55FCAEDF
            46F85B64765B5E766D66D19555B71A6BF106D166CE4259A9B2E1AB2972618765
            B7CC703286A225C097385C515A9213BA4157C796B94F7AD93725BC1FB710FC6C
            BF6AE05B0FB55163FE9E54E921C610D24905AF3372B2EF084A80038C1E2140E2
            AC65C56869737E0798FD33790E7AB82EEBCACDCBAAFDBD4EAB3F488153B9E708
            1498CA6D1D74D7F854E10DA40E23C29429455D89039918E32939E762DC716E68
            EC496DD8B406DD7EA3C74F7531DF6D2E38DBAB694A4044801D69C6D45B2BF3D1
            B7691BF8E79E5D4CBEEAF624B811633CE5BF73C6A94875C5252B663A1A7D2B29
            27993BAD1E68E67F4613792DA65BE6CBA947A24C54A16CB4FB4D545522B26633
            542D549D9A894CB249EA41690D30A400924BCA052A4B416AA9266005755AB59B
            572B592DEEEC1FAFC134693AA6CB7A35367314E98E36DD3A43519B870E8F202E
            6ADE71D69BF05690D6F2029C61F4F1321437657B9D93BE3EFAC6A0B2FE8D6B51
            AAC67332E0DC0D3750A588501C94ECE2E2DB4365B69B4159754A712027878F92
            B9798AD91B6FE42E64E5DD318F00A2A9E9F41A3C6B4E2CB8B3A1B929E64CE79E
            91528E97D496D2EA58284B697485071D59295251F94C82E5D3BD6A5D914E4D36
            D9930A974993468ADD01BABB71EA829B0DA75C21A9A87366A4F85BE165C4BC95
            2D2C1FCA02BC5B99D1B96BB6E6E4B7566B1D53F5F40894D485A93B16E8A95BB1
            98973268B93A8768F2451262E24A2EB4A75BE09059EA42B812B2415829E15056
            C411862046E37F5E12990193974DAB53B2D9B9853550ACCB3D9811845523AB35
            1756532084803F36C32CA039C29E2EB9D200E2230EDDB17B49892A42D9D51EDC
            D5041EE8FEBC56BA7F0893F7A4CB4FEBE95FB21C6A993DA31B7BFC204B0DEAEE
            962D8AEB4852D16F5C8D87C804F036FB0E35C5F771F00FFAC31A84C71D8C822E
            893D8BE68F6A34DCCC7EA17716B48F203E60ADE5F431FF0017658BFE96A3FB7B
            F8A5AE9FDCD543FD59DFF70E225E81ECFAA35DBA5772C533A3A2E1B46A1256A8
            4A580F3915F70BC87929ED524296B4123B0A46FB6E37A9F53B9B517283262B75
            158724D4E445721D229EC20B92AAD39C414B11986C79CE38B591C80E43894760
            091D359546FD958E074007C97BBECC5E513B3F6F583BDD6D3683DED6C11E0442
            EBC367DA553BF6E6A6D128B05FA955EAF21B890E2329E27243AB3B2503EF3E9F
            40DC9E431B8FE8EEC998192958A3DA10AAAC1A7D91E15167C86DCE14DD173BED
            A153CB637F3D982C252C03B0F3DC583CDB389BF49BA566F49D4EAB3B32B34DA7
            E6643A7F5975DCE5497A9D94D4D711F944217CD2F559F49E16DB4EE53C40EDC2
            3F2B5968AE81484E6A445BF4F9346994AB7386D5B65F054FDAB4475F4ED266EF
            F56A1517525D5EFBAC25AE12770B2A87C32D4D27073B79F87D7F6E71E6DB05B3
            E6C6BB6B571F7AF234EA80663BE46B1C406F0A9974CF9E5FBF75E9FDA1A8FED6
            EE3641F83A3FB91CD8FEB0A6FF00C17F1ADFCF2FDFBAF4FED0D47F6B771B20FC
            1D1FDC8E6C7F58537FE0BF8D2C2FF8D1E3F22B95D80FF5533BEA7F2B95BFAC5F
            E09599FF00D93AA7EC8EE3AEAB3F9947F447F863B156B17F825667FF0064EA9F
            B23B8EBAACFE651FD11FE18D9DA0FDE33B8A9DF6C9FC65B7E577CC2BAF307F88
            32C8FEDB2BF6A99884E4FF00EACEFF00415FE07179DED4D766F401DA4EB692A4
            43BC4BCE9FE4A4CD928DFF00DA5A7F5E20C92098CEEC373C0AD87AF91C475FEF
            A7F91AB89DAF1EFDA4FF00C8A5F22BB2AE55FEF676F7F5646FF828C6B3BF08A3
            F76F953FEA153FF8B1B1B25C8CAE47B9725AD1A8C4712EC59F458721A5A4EE14
            8530820FEA38D677E1115723C8CD6CB2A6A56932A2D26749711BF34A1C7DA4A0
            FE92D2FF00D938E93163FE4CF87CC2F73F688F6FF866A19DF93F99AA3ED0BFF0
            D2CA7FED653BFE3A70C4E984FE317CC4FE940FD823E301D04C176A3ADBCA6699
            415ACDD5017B01E84BA16A3FA12927F46189D31F4F760F48A5F8A753B264B74F
            7DB3FCA4184C807F5A4FEAC738D1FE48FE61F22BC32903FE17A87FEFB7FF005B
            94C0A752C8DD4B081D9B956D8F1F0F6FFF00A86FFED47FE38B43A0B3E8897AD2
            9B4FABC7852C546D99888CD49650EA54E21D8EE1D8281E7C0951E5CF6071B833
            9596C247EE7685FF0077B3DDC6C596126E29F481F1E0A77657D9EBF19B1178CB
            80CD488CB3BBB7305D6AFC2D9DFF003CCFFDA0C6D53F075DD43B9659A1C2B42C
            0ACC2DF8540FFEECAF5611F75F4D25DF44BAAAB0A3E59E503AC429AFC76D6AA4
            BA4AD087548492439B6E400797AF14DE8ABA43AE7CDED21E75DF8E5AB6550EA7
            97F155220B14B86E331A52D3114F0EB871EEAD8803911C8E32E1CCA14EE0383E
            489E1D9DEB7B61ED70BB4C65B5A95D17B981FA7465BA0699D64EE1E6B9CE91EE
            888A56AAAA52AF3B264C3B72FD713BCA6DE494C1AE148D81778412DBDB003AD0
            083B00A079286A6F3C34EF7AE9C6E95512F8B6AA56FCD24A5BF096B762581CB7
            69D4EEDBA9FE8A8FDBB62B61F84079C276FF00CDCCBCF8395FF3F1B08D285E71
            7A4074416FD7331ADDB72A49BA5A93E1B4E114AE18EAE4BCCA4A52E152927850
            0F1716E09DC118CEFA16B7AF3D01876FDDA296BCC2767F6AEE9E70979A75E0B8
            FBA729D409239C91A8EF20AD47E923A4B734748536346A555DCAF5AED101CA05
            59C53D1423D2195735B07D5C0787D6838DC668CF5B367EB672D4D72DA75C8B3E
            114B555A4C950F0AA63AA1B80ADB9290AD8F0383CD5007B08291A92E954D0F52
            B4519DD4D8F6DCB7DEB62EB8AECE811A439D63F4E536B097192B3CD680549285
            1F3B6241DCA788F17D1479C154CA3D75D8A29EF3898B744D140A8B0144224B0F
            820710F4F03810B1EA29FB4E3059DDD6B6AFF67AA644C7777289D98DA4C5302C
            5860B883B333306104CE59882D3CB50637470057CDD329FC63D98DFD381FB047
            C343F07B7F86B57BFB212FF6A8985B74D053DD81D2397F97125224229EF367D0
            A4982C0047E9047E8C653D04799949CBDD75B516AB29B88ABA2872A91056E282
            52B925C65E437B9F4AC34A091E956C3B48C67A640BCD7AC572960F6D3DBD26A1
            81D3BB7F6B880B77B80F663F03893E918FC52C6DDA31D2AFAD975C2D6AFF000C
            4CD6FED7D57F6B770B15AD08FAEA4277ECE2207F8E1B1AEBA53D45D6966C477C
            70BA9BB6A4B23EC5485AD27FD950C591F83B51A8B5BBF73469953874F9B25DA7
            D3E530DC9610E90843AFA1652140EDB171BDF6F58FB31CA36974B5CB262495F1
            658E06715DA2761A5FD197BDFAC4C4663BA4728DEB5BA1E681FCE31FEDA70784
            37FF00CD67FED07FE38ECAB99B6B5BF64E5CD7EB0C5BD6EA9EA55364CC6C3B01
            AEACA9B694B1C5B01CB74F3E7D98D41B3D399980A650A397393DC4A4827FE837
            7B48FF004D8CF5EC994633BF7F67F75D2ED27B3EB1C11D4DB885F119E622913B
            A27FDDDAAD0FC1F5752BD0C540A54950FC6D9DCD2771F998D8B9B1337452EA6E
            B3AB2D3248BAAB745B7A852935D9505B8F468AA8D196DB686885F0A94A3C44A9
            409DFF00CD18A671396800A2D0D32217D15B1F4E953C16D9945D99A1820C448E
            71AC23060C18D85D223060C18223060C18223060C18223060C18223060C18223
            060C18223060C18223060C18223060C18223060C18223060C18223060C1822F1
            77EA8FBC7F8E221CADCFDBAF2DE8B1AE3928BD25A65DBB5494A6EAF523558B5F
            942B11A332F46692F2D6C2584C81C4DFE478D0EA5213BA0AD37011BE382732BA
            DA7A9EC445DBF455C48CC3F15A65509B2DB6CBFB75CD84EDB0439B0E24F62B61
            BEF8B1CD2772D2BBB67D5735CC74113F18FE9F425246D2D545DB5F76619716DB
            A48B7E195CF66A0876348A93CA7AA4D35E0E80EAC34ADA025659595A8971C415
            20B7C4AC655AEABC287021489D41A754046B6E3D6AA9E050DE663F5B229B2E73
            6969F5BA404A3C1DB68A4A14B73AC5AC0470701A32364CDA109CA7AD9B5EDE69
            7498CE4384A4D3D906232E0505B6D9E1F352A0A50206C0F12B7ED3BFBD59576C
            AEAB0A71B7A8866D3619A7C47CC168B91A31494F528570EE96F8491C2396CA23
            6D89C532BB9AC3F65B981F79AFD7D76F8A995DD555F79757D5D14A90D40BAEA8
            2B1E10A1023BCA811E2B34CA2ADC651C4F7F92F1AE7A97D6B8B5A1246E527ACD
            93CF44D5DDE32EE834AF07B650BAD549DA7D2DF319FE181D5D79FA671C84F5A3
            ADDDB692B09496BF28AE0DF62141DB07212C7A5D3E3448D675AF1E2C39699EC3
            2DD2D84A199094A50979202760E04A1090A1CF64A46FB018FAEA39416A55E0C8
            8D2ADAA0C98F2DB71A7DA76034B43A871EF085A540A79853C4B877ED5F9DDBCF
            00D7735632CEE413F79A6B0A75B9B5875CB222DC5363B96F54E6437A34B5B319
            D933E2CC8E9A6D39D7D7197C68430C05CA1BBA790E246CDBAB59C79563533768
            CDE624FD2544810A7C3AC53A934D31E4BEBF0862BF129CDA9E610E0EBDF5252E
            9404969292E290A504A54E6281AB6475975E8E96675A56D4C6504292DBD4C656
            904329606C0A76E4CA52DFF41294F60031E333222C9A8CEA84991685B2FC9AB1
            DE6BCE53195392FCF439F94514EEAF3DB6D5CF7F39093DA01C32BB9A3AD2E893
            F79A70F39FEDF14B297A93B96BF93B94D5AA3336E53AA7988D97241A8A1D7A34
            409A54A9C78021C428EEB8E07351D92A51F3B61BADAEED675D598949EAA052A6
            502049149DE534DADB7A2BEF269331494C852C25D4ADB9AB67AB4B6140278CAB
            856529A26EED3A5A17B41B7204EA2539547B5E5BB32252C446BC014A71879829
            5B252525203EB50000D95B1FB0F2F33296D6A8569DA948B7284FD41F65B8EE4A
            5C1694F2DB6D495B682B29DCA52A42081BEC0A13EA1B32BB9AABED6E9E08CF1B
            BE427BB594B9C92D41D4B366B37C437BE8F30E91123D4297362467584486242A
            62504758A2A740F05DC3BC2D85951E147084A96A7D3A5E398F6FDA5644D0E54E
            345CC3A751E9F15EBB6AEAAD0FA40C1973254F4A50F95A1A75B69B425AEB51BA
            D615C08E1217515B995D6D59F326C8A4DBF46A648A905096E4484DB2B95C4B52
            CF19481C5BAD6B573DF9AD47D271E757CB6B7AE0B45AA04EA1522650986DB69A
            A7BF11B722B686C00DA52D91C202401B6C396DCB15CA79ABCDA55765739FA89F
            193FD3453548D50DFD9A14BA44CA3CAB7ED984BA859CA710613B3243E2A6EB2A
            90D15975090D70AB852427894956FBA4EC4F2B68EAFEEBBEAECA7D1E9A8B648A
            BD769F1A2D4570A5263AE04A813E6071B429C0B74810C043AAEA92E0709EAD20
            02A7E4DCADB6AA502445916FD15E8D2CC72FB4B84D943A6394960A86DB12D94A
            783F93C236DB6C7A28593768DAF5012E9B6C5BF4F941EF090EC6A7B4D2C3BF95
            FCA6E9483C5F977B9F6FE557FCA3BD035DCD5ADB4B90E07A4EFF008F9247E9FF
            0055356BB2BD97745522149A7DC1476C4B584C87A4429629ADCE297253ABD9C5
            942D3E604A9412B4AD4E052820AB33DF3A6F0A08CF3A045BA6BB12557AA0FBB6
            EC86A5A90ED159A7C34BD3D319439B60348695B0EC54851ED38B0E9B93768D1A
            B712A70ED8B7E2D46034DB11A5334F690F476DB429B4210B09DD294A16A4800E
            C12A23B3963D951CA5B5AAF2DD912EDBA1497DF12438E3B01A5AD6243696E402
            4A773D6A1084AFF9494241DC018A161222558FB1B87D3C86A6B3F0223FA9EF52
            ED42F5BA205AB9A170AA55D10037722E8ECD75CB954E448519DA9438CE066129
            65B614CB2E3A52E96FCD282ADFCEC356E4CC4392191398350B6EE17AEE9369D4
            1D6596EB2F3927E8D7488E4C371EDFAD7928EB78B894A52C759C0547836C30A3
            E43D9512E1AA559AB4ADC454AB6D38C54248A7B5D64E6DC0038974F0F9E14129
            0A0ADF7006F8FBE9B9616DD1ECD16EC4A051A3500023E8E6A1B688BB15711FC9
            81C3CD5E71E5CCF3EDC5C1A55F4ACAAB27DED60EBDBAEBC398DF3BB8A5C512BD
            75E79E54D5188F51834AAF522E1A8525C7E1B8F446A5A22497584AC6C56E35BE
            CDACA42940941493C2A38F8B3DA257E566859D028774D6D770B8622D14D86AEA
            21311DA96DAE7D426F09E15B6B60783A1A583E7B9E6007896DB76996451A8B55
            5CF8749A6C59AE8742DF663210E2BAD73AD737501B9E373CF57AD5CCF3C71B76
            64CDA57DDC906B35AB6A8754AB5302444992A136EBF18257D62421646E9017E7
            0D8F23CF02DD1677DB3DD4F2CEBA713F52A52CABD425D1051754D7EB970CF45C
            B4E8F328EF08EFD5832D49A94E6935231DA4ACC3EA994A10632525054CA093C4
            57B67345BAE7663E9874F2B76BD729FC68934866A931B9D2204FA8A7E8D90E2F
            AD7505B7775B8D254AD88E2DB7EC38A0AD9CBDA0D9736A3268F45A552A4561EF
            089EEC388DB0B9AEF3F3DC2900AD5BA94773BF3513E938F92E4CA1B56F0B4625
            02AB6E512A343A796CC58122136E468C5B1C2D94208E14F08DC0D80D81D86281
            879AD6658566B60BE748E3CC1FEDBBCD234660579CD33478E6E0A82FADBEFF00
            160D704A489A695F4F2A125EEB80FCE299096BAE1CF75716FC5CF1E9AC660D72
            DCD2FE6886ABF5252AD3B8A5D3A955376615CB115B931F70A789E25F54A71D64
            AD44AB66FCE513B92FB5E535ACBA69846DBA0986A8229663F8035D51880F108F
            C3C3B7540F3E0DB877F463F62655DB302931A0316F511A830A23F023C74C1683
            4CC77B84BCCA53C3B0439C29E24EDB2B846FBE194F3579B3AB1F8BFDB1C7EBB5
            62F94B734BABE70669C49139D9116975B871A1B4B738911526950DD5B681E8DD
            6B52C8F5A89F4E30ACC1CCFB872AB50B78CB7A7D4ABB478D67469D4CA14480B7
            0469266AD82B21A0B71DE251471A827743683B03B1DDB76DE52DAD66B109AA45
            B943A6374E75C7A2A62C1699119C713C0E2D1C291C2A5279288E647238E5850A
            10AD9A9089185454C08C6506C75C5A0A2A0DF176F0F11276DF6DC938BA0ACEEB
            7A8E6019A0824F1E33E713F051C53B3DEE8AAE9B92A8975D767D46953EB0AA95
            61C8EE4290A42EBABA7324A1C424B68434EC85A1253B23C151E941C7B6B5A80B
            82D9954AB6515CBA19A7D1B32DAA78A91892E72EA707E986232202E5842D2787
            AC7C385C5870A586D24A8AD4715B3360D0D88D5065147A6259AB25689CD88A8E
            09895ADC5AC3836D9614A75D51077DCB8B279A8EFE3072E6814BB5E2D1235129
            51E8D05485C682D454223B0A42FAC4A92D81C2921638810370AE7DBCF16E43CD
            69FECFAF000A9AC01C7878F1E3AA9FD753B92FCCC4B6EA148BA2E376A75EAA35
            568B4965F2D53A93446E710F499401E171326236869A6D4090EB8A5A36D9C5A3
            00B33342B7588709DADDDB79AE35C14181705469F4E98A727CCA8BB3E6B29A64
            32852551BAD294A086CA1294C2512503AE5E2ADAB645D995DAFD2EAB32D5B7E4
            D4A86D34C53E53901B53D09B695C4DA1B56DBA5285125207204F2C7AAB3A7CB1
            2E18D3999D66DAF29AA9CC4D465A5CA632A1264A42807D7E6F9CE00B5F9C79F9
            EAE7CCEE2C2AAFB0AA4C877C4FD73E7A24558771DE761E6D598CDEF5A7AB2E14
            D2ADA92D53AE50551EA6E535F7DD5C98296825C0B52492E15A4EC943896F878B
            6A9127700FAF18DD1726ED2B72B14EA8C0B66830EA1498A20C294CC0690FC48E
            0101A42C2789280090120EC028FACE325C5CD10B76D283A934B5C675EFF8AC3B
            50192947D45E4D5C364D792A552EE186A8AE291F5D857228751FCF42C2563ED4
            8C694F3B7A2CF32325F305CA0BD3ECB9C564AA23EFD7A3524CE6FD0E2112D6DE
            FF00684297C279138DEEE38FB92D2A55E54FF04ABD369F54884F1753323A1F6F
            7F5F0AC118D2BDC3E9DC4176842E676A7632CB1B0D7D690F6E808E5C8EFF000D
            345A31CB9D06C8A2DC511DBAB35AC7B4A525CE16E15B95355C970AC91D8CC6A7
            F11E23D9B9581CFD58AE6D1B359C934428B14DE566CDACB5D43752ACBDF4EE69
            5D0D9042D9A6C10568A5B2AD882EAF62904150411C62D9B9B4B545ACF0B54BAB
            5C366D3C91D742B62435486E47D8A5B2DA5D1F7A560FDB8E3A1E8CAC9A2D0665
            2A80D556D56EA449A9CCA44E5B354AB0DFB1F9CAE294A1F73A0F3EDC6952C385
            29C9F5F5D90B9AC3B632961E5E2DA3DDDE49333F5C5B90F3CC3450F66966C43C
            919B42B4205B112B97EC594645A59534778D4E3D126A8EE2AB5D90924CDA8711
            E3092A296CF9DC44FE58581A07D2FD6F4FD97B54ABDF15335DCCDBF66A6AF73D
            40AFAC1D6F0F0B5190A1CBAB651BA470809DCAB87CDDB19D644E95B2F34DF1E4
            B5655A749A139249F0994DB65C972F73B92EBEB2A757B9E7E728F3C30CA411B6
            37ADED0B5D9DE75E0380FEFE503705D560FB3CFA15BED574E05C346B47E16E91
            330333A34986868D1AD0175B9CF2FDFBAF4FED0D47F6B771B20FC1D1FDC8E6C7
            F58537FE0BF8C8EF4E855CA9BAAF0ABD564D6EFE448A9CF9131D4B7508C1095B
            8EA96A090639206EA3B6E4F2C501A09D145A9A33A6DCF1AD69D5F9ADDC0FC77A
            49AA4869E282D21694F070368D86CB3BEFBFA310B87DA3D9741E488D7E457956
            C5ECF5CDB6D136E6A39B965FB899D5AEEC59E6B17F825667FF0064EA9FB23B8E
            BAACFE651FD11FE18ECA39B36544CC8CB0B8ADD9EE486A0D7699269F216C2825
            D4B6EB4A428A4904056CA3B6E08DFD0710537D06D944001F4EE6172007FED18B
            FF00F3636319B67557B4B780533ED4704AF7D7341D44810D2359E63902B22D00
            641C4D4FF436A2C498EA6326BE2A6D3121437116426738E32EEDEA4B89413B7A
            0118D52E6BE545C391D98753B56EAA63F48AF521D2D488EE8DBEE7107B16DA87
            34AC7250231D803483A7DA2E98722297675BF22A72A974F7A43ADB93DD438F92
            EBCA715BA90840DB751DBCDECC7B7505A4CCBBD52D29A857DDAD4DAE88E0A634
            8582D4B880EFF9B79052E206FCF60AD8FA462FB8C2FA6A0C830E6803B0ADDC5F
            607F6B61368EA6F0DAD4E9B5B3AE522068788832418E274E5A5EC80E949CE6D3
            665EC7B56DDB8203F428208871EA74E44B30924EFC0DAC90A08DFB124903D000
            E5852675677DD3A89CC399755E3577EB55C9C12871F5A5284B684FD56D084809
            4213B9D9291B732799249DA8DF7D04B92D166B6B8750BFA0A1C24F54DD59A712
            9FB0171952BFBF0C0CA7E85DC86CAE9CCD45EB7EA775496B85C6D35E9EA94C25
            5CB9965210DABEE5248C468B0BAAB149CFD0769FE8B8466C963D7C5B86D6B905
            8DDC0B9E408E432F01B9491D069A2BAB5DB9B2D66F56A0BB16DBB79B75AA1ADE
            414FD2731C496D4EB60F6B6D214B1C5D856B006FC2AD98BD3B3A28AADE229B9B
            B6CC17679A442FA3AE18F1DB2B7511D0A5299941239A928E25A17B7624A15D89
            511B1FA653A3D269EC458AC331A3466D2D34D34808434848D825291C80039003
            90C7B9680E27650041F5E271B865316DF679ED9ED5EB54360AC99819C19CE99F
            78BA35CFD68EC888E5A4F15D6A72EF312B79517A532E5B6AA726915AA4BC2443
            991D438DA56C46E37DC28104820821409041071465E9D32B9FD7B5A1228EEDCF
            4BA7372D92C3D2A9D496A3CB5248D8F0B9CF8091E940047A08C6CB33ABA21B22
            F3D2B126A726D77ADCA948595BD22DF94A801D51ED51686ED6E7D7C1B9C28ADD
            E823C9A975F71A7AAF984EB2827641AA4748E5F6A6383FDF88436175409631F0
            3BCAF29A9B258FE12F75A5ADD06B5DD573DB3DA401BE3BFBD6A421427AA73588
            D1997A4C992E2596596905C75E5A8EC94252372A513C801B9271BB4E8EBD083B
            937A0FAA59976B26256B31199522B8C8014B84992C750860F3D8A9B68277FE79
            50F46193A73E8F2CA2D2C559B9D695A311BACA1040AACE717367241E4781C709
            EAF7F4F004EF8770000E5CB12786E17D09352A192577DB0FECF8616E75E5EBC3
            DEE040026003BF53049234DC204EF95D6FB3DF226E2D36669D56CDBA21B912AB
            4870A388A486E635B9E090D1FF0039B5800823D641D88230C8D35F49266DE942
            CD55BB6957A17D025E5BEDC1A8C044B6E32D677596C9D9490A3CCA78B87724ED
            B93BEEE33F74BD606A6E82CD36F9B5E997030C93D438F20A244527B4B4F20871
            1BFA785401F4EF894F303A09724D9587E14CBEE9C9717F9A66AEDB8848F50EB5
            95ABF5938D0AD85D6A0FCF41F03C415C6629B038960F726EB0BB80D699832E6B
            80E460107F5E4B577A8BD4F5EDAAFBE5BB86F9AC1AB5423B022C64B6C2186223
            5BEFC0DB6800241277279927B49D86290E854D25D5F38F5394CBF644375BB46C
            275728CB5A4A5B973F80A5A61B3FE729057D62F6FAA129079A862D9CB4E840C8
            6B45D627CDA6DC77329202BA8AB5594A609FB50C86C287D87718AD6CFB3E9361
            DB50E9144A640A452A0361B8D0E1B09658613DBB25090001F763359616F75415
            EB3A7F5529B2BECFAEAB5F3715C52B07C1CD00925CE1BB31206834E73BB45ADF
            E9EBD0F55AF2FA33382D880F543E898429B71C78ED95BADC74294A665F08E652
            8E35A1647D54F02BB0288D54B0FAE2BC875A5A90B4282D0B42B62920EE0823B0
            83CC118ED10B40712428020FA0E25CCEEE879C87CF7AC48AA49B55EB6EA72165
            6F48B7E52A007547B545A00B3B9F4908DCE372F70F2E71A8C2A9ED03D97BAFAE
            9F8B61F5031CED5CD74C4F30403A9E2237EB2B4F70BA4333D29F0DA61ACDBBFD
            2D3280840357714400360373B93FA4E294E898D6666C66F6BC6CDA05D198976D
            7A893599E64419D3D4EB0F14437569E249EDD94011F68C3E267410E4F372DD4A
            6BB98A94A56401F4944E43E1B0C6D227450E5CE9873FE8B7ADBF56BCE5556948
            90865B9F363B91D41D656DAB8928610A3E6A8EDB2873DBB71AF42856151A4BB4
            91C4AE3F67308C769E2B6C6B5D17303DB233BCC8044882214AFD3B5A1FABD9B9
            BEFE7050E0BB2ED9B950D22B8A6504FD1735090D875C03EAB6EA128F3BB02D2A
            048E24EF1064767BDD9A6DCC58975D97587E895C86953697DB4A5C4B8DAB6E26
            DC42814AD0AD86E95023903C88047655A9532355E9CFC4971D995164B6A69E65
            E4071B750A1B14A92791047220F23893336FA13B20B34A73F5266DEA9DA725DE
            25AD340A82A2B0A3CCF265616DA7EE4A40C67BBC3DD9CD5A461757B69ECCEB9B
            E763384D614C9398824821DCDA403BCEBC20F1E0B58D9DBD2E99E79F797B3AD7
            AC5CB02151EA8C98F39BA5D35B88E4C688D94DA9C1BA82543910929DC6E0F224
            627AB36CDAB6615D74FA1D0E9D2EAD58AABC98F0E1456CB8F4970F625291FE3D
            806E4EC06F8DBC585D02992936738A9753CC19886B63D5AEAAC212AE7D84A184
            9FEFC54DA6FD0F656693C386C6B429D4A9CEB61B7AA2E15499EF27D292FB854B
            093E948213F663036C6AD677DE3BF55CDE1FECFB19C7EE1B5B13BB0E6B77925C
            E747200803E3E6BE2E8FCD31AF48BA51B56CB96B65CABC56572EAAE347742E63
            CB2E3A01F4A5254100FA4201C366AD7453682E2113A7C286A701290FBE86CA80
            F48E2237C7DFD98C073834C39719F750852EF8B0ED1BBE5539B5B315DAC52999
            8B8C8510A52505C49290480481DA40C4E86E4686B382FA3EDED1B696ACB6B502
            1803402780D37EBC164BE31A81EDBA3FC6B5DEC1E31A81EDBA3FC6B5DEC2A7C9
            CBA7FF0072995BF2CC4EE60F272E9FFDCA656FCB313B98B65FC8266BBEAB7CCF
            A535BC63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E
            5989DCC1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD
            1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974F
            FEE532B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503
            DB747F8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097
            F2099AEFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E
            5D3FFB94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA5
            35BC63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E59
            89DCC1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1F
            E35AEF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFE
            E532B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB
            747F8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2
            099AEFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D
            3FFB94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535
            BC63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989
            DCC1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE3
            5AEF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE5
            32B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB74
            7F8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F209
            9AEFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3F
            FB94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC
            63503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DC
            C1E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35A
            EF60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532
            B7E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F
            8D6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099A
            EFAADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FFB
            94CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC63
            503DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DCC1
            E4E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35AEF
            60F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532B7
            E5989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F8D
            6BBD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099AEF
            AADF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FFB94
            CADF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC6350
            3DB747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DCC1E4
            E5D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35AEF60
            F18D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532B7E5
            989DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F8D6B
            BD854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099AEFAA
            DF33E94D6F18D40F6DD1FE35AEF60F18D40F6DD1FE35AEF6153E4E5D3FFB94CA
            DF96627730793974FF00EE532B7E5989DCC25FC8266BBEAB7CCFA535BC63503D
            B747F8D6BBD83C63503DB747F8D6BBD854F93974FF00EE532B7E5989DCC1E4E5
            D3FF00B94CADF9662773097F2099AEFAADF33E94D6F18D40F6DD1FE35AEF60F1
            8D40F6DD1FE35AEF6153E4E5D3FF00B94CADF96627730793974FFEE532B7E598
            9DCC25FC8266BBEAB7CCFA535BC63503DB747F8D6BBD83C63503DB747F8D6BBD
            854F93974FFEE532B7E5989DCC1E4E5D3FFB94CADF9662773097F2099AEFAADF
            33E94D98D7E5126C86D966AF4B75D7541284225B6A52C9EC00056E4E395E21EB
            C282D5D0764958F7353EB346CA4CB9A555E952112A14D896FC565F88F20EE971
            0B4A014A81E608E630DD27638B9B98EF59E93AAC7DE803B8CFCC05FFD9}
          mmHeight = 15875
          mmLeft = 0
          mmTop = 0
          mmWidth = 193146
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        Background.Brush.Style = bsClear
        PrintHeight = phDynamic
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object SRObs2: TppSubReport
          DesignLayer = ppDesignLayer6
          UserName = 'SRObs2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SRObs
          TraverseAllData = False
          DataPipelineName = 'ppDBPipeline5'
          mmHeight = 4064
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppChildReport6: TppChildReport
            AutoStop = False
            DataPipeline = ppDBPipeline5
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.SaveDeviceSettings = False
            PrinterSetup.mmMarginBottom = 5080
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Left = 224
            Top = 128
            Version = '16.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppDBPipeline5'
            object TBObs2: TppTitleBand
              AfterGenerate = TBObs2AfterGenerate
              Background.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3048
              mmPrintPosition = 0
              object ppLine37: TppLine
                DesignLayer = ppDesignLayer1
                UserName = 'Line37'
                Position = lpLeft
                ReprintOnOverFlow = True
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 0
                mmTop = 0
                mmWidth = 2117
                BandType = 1
                LayerName = Foreground
              end
              object LCabObs2: TppLabel
                DesignLayer = ppDesignLayer1
                UserName = 'LCabObs2'
                HyperlinkEnabled = False
                ReprintOnOverFlow = True
                AutoSize = False
                Caption = 'Obs:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = [fsBold]
                FormField = False
                Transparent = True
                mmHeight = 2646
                mmLeft = 794
                mmTop = 265
                mmWidth = 7408
                BandType = 1
                LayerName = Foreground
              end
              object ppLine39: TppLine
                DesignLayer = ppDesignLayer1
                UserName = 'Line39'
                Position = lpRight
                ReprintOnOverFlow = True
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 1
                LayerName = Foreground
              end
            end
            object DBObs2: TppDetailBand
              BeforePrint = DBObs2BeforePrint
              Background1.Brush.Style = bsClear
              Background2.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 2540
              mmPrintPosition = 0
              object ppShape51: TppShape
                DesignLayer = ppDesignLayer1
                UserName = 'Shape51'
                ParentHeight = True
                Pen.Style = psClear
                mmHeight = 2540
                mmLeft = 0
                mmTop = 0
                mmWidth = 195580
                BandType = 4
                LayerName = Foreground
              end
              object ppDBText3: TppDBText
                DesignLayer = ppDesignLayer1
                UserName = 'DBText1'
                HyperlinkEnabled = False
                DataField = 'obs_codigo'
                DataPipeline = ppDBPipeline5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline5'
                mmHeight = 2117
                mmLeft = 1058
                mmTop = 0
                mmWidth = 9525
                BandType = 4
                LayerName = Foreground
              end
              object ppDBText4: TppDBText
                DesignLayer = ppDesignLayer1
                UserName = 'DBText4'
                HyperlinkEnabled = False
                DataField = 'obs_observ'
                DataPipeline = ppDBPipeline5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline5'
                mmHeight = 2117
                mmLeft = 11113
                mmTop = 0
                mmWidth = 165100
                BandType = 4
                LayerName = Foreground
              end
              object ppLine52: TppLine
                DesignLayer = ppDesignLayer1
                UserName = 'Line502'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 2540
                mmLeft = 0
                mmTop = 0
                mmWidth = 2117
                BandType = 4
                LayerName = Foreground
              end
              object ppLine53: TppLine
                DesignLayer = ppDesignLayer1
                UserName = 'Line53'
                ParentHeight = True
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 2540
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 4
                LayerName = Foreground
              end
            end
            object ppSummaryBand6: TppSummaryBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 265
              mmPrintPosition = 0
              object ppLine2: TppLine
                DesignLayer = ppDesignLayer1
                UserName = 'Line2'
                Weight = 0.750000000000000000
                mmHeight = 254
                mmLeft = 0
                mmTop = 0
                mmWidth = 195580
                BandType = 7
                LayerName = Foreground
              end
            end
            object ppDesignLayers1: TppDesignLayers
              object ppDesignLayer1: TppDesignLayer
                UserName = 'Foreground'
                LayerType = ltBanded
                Index = 0
              end
            end
          end
        end
        object SRObs: TppSubReport
          DesignLayer = ppDesignLayer6
          UserName = 'SRObs'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SRCH
          TraverseAllData = False
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 4064
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppDBPipeline2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.SaveDeviceSettings = False
            PrinterSetup.mmMarginBottom = 5080
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Left = 200
            Top = 104
            Version = '16.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppDBPipeline2'
            object TBObs: TppTitleBand
              AfterGenerate = TBObsAfterGenerate
              Background.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3048
              mmPrintPosition = 0
              object ppLine36: TppLine
                DesignLayer = ppDesignLayer2
                UserName = 'Line36'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 0
                mmTop = 0
                mmWidth = 2117
                BandType = 1
                LayerName = Foreground1
              end
              object ppLine38: TppLine
                DesignLayer = ppDesignLayer2
                UserName = 'Line38'
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 1
                LayerName = Foreground1
              end
              object LCabObs1: TppLabel
                DesignLayer = ppDesignLayer2
                UserName = 'LCodObs1'
                HyperlinkEnabled = False
                AutoSize = False
                Caption = 'Obs:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = [fsBold]
                FormField = False
                Transparent = True
                mmHeight = 2646
                mmLeft = 794
                mmTop = 265
                mmWidth = 7408
                BandType = 1
                LayerName = Foreground1
              end
            end
            object DBObs: TppDetailBand
              AfterPrint = DBObsAfterPrint
              BeforePrint = DBObsBeforePrint
              Background1.Brush.Style = bsClear
              Background2.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4572
              mmPrintPosition = 0
              object SObs: TppShape
                DesignLayer = ppDesignLayer2
                UserName = 'SObs'
                Pen.Style = psClear
                mmHeight = 4572
                mmLeft = 0
                mmTop = 0
                mmWidth = 195580
                BandType = 4
                LayerName = Foreground1
              end
              object LNomObs1: TppLabel
                DesignLayer = ppDesignLayer2
                UserName = 'LNomObs1'
                HyperlinkEnabled = False
                AutoSize = False
                Caption = 'LNomObs1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                FormField = False
                Transparent = True
                mmHeight = 2646
                mmLeft = 11113
                mmTop = 0
                mmWidth = 171450
                BandType = 4
                LayerName = Foreground1
              end
              object LNomObs2: TppLabel
                DesignLayer = ppDesignLayer2
                UserName = 'LNomObs2'
                HyperlinkEnabled = False
                AutoSize = False
                Caption = 'LNomObs2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                FormField = False
                Transparent = True
                mmHeight = 2381
                mmLeft = 11113
                mmTop = 2117
                mmWidth = 171450
                BandType = 4
                LayerName = Foreground1
              end
              object LCodObs: TppLabel
                DesignLayer = ppDesignLayer2
                UserName = 'LCodObs'
                HyperlinkEnabled = False
                AutoSize = False
                Caption = 'LCodObs'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                FormField = False
                Transparent = True
                mmHeight = 2646
                mmLeft = 1058
                mmTop = 0
                mmWidth = 9525
                BandType = 4
                LayerName = Foreground1
              end
              object LnObs1: TppLine
                DesignLayer = ppDesignLayer2
                UserName = 'LnObs1'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 4572
                mmLeft = 0
                mmTop = 0
                mmWidth = 2117
                BandType = 4
                LayerName = Foreground1
              end
              object LnObs2: TppLine
                DesignLayer = ppDesignLayer2
                UserName = 'Line501'
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 4572
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 4
                LayerName = Foreground1
              end
            end
            object ppSummaryBand1: TppSummaryBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 265
              mmPrintPosition = 0
              object ppLine3: TppLine
                DesignLayer = ppDesignLayer2
                UserName = 'Line3'
                Weight = 0.750000000000000000
                mmHeight = 254
                mmLeft = 0
                mmTop = 0
                mmWidth = 195580
                BandType = 7
                LayerName = Foreground1
              end
            end
            object ppDesignLayers2: TppDesignLayers
              object ppDesignLayer2: TppDesignLayer
                UserName = 'Foreground1'
                LayerType = ltBanded
                Index = 0
              end
            end
          end
        end
        object SRCH: TppSubReport
          DesignLayer = ppDesignLayer6
          UserName = 'SRCH'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDBPipeline8'
          mmHeight = 4064
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppChildReport7: TppChildReport
            AutoStop = False
            DataPipeline = ppDBPipeline8
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.SaveDeviceSettings = False
            PrinterSetup.mmMarginBottom = 5080
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Left = 288
            Top = 192
            Version = '16.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppDBPipeline8'
            object ppDetailBand1: TppDetailBand
              BeforePrint = ppDetailBand1BeforePrint
              Background1.Brush.Style = bsClear
              Background2.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape14: TppShape
                DesignLayer = ppDesignLayer3
                UserName = 'Shape14'
                ParentHeight = True
                mmHeight = 4498
                mmLeft = 127
                mmTop = 0
                mmWidth = 195398
                BandType = 4
                LayerName = Foreground2
              end
              object LCH: TppLabel
                Tag = 100
                DesignLayer = ppDesignLayer3
                UserName = 'LCH'
                HyperlinkEnabled = False
                Caption = 'LCH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                FormField = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 1852
                mmTop = 529
                mmWidth = 5821
                BandType = 4
                LayerName = Foreground2
              end
              object LTotEst: TppLabel
                DesignLayer = ppDesignLayer3
                UserName = 'LTotEst'
                HyperlinkEnabled = False
                Caption = 'Total da Carga Hor'#225'ria de Est'#225'gio : '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                FormField = False
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 133350
                mmTop = 529
                mmWidth = 50007
                BandType = 4
                LayerName = Foreground2
              end
            end
            object ppSummaryBand7: TppSummaryBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDesignLayers3: TppDesignLayers
              object ppDesignLayer3: TppDesignLayer
                UserName = 'Foreground2'
                LayerType = ltBanded
                Index = 0
              end
            end
          end
        end
        object SRObsCompl: TppSubReport
          DesignLayer = ppDesignLayer6
          UserName = 'SRObsCompl'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SRObs2
          TraverseAllData = False
          DataPipelineName = 'ppDBPipeline9'
          mmHeight = 4064
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppChildReport8: TppChildReport
            AutoStop = False
            DataPipeline = ppDBPipeline9
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.SaveDeviceSettings = False
            PrinterSetup.mmMarginBottom = 5080
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Left = 240
            Top = 144
            Version = '16.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppDBPipeline9'
            object TBObsCompl: TppTitleBand
              AfterGenerate = TBObsComplAfterGenerate
              Background.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3048
              mmPrintPosition = 0
              object ppLine40: TppLine
                DesignLayer = ppDesignLayer4
                UserName = 'Line40'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 0
                mmTop = 0
                mmWidth = 2117
                BandType = 1
                LayerName = Foreground3
              end
              object LCabObs3: TppLabel
                Tag = 100
                DesignLayer = ppDesignLayer4
                UserName = 'LCabObs3'
                HyperlinkEnabled = False
                ReprintOnOverFlow = True
                AutoSize = False
                Caption = 'Obs:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = [fsBold]
                FormField = False
                Transparent = True
                mmHeight = 2646
                mmLeft = 794
                mmTop = 265
                mmWidth = 7408
                BandType = 1
                LayerName = Foreground3
              end
              object ppLine41: TppLine
                DesignLayer = ppDesignLayer4
                UserName = 'Line41'
                Position = lpRight
                ReprintOnOverFlow = True
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 1
                LayerName = Foreground3
              end
            end
            object DBObsCompl: TppDetailBand
              BeforePrint = DBObsComplBeforePrint
              Background1.Brush.Style = bsClear
              Background2.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4572
              mmPrintPosition = 0
              object ppDBText7: TppDBText
                DesignLayer = ppDesignLayer4
                UserName = 'DBText7'
                HyperlinkEnabled = False
                DataPipeline = ppDBPipeline9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline9'
                mmHeight = 2646
                mmLeft = 18255
                mmTop = 0
                mmWidth = 165100
                BandType = 4
                LayerName = Foreground3
              end
              object ppDBText6: TppDBText
                DesignLayer = ppDesignLayer4
                UserName = 'DBText6'
                HyperlinkEnabled = False
                DataPipeline = ppDBPipeline9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline9'
                mmHeight = 2646
                mmLeft = 10053
                mmTop = 0
                mmWidth = 7409
                BandType = 4
                LayerName = Foreground3
              end
              object SObsCompl: TppShape
                DesignLayer = ppDesignLayer4
                UserName = 'SObsCompl'
                Pen.Style = psClear
                mmHeight = 4572
                mmLeft = 0
                mmTop = 0
                mmWidth = 195580
                BandType = 4
                LayerName = Foreground3
              end
              object LnObs4: TppLine
                DesignLayer = ppDesignLayer4
                UserName = 'LnObs4'
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 4572
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 4
                LayerName = Foreground3
              end
              object LnObs3: TppLine
                DesignLayer = ppDesignLayer4
                UserName = 'Line503'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 4572
                mmLeft = 0
                mmTop = 0
                mmWidth = 2117
                BandType = 4
                LayerName = Foreground3
              end
              object LObsCompl: TppLabel
                Tag = 100
                DesignLayer = ppDesignLayer4
                UserName = 'LObsCompl'
                HyperlinkEnabled = False
                AutoSize = False
                Caption = 'LObsCompl'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                FormField = False
                Transparent = True
                mmHeight = 2646
                mmLeft = 1058
                mmTop = 0
                mmWidth = 9525
                BandType = 4
                LayerName = Foreground3
              end
              object LNomObs3: TppLabel
                Tag = 100
                DesignLayer = ppDesignLayer4
                UserName = 'LNomObs3'
                HyperlinkEnabled = False
                AutoSize = False
                Caption = 'LNomObs3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                FormField = False
                Transparent = True
                mmHeight = 2646
                mmLeft = 11113
                mmTop = 0
                mmWidth = 171450
                BandType = 4
                LayerName = Foreground3
              end
              object LNomObs4: TppLabel
                Tag = 100
                DesignLayer = ppDesignLayer4
                UserName = 'LNomObs4'
                HyperlinkEnabled = False
                AutoSize = False
                Caption = 'LNomObs4'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                FormField = False
                Transparent = True
                mmHeight = 2381
                mmLeft = 11113
                mmTop = 2117
                mmWidth = 171450
                BandType = 4
                LayerName = Foreground3
              end
            end
            object ppSummaryBand8: TppSummaryBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 265
              mmPrintPosition = 0
              object ppLine58: TppLine
                DesignLayer = ppDesignLayer4
                UserName = 'Line58'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 0
                mmTop = 0
                mmWidth = 195580
                BandType = 7
                LayerName = Foreground3
              end
            end
            object ppDesignLayers4: TppDesignLayers
              object ppDesignLayer4: TppDesignLayer
                UserName = 'Foreground3'
                LayerType = ltBanded
                Index = 0
              end
            end
          end
        end
        object LFinal: TppLine
          DesignLayer = ppDesignLayer6
          UserName = 'LFinal'
          Weight = 0.750000000000000000
          mmHeight = 2910
          mmLeft = 0
          mmTop = 0
          mmWidth = 195398
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object DBCTotAulas: TppDBCalc
          DesignLayer = ppDesignLayer6
          UserName = 'DBCTotAulas'
          HyperlinkEnabled = False
          DataField = 'ch'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          Visible = False
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3302
          mmLeft = 147638
          mmTop = 529
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object DBCTotAulas2: TppDBCalc
          DesignLayer = ppDesignLayer6
          UserName = 'DBCTotAulas1'
          HyperlinkEnabled = False
          DataField = 'ch2'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          Visible = False
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3302
          mmLeft = 164307
          mmTop = 529
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object DBCTotHoras: TppDBCalc
          DesignLayer = ppDesignLayer6
          UserName = 'DBCTotAulas2'
          HyperlinkEnabled = False
          DataField = 'horas'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          Visible = False
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 180975
          mmTop = 529
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppRegion1: TppRegion
          DesignLayer = ppDesignLayer6
          UserName = 'Region1'
          Caption = 'Region1'
          ShiftRelativeTo = SRProf
          Stretch = True
          mmHeight = 10848
          mmLeft = 127
          mmTop = 4498
          mmWidth = 195527
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppRichView1: TppRichView
            DesignLayer = ppDesignLayer6
            UserName = 'RichView1'
            Caption = 'RichView1'
            ShiftWithParent = False
            Stretch = True
            mmHeight = 8202
            mmLeft = 1588
            mmTop = 5821
            mmWidth = 192617
            BandType = 5
            GroupNo = 0
            LayerName = Foreground5
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
          end
        end
        object SRProf: TppSubReport
          DesignLayer = ppDesignLayer6
          UserName = 'SRProf'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SRObsCompl
          TraverseAllData = False
          DataPipelineName = 'ppDBPipeline3'
          mmHeight = 4064
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground5
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppDBPipeline3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.SaveDeviceSettings = False
            PrinterSetup.mmMarginBottom = 5080
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Left = 224
            Top = 128
            Version = '16.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppDBPipeline3'
            object ppTitleBand1: TppTitleBand
              Background.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3048
              mmPrintPosition = 0
              object ppLine18: TppLine
                DesignLayer = ppDesignLayer5
                UserName = 'Line37'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 0
                mmTop = 0
                mmWidth = 2117
                BandType = 1
                LayerName = Foreground4
              end
              object LCabProf: TppLabel
                DesignLayer = ppDesignLayer5
                UserName = 'LCabObs2'
                HyperlinkEnabled = False
                Caption = 'Professores : '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = [fsBold]
                FormField = False
                Transparent = True
                mmHeight = 2582
                mmLeft = 794
                mmTop = 265
                mmWidth = 14182
                BandType = 1
                LayerName = Foreground4
              end
              object ppLine19: TppLine
                DesignLayer = ppDesignLayer5
                UserName = 'Line39'
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 3048
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 1
                LayerName = Foreground4
              end
            end
            object ppDetailBand2: TppDetailBand
              Background1.Brush.Style = bsClear
              Background2.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 2540
              mmPrintPosition = 0
              object ppDBText2: TppDBText
                DesignLayer = ppDesignLayer5
                UserName = 'DBText1'
                HyperlinkEnabled = False
                DataField = 'dis_codigo'
                DataPipeline = ppDBPipeline3
                DisplayFormat = '0000000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline3'
                mmHeight = 2117
                mmLeft = 1323
                mmTop = 265
                mmWidth = 9525
                BandType = 4
                LayerName = Foreground4
              end
              object ppDBText9: TppDBText
                DesignLayer = ppDesignLayer5
                UserName = 'DBText4'
                HyperlinkEnabled = False
                DataField = 'dis_nomdisc'
                DataPipeline = ppDBPipeline3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline3'
                mmHeight = 2117
                mmLeft = 11377
                mmTop = 265
                mmWidth = 86025
                BandType = 4
                LayerName = Foreground4
              end
              object ppLine20: TppLine
                DesignLayer = ppDesignLayer5
                UserName = 'Line1'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 2540
                mmLeft = 0
                mmTop = 0
                mmWidth = 2910
                BandType = 4
                LayerName = Foreground4
              end
              object ppLine21: TppLine
                DesignLayer = ppDesignLayer5
                UserName = 'Line53'
                ParentHeight = True
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 2540
                mmLeft = 191135
                mmTop = 0
                mmWidth = 4498
                BandType = 4
                LayerName = Foreground4
              end
              object ppDBText12: TppDBText
                DesignLayer = ppDesignLayer5
                UserName = 'DBText12'
                HyperlinkEnabled = False
                DataField = 'pes_nome'
                DataPipeline = ppDBPipeline3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline3'
                mmHeight = 2117
                mmLeft = 106663
                mmTop = 265
                mmWidth = 56625
                BandType = 4
                LayerName = Foreground4
              end
              object ppDBText13: TppDBText
                DesignLayer = ppDesignLayer5
                UserName = 'DBText13'
                HyperlinkEnabled = False
                DataField = 'periodo'
                DataPipeline = ppDBPipeline3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline3'
                mmHeight = 2117
                mmLeft = 98196
                mmTop = 265
                mmWidth = 7673
                BandType = 4
                LayerName = Foreground4
              end
              object ppDBText14: TppDBText
                DesignLayer = ppDesignLayer5
                UserName = 'DBText14'
                HyperlinkEnabled = False
                DataField = 'tit_descricao'
                DataPipeline = ppDBPipeline3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipeline3'
                mmHeight = 2117
                mmLeft = 164082
                mmTop = 265
                mmWidth = 26430
                BandType = 4
                LayerName = Foreground4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 265
              mmPrintPosition = 0
              object ppLine22: TppLine
                DesignLayer = ppDesignLayer5
                UserName = 'Line2'
                Weight = 0.750000000000000000
                mmHeight = 254
                mmLeft = 0
                mmTop = 0
                mmWidth = 195580
                BandType = 7
                LayerName = Foreground4
              end
            end
            object ppDesignLayers5: TppDesignLayers
              object ppDesignLayer5: TppDesignLayer
                UserName = 'Foreground4'
                LayerType = ltBanded
                Index = 0
              end
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'cer_seq'
      DataPipeline = ppDBPipeline1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      NewFile = False
      object GHBMod: TppGroupHeaderBand
        AfterPrint = GHBModAfterPrint
        BeforePrint = GHBModBeforePrint
        Background.Brush.Style = bsClear
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3970
        mmPrintPosition = 0
        object ppShape29: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape29'
          Brush.Color = 16119285
          ParentHeight = True
          StretchWithParent = True
          mmHeight = 3970
          mmLeft = 127
          mmTop = 0
          mmWidth = 195527
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object LModulo: TppLabel
          Tag = 100
          DesignLayer = ppDesignLayer6
          UserName = 'Label2'
          HyperlinkEnabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3260
          mmLeft = 3175
          mmTop = 529
          mmWidth = 10795
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object LNomMod: TppLabel
          Tag = 100
          DesignLayer = ppDesignLayer6
          UserName = 'LNomMod'
          HyperlinkEnabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3260
          mmLeft = 25400
          mmTop = 529
          mmWidth = 13039
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
      end
      object GFBMod: TppGroupFooterBand
        AfterPrint = GFBModAfterPrint
        BeforePrint = GFBModBeforePrint
        Background.Brush.Style = bsClear
        PrintHeight = phDynamic
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3439
        mmPrintPosition = 0
        object ppShape21: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape21'
          ParentHeight = True
          mmHeight = 3439
          mmLeft = 127
          mmTop = 0
          mmWidth = 195527
          BandType = 5
          GroupNo = 1
          LayerName = Foreground5
        end
        object LTotMod: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LNomMod1'
          HyperlinkEnabled = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 118534
          mmTop = 265
          mmWidth = 8996
          BandType = 5
          GroupNo = 1
          LayerName = Foreground5
        end
        object ppLabel4: TppLabel
          Tag = 100
          DesignLayer = ppDesignLayer6
          UserName = 'Label4'
          HyperlinkEnabled = False
          Caption = 'Carga Hor'#225'ria Cumprida no M'#243'dulo : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 72231
          mmTop = 265
          mmWidth = 45773
          BandType = 5
          GroupNo = 1
          LayerName = Foreground5
        end
        object LCompl: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'LCompl'
          HyperlinkEnabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2921
          mmLeft = 127265
          mmTop = 265
          mmWidth = 9017
          BandType = 5
          GroupNo = 1
          LayerName = Foreground5
        end
        object DBCTotMod: TppDBCalc
          DesignLayer = ppDesignLayer6
          UserName = 'DBCTotMod'
          HyperlinkEnabled = False
          DataField = 'ch'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          Transparent = True
          Visible = False
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2921
          mmLeft = 147638
          mmTop = 265
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
          LayerName = Foreground5
        end
        object DBCTotMod2: TppDBCalc
          DesignLayer = ppDesignLayer6
          UserName = 'DBCTotMod1'
          HyperlinkEnabled = False
          DataField = 'ch2'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          Transparent = True
          Visible = False
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2921
          mmLeft = 164042
          mmTop = 265
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
          LayerName = Foreground5
        end
      end
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer6: TppDesignLayer
        UserName = 'Foreground5'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object DSFicha2: TDataSource
    DataSet = QRFicha
    Left = 357
    Top = 86
  end
  object DSObserv: TDataSource
    DataSet = QObserv
    Left = 136
    Top = 8
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = DSObserv
    SkipWhenNoRecords = False
    UserName = 'DBPipeline2'
    Left = 234
    Top = 161
  end
  object DSAdiciona: TDataSource
    DataSet = QAdiciona
    Left = 152
    Top = 104
  end
  object DSACur1: TDataSource
    DataSet = SPACur1
    Left = 192
    Top = 40
  end
  object SPACur2: TStoredProc
    DatabaseName = 'unoeste'
    StoredProcName = 'retorna_disc'
    Left = 280
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = '2'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = '(expression)'
    end
    object SmallintField1: TSmallintField
      FieldName = '(expression)_1'
    end
    object SPACur2coddis: TIntegerField
      FieldName = '(expression)_2'
    end
    object SmallintField2: TSmallintField
      FieldName = '(expression)_3'
    end
    object SmallintField3: TSmallintField
      FieldName = '(expression)_4'
    end
  end
  object DSACur2: TDataSource
    DataSet = SPACur2
    Left = 296
    Top = 8
  end
  object MTObs: TMemoryTable
    Active = True
    TableName = 'MTObs'
    Left = 272
    Top = 76
    object MTObsobs_codigo: TStringField
      FieldName = 'obs_codigo'
      Size = 5
    end
    object MTObsobs_observ: TStringField
      FieldName = 'obs_observ'
      Size = 120
    end
  end
  object DSObs: TDataSource
    DataSet = MTObs
    Left = 290
    Top = 76
  end
  object ppDBPipeline5: TppDBPipeline
    DataSource = DSObs
    SkipWhenNoRecords = False
    UserName = 'DBPipeline5'
    Left = 266
    Top = 161
    object ppDBPipeline5ppField1: TppField
      FieldAlias = 'obs_codigo'
      FieldName = 'obs_codigo'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object ppDBPipeline5ppField2: TppField
      FieldAlias = 'obs_observ'
      FieldName = 'obs_observ'
      FieldLength = 120
      DisplayWidth = 120
      Position = 1
    end
  end
  object MTCH: TMemoryTable
    Active = True
    TableName = 'MTCH'
    Left = 232
    Top = 116
    object MTCHtotch: TSmallintField
      FieldName = 'totch'
    end
  end
  object DSCH: TDataSource
    DataSet = MTCH
    Left = 250
    Top = 116
  end
  object ppDBPipeline8: TppDBPipeline
    DataSource = DSCH
    SkipWhenNoRecords = False
    UserName = 'DBPipeline8'
    Left = 200
    Top = 193
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'totch'
      FieldName = 'totch'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
  end
  object DSObsCompl: TDataSource
    DataSet = QObsCompl
    Left = 232
    Top = 78
  end
  object ppDBPipeline9: TppDBPipeline
    DataSource = DSObsCompl
    SkipWhenNoRecords = False
    UserName = 'DBPipeline9'
    Left = 232
    Top = 193
    object ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'grl_codgra'
      FieldName = 'grl_codgra'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'cur_codigo'
      FieldName = 'cur_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppField44: TppField
      FieldAlias = 'obc_caracter'
      FieldName = 'obc_caracter'
      FieldLength = 3
      DisplayWidth = 3
      Position = 2
    end
    object ppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'hab_codigo'
      FieldName = 'hab_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppField46: TppField
      FieldAlias = 'obc_observ1'
      FieldName = 'obc_observ1'
      FieldLength = 120
      DisplayWidth = 120
      Position = 4
    end
    object ppField47: TppField
      FieldAlias = 'obs_observ2'
      FieldName = 'obs_observ2'
      FieldLength = 120
      DisplayWidth = 120
      Position = 5
    end
  end
  object QEquival: TQuery
    OnCalcFields = QEquivalCalcFields
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_equivalencia'
      'where alu_ra =:ra and dis_codigo =:coddis'
      'order by equ_nrodis')
    Left = 344
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'coddis'
        ParamType = ptInput
      end>
    object QEquivalequ_nrodis: TSmallintField
      FieldName = 'equ_nrodis'
      Origin = 'sca_equivalencia.equ_nrodis'
    end
    object QEquivalalu_ra: TFloatField
      FieldName = 'alu_ra'
      Origin = 'sca_equivalencia.alu_ra'
    end
    object QEquivalhab_codigo: TSmallintField
      FieldName = 'hab_codigo'
      Origin = 'sca_equivalencia.hab_codigo'
    end
    object QEquivaldis_codigo: TIntegerField
      FieldName = 'dis_codigo'
      Origin = 'sca_equivalencia.dis_codigo'
    end
    object QEquivalequ_nomdis: TStringField
      FieldName = 'equ_nomdis'
      Origin = 'sca_equivalencia.equ_nomdis'
      Size = 70
    end
    object QEquivalequ_perlet: TIntegerField
      FieldName = 'equ_perlet'
      Origin = 'sca_equivalencia.equ_perlet'
    end
    object QEquivalequ_cghora: TSmallintField
      FieldName = 'equ_cghora'
      Origin = 'sca_equivalencia.equ_cghora'
    end
    object QEquivalequ_medfin: TStringField
      FieldName = 'equ_medfin'
      Origin = 'sca_equivalencia.equ_medfin'
      Size = 10
    end
    object QEquivalequ_pfreq: TStringField
      FieldName = 'equ_pfreq'
      Origin = 'sca_equivalencia.equ_pfreq'
      Size = 5
    end
    object QEquivalequ_codobs: TSmallintField
      FieldName = 'equ_codobs'
      Origin = 'sca_equivalencia.equ_codobs'
    end
    object QEquivalequ_perchar: TStringField
      FieldName = 'equ_perchar'
      Origin = 'sca_equivalencia.equ_perchar'
      Size = 15
    end
    object QEquivalequ_cghreal: TFloatField
      FieldName = 'equ_cghreal'
      Origin = 'sca_equivalencia.equ_cghreal'
    end
    object QEquivalhr: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hr'
      Calculated = True
    end
  end
  object DSEquival: TDataSource
    DataSet = QEquival
    Left = 360
    Top = 48
  end
  object qconsccl2: TQuery
    DatabaseName = 'unoeste'
    RequestLive = True
    SQL.Strings = (
      
        'select * from sca_alu_hab where alu_ra = :ra and hab_codigo = :h' +
        'ab')
    Left = 370
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'hab'
        ParamType = ptUnknown
      end>
  end
  object QAux: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_rficha')
    Left = 336
    Top = 190
  end
  object QGradLet: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select * from sca_grades_letivo'
      'where cur_codigo =:codcur and grl_codgra =:codgra'
      '')
    Left = 130
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codcur'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codgra'
        ParamType = ptUnknown
      end>
  end
  object QCHAtiv: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select sum(aat_cargahor) as totcarga'
      'from sca_aluatividade'
      'where alu_ra =:ra')
    Left = 286
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end>
  end
  object QAluHabEq: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select * from sca_aluhab_equiv'
      'where alu_ra =:ra and hab_codigo =:codhab')
    Left = 194
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codhab'
        ParamType = ptUnknown
      end>
  end
  object QCertif: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'select * from sca_certificacao'
      'where cer_seq =:mod and cer_ativo = '#39'S'#39
      '')
    Left = 122
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mod'
        ParamType = ptUnknown
      end>
  end
  object MDFicha: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'alu_ra'
        DataType = ftFloat
      end
      item
        Name = 'cer_seq'
        DataType = ftInteger
      end
      item
        Name = 'dis_codigo'
        DataType = ftInteger
      end
      item
        Name = 'hab_codigo'
        DataType = ftSmallint
      end
      item
        Name = 'ch'
        DataType = ftFloat
      end
      item
        Name = 'chmask'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ch2'
        DataType = ftFloat
      end
      item
        Name = 'perlet'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sitfin'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'medfin'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'obs'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nomdisc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'termo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'horas'
        DataType = ftFloat
      end
      item
        Name = 'chcursando'
        DataType = ftFloat
      end
      item
        Name = 'chacursar'
        DataType = ftFloat
      end
      item
        Name = 'his_anoref'
        DataType = ftSmallint
      end
      item
        Name = 'his_semref'
        DataType = ftSmallint
      end
      item
        Name = 'dst_codmestre'
        DataType = ftInteger
      end
      item
        Name = 'his_codtur'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'lab_turma'
        DataType = ftSmallint
      end>
    Left = 448
    Top = 104
    object MDFichaalu_ra: TFloatField
      FieldName = 'alu_ra'
    end
    object MDFichacer_seq: TIntegerField
      FieldName = 'cer_seq'
    end
    object MDFichadis_codigo: TIntegerField
      FieldName = 'dis_codigo'
    end
    object MDFichahab_codigo: TSmallintField
      FieldName = 'hab_codigo'
    end
    object MDFichach: TFloatField
      FieldName = 'ch'
    end
    object MDFichachmask: TStringField
      FieldName = 'chmask'
      Size = 10
    end
    object MDFichach2: TFloatField
      FieldName = 'ch2'
    end
    object MDFichaperlet: TStringField
      FieldName = 'perlet'
    end
    object MDFichasitfin: TStringField
      FieldName = 'sitfin'
    end
    object MDFichamedfin: TStringField
      FieldName = 'medfin'
    end
    object MDFichaobs: TStringField
      FieldName = 'obs'
      Size = 5
    end
    object MDFichanomdisc: TStringField
      FieldName = 'nomdisc'
      Size = 100
    end
    object MDFichatermo: TStringField
      FieldName = 'termo'
      Size = 10
    end
    object MDFichahoras: TFloatField
      FieldName = 'horas'
    end
    object MDFichachcursando: TFloatField
      FieldName = 'chcursando'
    end
    object MDFichachacursar: TFloatField
      FieldName = 'chacursar'
    end
    object MDFichahis_anoref: TSmallintField
      FieldName = 'his_anoref'
    end
    object MDFichahis_semref: TSmallintField
      FieldName = 'his_semref'
    end
    object MDFichadst_codmestre: TIntegerField
      FieldName = 'dst_codmestre'
    end
    object MDFichahis_codtur: TStringField
      FieldName = 'his_codtur'
    end
    object MDFichalab_turma: TSmallintField
      FieldName = 'lab_turma'
    end
  end
  object DSFicha: TDataSource
    DataSet = MDFicha
    Left = 472
    Top = 104
  end
  object ppDBPipeline3: TppDBPipeline
    DataSource = DSProf
    UserName = 'DBPipeline3'
    Left = 265
    Top = 194
    object ppDBPipeline3ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'his_anoref'
      FieldName = 'his_anoref'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline3ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'his_semref'
      FieldName = 'his_semref'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline3ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'dis_codigo'
      FieldName = 'dis_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline3ppField4: TppField
      FieldAlias = 'dis_nomdisc'
      FieldName = 'dis_nomdisc'
      FieldLength = 80
      DisplayWidth = 80
      Position = 3
    end
    object ppDBPipeline3ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'fun_matr'
      FieldName = 'fun_matr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline3ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'tit_codigo'
      FieldName = 'tit_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline3ppField7: TppField
      FieldAlias = 'pes_nome'
      FieldName = 'pes_nome'
      FieldLength = 58
      DisplayWidth = 58
      Position = 6
    end
    object ppDBPipeline3ppField8: TppField
      FieldAlias = 'tit_descricao'
      FieldName = 'tit_descricao'
      FieldLength = 17
      DisplayWidth = 17
      Position = 7
    end
    object ppDBPipeline3ppField9: TppField
      FieldAlias = 'periodo'
      FieldName = 'periodo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
  end
  object MDProf: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'his_anoref'
        DataType = ftSmallint
      end
      item
        Name = 'his_semref'
        DataType = ftSmallint
      end
      item
        Name = 'dis_codigo'
        DataType = ftInteger
      end
      item
        Name = 'dis_nomdisc'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'fun_matr'
        DataType = ftInteger
      end
      item
        Name = 'tit_codigo'
        DataType = ftSmallint
      end
      item
        Name = 'pes_nome'
        DataType = ftString
        Size = 58
      end
      item
        Name = 'tit_descricao'
        DataType = ftString
        Size = 17
      end
      item
        Name = 'periodo'
        DataType = ftString
        Size = 10
      end>
    Left = 448
    Top = 144
    object MDProfhis_anoref: TSmallintField
      FieldName = 'his_anoref'
    end
    object MDProfhis_semref: TSmallintField
      FieldName = 'his_semref'
    end
    object MDProfdis_codigo: TIntegerField
      FieldName = 'dis_codigo'
    end
    object MDProfdis_nomdisc: TStringField
      FieldName = 'dis_nomdisc'
      FixedChar = True
      Size = 80
    end
    object MDProffun_matr: TIntegerField
      FieldName = 'fun_matr'
    end
    object MDProftit_codigo: TSmallintField
      FieldName = 'tit_codigo'
    end
    object MDProfpes_nome: TStringField
      FieldName = 'pes_nome'
      FixedChar = True
      Size = 58
    end
    object MDProftit_descricao: TStringField
      FieldName = 'tit_descricao'
      FixedChar = True
      Size = 17
    end
    object MDProfperiodo: TStringField
      FieldName = 'periodo'
      Size = 10
    end
  end
  object DSProf: TDataSource
    DataSet = MDProf
    Left = 472
    Top = 144
  end
  object MeuRest: TRestClient
    ConnectionType = hctWinHttp
    Left = 78
    Top = 128
  end
  object QUsuDoc: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select d.dis_codigo,d.dis_nomdisc,g.gra_chteor,g.gra_chprat'
      'from sca_disciplinas d,sca_grades g'
      'where d.dis_codigo = g.dis_codigo and d.dis_codigo =:coddis'
      'and g.grl_codgra =:codgra')
    Left = 396
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'coddis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codgra'
        ParamType = ptUnknown
      end>
  end
  object QGedArea: TQuery
    DatabaseName = 'unoeste'
    SQL.Strings = (
      'Select * from sca_rficha')
    Left = 448
    Top = 190
  end
  object QItensLivDip: TQuery
    DatabaseName = 'unoeste'
    RequestLive = True
    SQL.Strings = (
      'Select d.dis_codigo,d.dis_nomdisc,g.gra_chteor,g.gra_chprat'
      'from sca_disciplinas d,sca_grades g'
      'where d.dis_codigo = g.dis_codigo and d.dis_codigo =:coddis'
      'and g.grl_codgra =:codgra')
    Left = 436
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'coddis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codgra'
        ParamType = ptUnknown
      end>
  end
  object QHistoricoDigital: TQuery
    DatabaseName = 'unoeste'
    RequestLive = True
    SQL.Strings = (
      'Select d.dis_codigo,d.dis_nomdisc,g.gra_chteor,g.gra_chprat'
      'from sca_disciplinas d,sca_grades g'
      'where d.dis_codigo = g.dis_codigo and d.dis_codigo =:coddis'
      'and g.grl_codgra =:codgra')
    Left = 492
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'coddis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codgra'
        ParamType = ptUnknown
      end>
  end
end
