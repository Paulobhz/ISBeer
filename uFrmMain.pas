unit uFrmMain;

interface

uses
  Data.Bind.Components,
  Data.Bind.DBScope,
  Data.Bind.EngExt,

  FMX.ActnList,
  FMX.Ani,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Edit,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.ListBox,
  FMX.ListView,
  FMX.ListView.Adapters.Base,
  FMX.ListView.Appearances,
  FMX.ListView.Types,
  FMX.MultiView,
  FMX.Objects,
  FMX.Platform,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  FMX.VirtualKeyboard,

  Fmx.Bind.DBEngExt,
  Fmx.Bind.Editors,

  System.Actions,
  System.Bindings.Outputs,
  System.Classes,
  System.Rtti,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TItem = record
      CodItem    : String;
      Marca      : String;
      Capacidade : Integer;
      ValUnit,
      ValLitro   : double;
  end;
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
    StyleBook1: TStyleBook;
    rct_Splash_Fundo: TRectangle;
    Animat_Fade_Marcas: TFloatAnimation;
    Animat_Show_Marcas: TFloatAnimation;
    Animat_Fade_Capacidades: TFloatAnimation;
    rctMelhorEscolha: TRectangle;
    Label2: TLabel;
    lblEscolha: TLabel;
    vert: TVertScrollBox;
    btnAddItem: TSpeedButton;
    Path3: TPath;
    btnLimpaLista: TSpeedButton;
    Path4: TPath;
    Image1: TImage;
    lytEdit: TLayout;
    rct_AddEd_Fundo: TRectangle;
    lbl_edt_AddEd: TLabel;
    rct_AddEd_Ok: TRectangle;
    btn_AddEd_Ok: TSpeedButton;
    rct_AddEd_Edit: TRectangle;
    edt_AddEd: TEdit;
    Animat_Edit: TFloatAnimation;
    lytItem: TLayout;
    rctFundo: TRectangle;
    lblItem: TLabel;
    Rectangle3: TRectangle;
    btnItemOk: TSpeedButton;
    Rectangle4: TRectangle;
    edtValUnit: TEdit;
    animatItem: TFloatAnimation;
    Rectangle5: TRectangle;
    cbxMarca: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Rectangle6: TRectangle;
    cbxCapacidade: TComboBox;
    Label6: TLabel;
    LinkListControlToField3: TLinkListControlToField;
    LinkListControlToField4: TLinkListControlToField;
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
    procedure btnAddItemClick(Sender: TObject);
    procedure btnLimpaListaClick(Sender: TObject);
    procedure edtValUnitKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    procedure SelecionaAba(lyt: Tlayout);
    procedure PaintIcon(aba: Integer);
    procedure Pulse(Aba: Integer);
    procedure OpenAddEdItem(aAba, aOperacao : Char; aItemT:String='');
    procedure AddItem(CodItem, marca, capacidade: String; ValorUnit, ValorLt: Double);
    procedure SelecionaItem(Sender: TObject);
    procedure SelecionaItemTap(Sender: TObject; const Point: TPointF);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  vSoft, vVersionDB: String;
  Operacao : Char;
  Nitem : Integer;
  aItens : Array of TItem;
Const
  vVersion = '0.00.000';
  StVazio  = 'Irmos comprar mais cerveja !!!';
implementation


{$R *.fmx}

uses  Data.DB,
      Datamodule;

Procedure FormatarMoeda( Componente : TObject; var Key: Char );
var
   valor_str  : String;
   valor  : double;
