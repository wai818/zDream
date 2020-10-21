unit uOrder;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1 订单调整
  TSQLOrderAdjustment = class(TSQLRecord)
    private
      fOrderAdjustmentType: TSQLOrderAdjustmentTypeID;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fComments: RawUTF8;
      fDescription: RawUTF8;
      fAmount: Currency;
      fRecurringAmount: Currency;
      fAmountAlreadyIncluded: Currency;
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: TSQLProductPromoRuleID;
      fProductPromoActionSeq: Integer;
      fProductFeature: Integer;
      fCorrespondingProduct: Integer;
      fTaxAuthorityRateSeq: TSQLTaxAuthorityRateProductID;
      fSourceReference: Integer;
      fSourcePercentage: Double;
      fCustomerReference: Integer;
      fPrimaryGeo: TSQLGeoID;
      fSecondaryGeo: TSQLGeoID;
      fExemptAmount: Currency;
      fTaxAuthGeo: Integer;
      fTaxAuthParty: Integer;
      fOverrideGlAccount: TSQLGlAccountID;
      fIncludeInTax: Boolean;
      fIncludeInShipping: Boolean;
      fIsManual: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
      fOriginalAdjustment: TSQLOrderAdjustmentID;
    published
      property OrderAdjustmentType: TSQLOrderAdjustmentTypeID read fOrderAdjustmentType write fOrderAdjustmentType;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Comments: RawUTF8 read fComments write fComments;
      property Description: RawUTF8 read fDescription write fDescription;
      property Amount: Currency read fAmount write fAmount;
      property RecurringAmount: Currency read fRecurringAmount write fRecurringAmount;
      property AmountAlreadyIncluded: Currency read fAmountAlreadyIncluded write fAmountAlreadyIncluded;
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRuleID read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property CorrespondingProduct: Integer read fCorrespondingProduct write fCorrespondingProduct;
      property TaxAuthorityRateSeq: TSQLTaxAuthorityRateProductID read fTaxAuthorityRateSeq write fTaxAuthorityRateSeq;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property SourcePercentage: Double read fSourcePercentage write fSourcePercentage;
      property CustomerReference: Integer read fCustomerReference write fCustomerReference;
      property PrimaryGeo: TSQLGeoID read fPrimaryGeo write fPrimaryGeo;
      property SecondaryGeo: TSQLGeoID read fSecondaryGeo write fSecondaryGeo;
      property ExemptAmount: Currency read fExemptAmount write fExemptAmount;
      property TaxAuthGeo: Integer read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: Integer read fTaxAuthParty write fTaxAuthParty;
      property OverrideGlAccount: TSQLGlAccountID read fOverrideGlAccount write fOverrideGlAccount;
      property IncludeInTax: Boolean read fIncludeInTax write fIncludeInTax;
      property IncludeInShipping: Boolean read fIncludeInShipping write fIncludeInShipping;
      property IsManual: Boolean read fIsManual write fIsManual;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      property OriginalAdjustment: TSQLOrderAdjustmentID read fOriginalAdjustment write fOriginalAdjustment;
  end;

  // 2 订单调整属性
  TSQLOrderAdjustmentAttribute = class(TSQLRecord)
    private
      fOrderAdjustment: TSQLOrderAdjustmentID;
      fAttrName: TSQLOrderAdjustmentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property OrderAdjustment: TSQLOrderAdjustmentID read fOrderAdjustment write fOrderAdjustment;
      property AttrName: TSQLOrderAdjustmentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 3
  TSQLOrderAdjustmentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLOrderAdjustmentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLOrderAdjustmentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 4
  TSQLOrderAdjustmentBilling = class(TSQLRecord)
    private
      fOrderAdjustment: TSQLOrderAdjustmentID;
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fAmount: Currency;
    published
      property OrderAdjustment: TSQLOrderAdjustmentID read fOrderAdjustment write fOrderAdjustment;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 5
  TSQLOrderAdjustmentTypeAttr = class(TSQLRecord)
    private
      fOrderAdjustmentType: TSQLOrderAdjustmentTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property OrderAdjustmentType: TSQLOrderAdjustmentTypeID read fOrderAdjustmentType write fOrderAdjustmentType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 6
  TSQLOrderAttribute = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 7
  TSQLOrderBlacklist = class(TSQLRecord)
    private
      fBlacklistString: RawUTF8;
      fOrderBlacklistType: TSQLOrderBlacklistTypeID;
    published
      property BlacklistString: RawUTF8 read fBlacklistString write fBlacklistString;
      property OrderBlacklistType: TSQLOrderBlacklistTypeID read fOrderBlacklistType write fOrderBlacklistType;
  end;

  // 8
  TSQLOrderBlacklistType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 9
  TSQLCommunicationEventOrder = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fCommunicationEvent: TSQLCommunicationEventID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
  end;

  // 10
  TSQLOrderContactMech = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fContactMechPurposeType: TSQLContactMechPurposeTypeID;
      fContactMech: TSQLContactMechID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property ContactMechPurposeType: TSQLContactMechPurposeTypeID read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
  end;

  // 11
  TSQLOrderContent = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fContent: TSQLContentID;
      fOrderContentType: TSQLOrderContentTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Content: TSQLContentID read fContent write fContent;
      property OrderContentType: TSQLOrderContentTypeID read fOrderContentType write fOrderContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 12
  TSQLOrderContentType = class(TSQLRecord)
    private
      fParent: TSQLOrderContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLOrderContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 13
  TSQLOrderDeliverySchedule = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fEstimatedReadyDate: TDateTime;
      fCartons: Integer;
      fSkidsPallets: Integer;
      fUnitsPieces: Double;
      fTotalCubicSize: Double;
      fTotalCubicUom: TSQLUomID;
      fTotalWeight: Double;
      fTotalWeightUom: TSQLUomID;
      fStatus: TSQLStatusItemID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property EstimatedReadyDate: TDateTime read fEstimatedReadyDate write fEstimatedReadyDate;
      property Cartons: Integer read fCartons write fCartons;
      property SkidsPallets: Integer read fSkidsPallets write fSkidsPallets;
      property UnitsPieces: Double read fUnitsPieces write fUnitsPieces;
      property TotalCubicSize: Double read fTotalCubicSize write fTotalCubicSize;
      property TotalCubicUom: TSQLUomID read fTotalCubicUom write fTotalCubicUom;
      property TotalWeight: Double read fTotalWeight write fTotalWeight;
      property TotalWeightUom: TSQLUomID read fTotalWeightUom write fTotalWeightUom;
      property Status: TSQLStatusItemID read fStatus write fStatus;
  end;

  // 14
  TSQLOrderHeader = class(TSQLRecord)
    private
      fOrderType: TSQLOrderTypeID;
      fOrderName: RawUTF8;
      fExternalId: Integer;
      fSalesChannelEnum: TSQLEnumerationID;
      fOrderDate: TDateTime;
      fPriority: Boolean;
      fEntryDate: TDateTime;
      fPickSheetPrintedDate: TDateTime;
      fVisit: Integer;
      fStatus: TSQLStatusItemID;
      fCreatedBy: TSQLUserLoginID;
      fFirstAttemptOrder: Integer;
      fCurrencyUom: TSQLUomID;
      fAyncStatus: TSQLStatusItemID;
      fBillingAccount: TSQLBillingAccountID;
      fOriginFacility: TSQLFacilityID;
      fWebSite: TSQLWebSiteID;
      fProductStore: TSQLProductStoreID;
      fTerminalId: RawUTF8;
      fTransactionId: Integer;
      fAutoOrderShoppingList: TSQLShoppingListID;
      fNeedsInventoryIssuance: Boolean;
      fIsRushOrder: Boolean;
      fInternalCode: Integer;
      fRemainingSubTotal: Currency;
      fGrandTotal: Currency;
      fIsViewed: Boolean;
      fInvoicePerShipment: Boolean;
    published
      property OrderType: TSQLOrderTypeID read fOrderType write fOrderType;
      property OrderName: RawUTF8 read fOrderName write fOrderName;
      property ExternalId: Integer read fExternalId write fExternalId;
      property SalesChannelEnum: TSQLEnumerationID read fSalesChannelEnum write fSalesChannelEnum;
      property OrderDate: TDateTime read fOrderDate write fOrderDate;
      property Priority: Boolean read fPriority write fPriority;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property PickSheetPrintedDate: TDateTime read fPickSheetPrintedDate write fPickSheetPrintedDate;
      property Visit: Integer read fVisit write fVisit;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property CreatedBy: TSQLUserLoginID read fCreatedBy write fCreatedBy;
      property FirstAttemptOrder: Integer read fFirstAttemptOrder write fFirstAttemptOrder;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property AyncStatus: TSQLStatusItemID read fAyncStatus write fAyncStatus;
      property BillingAccount: TSQLBillingAccountID read fBillingAccount write fBillingAccount;
      property OriginFacility: TSQLFacilityID read fOriginFacility write fOriginFacility;
      property WebSite: TSQLWebSiteID read fWebSite write fWebSite;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property TerminalId: RawUTF8 read fTerminalId write fTerminalId;
      property TransactionId: Integer read fTransactionId write fTransactionId;
      property AutoOrderShoppingList: TSQLShoppingListID read fAutoOrderShoppingList write fAutoOrderShoppingList;
      property NeedsInventoryIssuance: Boolean read fNeedsInventoryIssuance write fNeedsInventoryIssuance;
      property IsRushOrder: Boolean read fIsRushOrder write fIsRushOrder;
      property InternalCode: Integer read fInternalCode write fInternalCode;
      property RemainingSubTotal: Currency read fRemainingSubTotal write fRemainingSubTotal;
      property GrandTotal: Currency read fGrandTotal write fGrandTotal;
      property IsViewed: Boolean read fIsViewed write fIsViewed;
      property InvoicePerShipment: Boolean read fInvoicePerShipment write fInvoicePerShipment;
  end;

  // 15
  TSQLOrderHeaderNote = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fNote: TSQLNoteDataID;
      fInternalNote: Boolean;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property Note: TSQLNoteDataID read fNote write fNote;
      property InternalNote: Boolean read fInternalNote write fInternalNote;
  end;

  // 16
  TSQLOrderHeaderWorkEffort = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fWorkEffort: TSQLWorkEffortID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
  end;

  // 17
  TSQLOrderItem = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fExternalId: Integer;
      fOrderItemType: TSQLOrderItemTypeID;
      fOrderItemGroupSeq: Integer;
      fIsItemGroupPrimary: Boolean;
      fFromInventoryItem: TSQLInventoryItemID;
      fBudgetId: Integer;
      fBudgetItemSeq: Integer;
      fProduct: TSQLProductID;
      fSupplierProduct: Integer;
      fProductFeature: Integer;
      fProdCatalog: Integer;
      fProductCategory: Integer;
      fIsPromo: Boolean;
      fQuote: TSQLQuoteItemID;
      fQuoteItemSeq: Integer;
      fShoppingList: TSQLShoppingListItemID;
      fShoppingListItemSeq: Integer;
      fSubscription: Integer;
      fDeployment: Integer;
      fQuantity: Double;
      fCancelQuantity: Double;
      fSelectedAmount: Double;
      fUnitPrice: Currency;
      fUnitListPrice: Currency;
      fUnitAverageCost: Currency;
      fUnitRecurringPrice: Currency;
      fIsModifiedPrice: Boolean;
      fRecurringFreqUom: TSQLUomID;
      fItemDescription: RawUTF8;
      fComments: RawUTF8;
      fCorrespondingPo: Integer;
      fStatus: TSQLStatusItemID;
      fSyncStatus: TSQLStatusItemID;
      fEstimatedShipDate: TDateTime;
      fEstimatedDeliveryDate: TDateTime;
      fAutoCancelDate: TDateTime;
      fDontCancelSetDate: TDateTime;
      fDontCancelSetUserLogin: TSQLUserLoginID;
      fShipBeforeDate: TDateTime;
      fShipAfterDate: TDateTime;
      fCancelBackOrderDate: TDateTime;
      fOverrideGlAccount: TSQLGlAccountID;
      fSalesOpportunity: TSQLSalesOpportunityID;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ExternalId: Integer read fExternalId write fExternalId;
      property OrderItemType: TSQLOrderItemTypeID read fOrderItemType write fOrderItemType;
      property OrderItemGroupSeq: Integer read fOrderItemGroupSeq write fOrderItemGroupSeq;
      property IsItemGroupPrimary: Boolean read fIsItemGroupPrimary write fIsItemGroupPrimary;
      property FromInventoryItem: TSQLInventoryItemID read fFromInventoryItem write fFromInventoryItem;
      property BudgetId: Integer read fBudgetId write fBudgetId;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property SupplierProduct: Integer read fSupplierProduct write fSupplierProduct;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property ProdCatalog: Integer read fProdCatalog write fProdCatalog;
      property ProductCategory: Integer read fProductCategory write fProductCategory;
      property IsPromo: Boolean read fIsPromo write fIsPromo;
      property Quote: TSQLQuoteItemID read fQuote write fQuote;
      property QuoteItemSeq: Integer read fQuoteItemSeq write fQuoteItemSeq;
      property ShoppingList: TSQLShoppingListItemID read fShoppingList write fShoppingList;
      property ShoppingListItemSeq: Integer read fShoppingListItemSeq write fShoppingListItemSeq;
      property Subscription: Integer read fSubscription write fSubscription;
      property Deployment: Integer read fDeployment write fDeployment;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
      property SelectedAmount: Double read fSelectedAmount write fSelectedAmount;
      property UnitPrice: Currency read fUnitPrice write fUnitPrice;
      property UnitListPrice: Currency read fUnitListPrice write fUnitListPrice;
      property UnitAverageCost: Currency read fUnitAverageCost write fUnitAverageCost;
      property UnitRecurringPrice: Currency read fUnitRecurringPrice write fUnitRecurringPrice;
      property IsModifiedPrice: Boolean read fIsModifiedPrice write fIsModifiedPrice;
      property RecurringFreqUom: TSQLUomID read fRecurringFreqUom write fRecurringFreqUom;
      property ItemDescription: RawUTF8 read fItemDescription write fItemDescription;
      property Comments: RawUTF8 read fComments write fComments;
      property CorrespondingPo: Integer read fCorrespondingPo write fCorrespondingPo;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property SyncStatus: TSQLStatusItemID read fSyncStatus write fSyncStatus;
      property EstimatedShipDate: TDateTime read fEstimatedShipDate write fEstimatedShipDate;
      property EstimatedDeliveryDate: TDateTime read fEstimatedDeliveryDate write fEstimatedDeliveryDate;
      property AutoCancelDate: TDateTime read fAutoCancelDate write fAutoCancelDate;
      property DontCancelSetDate: TDateTime read fDontCancelSetDate write fDontCancelSetDate;
      property DontCancelSetUserLogin: TSQLUserLoginID read fDontCancelSetUserLogin write fDontCancelSetUserLogin;
      property ShipBeforeDate: TDateTime read fShipBeforeDate write fShipBeforeDate;
      property ShipAfterDate: TDateTime read fShipAfterDate write fShipAfterDate;
      property CancelBackOrderDate: TDateTime read fCancelBackOrderDate write fCancelBackOrderDate;
      property OverrideGlAccount: TSQLGlAccountID read fOverrideGlAccount write fOverrideGlAccount;
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 18
  TSQLOrderItemAssoc = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fToOrder: TSQLOrderHeaderID;
      fToOrderItemSeq: Integer;
      fToShipGroupSeq: Integer;
      fOrderItemAssocType: TSQLOrderItemAssocTypeID;
      fQuantity: Double;
   published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property ToOrder: TSQLOrderHeaderID read fToOrder write fToOrder;
      property ToOrderItemSeq: Integer read fToOrderItemSeq write fToOrderItemSeq;
      property ToShipGroupSeq: Integer read fToShipGroupSeq write fToShipGroupSeq;
      property OrderItemAssocType: TSQLOrderItemAssocTypeID read fOrderItemAssocType write fOrderItemAssocType;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 19
  TSQLOrderItemAssocType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLOrderItemAssocTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLOrderItemAssocTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 20
  TSQLOrderItemAttribute = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 21
  TSQLOrderItemBilling = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fItemIssuance: TSQLItemIssuanceID;
      fShipmentReceipt: TSQLShipmentReceiptID;
      fQuantity: Double;
      fAmount: Currency;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property ItemIssuance: TSQLItemIssuanceID read fItemIssuance write fItemIssuance;
      property ShipmentReceipt: TSQLShipmentReceiptID read fShipmentReceipt write fShipmentReceipt;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 22
  TSQLOrderItemChange = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fChangeTypeEnum: TSQLEnumerationID;
      fChangeDatetime: TDateTime;
      fQuantity: Double;
      fCancelQuantity: Double;
      fUnitPrice: Currency;
      fItemDescription: RawUTF8;
      fReasonEnum: TSQLEnumerationID;
      fChangeComments: RawUTF8;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ChangeTypeEnum: TSQLEnumerationID read fChangeTypeEnum write fChangeTypeEnum;
      property ChangeDatetime: TDateTime read fChangeDatetime write fChangeDatetime;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
      property UnitPrice: Currency read fUnitPrice write fUnitPrice;
      property ItemDescription: RawUTF8 read fItemDescription write fItemDescription;
      property ReasonEnum: TSQLEnumerationID read fReasonEnum write fReasonEnum;
      property ChangeComments: RawUTF8 read fChangeComments write fChangeComments;
  end;

  // 23
  TSQLOrderItemContactMech = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fContactMechPurposeType: TSQLContactMechPurposeTypeID;
      fContactMech: TSQLContactMechID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ContactMechPurposeType: TSQLContactMechPurposeTypeID read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
  end;

  // 24
  TSQLOrderItemGroup = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemGroupSeq: Integer;
      fParentGroupSeq: TSQLOrderItemGroupID;
      fGroupName: RawUTF8;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemGroupSeq: Integer read fOrderItemGroupSeq write fOrderItemGroupSeq;
      property ParentGroupSeq: TSQLOrderItemGroupID read fParentGroupSeq write fParentGroupSeq;
      property GroupName: RawUTF8 read fGroupName write fGroupName;
  end;

  // 25
  TSQLOrderItemGroupOrder = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fGroupOrder: TSQLProductGroupOrderID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property GroupOrder: TSQLProductGroupOrderID read fGroupOrder write fGroupOrder;
  end;

  // 26
  TSQLOrderItemPriceInfo = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fProductPriceRule: TSQLProductPriceRuleID;
      fProductPriceActionSeq: Integer;
      fModifyAmount: Currency;
      fDescription: RawUTF8;
      fRateCode: RawUTF8;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ProductPriceRule: TSQLProductPriceRuleID read fProductPriceRule write fProductPriceRule;
      property ProductPriceActionSeq: Integer read fProductPriceActionSeq write fProductPriceActionSeq;
      property ModifyAmount: Currency read fModifyAmount write fModifyAmount;
      property Description: RawUTF8 read fDescription write fDescription;
      property RateCode: RawUTF8 read fRateCode write fRateCode;
  end;

  // 27
  TSQLOrderItemRole = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 28
  TSQLOrderItemShipGroup = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fShipGroupSeq: Integer;
      fShipmentMethodType: TSQLShipmentMethodTypeID;
      fSupplierParty: TSQLPartyID;
      fVendorParty: TSQLPartyID;
      fCarrierParty: TSQLPartyID;
      fCarrierRoleType: TSQLRoleTypeID;
      fFacility: TSQLFacilityID;
      fContactMech: TSQLContactMechID;
      fTelecomContactMech: TSQLTelecomNumberID;
      fTrackingNumber: RawUTF8;
      fShippingInstructions: RawUTF8;
      fMaySplit: Boolean;
      fGiftMessage: TSQLRawBlob;
      fIsGift: Boolean;
      fShipAfterDate: TDateTime;
      fShipByDate: TDateTime;
      fEstimatedShipDate: TDateTime;
      fEstimatedDeliveryDate: TDateTime;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property ShipmentMethodType: TSQLShipmentMethodTypeID read fShipmentMethodType write fShipmentMethodType;
      property SupplierParty: TSQLPartyID read fSupplierParty write fSupplierParty;
      property VendorParty: TSQLPartyID read fVendorParty write fVendorParty;
      property CarrierParty: TSQLPartyID read fCarrierParty write fCarrierParty;
      property CarrierRoleType: TSQLRoleTypeID read fCarrierRoleType write fCarrierRoleType;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property TelecomContactMech: TSQLTelecomNumberID read fTelecomContactMech write fTelecomContactMech;
      property TrackingNumber: RawUTF8 read fTrackingNumber write fTrackingNumber;
      property ShippingInstructions: RawUTF8 read fShippingInstructions write fShippingInstructions;
      property MaySplit: Boolean read fMaySplit write fMaySplit;
      property GiftMessage: TSQLRawBlob read fGiftMessage write fGiftMessage;
      property IsGift: Boolean read fIsGift write fIsGift;
      property ShipAfterDate: TDateTime read fShipAfterDate write fShipAfterDate;
      property ShipByDate: TDateTime read fShipByDate write fShipByDate;
      property EstimatedShipDate: TDateTime read fEstimatedShipDate write fEstimatedShipDate;
      property EstimatedDeliveryDate: TDateTime read fEstimatedDeliveryDate write fEstimatedDeliveryDate;
  end;

  // 29
  TSQLOrderItemShipGroupAssoc = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fQuantity: Double;
      fCancelQuantity: Double;
     published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
  end;

  // 30
  TSQLOrderItemShipGrpInvRes = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fShipGroupSeq: Integer;
      fInventoryItem: TSQLInventoryItemID;
      fReserveOrderEnum: Integer;
      fQuantity: Double;
      fQuantityNotAvailable: Double;
      fReservedDatetime: TDateTime;
      fCreatedDatetime: TDateTime;
      fPromisedDatetime: TDateTime;
      fCurrentPromisedDate: TDateTime;
      fPriority: Boolean;
      fSequence: Integer;
      fOldPickStartDate: TDateTime;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property ReserveOrderEnum: Integer read fReserveOrderEnum write fReserveOrderEnum;
      property Quantity: Double read fQuantity write fQuantity;
      property QuantityNotAvailable: Double read fQuantityNotAvailable write fQuantityNotAvailable;
      property ReservedDatetime: TDateTime read fReservedDatetime write fReservedDatetime;
      property CreatedDatetime: TDateTime read fCreatedDatetime write fCreatedDatetime;
      property PromisedDatetime: TDateTime read fPromisedDatetime write fPromisedDatetime;
      property CurrentPromisedDate: TDateTime read fCurrentPromisedDate write fCurrentPromisedDate;
      property Priority: Boolean read fPriority write fPriority;
      property Sequence: Integer read fSequence write fSequence;
      property OldPickStartDate: TDateTime read fOldPickStartDate write fOldPickStartDate;
  end;

  // 31
  TSQLOrderItemType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLOrderItemTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLOrderItemTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 32
  TSQLOrderItemTypeAttr = class(TSQLRecord)
    private
      fOrderItemType: TSQLOrderItemTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property OrderItemType: TSQLOrderItemTypeID read fOrderItemType write fOrderItemType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 33
  TSQLOrderNotification = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fEmailType: TSQLEnumerationID;
      fComments: RawUTF8;
      fNotificationDate: TDateTime;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property EmailType: TSQLEnumerationID read fEmailType write fEmailType;
      property Comments: RawUTF8 read fComments write fComments;
      property NotificationDate: TDateTime read fNotificationDate write fNotificationDate;
  end;

  // 34
  TSQLOrderPaymentPreference = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fProductPricePurpose: TSQLProductPricePurposeID;
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fPaymentMethod: TSQLPaymentMethodID;
      fFinAccount: TSQLFinAccountID;
      fSecurityCode: RawUTF8;
      fTrack2: RawUTF8;
      fPresentFlag: Boolean;
      fSwipedFlag: Boolean;
      fOverflowFlag: Boolean;
      fMaxAmount: Currency;
      fProcessAttempt: Double;
      fBillingPostalCode: RawUTF8;
      fManualAuthCode: RawUTF8;
      fManualRefNum: RawUTF8;
      fStatus: TSQLStatusItemID;
      fNeedsNsfRetry: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property ProductPricePurpose: TSQLProductPricePurposeID read fProductPricePurpose write fProductPricePurpose;
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property SecurityCode: RawUTF8 read fSecurityCode write fSecurityCode;
      property Track2: RawUTF8 read fTrack2 write fTrack2;
      property PresentFlag: Boolean read fPresentFlag write fPresentFlag;
      property SwipedFlag: Boolean read fSwipedFlag write fSwipedFlag;
      property OverflowFlag: Boolean read fOverflowFlag write fOverflowFlag;
      property MaxAmount: Currency read fMaxAmount write fMaxAmount;
      property ProcessAttempt: Double read fProcessAttempt write fProcessAttempt;
      property BillingPostalCode: RawUTF8 read fBillingPostalCode write fBillingPostalCode;
      property ManualAuthCode: RawUTF8 read fManualAuthCode write fManualAuthCode;
      property ManualRefNum: RawUTF8 read fManualRefNum write fManualRefNum;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property NeedsNsfRetry: Boolean read fNeedsNsfRetry write fNeedsNsfRetry;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 35
  TSQLOrderProductPromoCode = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fProductPromoCode: TSQLProductPromoCodeID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property ProductPromoCode: TSQLProductPromoCodeID read fProductPromoCode write fProductPromoCode;
  end;

  // 36
  TSQLOrderRole = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 37
  TSQLOrderShipment = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fShipment: TSQLShipmentID;
      fShipmentItemSeq: Integer;
      fQuantity: Double;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 38
  TSQLOrderStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItemID;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fOrderPaymentPreference: TSQLOrderPaymentPreferenceID;
      fStatusDatetime: TDateTime;
      fStatusUserLogin: TSQLUserLoginID;
      fChangeReason: RawUTF8;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property OrderPaymentPreference: TSQLOrderPaymentPreferenceID read fOrderPaymentPreference write fOrderPaymentPreference;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
      property StatusUserLogin: TSQLUserLoginID read fStatusUserLogin write fStatusUserLogin;
      property ChangeReason: RawUTF8 read fChangeReason write fChangeReason;
  end;

  // 39
  TSQLOrderSummaryEntry = class(TSQLRecord)
    private
      fEntryDate: TDateTime;
      fProduct: TSQLProductID;
      fFacility: TSQLFacilityID;
      fTotalQuantity: Double;
      fGrossSales: Currency;
      fProductCost: Currency;
    published
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property Product: TSQLProductID read fProduct write fProduct;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property TotalQuantity: Double read fTotalQuantity write fTotalQuantity;
      property GrossSales: Currency read fGrossSales write fGrossSales;
      property ProductCost: Currency read fProductCost write fProductCost;
  end;

  // 40
  TSQLOrderTerm = class(TSQLRecord)
    private
      fTermType: TSQLTermTypeID;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fTermValue: Currency;
      fTermDays: Integer;
      fTextValue: RawUTF8;
      fDescription: RawUTF8;
      fUom: TSQLUomID;
    published
      property TermType: TSQLTermTypeID read fTermType write fTermType;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property TermValue: Currency read fTermValue write fTermValue;
      property TermDays: Integer read fTermDays write fTermDays;
      property TextValue: RawUTF8 read fTextValue write fTextValue;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUomID read fUom write fUom;
  end;

  // 41
  TSQLOrderTermAttribute = class(TSQLRecord)
    private
      fTermType: Integer;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property TermType: Integer read fTermType write fTermType;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 42
  TSQLOrderType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLOrderTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLOrderTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 43
  TSQLOrderTypeAttr = class(TSQLRecord)
    private
      fOrderType: TSQLOrderTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property OrderType: TSQLOrderTypeID read fOrderType write fOrderType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 44
  TSQLProductOrderItem = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fEngagementId: TSQLOrderHeaderID;
      fEngagementItemSeq: Integer;
      fProduct: TSQLProductID;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property EngagementId: TSQLOrderHeaderID read fEngagementId write fEngagementId;
      property EngagementItemSeq: Integer read fEngagementItemSeq write fEngagementItemSeq;
      property Product: TSQLProductID read fProduct write fProduct;
  end;

  // 45
  TSQLWorkOrderItemFulfillment = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
  end;

  // 46
  TSQLQuote = class(TSQLRecord)
    private
      fQuoteType: TSQLQuoteTypeID;
      fParty: TSQLPartyID;
      fIssueDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fCurrencyUom: TSQLUomID;
      fProductStore: TSQLProductStoreID;
      fSalesChannelEnum: TSQLEnumerationID;
      fValidFromDate: TDateTime;
      fValidThruDate: TDateTime;
      fQuoteName: RawUTF8;
      fDescription: RawUTF8;
    published
      property QuoteType: TSQLQuoteTypeID read fQuoteType write fQuoteType;
      property Party: TSQLPartyID read fParty write fParty;
      property IssueDate: TDateTime read fIssueDate write fIssueDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property SalesChannelEnum: TSQLEnumerationID read fSalesChannelEnum write fSalesChannelEnum;
      property ValidFromDate: TDateTime read fValidFromDate write fValidFromDate;
      property ValidThruDate: TDateTime read fValidThruDate write fValidThruDate;
      property QuoteName: RawUTF8 read fQuoteName write fQuoteName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 47
  TSQLQuoteAttribute = class(TSQLRecord)
    private
      fQuote: TSQLQuoteID;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Quote: TSQLQuoteID read fQuote write fQuote;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 48
  TSQLQuoteCoefficient = class(TSQLRecord)
    private
      fQuote: TSQLQuoteID;
      fCoeffName: RawUTF8;
      fCoeffValue: Double;
    published
      property Quote: TSQLQuoteID read fQuote write fQuote;
      property CoeffName: RawUTF8 read fCoeffName write fCoeffName;
      property CoeffValue: Double read fCoeffValue write fCoeffValue;
  end;

  // 49
  TSQLQuoteItem = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fProduct: TSQLProductID;
      fProductFeature: TSQLProductFeatureID;
      fDeliverableType: TSQLDeliverableTypeID;
      fSkillType: TSQLSkillTypeID;
      fUom: TSQLUomID;
      fWorkEffort: TSQLWorkEffortID;
      fCustRequest: TSQLCustRequestID;
      fCustRequestItemSeq: Integer;
      fQuantity: Double;
      fSelectedAmount: Double;
      fQuoteUnitPrice: Currency;
      fReservStart: TDateTime;
      fReservLength: Double;
      fReservPersons: Integer;
      fConfigId: Integer;
      fEstimatedDeliveryDate: TDateTime;
      fComments: RawUTF8;
      fIsPromo: Boolean;
      fLeadTimeDays: Integer;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property DeliverableType: TSQLDeliverableTypeID read fDeliverableType write fDeliverableType;
      property SkillType: TSQLSkillTypeID read fSkillType write fSkillType;
      property Uom: TSQLUomID read fUom write fUom;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property Quantity: Double read fQuantity write fQuantity;
      property SelectedAmount: Double read fSelectedAmount write fSelectedAmount;
      property QuoteUnitPrice: Currency read fQuoteUnitPrice write fQuoteUnitPrice;
      property ReservStart: TDateTime read fReservStart write fReservStart;
      property ReservLength: Double read fReservLength write fReservLength;
      property ReservPersons: Integer read fReservPersons write fReservPersons;
      property ConfigId: Integer read fConfigId write fConfigId;
      property EstimatedDeliveryDate: TDateTime read fEstimatedDeliveryDate write fEstimatedDeliveryDate;
      property Comments: RawUTF8 read fComments write fComments;
      property IsPromo: Boolean read fIsPromo write fIsPromo;
      property LeadTimeDays: Integer read fLeadTimeDays write fLeadTimeDays;
  end;

  // 50
  TSQLQuoteNote = class(TSQLRecord)
    private
      fQuote: TSQLQuoteID;
      fNote: TSQLNoteDataID;
    published
      property Quote: TSQLQuoteID read fQuote write fQuote;
      property Note: TSQLNoteDataID read fNote write fNote;
  end;

  // 51
  TSQLQuoteRole = class(TSQLRecord)
    private
      fQuote: TSQLQuoteID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Quote: TSQLQuoteID read fQuote write fQuote;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 52
  TSQLQuoteTerm = class(TSQLRecord)
    private
      fTermType: TSQLTermTypeID;
      fQuote: TSQLQuoteID;
      fQuoteItemSeq: Integer;
      fTermValue: Integer;
      fUom: Integer;
      fTermDays: Integer;
      fTextValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property TermType: TSQLTermTypeID read fTermType write fTermType;
      property Quote: TSQLQuoteID read fQuote write fQuote;
      property QuoteItemSeq: Integer read fQuoteItemSeq write fQuoteItemSeq;
      property TermValue: Integer read fTermValue write fTermValue;
      property Uom: Integer read fUom write fUom;
      property TermDays: Integer read fTermDays write fTermDays;
      property TextValue: RawUTF8 read fTextValue write fTextValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 53
  TSQLQuoteTermAttribute = class(TSQLRecord)
    private
      fTermTypeId: Integer;
      fQuoteId: Integer;
      fQuoteItemSeqId: Integer;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property TermTypeId: Integer read fTermTypeId write fTermTypeId;
      property QuoteId: Integer read fQuoteId write fQuoteId;
      property QuoteItemSeqId: Integer read fQuoteItemSeqId write fQuoteItemSeqId;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 54
  TSQLQuoteType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLQuoteTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLQuoteTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 55
  TSQLQuoteTypeAttr = class(TSQLRecord)
    private
      fQuoteType: TSQLQuoteTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property QuoteType: TSQLQuoteTypeID read fQuoteType write fQuoteType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 56
  TSQLQuoteWorkEffort = class(TSQLRecord)
    private
      fQuote: TSQLQuoteID;
      fWorkEffort: TSQLWorkEffortID;
    published
      property Quote: TSQLQuoteID read fQuote write fQuote;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
  end;

  // 57
  TSQLQuoteAdjustment = class(TSQLRecord)
    private
      fOrderAdjustmentType: TSQLOrderAdjustmentTypeID;
      fQuote: TSQLQuoteID;
      fQuoteItemSeq: Integer;
      fComments: RawUTF8;
      fDescription: RawUTF8;
      fAmount: Currency;
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: TSQLProductPromoRuleID;
      fProductPromoActionSeq: Integer;
      fProductFeature: Integer;
      fCorrespondingProduct: Integer;
      fSourceReference: Integer;
      fSourcePercentage: Double;
      fCustomerReference: Integer;
      fPrimaryGeo: TSQLGeoID;
      fSecondaryGeo: TSQLGeoID;
      fExemptAmount: Currency;
      fTaxAuthGeo: Integer;
      fTaxAuthParty: Integer;
      fOverrideGlAccount: TSQLGlAccountID;
      fIncludeInTax: Boolean;
      fIncludeInShipping: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property OrderAdjustmentType: TSQLOrderAdjustmentTypeID read fOrderAdjustmentType write fOrderAdjustmentType;
      property Quote: TSQLQuoteID read fQuote write fQuote;
      property QuoteItemSeq: Integer read fQuoteItemSeq write fQuoteItemSeq;
      property Comments: RawUTF8 read fComments write fComments;
      property Description: RawUTF8 read fDescription write fDescription;
      property Amount: Currency read fAmount write fAmount;
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRuleID read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property CorrespondingProduct: Integer read fCorrespondingProduct write fCorrespondingProduct;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property SourcePercentage: Double read fSourcePercentage write fSourcePercentage;
      property CustomerReference: Integer read fCustomerReference write fCustomerReference;
      property PrimaryGeo: TSQLGeoID read fPrimaryGeo write fPrimaryGeo;
      property SecondaryGeo: TSQLGeoID read fSecondaryGeo write fSecondaryGeo;
      property ExemptAmount: Currency read fExemptAmount write fExemptAmount;
      property TaxAuthGeo: Integer read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: Integer read fTaxAuthParty write fTaxAuthParty;
      property OverrideGlAccount: TSQLGlAccountID read fOverrideGlAccount write fOverrideGlAccount;
      property IncludeInTax: Boolean read fIncludeInTax write fIncludeInTax;
      property IncludeInShipping: Boolean read fIncludeInShipping write fIncludeInShipping;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 58
  TSQLCustRequest = class(TSQLRecord)
    private
      fCustRequestType: TSQLCustRequestTypeID;
      fCustRequestCategory: TSQLCustRequestCategoryID;
      fStatus: TSQLStatusItemID;
      fFromParty: TSQLPartyID;
      fPriority: Integer;
      fCustRequestDate: TDateTime;
      fResponseRequiredDate: TDateTime;
      fCustRequestName: RawUTF8;
      fDescription: RawUTF8;
      fMaximumAmountUom: TSQLUomID;
      fProductStore: TSQLProductStoreID;
      fSalesChannelEnum: TSQLEnumerationID;
      fFulfillContactMech: TSQLContactMechID;
      fCurrencyUom: TSQLUomID;
      fOpenDateTime: TDateTime;
      fClosedDateTime: TDateTime;
      fInternalComment: RawUTF8;
      fReason: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property CustRequestType: TSQLCustRequestTypeID read fCustRequestType write fCustRequestType;
      property CustRequestCategory: TSQLCustRequestCategoryID read fCustRequestCategory write fCustRequestCategory;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property FromParty: TSQLPartyID read fFromParty write fFromParty;
      property Priority: Integer read fPriority write fPriority;
      property CustRequestDate: TDateTime read fCustRequestDate write fCustRequestDate;
      property ResponseRequiredDate: TDateTime read fResponseRequiredDate write fResponseRequiredDate;
      property CustRequestName: RawUTF8 read fCustRequestName write fCustRequestName;
      property Description: RawUTF8 read fDescription write fDescription;
      property MaximumAmountUom: TSQLUomID read fMaximumAmountUom write fMaximumAmountUom;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property SalesChannelEnum: TSQLEnumerationID read fSalesChannelEnum write fSalesChannelEnum;
      property FulfillContactMech: TSQLContactMechID read fFulfillContactMech write fFulfillContactMech;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property OpenDateTime: TDateTime read fOpenDateTime write fOpenDateTime;
      property ClosedDateTime: TDateTime read fClosedDateTime write fClosedDateTime;
      property InternalComment: RawUTF8 read fInternalComment write fInternalComment;
      property Reason: RawUTF8 read fReason write fReason;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 59
  TSQLCustRequestAttribute = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 60
  TSQLCustRequestCategory = class(TSQLRecord)
    private
      fCustRequestType: TSQLCustRequestTypeID;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property CustRequestType: TSQLCustRequestTypeID read fCustRequestType write fCustRequestType;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 61
  TSQLCustRequestCommEvent = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fCommunicationEvent: TSQLCommunicationEventID;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
  end;

  // 62
  TSQLCustRequestContent = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fContent: TSQLContentID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property Content: TSQLContentID read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 63
  TSQLCustRequestItem = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fCustRequestItemSeq: Integer;
      fCustRequestResolution: TSQLCustRequestResolutionID;
      fStatus: TSQLStatusItemID;
      fPriority: Integer;
      fSequenceNum: Integer;
      fRequiredByDate: TDateTime;
      fProduct: TSQLProductID;
      fQuantity: Double;
      fSelectedAmount: Double;
      fMaximumAmount: Currency;
      fReservStart: TDateTime;
      fReservLength: Double;
      fReservPersons: Integer;
      fConfigId: Integer;
      fDescription: RawUTF8;
      fStory: RawUTF8;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property CustRequestResolution: TSQLCustRequestResolutionID read fCustRequestResolution write fCustRequestResolution;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Priority: Integer read fPriority write fPriority;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property RequiredByDate: TDateTime read fRequiredByDate write fRequiredByDate;
      property Product: TSQLProductID read fProduct write fProduct;
      property Quantity: Double read fQuantity write fQuantity;
      property SelectedAmount: Double read fSelectedAmount write fSelectedAmount;
      property MaximumAmount: Currency read fMaximumAmount write fMaximumAmount;
      property ReservStart: TDateTime read fReservStart write fReservStart;
      property ReservLength: Double read fReservLength write fReservLength;
      property ReservPersons: Integer read fReservPersons write fReservPersons;
      property ConfigId: Integer read fConfigId write fConfigId;
      property Description: RawUTF8 read fDescription write fDescription;
      property Story: RawUTF8 read fStory write fStory;
  end;

  // 64
  TSQLCustRequestNote = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fNote: TSQLNoteDataID;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property Note: TSQLNoteDataID read fNote write fNote;
  end;

  // 65
  TSQLCustRequestItemNote = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fCustRequestItemSeq: Integer;
      fNote: TSQLNoteDataID;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property Note: TSQLNoteDataID read fNote write fNote;
  end;

  // 66
  TSQLCustRequestItemWorkEffort = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fCustRequestItemSeq: Integer;
      fWorkEffort: TSQLWorkEffortID;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
  end;

  // 67
  TSQLCustRequestResolution = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fCustRequestTypeEncode: RawUTF8;
      fCustRequestType: TSQLCustRequestTypeID;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property CustRequestTypeEncode: RawUTF8 read fCustRequestTypeEncode write fCustRequestTypeEncode;
      property CustRequestType: TSQLCustRequestTypeID read fCustRequestType write fCustRequestType;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 68
  TSQLCustRequestParty = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 69
  TSQLCustRequestStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItemID;
      fCustRequest: TSQLCustRequestID;
      fCustRequestItemSeq: Integer;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 70
  TSQLCustRequestType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLCustRequestTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fParty: Integer;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLCustRequestTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property Party: Integer read fParty write fParty;
  end;

  // 71
  TSQLCustRequestTypeAttr = class(TSQLRecord)
    private
      fCustRequestType: TSQLCustRequestTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property CustRequestType: TSQLCustRequestTypeID read fCustRequestType write fCustRequestType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 72
  TSQLCustRequestWorkEffort = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fWorkEffort: TSQLWorkEffortID;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
  end;

  // 73
  TSQLRespondingParty = class(TSQLRecord)
    private
      fRespondingPartySeq: Integer;
      fCustRequest: TSQLCustRequestID;
      fParty: TSQLPartyID;
      fContactMech: TSQLContactMechID;
      fDateSent: TDateTime;
    published
      property RespondingPartySeq: Integer read fRespondingPartySeq write fRespondingPartySeq;
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property Party: TSQLPartyID read fParty write fParty;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property DateSent: TDateTime read fDateSent write fDateSent;
  end;

  // 74
  TSQLDesiredFeature = class(TSQLRecord)
    private
      fRequirement: TSQLRequirementID;
      fProductFeature: TSQLProductFeatureID;
      fOptionalInd: Boolean;
    published
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property OptionalInd: Boolean read fOptionalInd write fOptionalInd;
  end;

  // 75
  TSQLOrderRequirementCommitment = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fRequirement: TSQLRequirementID;
      fQuantity: Double;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 76
  TSQLRequirement = class(TSQLRecord)
    private
      fRequirementType: TSQLRequirementTypeID;
      fFacility: TSQLFacilityID;
      fDeliverable: TSQLDeliverableID;
      fFixedAsset: TSQLFixedAssetID;
      fProduct: TSQLProductID;
      fStatus: TSQLStatusItemID;
      fDescription: RawUTF8;
      fRequirementStartDate: TDateTime;
      fRequiredByDate: TDateTime;
      fEstimatedBudget: Currency;
      fQuantity: Double;
      fUseCase: RawUTF8;
      fReason: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property RequirementType: TSQLRequirementTypeID read fRequirementType write fRequirementType;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Deliverable: TSQLDeliverableID read fDeliverable write fDeliverable;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property Product: TSQLProductID read fProduct write fProduct;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Description: RawUTF8 read fDescription write fDescription;
      property RequirementStartDate: TDateTime read fRequirementStartDate write fRequirementStartDate;
      property RequiredByDate: TDateTime read fRequiredByDate write fRequiredByDate;
      property EstimatedBudget: Currency read fEstimatedBudget write fEstimatedBudget;
      property Quantity: Double read fQuantity write fQuantity;
      property UseCase: RawUTF8 read fUseCase write fUseCase;
      property Reason: RawUTF8 read fReason write fReason;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 77
  TSQLRequirementAttribute = class(TSQLRecord)
    private
      fRequirement: TSQLRequirementID;
      fAttrName: TSQLOrderAdjustmentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
      property AttrName: TSQLOrderAdjustmentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 78
  TSQLRequirementBudgetAllocation = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fBudgetItemSeq: Integer;
      fRequirement: TSQLRequirementID;
      fAmount: Currency;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 79
  TSQLRequirementCustRequest = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequestID;
      fCustRequestItemSeq: Integer;
      fRequirement: TSQLRequirementID;
    published
      property CustRequest: TSQLCustRequestID read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
  end;

  // 80
  TSQLRequirementRole = class(TSQLRecord)
    private
      fRequirement: TSQLRequirementID;
      fParty: TSQLPartyID;
      fRoleType: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: Integer read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 81
  TSQLRequirementStatus = class(TSQLRecord)
    private
      fRequirement: TSQLRequirementID;
      fStatus: TSQLStatusItemID;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 82
  TSQLRequirementType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLRequirementTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLRequirementTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 83
  TSQLRequirementTypeAttr = class(TSQLRecord)
    private
      fRequirementType: TSQLRequirementTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property RequirementType: TSQLRequirementTypeID read fRequirementType write fRequirementType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 84
  TSQLWorkReqFulfType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 85
  TSQLWorkRequirementFulfillment = class(TSQLRecord)
    private
      fRequirement: TSQLRequirementID;
      fWorkEffort: TSQLWorkEffortID;
      fWorkReqFulfType: TSQLWorkReqFulfTypeID;
    published
      property Requirement: TSQLRequirementID read fRequirement write fRequirement;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property WorkReqFulfType: TSQLWorkReqFulfTypeID read fWorkReqFulfType write fWorkReqFulfType;
  end;

  // 86
  TSQLReturnAdjustment = class(TSQLRecord)
    private
      fReturnAdjustmentType: TSQLReturnAdjustmentTypeID;
      fReturn: TSQLReturnHeaderID;
      fReturnItemSeq: Integer;
      fShipGroupSeq: Integer;
      fComments: RawUTF8;
      fDescription: RawUTF8;
      fReturnType: TSQLReturnTypeID;
      fOrderAdjustment: TSQLOrderAdjustmentID;
      fAmount: Currency;
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: TSQLProductPromoRuleID;
      fProductPromoActionSeq: Integer;
      fProductFeature: Integer;
      fCorrespondingProduct: Integer;
      fTaxAuthorityRateSeq: Integer;
      fSourceReference: Integer;
      fSourcePercentage: Double;
      fCustomerReference: Integer;
      fPrimaryGeo: TSQLGeoID;
      fSecondaryGeo: TSQLGeoID;
      fExemptAmount: Currency;
      fTaxAuthGeo: TSQLGeoID;
      fTaxAuthParty: Integer;
      fOverrideGlAccount: TSQLGlAccountID;
      fIncludeInTax: Boolean;
      fIncludeInShipping: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property ReturnAdjustmentType: TSQLReturnAdjustmentTypeID read fReturnAdjustmentType write fReturnAdjustmentType;
      property Return: TSQLReturnHeaderID read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Comments: RawUTF8 read fComments write fComments;
      property Description: RawUTF8 read fDescription write fDescription;
      property ReturnType: TSQLReturnTypeID read fReturnType write fReturnType;
      property OrderAdjustment: TSQLOrderAdjustmentID read fOrderAdjustment write fOrderAdjustment;
      property Amount: Currency read fAmount write fAmount;
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRuleID read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property CorrespondingProduct: Integer read fCorrespondingProduct write fCorrespondingProduct;
      property TaxAuthorityRateSeq: Integer read fTaxAuthorityRateSeq write fTaxAuthorityRateSeq;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property SourcePercentage: Double read fSourcePercentage write fSourcePercentage;
      property CustomerReference: Integer read fCustomerReference write fCustomerReference;
      property PrimaryGeo: TSQLGeoID read fPrimaryGeo write fPrimaryGeo;
      property SecondaryGeo: TSQLGeoID read fSecondaryGeo write fSecondaryGeo;
      property ExemptAmount: Currency read fExemptAmount write fExemptAmount;
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: Integer read fTaxAuthParty write fTaxAuthParty;
      property OverrideGlAccount: TSQLGlAccountID read fOverrideGlAccount write fOverrideGlAccount;
      property IncludeInTax: Boolean read fIncludeInTax write fIncludeInTax;
      property IncludeInShipping: Boolean read fIncludeInShipping write fIncludeInShipping;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 87
  TSQLReturnAdjustmentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLReturnAdjustmentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLReturnAdjustmentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;


  // 88
  TSQLReturnHeader = class(TSQLRecord)
    private
      fReturnHeaderType: TSQLReturnHeaderTypeID;
      fStatus: TSQLStatusItemID;
      fCreatedBy: TSQLUserLoginID;
      fFromParty: TSQLPartyID;
      fToParty: TSQLPartyID;
      fPaymentMethod: TSQLPaymentMethodID;
      fFinAccount: TSQLFinAccountID;
      fBillingAccount: TSQLBillingAccountID;
      fEntryDate: TDateTime;
      fOriginContactMech: TSQLContactMechID;
      fDestinationFacility: TSQLFacilityID;
      fNeedsInventoryReceive: Boolean;
      fCurrencyUom: TSQLUomID;
      fSupplierRma: Integer;
    published
      property ReturnHeaderType: TSQLReturnHeaderTypeID read fReturnHeaderType write fReturnHeaderType;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property CreatedBy: TSQLUserLoginID read fCreatedBy write fCreatedBy;
      property FromParty: TSQLPartyID read fFromParty write fFromParty;
      property ToParty: TSQLPartyID read fToParty write fToParty;
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property BillingAccount: TSQLBillingAccountID read fBillingAccount write fBillingAccount;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property OriginContactMech: TSQLContactMechID read fOriginContactMech write fOriginContactMech;
      property DestinationFacility: TSQLFacilityID read fDestinationFacility write fDestinationFacility;
      property NeedsInventoryReceive: Boolean read fNeedsInventoryReceive write fNeedsInventoryReceive;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property SupplierRma: Integer read fSupplierRma write fSupplierRma;
  end;

  // 89
  TSQLReturnHeaderType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLReturnHeaderTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLReturnHeaderTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 90
  TSQLReturnItem = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeaderID;
      fFeturnItemSeq: Integer;
      fReturnReason: TSQLReturnReasonID;
      fReturnType: TSQLReturnTypeID;
      fReturnItemType: TSQLReturnItemTypeID;
      fProduct: TSQLProductID;
      fDescription: RawUTF8;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fStatus: TSQLStatusItemID;
      fExpectedItemStatus: TSQLStatusItemID;
      fReturnQuantity: Double;
      fReceivedQuantity: Double;
      fReturnPrice: Currency;
      fReturnItemResponse: TSQLReturnItemResponseID;
    published
      property Return: TSQLReturnHeaderID read fReturn write fReturn;
      property FeturnItemSeq: Integer read fFeturnItemSeq write fFeturnItemSeq;
      property ReturnReason: TSQLReturnReasonID read fReturnReason write fReturnReason;
      property ReturnType: TSQLReturnTypeID read fReturnType write fReturnType;
      property ReturnItemType: TSQLReturnItemTypeID read fReturnItemType write fReturnItemType;
      property Product: TSQLProductID read fProduct write fProduct;
      property Description: RawUTF8 read fDescription write fDescription;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property ExpectedItemStatus: TSQLStatusItemID read fExpectedItemStatus write fExpectedItemStatus;
      property ReturnQuantity: Double read fReturnQuantity write fReturnQuantity;
      property ReceivedQuantity: Double read fReceivedQuantity write fReceivedQuantity;
      property ReturnPrice: Currency read fReturnPrice write fReturnPrice;
      property ReturnItemResponse: TSQLReturnItemResponseID read fReturnItemResponse write fReturnItemResponse;
  end;

  // 91
  TSQLReturnItemResponse = class(TSQLRecord)
    private
      fOrderPaymentPreference: TSQLOrderPaymentPreferenceID;
      fReplacementOrder: TSQLOrderHeaderID;
      fPayment: TSQLPaymentID;
      fBillingAccount: TSQLBillingAccountID;
      fFinAccountTrans: TSQLFinAccountTransID;
      fResponseAmount: Currency;
      fResponseDate: TDateTime;
    published
      property OrderPaymentPreference: TSQLOrderPaymentPreferenceID read fOrderPaymentPreference write fOrderPaymentPreference;
      property ReplacementOrder: TSQLOrderHeaderID read fReplacementOrder write fReplacementOrder;
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property BillingAccount: TSQLBillingAccountID read fBillingAccount write fBillingAccount;
      property FinAccountTrans: TSQLFinAccountTransID read fFinAccountTrans write fFinAccountTrans;
      property ResponseAmount: Currency read fResponseAmount write fResponseAmount;
      property ResponseDate: TDateTime read fResponseDate write fResponseDate;
  end;

  // 92
  TSQLReturnItemType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLReturnItemTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLReturnItemTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 93
  TSQLReturnItemTypeMap = class(TSQLRecord)
    private
      fReturnHeaderTypeEncode: RawUTF8;
      fReturnItemTypeEncode: RawUTF8;
      fReturnItemMapKey: RawUTF8;
      fReturnHeaderType: TSQLReturnHeaderTypeID;
      fReturnItemType: TSQLReturnAdjustmentTypeID;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property ReturnHeaderTypeEncode: RawUTF8 read fReturnHeaderTypeEncode write fReturnHeaderTypeEncode;
      property ReturnItemTypeEncode: RawUTF8 read fReturnItemTypeEncode write fReturnItemTypeEncode;
      property ReturnItemMapKey: RawUTF8 read fReturnItemMapKey write fReturnItemMapKey;
      property ReturnHeaderType: TSQLReturnHeaderTypeID read fReturnHeaderType write fReturnHeaderType;
      property ReturnItemType: TSQLReturnAdjustmentTypeID read fReturnItemType write fReturnItemType;
  end;

  // 94
  TSQLReturnReason = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
      fSequence: Integer;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Sequence: Integer read fSequence write fSequence;
  end;

  // 95
  TSQLReturnStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItemID;
      fReturn: TSQLReturnHeaderID;
      fReturnItemSeq: Integer;
      fChangeByUserLogin: TSQLUserLoginID;
      fStatusDatetime: TDateTime;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Return: TSQLReturnHeaderID read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
  end;

  // 96
  TSQLReturnType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
      fSequence: Integer;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Sequence: Integer read fSequence write fSequence;
  end;

  // 97
  TSQLReturnItemBilling = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeaderID;
      fReturnItemSeq: Integer;
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fShipmentReceipt: TSQLShipmentReceiptID;
      fQuantity: Double;
      fAmount: Currency;
    published
      property Return: TSQLReturnHeaderID read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property ShipmentReceipt: TSQLShipmentReceiptID read fShipmentReceipt write fShipmentReceipt;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 98
  TSQLReturnItemShipment = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeaderID;
      fReturnItemSeq: Integer;
      fShipment: TSQLShipmentID;
      fShipmentItemSeq: Integer;
      fQuantity: Double;
    published
      property Return: TSQLReturnHeaderID read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 99
  TSQLReturnContactMech = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeaderID;
      fContactMechPurposeType: TSQLContactMechPurposeTypeID;
      fContactMech: TSQLContactMechID;
    published
      property Return: TSQLReturnHeaderID read fReturn write fReturn;
      property ContactMechPurposeType: TSQLContactMechPurposeTypeID read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
  end;

  // 100
  TSQLCartAbandonedLine = class(TSQLRecord)
    private
      fVisit: Integer;
      fCartAbandonedLineSeq: Integer;
      fProduct: TSQLProductID;
      fProdCatalog: TSQLProdCatalogID;
      fQuantity: Double;
      fReservStart: TDateTime;
      fReservLength: Double;
      fReservPersons: Integer;
      fUnitPrice: Currency;
      fReserv2ndPPPerc: Double;
      fReservNthPPPerc: Double;
      fConfigId: Integer;
      fTotalWithAdjustments: Currency;
      fWasReserved: Boolean;
    published
      property Visit: Integer read fVisit write fVisit;
      property CartAbandonedLineSeq: Integer read fCartAbandonedLineSeq write fCartAbandonedLineSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProdCatalog: TSQLProdCatalogID read fProdCatalog write fProdCatalog;
      property Quantity: Double read fQuantity write fQuantity;
      property ReservStart: TDateTime read fReservStart write fReservStart;
      property ReservLength: Double read fReservLength write fReservLength;
      property ReservPersons: Integer read fReservPersons write fReservPersons;
      property UnitPrice: Currency read fUnitPrice write fUnitPrice;
      property Reserv2ndPPPerc: Double read fReserv2ndPPPerc write fReserv2ndPPPerc;
      property ReservNthPPPerc: Double read fReservNthPPPerc write fReservNthPPPerc;
      property ConfigId: Integer read fConfigId write fConfigId;
      property TotalWithAdjustments: Currency read fTotalWithAdjustments write fTotalWithAdjustments;
      property WasReserved: Boolean read fWasReserved write fWasReserved;
  end;

  // 101
  TSQLShoppingList = class(TSQLRecord)
    private
      fShoppingListType: TSQLShoppingListTypeID;
      fParentShoppingList: TSQLShoppingListID;
      fProductStore: TSQLProductStoreID;
      fVisitorId: Integer;
      fParty: TSQLPartyID;
      fListName: RawUTF8;
      fDescription: RawUTF8;
      fIsPublic: Boolean;
      fIsActive: Boolean;
      fCurrencyUom: TSQLUomID;
      fShipmentMethodType: Integer;
      fCarrierParty: Integer;
      fCarrierRoleType: Integer;
      fContactMech: TSQLContactMechID;
      fPaymentMethod: TSQLPaymentMethodID;
      fRecurrenceInfo: TSQLRecurrenceInfoID;
      fLastOrderedDate: TDateTime;
      fLastAdminModified: TDateTime;
      fProductPromoCode: TSQLProductPromoCodeID;
    published
      property ShoppingListType: TSQLShoppingListTypeID read fShoppingListType write fShoppingListType;
      property ParentShoppingList: TSQLShoppingListID read fParentShoppingList write fParentShoppingList;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property VisitorId: Integer read fVisitorId write fVisitorId;
      property Party: TSQLPartyID read fParty write fParty;
      property ListName: RawUTF8 read fListName write fListName;
      property Description: RawUTF8 read fDescription write fDescription;
      property IsPublic: Boolean read fIsPublic write fIsPublic;
      property IsActive: Boolean read fIsActive write fIsActive;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property ShipmentMethodType: Integer read fShipmentMethodType write fShipmentMethodType;
      property CarrierParty: Integer read fCarrierParty write fCarrierParty;
      property CarrierRoleType: Integer read fCarrierRoleType write fCarrierRoleType;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property RecurrenceInfo: TSQLRecurrenceInfoID read fRecurrenceInfo write fRecurrenceInfo;
      property LastOrderedDate: TDateTime read fLastOrderedDate write fLastOrderedDate;
      property LastAdminModified: TDateTime read fLastAdminModified write fLastAdminModified;
      property ProductPromoCode: TSQLProductPromoCodeID read fProductPromoCode write fProductPromoCode;
  end;

  // 102
  TSQLShoppingListItem = class(TSQLRecord)
    private
      fShoppingList: TSQLShoppingListID;
      fShoppingListItemSeq: Integer;
      fProduct: TSQLProductID;
      fQuantity: Double;
      fModifiedPrice: Currency;
      fReservStart: TDateTime;
      fReservLength: Double;
      fReservPersons: Double;
      fQuantityPurchased: Double;
      fConfigId: Integer;
    published
      property ShoppingList: TSQLShoppingListID read fShoppingList write fShoppingList;
      property ShoppingListItemSeq: Integer read fShoppingListItemSeq write fShoppingListItemSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property Quantity: Double read fQuantity write fQuantity;
      property ModifiedPrice: Currency read fModifiedPrice write fModifiedPrice;
      property ReservStart: TDateTime read fReservStart write fReservStart;
      property ReservLength: Double read fReservLength write fReservLength;
      property ReservPersons: Double read fReservPersons write fReservPersons;
      property QuantityPurchased: Double read fQuantityPurchased write fQuantityPurchased;
      property ConfigId: Integer read fConfigId write fConfigId;
  end;

  // 103
  TSQLShoppingListItemSurvey = class(TSQLRecord)
    private
      fShoppingList: TSQLShoppingListID;
      fShoppingListItemSeq: Integer;
      fSurveyResponse: TSQLSurveyResponseID;
    published
      property ShoppingList: TSQLShoppingListID read fShoppingList write fShoppingList;
      property ShoppingListItemSeq: Integer read fShoppingListItemSeq write fShoppingListItemSeq;
      property SurveyResponse: TSQLSurveyResponseID read fSurveyResponse write fSurveyResponse;
  end;

  // 104
  TSQLShoppingListType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 105
  TSQLShoppingListWorkEffort = class(TSQLRecord)
    private
      fShoppingList: TSQLShoppingListID;
      fWorkEffort: TSQLWorkEffortID;
    published
      property ShoppingList: TSQLShoppingListID read fShoppingList write fShoppingList;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
  end;

