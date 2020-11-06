unit fProduct;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, ComCtrls, attabs;

type

  { TFrameProduct }

  TFrameProduct = class(TFrame)
    pMain: TPanel;
    pLeft: TPanel;
    Splitter1: TSplitter;
    tbMain: TToolBar;
    tbNew: TToolButton;
  private
    { private declarations }
  public
    { public declarations }
    //tab: TATTabData;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrameProduct: TFrameProduct;

implementation

{$R *.lfm}

constructor TFrameProduct.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TFrameProduct.Destroy;
begin
  FrameProduct:= nil;
  inherited Destroy;
end;

end.

