unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Objects, FMX.MultiView, FMX.ListBox;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnHeaderLeftClick(Sender: TObject);
begin
  mtvMenu.ShowMaster;
  mtvMenu.Visible := true;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
      TbcMain.ActiveTab   := TbiSplash;
      TbcMain.TabPosition := TTabPosition.None;
      mtvMenu.HideMaster;
      mtvMenu.Visible     := false;

      //Mostra versão
//      lblSoftEVersao.Text :='ISBeer by InnerSoft        Versão: '+Versao;

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
