unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Objects;

type
  TForm1 = class(TForm)
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
    Rectangle1: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure tmrSplashTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
      TbcMain.ActiveTab   := TbiSplash;
      TbcMain.TabPosition := TTabPosition.None;

      //Mostra versão
//      lblSoftEVersao.Text :='ISMoney by InnerSoft        Versão: '+Versao;

end;

procedure TForm1.tmrSplashTimer(Sender: TObject);
begin
    tmrSplash.Enabled := false;
    actMain.ExecuteTarget(Sender);
end;

end.
