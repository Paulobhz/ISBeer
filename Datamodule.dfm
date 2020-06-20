object DataM: TDataM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 378
  Width = 465
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 360
    Top = 24
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\ISBeer\DB\database.db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object qry_configbd: TFDQuery
    Connection = FDConn
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
  object qry_Marcas: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM TAB_MARCAS')
    Left = 216
    Top = 96
    object qry_MarcasID_MARCAS: TIntegerField
      FieldName = 'ID_MARCAS'
      Origin = 'ID_MARCAS'
    end
    object qry_MarcasMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 30
    end
  end
  object qry_Capacidades: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM TAB_CAPACIDADES')
    Left = 120
    Top = 96
    object qry_CapacidadesID_CAPACIDADE: TIntegerField
      FieldName = 'ID_CAPACIDADE'
      Origin = 'ID_CAPACIDADE'
    end
    object qry_CapacidadesCAPACIDADE: TIntegerField
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
    end
  end
  object qry_geral: TFDQuery
    Connection = FDConn
    Left = 296
    Top = 104
  end
end
