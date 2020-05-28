unit uFrmMain;

interface

uses
  FMX.ActnList,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.ListBox,
  FMX.MultiView,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,

  System.Actions,
  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TfrmMain = class(TForm)
    tbcMain: TTabControl;
    tbiSplash: TTabItem;
    tbiMain: TTabItem;
    tbiCapacidades: TTabItem;
    tbiCapaciCad: TTabItem;
    tbiMarcas: TTabItem;
    tbiMarcasCad: TTabItem;
    lytSplash: TLayout;
    Label1: TLabel;
    tmrSplash: TTimer;
    actList: TActionList;
    actMain: TChangeTabAction;
    lytMain: TLayout;
    rctFundo: TRectangle;
    lytMToolbar: TLayout;
    btnHeaderLeft: TButton;
    pthHeaderLeft: TPath;
    rctHeader: TRectangle;
    mtvMenu: TMultiView;
    rctMtvLogo: TRectangle;
    imgMtvLogo: TImage;
    lstMenu: TListBox;
    item_menu_comparador: TListBoxItem;
    item_menu_capac: TListBoxItem;
    item_menu_marcas: TListBoxItem;
    lblSoftEVersao: TLabel;
    lblAppName: TLabel;
    lblToolbar: TLabel;
    actCapacidades: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure tmrSplashTimer(Sender: TObject);
    procedure btnHeaderLeftClick(Sender: TObject);
    procedure item_menu_capacClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  vSoft, vVersionDB: String;
Const
  vVersion = '0.00.000';
implementation

{$R *.fmx}

uses Datamodule;


procedure TfrmMain.btnHeaderLeftClick(Sender: TObject);
begin
  mtvMenu.ShowMaster;
  mtvMenu.Visible := true;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
      TbcMain.ActiveTab         := TbiSplash;
      TbcMain.TabPosition       := TTabPosition.None;
      mtvMenu.HideMaster;
      mtvMenu.Visible           := false;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
      DataM.qry_configbd.Active := false;
      DataM.qry_configbd.Active := true;
      vSoft                     := 'ISBeer';
      vVersionDB                := DataM.qry_configbd.FieldByName('CONFDB_VERSAO').AsString;
      //TODO : Comparar versão


      //Mostra versão
      lblSoftEVersao.Text :=vSoft+' by InnerSoft        Versão: '+vVersion;

end;

procedure TfrmMain.item_menu_capacClick(Sender: TObject);
begin
  mtvMenu.HideMaster;
  actCapacidades.ExecuteTarget(Sender);
end;

procedure TfrmMain.tmrSplashTimer(Sender: TObject);
begin
    tmrSplash.Enabled := false;
    actMain.ExecuteTarget(Sender);
end;

end.