begin

        if Componente is TEdit then
        begin
                // Se tecla pressionada � um numero, backspace ou delete...
                if  CharInSet(Key,['0'..'9', #8, #9] ) then
                begin
                         // Salva valor do edit...
                         valor_str := TEdit( Componente ).Text;

                         // Valida vazio...
                         if valor_str = EmptyStr then
                                valor_str := '0,00';

                         // Se valor numerico, insere na string...
                         if CharInSet(Key,['0'..'9']) then
                                valor_str := Concat( valor_str, Key ) ;

                         // Retira pontos e virgulas...
                         valor_str := Trim( StringReplace( valor_str, '.', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
                         valor_str := Trim( StringReplace( valor_str, ',', '', [rfReplaceAll, rfIgnoreCase] ) ) ;

                         // Inserindo 2 casas decimais...
                         valor := StrToFloat( valor_str ) ;
                         valor := ( valor / 100 ) ;

                         // Retornando valor tratado ao edit...
                         TEdit( Componente ).Text := FormatFloat( '###,##0.00', valor ) ;

                         // Reposiciona cursor...
                         TEdit( Componente ).SelStart := Length( TEdit( Componente ).Text );
                end;

                // Se nao � key importante, reseta...
                if Not( CharInSet(Key,[#8, #9]) ) then
                        key := #0;
        end;

end;

procedure TFrmMain.SelecionaItem(Sender: TObject);
begin
    showmessage('Item selecionado: ' + TRectangle(Sender).TagString);
end;

procedure TFrmMain.SelecionaItemTap(Sender: TObject; const Point: TPointF);
begin
    showmessage('Item selecionado: ' + TRectangle(Sender).TagString);
end;



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

procedure TfrmMain.AddItem(CodItem, marca, capacidade: String; ValorUnit,
  ValorLt: Double);
Var
  rect,
  rect_icone,
  rect_barra : TRectangle;
  lbl  : TLabel;

begin
  rect := TRectangle.Create(Vert);
  with rect do
  begin
      Align         := TAlignLayout.Top;
      Height        := 60;
      Fill.Color    := $FFFFFFFF;
      Stroke.Kind   := TBrushKind.Solid;
      Stroke.Color  := $FFd4d5d7;
{      if codItem='001' then
        Margins.Top   := 150
      else
 }       Margins.Top   := 10;
      Margins.Left  := 10;
      Margins.Right := 10;
      XRadius := 8;
      YRadius :=8;
      TagString := CodItem;

      {$IFDEF MSWINDOWS}
      onClick := SelecionaItem;
      {$ELSE}
      onTap := SelecionaItemTap;
      {$ENDIF}
  end;

  rect_barra := TRectangle.Create(Rect);
  with rect_barra do
  begin
      Align         := TAlignLayout.Bottom;
      Height        := 30;
      Fill.Color    := $FFF4F4F4;
      Stroke.Kind   := TBrushKind.Solid;
      Stroke.Color  := $FFd4d5d7;
      Sides         := [TSide.Left,TSide.Bottom,TSide.Right];
      Corners       := [TCorner.BottomLeft,TCorner.BottomRight];
      XRadius       := 8;
      YRadius       := 8;
      HitTest       := False;
      rect.AddObject(rect_barra);
  end;

  //Marca
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF666666;
      Text                    := 'Marca';
      Font.Size               := 10;
      Width                   := 100;
      Position.X              := 10;
      Position.Y              := 10;
      rect.AddObject(lbl);
  end;
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF333333;
      Text                    := marca;
      Font.Size               := 12;
      Width                   := 100;
      Position.X              := 10;
      Position.Y              := 8;
      Font.Style              := [TFontStyle.fsBold];
      rect_barra.AddObject(lbl);
  end;

  //Capacidade
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF666666;
      Text                    := 'Capacidade';
      Font.Size               := 10;
      Width                   := 100;
      Position.X              := 100;
      Position.Y              := 10;
      rect.AddObject(lbl);
  end;
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF333333;
      Text                    := capacidade + ' ml';
      Font.Size               := 12;
      Width                   := 100;
      Position.X              := 100;
      Position.Y              := 8;
      Font.Style              := [TFontStyle.fsBold];
      rect_barra.AddObject(lbl);
  end;

  //Valor Unit�rio
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF666666;
      Text                    := 'Valor Unit�rio';
      Font.Size               := 10;
      Width                   := 100;
      Position.X              := 180;
      Position.Y              := 10;
      rect.AddObject(lbl);
  end;
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF333333;
      Text                    := 'R$ '+ FormatFloat('#,##0.00',ValorUnit);
      Font.Size               := 12;
      Width                   := 100;
      Position.X              := 180;
      Position.Y              := 8;
      Font.Style              := [TFontStyle.fsBold];
      rect_barra.AddObject(lbl);
  end;


  //Valor Litro
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF666666;
      Text                    := 'Valor Litro';
      Font.Size               := 10;
      Width                   := 100;
      Position.X              := 280;
      Position.Y              := 10;
      rect.AddObject(lbl);
  end;
  lbl := TLabel.Create(Rect);
  with lbl do
  begin
      StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor  := $FF333333;
      Text                    := 'R$ '+ FormatFloat('#,##0.00',ValorLt);
      Font.Size               := 12;
      Width                   := 100;
      Position.X              := 280;
      Position.Y              := 8;
      Font.Style              := [TFontStyle.fsBold];
      rect_barra.AddObject(lbl);
  end;

  Vert.AddObject(Rect);
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

procedure TfrmMain.btnAddItemClick(Sender: TObject);
begin
  btnAddItem.Enabled := False;
  btnLimpaLista.Enabled := False;
  rctControls.Enabled := False;
  lblItem.Text := 'Incluir Item';
  AnimatItem.StopValue := ((FrmMain.Width/2)-140);
  AnimatItem.Inverse := False;

  AnimatItem.Start;
end;

procedure TfrmMain.btnLimpaListaClick(Sender: TObject);
Var
  I : Integer;
begin
    for I := Vert.ComponentCount -1 downto 0 do
        if (Vert.Components[I] is TRectangle) then
            Vert.Components[I].DisposeOf;
    lblEscolha.Text     := StVazio;
    SetLength(aItens, 0);
    aItens := nil;
end;

procedure TfrmMain.btn_AddEd_OkClick(Sender: TObject);
var
  KeyboardService: IFMXVirtualKeyboardService;
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
    if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
      KeyboardService.HideVirtualKeyboard;
    sbtnMarcaAdd.Enabled := True;
    sbtnCapaAdd.Enabled  := True;
    rctControls.Enabled  := True;

    Animat_Edit.Inverse := True;
    Animat_Edit.Start;

end;

procedure TfrmMain.edtValUnitKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    FormatarMoeda(edtValUnit,KeyChar);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
    TbcMain.ActiveTab   := TbiSplash;
    TbcMain.TabPosition := TTabPosition.None;
    lytEdit.Visible     := False;
    NItem := 0;
    SetLength(aItens, 0);
    aItens := nil;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
    rctControls.Visible := false;
    lblEscolha.Text     := StVazio;
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
        if aOperAcao='A' then begin //Altera��o
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
        if aOperAcao='A' then begin //Altera��o
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
    //TODO : Comparar vers�o


    //Mostra vers�o
    lblSoftEVersao.Text :=vSoft+' by InnerSoft    Vers�o: '+vVersion;

    SelecionaAba(Layout_aba1);

    rctControls.Visible := true;
//    ResizeObjects;
{    AddItem('001','Skol','476',2.98,6);
    AddItem('002','Brahma','267',1.98,8.9);
    AddItem('003','Stella','375',3.98,10.01);
    AddItem('004','Walls','350',3.57,7.58);}
end;

end.
