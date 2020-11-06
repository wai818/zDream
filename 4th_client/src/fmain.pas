unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Menus,
  ActnList, ExtCtrls, ComCtrls, attabs, fParty, fProduct, fOrder, Types;

type

  { TFormMain }

  TFormMain = class(TForm)
    aSysAdmin: TAction;
    aProduct: TAction;
    aOrder: TAction;
    aParty: TAction;
    alMain: TActionList;
    pMain: TPanel;
    ilMain: TImageList;
    mmMain: TMainMenu;
    miOrder: TMenuItem;
    miSysAdmin: TMenuItem;
    miParty: TMenuItem;
    miProduct: TMenuItem;
    sbMain: TStatusBar;
    tbMain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure aOrderExecute(Sender: TObject);
    procedure aPartyExecute(Sender: TObject);
    procedure aProductExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    fLockEdit: boolean;
    fTabPlusMenu: TPopupMenu;

    procedure TabClick(A: TObject);
    procedure TabPlusClick(A: TObject);
    procedure TabClose(Sender: TObject; ATabIndex: Integer; var ACanClose, ACanContinue: boolean);
  public
    { public declarations }
    attMain: TATTabs;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

uses
  Math, Dialogs;

{ TFormMain }

procedure TFormMain.TabClick(A: TObject);
var
  d: TATTabData;
begin
  d:= attMain.GetTabData(attMain.TabIndex);
  TFrame(d.TabObject).BringToFront;
end;

//Tab标签页添加按钮事件
procedure TFormMain.TabPlusClick(A: TObject);
var
  i: Integer;
  mi: TMenuItem;
  RDown: TRect;
  P: TPoint;
begin
  if mmMain.Items.Count=0 then Exit;
  //if not attMain.TabShowPlus then exit;

  if not Assigned(fTabPlusMenu) then
    fTabPlusMenu:= TPopupMenu.Create(Self);
  fTabPlusMenu.Items.Clear;

  for i:= 0 to mmMain.Items.Count-1 do begin
    mi:= TMenuItem.Create(Self);
    mi.Action:= mmMain.Items[i].Action;
    fTabPlusMenu.Items.Add(mi);
  end;

  RDown:= attMain.GetTabRect_Plus;
  P:= Point(RDown.Left, RDown.Bottom+attMain.Height);
  P:= ClientToScreen(P);
  fTabPlusMenu.Popup(P.X, P.Y);
end;


procedure TFormMain.TabClose(Sender: TObject; ATabIndex: Integer;
  var ACanClose, ACanContinue: boolean);
var
  d: TATTabData;
  s: string;
begin
  ACanClose:= False;
  ACanContinue:= False;

  d:= (Sender as TATTabs).GetTabData(ATabIndex);
  if d=nil then Exit;

  if MessageDlg('Question', 'Do you wish to Close?', mtConfirmation, [mbYes, mbNo],0) = mrNo then exit;

  d.TabObject.Free;

  ACanClose:= true;
  ACanContinue:= True;
end;

procedure TFormMain.aPartyExecute(Sender: TObject);
var
  i: Integer;
begin
  if not Assigned(FrameParty) then begin
    FrameParty := TFrameParty.Create(pMain);
    FrameParty.Parent := pMain;
    FrameParty.Align:= alClient;

    attMain.AddTab(-1, aParty.Caption, FrameParty);

    attMain.TabIndex:= attMain.TabCount-1;
    //FrameParty.tab:= attMain.GetTabData(attMain.TabIndex);
  end else begin
    for i:=0 to attMain.TabCount-1 do
      if attMain.GetTabData(i).TabObject=FrameParty then attMain.TabIndex:= i;
  end;
end;

procedure TFormMain.aOrderExecute(Sender: TObject);
var
  i: Integer;
begin
  if not Assigned(FrameOrder) then begin
    FrameOrder := TFrameOrder.Create(pMain);
    FrameOrder.Parent := pMain;
    FrameOrder.Align:= alClient;

    attMain.AddTab(-1, aOrder.Caption, FrameOrder);

    attMain.TabIndex:= attMain.TabCount-1;
    //FrameOrder.tab:= attMain.GetTabData(attMain.TabIndex);
  end else begin
    for i:=0 to attMain.TabCount-1 do
      if attMain.GetTabData(i).TabObject=FrameOrder then attMain.TabIndex:= i;
  end;
end;

procedure TFormMain.aProductExecute(Sender: TObject);
var
  tProduct: TATTabs;
  i: Integer;
begin
  if not Assigned(FrameProduct) then begin
    FrameProduct := TFrameProduct.Create(pMain);
    FrameProduct.Parent := pMain;
    FrameProduct.Align:= alClient;

    attMain.AddTab(-1, aProduct.Caption, FrameProduct);

    attMain.TabIndex:= attMain.TabCount-1;
    //FrameProduct.tab:= attMain.GetTabData(attMain.TabIndex);
  end else begin
    for i:=0 to attMain.TabCount-1 do
      if attMain.GetTabData(i).TabObject=FrameProduct then attMain.TabIndex:= i;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  attMain:= TATTabs.Create(Self);
  attMain.Parent:= pMain;
  attMain.Align:= alTop;

  attMain.OptSpaceSide:= 10;
  attMain.OptAnimationEnabled:= true;
  attMain.OptMouseDragEnabled:= true;
  attMain.DragMode:= dmAutomatic;

  attMain.OnTabClick:= @TabClick;
  attMain.OnTabPlusClick:= @TabPlusClick;
  attMain.OnTabClose:= @TabClose;

end;

end.

