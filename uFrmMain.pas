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
  System.Variants, FMX.Ani;

type
  TfrmMain = class(TForm)
    tbcMain: TTabControl;
    tbiSplash: TTabItem;
    TabItem1: TTabItem;
    TabItem3: TTabItem;
    TabItem2: TTabItem;
    lytSplash: TLayout;
    Label1: TLabel;
    tmrSplash: TTimer;
    actList: TActionList;
    actTab1: TChangeTabAction;
    lytMain: TLayout;
    rctFundo: TRectangle;
    lytMToolbar: TLayout;
    rctHeader: TRectangle;
    lblToolbar: TLabel;
    actTab3: TChangeTabAction;
    lytCapacidade: TLayout;
    tlbCapacidade: TLayout;
    Rectangle1: TRectangle;
    lblCapacidade: TLabel;
    btnCapaAdd: TButton;
    Path2: TPath;
    img_aba4_sel: TImage;
    img_aba4: TImage;
    img_aba3: TImage;
    img_aba3_sel: TImage;
    img_aba1_sel: TImage;
    img_aba1: TImage;
    img_Ball: TImage;
    img_Pulso: TImage;
    AnimationPulso: TFloatAnimation;
    AnimationPulsoW: TFloatAnimation;
    rctControls: TRectangle;
    actTab2: TChangeTabAction;
    lblSoftEVersao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tmrSplashTimer(Sender: TObject);
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

uses Datamodule,
     udm2;


procedure TfrmMain.FormCreate(Sender: TObject);
begin
      TbcMain.ActiveTab         := TbiSplash;
      TbcMain.TabPosition       := TTabPosition.None;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
      rctControls.Visible       := false;
      DataM.qry_configbd.Active := false;
      DataM.qry_configbd.Active := true;

      vSoft                     := 'ISBeer';
      vVersionDB                := DataM.qry_configbd.FieldByName('CONFDB_VERSAO').AsString;
      //TODO : Comparar versão


      //Mostra versão
      lblSoftEVersao.Text :=vSoft+' by InnerSoft    Versão: '+vVersion;

end;

procedure TfrmMain.tmrSplashTimer(Sender: TObject);
begin
    tmrSplash.Enabled   := false;
    rctControls.Visible := true;
    actTab1.ExecuteTarget(Sender);
end;

end.
