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
  System.Variants, FMX.Ani, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Edit;

type
  TfrmMain = class(TForm)
    tbcMain: TTabControl;
    tbiSplash: TTabItem;
    TabMain: TTabItem;
    TabCapacidade: TTabItem;
    Tabmarcas: TTabItem;
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
    lytToolCapa: TLayout;
    Rectangle1: TRectangle;
    lblCapacidade: TLabel;
    img_aba3_sel: TImage;
    img_aba3: TImage;
    img_aba2: TImage;
    img_aba2_sel: TImage;
    img_aba1_sel: TImage;
    img_aba1: TImage;
    img_Ball: TImage;
    img_Pulso: TImage;
    AnimationPulso: TFloatAnimation;
    AnimationPulsoW: TFloatAnimation;
    rctControls: TRectangle;
    actTab2: TChangeTabAction;
    lblSoftEVersao: TLabel;
    Layout_aba1: TLayout;
    Layout_aba2: TLayout;
    Layout_aba3: TLayout;
    AnimationBall: TFloatAnimation;
    lytMarca: TLayout;
    LytToolMarca: TLayout;
    rctToolMarca: TRectangle;
    lblMarcas: TLabel;
    Path1: TPath;
    rctFundoMarca: TRectangle;
    lstMarcas: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    lstCapacidades: TListView;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    sbtnMarcaAdd: TSpeedButton;
    sbtnCapaAdd: TSpeedButton;
    Path2: TPath;
    lytEdit: TLayout;
    lbl_edt_AddEd: TLabel;
    edt_AddEd: TEdit;
    btn_AddEd_Ok: TSpeedButton;
    rct_AddEd_Ok: TRectangle;
    StyleBook1: TStyleBook;
    rct_Splash_Fundo: TRectangle;
    rct_AddEd_Fundo: TRectangle;
    rct_AddEd_Edit: TRectangle;
    Animat_Fade_Marcas: TFloatAnimation;
    Animat_Show_Marcas: TFloatAnimation;
    Animat_Edit: TFloatAnimation;
    Animat_Fade_Capacidades: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure tmrSplashTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Layout_aba1Click(Sender: TObject);
    procedure AnimationBallFinish(Sender: TObject);
    procedure lstMarcasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btn_AddEd_OkClick(Sender: TObject);
    procedure Animat_Fade_MarcasFinish(Sender: TObject);
    procedure Animat_Show_MarcasFinish(Sender: TObject);
    procedure sbtnMarcaAddClick(Sender: TObject);
    procedure lstMarcasDeleteItem(Sender: TObject; AIndex: Integer);
    procedure lstCapacidadesItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure sbtnCapaAddClick(Sender: TObject);
    procedure Animat_EditFinish(Sender: TObject);
  private
    procedure SelecionaAba(lyt: Tlayout);
    procedure PaintIcon(aba: Integer);
    procedure Pulse(Aba: Integer);
    procedure OpenAddEdItem(aAba, aOperacao : Char; aItemT:String='');
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  vSoft, vVersionDB: String;
  Operacao : Char;
Const
  vVersion = '0.00.000';
implementation


{$R *.fmx}

uses  Data.DB,
      Datamodule;


procedure TfrmMain.Pulse(Aba : Integer);
begin
    img_Pulso.SendToBack;
    img_Pulso.Parent := TLayout(FrmMain.FindComponent('Layout_aba'+aba.ToString));

    AnimationPulso.Start;

    AnimationPulsoW.StopValue := Layout_aba1.Width;
    AnimationPulsoW.Start;
end;


procedure TfrmMain.sbtnCapaAddClick(Sender: TObject);
begin
    OpenAddEdItem('C','I');
end;

procedure TfrmMain.sbtnMarcaAddClick(Sender: TObject);
begin
    OpenAddEdItem('M','I');
end;

procedure TfrmMain.AnimationBallFinish(Sender: TObject);
begin
    PaintIcon(AnimationBall.Tag);
end;

procedure TfrmMain.Animat_EditFinish(Sender: TObject);
begin
    if Animat_edit.Inverse then begin
      lstMarcas.Visible := True;
      Animat_Show_Marcas.Start;
    end;
end;

procedure TfrmMain.Animat_Fade_MarcasFinish(Sender: TObject);
begin
   lstMarcas.Visible    := False;
   lytEdit.Visible := True;
end;

procedure TfrmMain.Animat_Show_MarcasFinish(Sender: TObject);
begin
   //lstMarcas.Opacity := 1;
end;

procedure TfrmMain.btn_AddEd_OkClick(Sender: TObject);
begin

    if edt_AddEd.Text='' then  begin
      ShowMessage('O campo deve estar preenchido!');
      exit;
    end;

    if lbl_Edt_AddEd.Text='Incluir Marca' then begin
      DataM.qry_Marcas.Append;

      DataM.qry_geral.Active := False;
      DataM.qry_geral.SQL.Clear;
      DataM.qry_geral.SQL.Add('SELECT IFNULL(MAX(ID_MARCAS), 0) AS ID_MARCAS FROM TAB_MARCAS');
      DataM.qry_geral.Active := True;

      DataM.qry_Marcas.FieldByName('ID_MARCAS').Value := DataM.qry_geral.FieldByName('ID_MARCAS').AsInteger + 1;

      DataM.qry_Marcas.FieldByName('MARCA').Value := edt_AddEd.Text;
      DataM.qry_Marcas.Post;
    end;

    if lbl_Edt_AddEd.Text='Editar Marca' then begin
      if (DataM.qry_Marcas.State in dsEditModes) then begin
        DataM.qry_Marcas.FieldByName('MARCA').Value := edt_AddEd.Text;
        DataM.qry_Marcas.Post;
      end;
    end;

    sbtnMarcaAdd.Enabled := True;
    sbtnCapaAdd.Enabled  := True;
    rctControls.Enabled  := True;

    Animat_Edit.Inverse := True;
    Animat_Edit.Start;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
    TbcMain.ActiveTab   := TbiSplash;
    TbcMain.TabPosition := TTabPosition.None;
    lytEdit.Visible     := False;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
    rctControls.Visible       := false;
