unit uShipment;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLItemIssuance = class(TSQLRecord)
    private
      fOrderId: TSQLOrderItem;
      //fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fInventoryItem: Integer;
      fShipment: TSQLShipmentItem;
      //fShipmentItemSeq: Integer;
      fFixedAsset: TSQLFixedAssetMaint;
      //fMaintHistSeq: Integer;
      fIssuedDateTime: TDateTime;
      fIssuedByUserLogin: TSQLUserLogin;
      fQuantity: Double;
      fCancelQuantity: Double;
    published
      property OrderId: TSQLOrderItem read fOrderId write fOrderId;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: Integer read fInventoryItem write fInventoryItem;
      property Shipment: TSQLShipmentItem read fShipment write fShipment;
      property FixedAsset: TSQLFixedAssetMaint read fFixedAsset write fFixedAsset;
      property IssuedDateTime: TDateTime read fIssuedDateTime write fIssuedDateTime;
      property IssuedByUserLogin: TSQLUserLogin read fIssuedByUserLogin write fIssuedByUserLogin;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
  end;

  // 2
  TSQLItemIssuanceRole = class(TSQLRecord)
    private
      fItemIssuance: TSQLItemIssuance;
      fPartyRole: TSQLPartyRole;          //partyId, roleTypeId
    published
      property ItemIssuance: TSQLItemIssuance read fItemIssuance write fItemIssuance;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
  end;

  // 3
  TSQLPicklist = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fFacility: TSQLFacility;
      fShipmentMethodType: TSQLShipmentMethodType;
      fStatus: TSQLStatusItem;
      fPicklistDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property Facility: TSQLFacility read fFacility write fFacility;
      property ShipmentMethodType: TSQLShipmentMethodType read fShipmentMethodType write fShipmentMethodType;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property PicklistDate: TDateTime read fPicklistDate write fPicklistDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 4
  TSQLPicklistBin = class(TSQLRecord)
    private
      fPicklist: TSQLPicklist;
      fBinLocationNumber: Integer;
      fPrimaryOrder: TSQLOrderHeader;
      fPrimaryShipGroupSeq: Integer;
    published
      property Picklist: TSQLPicklist read fPicklist write fPicklist;
      property BinLocationNumber: Integer read fBinLocationNumber write fBinLocationNumber;
      property PrimaryOrder: TSQLOrderHeader read fPrimaryOrder write fPrimaryOrder;
      property PrimaryShipGroupSeq: Integer read fPrimaryShipGroupSeq write fPrimaryShipGroupSeq;
  end;

  // 5
  TSQLPicklistItem = class(TSQLRecord)
    private
      fPicklistBin: TSQLPicklistBin;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fInventoryItem: TSQLInventoryItem;
      fStatusItem: TSQLStatusItem;
      fQuantity: Double;
    published
      property PicklistBin: TSQLPicklistBin read fPicklistBin write fPicklistBin;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property StatusItem: TSQLStatusItem read fStatusItem write fStatusItem;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 6
  TSQLPicklistRole = class(TSQLRecord)
    private
      fPicklist: TSQLPicklist;
      fPartyRole: TSQLPartyRole;               //partyId, roleTypeId
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property Picklist: TSQLPicklist read fPicklist write fPicklist;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 7
  TSQLPicklistStatusHistory = class(TSQLRecord)
    private
      fPicklist: TSQLPicklist;
      fChangeDate: TDateTime;
      fChangeUserLogin: TSQLUserLogin;
      fStatus: TSQLStatusValidChange;          //statusId, statusIdTo
    published
      property Picklist: TSQLPicklist read fPicklist write fPicklist;
      property ChangeDate: TDateTime read fChangeDate write fChangeDate;
      property ChangeUserLogin: TSQLUserLogin read fChangeUserLogin write fChangeUserLogin;
      property Status: TSQLStatusValidChange read fStatus write fStatus;
  end;

  // 8
  TSQLRejectionReason = class(TSQLRecord)
    private
      fDescription: RawUTF8;
    published
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 9
  TSQLShipmentReceipt = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItem;
      fProduct: TSQLProduct;
      fShipmentPackage: TSQLShipmentPackage;          //shipmentId, shipmentPackageSeqId
      fShipmentItem: TSQLShipmentItem;                //shipmentId, shipmentItemSeqId
      fOrderItem: TSQLOrderItem;                      //orderId, orderItemSeqId
      fReturnItem: TSQLReturnItem;                    //returnId, returnItemSeqId
      fRejectionReason: TSQLRejectionReason;
      fReceivedByUserLogin: TSQLUserLogin;
      fDatetimeReceived: TDateTime;
      fItemDescription: RawUTF8;
      fQuantityAccepted: Double;
      fQuantityRejected: Double;
    published
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property Product: TSQLProduct read fProduct write fProduct;
      property ShipmentPackage: TSQLShipmentPackage read fShipmentPackage write fShipmentPackage;
      property ShipmentItem: TSQLShipmentItem read fShipmentItem write fShipmentItem;
      property OrderItem: TSQLOrderItem read fOrderItem write fOrderItem;
      property ReturnItem: TSQLReturnItem read fReturnItem write fReturnItem;
      property RejectionReason: TSQLRejectionReason read fRejectionReason write fRejectionReason;
      property ReceivedByUserLogin: TSQLUserLogin read fReceivedByUserLogin write fReceivedByUserLogin;
      property DatetimeReceived: TDateTime read fDatetimeReceived write fDatetimeReceived;
      property ItemDescription: RawUTF8 read fItemDescription write fItemDescription;
      property QuantityAccepted: Double read fQuantityAccepted write fQuantityAccepted;
      property QuantityRejected: Double read fQuantityRejected write fQuantityRejected;
  end;

  // 10
  TSQLShipmentReceiptRole = class(TSQLRecord)
    private
      fReceipt: TSQLShipmentReceipt;
      fPartyRole: TSQLPartyRole;             //partyId, roleTypeId
    published
      property Receipt: TSQLShipmentReceipt read fReceipt write fReceipt;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
  end;

  // 11
  TSQLCarrierShipmentMethod = class(TSQLRecord)
    private
      fShipmentMethodType: TSQLShipmentMethodType;
      fPartyRole: TSQLPartyRole;             //partyId, roleTypeId
      fSequenceNumber: Integer;
      fCarrierServiceCode: RawUTF8;
    published
      property ShipmentMethodType: TSQLShipmentMethodType read fShipmentMethodType write fShipmentMethodType;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
      property SequenceNumber: Integer read fSequenceNumber write fSequenceNumber;
      property CarrierServiceCode: RawUTF8 read fCarrierServiceCode write fCarrierServiceCode;
  end;

  // 12
  TSQLCarrierShipmentBoxType = class(TSQLRecord)
    private
      fShipmentBoxType: TSQLShipmentBoxType;
      fParty: TSQLParty;
      fPackagingTypeCode: Integer;
      fOversizeCode: RawUTF8;
    published
      property ShipmentBoxType: TSQLShipmentBoxType read fShipmentBoxType write fShipmentBoxType;
      property Party: TSQLParty read fParty write fParty;
      property PackagingTypeCode: Integer read fPackagingTypeCode write fPackagingTypeCode;
      property OversizeCode: RawUTF8 read fOversizeCode write fOversizeCode;
  end;

  // 13
  TSQLDelivery = class(TSQLRecord)
    private
      fOriginFacility: TSQLFacility;
      fDestFacility: TSQLFacility;
      fActualStartDate: TDateTime;
      fActualArrivalDate: TDateTime;
      fEstimatedStartDate: TDateTime;
      fEstimatedArrivalDate: TDateTime;
      fFixedAsset: TSQLFixedAsset;
      fStartMileage: Double;
      fEndMileage: Double;
      fFuelUsed: Double;
    published
      property OriginFacility: TSQLFacility read fOriginFacility write fOriginFacility;
      property DestFacility: TSQLFacility read fDestFacility write fDestFacility;
      property ActualStartDate: TDateTime read fActualStartDate write fActualStartDate;
      property ActualArrivalDate: TDateTime read fActualArrivalDate write fActualArrivalDate;
      property EstimatedStartDate: TDateTime read fEstimatedStartDate write fEstimatedStartDate;
      property EstimatedArrivalDate: TDateTime read fEstimatedArrivalDate write fEstimatedArrivalDate;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property StartMileage: Double read fStartMileage write fStartMileage;
      property EndMileage: Double read fEndMileage write fEndMileage;
      property FuelUsed: Double read fFuelUsed write fFuelUsed;
  end;

  // 14
  TSQLShipment = class(TSQLRecord)
    private
      fShipmentType: TSQLShipmentType;
      fStatus: TSQLStatusItem;
      fPrimaryOrder: TSQLOrderItemShipGroup;                //primaryOrderId, primaryShipGroupSeqId
      fPrimaryReturn: TSQLReturnHeader;
      fPicklistBin: TSQLPicklistBin;
      fEstimatedReadyDate: TDateTime;
      fEstimatedShipDate: TDateTime;
      fEstimatedShipWorkEff: TSQLWorkEffort;
      fEstimatedArrivalDate: TDateTime;
      fEstimatedArrivalWorkEff: TSQLWorkEffort;
      fLatestCancelDate: TDateTime;
      fEstimatedShipCost: Currency;
      fCurrencyUom: TSQLUom;
      fHandlingInstructions: RawUTF8;
      fOriginFacility: TSQLFacility;
      fDestinationFacility: TSQLFacility;
      fOriginContactMech: TSQLContactMech;
      fOriginTelecomNumber: TSQLTelecomNumber;
      fDestinationContactMech: TSQLContactMech;
      fDestinationTelecomNumber: TSQLTelecomNumber;
      fPartyTo: TSQLParty;
      fPartyFrom: TSQLParty;
      fAdditionalShippingCharge: Currency;
      fAddtlShippingChargeDesc: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property ShipmentType: TSQLShipmentType read fShipmentType write fShipmentType;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property PrimaryOrder: TSQLOrderItemShipGroup read fPrimaryOrder write fPrimaryOrder;
      property PrimaryReturn: TSQLReturnHeader read fPrimaryReturn write fPrimaryReturn;
      property PicklistBin: TSQLPicklistBin read fPicklistBin write fPicklistBin;
      property EstimatedReadyDate: TDateTime read fEstimatedReadyDate write fEstimatedReadyDate;
      property EstimatedShipDate: TDateTime read fEstimatedShipDate write fEstimatedShipDate;
      property EstimatedShipWorkEff: TSQLWorkEffort read fEstimatedShipWorkEff write fEstimatedShipWorkEff;
      property EstimatedArrivalDate: TDateTime read fEstimatedArrivalDate write fEstimatedArrivalDate;
      property EstimatedArrivalWorkEff: TSQLWorkEffort read fEstimatedArrivalWorkEff write fEstimatedArrivalWorkEff;
      property LatestCancelDate: TDateTime read fLatestCancelDate write fLatestCancelDate;
      property EstimatedShipCost: Currency read fEstimatedShipCost write fEstimatedShipCost;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property HandlingInstructions: RawUTF8 read fHandlingInstructions write fHandlingInstructions;
      property OriginFacility: TSQLFacility read fOriginFacility write fOriginFacility;
      property DestinationFacility: TSQLFacility read fDestinationFacility write fDestinationFacility;
      property OriginContactMech: TSQLContactMech read fOriginContactMech write fOriginContactMech;
      property OriginTelecomNumber: TSQLTelecomNumber read fOriginTelecomNumber write fOriginTelecomNumber;
      property DestinationContactMech: TSQLContactMech read fDestinationContactMech write fDestinationContactMech;
      property DestinationTelecomNumber: TSQLTelecomNumber read fDestinationTelecomNumber write fDestinationTelecomNumber;
      property PartyTo: TSQLParty read fPartyTo write fPartyTo;
      property PartyFrom: TSQLParty read fPartyFrom write fPartyFrom;
      property AdditionalShippingCharge: Currency read fAdditionalShippingCharge write fAdditionalShippingCharge;
      property AddtlShippingChargeDesc: RawUTF8 read fAddtlShippingChargeDesc write fAddtlShippingChargeDesc;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 15
  TSQLShipmentAttribute = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fAttrName: TSQLInventoryItemTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property AttrName: TSQLInventoryItemTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 16
  TSQLShipmentBoxType = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fDimensionUom: TSQLUom;
      fBoxLength: Double;
      fBoxWidth: Double;
      fBoxHeight: Double;
      fWeightUom: TSQLUom;
      fBoxWeight: Double;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property DimensionUom: TSQLUom read fDimensionUom write fDimensionUom;
      property BoxLength: Double read fBoxLength write fBoxLength;
      property BoxWidth: Double read fBoxWidth write fBoxWidth;
      property BoxHeight: Double read fBoxHeight write fBoxHeight;
      property WeightUom: TSQLUom read fWeightUom write fWeightUom;
      property BoxWeight: Double read fBoxWeight write fBoxWeight;
  end;

  // 17
  TSQLShipmentContactMech = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentContactMechType: TSQLShipmentContactMechType;
      fContactMech: TSQLContactMech;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentContactMechType: TSQLShipmentContactMechType read fShipmentContactMechType write fShipmentContactMechType;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
  end;

  // 18
  TSQLShipmentContactMechType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 19
  TSQLShipmentCostEstimate = class(TSQLRecord)
    private
      fCarrierShipmentMethod: TSQLCarrierShipmentMethod;    //shipmentMethodTypeId, carrierPartyId, carrierRoleTypeId
      fProductStoreShipMeth: TSQLProductStoreShipmentMeth;
      fProductStore: Integer;
      fPartyRole: TSQLPartyRole;                          //partyId, roleTypeId
      fGeoTo: TSQLGeo;
      fGeoFrom: TSQLGeo;
      fWeightBreak: TSQLQuantityBreak;
      fWeightUom: TSQLUom;
      fWeightUnitPrice: Currency;
      fQuantityBreak: TSQLQuantityBreak;
      fQuantityUom: TSQLUom;
      fQuantityUnitPrice: Currency;
      fPriceBreak: TSQLQuantityBreak;
      fPriceUom: TSQLUom;
      fPriceUnitPrice: Currency;
      fOrderFlatPrice: Currency;
      fOrderPricePercent: Double;
      fOrderItemFlatPrice: Currency;
      fShippingPricePercent: Double;
      fProductFeatureGroup: TSQLProductFeatureGroup;
      fOversizeUnit: Double;
      fOversizePrice: Currency;
      fFeaturePercent: Double;
      fFeaturePrice: Currency;
    published
      property CarrierShipmentMethod: TSQLCarrierShipmentMethod read fCarrierShipmentMethod write fCarrierShipmentMethod;
      property ProductStoreShipMeth: TSQLProductStoreShipmentMeth read fProductStoreShipMeth write fProductStoreShipMeth;
      property ProductStore: Integer read fProductStore write fProductStore;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
      property GeoTo: TSQLGeo read fGeoTo write fGeoTo;
      property GeoFrom: TSQLGeo read fGeoFrom write fGeoFrom;
      property WeightBreak: TSQLQuantityBreak read fWeightBreak write fWeightBreak;
      property WeightUom: TSQLUom read fWeightUom write fWeightUom;
      property WeightUnitPrice: Currency read fWeightUnitPrice write fWeightUnitPrice;
      property QuantityBreak: TSQLQuantityBreak read fQuantityBreak write fQuantityBreak;
      property QuantityUom: TSQLUom read fQuantityUom write fQuantityUom;
      property QuantityUnitPrice: Currency read fQuantityUnitPrice write fQuantityUnitPrice;
      property PriceBreak: TSQLQuantityBreak read fPriceBreak write fPriceBreak;
      property PriceUom: TSQLUom read fPriceUom write fPriceUom;
      property PriceUnitPrice: Currency read fPriceUnitPrice write fPriceUnitPrice;
      property OrderFlatPrice: Currency read fOrderFlatPrice write fOrderFlatPrice;
      property OrderPricePercent: Double read fOrderPricePercent write fOrderPricePercent;
      property OrderItemFlatPrice: Currency read fOrderItemFlatPrice write fOrderItemFlatPrice;
      property ShippingPricePercent: Double read fShippingPricePercent write fShippingPricePercent;
      property ProductFeatureGroup: TSQLProductFeatureGroup read fProductFeatureGroup write fProductFeatureGroup;
      property OversizeUnit: Double read fOversizeUnit write fOversizeUnit;
      property OversizePrice: Currency read fOversizePrice write fOversizePrice;
      property FeaturePercent: Double read fFeaturePercent write fFeaturePercent;
      property FeaturePrice: Currency read fFeaturePrice write fFeaturePrice;
  end;

  // 20
  TSQLShipmentGatewayConfigType = class(TSQLRecord)
    private
      fParent: TSQLShipmentGatewayConfigType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLShipmentGatewayConfigType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 21
  TSQLShipmentGatewayConfig = class(TSQLRecord)
    private
      fShipmentGatewayConfigType: TSQLShipmentGatewayConfigType;
      FDescription: RawUTF8;
    published
      property ShipmentGatewayConfigType: TSQLShipmentGatewayConfigType read fShipmentGatewayConfigType write fShipmentGatewayConfigType;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 22
  TSQLShipmentGatewayDhl = class(TSQLRecord)
    private
      fShipmentGatewayConfig: TSQLShipmentGatewayConfig;
      fConnectUrl: RawUTF8;
      fConnectTimeout: Integer;
      fHeadVersion: RawUTF8;
      fHeadAction: RawUTF8;
      fAccessUser: Integer;
      fAccessPassword: RawUTF8;
      fAccessAccountNbr: RawUTF8;
      fAccessShippingKey: RawUTF8;
      fLabelImageFormat: RawUTF8;
      fRateEstimateTemplate: RawUTF8;
    published
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfig read fShipmentGatewayConfig write fShipmentGatewayConfig;
      property ConnectUrl: RawUTF8 read fConnectUrl write fConnectUrl;
      property ConnectTimeout: Integer read fConnectTimeout write fConnectTimeout;
      property HeadVersion: RawUTF8 read fHeadVersion write fHeadVersion;
      property HeadAction: RawUTF8 read fHeadAction write fHeadAction;
      property AccessUser: Integer read fAccessUser write fAccessUser;
      property AccessPassword: RawUTF8 read fAccessPassword write fAccessPassword;
      property AccessAccountNbr: RawUTF8 read fAccessAccountNbr write fAccessAccountNbr;
      property AccessShippingKey: RawUTF8 read fAccessShippingKey write fAccessShippingKey;
      property LabelImageFormat: RawUTF8 read fLabelImageFormat write fLabelImageFormat;
      property RateEstimateTemplate: RawUTF8 read fRateEstimateTemplate write fRateEstimateTemplate;
  end;

  // 23
  TSQLShipmentGatewayFedex = class(TSQLRecord)
    private
      fShipmentGatewayConfig: TSQLShipmentGatewayConfig;
      fConnectUrl: RawUTF8;
      fConnectSoapUrl: RawUTF8;
      fConnectTimeout: Integer;
      fAccessAccountNbr: RawUTF8;
      fAccessMeterNumber: RawUTF8;
      fAccessUserKey: RawUTF8;
      fAccessUserPwd: RawUTF8;
      fLabelImageType: RawUTF8;
      fDefaultDropoffType: RawUTF8;
      fDefaultPackagingType: RawUTF8;
      fTemplateShipment: RawUTF8;
      fTemplateSubscription: RawUTF8;
      fRateEstimateTemplate: RawUTF8;
    published
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfig read fShipmentGatewayConfig write fShipmentGatewayConfig;
      property ConnectUrl: RawUTF8 read fConnectUrl write fConnectUrl;
      property ConnectSoapUrl: RawUTF8 read fConnectSoapUrl write fConnectSoapUrl;
      property ConnectTimeout: Integer read fConnectTimeout write fConnectTimeout;
      property AccessAccountNbr: RawUTF8 read fAccessAccountNbr write fAccessAccountNbr;
      property AccessMeterNumber: RawUTF8 read fAccessMeterNumber write fAccessMeterNumber;
      property AccessUserKey: RawUTF8 read fAccessUserKey write fAccessUserKey;
      property AccessUserPwd: RawUTF8 read fAccessUserPwd write fAccessUserPwd;
      property LabelImageType: RawUTF8 read fLabelImageType write fLabelImageType;
      property DefaultDropoffType: RawUTF8 read fDefaultDropoffType write fDefaultDropoffType;
      property DefaultPackagingType: RawUTF8 read fDefaultPackagingType write fDefaultPackagingType;
      property TemplateShipment: RawUTF8 read fTemplateShipment write fTemplateShipment;
      property TemplateSubscription: RawUTF8 read fTemplateSubscription write fTemplateSubscription;
      property RateEstimateTemplate: RawUTF8 read fRateEstimateTemplate write fRateEstimateTemplate;
  end;

  // 24
  TSQLShipmentGatewayUps = class(TSQLRecord)
    private
      fShipmentGatewayConfig: TSQLShipmentGatewayConfig;
      fConnectUrl: RawUTF8;
      fConnectTimeout: Integer;
      fShipperNumber: RawUTF8;
      fBillShipperAccountNumber: RawUTF8;
      fAccessLicenseNumber: RawUTF8;
      fAccessUser: Integer;
      fAccessPassword: RawUTF8;
      fSaveCertInfo: RawUTF8;
      fSaveCertPath: RawUTF8;
      fShipperPickupType: RawUTF8;
      fCustomerClassification: RawUTF8;
      fMaxEstimateWeight: Double;
      fMinEstimateWeight: Double;
      fCodAllowCod: RawUTF8;
      fCodSurchargeAmount: Double;
      fCodSurchargeCurrencyUom: TSQLUom;
      fCodSurchargeApplyToPackage: RawUTF8;
      fCodFundsCode: RawUTF8;
      fDefaultReturnLabelMemo: RawUTF8;
      fDefaultReturnLabelSubject: RawUTF8;
    published
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfig read fShipmentGatewayConfig write fShipmentGatewayConfig;
      property ConnectUrl: RawUTF8 read fConnectUrl write fConnectUrl;
      property ConnectTimeout: Integer read fConnectTimeout write fConnectTimeout;
      property ShipperNumber: RawUTF8 read fShipperNumber write fShipperNumber;
      property BillShipperAccountNumber: RawUTF8 read fBillShipperAccountNumber write fBillShipperAccountNumber;
      property AccessLicenseNumber: RawUTF8 read fAccessLicenseNumber write fAccessLicenseNumber;
      property AccessUser: Integer read fAccessUser write fAccessUser;
      property AccessPassword: RawUTF8 read fAccessPassword write fAccessPassword;
      property SaveCertInfo: RawUTF8 read fSaveCertInfo write fSaveCertInfo;
      property SaveCertPath: RawUTF8 read fSaveCertPath write fSaveCertPath;
      property ShipperPickupType: RawUTF8 read fShipperPickupType write fShipperPickupType;
      property CustomerClassification: RawUTF8 read fCustomerClassification write fCustomerClassification;
      property MaxEstimateWeight: Double read fMaxEstimateWeight write fMaxEstimateWeight;
      property MinEstimateWeight: Double read fMinEstimateWeight write fMinEstimateWeight;
      property CodAllowCod: RawUTF8 read fCodAllowCod write fCodAllowCod;
      property CodSurchargeAmount: Double read fCodSurchargeAmount write fCodSurchargeAmount;
      property CodSurchargeCurrencyUom: TSQLUom read fCodSurchargeCurrencyUom write fCodSurchargeCurrencyUom;
      property CodSurchargeApplyToPackage: RawUTF8 read fCodSurchargeApplyToPackage write fCodSurchargeApplyToPackage;
      property CodFundsCode: RawUTF8 read fCodFundsCode write fCodFundsCode;
      property DefaultReturnLabelMemo: RawUTF8 read fDefaultReturnLabelMemo write fDefaultReturnLabelMemo;
      property DefaultReturnLabelSubject: RawUTF8 read fDefaultReturnLabelSubject write fDefaultReturnLabelSubject;
  end;

  // 25
  TSQLShipmentGatewayUsps = class(TSQLRecord)
    private
      fShipmentGatewayConfig: TSQLShipmentGatewayConfig;
      fConnectUrl: RawUTF8;
      fConnectUrlLabels: RawUTF8;
      fConnectTimeout: Integer;
      fAccessUser: Integer;
      fAccessPassword: RawUTF8;
      fMaxEstimateWeight: Double;
    published
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfig read fShipmentGatewayConfig write fShipmentGatewayConfig;
      property ConnectUrl: RawUTF8 read fConnectUrl write fConnectUrl;
      property ConnectUrlLabels: RawUTF8 read fConnectUrlLabels write fConnectUrlLabels;
      property ConnectTimeout: Integer read fConnectTimeout write fConnectTimeout;
      property AccessUser: Integer read fAccessUser write fAccessUser;
      property AccessPassword: RawUTF8 read fAccessPassword write fAccessPassword;
      property MaxEstimateWeight: Double read fMaxEstimateWeight write fMaxEstimateWeight;
  end;

  // 26
  TSQLShipmentItem = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentItemSeq: Integer;
      fProduct: TSQLProduct;
      fQuantity: Double;
      fShipmentContentDescription: RawUTF8;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Product: TSQLProduct read fProduct write fProduct;
      property Quantity: Double read fQuantity write fQuantity;
      property ShipmentContentDescription: RawUTF8 read fShipmentContentDescription write fShipmentContentDescription;
  end;

  // 27
  TSQLShipmentItemBilling = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentItemSeq: Integer;
      fInvoiceItem: TSQLInvoiceItem;         //invoiceId, invoiceItemSeqId
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property InvoiceItem: TSQLInvoiceItem read fInvoiceItem write fInvoiceItem;
  end;

  // 28
  TSQLShipmentItemFeature = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentItemSeq: Integer;
      fProductFeature: TSQLProductFeature;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
  end;

  // 29
  TSQLShipmentMethodType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
      fSequenceNum: Integer;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 30
  TSQLShipmentPackage = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentPackageSeq: Integer;
      fShipmentBoxType: TSQLShipmentBoxType;
      fDateCreated: TDateTime;
      fBoxLength: Double;
      fBoxHeight: Double;
      fBoxWidth: Double;
      fDimensionUom: TSQLUom;
      fWeight: Double;
      fWeightUom: TSQLUom;
      fInsuredValue: Currency;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentPackageSeq: Integer read fShipmentPackageSeq write fShipmentPackageSeq;
      property ShipmentBoxType: TSQLShipmentBoxType read fShipmentBoxType write fShipmentBoxType;
      property DateCreated: TDateTime read fDateCreated write fDateCreated;
      property BoxLength: Double read fBoxLength write fBoxLength;
      property BoxHeight: Double read fBoxHeight write fBoxHeight;
      property BoxWidth: Double read fBoxWidth write fBoxWidth;
      property DimensionUom: TSQLUom read fDimensionUom write fDimensionUom;
      property Weight: Double read fWeight write fWeight;
      property WeightUom: TSQLUom read fWeightUom write fWeightUom;
      property InsuredValue: Currency read fInsuredValue write fInsuredValue;
  end;

  // 31
  TSQLShipmentPackageContent = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentPackageSeq: Integer;
      fShipmentItemSeq: Integer;
      fQuantity: Double;
      fSubProduct: TSQLProduct;
      fSubProductQuantity: Double;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentPackageSeq: Integer read fShipmentPackageSeq write fShipmentPackageSeq;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Quantity: Double read fQuantity write fQuantity;
      property SubProduct: TSQLProduct read fSubProduct write fSubProduct;
      property SubProductQuantity: Double read fSubProductQuantity write fSubProductQuantity;
  end;

  // 32
  TSQLShipmentPackageRouteSeg = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentPackageSeq: Integer;
      fShipmentRouteSegment: TSQLShipmentRouteSegment;
      fTrackingCode: RawUTF8;
      fBoxNumber: RawUTF8;
      fLabelImage: TSQLRawBlob;
      fLabelIntlSignImage: TSQLRawBlob;
      fLabelHtml: TSQLRawBlob;
      fLabelPrinted: Boolean;
      fInternationalInvoice: TSQLRawBlob;
      fPackageTransportCost: Currency;
      fPackageServiceCost: Currency;
      fPackageOtherCost: Currency;
      fCodAmount: Currency;
      fInsuredAmount: Currency;
      fCurrencyUom: TSQLUom;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentPackageSeq: Integer read fShipmentPackageSeq write fShipmentPackageSeq;
      property ShipmentRouteSegment: TSQLShipmentRouteSegment read fShipmentRouteSegment write fShipmentRouteSegment;
      property TrackingCode: RawUTF8 read fTrackingCode write fTrackingCode;
      property BoxNumber: RawUTF8 read fBoxNumber write fBoxNumber;
      property LabelImage: TSQLRawBlob read fLabelImage write fLabelImage;
      property LabelIntlSignImage: TSQLRawBlob read fLabelIntlSignImage write fLabelIntlSignImage;
      property LabelHtml: TSQLRawBlob read fLabelHtml write fLabelHtml;
      property LabelPrinted: Boolean read fLabelPrinted write fLabelPrinted;
      property InternationalInvoice: TSQLRawBlob read fInternationalInvoice write fInternationalInvoice;
      property PackageTransportCost: Currency read fPackageTransportCost write fPackageTransportCost;
      property PackageServiceCost: Currency read fPackageServiceCost write fPackageServiceCost;
      property PackageOtherCost: Currency read fPackageOtherCost write fPackageOtherCost;
      property CodAmount: Currency read fCodAmount write fCodAmount;
      property InsuredAmount: Currency read fInsuredAmount write fInsuredAmount;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
  end;

  // 33
  TSQLShipmentRouteSegment = class(TSQLRecord)
    private
      fShipment: TSQLShipment;
      fShipmentRouteSegment: Integer;
      fDelivery: TSQLDelivery;
      fOriginFacility: TSQLFacility;
      fDestFacility: TSQLFacility;
      fOriginContactMech: TSQLContactMech;
      fOriginTelecomNumber: TSQLTelecomNumber;
      fDestContactMech: TSQLContactMech;
      fDestTelecomNumber: TSQLTelecomNumber;
      fCarrierParty: TSQLParty;
      fShipmentMethodType: TSQLShipmentMethodType;
      fCarrierServiceStatus: TSQLStatusItem;
      fCarrierDeliveryZone: RawUTF8;
      fCarrierRestrictionCodes: RawUTF8;
      fCarrierRestrictionDesc: RawUTF8;
      fBillingWeight: Double;
      fBillingWeightUom: TSQLUom;
      fActualTransportCost: Currency;
      fActualServiceCost: Currency;
      fActualOtherCost: Currency;
      fActualCost: Currency;
      fCurrencyUom: TSQLUom;
      fActualStartDate: TDateTime;
      fActualArrivalDate: TDateTime;
      fEstimatedStartDate: TDateTime;
      fEstimatedArrivalDate: TDateTime;
      fTrackingIdNumber: RawUTF8;
      fTrackingDigest: TSQLRawBlob;
      fUpdatedByUserLogin: TSQLUserLogin;
      fLastUpdatedDate: TDateTime;
      fHomeDeliveryType: Integer;
      fHomeDeliveryDate: TDateTime;
      fThirdPartyAccountNumber: Integer;
      fThirdPartyPostalCode: Integer;
      fThirdPartyCountryGeoCode: Integer;
      fUpsHighValueReport: TSQLRawBlob;
    published
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentRouteSegment: Integer read fShipmentRouteSegment write fShipmentRouteSegment;
      property Delivery: TSQLDelivery read fDelivery write fDelivery;
      property OriginFacility: TSQLFacility read fOriginFacility write fOriginFacility;
      property DestFacility: TSQLFacility read fDestFacility write fDestFacility;
      property OriginContactMech: TSQLContactMech read fOriginContactMech write fOriginContactMech;
      property OriginTelecomNumber: TSQLTelecomNumber read fOriginTelecomNumber write fOriginTelecomNumber;
      property DestContactMech: TSQLContactMech read fDestContactMech write fDestContactMech;
      property DestTelecomNumber: TSQLTelecomNumber read fDestTelecomNumber write fDestTelecomNumber;
      property CarrierParty: TSQLParty read fCarrierParty write fCarrierParty;
      property ShipmentMethodType: TSQLShipmentMethodType read fShipmentMethodType write fShipmentMethodType;
      property CarrierServiceStatus: TSQLStatusItem read fCarrierServiceStatus write fCarrierServiceStatus;
      property CarrierDeliveryZone: RawUTF8 read fCarrierDeliveryZone write fCarrierDeliveryZone;
      property CarrierRestrictionCodes: RawUTF8 read fCarrierRestrictionCodes write fCarrierRestrictionCodes;
      property CarrierRestrictionDesc: RawUTF8 read fCarrierRestrictionDesc write fCarrierRestrictionDesc;
      property BillingWeight: Double read fBillingWeight write fBillingWeight;
      property BillingWeightUom: TSQLUom read fBillingWeightUom write fBillingWeightUom;
      property ActualTransportCost: Currency read fActualTransportCost write fActualTransportCost;
      property ActualServiceCost: Currency read fActualServiceCost write fActualServiceCost;
      property ActualOtherCost: Currency read fActualOtherCost write fActualOtherCost;
      property ActualCost: Currency read fActualCost write fActualCost;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property ActualStartDate: TDateTime read fActualStartDate write fActualStartDate;
      property ActualArrivalDate: TDateTime read fActualArrivalDate write fActualArrivalDate;
      property EstimatedStartDate: TDateTime read fEstimatedStartDate write fEstimatedStartDate;
      property EstimatedArrivalDate: TDateTime read fEstimatedArrivalDate write fEstimatedArrivalDate;
      property TrackingIdNumber: RawUTF8 read fTrackingIdNumber write fTrackingIdNumber;
      property TrackingDigest: TSQLRawBlob read fTrackingDigest write fTrackingDigest;
      property UpdatedByUserLogin: TSQLUserLogin read fUpdatedByUserLogin write fUpdatedByUserLogin;
      property LastUpdatedDate: TDateTime read fLastUpdatedDate write fLastUpdatedDate;
      property HomeDeliveryType: Integer read fHomeDeliveryType write fHomeDeliveryType;
      property HomeDeliveryDate: TDateTime read fHomeDeliveryDate write fHomeDeliveryDate;
      property ThirdPartyAccountNumber: Integer read fThirdPartyAccountNumber write fThirdPartyAccountNumber;
      property ThirdPartyPostalCode: Integer read fThirdPartyPostalCode write fThirdPartyPostalCode;
      property ThirdPartyCountryGeoCode: Integer read fThirdPartyCountryGeoCode write fThirdPartyCountryGeoCode;
      property UpsHighValueReport: TSQLRawBlob read fUpsHighValueReport write fUpsHighValueReport;
  end;

{  // 34
  TSQL = class(TSQLRecord)
    private
    published
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
  end;}

  // 35
  TSQLShipmentStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fShipment: TSQLShipment;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Shipment: TSQLShipment read fShipment write fShipment;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 36
  TSQLShipmentType = class(TSQLRecord)
    private
      fParent: TSQLShipmentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLShipmentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 37
  TSQLShipmentTypeAttr = class(TSQLRecord)
    private
      fShipmentType: TSQLShipmentType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property ShipmentType: TSQLShipmentType read fShipmentType write fShipmentType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 38
  TSQLShippingDocument = class(TSQLRecord)
    private
      fDocument: TSQLDocument;
      fShipment: TSQLShipmentItem;        //shipmentId, shipmentItemSeqId
      fShipmentPackage: TSQLShipmentPackage;            //shipmentId, shipmentPackageSeqId
      fDescription: RawUTF8;
    published
      property Document: TSQLDocument read fDocument write fDocument;
      property Shipment: TSQLShipmentItem read fShipment write fShipment;
      property ShipmentPackage: TSQLShipmentPackage read fShipmentPackage write fShipmentPackage;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

implementation

end.

