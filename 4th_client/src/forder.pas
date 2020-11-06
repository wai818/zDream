unit fOrder;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Buttons, attabs;

type

  { TFrameOrder }

  TFrameOrder = class(TFrame)
    BitBtn1: TBitBtn;
  private
    { private declarations }
  public
    { public declarations }
    //tab: TATTabData;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrameOrder: TFrameOrder;

implementation

{$R *.lfm}

constructor TFrameOrder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TFrameOrder.Destroy;
begin
  FrameOrder:= nil;
  inherited Destroy;
end;

end.

