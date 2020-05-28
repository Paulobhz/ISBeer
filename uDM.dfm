object Dm: TDm
  OldCreateOrder = False
  Height = 251
  Width = 396
  object FDCon: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\ISBeer\DB\DataBase.db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 24
    Top = 32
  end
  object qry_config: TFDQuery
    Connection = FDCon
    SQL.Strings = (
      'SELECT * FROM TAB_CONFIGDB')
    Left = 24
    Top = 112
  end
end
