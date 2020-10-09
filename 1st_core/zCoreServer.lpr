program zCoreServer;

{$define MAX_SQLFIELDS_128}     //不起作用

{$I Synopse.inc}

uses
  {$I SynDprUses.inc}
  Classes, SysUtils, CustApp,
  SynCommons,
  SynLog,
  SynCrypto,
  SynSQLite3Static,
  mORMot, mORMotSQLite3, mORMotHttpServer, mORMotHttpClient, uModel;

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

    AccountingModel: TSQLModel;
    AccountingServer: TSQLRestServer;
    AccountingHTTPServer: TSQLHttpServer;

    WorkEffortModel: TSQLModel;
    WorkEffortServer: TSQLRestServer;
    WorkEffortHTTPServer: TSQLHttpServer;

    ShipmentModel: TSQLModel;
    ShipmentServer: TSQLRestServer;
    ShipmentHTTPServer: TSQLHttpServer;

    MarketingModel: TSQLModel;
    MarketingServer: TSQLRestServer;
    MarketingHTTPServer: TSQLHttpServer;

    ManufacturingModel: TSQLModel;
    ManufacturingServer: TSQLRestServer;
    ManufacturingHTTPServer: TSQLHttpServer;

    HumanresModel: TSQLModel;
    HumanresServer: TSQLRestServer;
    HumanresHTTPServer: TSQLHttpServer;

    CommonModel: TSQLModel;
    CommonServer: TSQLRestServer;
    CommonHTTPServer: TSQLHttpServer;

    ContentModel: TSQLModel;
    ContentServer: TSQLRestServer;
    ContentHTTPServer: TSQLHttpServer;

    SecurityModel: TSQLModel;
    SecurityServer: TSQLRestServer;
    SecurityHTTPServer: TSQLHttpServer;

    ServiceModel: TSQLModel;
    ServiceServer: TSQLRestServer;
    ServiceHTTPServer: TSQLHttpServer;

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

  writeln(#10'MAX_SQLFIELDS = ', MAX_SQLFIELDS);
  PartyModel := CreatePartyModel;
  ProductModel := CreateProductModel;
  OrderModel := CreateOrderModel;
  AccountingModel := CreateAccountingModel;
  WorkEffortModel := CreateWorkEffortModel;
  ShipmentModel := CreateShipmentModel;
  MarketingModel := CreateMarketingModel;
  ManufacturingModel := CreateManufacturingModel;
  HumanresModel := CreateHumanresModel;
  CommonModel := CreateCommonModel;
  ContentModel := CreateContentModel;
  SecurityModel := CreateSecurityModel;
  ServiceModel := CreateServiceModel;
  try
    //PartyServer := TSQLRestServerFullMemory.Create(PartyModel,'test.json',False,True);
    PartyServer := TSQLRestServerDB.Create(PartyModel,ChangeFileExt(paramstr(0),'Party.db3'), True);
    ProductServer := TSQLRestServerDB.Create(ProductModel,ChangeFileExt(paramstr(0),'Product.db3'), True);
    OrderServer := TSQLRestServerDB.Create(OrderModel,ChangeFileExt(paramstr(0),'Order.db3'), True);
    AccountingServer := TSQLRestServerDB.Create(AccountingModel,ChangeFileExt(paramstr(0),'Accounting.db3'), True);
    WorkEffortServer := TSQLRestServerDB.Create(WorkEffortModel,ChangeFileExt(paramstr(0),'WorkEffort.db3'), True);
    ShipmentServer := TSQLRestServerDB.Create(ShipmentModel,ChangeFileExt(paramstr(0),'Shipment.db3'), True);
    MarketingServer := TSQLRestServerDB.Create(MarketingModel,ChangeFileExt(paramstr(0),'Marketing.db3'), True);
    ManufacturingServer := TSQLRestServerDB.Create(ManufacturingModel,ChangeFileExt(paramstr(0),'Manufacturing.db3'), True);
    HumanresServer := TSQLRestServerDB.Create(HumanresModel,ChangeFileExt(paramstr(0),'Humanres.db3'), True);
    CommonServer := TSQLRestServerDB.Create(CommonModel,ChangeFileExt(paramstr(0),'Common.db3'), True);
    ContentServer := TSQLRestServerDB.Create(ContentModel,ChangeFileExt(paramstr(0),'Content.db3'), True);
    SecurityServer := TSQLRestServerDB.Create(SecurityModel,ChangeFileExt(paramstr(0),'Security.db3'), True);
    ServiceServer := TSQLRestServerDB.Create(ServiceModel,ChangeFileExt(paramstr(0),'Service.db3'), True);
    try
      //PartyServer.DB.Synchronous := smNormal;
      //PartyServer.DB.LockingMode := lmExclusive;
      PartyServer.CreateMissingTables;
      ProductServer.CreateMissingTables;
      OrderServer.CreateMissingTables;
      AccountingServer.CreateMissingTables;
      WorkEffortServer.CreateMissingTables;
      ShipmentServer.CreateMissingTables;
      MarketingServer.CreateMissingTables;
      ManufacturingServer.CreateMissingTables;
      HumanresServer.CreateMissingTables;
      CommonServer.CreateMissingTables;
      ContentServer.CreateMissingTables;
      SecurityServer.CreateMissingTables;
      ServiceServer.CreateMissingTables;
      //PartyServer.ServiceDefine(TServiceCalculator,[ICalculator],sicShared);
      {$ifndef ONLYUSEHTTPSOCKET}
        PartyHTTPServer := TSQLHttpServer.Create('3618',[PartyServer],'+',useHttpApiRegisteringURI);
        ProductHTTPServer := TSQLHttpServer.Create('3618',[ProductServer],'+',useHttpApiRegisteringURI);
        OrderHTTPServer := TSQLHttpServer.Create('3618',[OrderServer],'+',useHttpApiRegisteringURI);
        AccountingHTTPServer := TSQLHttpServer.Create('3618',[AccountingServer],'+',useHttpApiRegisteringURI);
        WorkEffortHTTPServer := TSQLHttpServer.Create('3618',[WorkEffortServer],'+',useHttpApiRegisteringURI);
        ShipmentHTTPServer := TSQLHttpServer.Create('3618',[ShipmentServer],'+',useHttpApiRegisteringURI);
        MarketingHTTPServer := TSQLHttpServer.Create('3618',[MarketingServer],'+',useHttpApiRegisteringURI);
        ManufacturingHTTPServer := TSQLHttpServer.Create('3618',[ManufacturingServer],'+',useHttpApiRegisteringURI);
        HumanresHTTPServer := TSQLHttpServer.Create('3618',[HumanresServer],'+',useHttpApiRegisteringURI);
        CommonHTTPServer := TSQLHttpServer.Create('3618',[CommonServer],'+',useHttpApiRegisteringURI);
        ContentHTTPServer := TSQLHttpServer.Create('3618',[ContentServer],'+',useHttpApiRegisteringURI);
        SecurityHTTPServer := TSQLHttpServer.Create('3618',[SecurityServer],'+',useHttpApiRegisteringURI);
        ServiceHTTPServer := TSQLHttpServer.Create('3618',[ServiceServer],'+',useHttpApiRegisteringURI);
      {$else}
        PartyHTTPServer := TSQLHttpServer.Create('3618',[PartyServer],'+',useHttpSocket);
        ProductHTTPServer := TSQLHttpServer.Create('3618',[ProductServer],'+',useHttpSocket);
        OrderHTTPServer := TSQLHttpServer.Create('3618',[OrderServer],'+',useHttpSocket);
        AccountingHTTPServer := TSQLHttpServer.Create('3618',[AccountingServer],'+',useHttpSocket);
        WorkEffortHTTPServer := TSQLHttpServer.Create('3618',[WorkEffortServer],'+',useHttpSocket);
        ShipmentHTTPServer := TSQLHttpServer.Create('3618',[ShipmentServer],'+',useHttpSocket);
        MarketingHTTPServer := TSQLHttpServer.Create('3618',[MarketingServer],'+',useHttpSocket);
        ManufacturingHTTPServer := TSQLHttpServer.Create('3618',[ManufacturingServer],'+',useHttpSocket);
        HumanresHTTPServer := TSQLHttpServer.Create('3618',[HumanresServer],'+',useHttpSocket);
        CommonHTTPServer := TSQLHttpServer.Create('3618',[CommonServer],'+',useHttpSocket);
        ContentHTTPServer := TSQLHttpServer.Create('3618',[ContentServer],'+',useHttpSocket);
        SecurityHTTPServer := TSQLHttpServer.Create('3618',[SecurityServer],'+',useHttpSocket);
        ServiceHTTPServer := TSQLHttpServer.Create('3618',[ServiceServer],'+',useHttpSocket);
      {$endif}
      //PartyHTTPServer := TSQLHttpServer.Create('3618',[PartyServer],'+',useHttpSocket);
      try
        PartyHTTPServer.AccessControlAllowOrigin := '*'; // for AJAX requests to work
        ProductHTTPServer.AccessControlAllowOrigin := '*';
        OrderHTTPServer.AccessControlAllowOrigin := '*';
        AccountingHTTPServer.AccessControlAllowOrigin := '*';
        WorkEffortHTTPServer.AccessControlAllowOrigin := '*';
        ShipmentHTTPServer.AccessControlAllowOrigin := '*';
        MarketingHTTPServer.AccessControlAllowOrigin := '*';
        ManufacturingHTTPServer.AccessControlAllowOrigin := '*';
        HumanresHTTPServer.AccessControlAllowOrigin := '*';
        CommonHTTPServer.AccessControlAllowOrigin := '*';
        ContentHTTPServer.AccessControlAllowOrigin := '*';
        SecurityHTTPServer.AccessControlAllowOrigin := '*';
        ServiceHTTPServer.AccessControlAllowOrigin := '*';
        writeln(#10'MAX_SQLFIELDS = ', MAX_SQLFIELDS);
        writeln(#10'Background server is running.'#10);
        writeln('Press [Enter] to close the server.'#10);
        readln;
      finally
        PartyHTTPServer.Free;
        ProductHTTPServer.Free;
        OrderHTTPServer.Free;
        AccountingHTTPServer.Free;
        WorkEffortHTTPServer.Free;
        ShipmentHTTPServer.Free;
        MarketingHTTPServer.Free;
        ManufacturingHTTPServer.Free;
        HumanresHTTPServer.Free;
        CommonHTTPServer.Free;
        ContentHTTPServer.Free;
        SecurityHTTPServer.Free;
        ServiceHTTPServer.Free;
      end;
    finally
      PartyServer.Free;
      ProductServer.Free;
      OrderServer.Free;
      AccountingServer.Free;
      WorkEffortServer.Free;
      ShipmentServer.Free;
      MarketingServer.Free;
      ManufacturingServer.Free;
      HumanresServer.Free;
      CommonServer.Free;
      ContentServer.Free;
      SecurityServer.Free;
      ServiceServer.Free;
    end;
  finally
    PartyModel.Free;
    ProductModel.Free;
    OrderModel.Free;
    AccountingModel.Free;
    WorkEffortModel.Free;
    ShipmentModel.Free;
    MarketingModel.Free;
    ManufacturingModel.Free;
    HumanresModel.Free;
    CommonModel.Free;
    ContentModel.Free;
    SecurityModel.Free;
    ServiceModel.Free;
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
