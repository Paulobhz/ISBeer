unit Datamodule;

interface

uses
  Data.DB,

  FMX.Objects,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.FMXUI.Wait,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,

  System.Classes,
  System.IOUtils,
  System.SysUtils;

type
  TDataM = class(TDataModule)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConn: TFDConnection;
    qry_configbd: TFDQuery;
    qry_configbdID_DB: TIntegerField;
    qry_configbdCONFDB_VERSAO: TStringField;
    qry_configbdCONFDB_DATA: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataM: TDataM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDataM.DataModuleCreate(Sender: TObject);
begin
        with FDConn do
        begin
                {$IFDEF IOS}
                Params.Values['DriverID'] := 'SQLite';
                try
                        Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'Database.db');
                        Connected := true;
                except on E:Exception do
                        raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
                end;
                {$ENDIF}

                {$IFDEF ANDROID}
                Params.Values['DriverID'] := 'SQLite';
                try
                        Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'database.db');
                        Connected := true;
                except on E:Exception do
                        raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
                end;
                {$ENDIF}

                {$IFDEF MSWINDOWS}
                try
                        Params.Values['Database'] := 'D:\Projetos\ISBeer\DB\database.db';
                        Connected := true;
                except on E:Exception do
                        raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
                end;
                {$ENDIF}
        end;


end;

end.
