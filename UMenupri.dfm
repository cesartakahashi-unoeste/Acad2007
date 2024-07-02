object Menuprin: TMenuprin
  Left = 200
  Top = 108
  ClientHeight = 273
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Database1: TDatabase
    AliasName = 'unoeste'
    DatabaseName = 'unoeste'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=serv_prd'
      'DATABASE NAME=unoeste'
      'USER NAME=u_043065'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'LOCK MODE=5'
      'DATE MODE=1'
      'DATE SEPARATOR=/'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'LIST SYNONYMS=NONE'
      'DBNLS='
      'COLLCHAR='
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=6429956')
    SessionName = 'Default'
    Left = 48
    Top = 48
  end
  object SP_DataSis: TStoredProc
    DatabaseName = 'unoeste'
    StoredProcName = 'pega_datahora'
    Left = 48
    Top = 104
  end
end
