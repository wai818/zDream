unit fParty;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, attabs;

type

  { TFrameParty }

  TFrameParty = class(TFrame)
    Panel1: TPanel;
    Splitter1: TSplitter;
  private
    { private declarations }
  public
    { public declarations }
    //tab: TATTabData;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrameParty: TFrameParty;

implementation

{$R *.lfm}

constructor TFrameParty.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TFrameParty.Destroy;
begin
  FrameParty:= nil;
  inherited Destroy;
end;

end.

