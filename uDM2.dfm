object dm2: Tdm2
  OldCreateOrder = False
  Height = 359
  Width = 431
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 24
    Top = 24
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\ISBeer\DB\isbeerdb.db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 32
    Top = 80
  end
  object qry_versaodb: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM CONFIGDB')
    Left = 32
    Top = 144
  end
end
