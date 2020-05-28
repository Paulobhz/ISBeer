object DataM: TDataM
  OldCreateOrder = False
  Height = 378
  Width = 465
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 360
    Top = 24
  end
  object FDCon: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\ISBeer\DB\DataBase.db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object qry_configbd: TFDQuery
    Connection = FDCon
    SQL.Strings = (
      'SELECT * FROM TAB_CONFIGDB')
    Left = 40
    Top = 88
    object qry_configbdID_DB: TIntegerField
      FieldName = 'ID_DB'
      Origin = 'ID_DB'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_configbdCONFDB_VERSAO: TStringField
      FieldName = 'CONFDB_VERSAO'
      Origin = 'CONFDB_VERSAO'
      Size = 8
    end
    object qry_configbdCONFDB_DATA: TDateField
      FieldName = 'CONFDB_DATA'
      Origin = 'CONFDB_DATA'
    end
  end
end
