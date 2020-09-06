program zCoreServer;

{$I Synopse.inc}

uses
  {$I SynDprUses.inc}
  Classes, SysUtils, CustApp,
  SynCommons,
  SynLog,
  SynCrypto,
  SynSQLite3Static,
  //SynSQLite3,
  mORMot, mORMotSQLite3, mORMotHttpServer, mORMotHttpClient, uModel,
  uForwardDeclaration, uAccounting, uWorkEffort, uShipment, uMarketing, uManufacturing;

type

  { TCoreServer }

  TCoreServer = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    PartyModel: TSQLModel;
    PartyServer: TSQLRestServer;
    PartyHTTPServer: TSQLHttpServer;

    ProductModel: TSQLModel;
    ProductServer: TSQLRestServer;
    ProductHTTPServer: TSQLHttpServer;

    OrderModel: TSQLModel;
    OrderServer: TSQLRestServer;
    OrderHTTPServer: TSQLHttpServer;

    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TCoreServer }

procedure TCoreServer.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  with TSQLLog.Family do begin
    Level := LOG_VERBOSE;
    EchoToConsole := LOG_VERBOSE;
  end;

  //FreeAndNil(sqlite3); // release any previous instance (e.g. static)
  //sqlite3 := TSQLite3LibraryDynamic.Create;
  //sqlite3 := TSQLite3LibraryDynamic.Create('/usr/local/lib/libsqlite3.so.0.8.6');

  PartyModel := CreatePartyModel;
  ProductModel := CreateProductModel;
  OrderModel := CreateOrderModel;
  try
    //PartyServer := TSQLRestServerFullMemory.Create(PartyModel,'test.json',False,True);
    PartyServer := TSQLRestServerDB.Create(PartyModel,ChangeFileExt(paramstr(0),'Party.db3'), True);
    ProductServer := TSQLRestServerDB.Create(ProductModel,ChangeFileExt(paramstr(0),'Product.db3'), True);
    OrderServer := TSQLRestServerDB.Create(OrderModel,ChangeFileExt(paramstr(0),'Order.db3'), True);
    try
      //PartyServer.DB.Synchronous := smNormal;
      //PartyServer.DB.LockingMode := lmExclusive;
      PartyServer.CreateMissingTables;
      ProductServer.CreateMissingTables;
      OrderServer.CreateMissingTables;
      //PartyServer.ServiceDefine(TServiceCalculator,[ICalculator],sicShared);
      {$ifndef ONLYUSEHTTPSOCKET}
        PartyHTTPServer := TSQLHttpServer.Create('3618',[PartyServer],'+',useHttpApiRegisteringURI);
        ProductHTTPServer := TSQLHttpServer.Create('3618',[ProductServer],'+',useHttpApiRegisteringURI);
        orderHTTPServer := TSQLHttpServer.Create('3618',[OrderServer],'+',useHttpApiRegisteringURI);
      {$else}
        PartyHTTPServer := TSQLHttpServer.Create('3618',[PartyServer],'+',useHttpSocket);
        ProductHTTPServer := TSQLHttpServer.Create('3618',[ProductServer],'+',useHttpSocket);
        OrderHTTPServer := TSQLHttpServer.Create('3618',[OrderServer],'+',useHttpSocket);
      {$endif}
      //PartyHTTPServer := TSQLHttpServer.Create('3618',[PartyServer],'+',useHttpSocket);
      try
        PartyHTTPServer.AccessControlAllowOrigin := '*'; // for AJAX requests to work
        ProductHTTPServer.AccessControlAllowOrigin := '*';
        OrderHTTPServer.AccessControlAllowOrigin := '*';
        writeln(#10'Background server is running.'#10);
        writeln('Press [Enter] to close the server.'#10);
        readln;
      finally
        PartyHTTPServer.Free;
        ProductHTTPServer.Free;
        OrderHTTPServer.Free;
      end;
    finally
      PartyServer.Free;
      ProductServer.Free;
      OrderServer.Free;
    end;
  finally
    PartyModel.Free;
    ProductModel.Free;
    OrderModel.Free;
  end;

  // stop program loop
  Terminate;
end;

constructor TCoreServer.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TCoreServer.Destroy;
begin
  inherited Destroy;
end;

procedure TCoreServer.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TCoreServer;
begin
  Application:=TCoreServer.Create(nil);
  Application.Title:='zDream Core Application';
  Application.Run;
  Application.Free;
end.
