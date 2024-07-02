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
      mmHeight = 8202
      mmPrintPosition = 0
      object ppShape53: TppShape
        DesignLayer = ppDesignLayer6
        UserName = 'Shape501'
        Brush.Color = 16119285
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
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
        mmTop = 7938
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
        mmTop = 0
        mmWidth = 56621
        BandType = 0
        LayerName = Foreground5
      end
      object LFolha2: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'LContinua1'
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
        mmTop = 0
        mmWidth = 21696
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
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 6614
      mmPrintPosition = 0
      object ppShape3: TppShape
        DesignLayer = ppDesignLayer6
        UserName = 'Shape3'
        ParentHeight = True
        mmHeight = 6614
        mmLeft = 127
        mmTop = 0
        mmWidth = 195398
        BandType = 8
        LayerName = Foreground5
      end
      object LContinua2: TppLabel
        Tag = 100
        DesignLayer = ppDesignLayer6
        UserName = 'LContinua2'
        HyperlinkEnabled = False
        Caption = 'Continua na p'#225'gina 02 (Verso)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 1588
        mmWidth = 44979
        BandType = 8
        LayerName = Foreground5
      end
    end
    object SBHistor: TppSummaryBand
      BeforePrint = SBHistorBeforePrint
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object ppRegion2: TppRegion
        DesignLayer = ppDesignLayer6
        UserName = 'Region2'
        Caption = 'Region2'
        Pen.Style = psClear
        ShiftRelativeTo = Memo
        mmHeight = 41303
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
          QRCodeSettings.QuietZone = 4
          DataMatrixSettings.QuietZone = 4
          BarCodeType = bcQRCode
          Data = 'https://www.unoeste.br/historicoescolar/'
          mmHeight = 29104
          mmLeft = 2385
          mmTop = 11878
          mmWidth = 42598
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
          mmTop = 14294
          mmWidth = 193726
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object ppLabel1: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label1'
          AutoSize = False
          Caption = 'UNIVERSIDADE DO OESTE PAULISTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 193725
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
        object ppShape34: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Shape34'
          mmHeight = 6879
          mmLeft = 1852
          mmTop = 64029
          mmWidth = 38118
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel40: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Label40'
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
        object ppShape35: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Shape35'
          mmHeight = 6879
          mmLeft = 44458
          mmTop = 64029
          mmWidth = 34408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel41: TppLabel
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
        object ppShape36: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Shape36'
          mmHeight = 6879
          mmLeft = 82560
          mmTop = 64029
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel42: TppLabel
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
          Tag = 1
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
          Tag = 1
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
          mmLeft = 113242
          mmTop = 64029
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object LNProc: TppLabel
          Tag = 1
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
          mmLeft = 113506
          mmTop = 66675
          mmWidth = 79640
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppShape38: TppShape
          Tag = 1
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
          Tag = 1
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
          Tag = 1
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
        object ppShape39: TppShape
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Shape39'
          mmHeight = 6879
          mmLeft = 31485
          mmTop = 71967
          mmWidth = 162454
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
        object ppLabel45: TppLabel
          Tag = 1
          DesignLayer = ppDesignLayer6
          UserName = 'Label45'
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
          Font.Size = 9
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
          MaintainAspectRatio = True
          Stretch = True
          Picture.Data = {
            0A544A504547496D6167652A9D0000FFD8FFE000104A46494600010101006000
            600000FFDB004300020101020101020202020202020203050303030303060404
            0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
            0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800EE042103012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD1B
            FF0082D3FF00C169F4DFF8237786BC01A96A5E00BFF1E0F1EDD5EDAC51DAEAC9
            A7FD8CDB242C492D149BB779DE831B7DEBE02FF88E2BC2DFF46EDE20FF00C2BE
            1FFE44A3FE0F88F97E177ECEE47FD0575CFF00D13635FCF11626803FA1DFF88E
            2FC2DFF46EDE20FF00C2BE1FFE44A3FE238BF0B7FD1BB7883FF0AF87FF00912B
            F9E2DD46EA00FE877FE238BF0B7FD1BB7883FF000AF87FF9128FF88E2FC2DFF4
            6EDE20FF00C2BE1FFE44AFE78B751BA803FA1DFF0088E2FC2DFF0046EDE20FFC
            2BE1FF00E44AFB7BFE08B1FF0005E2D2BFE0B23E27F881A6E9BF0DF50F011F01
            DAD95CBBDCEB09A87DB3ED2D328002C31EDDBE4FA9CEEF6AFE413757EEEFFC18
            EFF3FC52FDA233FF0040AD0FFF00475F5007F43D452018A5A0028A28A0028A28
            A00F92FF00E0B1FF00F0554B0FF8242FECCBA1FC49D47C1B77E39835BF13DBF8
            68585BEA2B60F0B4B69777226DED1C8081F642BB7033BF39E39FCD5FF88E27C2
            CBFF0036EDE20FFC2BE1FF00E44AF5FF00F83D53E5FF00825A78048EBFF0B574
            EE7FEE11AC57F3079A00FE877FE238BF0B7FD1BB7883FF000AF87FF9128FF88E
            2FC2DFF46EDE20FF00C2BE1FFE44AFE78B751BA803FA1DFF0088E2FC2DFF0046
            EDE20FFC2BE1FF00E44A3FE238BF0B7FD1BB7883FF000AF87FF912BF9E2DD46E
            A00FE877FE238BF0B7FD1BB7883FF0AF87FF00912BEB2FF82397FC1C6DA37FC1
            5EBF69AD73E1B69BF0AB53F034DA27862E3C4A6FEE75E8EFD6658AEED2D8C3B1
            608C827ED61B764E36631CD7F261BABF5FBFE0CAB3BBFE0A99E3E07A7FC2AAD4
            78FF00B8BE8F401FD3E29CAD2D14500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4D270D4EA4619A00FC58FF008298FF00C1D8DE20FF00827FFEDCDF107E0FDA7C
            14D1BC4F6FE08BB82D53549BC4B25ABDDF996B0CF9318B770B832EDFBC7EEE78
            CE2BC2BFE238BF14FF00D1BB681FF8584DFF00C895F9FF00FF0007217FCA6D3E
            3DFF00D856CBFF004D9695F105007EEFFF00C4717E29FF00A376D03FF0B09BFF
            009128FF0088E2FC53FF0046EDA07FE16137FF002257E1051401FBBFFF0011C5
            F8A7FE8DDB40FF00C2C26FFE44AE8BE10FFC1EA1E27F89FF0015FC31E1B93F67
            FD0ACE3F10EAD6BA6B4EBE2C9643089A648B70536A3763767191D2BF9FEAF41F
            D938FF00C652FC35FF00B1AB4BFF00D2C8A803FBBA53914B483A52D001451450
            0145145001451450014514500145145001451450014514500145145001451450
            014514500145145001451450014514500145145007E10FFC1F15FF0024B3F676
            FF00B0AEBBFF00A2AC6BF9E1AFE87BFE0F8AFF009259FB3B7FD8575DFF00D156
            35FCF0D00145145001451450015FBBDFF063AFFC953FDA27FEC15A17FE8DBEAF
            C21AFDDEFF00831D7FE4A9FED13FF60AD0BFF46DF5007F43D451450014514500
            145145007E407FC1EADFF28B2F00FF00D955D3BFF4D1AC57F3055FD3EFFC1EAD
            FF0028B2F00FFD955D3BFF004D1AC57F305400514514005145140057EBFF00FC
            1953FF00294DF1F7FD92AD47FF004EFA3D7E4057EBFF00FC1953FF00294DF1F7
            FD92AD47FF004EFA3D007F4FB451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1487A52D21E9401FC71FFC1C85FF0029B5F8F7FF00615B2FFD365A57C415F6FF
            00FC1C85FF0029B5F8F7FF00615B2FFD365A57C414005145140057A07EC9DFF2
            74BF0D7FEC6AD2FF00F4B22AF3FAF40FD93BFE4E97E1AFFD8D5A5FFE9645401F
            DDE5145140051451400514514005145140051451400514514005145140051451
            40051451400514514005145140051451400514514005145140051451401F843F
            F07C57FC92CFD9DBFEC2BAEFFE8AB1AFE786BFA1EFF83E2BFE4967ECEDFF0061
            5D77FF004558D7F3C3400514514005145140057EEF7FC18EBFF254FF00689FFB
            05685FFA36FABF086BF77BFE0C75FF0092A7FB44FF00D82B42FF00D1B7D401FD
            0F514514005145140051451401F901FF0007AB7FCA2CBC03FF0065574EFF00D3
            46B15FCC157F4FBFF07AB7FCA2CBC03FF65574EFFD346B15FCC1500145145001
            451450015FAFFF00F0654FFCA537C7DFF64AB51FFD3BE8F5F9015FAFFF00F065
            4FFCA537C7DFF64AB51FFD3BE8F401FD3ED1451400514514005145140051499E
            6BCD7E327ED95F093F676327FC27DF143E1EF829A25DCF1EB9E22B4B093B1184
            9640C49C8C003272319CD007A5D15F1478E3FE0E2AFD8B3E1F4D2A5FFC7EF0AC
            E623B49D32CAFB5304EEDBC1B68240C33DC13C73D39AE0B59FF83AA7F622D32E
            44707C56D4F5252A0996DBC21ABAAA9CE36FEF2D91B3DFA639EB9A00FD14A2BF
            3BB44FF83A9FF61FD524713FC59D474E555DCAD73E0FD65B79F4023B573F9E05
            7A5F803FE0E02FD8DBE264F1A69BFB41781AD8CB8C1D55A7D2546467E63751C4
            17AF723078EBC5007D8D45711F08BF694F877FB40DAB4FE03F1F782BC6D02286
            69341D6ED7524507A126191862BB40DCD003E8A41D296800A28A2800A28A2800
            A28A2800A28A2800A29A58EEA4DF83D7F0F5A007D15E4DF19BF6F0F829FB3A4F
            343E3CF8BBF0D7C1F73012AF6DAC7892CECEE030CFCA22790393C1E002783E95
            F3C78DBFE0E41FD8A3E1FCAC97DF1EBC3F3B2B053FD9BA56A5A9024E7A1B7B79
            011C750703B9A00FB828AFCE6BFF00F83AD7F623B3BC9224F89DAD5DA21C09A2
            F086AA124F701ADD5B1F502ACE85FF000752FEC3DAB997CFF8B9A8699E5E36FD
            ABC1FAD37999CE71E55ABF4EF9C7518CD007E88515F207C3EFF82F97EC73F132
            E921D3BF684F87D6CEEDB01D56E9F494078EAD7491A81F375271C1F435F49FC2
            EF8EFE08F8E3A59BEF0578CBC2BE30B20031B8D0F56B7D422032467742EC3A83
            F950075945377734A0E45002D14514005145140051451400514514005145359B
            06801D4530BE57839FA5788FC60FF82977ECF7F0067921F197C6FF00855E1EBB
            8812D6777E27B35BB2075C41E6798DF82F71401EE3457C23E2FF00F8397BF623
            F0549E5DD7C75D32E64CB8034FD0356BE04AE3F8A1B56519C8C12707B1E0E38E
            FF0088AF7F6261D7E237883FF091D4FF00F8CD007E8FD15F9DDA27FC1D51FB0F
            EAF3BACDF16752D3028C86BAF086B043FB0F2ED5CFE6057ABFC37FF82F3FEC79
            F156654D2FF685F8716A5FA1D62F9B4703A75378B101D47EBE9401F5D515CBFC
            34F8D5E10F8D1A39D43C1DE2BF0DF8B2C075B9D1B5382FE11FF038998574BBF2
            3DE801F45229C8A5A0028A28A0028A28A0028A28A0028A29ACD83400EA2A3697
            6264B281EA4D7CF7F1D3FE0AD1FB347ECD934D078CFE39FC34D22F6DF7196C13
            5C82EEFA3C6739B784BCA39040F939208A00FA228AFCDAF1F7FC1D8BFB16F836
            6912C7C77E25F1418B39FEC9F0B5F00C40CF06E23841E4633D3BF4E6BCB754FF
            0083D23F655D3AFDE18BC19F1DEF913189E0D0B4C11BE403C07D455B8CE3951C
            8E38E6803F5DE8AFC80FF88D5BF659FF00A107E3FF00FE08F48FFE59D6CF853F
            E0F2CFD937C4728175A1FC67D0817DBBAFBC3D66FC7F7BF717B29C76E99F6A00
            FD66A2BE01F85FFF00073DFEC53F13E58E11F17C787EEA55C8875AD0351B40BC
            02732980C2319C7FACEC7191CD7D69F03BF6C7F84DFB4CC3BBE1DFC4DF00F8E0
            ECDEC9A16BD6B7D220FF0069237665FA1191401E954534BE0FB528391400B451
            45001487A52D21E9401FC71FFC1C85FF0029B5F8F7FF00615B2FFD365A57C415
            F6FF00FC1C85FF0029B5F8F7FF00615B2FFD365A57C414005145140057A07EC9
            DFF274BF0D7FEC6AD2FF00F4B22AF3FAEA3E0AF8D6DFE1A7C61F09F88EEE29A7
            B6D0359B3D4A68E1C79922433A48557240DC429C6481401FDEA515F8C03FE0F6
            5F8083AFC29F8BFCFF00B1A771FF009335BD17FC1EADFB2E1897CCF007C7D57C
            0DC1745D20807BE0FF00690FE5401FB03457E407FC46ADFB2CFF00D083F1FF00
            FF00047A47FF002CE8FF0088D5BF659FFA107E3FFF00E08F48FF00E59D007EBF
            D15F901FF11AB7ECB3FF00420FC7FF00FC11E91FFCB3A3FE2356FD967FE841F8
            FF00FF00823D23FF00967401FAFF00457E407FC46ADFB2CFFD083F1FFF00F047
            A47FF2CE8FF88D5BF659FF00A107E3FF00FE08F48FFE59D007EBFD15F077FC13
            0BFE0E15F831FF000563F8F9ABFC3BF875E19F89FA2EB5A3787E6F124D3F8934
            DB1B6B56B68AE2DADD955A0BC9DCC9BEEA320150B856F981001FBC17A5002D14
            514005145140051453589CF1FF00EBA007515E5FF1A7F6D7F83DFB38165F881F
            157E1D782A550CDE4EB7E22B4B099F033858E591598FB0049ED9AF9CBC73FF00
            071C7EC53F0F25912FFE3E7872731B053FD99A66A3A9A9392386B6B79011C750
            48EFD08A00FB768AFCE4BBFF0083AE3F624B6BA9235F897AE5C2C6E544B1F847
            54092007EF00D006C1F700FA814FD37FE0EB2FD88F50BE8E293E286B1631B673
            34FE10D58A26013C84B766E7A700F24678C9A00FD18A2BE2EF87FF00F070FF00
            EC5FF1319069DF1FBC236DE6723FB5ADEF34903AF5FB543163A1EBEDEA33F48F
            C1EFDAB3E18FED0B1EFF0000FC46F0278DD48DC0E83AFDAEA3C77CF92ED8C500
            7A0514DCE69474A005A28A2800A28A2800A28A2803F087FE0F8AFF009259FB3B
            7FD8575DFF00D15635FCF0D7F43DFF0007C57FC92CFD9DBFEC2BAEFF00E8AB1A
            FE786800A28A2800A28A2800AFDDEFF831D7FE4A9FED13FF0060AD0BFF0046DF
            57E10D7EEF7FC18EBFF254FF00689FFB05685FFA36FA803FA1EA28A2800A28A2
            800A28A2803F203FE0F56FF94597807FECAAE9DFFA68D62BF982AFE9F7FE0F56
            FF0094597807FECAAE9DFF00A68D62BF982A0028A28A0028A28A002BF5FF00FE
            0CA9FF0094A6F8FBFEC956A3FF00A77D1EBF202BF5FF00FE0CA9FF0094A6F8FB
            FEC956A3FF00A77D1E803FA7DA28A2800A6963BA867C1AF82BFE0B59FF0005E1
            F87FFF000496F01FF65402D3C63F1875AB73268FE188E6C2D9A1076DDDFB29DD
            1419FBABF7E5230B850EE801F5BFED1FFB527C3EFD90FE19DDF8C7E2678C343F
            05F86ECFE57BDD4EE044247C12238D79796438388E35676C70A6BF157F6F8FF8
            3D1F4FD16F6FB42FD9CBC02BAD6CDD0C7E2AF17078ADDCF4DF05846CB230E72A
            D2C919E0662ED5F8A1FB6CFEDEFF00157FE0A13F17EE3C69F157C597FE23D4DC
            95B4B62C63B0D262273E4DAC03E48507A28CB1CB3166258F8EEE3401F547ED4D
            FF0005B4FDA9FF006C4BAB91E33F8D1E32FECDBAC86D2746BBFEC6D38A118D8D
            05A08D24007FCF40C7D4939AF9666B992E246777677762CCCC72589E49269A4E
            692801779C7EB46EE2928A005CE68CD2514016B49D6EF340D4E1BDB1BBB9B2BC
            B76DF14F6F218E489BD5597041FA57D9BFB24FFC1C25FB5AFEC7B35B47A37C5A
            D6FC53A2C054368FE2F3FDB969228E42069F33C4BED14B19F7AF8A294311401F
            D28FFC13EBFE0F27F86BF176E2CBC3FF001FBC2771F0C35999922FF8483472FA
            86852B1EAF24583716C327803CF0064B3AD7EC67C38F89DE1DF8C5E07D3BC4DE
            12D7B48F13787B57884F63A9E95771DDDA5DA1E37472A12AC383D09E86BF822C
            D7D49FF04C9FF82BD7C65FF82587C485D53E1F6BCF73E19BDB95975AF0A6A2E6
            5D27585E03164CFEEA6DA0013C7B5C6D00965CA900FED597A52D7CBFFF0004B3
            FF0082B0FC30FF0082AEFC0A5F157812F0D8EBBA62C71788FC3176E0DFF87EE1
            81C2B7004B13E0F97320DAE0118575745FA7D4E5680168A28A0028A298EF83C7
            E34003310DED5E57FB5BFEDBBF0AFF00614F864FE2FF008AFE37D13C1BA26196
            06BC90B5C5FB8C1296D02069677C1076C4AC403920004D7C57FF0005D1FF0083
            87BC23FF0004B2D266F02F83A0D3FC6BF1BEFED84B1E992485AC3C371BAE527B
            E2A412C410C96EA43B2FCCCD1A942FFCBAFED4BFB5B7C47FDB4FE2E5F78E7E28
            78B756F187896FB0AD757B27CB6F182488A18D7090C4A49C246AAA324E324D00
            7ED37EDDFF00F07A5EA77F757BA37ECEBF0F2DAC2D7E6893C4DE321E6CEFD46F
            86C6170A9D995A595FAE1A21D2BF287F6A1FF82BB7ED2DFB635C5C0F881F19FC
            73AAD8DCE449A5DADF9D374C20FADA5B08E0246719284FBD7CE3BCFAD2673400
            BB8E28DC727DFAD25140052E71494500296CD5FF000D78B354F05EB96FA9E8FA
            95FE93A95A36F82EECEE1E09E16F55752194FD0D67D1401F76FEC93FF0720FED
            77FB23DC5AC56BF14750F1DE8B6F80749F1AAFF6D45228230BE7C845D2281C00
            932803E82BF627FE09E9FF000783FC1BFDA12EEC7C3DF1AF44B9F839E22B80B1
            8D59646D43C3F71274F9A40A26B6CE4637A320E774A3193FCC5038A379A00FEF
            A3C2BE2DD33C73E1AB3D6744D4AC359D2751844F697B63709716F7519E8F1C88
            4ABA9EC4135A4ADB866BF8D2FF008250FF00C1707E327FC1297C6302786F516F
            147C39B8B8126ABE0BD52763617018FCF25BB726D67EA7CC418276F989200057
            F56FFF0004F5FF008289FC35FF0082997ECF163F113E1A6A8F3D93B7D9F52D32
            EB6A6A3A1DD0196B7B98C31DAFDC104ABA90CA483401EEF45229C8A5A0028A28
            A0029AEFB01E98F53DA867DA4FF3AFC8DFF82F47FC1CBFA4FEC09A86ABF097E0
            BFF66F89FE31C6BE46A7AA4CAB71A6783D981CAB2E713DE28C1111FDDC648326
            F21A1201F7EFEDC7FF00052AF82FFF0004E7F0426B7F16BC73A6786DAEA3692C
            34B19B8D5354DBC116F6A999241B8852F808A586E6506BF0EFF6E7FF0083D07E
            2078DEFAEF4AFD9FFC0BA5F82349F9A38F5DF1322EA3AACA39DB225BA9FB3C27
            A7CAE671C75E715F8D3F1A7E38F8C7F689F895A9F8C3C77E25D6BC59E27D624F
            36EF52D52E9AE2E253D86E6FBAAA38555C2AA80140000AE541C5007B77ED3BFF
            000527F8F7FB65DDCEDF137E2DF8E7C5B6D70496D3EE75378F4D5CF5D967195B
            74CFFB318E83D2BC44B67F9D04E4D25002EF38A4A28A005DDC52EF38A6D1401A
            DE0CF1E6B9F0E7C4106ADE1ED6755D0B55B63BA1BDD3AEE4B5B888FAAC88430F
            C0D7DDDFB207FC1CDDFB5CFEC97716904DF109BE26E856FC3697E3788EA8641F
            F5F795BBCFA7EF88FF0064E2BF3EE973401FD4D7FC13A3FE0EDCF80FFB596A1A
            7F86FE28DA5C7C11F175D6235B8D4AE96EBC3B73274005E80A60279389E3445E
            079AC7AFEABE97AB5BEB7A6DBDDDA5CC1776B7712CD04F038923991802AEAC38
            65208208E0820F7AFE03B71AFBF3FE08F5FF0007037C5AFF008258788ACF42B8
            B9BAF1EFC1F9661F6DF09DFDC126C159B2D2E9F2B64DBC8393B3FD53966DCA18
            891403FAFE5395A5AF28FD8D3F6D0F877FB7AFC05D2BE22FC31F10DBEBFE1CD4
            D763E004B9D3AE00064B6B98F24C5326E1B94FA8652CACAC7D5874A005A28A28
            00A28AF9A3FE0A99FF000547F87BFF0004A5FD9C2E3C75E3698DF6A97A5ED7C3
            9E1DB7942DE7886F02E7CB4E0EC8D720C9310563523866644700F63F8F7FB437
            827F65CF867A878CBE21F8A745F07785F4B00DC6A3A9DCAC312B1CED45CF2EED
            8C2A202CC78009AFC3CFF82887FC1E731D9DEDE787BF669F0643768A4C5FF097
            78B61711C9DB75B582B2B63BABCCE3FDA86BF21BFE0A47FF000546F8B3FF0005
            44F8D3378B3E246B8EF636D238D17C3D68EC9A568109FE0822CF2C401BA56CBB
            E064E0003E74DC6803DF3F6B3FF82A37ED07FB705EDCB7C4FF008B5E32F1358D
            CB6F3A51BD369A4A1E7056CA1D96EA7071911E7D49AF04690B1EB4DA28014B93
            DE82726928A0029738A4A28017754DA7EA571A4DF45736B3CD6B7303078A585C
            A3C6C3A1523907E95051401F727EC61FF0714FED61FB165DDAC5A6FC4CD43C6F
            E1FB761BF43F19B36B36CEA08C22CB230B989719188A651CF4E95FB73FF04CFF
            00F83B2FE08FED837F65E17F8A96CBF04FC6B72C90C33EA177E7F87F5191B8F9
            6EF6AFD989209DB70154020095CD7F2C60E297CC3C73D3A5007F7E905DADDC09
            2C4E9245228747420AB03D083DC54AA772D7F295FF00042BFF00838E3C6BFF00
            04E8F12E8FF0EFE26DF6A3E30F8133C8B6E239775C5FF8394F1E6D9B7DE6B71C
            17B63918198B6B6E127F52FF000D3E26E83F18FE1FE91E29F0AEB1A7F883C3BA
            FDAA5F69DA8D8CCB35BDE42E32AE8C38208FCB0475A00DFA43D285395FFEB507
            A5007F1C7FF07217FCA6D7E3DFFD856CBFF4D9695F1057DBFF00F07217FCA6D7
            E3DFFD856CBFF4D9695F105001451450014B9A4A280177734945140051451400
            5145140051451401FAFF00FF0006551CFF00C1533C7A3FEA956A3FFA77D1EBFA
            7C0302BF983FF832A7FE529BE3EFFB255A8FFE9DF47AFE9F6800A28A6B36D3FC
            A8002D83FE78AE07F690FDA93E1EFEC87F0C6EBC63F12FC61A1F82BC376676BD
            EEA77022123E0911C4BCBCB21C1C471AB39C1C035F287FC16A7FE0BA7E01FF00
            8247FC3A8AC7CAB7F187C5BF10DB99742F0C4736D4823C902F2F581DD15B8208
            503E79594AA8003BA7F2B1FB6F7EDFDF15FF00E0A1DF182E3C67F157C577BE21
            D40965B3B4CF97A7E91113FEA6D6DC1D91270338F9988DCECCC4B100FDABFDBF
            7FE0F46B1D1AF6F741FD9C3C051EADE5B1897C55E2F478A07EC5A0B08D96423B
            AB4D2A1C8F9A23D2BF24FF006ADFF82D4FED45FB66DDDD0F1BFC65F17C9A65D9
            C3691A45D7F64699B3B29B7B511A3803BC819BD493935F2DEEA09C9A005795A4
            90B33166272589E49A4DD8A4A2800CE69738A4A28017754DA7EA571A4DF45736
            B3CB6D7103078A589CA3C6C3A104720D4145007D8DFB29FF00C17BFF006B2FD9
            0AEAD87877E31F89F5AD2ADF83A4F89E6FEDCB2641FC0A2E77BC4BC0FF0054E8
            7AF3C9CFEBEFEC05FF00079A7807E25DD58E81FB41F82E7F879A9CCCB13F893C
            3E24BFD1771CE5E5B76CDCDBA740361B83DCE057F37A0E28DDCD007F7ADF0A3E
            2F7863E3B78074FF0015782FC45A2F8AFC37AB47E6D9EA7A4DE47776972B920E
            C923254E08208CE4104100F15D2039AFE273FE09B1FF00055FF8C7FF0004B6F8
            9EBAF7C36F1049FD8D7932C9ACF866FD9A5D1F5C51C1F362C8DB201C2CB19591
            7A06DA594FF569FF0004A3FF0082BE7C31FF0082B27C17FEDEF06DC7F64F8AB4
            88D0788BC2977306BED12462406C8004D03104A4AA307A108D94001F585148A7
            2B4B40051451401F843FF07C57FC92CFD9DBFEC2BAEFFE8AB1AFE786BFA1EFF8
            3E2BFE4967ECEDFF00615D77FF004558D7F3C3400514514005145140057EEF7F
            C18EBFF254FF00689FFB05685FFA36FABF086BF77BFE0C75FF0092A7FB44FF00
            D82B42FF00D1B7D401FD0F514514005145140051451401F901FF0007AB7FCA2C
            BC03FF0065574EFF00D346B15FCC157F4FBFF07AB7FCA2CBC03FF65574EFFD34
            6B15FCC1500145145001451450015FAFFF00F0654FFCA537C7DFF64AB51FFD3B
            E8F5F9015FAFFF00F0654FFCA537C7DFF64AB51FFD3BE8F401FD3ED145457576
            9650492CB2245144A5DDDDB6AA00324927A0F7F6A00F903FE0B5FF00F055FD07
            FE0933FB22DDF8B265B6D4FC77E236934CF0768D23717B79B4169A4039FB3C01
            83C8475CC69953229AFE3CFE387C6DF157ED19F173C41E39F1B6B579E22F15F8
            9EF1EFB52D42E88F32E256F6002AA8002AA280A8AAAAA000057D43FF0005D8FF
            008292DDFF00C14DFF00E0A07E28F15D9DECB37817C38EDE1FF075BE488D6C21
            9187DA02F4DF71217989EBB5D149F9063E336FBD400945145001451450014528
            1914E0A300E41FA1A006514F6400535BAD002514514005287205251401ED1FB0
            4FEDCFE3CFF82767ED35A07C51F87DA81B5D6347731DD5A484FD9759B4723CEB
            3B851F7A37007BAB057521D1587F659FB00FEDCDE0CFF828BFECABE18F8ADE06
            9CFF0065EBD0ECBAB295835C68D7A9C4F673E3A3C6DC67003A9475CABA93FC36
            038AFD60FF00834DFF00E0A6575FB26FEDC117C20D7EF987807E344CB63124B2
            E21D375B0B8B49D41E019B1F6760396692024FEEF1401FD4D29C8A5A44FBB4B4
            0057C01FF07037FC164ECBFE0945FB30241E1E96D2F3E2FF008F525B4F0BD94A
            048BA7A0C2CBA8CC9D0A45B80453FEB242A305564C7DD3E38F1B697F0DBC1BAB
            F88B5DBF834AD0F41B29B51D42F673B62B3B7863692595CF65545627D857F149
            FF000557FDBFF5BFF8296FEDC7E34F8A7AA3DCC5A6EA1706C7C3D632B7FC82F4
            985985AC18E80ED25DF1C196591BF8A803C2BC75E39D67E25F8CF54F10F88754
            BFD6F5DD6EEA4BED4350BE9DA7B9BC9E462CF248ED92CCCC4924FAD64E734A4E
            4D25001451450014514E55DD400DA29DB79FFEBD1C7F9ED400DA295861A92800
            A28A280143102BE92FF825BFFC14CBC7BFF04B2FDA7F4DF883E0EB896E74C98A
            DAF88F41794ADA7882C777CD0B8E8245C968E4C651F9E54B2B7CD94BBCE2803F
            BB9FD96BF69BF097ED8DFB3E7857E267817505D4FC2DE30B04BEB29B80F1672B
            24320C9DB2C522BC6EB9F95E361DABD041C8AFE6CBFE0CF0FF0082985CFC26FD
            A1754FD9C3C4B7D9F0C7C45F3756F0D19A400586AF0C5BA58573D16E608C9C67
            FD65BA0519918D7F49919CA0EFC75F5A007535988269D5C27ED31FB417873F65
            3F803E31F88FE2FBAFB2786FC17A54FAADF38C6F748D0B79680FDE91DB6A22F5
            66650393401F9CDFF0730FFC16EAE3FE09D5F0720F85FF000DB538E1F8CBE3EB
            367FB644DFBCF0B69AC590DD8EE2E2421961FEEEC77EAA9BBF95FD4F51B8D5B5
            29EEEEA79AEAEAE6469A69A672F24CEC72CCCC792C492493D49AF46FDB27F6AD
            F14FEDBDFB4FF8D3E2A78C6E0CDAF78CB5292FA58C36E8ECE2FBB0DB47FF004C
            E1895235EFB50679C9AF31CE6800A28A2800A28A2800A29CA322908E680128A7
            05E3F1A43C1A004A28A2800A50714945007D93FF000457FF0082BAF8AFFE0931
            FB50DB6BF6D25E6A9F0EBC492C36BE32F0FC6C31A85B02C16E220C702E60DECF
            19CAEEF990B05726BFB0FF0084BF163C3FF1CFE18E81E32F0A6A96FAD786BC4F
            610EA7A65FDB93E5DD5BCC81E3719008C83D08C8390402315FC1406C57F40BFF
            00066C7FC14C2E352B4F127ECC5E2ABF6916C629BC49E0A694E4C719706FAC94
            FA6E75B845FF006AE0FA0A00FDF55E94B483A52D00733F18FE2E681F013E1578
            8FC6BE2BD461D23C35E14D3A7D5753BC97EEDBC10A1776C752700E14724E00E4
            D7F181FF00055FFF008295F8BBFE0A95FB5FEB9F11BC44F7165A3A9363E19D15
            A4DD1E85A6AB1314231C191B25E47FE2776C7CA1547EDB7FC1E73FB735C7C30F
            D99FC13F02345BB786F3E25DDB6B5AF88DB9FECDB274F262719FBB2DD1571EF6
            6477E7F9B36E1A80128A28A0028A28A0028A7840547BD0531DBA75E680194568
            EA7E15D4746D3EDEEAEF4FBEB5B5BB50D04D340E91CE08C82AC400C3041E09E0
            8AA2547F8500328A56EB4940051451400B9AFDA3FF00834BFF00E0B077FF0002
            7E365A7ECD3E3AD51A4F01F8F6E98F84A6B9724689AC4873F65427EEC37473F2
            F4139520032C84FE2DD5DD035BBCF0DEB567A8E9F71359DFE9F3A5CDB5C42C56
            4824460CAEA474218023DE803FBEE5FBB41E95F3E7FC12BBF6CF8FFE0A07FF00
            04FDF861F15F318D4BC4BA42A6B11C6A1562D4ADD9ADEF1428FBABE7C52951FD
            C653DEBE833F76803F8E3FF8390BFE536BF1EFFEC2B65FFA6CB4AF882BEDFF00
            F8390BFE536BF1EFFEC2B65FFA6CB4AF882800A28A2800A28A5032280128A523
            0692800A28A2800A28A2800A28A2803F5FFF00E0CA9FF94A6F8FBFEC956A3FFA
            77D1EBFA7DAFE60BFE0CAC5FF8DA578F4FAFC2AD447FE55F47AFE9F14E45002D
            7C89FF00059FFF0082AC787FFE0933FB22DEF8CAE63B5D57C6DAEB3E99E10D0E
            57206A57BB726590021BECF0821E4208CFC8818348A6BEB79E65B789DDD95110
            6E666380A07524F6AFE38BFE0BE7FF00052BB8FF008299FF00C1417C49E21D3A
            FDEE7E1EF8419FC3DE0E8958F92F650B90F7607F7AE650D36719D862439D8280
            3E52F8EFF1D7C5BFB4C7C5CD77C75E3AD7AFFC4DE2BF12DD35E6A3A8DE3EE927
            90F1C0000545002AA280A8AAAAA000057244E683C1A4A0028A28A0028A29CA32
            2801B453CAF1408F3400CA294F5A4A0028A28A0050715EB7FB11FEDA1E3BFD80
            3F68EF0FFC50F877AA1D3BC41A149878DFE6B7D4AD9B025B49D3F8E2914608EA
            0E194865561E474A1C818A00FEE1FF00E09D1FB7CF83BFE0A51FB26786BE2B78
            2E4F2ED357436FA8E9D23869F45BF8C013DA4BD3E646208381BD1E37030E2BDC
            C1E2BF94EFF83543FE0A5B73FB1AFEDEB67F0D35DBF29F0FFE364D0E8D2C721F
            92CB5724AD8CEBE9BDD8DBB6383E7213FEAC57F562BD3D280168A28A00FC21FF
            0083E2BFE4967ECEDFF615D77FF4558D7F3C35FD0F7FC1F15FF24B3F676FFB0A
            EBBFFA2AC6BF9E1A0028A28A0028A28A002BF77BFE0C75FF0092A7FB44FF00D8
            2B42FF00D1B7D5F8435FBBDFF063AFFC953FDA27FEC15A17FE8DBEA00FE87A8A
            28A0028A28A0028A28A00FC80FF83D5BFE5165E01FFB2ABA77FE9A358AFE60AB
            FA7DFF0083D5BFE5165E01FF00B2ABA77FE9A358AFE60A800A28A2800A28A280
            0AFD7FFF00832A7FE529BE3EFF00B255A8FF00E9DF47AFC80AFD7EFF00832B38
            FF0082A5F8F4FF00D52BD407FE55F47A00FE9FABE09FF8394BF6C893F634FF00
            824B7C42BBD3AF4D8F88FE20797E09D224462AE1EF43FDA0A91CAB2D9C776CAC
            3A305C735F7A8AFE7C7FE0F79F8F724FE33F813F0C2DE79112CECF51F145F459
            F92532BC56D6CD8F55F26EC7FC0FEB401F82849071F9D3694F0692800A28A280
            0AF42FD973F65EF1B7ED99F1D3C3DF0DFE1DE8971AFF008B7C4B71E45A5B4670
            A8002CF2C8E788E2440CEEEDC2AA935E7E066BFA59FF0083377FE09FF63F0A3F
            64CD7FE3FEAF62ADE26F89D752E93A2CD246375AE8F6929493CB6EA3CFBB8DF7
            8EE2D213401D7FFC13F7FE0D0FF807FB3F784F4FD47E3335D7C62F1B346B2DCC
            4D73358E836527076430C4C924C14E46F99C87183E547D2BEFAF067FC12DFF00
            66AF87FA6FD9747FD9FF00E0C594780AEC9E0CD3CC92E338DEE622CE46E382C4
            F535EEE169471401F3B7C47FF8248FECBBF15AC5EDF5CFD9F3E0F4FB942F9F07
            84ECAD2E40008004D0C69201C9E0375E7D2BF31FFE0A83FF00067AF807C63E06
            D53C51FB32DD5FF84BC596513DC47E10D4EFDAEF4BD5F6827C982E26632DBCAD
            FC2D2C8F193807CB04B8FDC0C7346C1401FC0DF8D3C0FAB7C37F17EA7E1FF106
            9B7BA36B9A25D4965A8585E42D0DC594F1B14923910FCCAEAC08208C8C74AC93
            D6BF70BFE0F37FF827FD87C31F8CFE07FDA0BC3B611DA5BFC41DDE1FF139886D
            59352823DF6D3B7ABCB6EAE8718E2CC1E4B135F87ADC31A004A28A2800ABDE1F
            D72F7C31AD596A7A6DCCF65A869D3A5D5ADC40E525B795183248AC3904300411
            D08AA34A1881401FDC97FC13B3F6AC83F6E0FD877E177C5687C9597C69E1FB7B
            DBE4840F2E0BD51E55DC4BC9E12E52641CE7E5E706BDA17EED7E44FF00C19A7F
            1FA4F891FF0004CDF11F82AEA7325CFC39F185D436C87A476779145729CFBDC3
            5E13F87AD7EBB0E9401F975FF076CFED8F3FECD3FF0004BBB8F0869573F67D6F
            E31EAD17873723ED9534F406E2F187AAB2C71C0C39F96E8D7F294FF7ABF66FFE
            0F55F8EEFE32FDBBBE1A7C3E8E7F32CBC0DE0F6D45D377115DEA172FE60C7626
            1B4B53EE08F4AFC6463934009451450014514A071401EDDFF04FFF00F827EFC4
            5FF82947ED17A67C36F86BA6A5D6A97486E6FAF6E58C763A35A2901EE6E2400E
            D8D7206002CCCCAAA0B100FF00493FB0DFFC1A73FB31FECC9E1AB19FC7FA55DF
            C67F18246A6EAF75B95EDF4D497186F22CA2709B3D04ED31EF91D06BFF00C1AD
            3FF04FBD37F63AFF008269787BC6777A6A45E3AF8D11A789754BB78C8985836E
            FECE801383E5881BCE031F7EE9F9200AFD2C418403B7B500787F85FF00E0993F
            B3878334C5B4D2FE00FC18B1B718CAC5E0AD357790300B1F272CD81F798927D6
            B9EF8A5FF047CFD95FE31584D6DAF7ECF9F0925FB42ED92E2CFC336BA7DD9180
            389EDD23946001D1C62BE92E949B79A00FC10FF82ADFFC19F5A1C3E0BD5BC6DF
            B2DDDEA36BA9E9F0BDCCBE03D5AF1AEA2BC55524A58DD39322CB81C473B38727
            FD6270A7F9FAD4F4E9F47D467B4BA826B5BAB591A19A1950A490BA9C32B29E43
            020820F422BFBF4C66BF978FF83BF7F601D3FF00667FDBA744F8ADE1CD3FEC5A
            07C6AB39AEB5158D7F769AD5B32ADCBF1C2F9D1CB6F273CB49E7B73CE003F22E
            8A561834940051451401D4FC13F8B9ADFC01F8BFE16F1CF86EE8D9F887C1FAB5
            B6B3A6CF8C88AE2095658C91DC6E5191DC123BD7F743FB3B7C6DD27F694F805E
            0AF885A09CE8DE38D0ECF5DB31BB7148AE61499558F1F3287C11818208C0AFE0
            DB7718AFEB43FE0D3AF8F727C68FF8236F8474CB897CEBAF877AE6A7E17772DB
            99944C2F2207D36C57B1A0FF006505007E95D7E2C7FC1E81FB654DF0C3F64BF0
            17C18D2EE5A2BBF89DAABEABABAC6D8274FD3CC6C91B8FEEC9732C4E3DED4D7E
            D2EECFAFE55FCA07FC1DC1F1EE4F8BFF00F0585D77411379B67F0DBC39A5F87E
            25570D1869223A8484638DDBAF76B77FDD807EE80003F315BAD252B7DEA4A002
            8A28A002BE9FFF0082577FC1297E23FF00C158FE3E1F0778192DF4DD274A48EE
            BC45E22BD526CB42B6662A1881832CAF8611C2A4172A725515DD7E62419FFF00
            5E2BFB2DFF00820CFEC0161FF04F2FF826C780BC36DA77D8FC5DE27B38BC4DE2
            C9244C4F26A3751AB985FF00EB847E5C00741E4938CB31201E63FB1B7FC1AE5F
            B277ECADE1BB2FEDDF0637C5AF1344A0DC6AFE2E90DC4323F5212C948B658F3D
            03248C0705DBA9FACF49FF008270FECF1A269E96B65F01BE0C5A5B459D90C1E0
            9D32344C924E144381C924FB935ECEA38A00C0A00F997E2FFF00C119FF00652F
            8E56135BF883F67DF8544CE3125C69DA041A55D370A399ED0452F01540F9F231
            C57E3A7FC165FF00E0D298BE0BFC3CD67E277ECCF75ADEB3A6E8B0B5E6A9E06D
            4653757B1C0832EF613E37CBB1467C997748406DAEEDB633FD12EDE69AFC1A00
            FE01C8C1A4AFD17FF839EBF600D3FF00618FF829AEAF77E1BD3D74FF0005FC54
            B31E2CD3208902C16971248E9796E98E0013A19028002A5C46A3A57E74B0C1A0
            04A28A2800AF5DFD833F6A8D4BF622FDB1BE1C7C57D28CA67F046B96F7F3C519
            C1BBB5DDB2E6DF3D84B034B19F690D791539791FCA803FBEDF0EEBF65E2BF0FD
            8EA9A6DCC579A76A56E9756B71136E49E2750C8EA7B82A411F5AB6CD8AF8D3FE
            0DF1F8F527ED15FF000473F815ADDC4C66BBD2F41FF8472E0B36E70DA74F258A
            EEF731DBC6DCF243035F659EA6803F916FF83A57E3F49F1DFF00E0B31F116D84
            AD369FE02B4D3FC2B63BB828B0DBACD32E3B62EAE2E7EBD7BD7E779EB5EF1FF0
            54AF1749E3BFF8297FED07AB4858FDBBE23F881D03632B1FF68CE117F040A3F0
            AF06A0028A28A0029F1C5E660004B1380077FF003FD6995F46FF00C1227E125A
            FC72FF00829F7C04F0C5FDBA5DE9DA878E34B7BD81B1B67B786E526950FB3246
            C0FD6803F6F7FE08C3FF0006A77C3AF007C1FD0BE21FED29A1C9E32F1D6BB6C9
            7D17846EA678B4CF0EA380C915C221537172171BC39F29492A118A090FEC07C2
            6FD9DFC01F01B4B8ECBC11E07F08783AD22411A43A1E8D6FA7C6ABC701624518
            E071ED5D8A8C0A51C0A004D833D2BC1FF692FF008260FECF7FB5C6837361F107
            E0F780B5E3749B0DEFF64C56DA8C43FE99DDC21278CFFB8E2BDE69319A00FE51
            7FE0E12FF837F24FF8257EAF61F10FE1E5E6A1AEFC1AF12DE8B155BD6F36FBC3
            57ACACEB6F33800490BAAB79729C1054A3FCDB5E4FCBF6E1ABFB34FF0083807E
            17E9FF00167FE08E7F1FAC3508E365D3FC3126B5033A02639AC644BB8C8F425A
            1038EC4D7F1967AD0025145140052E714945007F49DFF064FF00C7A9BC5FFB1D
            7C5BF8753CAD29F04F8A6DB578371FF530EA36EC9B07B799612B74EB2373CF1F
            B58A7295FCE27FC1913E2BFB27ED43F1C344F340FB7F856CAFBCAD8497F22ECA
            6EDD8E31F68E9919DC3AE38FE8EC1CA5007F1C9FF07217FCA6D7E3DFFD856CBF
            F4D9695F1057DBFF00F07217FCA6D7E3DFFD856CBFF4D9695F10500145145001
            5D9FECE9E1CB2F18FED03E05D2353816EF4DD57C43A7D9DDC0C48134525CC68E
            A4820F2AC47073CD7195E81FB277FC9D2FC35FFB1AB4BFFD2C8A803FADDFF886
            FBF6253FF3413C3FFF00835D4BFF009268FF00886F3F625FFA209E1FFF00C1B6
            A7FF00C935F6FD1401F107FC4379FB12FF00D104F0FF00FE0DB53FFE49A3FE21
            BCFD897FE882787FFF0006DA9FFF0024D7DBF45007C41FF10DE7EC4BFF004413
            C3FF00F836D4FF00F9268FF886F3F625FF00A209E1FF00FC1B6A7FFC935F6FD1
            401F107FC4379FB12FFD104F0FFF00E0DB53FF00E49A3FE21BCFD897FE882787
            FF00F06DA9FF00F24D7DBF45007CE7FB22FF00C125BF677FD837E245EF8BFE12
            7C32D2FC19E23D474D7D1EE6F6DAF6F27696D1E58A5688ACD33AE0C9044D9033
            F275C139FA300C0A28A00F863FE0E35FDB1E7FD8B7FE0933F12757D36E8DA788
            BC6712783747903ED749AF8324CC87A874B45BA9148E43460F1D6BF8EB63C9AF
            DFBFF83DEBE3DCDF6AF813F0BEDE72200BA8F8A6FE10DC3B1315ADAB11EC3ED8
            01FF006CE3A1AFC043D68002771A4A28A0028A29CABB876A00F48FD91FF64BF1
            D7EDC1F1F7C3FF000D3E1CE8CDADF8ABC47318E088B88E1B78D46E92799CF091
            4681999BB018009201FE92BFE09FFF00F068C7ECFDFB3A785ECB50F8C0977F19
            BC6AC8B25C2DC5C4D63A1D9498E561B78995E51C905A7760D804471F4AE73FE0
            CF4FD8034EF82BFB146A5F1CF55D387FC25FF15AF26B5D3AE251FBCB5D1AD653
            12A20232BE6DCC733B1FE358E0F4E7F6242E45007867847FE0985FB36F81F4C1
            6BA4FC00F831630103708FC17A76E93D0B31872C7DC926AA78FBFE0949FB327C
            4ED39ADB5BFD9FBE0E5E21528245F08D8C33C6A7A849638D645EBFC2C2BE80A2
            803F143FE0A79FF067DFC34F893E0BD4FC49FB35DC5CF80FC676B199E2F0BEA3
            7F25DE8BAB1033E5472CC5A6B595B9DACCEF16405DB1A9DEBFCE7FC46F86FAEF
            C22F1EEB1E17F13E937BA1F88BC3F792E9FA969D79198E7B2B8898AC91BA9E41
            520835FDEF6DAFE777FE0F3FFD8034FF0003F8FF00C07FB45787EC56D7FE1309
            7FE116F1518D30935EC51196CAE1BD6478239E36271F2DAC5D4926803F09DBAD
            252B70692800A28A2802CE95A9DC689A8DBDED9CD2DB5DDA4AB343344DB5E275
            208653D4104022BFB79FF8260FED6CBFB757FC13FF00E14FC543244F7FE2BD02
            17D53CA1844D421CDBDE2A8ECA2E62980F602BF87E0D8AFE9BFF00E0CBDF8F72
            78EBFE09E5E39F02DD4AD2CFE02F18C935B02788AD2FADE391100FFAEF15D37F
            C0FA71C807EC56FF0071451B8FFB3F9D1401F847FF0007C57FC92CFD9DBFEC2B
            AEFF00E8AB1AFE786BFA1EFF0083E2BFE4967ECEDFF615D77FF4558D7F3C3400
            514514005145140057EEF7FC18EBFF00254FF689FF00B05685FF00A36FABF086
            BF77BFE0C75FF92A7FB44FFD82B42FFD1B7D401FD0F514514005145140051451
            401F901FF07AB7FCA2CBC03FF65574EFFD346B15FCC157F4FBFF0007AB7FCA2C
            BC03FF0065574EFF00D346B15FCC1500145145001451450015FBD3FF000644FE
            CEC6E7C69F1BFE2D5C5BE058D958F8474F9F19DFE7486EAE933DB1E4599FF810
            F4E7F05C0CD7F607FF0006D2FEC92FFB237FC121FE1B5BDE5B8B7D6BE20ACBE3
            7D486DC1637C10DB93DF70B38ED14E790548ED401F7BA8C2D7F29FFF00077F7C
            427F19FF00C161EF74D69378F09783B49D250723607135E6DFCEEC9E3D6BFAB0
            5E95FC85FF00C1D31AA4F7DFF05CFF008D314B2178ECA2D0618548FF00568742
            D3E423FEFA763F8D007E7CB75A4A28A0028A28A007A2E457F6F9FF0004AEF845
            0FC09FF826C7C09F0AC51085F4AF03693F695000CDCC96B1CB70DC7F7A6790F5
            3D7A9EB5FC4103F2D7F7AFF07ADE3B3F849E168A2448A28B48B444445DAA8A21
            4000038007A500747D28A28A0028A28A00FCE6FF0083AB3E0FDBFC54FF00822E
            FC44BE9115EF3C13A8E93E21B2C81C3ADEC56B2104918C41753F4E4F4EF5FC8E
            B0C1AFECE7FE0BF70ACFFF00046DFDA0C3AAB8FF008459DB0C3382268883F504
            03F857F18A4E6800A28A2800A28A2803F793FE0C7AF1EC967F10BF686F0C162D
            1EA1A7689AA46877611A196F62623B0CFDA173C64ED5EC2BFA1653F2F7AFE69F
            FE0C97BB947EDDFF0016ADFCC7F224F01798F1EE3B199750B50AC4742406600F
            FB47D6BFA5922803F8FF00FF00839DFC7AFE3CFF0082DC7C6825F741A449A5E9
            702E41F2C45A559871C7FD35F30FAF38ED5F0257D7FF00F05F53FF001B91FDA1
            3FEC6A97FF0045475F205001451450015ADE07F095D78F7C61A568762035F6B3
            79158DBA9EF24AE1107E2CC2B26BD6FF00606B08757FDBABE0ADA5CC6B35B5CF
            8F3438A58D87CAEADA840181F620E2803FB89F00F8234EF86FE06D17C3BA4C3F
            67D2B40B1834DB28B18F2E186358E35C00070AA074ED5B140E28A0028A28A002
            BF263FE0F21F8450F8EFFE0959A5F893C926F3C0FE35B0BC130524C70CF0DC5A
            C8A78C05679613CE3945E7B1FD67AFCF6FF83A6F498751FF00821A7C669655DD
            258CDA14F09C9F95CEBBA7C64FFDF3230FC6803F90D7FBD494AC72692800A28A
            2800AFE8C7FE0C83F88726A3FB3BFC78F0A19018B46F11699AAAC7BC7CA6EEDA
            688B15C6467EC4A324E0EDC003073FCE757EF9FF00C18D9ACC50EB9FB4C69CDB
            BCFB9B7F0CDCA7CBC6D8DB5656E7D732AE3F1A00FE81B018E719E7D2BF8A1FF8
            2D0F8EE5F88BFF000568FDA3351998B98BE206B1A723120E63B5BA7B54C11DB6
            42B8F6C57F6BFB411F5E0D7F0CBFF050A62DFB7DFC7127927E206BD927BFFC4C
            6E2803C7E8A28A0028A28A00F5CFD81BE1147F1FFF006E1F83BE07B8844F69E2
            DF1AE8FA4DD232EE5304D7B147296183F28466278E80D7F73CBC8FD2BF8BEFF8
            20CE9F0EABFF000588FD9E62B841246BE2FB69829ECF1ABBA1FC1941FC2BFB42
            5E05002F4A28A2800A42B934B45007E1E7FC1EEBF0862D53F667F823E3D108F3
            B41F13DEE80D285E76DEDA79E149C7AD812327D71DEBF9C871B5ABFA93FF0083
            CC34B8350FF824CE852CA9BE4B1F88BA64F01DC46C7365A8464F1D7E5761CFAD
            7F2D54005145140052E6928A00FEA3BFE0CCDF1F1F14FF00C129FC43A5492032
            786BE216A3671C7BC3158A4B3B0B80D8C02A0BCB2819CE4AB73D87EB59E6BF15
            7FE0C96D7219FF00625F8BFA70593CFB4F1BC572E481B76CB630AAE39CE730B6
            78EE319E6BF6B1471401FC40FF00C1553C1137C38FF829A7ED03A34E1F367F11
            35DF2CBFDE9226BF99E3738FEF232B7E35E055FA8BFF0007707EC9D3FC02FF00
            82AEEA5E3282D4C7A17C5DD1ED35EB79117110BB8635B4BA8BFDFCC11CCDFF00
            5F23E83F2EDB86A004A28A2800AF65FF00827AFED250FEC7BFB6FF00C29F89D7
            51493D8782BC4F63A9DFC510CC92DA2CA05C2A8FEF184C807B915E354B9A00FE
            F9FC23E30D37C7DE14D335DD16FADB54D1F5AB48AFEC2F2D9C490DDDBCA81E29
            518705595810475041AD30722BF9B7FF00836B3FE0E21D3FF65BD2B4EF801F1D
            756961F01C9388BC25E26B96CC7E1B691F9B3BA6382B68598B2CA49F24E437EE
            B062FE9034ED4E0D5EC20BBB49E1BAB4BA8D6686785C3C73230CAB2B0C820820
            8238208C50059A2910E5696803E77FF82B4FC3CD77E2CFFC1333E3BF867C33A4
            DFEBBE21D7BC13A958E9DA7594266B8BD9DEDDD5228D072CCC4E0015FC959FF8
            229FED6E7FE6DCBE2FFF00E13573FF00C4D7F6B646680B81401FC527FC394BF6
            B8FF00A372F8BFFF0084D5CFFF001347FC394BF6B8FF00A372F8BFFF0084D5CF
            FF00135FDADE28C5007F149FF0E52FDAE3FE8DCBE2FF00FE13573FFC4D1FF0E5
            2FDAE3FE8DCBE2FF00FE13573FFC4D7F6B78A31401F801FF000691FEC05F1B7F
            647FDB47E246B3F13BE1678E7C07A4EA5E0A3656B77ADE932D9C5713FDBED5FC
            B5670016DA8C71D70A6BF7F87DCA5DB9A08C2D007F1C7FF07217FCA6D7E3DFFD
            856CBFF4D9695F1057DBFF00F07217FCA6D7E3DFFD856CBFF4D9695F10500145
            1450015E81FB277FC9D2FC35FF00B1AB4BFF00D2C8ABCFEBD03F64EFF93A5F86
            BFF635697FFA5915007F7794514500145145001451450014514500145145007F
            2C5FF078E78E9FC55FF056DB2D398B08FC33E04D2F4E51DBE79EEEE89FFC981D
            7D07A0AFCA16396AFD1FFF0083AFCE3FE0B67F11FF00EC15A27FE9B2DEBF3809
            CD0025145140053D0656994A0E05007F72BFF04EAF83D17C00FD81FE0C783228
            3ECEDE1CF05693653A904334EB69179CEC0E3E66937B1E072C781D2BD9AAB691
            A541A16936D636A9E55AD9C490429B8B6C45015464E49E00E49CD59A0028A28A
            002BF3EFFE0E83F8450FC59FF822C7C5890C067BDF0ABE9BAFD91033E53437F0
            2CADD0FF00CBBC938EDD7938CD7E8257CB1FF05BDD320D5BFE0913FB45C77118
            9117C09A9CC0127878E16910FE0CAA7F0A00FE2ADBEF52519CD1400514514005
            7EE77FC1901E3F3A6FC7CF8F7E16F3102EB3E1FD2B553193CB7D92E6E22CE31D
            07DB3939FE21C1CF1F8635FB23FF000651EB8B6FFF00051AF897A6EC3E65D7C3
            6B8BA0FD9445A9E9CA41FF00BFA3F23401FD347923FC81453B145007E117FC1F
            15FF0024B3F676FF00B0AEBBFF00A2AC6BF9E1AFE87BFE0F8AFF009259FB3B7F
            D8575DFF00D15635FCF0D00145145001451450015FBBDFF063AFFC953FDA27FE
            C15A17FE8DBEAFC21AFDDEFF00831D7FE4A9FED13FF60AD0BFF46DF5007F43D4
            51450014514500145145007E407FC1EADFF28B2F00FF00D955D3BFF4D1AC57F3
            055FD3EFFC1EADFF0028B2F00FFD955D3BFF004D1AC57F305400514514005145
            3D5723F1A00F7EFF00825CFEC597BFF0507FDBCBE1AFC29B68E6363E23D551F5
            99A3EB6BA64399AF24CFF09102385C91976419CB0AFEDC349D2EDB41D2EDAC6C
            ADE1B4B3B289208208936C70A200AA8A0700000607A0AFC40FF8333FFE09DD2F
            C3DF843E2DFDA43C4565E55EF8E37F873C2BE6A61974E86506EEE14FF765B98D
            231D08FB1BF50E2BF4234AFDBC97E227FC17165FD9F745BCDFA7FC3FF849A878
            93C4688D953A9DCEA5A3ADB44C3B3C36ACCFF4BEF6A00FB053EED7F207FF0007
            477FCA75FE39FF00DC03FF0051FD32BFAFC5E95FC81FFC1D1DFF0029D7F8E7FF
            00700FFD47F4CA00F8028A28A0028A28A0051F76BFBDBF84DFF24AFC35FF0060
            AB5FFD1295FC120FBB5FDEDFC26FF9257E1AFF00B055AFFE894A00E828A28A00
            28A28A00F8FF00FE0BEFFF00286FFDA13FEC5593FF0046C75FC61D7F679FF05F
            7FF9437FED09FF0062AC9FFA363AFE30E800A28A2800A28A2803F67BFE0C98FF
            0093FBF8AFFF0064FDBFF4E3675FD2E9EB5FCD17FC1931FF0027F7F15FFEC9FB
            7FE9C6CEBFA5D3D6803F8C3FF82FB7FCA647F684FF00B1AA5FFD151D7C815F5F
            FF00C17DBFE5323FB427FD8D52FF00E8A8EBE40A0028A28A002BD83FE09EBFF2
            7F7F03BFECA0683FFA71B7AF1FAF60FF00827AFF00C9FDFC0EFF00B281A0FF00
            E9C6DE803FB9CA28A2800A28A2800AF803FE0E8DFF009414FC72FF00B80FFEA4
            1A6D7DFF005F007FC1D1BFF2829F8E5FF701FF00D4834DA00FE40A8A28A0028A
            28A002BF77BFE0C75E7E29FED11FF60AD0FF00F475F57E10D7EEF7FC18EBFF00
            254FF689FF00B05685FF00A36FA803FA1DAFE193FE0A13FF0027F5F1C3FECA06
            BDFF00A71B8AFEE6CF5AFE193FE0A13FF27F5F1C3FECA06BDFFA71B8A00F1FA2
            8A2800A28A2803EBFF00F8204FFCA647F67BFF00B1AA2FFD15257F6783A57F07
            7FB38FED07E28FD94FE37F86BE227826F61D3BC57E12BC17FA65D4B6F1DC2412
            804026390146E09E0822BEE93FF07607EDB39FF928DE1FFF00C24B4DFF00E334
            01FD6E515FC917FC4581FB6D7FD146F0FF00FE125A67FF0019A3FE22C0FDB6BF
            E8A3787FFF00092D33FF008CD007F5BB457F245FF11607EDB5FF00451BC3FF00
            F849699FFC668FF88B03F6DAFF00A28DE1FF00FC24B4CFFE33401FAFDFF0791F
            FCA2434DFF00B281A5FF00E935F57F2C55F5F7EDC3FF0005CCFDA3BFE0A2DF05
            E2F007C56F17697ADF8620D4A2D596DEDF41B3B2717112C888DBE28D5B004AFC
            671CF4E057C84DD680128A28A0028A28A00FE8F7FE0C87F9BF65AF8DFEDE2AB2
            FF00D2435FB7C3A57E20FF00C190DFF26B5F1C3FEC6AB2FF00D2435FB7C3A500
            7E79FF00C1CA7FF04CAB9FF828E7FC13F6FA6F0CD91BCF88FF000B2493C49E1E
            8A38B7CFA8C423C5E58A7F16658D55955465A5B7857BE47F2252A18E56560559
            490411820D7F7F2466BF9ADFF83A2BFE084577FB3DFC42D5BF68EF84FA2B49F0
            F3C4971F68F17E9565093FF08D5F48DF35E2AA8F96D266396ED1CAC470B22840
            0FC56A295B86A4A0028A28A0050D8AFD1EFF00823CFF00C1C81F163FE098E2C3
            C21E20171F12FE0F44DB1740BDB9DB79A1A9232D613B67628E4F90D9889CE3CB
            662F5F9C14A18AF4A00FEDEBF608FF00829D7C16FF0082947C3FFEDCF84FE32B
            2D626B78849A8689718B6D6348278C5C5B13BD46EE03AEE8D883B5D857D000E4
            57F04DF0BBE2AF89BE0AF8E74FF13F83F5FD67C2FE22D26513596A7A55E49697
            56CE3BA488430FCF915FB31FF04ECFF83C9FC7BF0B22D3FC3BFB4578557E21E8
            E8CB13789F4248ACB5A863EEF2DBFCB6F727A7DD301C724B9EA01FD21515E0FF
            00B11FFC14BFE08FFC144BC2ADAA7C25F1FE8DE2692DD3CCBCD2CB1B6D534F1D
            3F7D6928599173C07DBB18FDD635EEEA72280168A28A0028A28A00290F4A5A43
            D2803F8E3FF8390BFE536BF1EFFEC2B65FFA6CB4AF882BEDFF00F8390BFE536B
            F1EFFEC2B65FFA6CB4AF882800A28A2800AF40FD93BFE4E97E1AFF00D8D5A5FF
            00E96455E7F5E81FB277FC9D2FC35FFB1AB4BFFD2C8A803FBBCA28A2800A28A2
            800A28A2800A28A2800A28A2803F923FF83B03FE5367F11FFEC15A27FE9B2DEB
            F37EBF483FE0EC0FF94D9FC47FFB05689FFA6CB7AFCDFA0028A28A00297B5253
            82FCB401FDFD515FC91B7FC1D7FF00B6D06FF928DE1FFF00C24B4CFF00E3349F
            F11607EDB5FF00451BC3FF00F849699FFC66803FADDA2BF922FF0088B03F6DAF
            FA28DE1FFF00C24B4CFF00E3347FC4581FB6D7FD146F0FFF00E125A67FF19A00
            FEB76BE5FF00F82D6FFCA243F68CFF00B27FABFF00E933D7F385FF0011607EDB
            5FF451BC3FFF00849699FF00C66B94F8EFFF0007287ED6FF00B4AFC18F13F803
            C5DE3BD12FFC31E30D366D2754B68FC33A7C0F3DBCAA51D43A441D49048CA904
            5007C174529EB494005145140057EBFF00FC1955CFFC1537C7DFF64AB50FFD3B
            E8F5F9015FAFFF00F0654FFCA537C7DFF64AB51FFD3BE8F401FD3E6DFAFE7452
            D1401F843FF07C57FC92CFD9DBFEC2BAEFFE8AB1AFE786BFA1EFF83E2BFE4967
            ECEDFF00615D77FF004558D7F3C3400514514005145140057EEF7FC18EBFF254
            FF00689FFB05685FFA36FABF086BF77BFE0C75FF0092A7FB44FF00D82B42FF00
            D1B7D401FD0F514514005145140051451401F901FF0007AB7FCA2CBC03FF0065
            574EFF00D346B15FCC157F4FBFF07AB7FCA2CBC03FF65574EFFD346B15FCC150
            01451450015EDBFF0004EEFD89FC47FF00050CFDB0BC13F09FC329325C789AF8
            2DFDE226E5D2EC13E7B9BA7ED88E256201FBCDB1472C2BC515770AFEA67FE0D5
            AFF82493FEC41FB2B49F173C69A67D9BE26FC5DB48A5821B88F13E87A29C4904
            04100A4939DB348B9E8205215A361401F76FC50F1DFC3BFF0082537EC05A86B1
            F668F48F87BF067C2CB1D9D923ED7963B78D6282DD58FDE9A690C71866E5A494
            124EE26BF1E7FE0D2BF0B78F7F6B4FDBF3F689FDACBC5F32B47E20B5B9D06E24
            D844775A85FDE5B5FC91C3D963B78AD615DB9E16E2203A573FFF000761FF00C1
            42355FDAAFF68BF077EC75F0ABCDD727D3F56B59BC4305812EFA96B73E12CF4E
            5C75F2965DEE391E64C80ED684D7ECCFFC12F3F610D1FF00E09B9FB0FF0081BE
            13E94D0DCDD68769E7EB37F1A6DFED4D4A63E65D4FCF383212A80E4AC691AE7E
            5A00FA0074AFE40FFE0E8EFF0094EBFC73FF00B807FEA3FA657F5F806057F207
            FF0007477FCA75FE39FF00DC03FF0051FD32803E00A28A2800A28A280147DDAF
            EF6FE137FC92BF0D7FD82AD7FF0044A57F0483EED7F7B7F09BFE495F86BFEC15
            6BFF00A252803A0A28A2800A28A2803E3FFF0082FBFF00CA1BFF00684FFB1564
            FF00D1B1D7F1875FD9E7FC17DFFE50DFFB427FD8AB27FE8D8EBF8C3A0028A28A
            0028A28A00FD9EFF0083263FE4FEFE2BFF00D93F6FFD38D9D7F4BA7AD7F345FF
            00064C7FC9FDFC57FF00B27EDFFA71B3AFE974F5A00FE30FFE0BEDFF002991FD
            A13FEC6A97FF0045475F2057D7FF00F05F6FF94C8FED09FF006354BFFA2A3AF9
            02800A28A2800AF60FF827AFFC9FDFC0EFFB281A0FFE9C6DEBC7EBD83FE09EBF
            F27F7F03BFECA0683FFA71B7A00FEE728A28A0028A28A002BE00FF0083A37FE5
            053F1CBFEE03FF00A9069B5F7FD7C01FF0746FFCA0A7E397FDC07FF520D36803
            F902A28A2800A28A2800AFDDEFF831D7FE4A9FED13FF0060AD0BFF0046DF57E1
            0D7EEF7FC18EBFF254FF00689FFB05685FFA36FA803FA1D3D6BF864FF8284FFC
            9FD7C70FFB281AF7FE9C6E2BFB9B3D6BF864FF008284FF00C9FD7C70FF00B281
            AF7FE9C6E2803C7E8A28A0028A28A005CE29339A28A0028A28A0028A28A0050C
            40A42734514005145140051451401FD1EFFC190DFF0026B5F1C3FEC6AB2FFD24
            35FB7C3A57E20FFC190DFF0026B5F1C3FEC6AB2FFD2435FB7C3A5002D51D7F43
            B1F1368D79A6EA5676DA869FA8C0F6B776B7312CB0DCC5229578DD1815656524
            1523041C1ABD48573401FCCB7FC17EBFE0D9FD6FF650D5B5DF8C7F00F48BCD7B
            E14C85EFF59F0E5AAB4D7BE0E1CB3C91AF2D3592F27232F0AFDE0514C83F1BD9
            769AFEFE768F4AFC75FF0082CC7FC1A9BE0DFDADEFB55F88BF005F49F877F116
            E37DCDEF87E44F2B41F104BD4940A3FD0E76E7254189DB19442CF2D007F31E69
            2BBEFDA37F662F1F7EC8BF152FFC13F12FC25ACF837C51A6B7EFAC3518763329
            FBB246E3292C6DFC3246591BA826B823D680128A28A005CD1B8D251401B7F0FB
            E23F883E13F8C6C3C43E17D7357F0E6BFA54826B2D4B4CBC92D2EED1FA6E8E58
            C86538E320D7ECBFFC1303FE0F08F1DFC1E7D37C27FB4869527C42F0DA95853C
            55A6451C3AED92E40CCF10DB0DD281DC7972F525A5635F89D9A33401FDD77ECA
            9FB627C34FDB77E145B78D7E15F8CB46F19787AE308D3D9487CDB49319314F0B
            0124120183B24556C10718209F4C0722BF85BFD8FBF6D9F8A3FB067C59B6F1B7
            C29F176A9E13D6E2C24DF676DF6BA8C59CF9373036639E33FDD75201008C1008
            FE9B3FE08BBFF0728FC3BFF82948D33C05E398F4FF00871F1A1D1624D3CCB8D2
            BC48E0004D848EC5964279FB3484B81F75A5C31500FD39A2914E452D001487A5
            2D21E9401FC71FFC1C85FF0029B5F8F7FF00615B2FFD365A57C415F6FF00FC1C
            85FF0029B5F8F7FF00615B2FFD365A57C414005145140057A07EC9DFF274BF0D
            7FEC6AD2FF00F4B22AF3FAF40FD93BFE4E97E1AFFD8D5A5FFE9645401FDDE514
            5140051451400514514005145140051451401FC91FFC1D81FF0029B3F88FFF00
            60AD13FF004D96F5F9BF5FA41FF07607FCA6CFE23FFD82B44FFD365BD7E6FD00
            1451450014B9E2928A00339A28A2800A28A2800A50C41A4A2800CE68A28A0028
            A28A002BF5FF00FE0CA9FF0094A6F8FBFEC956A3FF00A77D1EBF202BF5FF00FE
            0CA9FF0094A6F8FBFEC956A3FF00A77D1E803FA7DA28A2803F087FE0F8AFF925
            9FB3B7FD8575DFFD15635FCF0D7F43DFF07C57FC92CFD9DBFEC2BAEFFE8AB1AF
            E786800A28A2800A28A2800AFDDEFF00831D7FE4A9FED13FF60AD0BFF46DF57E
            10D7EE7FFC1901AEFD9BE3CFC7CD37CBF9AEFC3FA55D0933F77CAB8B85C63BE7
            CEFF00C76803FA2DA2901E296800A28A2800A28A2803F203FE0F56FF00945978
            07FECAAE9DFF00A68D62BF982AFE9DBFE0F58D4A18FF00E098DF0F2CD9C7DA27
            F8A1653469FDE54D27550C7F0322FE75FCC530C1A004A7A2861FA75A657D2DFF
            0004AAFF00826778D3FE0AA1FB56693F0EFC2CB2D8E93115BDF126BA613241A0
            D80602495BB19187CB14648DEE40C850CCA01F5C7FC1B21FF04656FF0082837E
            D1C3E2778F34C327C1EF8677D1CD2433A7EEBC4BAA2E248ACC0230D0C7F2C937
            AA948CFF00AC257F7B3FE0B61FF0549D1FFE0953FB156AFE31F32CEEFC79AF07
            D23C1BA5CDF37DB35065FF005CE9D4C102FEF64E80E113706916BD6FE1F780FE
            147FC12DFF0062F834BB26B1F04FC2CF859A2BCB717570DFEAA18D4BC93CAC06
            659A46DCCC402D248F8009602BF9B4F18F89FE25FF00C1D57FF0584B3D3AC86A
            7A07C35D2494B643F3C7E10F0EC72AF9B70E394379392B9EBBA59234CF97182A
            01F50FFC1A61FF0004D8D63E3BFC68F117ED87F1485DEB3225F5DC1E15B9D4BF
            7D26ADAA4ACFF6ED518B724C659A347E8649263C3442BF702EFF006B3F0BDBFE
            D99A67C0D8E6FB478CEFBC1B7BE38B88A3718B0B182F6CECE3320EA0CD25D49B
            3DAD65CF6CF3FF0012BE20FC2DFF008252FEC2F73ABDCC56FE16F865F0974048
            6DACED97E731C4A238608C120BCF2C851016397924CB1C926BF18FFE0D88FDA2
            BE21FF00C142FF00E0B77FB407ED01E2BB29E48358F045C595CC9192F67A219F
            52D39AC34F4271F2ADBD94C13BB0B7763F3124807F418BD2BF903FF83A3BFE53
            AFF1CFFEE01FFA8FE995FD7E29CAD7F207FF0007477FCA75FE39FF00DC03FF00
            51FD32803E00A28A2800A28A280147DDAFEF6FE137FC92BF0D7FD82AD7FF0044
            A57F0483EED7F7B7F09BFE495F86BFEC156BFF00A252803A0A28A2800A28A280
            3E3FFF0082FBFF00CA1BFF00684FFB1564FF00D1B1D7F1875FD9E7FC17DFFE50
            DFFB427FD8AB27FE8D8EBF8C3A0028A28A0028A28A00FD9EFF0083263FE4FEFE
            2BFF00D93F6FFD38D9D7F4BA7AD7F345FF00064C7FC9FDFC57FF00B27EDFFA71
            B3AFE974F5A00FE30FFE0BEDFF002991FDA13FEC6A97FF0045475F2057D7FF00
            F05F6FF94C8FED09FF006354BFFA2A3AF902800A28A2800AF60FF827AFFC9FDF
            C0EFFB281A0FFE9C6DEBC7EBD83FE09EBFF27F7F03BFECA0683FFA71B7A00FEE
            728A28A0028A28A002BE00FF0083A37FE5053F1CBFEE03FF00A9069B5F7FD7C0
            1FF0746FFCA0A7E397FDC07FF520D36803F902A28A2800A28A2800AFDDEFF831
            D7FE4A9FED13FF0060AD0BFF0046DF57E10D7EEF7FC18EBFF254FF00689FFB05
            685FFA36FA803FA1D3D6BF864FF8284FFC9FD7C70FFB281AF7FE9C6E2BFB9B3D
            6BF864FF008284FF00C9FD7C70FF00B281AF7FE9C6E2803C7E8A28A0028A28A0
            028AF44FD94BF668F117ED8BFB43F84BE18F84DB4E8FC49E34BE5D3F4F6BF99A
            1B612956237BAAB155F94E48535FA37FF106EFED6E7A6A3F07F1FF006315CF3F
            F92B401F941457EAFF00FC41B9FB5BFF00D047E0FF00FE14573FFC8B47FC41B9
            FB5BFF00D047E0FF00FE14573FFC8B401F941457EAFF00FC41B9FB5BFF00D047
            E0FF00FE14573FFC8B47FC41B9FB5BFF00D047E0FF00FE14573FFC8B401F9414
            57EAFF00FC41B9FB5BFF00D047E0FF00FE14573FFC8B47FC41B9FB5BFF00D047
            E0FF00FE14573FFC8B401F941457EAFF00FC41B9FB5BFF00D047E0FF00FE1457
            3FFC8B47FC41B9FB5BFF00D047E0FF00FE14573FFC8B401F941457EAFF00FC41
            B9FB5BFF00D047E0FF00FE14573FFC8B47FC41B9FB5BFF00D047E0FF00FE1457
            3FFC8B401F6F7FC190DFF26B5F1C3FEC6AB2FF00D2435FB7C3A57E6CFF00C1B7
            3FF04A0F8A1FF04A1F829F127C3DF13EE3C2D3DFF8B35CB6D42C8E877F25DC62
            28E031B6F2F1464364F400D7E9329CAD002D1451400526334B450078E7EDA1FB
            03FC25FF0082827C316F097C59F05E97E2BD3503B59CF2AF977BA5C8C31E65B5
            C2E2485FA7DD601B00302383F801FF000533FF0083407E267C077D43C51FB3E6
            A73FC56F0AAB3CC7C3D7A63B6F1158C7D7087E58AEF03FBA23909C0589ABFA61
            C51B45007F035E34F02EB3F0DBC577DA1788B48D4F40D734B94C17BA7EA56B25
            ADD59C83AA4913A87461DC30079ACA6E0D7F701FB6DFFC1337E077FC1437C33F
            D9BF167E1EE8BE259E28C25AEAA10DB6AB600138115DC456655C9C94DDB1B1F3
            29AFC2AFF82937FC19D3F107E0D47A8F89FF00677F1037C4BF0FC01A73E19D59
            E3B6D7EDD064ED8A51B60BBC0078C42E780A8E6803F14E8AD9F1E7C3ED73E167
            8C750F0EF89B45D57C3DAFE9131B7BED3753B57B5BBB394754922701D5BA7040
            3CD63B0C1A004A28A2801436054B677D369F7714F04B2413C0E248E58D8ABC6C
            0E4302390411C1ED50D2E6803FA1EFF8378FFE0E6697E24EA1A1FC0AFDA375A5
            FEDD9CAD8F85BC717D2E3FB4DC9C259DFB9E04C721639C91E670AFF390F27EEE
            29C8AFE022373195604820F041E9F4AFE9DFFE0D73FF0082DEDDFEDB3F0E1BE0
            5FC50D5DAEFE28F822C7CED1B54BA94B4DE28D2E3C29F319B97BA832031CEE92
            321B0CC923900FD81A43D28072283D2803F8E3FF008390BFE536BF1EFF00EC2B
            65FF00A6CB4AF882BEDFFF008390BFE536BF1EFF00EC2B65FF00A6CB4AF88280
            0A28A2800AF40FD93BFE4E97E1AFFD8D5A5FFE96455E7F5E81FB277FC9D2FC35
            FF00B1AB4BFF00D2C8A803FBBCA28A2800A28A2800A28A2800A28A2800A28A28
            03F923FF0083B03FE5367F11FF00EC15A27FE9B2DEBF37EBF483FE0EC0FF0094
            D9FC47FF00B05689FF00A6CB7AFCDFA0028A28A0028A29EAA08FE7400CA2BF57
            FF00E20DDFDADCF4D47E1063FEC62B9FFE45A3FE20DCFDADFF00E823F07FFF00
            0A2B9FFE45A00FCA0A2BF57FFE20DCFDADFF00E823F07FFF000A2B9FFE45A3FE
            20DCFDADFF00E823F07FFF000A2B9FFE45A00FCA0A2BF57FFE20DCFDADFF00E8
            23F07FFF000A2B9FFE45A3FE20DCFDADFF00E823F07FFF000A2B9FFE45A00FCA
            0A2BF57FFE20DCFDADFF00E823F07FFF000A2B9FFE45A3FE20DCFDADFF00E823
            F07FFF000A2B9FFE45A00FCA0A2BF57FFE20DCFDADFF00E823F07FFF000A2B9F
            FE45A3FE20DCFDADFF00E823F07FFF000A2B9FFE45A00FCA0AFD7FFF00832A7F
            E529BE3EFF00B255A8FF00E9DF47AE7FFE20DCFDADFF00E823F07FFF000A2B9F
            FE45AFBEBFE0DD1FF82067C72FF82577EDB5E28F883F132EBC093E85AC7822EF
            C3D02E89AACD7771F6996FF4FB85CA3C31809B2DA4C9CF52A31CE4007ED1D151
            EE3EADF97FF5A8A00FC47FF83DD3C262FBF656F825AE79593A6F8AEF6C7CCDE7
            2A27B30FB76F439FB3F5EDB47A9AFE70186D6C57F569FF00077D7C287F889FF0
            479D4358552C3C07E2FD235D6619FDD8732E9F938ED9BE039F5F5C57F296DF7A
            80128A28A0028A28A002BF64FF00E0CA7F8809A2FF00C142FE257876490A7F6E
            F8025BB8D70312496DA8598033D73B6773C71807DABF1B2BEDEFF8374BF69AB6
            FD963FE0B01F07F58D46E05BE8FE22D424F0ADF3336D5DBA844F6D09639C055B
            8781893C00A738EB401FD8EA9C8A5A44FB8296800A28A2800A28A69EB401F87B
            FF0007BD78F934EFD9ABE05F85CBA89758F136A1AA2A1C6596D6D638891CE783
            78BDB1F30C9E95FCE430C357EC1FFC1E69FB4DC5F147FE0A17E0FF00873653A4
            D6FF000BBC30A6F02B730DFDFB89E4423FEBDD2CCFFC0CFA57E677EC77FB1B7C
            41FDBC3E3CE8FF000E7E19F87EE75EF11EB0FF00C395B7B080101EE6E64C1114
            299059CFA8003332A90093F62CFD8CBC79FB7DFED15E1FF861F0E7493AA788F5
            F94FCF21296BA740BCCB75712007CB8635E59B04938550CCCAA7FB09FF00825A
            7FC132FC05FF00049DFD952C7C0BE17F2AEB519116FF00C51E229E311CFAF5F0
            401E6627FD5C2BC88E2C911A77662EEFCDFF00C11FFF00E08FDE00FF0082497C
            021A168290EB7E38D712397C53E29921DB71AACC3911460E4C56D1924471E7B9
            66258963F951FF000728FF00C1C1FF00F0B767D57F668FD9F3579AFF004DBA95
            B4BF19F88F4BFDE7F6D3B1D874AB265C9788B12B2C89FEB4FEED494DFE600793
            7FC1C17FF0584F11FF00C15A3F695D2BF667F8022F35FF0000DA6B7169D1FF00
            65B166F1E6AFBF62B29C85369139FDDE4EC620CC5B688CA7ED27FC112FFE092F
            A07FC1257F649B6F0DAFD9353F887E27F2F51F196B5127FC7E5D053B2DE23F7B
            ECF006644071B89924C299081F32FF00C1B63FF041A4FF00827C7C3D87E30FC5
            4D3237F8D3E2AB3C5958CE809F0658CAA3F70011917922922561F754F943FE5A
            17E1FF00E0E91FF82E745FB317C3CD47F675F855ACA7FC2C8F155A797E2BD4EC
            E5FDE78634E9579B6465FBB7770879FE28E162D80D2C6EA01F13FF00C1C6DFF0
            54BD6BFE0ABBFB62787BF66EF822D71E23F05F86B5C4D36DD74E7DC3C61AFBB1
            83CD420ED6B78773471B7DD24CD26E28C847EE77FC11EBFE09A3A1FF00C12BFF
            0062AD07E1DD91B6BDF12DD37F6B78AB55894E353D4E4451215279F2A30AB146
            303E48C12373313F9F9FF06A6FFC11364FD9D3C096BFB49FC4ED28C3E3AF1659
            15F0669B731FCFA1699327378C0FDDB8B943851D5203D73332AFECA695E36D2B
            5ED7F55D2ECAFEDAE750D0DA24D42189F7B59BCA82444931F758A157DBD76B29
            E8C0900D641B5457F207FF0007477FCA75FE39FF00DC03FF0051FD32BFAFC5E9
            5FC81FFC1D1DFF0029D7F8E7FF00700FFD47F4CA00F8028A28A0028A28A0051F
            76BFBDBF84DFF24AFC35FF0060AB5FFD1295FC120FBB5FDEDFC26FF9257E1AFF
            00B055AFFE894A00E828A28A0028A28A00F8FF00FE0BEFFF00286FFDA13FEC55
            93FF0046C75FC61D7F679FF05F7FF9437FED09FF0062AC9FFA363AFE30E800A2
            8A2800A28A2803F67BFE0C98FF0093FBF8AFFF0064FDBFF4E3675FD2E9EB5FCD
            17FC1931FF0027F7F15FFEC9FB7FE9C6CEBFA5C66C67DA803F8C4FF82FB7FCA6
            47F684FF00B1AA5FFD151D7C815F5FFF00C17D8FFC6E47F684FF00B1AA5FFD15
            1D7C814005145140057B07FC13D7FE4FEFE077FD940D07FF004E36F5E3F5EB1F
            B076AB0E83FB70FC19BFB96296D65E3AD1279582962A8B7F031381C9E01A00FE
            E928A41D296800A28A2800AF803FE0E8DFF9414FC72FFB80FF00EA41A6D7DFF5
            F9E7FF00074EEB91697FF043AF8C36F2AC84EA573A15B4454642B0D6EC65CB72
            38C46C3EA47E001FC87D14AC30692800A28A2800AFDDEFF831DBFE4A97ED13FF
            0060AD0FFF00475F57E10D7EFC7FC18D3A6432EA3FB4DDE327FA4411F85E147C
            9E11CEAE587A72513F2F73401FD01E738AFE193FE0A13FF27F5F1C3FECA06BDF
            FA71B8AFEE673D3F957F0CFF00F050D431FEDFBF1C9581523E20EBC0823047FC
            4C6E3B50078F5145140051451401F5FF00FC1024FF00C6E43F67BFFB1AA2FF00
            D15257F6782BF8BAFF0082106AF0689FF0585FD9E66B8DC11FC636B6E368CFCF
            2EE8D3FF001E75FD6BFB4553F2D002D145140051451400D66C1A15B2B5F945FF
            000791AFFC6A4B4D3DFF00E13FD2C7FE4B5F57F2C6589A00FEFEB751BABF805D
            D46EA00FEFEB751BABF805DD46EA00FEFE1864FD7AFBD1BB1E98F5AFC57FF832
            53448A1FD897E2FEA5B9CCD75E388ED994E36858AC206523BE7329CFD07BD7ED
            4EDCF6E4F5A00556E28DD5FC327FC1425BFE33EBE387FD940D7BFF004E3715E4
            1BA803FBFADD46EAFE017751BA803FBFADD485BE6FE55FC036EAFAFBFE081473
            FF000590FD9EFF00EC6B8BFF0045C9401FD9DAFCC3D69420140E94B401F2FF00
            FC148BFE0913F04BFE0A89E067D3BE23F86624F115B4061D33C55A605B7D6B4A
            EA4049B07CC8C124F932868CE49DA0E0D7F2FDFF000573FF0082177C59FF0082
            4CF8C7ED5AD43FF097FC33D427F2B4AF18E9D6ECB6CCC7EEC1751E58DB4FE8AC
            4ABF3B1DB0C17FB202B9AE7FE287C2FF000EFC68F87DAB784BC59A2E9BE22F0C
            EBD6CD67A8E997F6E27B6BC85BAA3A1E0FB770402391401FC12B0C35257E877F
            C1C0DFF044CBEFF8250FC7AB6D5FC2FF006ED4BE0D78EE691BC3F7B3B1965D22
            E065DF4DB87EECAB968DCF32460F568E435F9E47AD00251451400A0E2BBCFD99
            7F68AF147EC97F1FBC23F12FC197BF60F147833528B52B195B3E5BB21E629002
            3746EA591D73F323B0EF5C152EE22803FBAFFD8F3F69FD07F6CEFD977C09F14B
            C32EA747F1C68F06A71C61F7B5A48EB896DD8E07CF14A2489BB6E8DABD2F395A
            FC67FF00832DFF0069AB8F891FB0B7C43F865797325CCBF0CBC4C979668E722D
            ACB528DA44894761F68B6BC7FACA6BF65F75007F1C9FF07217FCA6D7E3DFFD85
            6CBFF4D9695F1057DBFF00F07209CFFC16CFE3DFFD856CBBE7FE619695F10500
            1451450015E81FB277FC9D2FC35FFB1AB4BFFD2C8ABCFEBA6F835E348FE1B7C5
            DF0AF88E68CCD0E81AC5A6A3246A79758664908FC42D007F7AD4557D2355B7D7
            74AB6BDB4992E2D2F2259E0950E56546019581F42083562800A28A2800A28A28
            00A28A2800A28A2803F923FF0083B03FE5367F11FF00EC15A27FE9B2DEBF37EB
            F48FFE0EC181A3FF0082D8FC442CAC049A4688CA48C6E1FD9B00C8FC411F81AF
            CDD3D680128A28A00294360525380E2803FBFAE94554D075987C45A259EA16C5
            9ADEFA04B888B0C128EA19723B70455BA0028A28A0029ACC4353ABE5FF00F82D
            60C7FC1247F68DFF00B27FAB7FE933D007D3EAD91D68DD5FC029624F5346EA00
            FEFEB751BABF805DD46EA00FEFEB75359BE6E9FF00D7AFE01F757EC87FC1945A
            2ADC7FC1473E25EA25D8496BF0DEE2D9531C309354D39893F4F287E66803FA67
            DF1FAAD14DDC3FE7A51401E15FF0546FD9CA4FDAD7FE09DDF19BE1EDB41F6AD4
            7C49E13BE8B4D8B1F7EFA388CD6A3FEFFC7157F100E30E7EB5FDFBBF5AFE32BF
            E0BC9FB16C9FB0AFFC1527E2878522B3FB2787B5CD41BC51E1EDAA4446C2F8B4
            CA91F03E486432C1D3ADB9E4F5201F1DD14AC30692800A28A2800AB3A66A371A
            4DEC175693CF6D756B209A19A190C7242EA72ACAC390C080411C8C556A50C47F
            3A00FECB7FE086BFF0549D23FE0A91FB10683E2292FEDBFE162F85E08748F1AE
            9C085961BE54C0B909DA2B90A65423804BA6498DABECD56DCBFE79AFE19BF620
            FDBAFE267FC13C7E39D8FC43F859E209343D76D90C17113A09ACB54B6620BDB5
            CC27E59626C0E382A42B2B2BAAB0FE81BF625FF83CA7E097C52D06C74FF8DBE1
            BF107C2CF118554BBD434FB67D6744908E0C8BE583751E4E4F97E549B471E639
            E4807ECA515F23F837FE0BC3FB1EF8EB4C17565FB437C378623838D4351FECE9
            067FE99DC2C6FF00F8ED5DD6BFE0B8FF00B21E83A79B99BF689F856F18FE1B7D
            6E3B893FEF88F737E9401F55D7917EDCDFB68782BFE09FDFB3178A7E29F8F6FA
            3B5D17C3B6ACD0DB07027D5AE98110D9C00FDE9657C281D00DCCD855623E02FD
            AE3FE0EFAFD983E05E8D7717C3CFF849BE316BEAACB6F169B632697A6F980702
            5B9BA4470B9FE28A197E9DEBE35F85FF00B137ED51FF0007447C62D13E28FC79
            BCB9F84DFB3C695233E81A6D9C2613750B6378D3E0932D23C8000F7D382BFF00
            3CD5D57CA500FCEFFD9F7F649F8E7FF05FDFDBF3C61ACE83A779BAAF8B358975
            BF13EBD75BC691E19866918A8924C138450238A15CBB08C0030AC57FA91FF825
            CFFC129BE17FFC1263E037FC22FE08B5FB5EB5A8A4737897C4F7A805F6BB3A03
            F3BF24450A65BCB854ED4049259D9DDBB7F83FF057E0B7FC12C7F651934BD02D
            7C3BF0CFE19F83AD5EFAFEF2E261147C050F75733B9DD2CCF8505DC9663B1474
            55AFE7EFFE0B73FF00071EF8C3FE0A2DE229FE06FECEF6FAF69BF0DF5ABA5D26
            7BBB58241ADF8F1E46F2C40912FCF1DAC8480B081E64B91BF018C2003D6FFE0E
            22FF00839447C45B7D6BF67EFD9BF599E4D3A777D37C57E32D39F9D4813B1EC7
            4E75393131CAC93AFF00ACFBB1E50967F65FF8370FFE0DCD1FB34268BF1FBE3C
            68E0FC47754BCF0AF85EF138F0B29195BBB94FF9FDC10510FF00C7B83923CDC0
            876BFE0DF7FF00836A6C3F6428F45F8D1F1E74CB4D5BE2AFEEEFB40F0EBFEF6D
            7C204AE564987DD96F4678EA9091952CE03AFD29FF0005C6FF0082ECF837FE09
            41F0A64D1F48974BF14FC6AD7ED89D13C3A66DE9A6AB038BEBE0A43240BFC09C
            34CC0AA9550EE8018FFF0005FAFF0082E8E87FF04A9F83EFE17F0A5C59EABF1C
            FC596664D0F4F78BCE8B44B76664FED1BA5CE300AB88E339F31D790515EBF2DB
            FE0DD0FF0082276BDFF0518F8DD2FED2DF1F21D4B59F005B6A6FA8D8C5AC3BC9
            378F355126E69E52DCC9691C9B8BB1389241B3E655945709FF00046FFF008243
            7C4BFF0082E9FED4DA9FC77F8EDA96B57FF0D0EAE6EF5DD66F9DA3B9F19DD21E
            6C2D4A95D90280A8EF1E1624511C6030FDDFF453FB55FED49F09FF00E0959FB2
            0DCF8ABC4ADA6F84FC0DE0CB14D3F48D1F4F85226BB7442B6FA7D940300C8DB7
            0AA005550598AA2B3000E07FE0B09FF0550F097FC126FF00649BDF19EA7F66D4
            3C5FAB87D3BC1FE1F2F87D5EF82641201C8B78415795C6001B501DF246A7CFFF
            00E0DC7F0DF8AAFBFE09ABA6FC4BF1EDFDDEA9E3BF8E7E20D4BC7DADDE5D7FAC
            9DAE2416F6E47609F65B5B728A30AA8CA14002BF9BEFDA4BF69FF8ABFF0005F9
            FF008299F875353678750F1D6B76DE1BF0CE8F1399AD3C316124D808BC2E446A
            CF2CB2900B10EC703007F623F087E17E93F04BE137863C17A0C1F66D0FC23A4D
            AE89A743FF003CADADA158625E38E11147E1401D10E95FC81FFC1D1DFF0029D7
            F8E7FF00700FFD47F4CAFEBF6BF902FF0083A3BFE53AFF001CFF00EE01FF00A8
            FE99401F005145140051451400A3EED7F7B7F09BFE495F86BFEC156BFF00A252
            BF8241F76BFBDBF84DFF0024AFC35FF60AB5FF00D129401D0514514005145140
            1F1FFF00C17DFF00E50DFF00B427FD8AB27FE8D8EBF8C3AFECF3FE0BEFFF0028
            6FFDA13FEC5593FF0046C75FC61D0014514500145145007ECF7FC1931FF27F7F
            15FF00EC9FB7FE9C6CEBFA5B7EBEFF00D2BF9A4FF83263FE4FEFE2BFFD93F6FF
            00D38D9D7F4BB8A00FE41FFE0E85F0049E05FF0082DBFC607612FD9F5C5D2754
            B6693AC8AFA55A2B90700604A92A8C67EEE09CE6BF3F2BF6ABFE0F5EF800DE13
            FDB3FE157C4886164B4F1A784E5D1A6600ED92E74FB9676627FBC62BE8463D23
            FAD7E2B31CB500251451400569784BC4975E0BF1369BAC59384BCD2AEA2BDB76
            C91B648DC3A9C820F503A106B369EBCAD007F7B9F0BFE2069FF167E1A787BC55
            A4C826D2BC4DA65B6AB6520390F0CF12CB19FC55C56ED7E5EFFC1A9FFF000511
            B0FDAE7FE09CFA57C39D46F93FE13AF82489A0DD5BC8DFBCB9D2BE63A7DC20FE
            E2C63ECE7A906DB271BD73FA82A72B400B451450015F91BFF0796FC6287C0BFF
            0004BFF0FF0085848BF6DF1CF8DACE0116EC136F6D05C5C48FEE048B6E3FE063
            D2BF5C0B61EBF962FF0083B73FE0A1161FB5B7EDF761F0E3C377C97DE18F8236
            B3E9534D13868AE3589D91AFB69039F2FCA82020E712412E383C807E51B0C1A4
            A53494005145140057F473FF0006447C3F974CFD983E3978ACA1106B3E28B0D2
            91F6F0CD6968D2B0CF5C817ABF98F5AFE721578AFEB7BFE0D55F80327C0BFF00
            8235781AF2EA06B5BDF881A96A3E2A9D1860ED966FB3C0DEE1ADED60707D1C50
            07E8C9E057F157FF0005B7F87B27C31FF82B9FED15A6CA851AE3C77A9EAAA0E7
            EEDECC6F17A81C6D9C638C7A13D4FF006ADB7239AFE553FE0EFAFD9F5FE137FC
            15B6EBC549095B3F89BE19D3B591201F234F021B09133FDE0B69131FFAEA0F53
            401F96069295B834940051451401EA5FB117C624FD9E7F6C9F84DE3D95CC76FE
            0CF18E93ADCE7715062B7BC8A57048EC55483EC4FAD7F75113892356520AB0C8
            23A115FC03A9DBFF00EAAFEC43FE0DE5FF008287E9FF00F0505FF826BF836E25
            D412E3C73F0F2D20F0AF8AADDDC19C4F6F18486E9867256E21549376002FE728
            E50D007DD54520E94B4005145359B69FE5401F939FF0795EA10D9FFC1263458E
            59023DDFC44D322854FF00CB47FB1DFBE3FEF9463F857F2D27AD7EFDFF00C1EC
            3FB60E9BA8AFC25F815A75E4571A8D8CF378CF5C851F3F63CC6D6D62180E3732
            BDE3609042EC38C38AFC046396A004A28A2800A28A7AA82326803FA94FF8336B
            E1E3F83BFE0933AB6AB247B4F8B3C7DA96A31C85465A28EDACED40CF5203DBC9
            D7B96AFD641DABE45FF820CFECFF0027ECD3FF000483F811E19B981EDAF67F0D
            A6BB751C8BB6449751964D4195C75DCBF690A41E9B71818C57D724F3401FC32F
            FC1427FE4FEBE387FD940D7BFF004E3715E3F5F407FC157BC14FF0EFFE0A79FB
            42E8ECACAB6BF1175E30EE39630BEA133C44FB94653F8D7CFF00400514514005
            7D81FF00040A1FF1B8EFD9EFFEC6A8BFF45C95F1FD7B87FC1357E3B59FECC9FF
            000501F82FE3ED4AE3ECBA4F85BC67A5DF6A52EE2BE5D9ADCA0B839047FCB232
            75E3D72091401FDC5AF4A5A64132DC42B246CAE8E032B29C8607A114FA002931
            4B45007C53FF00070E7C06D0BE3EFF00C11EFE365AEB702B3F863437F1469B3E
            C0CF697963FBF465CF4DCAAF131EBB2571DEBF8DA6FBD5FD8D7FC1C6FF001E34
            DF809FF0472F8CF717D7114575E29D297C2FA742C46FBBB8BD95212883B9584C
            D21FF66263DABF8E56E1A80128A28A0028A28A00FDB9FF008322FC58D67FB597
            C6BD0F74DB751F095A5F150A3CB260BC08093D73FE9271818C16CF415FD21019
            15FCECFF00C18F9E0F9EF7E357ED03AFA93F66D3344D1F4F906D07E7B89EEA45
            E7391C5ABF6EFD46003FD130E9401FC8DFFC1D51F0E24F03FF00C16D3E285D98
            8436FE27B1D1756B60102A95FECCB6B776E09CE65B7909271C93C773F9D27AD7
            EDEFFC1ED9F0025F0FFED47F073E274508FB2F8A7C3573E1C9DD131FBEB1B933
            A973FDE64BFC0CF3888FA57E2131C9A004A28A2800A721C7EB4DA5CD007F5CDF
            F06CA7FC143F4FFDB87FE09A9E18D02EF50597C77F07EDA0F0A6BB6EEFBA636F
            1215B0BA39E4AC96E8AA58F59209BD327F4501E2BF890FF825FF00FC149BC73F
            F04B5FDA9F4BF895E0C2B7D005FB0EBDA2CF214B6D7B4F765325BB900EC6CAAB
            2480128EAA70CBB95BFAE0FF008274FF00C154FE0EFF00C14F3E155BF883E1A7
            892D5F558E00FAAF866FA448759D11F8DCB3C1927664E04A9BA36FE162410003
            E90A29A1A941C8A005A28A2800A28A2800A28A2803F96AFF0083C9BE1EC9E13F
            F82AF693AB90C61F14F80F4EBC57E76EF8EE2EED997A0E40850E067EF0E79C0F
            C996E1ABFA0EFF0083DE7E004975E18F815F14ADA26F2ECEEF51F0AEA12E320B
            4C91DD5A28F4E21BD3EFC7A57F3E2DD680128A28A0029CA78FF1A6D2E6803FB8
            9FF8267FC678BF684FF827A7C13F19452899F5EF056953DC90C5F65C8B58D274
            27A92B32C8A7DD4D7B8A9CAD7E2BFF00C19C5FF050FD3BE27FECB1ADFECF3AE6
            A289E29F871753EAFA0C32C801BCD1EE640F22A0272C60BA9242DE8B75080383
            8FDA84FBB400B451450015F2C7FC16EF51874CFF0082467ED14F3C8B12378135
            38416EEEF09441F8B301F522BEA7AFCBDFF83B4FF6BFD33F67BFF82576B1E061
            7889E27F8C3A85BE89616CAFFBDFB2413457579363BA048D2263D8DD27AD007F
            28CDD69295B86A4A0028A28A002BF75FFE0C7EF013DF7C61FDA03C51E5FC9A5E
            8DA3E97BF03ADCCF732E077FF975EDED9ED9FC2A500E2BFA7DFF008333BF67E6
            F873FF0004D9F14F8E6E6DBCAB9F88FE2F9DEDA52B8F3ACECA28EDE3E7B8139B
            C1EDCD007EBE668A8F72FF0071BFEF8A28024C735F90BFF0775FFC135DFF0069
            BFD8F6C3E3678674E371E30F834AEFA9885332DE68521CCF9EE7ECD26261D951
            AE4D7EBDD54D6749B5D7F4BBAB1BEB7B7BCB1BD85E0B9B7B88C4914F13295647
            5390CA412082082322803F80F6E1BFC292BF473FE0BD3FF042AF19FF00C135FE
            3EF883C57E11F0D6ABAAFC04D72E8DE693AC5B46D7117877CD6E6C2EC8CB45E5
            B9D91C927CB2218F0ED26F55FCE62B8C7D3D68019452B0C1A4A0028A28A0050D
            8FFF00551B89A555CAFBD7BCFEC6DFF04C3F8F3FB7E6AF1C1F0A7E18F89BC516
            4D218E4D58402D749B720F224BD98A40A460FCBBF71C10013C5007838E7BFD6B
            D6BF63BFD85BE2BFEDEFF13E3F087C27F05EAFE2FD5CE0DC35B47B2D34E8C9C7
            9B7370E4450C7DB73B0C9C019240AFDC1FF827C7FC1987A0786A4B2D7BF692F1
            ABF88EE576CC7C29E1495EDEC73D765C5EBA89A40470561584823895857EB7CF
            77F01BFE095DFB36A2C92F817E0C7C36D0C6D8C3345616ED263A0CFCD3DC3E3F
            DB9643FDE3401F9DBFF0494FF834EBE1CFEC953E99E37F8EF3E9BF15BE20C056
            E20D1D622DE1BD1A41823E4750D792291F7A50B1F3FEA8950F5F6B7FC14B3FE0
            AF5F053FE0951F0D8DFF008FB5C86E3C49341BB46F08696C92EAFAA1E42958B3
            8861CA9CCD26D41B48059F087F26BFE0A93FF078A5E6B316A1E10FD96B497D32
            070F04BE39D7AD01B861C8DD6366F954EC4497009C1FF52A70D5F33FFC137FFE
            0DDCFDA1BFE0ADDE3E4F8ABF19F58F127833C11E21996FEF7C49E23325C7887C
            4C8DC86B58A625C8601713CD88C2B2B209402B401C1FED47FB73FED51FF07287
            ED3DA7F80BC33A2DF49A02DD7DA749F0568D294D23468C7C9F6DBF9DB0AEEAA7
            0679880A5996354DFB0FEE77FC113BFE0DEEF87DFF0004ABF0FDB78B35E6B1F1
            D7C6BBD836DD6BEF0E6D7440E8564B7D3D18655486656998092419E235631D7D
            37FB22FEC55F057FE095FF00B3B5C683E04D2745F0478534B83EDBADEB5A85C2
            2CF7C63525EEEFEEE4237100B1CB1088090AA8A02D7E377FC16ABFE0EBFBAF15
            C9A9FC2AFD942F2EA086E0B58EA3F1056164B9B82DF2B45A5210193AE3ED2C37
            E49F2957093100FB07FE0BB7FF00071B784FFE09C3A2EA9F0DBE194FA778BBE3
            8DCC3E4C8A184B61E0EDEA7135D75592E06414B6F70D26176AC9F96FFF000470
            FF00821DFC4AFF0082D4FC6FBEF8F5F1FF0054F1247F0CF54D41F50BED5EEA52
            9A9F8EAE83E1E1B76C663B752BB1E600050A228464130FB6FF00C10FBFE0D6DD
            67E30EB363F197F6A9B1BFB2D167946A1A67826F1986A1ADBB1DFF0068D4D89D
            D14449CF93FEB2424990C6A36C9FB4DFB737EDE9F08FFE095DFB367FC259E3BD
            42CFC3FA1E9D00B0D0B43D3E25175AA491C788ECECADD7038002FF000C71AE0B
            3228CD0069FC74F8E7F087FE0961FB223EBDAFBE95E03F86DE04B08EC6C2C2CA
            154DDB5710D95A4031E64CF8C2A8E4FCCCC400CC3F930FF82C1FFC160BC7DFF0
            56FF008FADAEEBAD3687E05D0A4923F0B785A298BC1A5C24E0CB274125CC8002
            F211E8AB8500550FF82B0FFC15E7E25FFC159BE379F1078B676D1BC25A548EBE
            1BF09DADC34963A142D804E70BE74EE146F9994163C008815179AFF825E7FC13
            87C67FF0541FDAD742F86BE148A6B6B291C5DF8835931178340D3D5879B70FDB
            77F046A48DF2322E4024800FD51FF83367FE09AD37887E20788FF69BF135932E
            9DE1F59FC35E0E1343C5CDDC8A05E5E213CE2288F90A572099E71C18EBFA1E53
            915C47ECDBFB3C7857F64FF80DE15F871E09D38697E15F0769F1E9BA7DBE773E
            C4EAEED81BA4762CEEDD59DD98F26BB703028016BF902FF83A3BFE53AFF1CFFE
            E01FFA8FE995FD7ED7F205FF0007477FCA75FE39FF00DC03FF0051FD32803E00
            A28A2800A28A280147DDAFEF6FE137FC92BF0D7FD82AD7FF0044A57F0483EED7
            F7B7F09BFE495F86BFEC156BFF00A252803A0A28A2800A28A2803E3FFF0082FB
            FF00CA1BFF00684FFB1564FF00D1B1D7F1875FD9E7FC17DFFE50DFFB427FD8AB
            27FE8D8EBF8C3A0028A28A0028A28A00FD9EFF0083263FE4FEFE2BFF00D93F6F
            FD38D9D7F4BD5FCD0FFC1931FF0027F7F15FFEC9FB7FE9C6CEBFA5EA00FCCCFF
            0083AEBF6317FDA9FF00E095BACF8974DB533F883E0F5FC7E2B8362FEF24B255
            686F907A28864F3CFF00D7A8AFE4DDBAD7F7DBE23F0F58F8B741BED2B53B4B7D
            434DD4EDE4B4BBB5B840F15CC3229578DD4F055949041EA09AFE2CBFE0AFFF00
            F04EAD57FE0989FB74F8B3E1B5CA5D4DE1D67FED6F0AEA130E752D26666303EE
            E8CE9B5E17238F3217C0C62803E5EA295BAD250014B9A4A2803D73F625FDB6BE
            227FC13F3F684D1FE25FC33D65B48F10E944A491480BD9EA96EC4192D6EA2040
            9207DA32B90410194ABAAB2FF473FB0D7FC1DEBFB3AFC7CF0CD959FC591ABFC1
            BF1708D52EBED36936A5A2DC4BD0986E20469101C6489A340A0E37BE3757F2D7
            BA8DD8A00FEDA7C33FF058AFD947C5BA72DD5AFED21F04628DB042DE78CAC2CA
            4E4647C934AAFD08CE471C8383C573DF147FE0BADFB207C21D3E6B9D57F687F8
            63771DBA6F71A2EACBADC84707E54B213331E7A2827F235FC5B939A371A00FDE
            8FF82B4FFC1DF8BE3EF046ABE02FD97F4DD6348FED489AD6F3C75AB422DAEA28
            D861BEC16F9263620E04F290C9F36D8C36D907E0DDD5CC97373249248F2C8EC5
            9DDC92CE4F5249E726A30C4504E4D002668A28A0028A29CAB91FD6803B1FD9E7
            E07EB7FB4BFC73F07FC3EF0DC3F68D7BC6BAC5AE8B609B490259E558D59BD117
            76E63D02A927815FDCF7C0CF843A47ECFF00F057C25E05D02230E87E0DD1AD34
            4B0438C882DA14863CE3A9DA8327B9AFE7E3FE0CE7FF008263DC78E3E2DEB1FB
            4E78A34FDBA1F84967D0FC1C255C7DAB5191365D5D283D52185CC41BA179DF07
            7446BFA315E05002D7E39FFC1E55FB18CBF193F61BF09FC5ED2EDBCDD47E11EB
            06DF522918DDFD97A818E26727A9D9731DAE17B09643C60E7F632B92F8E9F067
            C3DFB44FC1DF14F80FC5964BA8786BC63A5DC691A95B9E0C904D1947DA7F8580
            39561CA9008E45007F062DF7A92BD9BF6FCFD8B7C4DFF04FBFDADBC69F0A3C59
            1B9BFF000B5F3476D79E5148F54B37F9ADEEE3CFF0491956EBC1DCA7952078D3
            70680128A28A005CD7D05FF04DFF00F8294FC4CFF825E7ED016FE3FF0086FA8C
            61A5416DAC68F7819F4ED76D7764C33A020F07957521D0938382C0FCF94E0E40
            A00FEAC3F634FF0083B73F65DFDA2342B283C7D7DAC7C19F13C8A166B4D62D25
            BDD34C9DC45796E8C367FB53243D3A74CFD71E1AFF0082C57ECA3E2AB01716DF
            B487C118938245E78CF4FB37E467EE4D2AB7E9C743CD7F12C5CB1E68CD007F68
            3F103FE0BCDFB1E7C35D3E4B9D47F685F87371145B8B0D2AF8EAD21DA40384B5
            595CF518C0E79C67071F037EDF1FF0797FC32F02786AFF0048FD9EFC2FABF8EF
            C4D223476FAEEBF68DA768B6C483891612C2E6720FF032C23A7CC7915FCDB872
            075F7A379C75A00EB7E3AFC77F17FED2FF001735EF1D78EF5EBFF12F8B3C4B74
            D79A8EA378FBA49DCF000030151540554501555555400001C913934139349400
            5145140057B8FF00C136BF648BCFDBAFF6E7F861F0AAD61965B7F166BB043A93
            46486834F8C99AF6504774B68E661D3951C8CD788A81B79FD2BFA28FF8338FFE
            099171F0F7E1F7887F699F1558B437DE30824F0FF83A39570CBA7ACA3ED7783D
            A59A35890F0C16094F2B283401FB93A4E990689A5DBD9DAC115B5ADA44B0C30C
            48152245002AA81C0000000A9C8CD09C20FA52D007F253FF00075CFECEF27C0B
            FF0082C578C7565B710E9BF1274AD3BC4F69B530849805A4FCF42C67B495CFFD
            741EB5F9B46BFA79FF0083C2BFE09FF73FB44FEC5BA07C63D02D1AE35DF83373
            27F69A45192F368F7663599F8049F226485FD151E76C8C73FCC33FDEA004A28A
            2800A50D8A4A2803F6BFFE08C7FF000761CFFB277C23D0BE157C7ED135BF1678
            5FC396E961A2789F47D92EA9A7DAA0DB15BDCC3232ACD1C6B855915C3AA20056
            43CD7EBF7C29FF0083853F636F8C3A34779A77C7AF07699BE3DED06BBE768D34
            44632A56EA38F2413FC2483CE091CD7F1A7B8E31E9466803FB70D5FF00E0AF5F
            B2A68764679BF692F814E80818B7F1CE9B72FCFF00B11CCCDFA57CF5FB4B7FC1
            D1DFB1E7ECF1A2DC3D8FC42B9F88DABC40F97A6784F4D9AE9A63DBFD22411DB0
            1FF6D73EC6BF914CF14038A00FB83FE0B3FF00F05BEF1E7FC160BE24698350D3
            A3F07FC39F0A4B249A0786ADE73391238DAD75752E144D705460615523525546
            59DDFE1F3D68CD04E4D002514514005380E3A536BADF817F063C41FB467C62F0
            BF80BC2764DA8F897C61AA5BE8FA6DB8E0493CD22C69B9BF85416CB31E154127
            806803FA52FF0083343F6729FE18FF00C1383C4FE3EBD83CA9BE26F8AE692CDB
            69FDF58D8C6B6C8D93FF004F1F6C1C647CBD7922BF5F17A579A7EC6DFB3268BF
            B1AFECADE01F85BA07CDA6781B44B6D2966DBB5AEE4441E6DC30ECF2C85E46F7
            735E99401F9C5FF074AFEC6537ED71FF0004A1F14EA3A5DABDCF887E13DDC7E3
            3B358D0977820478EF17804ED16D2CB2F039302E71DBF9213C1AFEFC35CD22D7
            C43A4DD69F7F6F05E595F44F6F716F3A078E78DD4AB2329C860412083C609AFE
            30BFE0B4DFF04DCD47FE0987FB7A78AFC05F67B8FF0084435090EB5E11BC7DCE
            B77A54CCC624DE7EF49090D0BE7AB445BA302403E4BA29586D6C525001451450
            02838AD7F027C41D7BE16F8B2CF5EF0CEB7ABF8775CD39FCDB4D474BBC92D2EE
            D5FA6E8E58C8743C9E41158F45007DBDF0FBFE0E3FFDB67E196911D969DF1F3C
            43730C48230DAB697A6EAF291EF25DDB4AEC7DCB13EF5D0FFC451BFB75FF00D1
            72FF00CB33C3FF00FC835F0051401F7FFF00C451BFB75FFD172FFCB33C3FFF00
            C8347FC451BFB75FFD172FFCB33C3FFF00C835F0051401F7FF00FC451BFB75FF
            00D172FF00CB33C3FF00FC8347FC451BFB75FF00D172FF00CB33C3FF00FC835F
            0051401FD0F7FC1AFF00FF000599FDA4FF00E0A23FB7D78BBC15F18BE23FFC26
            1E19D2FE1FDE6B76B67FF08FE97A7F95791EA3A6C292F996B6D148711DC4C369
            62BF3E48C8047EEF57F305FF000654FF00CA537C7DFF0064AB51FF00D3BE8F5F
            D3ED007C67FF0005F9FD8C66FDB9BFE095DF13FC29A6D97DB7C4DA2D98F13E80
            8A9BE56BCB1CCDE5C63FBF2C227807FD77AFE345FEF7F8D7F7EEC39AFE407FE0
            E2BFF82624DFF04DCFF8281EBA347D3BECDF0D7E24C92F88BC26F121105AABBE
            6E6C071806DE56215413889E024E588A00F8128A56EB4940051451401DCFECE5
            FB44F8CFF64DF8CDA07C43F87FAEDE786FC5BE19B9175617D6E7943C864653F2
            BC6EA591D181575665604135FD15FF00C13F7FE0F19F83BF163C2D61A57C7ED2
            752F85FE2C8A358EEB57D36CA6D4B41BC7C60C8AB187B983279D85240A3FE5A1
            AFE67371C51B8E2803FB5BF05FFC16ABF64AF1FC092587ED19F07E0574320FED
            2F135B698D8040E56E5A320F3D3AF7C63388BC63FF0005B7FD91BC0C9335EFED
            17F0966106037F67F8860D449C807E516ECE5B83FC39C1C8EA315FC54EE3EB41
            393401FD49FED7FF00F0783FECD7F05346BBB7F8616FE26F8C5E20D8C2DBECB6
            32691A5093070259EE9165C67BC70383D8F435FCF27FC143FF00E0A35F137FE0
            A6FF00B425D7C43F899AA453DE797F65D334CB343169FA1DA06665B7B78C9242
            82C49662CEC4E5989AF07DE71D69280149CD251450014514E03E5A00BBE1AF0E
            5FF8BF5FB0D2B4BB49EFB53D4EE63B4B3B6854B4B71348E111100E4B331000F5
            22BFB87FF8279FECA969FB127EC45F0C3E155B08CB782F40B7B1BC923C6D9EF0
            8F32EE518ECF70F2BFFC0ABF9D6FF834BFFE098F3FED57FB680F8D3E22B02DE0
            4F82F711DD59B48B98F51D74AEEB68D4F7FB383F68241CABADBE461EBFA8E5E1
            450018A2968A002908CD2D1401475DD1E2D7B47BCB09951A1BC81E07578D6456
            0EA54E558156E0F21860F7C8AFC43FDBFBFE0919FB1BDCFC618BC39F1C340B9F
            D973C61E26999741F1E78464FB2F80BC57292C554A4EAF6DA75C05059ED5FC80
            33F24F32E1CFEE495CD71BF1E7F67FF067ED3DF0AF57F047C40F0CE93E2EF0A6
            B90F9379A6EA30892194750C0FDE4753865910874601948600D007F3E5F143FE
            0CA2F8817517DBBE177C76F87DE2CD2AF104F6536B5A7DCE9AB2C6DC83E65B9B
            A5618230C386EB81D2BC9EF3FE0CD5FDAD2DAEE48E3D63E0D5CA2310B2C7E21B
            B0920F501ACC360FB807DABEAFFDA8BFE080FF00B5AFFC1383C5D71E25FD85BE
            2EF8DEFF00C193CED727C132F8892D2E74F6249C08E765B2BD8C64E0C8AB28CE
            DDB237CE7C2F5DFF0082E4FF00C1523F643696D3E237C3FD62F0DAA956BBF127
            C337861700677ACD689044E060FCCA48EBE870018DE05FF832BFF695D6A785B5
            EF1FFC18D0ADA4CEF58751D42F2E63C301F7059A21E327FD67A0E3271F4AFC0A
            FF0083217C2F613DBCDF133E3B6BFAAC648F3ECBC31A145A7B2FA85B8B8927CF
            D4C23E95F30788FF00E0F2DFDAD6CE0934F9FC13F04B49BE8B6877FF00847B53
            5B8423079593502A323D57BF15CCEA7FF071BFFC144BF68E2D6FE0B37965F6D4
            2E89E13F87B1DE3947048F2CCB0CEC06DCE181CE39CF7A00FDC0FD95FF00E0DC
            CFD907F64DB8B6BDD33E13E9BE2DD6AD0861A978BE67D6E4DC3A30865FF46560
            4643242A7BE7818EB3F6ABFF0082D77ECA7FB05697FD9DE28F8A9E138F50D3A3
            F261F0F786CFF6ADF45B47CB1182D430838E079A635F7AFE7D2FBF611FF82A0F
            FC14BE2FB3F8B748F8EDA9E8F7676C96BE33D61F41D36318C16FB25DCB0A608C
            7DC8B278EB5F48FECABFF0650FC40F12CB6D7BF193E2D786FC2966C0492699E1
            7B49755BC607AC6D3CC218A261FDE559978C0CE72002FF00EDDBFF0007A3F897
            C5315EE8BFB3D7C3D83C2F6AFB923F12F8AF65DDF95CF0D159464C31371D6492
            6041FB9C64FC8FF027FE0979FB6FFF00C178FE265A78E7C613F89EE744BBE57C
            65E3BB896D34C82062095B1836EE7438384B58BCBDC3E664CE6BFA00FD887FE0
            DEAFD95FF6127B4BFF000FFC3BB5F16F8A2D40C7883C5ECBABDE8618F9E38DD4
            5BC2F9E77431237279C7156BF6ECFF0082FE7ECC1FB00457767E25F88369E27F
            15DB2B01E1AF0A95D5751DEBFF002CE428C21B76CE389E48CF3C03401E5FFF00
            04C4FF008363FE017FC13D6EEC3C4BAF5BB7C5FF0088F665658F59F105AA0B1D
            3A51FC56963968E320E08795A59158655D3A57ABFF00C14E3FE0B9DF01BFE097
            3A35C5A78B35E1E24F1F7941ED7C1DA13A4FA9B9232AD3F3B2DA33D4B4A41232
            555F18AFC50FDB03FE0E70FDA8FF00E0A59E365F86DFB3B785B5AF87963AD318
            2DAC7C2D1C9A9F8AB535EE7ED4880C03186FF474464E73295AF51FF826DFFC19
            FF00E34F8B5AE45E38FDAA3C4775E1CB3BD94DECBE15D26F16EF5AD45DC96637
            97B978E1CB60B08FCD91831CBC4D401F2FFED01FB6F7ED85FF0007307C785F87
            FE10D0AF93C1F15C25C45E13D15CC3A168B18385BAD4AEDF02465EA1E638DD91
            146ACDB4FEC8FF00C11BBFE0DA5F865FF04DB7D3FC6FE3892C7E277C638B12C7
            A94B01FECBF0EBFF00D38C2E3264078FB44A37F00A2C3960DF67F837C05F037F
            E096DFB33CB069769E0BF83DF0CBC371F9D713492259DB86C63CC96690EF9A66
            C01B9D9A47381F31C0AFC4AFF82BDFFC1DDFA978D63D4BC05FB2CADCE8BA536E
            82EBC7D7D6FB2FAE8720FF0067DBB8CC2A4749A61E6609DA91300D401FA51FF0
            589FF82FD7C2BFF8252F86EE3441241E38F8BD7506FD3FC27653E3EC7B86567B
            F9467ECF1608217FD64991B5769322FF002BFF00B70FEDE5F13FFE0A21F1C6FB
            C7DF14BC4536B7ABDC129696A80C761A4419CADB5AC392B144BF8B31CB3B3312
            C7CAFC45AFEA3E31F115EEA9AADF5F6ABAB6A770F73777977334F737733B1679
            2476259DD9892589249273926BF4CFFE0955FF0006B97C69FDBAEF34CF147C46
            82F7E0FF00C2F98ACC6EB51B6C6B7AB45C122D6D1B05158749A7DAA030655971
            8A00F89FF60FFD813E26FF00C1477E3DE9DF0F3E18E88FA9EA77277DE5ECDB93
            4FD1ADBF8AE2EA60088E318E382CC70A8ACC429FEBABFE0933FF0004AAF01FFC
            127BF668B7F0578571AB78835265BCF13788E68152EB5DBB0B8C9C64A411E584
            516484049CB3BBBB7A07EC3BFB027C2CFF008276FC16B7F02FC2BF0CDB683A5A
            9596F6E5BF7B7DABCE0006E2EA62374B21C71D1547CA8AAA028F65DB40027DD1
            4B40181450015FC817FC1D1DFF0029D7F8E7FF00700FFD47F4CAFEBF6BF902FF
            0083A3BFE53AFF001CFF00EE01FF00A8FE99401F005145140051451400A3EED7
            F7B7F09BFE495F86BFEC156BFF00A252BF8241F76BFBDBF84DFF0024AFC35FF6
            0AB5FF00D129401D05145140051451401F1FFF00C17DFF00E50DFF00B427FD8A
            B27FE8D8EBF8C3AFECF3FE0BEFFF00286FFDA13FEC5593FF0046C75FC61D0014
            514500145145007ECF7FC1931FF27F7F15FF00EC9FB7FE9C6CEBFA5EAFE687FE
            0C98FF0093FBF8AFFF0064FDBFF4E3675FD2F50026DCD7C37FF05DDFF823FE93
            FF000567FD954E9DA79B2D2FE29F830C97FE10D5A71B55A461FBCB199FA8827D
            AA091F71D237C10ACADF72D215C9A00FE097E27FC2DF107C15F889AD784BC59A
            3DF681E25F0EDE4B61A969D791F973D9CF19DAC8C3D8FE046083839AE7D860D7
            F5E1FF0005B6FF008202780BFE0AC1E1493C45A44B63E08F8D1A65BECD3FC44B
            09F2356445C2DAEA0A80B4918180B280648B8C0750636FE5B3F6CBFD85FE297E
            C05F17EE3C13F15BC25A8785F598CB35B4922F9969AA440E04D6D3AFEEE68CE4
            7287209C305605400790D14ADC1A4A0028A28A0028A28A0028A28A0028A29CA0
            1140095F53FF00C123FF00E095BE36FF0082AFFED4363E0AF0E89F4BF0C69CD1
            DDF8A7C46D0968343B22DCF38C34F2056114648DCC093844765F45FF0082467F
            C1033E2FFF00C154BC5169AAC16371E08F84F14E06A1E2FD4AD984770818868E
            C6338FB54B9561904468461DD4E14FF557FB0C7EC1FF000D3FE09DDF0034EF87
            5F0BF425D1F45B43E75D5C48DE65EEAF745407BAB99700C92B60760AA0054544
            555001D87ECEFF00B3FF00857F659F81DE18F877E09D2E2D1FC2BE11B08F4ED3
            AD5072B1A75673FC523B12EEE79676663C935D981B45006D181C52D001485726
            968A00FCD6FF00838CBFE08970FF00C151BE0341E2EF045A5BC5F1AFC016CFFD
            904958C788ACB25DF4E91C90036E25E17638572EA7025665FE4F3C47E1BBFF00
            07F882FF004AD5EC6EB4CD534BB992CEF6CEEA26867B49A36292452230055D58
            10548C820822BFBEB2335F979FF05D5FF8370FC27FF05348AEFE22FC3A9B4FF0
            47C6CB583F7B33C7B34DF162A8F963BCDA32938C00B7001381B5D5C6C31807F2
            90C30692BD0FF69BFD95BE217EC6FF00172FFC0DF13BC29AB7843C53A7732D9D
            F478F353240962914949A2620ED9236646C1C31C579E91834009451450014514
            500145145001451450014E0A36FE7428E3A67F1AFD2DFF0082357FC1B6DF143F
            E0A47A9E95E32F1AC3A9FC36F82EEC93B6AD710ECD4BC430F076E9F13AF2AC3A
            5C38F28672A2520AD00701FF000425FF008232F887FE0AC7FB48C5FDA115E699
            F083C1F731CBE2CD653286E07DE5D3AD5BBDC4C0727FE592317619D8927F5EDE
            04F0368FF0D3C11A47873C3FA6DA68FA0E83650E9DA7585AC7E5C1656D0A2C71
            448A3A2AA2AA81D80AE5FF00666FD987C0BFB1EFC16D17E1F7C39F0E58785FC2
            9A0C5E5DAD95AA9E58F2F2C8E72D24AE796772598924935DE818A005A28A2803
            2BC6BE0FD2FE21784355D035CB0B5D5345D72D25D3F50B2BA8C4905E5BCA8639
            22753C32B233291DC135FC77FF00C171BFE091BAF7FC1283F6B5BCD223B7BABB
            F863E2C966BFF066AEF9712DB0605ACE57FF009F8B7DEA8D9FBCA637E37E07F6
            49B7E6CD791FEDBBFB12FC3CFF0082827ECF5AD7C34F897A326ADE1FD5977C53
            210977A55CA8223BBB69083E5CC99386E410595832332900FE185860D257DD9F
            F057BFF8209FC5CFF8254F8BAF754B8B3B8F1A7C259EE36E99E30B08098A1566
            C2437D18C9B59B951F37EEDC91B1C9CAAFC2AE30D400DA28A2800A28A2800A28
            A2800A28A2800A28AB7A3E8D75E21D4EDAC6C2D6E6FAFEF64586DEDEDE332CB3
            C8C405444504B3127000E4E6802B2E315FD157FC1A69FF00045ABEF843A643FB
            50FC4DD265B2D775BB37B7F01E977716C96CACA65DB26A6CA7E6569D0B2440E3
            F72EEFC89508E17FE0851FF06AD5EDC6ABA47C5AFDA9345FB358C1B2F345F879
            74A7CDB87C8649B5419C220C03F64392C7FD6E02B44FFD034302430AA222AA22
            ED55518007A01400F5FBB4B4806052D0026DE6BE2EFF0082E27FC123F44FF82B
            5FEC9B2787236B2D2BE237855A5D47C1DACCEBF25BDCB28125ACCC01616F3854
            57C03B59237C318C29FB4A90AE6803F82CF8C3F07BC4BF00BE28EBDE0BF1968B
            7FE1EF14F86AEDEC752D3AF2231CD6D2A9E411DC11821812ACAC0824104F30DC
            1AFEC07FE0B59FF0418F87DFF0569F051D66DDADBC1DF18B46B5F2748F13C711
            29791A862B677C8BCC90E4F0E01922CE5720B46FFCB2FEDBBFB00FC57FF8278F
            C5E97C1BF15FC277BE1DD44EE7B3BAC79D61AB420E3CEB59D7E495391D0EE527
            0CAAC0A800F17A295861A92800A28A2800A28A2800A28A2800A28A2803F5FF00
            FE0CA9FF0094A6F8FBFEC956A3FF00A77D1EBFA7DAFE60BFE0CA9FF94A6F8FBF
            EC956A3FFA77D1EBFA7DA0042335F317FC15ABFE098FE13FF82ABFEC8BAB7C3A
            D7DE1D2F5C81BFB43C31AEF95BE4D0F5150423E3AB44E098E48FF89189187546
            5FA7A931CD007F093FB51FECAFE39FD8C7E3AEBDF0E7E22E8375E1EF15F87673
            15CDB4C3E4954F29344FF76485D70C8EA4860462BCED860D7F669FF0581FF823
            17C37FF82B97C21874FF00107FC537E3DD06271E1CF165A401EE2C09C9F2264C
            8F3ED99B93192083928CA4B67F952FF82867FC12F3E307FC131BE299F0DFC52F
            0CCD656975238D275EB3CCFA3EB88A7EF5BDC600DD8C131B85950302C8B91900
            F9DE8A5230692800A28A2800A28A2800A28A2800A28A7AAE5680195EE9FF0004
            EDFF00827FF8F3FE0A57FB4EE87F0C7C03664DEEA0DE7EA3A9CD1B1B3D0AC948
            F36EEE1874450700705DD91172CC057A57FC12D7FE08A9F197FE0AB1E3B822F0
            7E912685E05B7B8F2F56F19EA903A69760A3EFA47D0DCCFD84519CE4AEF68D4E
            F1FD597FC134BFE097DF0B7FE0965F01E3F05FC39D319AEAF364FAEEBF7815B5
            2F105C2820493381C2AE58244B84404E06E666600EC3F61AFD8C3C17FB007ECB
            FE16F857E04B3F2344F0D5B6C7B8940FB4EA772C774D753B0FBD2C8F963D9461
            54055503D73A5038A2800A28A2800A28A2800A42B934B450026DE68C714B4500
            21506BC8FF0069BFDAEACBF65DB0177A8780FE2B78B203B4EEF087856E35E60B
            CE494B7DCCA077C8079CE30091EBB498C1A00FC9CFDA2BFE0EF2F817F00F589F
            496F857F1E27D6E2764106ABE1F83458CEDC8E7CFB8130E76F1E5701867078AF
            8D7E317FC1E8DF173E2A6A1FD8DF06FE05786F46BFBC630DB1D5AF6EBC437729
            3C0290C096E03FA03BC67FBD5FD10EBBE1CD3FC51A73DA6A76367A8DA49F7A0B
            A85668DBEAAC08EE6B2BC0DF08BC29F0C1651E1AF0C787FC3C26FF005834CD3A
            1B4F33A75F2D467A0FC85007F343AFFC05FF0082AC7FC16425687C531FC47F0F
            F843500164B5D6A44F05E8BE4B13B4B598F2A4B85E72098A56239C9EB5F547EC
            51FF000656F863C35736DAA7C7EF89775E269E321DF40F07A1B3B2246387BC99
            7CE910F2309142DD086EA2BF75F6E28280D00784FC1EFD9D3F67FF00F825A7C1
            1BE7F0B685E02F83FE0AB18D64D4B539A58ECD260A301EEAF676F325603A34D2
            31F7AFCF1FDBD3FE0EE3F86DF0E6FEE3C21FB37785B51F8DDE3890B4116A0D6B
            3C1A241264A82AA145CDE61B036A2C68C181598D7EA7FC50FD9A7E1CFC6FD5AC
            EFFC69E00F0578BEFB4E8CC56971ADE876BA84B6A84862B1B4A8C5412012011C
            815BFE10F00685F0F74FFB2681A2E93A1DA1C7EE34FB38EDA3E3247CA800EE7F
            33EB401FCA0FC67FD967FE0A3DFF0005B0F8830EB9E33F87BF14359B5498B69D
            6DAD588F0CE83A62B679B68AE8C1080178322EE76DB86676EBF4C7EC99FF0006
            53FC48F164D6B7DF1A3E28F86BC1B60C0492E97E1A81F56BF23BC6F348228626
            FF006944C3FA7F479B40A0281401F1DFEC15FF000422FD9A3FE09DB2DA6A3E0A
            F00C3AC78B2D3053C4FE2675D535756E3E68D994450376CC11C791EB939FB0D5
            0151C528502940C0A003A514514005145140057F205FF07477FCA75FE39FFDC0
            3FF51FD32BFAFDAF903F6A3FF820AFEC9FFB697C76D73E25FC4BF853FF000927
            8DBC4BF67FED2D4BFE126D62CFED3E45BC56D17EEADEEE38976C30C6BF2A0CED
            C9C924900FE30A8AFEBF7FE2171FD853FE886FFE5E7E20FF00E4EA3FE2171FD8
            53FE886FFE5E7E20FF00E4EA00FE40A8AFEBF7FE2171FD853FE886FF00E5E7E2
            0FFE4EA3FE2171FD853FE886FF00E5E7E20FFE4EA00FE40C7DDAFEF6FE137FC9
            2BF0D7FD82AD7FF44A57C41FF10B97EC29FF004437FF002F3F107FF2757DEFA4
            E970687A55B595AA7956D6712410A6E2DB114055193927000EB401628A28A002
            8A28A00F8FFF00E0BEFF00F286FF00DA13FEC5593FF46C75FC61D7F799F1FBE0
            2784FF006A1F837E21F87FE3AD2BFB73C23E2AB4363AA587DAA6B6FB54248257
            CC85D245E40E5581F7AF8C3FE2171FD853FE886FFE5E7E20FF00E4EA00FE40A8
            AFEBF7FE2171FD853FE886FF00E5E7E20FFE4EA3FE2171FD853FE886FF00E5E7
            E20FFE4EA00FE40A8AFEBF7FE2171FD853FE886FFE5E7E20FF00E4EA3FE2171F
            D853FE886FFE5E7E20FF00E4EA00FCA0FF0083263FE4FEFE2BFF00D93F6FFD38
            D9D7F4BD5F33FEC4BFF047BFD9CFFE09D1E3FD57C51F06FE1DFF00C21DAEEB9A
            7FF655EDCFF6F6A7A879F6DE624BE5ECBAB99517E78D0E5403C63382457D3140
            05145140098E6BCF7F695FD957E1CFED85F0D2EBC1FF0013BC1DA178D7C39759
            2D69A9DB093C97C11E645270F0C801389236571938615E8748573401F82BFB77
            FF00C1967A76B77B77ACFECEDF115746DC0B8F0D78C77CB6EA7D22BE855A455E
            3016485CFAC95F943FB52FFC10DBF6AAFD8FAEA7FF0084BBE0B78C2E34E832C7
            55D06DFF00B6F4FD83A3B4B68641103FF4D761F6CD7F6918A31401FC05DD5949
            63772C13C7243342C5248E452AC8C0E0A9079041E306A3D98FF1AFEEFF00E2CF
            ECBDF0D3E3DA15F1D7C3CF0378D148DA46BDA0DAEA408C118FDF23718247D0D7
            CFBE35FF0082087EC71E3F95DEFBF67BF87B017209FECDB57D340C127816CF18
            1C9EDD471D2803F8C061834BB72B5FD816A5FF0006C17EC2FAADF49712FC0B81
            5E439221F16EBB0A0E31C225E851F80AB5A17FC1B37FB0EF8756416FF0234E90
            4A413F6AF11EB3758C67A79B76D8EBDB19EF401FC7A6066B73E1EFC2DF12FC5B
            F1147A47857C3DAE789B569B023B2D2AC25BCB8909E80471AB31FC057F685F0F
            FF00E08C1FB277C31B949B49FD9E3E1279D1B6F8E4BDF0E5BDFBC6D952195AE1
            5CAB02A3047239C7535F41F827E1F683F0D3434D33C39A2691E1FD363394B4D3
            6CE3B4814FB246028FCA803F92BFD91BFE0D7AFDAE7F6A7BCB49AFBC051FC2ED
            067397D4BC6B75FD9EF181D47D8D43DDEEC74DD0AA93C161C91FB15FF04F3FF8
            348BE027ECA3A869FE22F89F7979F1BBC5968CB325BEA76C2D3C3D6D20C1C8B2
            058CF8E4113C8E8C31FBA522BF587146D06802BE8FA45AE83A4DAD8D95B41656
            56512C16F6F046238A08D40554555C055000000E00031567A5201814B4005145
            140051451400521507B52D1401E4DFB5DFEC3BF0A3F6F0F870DE12F8B3E08D17
            C65A382CF6FF006B8CA5CD83918325BDC2159607FF006A36538E0F15F899FB73
            FF00C19617D05DDDEB1FB3C7C4782E607DD22786FC6798E48F9CED8AFA1421B8
            385592152368DD21CE47F4178A36D007F149FB4C7FC118FF006A2FD90EE66FF8
            4E7E0978E6D6CA0E5B52D36CBFB5F4E03B16B9B432C4B9F46607D8106BE6496D
            DA199A37465910ED28C30548EA08F5AFEFD8AE6BCFFE2E7EC9BF0B3E3F861E3B
            F869E00F1AEFC6EFEDEF0F5A6A5BB1D33E746DD2803F8472A282B8AFECEFC65F
            F040CFD8E3C76EED7BFB3DFC3F877904FF0067DB49A70E3A605BBA63F0EBDEB8
            9D63FE0D8CFD86B5DBB134DF02AD51C285C5BF8A75CB64C0FF00663BD55CF3D7
            19A00FE3E8A8A36807A7D7DABFB1BD07FE0DC0FD89BC38D6E6DFE02787DCDA80
            13ED3AAEA5759C7F7BCDB96DFF00F02CE6BD53E1C7FC122BF65CF84CF1C9A17E
            CF9F082DAE21C18EE66F0B59DD5C47D4712CA8CE3AF386E7BD007F17BF08BF67
            EF1D7C7FD78697E04F05F8B3C6BA913B45AE85A45C6A3367D36C28C7F4AFD05F
            D907FE0D3EFDAB7F694B9B7BAF14E85A37C20F0FC855DEEFC4F780DE3467AECB
            480BC9BC7F766F2BEB5FD5CF87BC33A7784B47834FD2B4FB2D32C2D576436D69
            02C30C23D15140007D055DDA05007E6AFF00C139BFE0D71FD9D3F615BAB3D7BC
            49652FC66F1D5995963D4FC4D6A834EB494630D6FA782D129C804199A6756195
            615FA51146123000C00300018C0EDC53B14A0628001C51451400514514005263
            9A5A2802A6B5A158F89346BAD3B51B3B5BFD3EFA16B7B9B5B9896586E2360432
            3A30219482410460835F945FF0511FF8346BE037ED4D7B7DE21F853773FC10F1
            54FBA46B6D3EDBED7E1EB97EBCD99653064E07EE2448D464F94C6BF5A2936F39
            A00FE457F6B0FF00835DFF006BAFD982EEEA6B0F0241F14343819B66A3E0DBB1
            7D248A3A66D1C25D6EC750B130078DC78CFC25F12FE0F78B3E0C7880E93E30F0
            BF88BC29AA0CE6CF58D366B1B818383FBB9555BF4AFEF5C201DAB3BC53E0ED23
            C73A349A76B7A5E9DAC69F37FACB5BEB64B885FEA8E0A9FCA803F81809F96719
            C74A40B5FDB67C46FF008240FECB3F1624924D73F67BF8433DC4DFEB2E6DFC2F
            69677127DDE5A58511C9F946096E0671D4D7996AFF00F06E37EC4FADCD70F37C
            03F0EA1B9043FD9F53D46DC0C8C1DA23B850BFF01C5007F1C2168095FD82691F
            F06C4FEC33A25F2DC43F02EDDDD41004FE2BD76743918E524BD653F88AEAFC2F
            FF0006F77EC63E10B812DA7ECFFE0B95848B2817AF757CB95E9F2CD2B8C7A8C6
            0F706803F8CF0BFCB26BD73F679FD81FE357ED65731A7C37F855E3EF19C7236C
            375A668B3CD6911FFA6971B7CA8C7BB3815FD9D7C2CFF8276FC02F8213452F83
            FE09FC28F0D5C438DB73A77852C60B8C8E84CAB10727DC926BD892258902AA85
            0A000070001D85007F311FB16FFC19C1F1EBE335E5B5FF00C5FD7FC3BF083432
            434B6714A9ADEB2EBD70B1C0FF00674DC38DCD392BDE33D2BF6DFF00E09CBFF0
            438FD9EBFE09910C17DE04F0A7F6BF8CD2331CBE2DD7D96FB576C8C3796FB447
            6E083822144DC301B775AFB076E4518A0040A314EA28A0028A28A0028A28A004
            2335C3FED09FB36F807F6ADF86F75E0FF891E10D07C6BE1ABB3BA4D3F55B45B8
            8D5C0204899198E5504ED7421D724820D77349B79A00FC25FDBD7FE0CBBF0EF8
            B750BED73F676F1E9F0ACB292E9E17F15992EAC10FF761BD40D3A20EC258E663
            9E5EBF27BF6A1FF820AFED67FB24DCDC37893E0BF8AF55D2EDCB1FED5F0D43FD
            BB66E83FE5A16B5DED1AFF00D75543EA057F676573462803F80DD4F4AB8D16FE
            5B5BBB79ED6EA06D92433465248DBD0A90083F8543B47F9ED5FDE3FC56FD9D3E
            1F7C77B5F23C71E05F0778CA0D863F2F5DD16DB514DA7AAE264618F6AF9FFC73
            FF000427FD8FBE21C92B5FFECF1F0CE0330218699A60D300C9CF02D8C617F0C6
            2803F8B7D9D3F5A46186AFEC375DFF008366BF61EF11795F68F813611F939DBF
            65F12EB56B9CE339F2AF177741D738E71D4D677FC42E5FB0A7FD10DFFCBCFC41
            FF00C9D401FC81515FD7EFFC42E3FB0A7FD10DFF00CBCFC41FFC9D47FC42E3FB
            0A7FD10DFF00CBCFC41FFC9D401FC81515FD7EFF00C42E3FB0A7FD10DFFCBCFC
            41FF00C9D47FC42E3FB0A7FD10DFFCBCFC41FF00C9D401F903FF000654FF00CA
            537C7DFF0064AB51FF00D3BE8F5FD3ED7CBFFB157FC119BF66CFF8276FC53BFF
            001AFC1DF871FF00087F89B54D2A4D12EAF3FE120D5350F36CE49A199E2F2EEA
            E658C664B785B7050DF2601C120FD414005145140085735CBFC63F82FE11FDA0
            BE1F6A1E13F1C786B44F16F86B554F2EEB4CD5ACD2EADA61D8947046E0790472
            08C8208AEA690AE4D007E227EDF1FF000663F803E26DE5EEBBFB3EF8DAE3E1DD
            FCC4C8BE1CF10799A8E8E4F658AE41373027FBE2E0FD057E4A7ED4BFF06F57ED
            75FB26497136B5F077C41E24D22163B754F0981AEDBBA0EAE52DF74F1AFBCB1A
            57F64C5011D3FF00AF46D19A00FE04B5FF000F5F785357B8D3F53B1BBD3B50B4
            731CF6D750B43342DFDD6460083F51550264FE3DBB57F7A1F12FE07F82FE3469
            FF0064F18F843C2FE2CB5DBB7C9D674A82FE3C73C6D9558773F99AF9F3C77FF0
            435FD907E22B39D43F677F85D0798AC87FB33464D2F0180071F66F2F1D0608E4
            1C91824D007F16463E3383F5F4A0A7E79E82BFB0CD77FE0D9CFD87BC449189FE
            0469D188892BF66F11EB36A4E7AE4C576B9FC734FD1BFE0DA4FD88342B4F261F
            80FA53A162F9B9F106AF72F9E3F8A4BB66C71D338EBEA6803F8F0283FC9AD5F0
            578035CF895E208B4AF0EE8DAAEBDAA4FF00EAECB4EB492EAE1FA0E238C163C9
            0381DEBFB47F017FC116BF64CF86B7226D2FF677F84AD287F315EFBC3B6FA814
            6E3057ED0AF8230318E9CE3A9AF7FF00007C2DF0CFC28D1469BE16F0EE87E1AD
            380005AE9561159C230303E48D55781ED401FC8CFECA3FF06D0FED7DFB565CDB
            C89F0CAE3E1E68D3101B53F1BCDFD8CB083DDAD9835D9E39F960238C6738AFD8
            0FF827DFFC19F1F05FF679BFB3D7FE33EBB77F1935F802CABA5085B4ED02DE4E
            BF344AE65B9DA718F31D518677447381FB07B471C74E9ED46280337C1DE0CD23
            E1EF85AC344D074AD3744D1B4B816DACAC34FB54B6B5B389461638E24015140E
            02A800569818148ABB46070296800A28A2800A28A2803FFFD9}
          mmHeight = 14024
          mmLeft = 530
          mmTop = 530
          mmWidth = 56689
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object ppLine1: TppLine
          DesignLayer = ppDesignLayer6
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 3969
          mmLeft = 63493
          mmTop = 13236
          mmWidth = 130180
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object ppLabel24: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Reconhecida pela Portaria ME n'#186' 83/87 D.O.U. 16/02/87 '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 7
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3439
          mmLeft = 0
          mmTop = 4498
          mmWidth = 193726
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object ppLabel25: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Recredenciada pela Portaria MEC n'#186' 413 D.O.U. 27/03/17 '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 7
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3439
          mmLeft = 0
          mmTop = 7145
          mmWidth = 193726
          BandType = 3
          GroupNo = 1
          LayerName = Foreground5
        end
        object ppLabel26: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label26'
          AutoSize = False
          Caption = 'Mantida pela Associa'#231#227'o Prudentina de Educa'#231#227'o e Cultura - APEC '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 7
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3439
          mmLeft = 0
          mmTop = 10055
          mmWidth = 193726
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