end;

procedure TfrmMain.PaintIcon(aba : Integer);
begin
    Img_Ball.Visible := False;
    TImage(FrmMain.FindComponent('img_aba'+aba.ToString)).Visible        := false;
    TImage(FrmMain.FindComponent('img_aba'+aba.ToString+'_sel')).Visible := true;

end;


procedure TfrmMain.SelecionaAba(lyt : Tlayout);
Var
  i : integer;
begin
    for I := 1 to 3 do
    begin
      TImage(FrmMain.FindComponent('img_aba'+i.ToString)).Visible        := true;
      TImage(FrmMain.FindComponent('img_aba'+i.ToString+'_sel')).Visible := false;
    end;

    Img_Ball.Visible := True;
    AnimationBall.Tag := lyt.Tag;
    AnimationBall.StopValue := lyt.Position.X + (lyt.Width/2) - (img_ball.Width/2);
    AnimationBall.Start;

    Pulse(lyt.Tag);

    // Ativar tabelas
    if Lyt.Tag = 1 then
    begin

      DataM.qry_Marcas.Active   := False;
      DataM.qry_Marcas.Active   := True;

      DataM.qry_Capacidades.Active := False;
      DataM.qry_Capacidades.Active := True;

    end;

    if Lyt.Tag=2 then
    begin
      DataM.qry_Marcas.Active := False;
      DataM.qry_Marcas.Active := True;
      lytEdit.Visible    := False;
    end;
    if Lyt.Tag=3 then
    begin
      DataM.qry_Capacidades.Active := False;
      DataM.qry_Capacidades.Active := True;
    end;


    //Mover TabControl
    TChangeTabAction(FrmMain.FindComponent('actTab'+Lyt.Tag.ToString)).Execute;
end;

procedure TfrmMain.Layout_aba1Click(Sender: TObject);
begin
    SelecionaAba(Tlayout(Sender));
end;

procedure TfrmMain.lstCapacidadesItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

    OpenAddEdItem('C','A',AItem.Text);

end;

procedure TfrmMain.lstMarcasDeleteItem(Sender: TObject; AIndex: Integer);
begin
    DataM.qry_Marcas.Edit;
    DataM.qry_Marcas.Delete;
end;


procedure TfrmMain.lstMarcasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

    OpenAddEdItem('M','A',AItem.Text);

end;

procedure TfrmMain.OpenAddEdItem(aAba, aOperacao : Char; aItemT:String='');

begin
    rctControls.Enabled  := False;
    sbtnMarcaAdd.Enabled := False;
    sbtnCapaAdd.Enabled  := False;
    lytEdit.Visible      := True;
    if aAba = 'M' then begin
        Animat_Fade_Marcas.Start;
        if aOperAcao='A' then begin //Alteração
          DataM.qry_Marcas.Edit;
          operacao := 'A';
          Edt_AddEd.Text := AItemT;

          lbl_Edt_AddEd.Text := 'Editar Marca';


        end else begin //Inclusao

          operacao       := 'I';
          edt_AddEd.Text := '';
          lbl_Edt_AddEd.Text := 'Incluir Marca';

        end;

    end;
    if aAba = 'C' then begin

        Animat_Fade_Capacidades.Start;
        if aOperAcao='A' then begin //Alteração
          DataM.qry_Capacidades.Edit;
          operacao := 'A';
          Edt_AddEd.Text := AItemT;

          lbl_Edt_AddEd.Text := 'Editar Capacidade';


        end else begin //Inclusao

          operacao       := 'I';
          edt_AddEd.Text := '';
          lbl_Edt_AddEd.Text := 'Incluir Capacidade';

        end;

    end;


    Animat_Edit.StopValue := ((FrmMain.Width/2)-140);
    Animat_Edit.Inverse := False;
    Animat_Edit.Start;

end;

procedure TfrmMain.tmrSplashTimer(Sender: TObject);
begin
    tmrSplash.Enabled   := false;
//    FrmMain.Fill.Kind   := TBrushKind.Solid;
//    FrmMain.Fill.Color  := $C8D9760D;

    DataM.qry_configbd.Active := false;
    DataM.qry_configbd.Active := true;

    DataM.qry_Marcas.Active   := False;
    DataM.qry_Marcas.Active   := True;

    DataM.qry_Capacidades.Active := False;
    DataM.qry_Capacidades.Active := True;

    vSoft                     := 'ISBeer';
    vVersionDB                := DataM.qry_configbd.FieldByName('CONFDB_VERSAO').AsString;
    //TODO : Comparar versão


    //Mostra versão
    lblSoftEVersao.Text :=vSoft+' by InnerSoft    Versão: '+vVersion;

    SelecionaAba(Layout_aba1);

    rctControls.Visible := true;

end;

end.
