unit uShipment;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLItemIssuance = class(TSQLRecord)
    private
      fOrderId: TSQLOrderItemID;
      //fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fInventoryItem: Integer;
      fShipment: TSQLShipmentItemID;
      //fShipmentItemSeq: Integer;
      fFixedAsset: TSQLFixedAssetMaintID;
      //fMaintHistSeq: Integer;
      fIssuedDateTime: TDateTime;
      fIssuedByUserLogin: TSQLUserLoginID;
      fQuantity: Double;
      fCancelQuantity: Double;
    published
      property OrderId: TSQLOrderItemID read fOrderId write fOrderId;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: Integer read fInventoryItem write fInventoryItem;
      property Shipment: TSQLShipmentItemID read fShipment write fShipment;
      property FixedAsset: TSQLFixedAssetMaintID read fFixedAsset write fFixedAsset;
      property IssuedDateTime: TDateTime read fIssuedDateTime write fIssuedDateTime;
      property IssuedByUserLogin: TSQLUserLoginID read fIssuedByUserLogin write fIssuedByUserLogin;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
  end;

  // 2
  TSQLItemIssuanceRole = class(TSQLRecord)
    private
      fItemIssuance: TSQLItemIssuanceID;
      fPartyRole: TSQLPartyRoleID;          //partyId, roleTypeId
    published
      property ItemIssuance: TSQLItemIssuanceID read fItemIssuance write fItemIssuance;
      property PartyRole: TSQLPartyRoleID read fPartyRole write fPartyRole;
  end;

  // 3
  TSQLPicklist = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fFacility: TSQLFacilityID;
      fShipmentMethodType: TSQLShipmentMethodTypeID;
      fStatus: TSQLStatusItemID;
      fPicklistDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property ShipmentMethodType: TSQLShipmentMethodTypeID read fShipmentMethodType write fShipmentMethodType;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property PicklistDate: TDateTime read fPicklistDate write fPicklistDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 4
  TSQLPicklistBin = class(TSQLRecord)
    private
      fPicklist: TSQLPicklistID;
      fBinLocationNumber: Integer;
      fPrimaryOrder: TSQLOrderHeaderID;
      fPrimaryShipGroupSeq: Integer;
    published
      property Picklist: TSQLPicklistID read fPicklist write fPicklist;
      property BinLocationNumber: Integer read fBinLocationNumber write fBinLocationNumber;
      property PrimaryOrder: TSQLOrderHeaderID read fPrimaryOrder write fPrimaryOrder;
      property PrimaryShipGroupSeq: Integer read fPrimaryShipGroupSeq write fPrimaryShipGroupSeq;
  end;

  // 5
  TSQLPicklistItem = class(TSQLRecord)
    private
      fPicklistBin: TSQLPicklistBinID;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fInventoryItem: TSQLInventoryItemID;
      fStatusItem: TSQLStatusItemID;
      fQuantity: Double;
    published
      property PicklistBin: TSQLPicklistBinID read fPicklistBin write fPicklistBin;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property StatusItem: TSQLStatusItemID read fStatusItem write fStatusItem;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 6
  TSQLPicklistRole = class(TSQLRecord)
    private
      fPicklist: TSQLPicklistID;
      fPartyRole: TSQLPartyRoleID;               //partyId, roleTypeId
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property Picklist: TSQLPicklistID read fPicklist write fPicklist;
      property PartyRole: TSQLPartyRoleID read fPartyRole write fPartyRole;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 7
  TSQLPicklistStatusHistory = class(TSQLRecord)
    private
      fPicklist: TSQLPicklistID;
      fChangeDate: TDateTime;
      fChangeUserLogin: TSQLUserLoginID;
      fStatus: TSQLStatusValidChangeID;          //statusId, statusIdTo
    published
      property Picklist: TSQLPicklistID read fPicklist write fPicklist;
      property ChangeDate: TDateTime read fChangeDate write fChangeDate;
      property ChangeUserLogin: TSQLUserLoginID read fChangeUserLogin write fChangeUserLogin;
      property Status: TSQLStatusValidChangeID read fStatus write fStatus;
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
      fInventoryItem: TSQLInventoryItemID;
      fProduct: TSQLProductID;
      fShipmentPackage: TSQLShipmentPackageID;          //shipmentId, shipmentPackageSeqId
      fShipmentItem: TSQLShipmentItemID;                //shipmentId, shipmentItemSeqId
      fOrderItem: TSQLOrderItemID;                      //orderId, orderItemSeqId
      fReturnItem: TSQLReturnItemID;                    //returnId, returnItemSeqId
      fRejectionReason: TSQLRejectionReasonID;
      fReceivedByUserLogin: TSQLUserLoginID;
      fDatetimeReceived: TDateTime;
      fItemDescription: RawUTF8;
      fQuantityAccepted: Double;
      fQuantityRejected: Double;
    published
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property Product: TSQLProductID read fProduct write fProduct;
      property ShipmentPackage: TSQLShipmentPackageID read fShipmentPackage write fShipmentPackage;
      property ShipmentItem: TSQLShipmentItemID read fShipmentItem write fShipmentItem;
      property OrderItem: TSQLOrderItemID read fOrderItem write fOrderItem;
      property ReturnItem: TSQLReturnItemID read fReturnItem write fReturnItem;
      property RejectionReason: TSQLRejectionReasonID read fRejectionReason write fRejectionReason;
      property ReceivedByUserLogin: TSQLUserLoginID read fReceivedByUserLogin write fReceivedByUserLogin;
      property DatetimeReceived: TDateTime read fDatetimeReceived write fDatetimeReceived;
      property ItemDescription: RawUTF8 read fItemDescription write fItemDescription;
      property QuantityAccepted: Double read fQuantityAccepted write fQuantityAccepted;
      property QuantityRejected: Double read fQuantityRejected write fQuantityRejected;
  end;

  // 10
  TSQLShipmentReceiptRole = class(TSQLRecord)
    private
      fReceipt: TSQLShipmentReceiptID;
      fPartyRole: TSQLPartyRoleID;             //partyId, roleTypeId
    published
      property Receipt: TSQLShipmentReceiptID read fReceipt write fReceipt;
      property PartyRole: TSQLPartyRoleID read fPartyRole write fPartyRole;
  end;

  // 11
  TSQLCarrierShipmentMethod = class(TSQLRecord)
    private
      fShipmentMethodType: TSQLShipmentMethodTypeID;
      fPartyRole: TSQLPartyRoleID;             //partyId, roleTypeId
      fSequenceNumber: Integer;
      fCarrierServiceCode: RawUTF8;
    published
      property ShipmentMethodType: TSQLShipmentMethodTypeID read fShipmentMethodType write fShipmentMethodType;
      property PartyRole: TSQLPartyRoleID read fPartyRole write fPartyRole;
      property SequenceNumber: Integer read fSequenceNumber write fSequenceNumber;
      property CarrierServiceCode: RawUTF8 read fCarrierServiceCode write fCarrierServiceCode;
  end;

  // 12
  TSQLCarrierShipmentBoxType = class(TSQLRecord)
    private
      fShipmentBoxType: TSQLShipmentBoxTypeID;
      fParty: TSQLPartyID;
      fPackagingTypeCode: Integer;
      fOversizeCode: RawUTF8;
    published
      property ShipmentBoxType: TSQLShipmentBoxTypeID read fShipmentBoxType write fShipmentBoxType;
      property Party: TSQLPartyID read fParty write fParty;
      property PackagingTypeCode: Integer read fPackagingTypeCode write fPackagingTypeCode;
      property OversizeCode: RawUTF8 read fOversizeCode write fOversizeCode;
  end;

  // 13
  TSQLDelivery = class(TSQLRecord)
    private
      fOriginFacility: TSQLFacilityID;
      fDestFacility: TSQLFacilityID;
      fActualStartDate: TDateTime;
      fActualArrivalDate: TDateTime;
      fEstimatedStartDate: TDateTime;
      fEstimatedArrivalDate: TDateTime;
      fFixedAsset: TSQLFixedAssetID;
      fStartMileage: Double;
      fEndMileage: Double;
      fFuelUsed: Double;
    published
      property OriginFacility: TSQLFacilityID read fOriginFacility write fOriginFacility;
      property DestFacility: TSQLFacilityID read fDestFacility write fDestFacility;
      property ActualStartDate: TDateTime read fActualStartDate write fActualStartDate;
      property ActualArrivalDate: TDateTime read fActualArrivalDate write fActualArrivalDate;
      property EstimatedStartDate: TDateTime read fEstimatedStartDate write fEstimatedStartDate;
      property EstimatedArrivalDate: TDateTime read fEstimatedArrivalDate write fEstimatedArrivalDate;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property StartMileage: Double read fStartMileage write fStartMileage;
      property EndMileage: Double read fEndMileage write fEndMileage;
      property FuelUsed: Double read fFuelUsed write fFuelUsed;
  end;

  // 14
  TSQLShipment = class(TSQLRecord)
    private
      fShipmentType: TSQLShipmentTypeID;
      fStatus: TSQLStatusItemID;
      fPrimaryOrder: TSQLOrderItemShipGroupID;                //primaryOrderId, primaryShipGroupSeqId
      fPrimaryReturn: TSQLReturnHeaderID;
      fPicklistBin: TSQLPicklistBinID;
      fEstimatedReadyDate: TDateTime;
      fEstimatedShipDate: TDateTime;
      fEstimatedShipWorkEff: TSQLWorkEffortID;
      fEstimatedArrivalDate: TDateTime;
      fEstimatedArrivalWorkEff: TSQLWorkEffortID;
      fLatestCancelDate: TDateTime;
      fEstimatedShipCost: Currency;
      fCurrencyUom: TSQLUomID;
      fHandlingInstructions: RawUTF8;
      fOriginFacility: TSQLFacilityID;
      fDestinationFacility: TSQLFacilityID;
      fOriginContactMech: TSQLContactMechID;
      fOriginTelecomNumber: TSQLTelecomNumberID;
      fDestinationContactMech: TSQLContactMechID;
      fDestinationTelecomNumber: TSQLTelecomNumberID;
      fPartyTo: TSQLPartyID;
      fPartyFrom: TSQLPartyID;
      fAdditionalShippingCharge: Currency;
      fAddtlShippingChargeDesc: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property ShipmentType: TSQLShipmentTypeID read fShipmentType write fShipmentType;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property PrimaryOrder: TSQLOrderItemShipGroupID read fPrimaryOrder write fPrimaryOrder;
      property PrimaryReturn: TSQLReturnHeaderID read fPrimaryReturn write fPrimaryReturn;
      property PicklistBin: TSQLPicklistBinID read fPicklistBin write fPicklistBin;
      property EstimatedReadyDate: TDateTime read fEstimatedReadyDate write fEstimatedReadyDate;
      property EstimatedShipDate: TDateTime read fEstimatedShipDate write fEstimatedShipDate;
      property EstimatedShipWorkEff: TSQLWorkEffortID read fEstimatedShipWorkEff write fEstimatedShipWorkEff;
      property EstimatedArrivalDate: TDateTime read fEstimatedArrivalDate write fEstimatedArrivalDate;
      property EstimatedArrivalWorkEff: TSQLWorkEffortID read fEstimatedArrivalWorkEff write fEstimatedArrivalWorkEff;
      property LatestCancelDate: TDateTime read fLatestCancelDate write fLatestCancelDate;
      property EstimatedShipCost: Currency read fEstimatedShipCost write fEstimatedShipCost;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property HandlingInstructions: RawUTF8 read fHandlingInstructions write fHandlingInstructions;
      property OriginFacility: TSQLFacilityID read fOriginFacility write fOriginFacility;
      property DestinationFacility: TSQLFacilityID read fDestinationFacility write fDestinationFacility;
      property OriginContactMech: TSQLContactMechID read fOriginContactMech write fOriginContactMech;
      property OriginTelecomNumber: TSQLTelecomNumberID read fOriginTelecomNumber write fOriginTelecomNumber;
      property DestinationContactMech: TSQLContactMechID read fDestinationContactMech write fDestinationContactMech;
      property DestinationTelecomNumber: TSQLTelecomNumberID read fDestinationTelecomNumber write fDestinationTelecomNumber;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
      property PartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property AdditionalShippingCharge: Currency read fAdditionalShippingCharge write fAdditionalShippingCharge;
      property AddtlShippingChargeDesc: RawUTF8 read fAddtlShippingChargeDesc write fAddtlShippingChargeDesc;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 15
  TSQLShipmentAttribute = class(TSQLRecord)
    private
      fShipment: TSQLShipmentID;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 16
  TSQLShipmentBoxType = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fDimensionUom: TSQLUomID;
      fBoxLength: Double;
      fBoxWidth: Double;
      fBoxHeight: Double;
      fWeightUom: TSQLUomID;
      fBoxWeight: Double;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property DimensionUom: TSQLUomID read fDimensionUom write fDimensionUom;
      property BoxLength: Double read fBoxLength write fBoxLength;
      property BoxWidth: Double read fBoxWidth write fBoxWidth;
      property BoxHeight: Double read fBoxHeight write fBoxHeight;
      property WeightUom: TSQLUomID read fWeightUom write fWeightUom;
      property BoxWeight: Double read fBoxWeight write fBoxWeight;
  end;

  // 17
  TSQLShipmentContactMech = class(TSQLRecord)
    private
      fShipment: TSQLShipmentID;
      fShipmentContactMechType: TSQLShipmentContactMechTypeID;
      fContactMech: TSQLContactMechID;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentContactMechType: TSQLShipmentContactMechTypeID read fShipmentContactMechType write fShipmentContactMechType;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
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
      fCarrierShipmentMethod: TSQLCarrierShipmentMethodID;    //shipmentMethodTypeId, carrierPartyId, carrierRoleTypeId
      fProductStoreShipMeth: TSQLProductStoreShipmentMethID;
      fProductStore: Integer;
      fPartyRole: TSQLPartyRoleID;                          //partyId, roleTypeId
      fGeoTo: TSQLGeoID;
      fGeoFrom: TSQLGeoID;
      fWeightBreak: TSQLQuantityBreakID;
      fWeightUom: TSQLUomID;
      fWeightUnitPrice: Currency;
      fQuantityBreak: TSQLQuantityBreakID;
      fQuantityUom: TSQLUomID;
      fQuantityUnitPrice: Currency;
      fPriceBreak: TSQLQuantityBreakID;
      fPriceUom: TSQLUomID;
      fPriceUnitPrice: Currency;
      fOrderFlatPrice: Currency;
      fOrderPricePercent: Double;
      fOrderItemFlatPrice: Currency;
      fShippingPricePercent: Double;
      fProductFeatureGroup: TSQLProductFeatureGroupID;
      fOversizeUnit: Double;
      fOversizePrice: Currency;
      fFeaturePercent: Double;
      fFeaturePrice: Currency;
    published
      property CarrierShipmentMethod: TSQLCarrierShipmentMethodID read fCarrierShipmentMethod write fCarrierShipmentMethod;
      property ProductStoreShipMeth: TSQLProductStoreShipmentMethID read fProductStoreShipMeth write fProductStoreShipMeth;
      property ProductStore: Integer read fProductStore write fProductStore;
      property PartyRole: TSQLPartyRoleID read fPartyRole write fPartyRole;
      property GeoTo: TSQLGeoID read fGeoTo write fGeoTo;
      property GeoFrom: TSQLGeoID read fGeoFrom write fGeoFrom;
      property WeightBreak: TSQLQuantityBreakID read fWeightBreak write fWeightBreak;
      property WeightUom: TSQLUomID read fWeightUom write fWeightUom;
      property WeightUnitPrice: Currency read fWeightUnitPrice write fWeightUnitPrice;
      property QuantityBreak: TSQLQuantityBreakID read fQuantityBreak write fQuantityBreak;
      property QuantityUom: TSQLUomID read fQuantityUom write fQuantityUom;
      property QuantityUnitPrice: Currency read fQuantityUnitPrice write fQuantityUnitPrice;
      property PriceBreak: TSQLQuantityBreakID read fPriceBreak write fPriceBreak;
      property PriceUom: TSQLUomID read fPriceUom write fPriceUom;
      property PriceUnitPrice: Currency read fPriceUnitPrice write fPriceUnitPrice;
      property OrderFlatPrice: Currency read fOrderFlatPrice write fOrderFlatPrice;
      property OrderPricePercent: Double read fOrderPricePercent write fOrderPricePercent;
      property OrderItemFlatPrice: Currency read fOrderItemFlatPrice write fOrderItemFlatPrice;
      property ShippingPricePercent: Double read fShippingPricePercent write fShippingPricePercent;
      property ProductFeatureGroup: TSQLProductFeatureGroupID read fProductFeatureGroup write fProductFeatureGroup;
      property OversizeUnit: Double read fOversizeUnit write fOversizeUnit;
      property OversizePrice: Currency read fOversizePrice write fOversizePrice;
      property FeaturePercent: Double read fFeaturePercent write fFeaturePercent;
      property FeaturePrice: Currency read fFeaturePrice write fFeaturePrice;
  end;

  // 20
  TSQLShipmentGatewayConfigType = class(TSQLRecord)
    private
      fParent: TSQLShipmentGatewayConfigTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLShipmentGatewayConfigTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 21
  TSQLShipmentGatewayConfig = class(TSQLRecord)
    private
      fShipmentGatewayConfigType: TSQLShipmentGatewayConfigTypeID;
      FDescription: RawUTF8;
    published
      property ShipmentGatewayConfigType: TSQLShipmentGatewayConfigTypeID read fShipmentGatewayConfigType write fShipmentGatewayConfigType;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 22
  TSQLShipmentGatewayDhl = class(TSQLRecord)
    private
      fShipmentGatewayConfig: TSQLShipmentGatewayConfigID;
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
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfigID read fShipmentGatewayConfig write fShipmentGatewayConfig;
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
      fShipmentGatewayConfig: TSQLShipmentGatewayConfigID;
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
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfigID read fShipmentGatewayConfig write fShipmentGatewayConfig;
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
      fShipmentGatewayConfig: TSQLShipmentGatewayConfigID;
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
      fCodSurchargeCurrencyUom: TSQLUomID;
      fCodSurchargeApplyToPackage: RawUTF8;
      fCodFundsCode: RawUTF8;
      fDefaultReturnLabelMemo: RawUTF8;
      fDefaultReturnLabelSubject: RawUTF8;
    published
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfigID read fShipmentGatewayConfig write fShipmentGatewayConfig;
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
      property CodSurchargeCurrencyUom: TSQLUomID read fCodSurchargeCurrencyUom write fCodSurchargeCurrencyUom;
      property CodSurchargeApplyToPackage: RawUTF8 read fCodSurchargeApplyToPackage write fCodSurchargeApplyToPackage;
      property CodFundsCode: RawUTF8 read fCodFundsCode write fCodFundsCode;
      property DefaultReturnLabelMemo: RawUTF8 read fDefaultReturnLabelMemo write fDefaultReturnLabelMemo;
      property DefaultReturnLabelSubject: RawUTF8 read fDefaultReturnLabelSubject write fDefaultReturnLabelSubject;
  end;

  // 25
  TSQLShipmentGatewayUsps = class(TSQLRecord)
    private
      fShipmentGatewayConfig: TSQLShipmentGatewayConfigID;
      fConnectUrl: RawUTF8;
      fConnectUrlLabels: RawUTF8;
      fConnectTimeout: Integer;
      fAccessUser: Integer;
      fAccessPassword: RawUTF8;
      fMaxEstimateWeight: Double;
    published
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfigID read fShipmentGatewayConfig write fShipmentGatewayConfig;
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
      fShipment: TSQLShipmentID;
      fShipmentItemSeq: Integer;
      fProduct: TSQLProductID;
      fQuantity: Double;
      fShipmentContentDescription: RawUTF8;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property Quantity: Double read fQuantity write fQuantity;
      property ShipmentContentDescription: RawUTF8 read fShipmentContentDescription write fShipmentContentDescription;
  end;

  // 27
  TSQLShipmentItemBilling = class(TSQLRecord)
    private
      fShipment: TSQLShipmentID;
      fShipmentItemSeq: Integer;
      fInvoiceItem: TSQLInvoiceItemID;         //invoiceId, invoiceItemSeqId
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property InvoiceItem: TSQLInvoiceItemID read fInvoiceItem write fInvoiceItem;
  end;

  // 28
  TSQLShipmentItemFeature = class(TSQLRecord)
    private
      fShipment: TSQLShipmentID;
      fShipmentItemSeq: Integer;
      fProductFeature: TSQLProductFeatureID;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
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
      fShipment: TSQLShipmentID;
      fShipmentPackageSeq: Integer;
      fShipmentBoxType: TSQLShipmentBoxTypeID;
      fDateCreated: TDateTime;
      fBoxLength: Double;
      fBoxHeight: Double;
      fBoxWidth: Double;
      fDimensionUom: TSQLUomID;
      fWeight: Double;
      fWeightUom: TSQLUomID;
      fInsuredValue: Currency;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentPackageSeq: Integer read fShipmentPackageSeq write fShipmentPackageSeq;
      property ShipmentBoxType: TSQLShipmentBoxTypeID read fShipmentBoxType write fShipmentBoxType;
      property DateCreated: TDateTime read fDateCreated write fDateCreated;
      property BoxLength: Double read fBoxLength write fBoxLength;
      property BoxHeight: Double read fBoxHeight write fBoxHeight;
      property BoxWidth: Double read fBoxWidth write fBoxWidth;
      property DimensionUom: TSQLUomID read fDimensionUom write fDimensionUom;
      property Weight: Double read fWeight write fWeight;
      property WeightUom: TSQLUomID read fWeightUom write fWeightUom;
      property InsuredValue: Currency read fInsuredValue write fInsuredValue;
  end;

  // 31
  TSQLShipmentPackageContent = class(TSQLRecord)
    private
      fShipment: TSQLShipmentID;
      fShipmentPackageSeq: Integer;
      fShipmentItemSeq: Integer;
      fQuantity: Double;
      fSubProduct: TSQLProductID;
      fSubProductQuantity: Double;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentPackageSeq: Integer read fShipmentPackageSeq write fShipmentPackageSeq;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Quantity: Double read fQuantity write fQuantity;
      property SubProduct: TSQLProductID read fSubProduct write fSubProduct;
      property SubProductQuantity: Double read fSubProductQuantity write fSubProductQuantity;
  end;

  // 32
  TSQLShipmentPackageRouteSeg = class(TSQLRecord)
    private
      fShipment: TSQLShipmentID;
      fShipmentPackageSeq: Integer;
      fShipmentRouteSegment: TSQLShipmentRouteSegmentID;
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
      fCurrencyUom: TSQLUomID;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentPackageSeq: Integer read fShipmentPackageSeq write fShipmentPackageSeq;
      property ShipmentRouteSegment: TSQLShipmentRouteSegmentID read fShipmentRouteSegment write fShipmentRouteSegment;
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
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
  end;

  // 33
  TSQLShipmentRouteSegment = class(TSQLRecord)
    private
      fShipment: TSQLShipmentID;
      fShipmentRouteSegment: Integer;
      fDelivery: TSQLDeliveryID;
      fOriginFacility: TSQLFacilityID;
      fDestFacility: TSQLFacilityID;
      fOriginContactMech: TSQLContactMechID;
      fOriginTelecomNumber: TSQLTelecomNumberID;
      fDestContactMech: TSQLContactMechID;
      fDestTelecomNumber: TSQLTelecomNumberID;
      fCarrierParty: TSQLPartyID;
      fShipmentMethodType: TSQLShipmentMethodTypeID;
      fCarrierServiceStatus: TSQLStatusItemID;
      fCarrierDeliveryZone: RawUTF8;
      fCarrierRestrictionCodes: RawUTF8;
      fCarrierRestrictionDesc: RawUTF8;
      fBillingWeight: Double;
      fBillingWeightUom: TSQLUomID;
      fActualTransportCost: Currency;
      fActualServiceCost: Currency;
      fActualOtherCost: Currency;
      fActualCost: Currency;
      fCurrencyUom: TSQLUomID;
      fActualStartDate: TDateTime;
      fActualArrivalDate: TDateTime;
      fEstimatedStartDate: TDateTime;
      fEstimatedArrivalDate: TDateTime;
      fTrackingIdNumber: RawUTF8;
      fTrackingDigest: TSQLRawBlob;
      fUpdatedByUserLogin: TSQLUserLoginID;
      fLastUpdatedDate: TDateTime;
      fHomeDeliveryType: Integer;
      fHomeDeliveryDate: TDateTime;
      fThirdPartyAccountNumber: Integer;
      fThirdPartyPostalCode: Integer;
      fThirdPartyCountryGeoCode: Integer;
      fUpsHighValueReport: TSQLRawBlob;
    published
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentRouteSegment: Integer read fShipmentRouteSegment write fShipmentRouteSegment;
      property Delivery: TSQLDeliveryID read fDelivery write fDelivery;
      property OriginFacility: TSQLFacilityID read fOriginFacility write fOriginFacility;
      property DestFacility: TSQLFacilityID read fDestFacility write fDestFacility;
      property OriginContactMech: TSQLContactMechID read fOriginContactMech write fOriginContactMech;
      property OriginTelecomNumber: TSQLTelecomNumberID read fOriginTelecomNumber write fOriginTelecomNumber;
      property DestContactMech: TSQLContactMechID read fDestContactMech write fDestContactMech;
      property DestTelecomNumber: TSQLTelecomNumberID read fDestTelecomNumber write fDestTelecomNumber;
      property CarrierParty: TSQLPartyID read fCarrierParty write fCarrierParty;
      property ShipmentMethodType: TSQLShipmentMethodTypeID read fShipmentMethodType write fShipmentMethodType;
      property CarrierServiceStatus: TSQLStatusItemID read fCarrierServiceStatus write fCarrierServiceStatus;
      property CarrierDeliveryZone: RawUTF8 read fCarrierDeliveryZone write fCarrierDeliveryZone;
      property CarrierRestrictionCodes: RawUTF8 read fCarrierRestrictionCodes write fCarrierRestrictionCodes;
      property CarrierRestrictionDesc: RawUTF8 read fCarrierRestrictionDesc write fCarrierRestrictionDesc;
      property BillingWeight: Double read fBillingWeight write fBillingWeight;
      property BillingWeightUom: TSQLUomID read fBillingWeightUom write fBillingWeightUom;
      property ActualTransportCost: Currency read fActualTransportCost write fActualTransportCost;
      property ActualServiceCost: Currency read fActualServiceCost write fActualServiceCost;
      property ActualOtherCost: Currency read fActualOtherCost write fActualOtherCost;
      property ActualCost: Currency read fActualCost write fActualCost;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property ActualStartDate: TDateTime read fActualStartDate write fActualStartDate;
      property ActualArrivalDate: TDateTime read fActualArrivalDate write fActualArrivalDate;
      property EstimatedStartDate: TDateTime read fEstimatedStartDate write fEstimatedStartDate;
      property EstimatedArrivalDate: TDateTime read fEstimatedArrivalDate write fEstimatedArrivalDate;
      property TrackingIdNumber: RawUTF8 read fTrackingIdNumber write fTrackingIdNumber;
      property TrackingDigest: TSQLRawBlob read fTrackingDigest write fTrackingDigest;
      property UpdatedByUserLogin: TSQLUserLoginID read fUpdatedByUserLogin write fUpdatedByUserLogin;
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
      fStatus: TSQLStatusItemID;
      fShipment: TSQLShipmentID;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 36
  TSQLShipmentType = class(TSQLRecord)
    private
      fParent: TSQLShipmentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLShipmentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 37
  TSQLShipmentTypeAttr = class(TSQLRecord)
    private
      fShipmentType: TSQLShipmentTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property ShipmentType: TSQLShipmentTypeID read fShipmentType write fShipmentType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 38
  TSQLShippingDocument = class(TSQLRecord)
    private
      fDocument: TSQLDocumentID;
      fShipment: TSQLShipmentItemID;        //shipmentId, shipmentItemSeqId
      fShipmentPackage: TSQLShipmentPackageID;            //shipmentId, shipmentPackageSeqId
      fDescription: RawUTF8;
    published
      property Document: TSQLDocumentID read fDocument write fDocument;
      property Shipment: TSQLShipmentItemID read fShipment write fShipment;
      property ShipmentPackage: TSQLShipmentPackageID read fShipmentPackage write fShipmentPackage;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

implementation

end.