implementation

uses
  Classes, SysUtils;

// 1
class procedure TSQLCustRequestType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLCustRequestType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLCustRequestType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','CustRequestType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update CustRequestType set parent=(select c.id from CustRequestType c where c.Encode=CustRequestType.ParentEncode);');
    Server.Execute('update CustRequestResolution set CustRequestType=(select c.id from CustRequestType c where c.Encode=CustRequestResolution.CustRequestTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 2
class procedure TSQLCustRequestResolution.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLCustRequestResolution;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLCustRequestResolution.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','CustRequestResolution.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update CustRequestResolution set CustRequestType=(select c.id from CustRequestType c where c.Encode=CustRequestResolution.CustRequestTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 3
class procedure TSQLOrderAdjustmentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLOrderAdjustmentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLOrderAdjustmentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','OrderAdjustmentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update OrderAdjustmentType set parent=(select c.id from OrderAdjustmentType c where c.Encode=OrderAdjustmentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 4
class procedure TSQLOrderBlacklistType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLOrderBlacklistType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLOrderBlacklistType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','OrderBlacklistType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 5
class procedure TSQLOrderItemType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLOrderItemType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLOrderItemType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','OrderItemType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update OrderItemType set parent=(select c.id from OrderItemType c where c.Encode=OrderItemType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 6
class procedure TSQLOrderType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLOrderType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLOrderType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','OrderType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update OrderType set parent=(select c.id from OrderType c where c.Encode=OrderType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 7
class procedure TSQLOrderItemAssocType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLOrderItemAssocType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLOrderItemAssocType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','OrderItemAssocType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update OrderItemAssocType set parent=(select c.id from OrderItemAssocType c where c.Encode=OrderItemAssocType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 8
class procedure TSQLQuoteType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLQuoteType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLQuoteType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','QuoteType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update QuoteType set parent=(select c.id from QuoteType c where c.Encode=QuoteType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 9
class procedure TSQLRequirementType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLRequirementType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLRequirementType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','RequirementType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update RequirementType set parent=(select c.id from RequirementType c where c.Encode=RequirementType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 10
class procedure TSQLShoppingListType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLShoppingListType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLShoppingListType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ShoppingListType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 11
class procedure TSQLReturnAdjustmentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLReturnAdjustmentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLReturnAdjustmentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ReturnAdjustmentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ReturnAdjustmentType set parent=(select c.id from ReturnAdjustmentType c where c.Encode=ReturnAdjustmentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 12
class procedure TSQLReturnHeaderType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLReturnHeaderType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLReturnHeaderType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ReturnHeaderType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ReturnHeaderType set parent=(select c.id from ReturnHeaderType c where c.Encode=ReturnHeaderType.ParentEncode);');
    Server.Execute('update ReturnItemTypeMap set ReturnHeaderType=(select c.id from ReturnHeaderType c where c.Encode=ReturnItemTypeMap.ReturnHeaderTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 13
class procedure TSQLReturnItemType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLReturnItemType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLReturnItemType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ReturnItemType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ReturnItemType set parent=(select c.id from ReturnItemType c where c.Encode=ReturnItemType.ParentEncode);');
    Server.Execute('update ReturnItemTypeMap set ReturnItemType=(select c.id from ReturnItemType c where c.Encode=ReturnItemTypeMap.ReturnItemTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 14
class procedure TSQLReturnItemTypeMap.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLReturnItemTypeMap;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLReturnItemTypeMap.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ReturnItemTypeMap.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ReturnItemTypeMap set ReturnHeaderType=(select c.id from ReturnHeaderType c where c.Encode=ReturnItemTypeMap.ReturnHeaderTypeEncode);');
    Server.Execute('update ReturnItemTypeMap set ReturnItemType=(select c.id from ReturnItemType c where c.Encode=ReturnItemTypeMap.ReturnItemTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 15
class procedure TSQLReturnReason.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLReturnReason;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLReturnReason.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ReturnReason.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 16
class procedure TSQLReturnType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLReturnType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLReturnType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ReturnType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 17
class procedure TSQLWorkReqFulfType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLWorkReqFulfType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLWorkReqFulfType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','WorkReqFulfType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

end.

