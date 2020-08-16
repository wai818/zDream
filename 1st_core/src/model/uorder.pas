unit uOrder;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1 订单调整
  TSQLOrderAdjustment = class(TSQLRecord)
    private
      fOrderAdjustmentType: TSQLOrderAdjustmentType;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fComments: RawUTF8;
      fDescription: RawUTF8;
      fAmount: Currency;
      fRecurringAmount: Currency;
      fAmountAlreadyIncluded: Currency;
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: TSQLProductPromoRule;
      fProductPromoActionSeq: Integer;
      fProductFeature: Integer;
      fCorrespondingProduct: Integer;
      fTaxAuthorityRateSeq: TSQLTaxAuthorityRateProduct;
      fSourceReference: Integer;
      fSourcePercentage: Double;
      fCustomerReference: Integer;
      fPrimaryGeo: TSQLGeo;
      fSecondaryGeo: TSQLGeo;
      fExemptAmount: Currency;
      fTaxAuthGeo: Integer;
      fTaxAuthParty: Integer;
      fOverrideGlAccount: TSQLGlAccount;
      fIncludeInTax: Boolean;
      fIncludeInShipping: Boolean;
      fIsManual: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
      fOriginalAdjustment: TSQLOrderAdjustment;
    published
      property OrderAdjustmentType: TSQLOrderAdjustmentType read fOrderAdjustmentType write fOrderAdjustmentType;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Comments: RawUTF8 read fComments write fComments;
      property Description: RawUTF8 read fDescription write fDescription;
      property Amount: Currency read fAmount write fAmount;
      property RecurringAmount: Currency read fRecurringAmount write fRecurringAmount;
      property AmountAlreadyIncluded: Currency read fAmountAlreadyIncluded write fAmountAlreadyIncluded;
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRule read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property CorrespondingProduct: Integer read fCorrespondingProduct write fCorrespondingProduct;
      property TaxAuthorityRateSeq: TSQLTaxAuthorityRateProduct read fTaxAuthorityRateSeq write fTaxAuthorityRateSeq;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property SourcePercentage: Double read fSourcePercentage write fSourcePercentage;
      property CustomerReference: Integer read fCustomerReference write fCustomerReference;
      property PrimaryGeo: TSQLGeo read fPrimaryGeo write fPrimaryGeo;
      property SecondaryGeo: TSQLGeo read fSecondaryGeo write fSecondaryGeo;
      property ExemptAmount: Currency read fExemptAmount write fExemptAmount;
      property TaxAuthGeo: Integer read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: Integer read fTaxAuthParty write fTaxAuthParty;
      property OverrideGlAccount: TSQLGlAccount read fOverrideGlAccount write fOverrideGlAccount;
      property IncludeInTax: Boolean read fIncludeInTax write fIncludeInTax;
      property IncludeInShipping: Boolean read fIncludeInShipping write fIncludeInShipping;
      property IsManual: Boolean read fIsManual write fIsManual;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      property OriginalAdjustment: TSQLOrderAdjustment read fOriginalAdjustment write fOriginalAdjustment;
  end;

  // 2 订单调整属性
  TSQLOrderAdjustmentAttribute = class(TSQLRecord)
    private
      fOrderAdjustment: TSQLOrderAdjustment;
      fAttrName: TSQLOrderAdjustmentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property OrderAdjustment: TSQLOrderAdjustment read fOrderAdjustment write fOrderAdjustment;
      property AttrName: TSQLOrderAdjustmentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 3
  TSQLOrderAdjustmentType = class(TSQLRecord)
    private
      fParent: TSQLOrderAdjustmentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLOrderAdjustmentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 4
  TSQLOrderAdjustmentBilling = class(TSQLRecord)
    private
      fOrderAdjustment: TSQLOrderAdjustment;
      fInvoice: TSQLInvoice;
      fInvoiceItemSeq: Integer;
      fAmount: Currency;
    published
      property OrderAdjustment: TSQLOrderAdjustment read fOrderAdjustment write fOrderAdjustment;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 5
  TSQLOrderAdjustmentTypeAttr = class(TSQLRecord)
    private
      fOrderAdjustmentType: TSQLOrderAdjustmentType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property OrderAdjustmentType: TSQLOrderAdjustmentType read fOrderAdjustmentType write fOrderAdjustmentType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 6
  TSQLOrderAttribute = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 7
  TSQLOrderBlacklist = class(TSQLRecord)
    private
      fBlacklistString: RawUTF8;
      fOrderBlacklistType: TSQLOrderBlacklistType;
    published
      property BlacklistString: RawUTF8 read fBlacklistString write fBlacklistString;
      property OrderBlacklistType: TSQLOrderBlacklistType read fOrderBlacklistType write fOrderBlacklistType;
  end;

  // 8
  TSQLOrderBlacklistType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 9
  TSQLCommunicationEventOrder = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fCommunicationEvent: TSQLCommunicationEvent;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
  end;

  // 10
  TSQLOrderContactMech = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fContactMechPurposeType: TSQLContactMechPurposeType;
      fContactMech: TSQLContactMech;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property ContactMechPurposeType: TSQLContactMechPurposeType read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
  end;

  // 11
  TSQLOrderContent = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fContent: TSQLContent;
      fOrderContentType: TSQLOrderContentType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Content: TSQLContent read fContent write fContent;
      property OrderContentType: TSQLOrderContentType read fOrderContentType write fOrderContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 12
  TSQLOrderContentType = class(TSQLRecord)
    private
      fParent: TSQLOrderContentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLOrderContentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 13
  TSQLOrderDeliverySchedule = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fEstimatedReadyDate: TDateTime;
      fCartons: Integer;
      fSkidsPallets: Integer;
      fUnitsPieces: Double;
      fTotalCubicSize: Double;
      fTotalCubicUom: TSQLUom;
      fTotalWeight: Double;
      fTotalWeightUom: TSQLUom;
      fStatus: TSQLStatusItem;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property EstimatedReadyDate: TDateTime read fEstimatedReadyDate write fEstimatedReadyDate;
      property Cartons: Integer read fCartons write fCartons;
      property SkidsPallets: Integer read fSkidsPallets write fSkidsPallets;
      property UnitsPieces: Double read fUnitsPieces write fUnitsPieces;
      property TotalCubicSize: Double read fTotalCubicSize write fTotalCubicSize;
      property TotalCubicUom: TSQLUom read fTotalCubicUom write fTotalCubicUom;
      property TotalWeight: Double read fTotalWeight write fTotalWeight;
      property TotalWeightUom: TSQLUom read fTotalWeightUom write fTotalWeightUom;
      property Status: TSQLStatusItem read fStatus write fStatus;
  end;

  // 14
  TSQLOrderHeader = class(TSQLRecord)
    private
      fOrderType: TSQLOrderType;
      fOrderName: RawUTF8;
      fExternalId: Integer;
      fSalesChannelEnum: TSQLEnumeration;
      fOrderDate: TDateTime;
      fPriority: Boolean;
      fEntryDate: TDateTime;
      fPickSheetPrintedDate: TDateTime;
      fVisit: Integer;
      fStatus: TSQLStatusItem;
      fCreatedBy: TSQLUserLogin;
      fFirstAttemptOrder: Integer;
      fCurrencyUom: TSQLUom;
      fAyncStatus: TSQLStatusItem;
      fBillingAccount: TSQLBillingAccount;
      fOriginFacility: TSQLFacility;
      fWebSite: TSQLWebSite;
      fProductStore: TSQLProductStore;
      fTerminalId: RawUTF8;
      fTransactionId: Integer;
      fAutoOrderShoppingList: TSQLShoppingList;
      fNeedsInventoryIssuance: Boolean;
      fIsRushOrder: Boolean;
      fInternalCode: Integer;
      fRemainingSubTotal: Currency;
      fGrandTotal: Currency;
      fIsViewed: Boolean;
      fInvoicePerShipment: Boolean;
    published
      property OrderType: TSQLOrderType read fOrderType write fOrderType;
      property OrderName: RawUTF8 read fOrderName write fOrderName;
      property ExternalId: Integer read fExternalId write fExternalId;
      property SalesChannelEnum: TSQLEnumeration read fSalesChannelEnum write fSalesChannelEnum;
      property OrderDate: TDateTime read fOrderDate write fOrderDate;
      property Priority: Boolean read fPriority write fPriority;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property PickSheetPrintedDate: TDateTime read fPickSheetPrintedDate write fPickSheetPrintedDate;
      property Visit: Integer read fVisit write fVisit;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property CreatedBy: TSQLUserLogin read fCreatedBy write fCreatedBy;
      property FirstAttemptOrder: Integer read fFirstAttemptOrder write fFirstAttemptOrder;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property AyncStatus: TSQLStatusItem read fAyncStatus write fAyncStatus;
      property BillingAccount: TSQLBillingAccount read fBillingAccount write fBillingAccount;
      property OriginFacility: TSQLFacility read fOriginFacility write fOriginFacility;
      property WebSite: TSQLWebSite read fWebSite write fWebSite;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property TerminalId: RawUTF8 read fTerminalId write fTerminalId;
      property TransactionId: Integer read fTransactionId write fTransactionId;
      property AutoOrderShoppingList: TSQLShoppingList read fAutoOrderShoppingList write fAutoOrderShoppingList;
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
      fOrderId: TSQLOrderHeader;
      fNote: TSQLNoteData;
      fInternalNote: Boolean;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property Note: TSQLNoteData read fNote write fNote;
      property InternalNote: Boolean read fInternalNote write fInternalNote;
  end;

  // 16
  TSQLOrderHeaderWorkEffort = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fWorkEffort: TSQLWorkEffort;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
  end;

  // 17
  TSQLOrderItem = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fExternalId: Integer;
      fOrderItemType: TSQLOrderItemType;
      fOrderItemGroupSeq: Integer;
      fIsItemGroupPrimary: Boolean;
      fFromInventoryItem: TSQLInventoryItem;
      fBudgetId: Integer;
      fBudgetItemSeq: Integer;
      fProduct: TSQLProduct;
      fSupplierProduct: Integer;
      fProductFeature: Integer;
      fProdCatalog: Integer;
      fProductCategory: Integer;
      fIsPromo: Boolean;
      fQuote: TSQLQuoteItem;
      fQuoteItemSeq: Integer;
      fShoppingList: TSQLShoppingListItem;
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
      fRecurringFreqUom: TSQLUom;
      fItemDescription: RawUTF8;
      fComments: RawUTF8;
      fCorrespondingPo: Integer;
      fStatus: TSQLStatusItem;
      fSyncStatus: TSQLStatusItem;
      fEstimatedShipDate: TDateTime;
      fEstimatedDeliveryDate: TDateTime;
      fAutoCancelDate: TDateTime;
      fDontCancelSetDate: TDateTime;
      fDontCancelSetUserLogin: TSQLUserLogin;
      fShipBeforeDate: TDateTime;
      fShipAfterDate: TDateTime;
      fCancelBackOrderDate: TDateTime;
      fOverrideGlAccount: TSQLGlAccount;
      fSalesOpportunity: TSQLSalesOpportunity;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ExternalId: Integer read fExternalId write fExternalId;
      property OrderItemType: TSQLOrderItemType read fOrderItemType write fOrderItemType;
      property OrderItemGroupSeq: Integer read fOrderItemGroupSeq write fOrderItemGroupSeq;
      property IsItemGroupPrimary: Boolean read fIsItemGroupPrimary write fIsItemGroupPrimary;
      property FromInventoryItem: TSQLInventoryItem read fFromInventoryItem write fFromInventoryItem;
      property BudgetId: Integer read fBudgetId write fBudgetId;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property Product: TSQLProduct read fProduct write fProduct;
      property SupplierProduct: Integer read fSupplierProduct write fSupplierProduct;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property ProdCatalog: Integer read fProdCatalog write fProdCatalog;
      property ProductCategory: Integer read fProductCategory write fProductCategory;
      property IsPromo: Boolean read fIsPromo write fIsPromo;
      property Quote: TSQLQuoteItem read fQuote write fQuote;
      property QuoteItemSeq: Integer read fQuoteItemSeq write fQuoteItemSeq;
      property ShoppingList: TSQLShoppingListItem read fShoppingList write fShoppingList;
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
      property RecurringFreqUom: TSQLUom read fRecurringFreqUom write fRecurringFreqUom;
      property ItemDescription: RawUTF8 read fItemDescription write fItemDescription;
      property Comments: RawUTF8 read fComments write fComments;
      property CorrespondingPo: Integer read fCorrespondingPo write fCorrespondingPo;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property SyncStatus: TSQLStatusItem read fSyncStatus write fSyncStatus;
      property EstimatedShipDate: TDateTime read fEstimatedShipDate write fEstimatedShipDate;
      property EstimatedDeliveryDate: TDateTime read fEstimatedDeliveryDate write fEstimatedDeliveryDate;
      property AutoCancelDate: TDateTime read fAutoCancelDate write fAutoCancelDate;
      property DontCancelSetDate: TDateTime read fDontCancelSetDate write fDontCancelSetDate;
      property DontCancelSetUserLogin: TSQLUserLogin read fDontCancelSetUserLogin write fDontCancelSetUserLogin;
      property ShipBeforeDate: TDateTime read fShipBeforeDate write fShipBeforeDate;
      property ShipAfterDate: TDateTime read fShipAfterDate write fShipAfterDate;
      property CancelBackOrderDate: TDateTime read fCancelBackOrderDate write fCancelBackOrderDate;
      property OverrideGlAccount: TSQLGlAccount read fOverrideGlAccount write fOverrideGlAccount;
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 18
  TSQLOrderItemAssoc = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fToOrder: TSQLOrderHeader;
      fToOrderItemSeq: Integer;
      fToShipGroupSeq: Integer;
      fOrderItemAssocType: TSQLOrderItemAssocType;
      fQuantity: Double;
   published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property ToOrder: TSQLOrderHeader read fToOrder write fToOrder;
      property ToOrderItemSeq: Integer read fToOrderItemSeq write fToOrderItemSeq;
      property ToShipGroupSeq: Integer read fToShipGroupSeq write fToShipGroupSeq;
      property OrderItemAssocType: TSQLOrderItemAssocType read fOrderItemAssocType write fOrderItemAssocType;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 19
  TSQLOrderItemAssocType = class(TSQLRecord)
    private
      fParent: TSQLOrderItemAssocType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLOrderItemAssocType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 20
  TSQLOrderItemAttribute = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 21
  TSQLOrderItemBilling = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fInvoice: TSQLInvoice;
      fInvoiceItemSeq: Integer;
      fItemIssuance: TSQLItemIssuance;
      fShipmentReceipt: TSQLShipmentReceipt;
      fQuantity: Double;
      fAmount: Currency;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property ItemIssuance: TSQLItemIssuance read fItemIssuance write fItemIssuance;
      property ShipmentReceipt: TSQLShipmentReceipt read fShipmentReceipt write fShipmentReceipt;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 22
  TSQLOrderItemChange = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fChangeTypeEnum: TSQLEnumeration;
      fChangeDatetime: TDateTime;
      fQuantity: Double;
      fCancelQuantity: Double;
      fUnitPrice: Currency;
      fItemDescription: RawUTF8;
      fReasonEnum: TSQLEnumeration;
      fChangeComments: RawUTF8;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ChangeTypeEnum: TSQLEnumeration read fChangeTypeEnum write fChangeTypeEnum;
      property ChangeDatetime: TDateTime read fChangeDatetime write fChangeDatetime;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
      property UnitPrice: Currency read fUnitPrice write fUnitPrice;
      property ItemDescription: RawUTF8 read fItemDescription write fItemDescription;
      property ReasonEnum: TSQLEnumeration read fReasonEnum write fReasonEnum;
      property ChangeComments: RawUTF8 read fChangeComments write fChangeComments;
  end;

  // 23
  TSQLOrderItemContactMech = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fContactMechPurposeType: TSQLContactMechPurposeType;
      fContactMech: TSQLContactMech;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ContactMechPurposeType: TSQLContactMechPurposeType read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
  end;

  // 24
  TSQLOrderItemGroup = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemGroupSeq: Integer;
      fParentGroupSeq: TSQLOrderItemGroup;
      fGroupName: RawUTF8;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemGroupSeq: Integer read fOrderItemGroupSeq write fOrderItemGroupSeq;
      property ParentGroupSeq: TSQLOrderItemGroup read fParentGroupSeq write fParentGroupSeq;
      property GroupName: RawUTF8 read fGroupName write fGroupName;
  end;

  // 25
  TSQLOrderItemGroupOrder = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fGroupOrder: TSQLProductGroupOrder;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property GroupOrder: TSQLProductGroupOrder read fGroupOrder write fGroupOrder;
  end;

  // 26
  TSQLOrderItemPriceInfo = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fProductPriceRule: TSQLProductPriceRule;
      fProductPriceActionSeq: Integer;
      fModifyAmount: Currency;
      fDescription: RawUTF8;
      fRateCode: RawUTF8;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ProductPriceRule: TSQLProductPriceRule read fProductPriceRule write fProductPriceRule;
      property ProductPriceActionSeq: Integer read fProductPriceActionSeq write fProductPriceActionSeq;
      property ModifyAmount: Currency read fModifyAmount write fModifyAmount;
      property Description: RawUTF8 read fDescription write fDescription;
      property RateCode: RawUTF8 read fRateCode write fRateCode;
  end;

  // 27
  TSQLOrderItemRole = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 28
  TSQLOrderItemShipGroup = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fShipGroupSeq: Integer;
      fShipmentMethodType: TSQLShipmentMethodType;
      fSupplierParty: TSQLParty;
      fVendorParty: TSQLParty;
      fCarrierParty: TSQLParty;
      fCarrierRoleType: TSQLRoleType;
      fFacility: TSQLFacility;
      fContactMech: TSQLContactMech;
      fTelecomContactMech: TSQLTelecomNumber;
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
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property ShipmentMethodType: TSQLShipmentMethodType read fShipmentMethodType write fShipmentMethodType;
      property SupplierParty: TSQLParty read fSupplierParty write fSupplierParty;
      property VendorParty: TSQLParty read fVendorParty write fVendorParty;
      property CarrierParty: TSQLParty read fCarrierParty write fCarrierParty;
      property CarrierRoleType: TSQLRoleType read fCarrierRoleType write fCarrierRoleType;
      property Facility: TSQLFacility read fFacility write fFacility;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property TelecomContactMech: TSQLTelecomNumber read fTelecomContactMech write fTelecomContactMech;
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
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fQuantity: Double;
      fCancelQuantity: Double;
     published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
  end;

  // 30
  TSQLOrderItemShipGrpInvRes = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fShipGroupSeq: Integer;
      fInventoryItem: TSQLInventoryItem;
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
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
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
      fParent: TSQLOrderItemType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLOrderItemType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 32
  TSQLOrderItemTypeAttr = class(TSQLRecord)
    private
      fOrderItemType: TSQLOrderItemType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property OrderItemType: TSQLOrderItemType read fOrderItemType write fOrderItemType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 33
  TSQLOrderNotification = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fEmailType: TSQLEnumeration;
      fComments: RawUTF8;
      fNotificationDate: TDateTime;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property EmailType: TSQLEnumeration read fEmailType write fEmailType;
      property Comments: RawUTF8 read fComments write fComments;
      property NotificationDate: TDateTime read fNotificationDate write fNotificationDate;
  end;

  // 34
  TSQLOrderPaymentPreference = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fProductPricePurpose: TSQLProductPricePurpose;
      fPaymentMethodType: TSQLPaymentMethodType;
      fPaymentMethod: TSQLPaymentMethod;
      fFinAccount: TSQLFinAccount;
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
      fStatus: TSQLStatusItem;
      fNeedsNsfRetry: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property ProductPricePurpose: TSQLProductPricePurpose read fProductPricePurpose write fProductPricePurpose;
      property PaymentMethodType: TSQLPaymentMethodType read fPaymentMethodType write fPaymentMethodType;
      property PaymentMethod: TSQLPaymentMethod read fPaymentMethod write fPaymentMethod;
      property FinAccount: TSQLFinAccount read fFinAccount write fFinAccount;
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
      property Status: TSQLStatusItem read fStatus write fStatus;
      property NeedsNsfRetry: Boolean read fNeedsNsfRetry write fNeedsNsfRetry;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 35
  TSQLOrderProductPromoCode = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fProductPromoCode: TSQLProductPromoCode;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property ProductPromoCode: TSQLProductPromoCode read fProductPromoCode write fProductPromoCode;
  end;

  // 36
  TSQLOrderRole = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 37
  TSQLOrderShipment = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fShipment: TSQLShipment;
      fShipmentItemSeq: Integer;
      fQuantity: Double;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 38
  TSQLOrderStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fOrderPaymentPreference: TSQLOrderPaymentPreference;
      fStatusDatetime: TDateTime;
      fStatusUserLogin: TSQLUserLogin;
      fChangeReason: RawUTF8;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property OrderPaymentPreference: TSQLOrderPaymentPreference read fOrderPaymentPreference write fOrderPaymentPreference;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
      property StatusUserLogin: TSQLUserLogin read fStatusUserLogin write fStatusUserLogin;
      property ChangeReason: RawUTF8 read fChangeReason write fChangeReason;
  end;

  // 39
  TSQLOrderSummaryEntry = class(TSQLRecord)
    private
      fEntryDate: TDateTime;
      fProduct: TSQLProduct;
      fFacility: TSQLFacility;
      fTotalQuantity: Double;
      fGrossSales: Currency;
      fProductCost: Currency;
    published
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property Product: TSQLProduct read fProduct write fProduct;
      property Facility: TSQLFacility read fFacility write fFacility;
      property TotalQuantity: Double read fTotalQuantity write fTotalQuantity;
      property GrossSales: Currency read fGrossSales write fGrossSales;
      property ProductCost: Currency read fProductCost write fProductCost;
  end;

  // 40
  TSQLOrderTerm = class(TSQLRecord)
    private
      fTermType: TSQLTermType;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fTermValue: Currency;
      fTermDays: Integer;
      fTextValue: RawUTF8;
      fDescription: RawUTF8;
      fUom: TSQLUom;
    published
      property TermType: TSQLTermType read fTermType write fTermType;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property TermValue: Currency read fTermValue write fTermValue;
      property TermDays: Integer read fTermDays write fTermDays;
      property TextValue: RawUTF8 read fTextValue write fTextValue;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUom read fUom write fUom;
  end;

  // 41
  TSQLOrderTermAttribute = class(TSQLRecord)
    private
      fTermType: Integer;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property TermType: Integer read fTermType write fTermType;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 42
  TSQLOrderType = class(TSQLRecord)
    private
      fParent: TSQLOrderType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLOrderType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 43
  TSQLOrderTypeAttr = class(TSQLRecord)
    private
      fOrderType: TSQLOrderType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property OrderType: TSQLOrderType read fOrderType write fOrderType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 44
  TSQLProductOrderItem = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fEngagementId: TSQLOrderHeader;
      fEngagementItemSeq: Integer;
      fProduct: TSQLProduct;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property EngagementId: TSQLOrderHeader read fEngagementId write fEngagementId;
      property EngagementItemSeq: Integer read fEngagementItemSeq write fEngagementItemSeq;
      property Product: TSQLProduct read fProduct write fProduct;
  end;

  // 45
  TSQLWorkOrderItemFulfillment = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
  end;

  // 46
  TSQLQuote = class(TSQLRecord)
    private
      fQuoteType: TSQLQuoteType;
      fParty: TSQLParty;
      fIssueDate: TDateTime;
      fStatus: TSQLStatusItem;
      fCurrencyUom: TSQLUom;
      fProductStore: TSQLProductStore;
      fSalesChannelEnum: TSQLEnumeration;
      fValidFromDate: TDateTime;
      fValidThruDate: TDateTime;
      fQuoteName: RawUTF8;
      fDescription: RawUTF8;
    published
      property QuoteType: TSQLQuoteType read fQuoteType write fQuoteType;
      property Party: TSQLParty read fParty write fParty;
      property IssueDate: TDateTime read fIssueDate write fIssueDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property SalesChannelEnum: TSQLEnumeration read fSalesChannelEnum write fSalesChannelEnum;
      property ValidFromDate: TDateTime read fValidFromDate write fValidFromDate;
      property ValidThruDate: TDateTime read fValidThruDate write fValidThruDate;
      property QuoteName: RawUTF8 read fQuoteName write fQuoteName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 47
  TSQLQuoteAttribute = class(TSQLRecord)
    private
      fQuote: TSQLQuote;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Quote: TSQLQuote read fQuote write fQuote;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 48
  TSQLQuoteCoefficient = class(TSQLRecord)
    private
      fQuote: TSQLQuote;
      fCoeffName: RawUTF8;
      fCoeffValue: Double;
    published
      property Quote: TSQLQuote read fQuote write fQuote;
      property CoeffName: RawUTF8 read fCoeffName write fCoeffName;
      property CoeffValue: Double read fCoeffValue write fCoeffValue;
  end;

  // 49
  TSQLQuoteItem = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fProduct: TSQLProduct;
      fProductFeature: TSQLProductFeature;
      fDeliverableType: TSQLDeliverableType;
      fSkillType: TSQLSkillType;
      fUom: TSQLUom;
      fWorkEffort: TSQLWorkEffort;
      fCustRequest: TSQLCustRequest;
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
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property DeliverableType: TSQLDeliverableType read fDeliverableType write fDeliverableType;
      property SkillType: TSQLSkillType read fSkillType write fSkillType;
      property Uom: TSQLUom read fUom write fUom;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
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
      fQuote: TSQLQuote;
      fNote: TSQLNoteData;
    published
      property Quote: TSQLQuote read fQuote write fQuote;
      property Note: TSQLNoteData read fNote write fNote;
  end;

  // 51
  TSQLQuoteRole = class(TSQLRecord)
    private
      fQuote: TSQLQuote;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Quote: TSQLQuote read fQuote write fQuote;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 52
  TSQLQuoteTerm = class(TSQLRecord)
    private
      fTermType: TSQLTermType;
      fQuote: TSQLQuote;
      fQuoteItemSeq: Integer;
      fTermValue: Integer;
      fUom: Integer;
      fTermDays: Integer;
      fTextValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property TermType: TSQLTermType read fTermType write fTermType;
      property Quote: TSQLQuote read fQuote write fQuote;
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
      fParent: TSQLQuoteType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLQuoteType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 55
  TSQLQuoteTypeAttr = class(TSQLRecord)
    private
      fQuoteType: TSQLQuoteType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property QuoteType: TSQLQuoteType read fQuoteType write fQuoteType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 56
  TSQLQuoteWorkEffort = class(TSQLRecord)
    private
      fQuote: TSQLQuote;
      fWorkEffort: TSQLWorkEffort;
    published
      property Quote: TSQLQuote read fQuote write fQuote;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
  end;

  // 57
  TSQLQuoteAdjustment = class(TSQLRecord)
    private
      fOrderAdjustmentType: TSQLOrderAdjustmentType;
      fQuote: TSQLQuote;
      fQuoteItemSeqId: Integer;
      fComments: RawUTF8;
      fDescription: RawUTF8;
      fAmount: Currency;
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: TSQLProductPromoRule;
      fProductPromoActionSeq: Integer;
      fProductFeature: Integer;
      fCorrespondingProduct: Integer;
      fSourceReference: Integer;
      fSourcePercentage: Double;
      fCustomerReference: Integer;
      fPrimaryGeo: TSQLGeo;
      fSecondaryGeo: TSQLGeo;
      fExemptAmount: Currency;
      fTaxAuthGeo: Integer;
      fTaxAuthParty: Integer;
      fOverrideGlAccount: TSQLGlAccount;
      fIncludeInTax: Boolean;
      fIncludeInShipping: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property  read  write ;
      property Quote: TSQLQuote read fQuote write fQuote;
      property QuoteItemSeq: Integer read fQuoteItemSeq write fQuoteItemSeq;
      property Comments: RawUTF8 read fComments write fComments;
      property Description: RawUTF8 read fDescription write fDescription;
      property Amount: Currency read fAmount write fAmount;
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRule read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property CorrespondingProduct: Integer read fCorrespondingProduct write fCorrespondingProduct;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property SourcePercentage: Double read fSourcePercentage write fSourcePercentage;
      property CustomerReference: Integer read fCustomerReference write fCustomerReference;
      property PrimaryGeo: TSQLGeo read fPrimaryGeo write fPrimaryGeo;
      property SecondaryGeo: TSQLGeo read fSecondaryGeo write fSecondaryGeo;
      property ExemptAmount: Currency read fExemptAmount write fExemptAmount;
      property TaxAuthGeo: Integer read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: Integer read fTaxAuthParty write fTaxAuthParty;
      property OverrideGlAccount: TSQLGlAccount read fOverrideGlAccount write fOverrideGlAccount;
      property IncludeInTax: Boolean read fIncludeInTax write fIncludeInTax;
      property IncludeInShipping: Boolean read fIncludeInShipping write fIncludeInShipping;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 58
  TSQLCustRequest = class(TSQLRecord)
    private
      fCustRequestType: TSQLCustRequestType;
      fCustRequestCategory: TSQLCustRequestCategory;
      fStatus: TSQLStatusItem;
      fFromParty: TSQLParty;
      fPriority: Integer;
      fCustRequestDate: TDateTime;
      fResponseRequiredDate: TDateTime;
      fCustRequestName: RawUTF8;
      fDescription: RawUTF8;
      fMaximumAmountUom: TSQLUom;
      fProductStore: TSQLProductStore;
      fSalesChannelEnum: TSQLEnumeration;
      fFulfillContactMech: TSQLContactMech;
      fCurrencyUom: TSQLUom;
      fOpenDateTime: TDateTime;
      fClosedDateTime: TDateTime;
      fInternalComment: RawUTF8;
      fReason: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property CustRequestType: TSQLCustRequestType read fCustRequestType write fCustRequestType;
      property CustRequestCategory: TSQLCustRequestCategory read fCustRequestCategory write fCustRequestCategory;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property FromParty: TSQLParty read fFromParty write fFromParty;
      property Priority: Integer read fPriority write fPriority;
      property CustRequestDate: TDateTime read fCustRequestDate write fCustRequestDate;
      property ResponseRequiredDate: TDateTime read fResponseRequiredDate write fResponseRequiredDate;
      property CustRequestName: RawUTF8 read fCustRequestName write fCustRequestName;
      property Description: RawUTF8 read fDescription write fDescription;
      property MaximumAmountUom: TSQLUom read fMaximumAmountUom write fMaximumAmountUom;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property SalesChannelEnum: TSQLEnumeration read fSalesChannelEnum write fSalesChannelEnum;
      property FulfillContactMech: TSQLContactMech read fFulfillContactMech write fFulfillContactMech;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property OpenDateTime: TDateTime read fOpenDateTime write fOpenDateTime;
      property ClosedDateTime: TDateTime read fClosedDateTime write fClosedDateTime;
      property InternalComment: RawUTF8 read fInternalComment write fInternalComment;
      property Reason: RawUTF8 read fReason write fReason;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 59
  TSQLCustRequestAttribute = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 60
  TSQLCustRequestCategory = class(TSQLRecord)
    private
      fCustRequestType: TSQLCustRequestType;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property CustRequestType: TSQLCustRequestType read fCustRequestType write fCustRequestType;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 61
  TSQLCustRequestCommEvent = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fCommunicationEvent: TSQLCommunicationEvent;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
  end;

  // 62
  TSQLCustRequestContent = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fContent: TSQLContent;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property Content: TSQLContent read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 63
  TSQLCustRequestItem = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fCustRequestItemSeq: Integer;
      fCustRequestResolution: TSQLCustRequestResolution;
      fStatus: TSQLStatusItem;
      fPriority: Integer;
      fSequenceNum: Integer;
      fRequiredByDate: TDateTime;
      fProduct: TSQLProduct;
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
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property CustRequestResolution: TSQLCustRequestResolution read fCustRequestResolution write fCustRequestResolution;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Priority: Integer read fPriority write fPriority;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property RequiredByDate: TDateTime read fRequiredByDate write fRequiredByDate;
      property Product: TSQLProduct read fProduct write fProduct;
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
      fCustRequest: TSQLCustRequest;
      fNote: TSQLNoteData;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property Note: TSQLNoteData read fNote write fNote;
  end;

  // 65
  TSQLCustRequestItemNote = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fCustRequestItemSeq: Integer;
      fNote: TSQLNoteData;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property Note: TSQLNoteData read fNote write fNote;
  end;

  // 66
  TSQLCustRequestItemWorkEffort = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fCustRequestItemSeq: Integer;
      fWorkEffort: TSQLWorkEffort;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
  end;

  // 67
  TSQLCustRequestResolution = class(TSQLRecord)
    private
      fCustRequestType: TSQLCustRequestType;
      fDescription: RawUTF8;
    published
      property CustRequestType: TSQLCustRequestType read fCustRequestType write fCustRequestType;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 68
  TSQLCustRequestParty = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 69
  TSQLCustRequestStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fCustRequest: TSQLCustRequest;
      fCustRequestItemSeq: Integer;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 70
  TSQLCustRequestType = class(TSQLRecord)
    private
      fParent: TSQLCustRequestType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fParty: Integer;
    published
      property Parent: TSQLCustRequestType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property Party: Integer read fParty write fParty;
  end;

  // 71
  TSQLCustRequestTypeAttr = class(TSQLRecord)
    private
      fCustRequestType: TSQLCustRequestType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property CustRequestType: TSQLCustRequestType read fCustRequestType write fCustRequestType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 72
  TSQLCustRequestWorkEffort = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fWorkEffort: TSQLWorkEffort;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
  end;

  // 73
  TSQLRespondingParty = class(TSQLRecord)
    private
      fRespondingPartySeq: Integer;
      fCustRequest: TSQLCustRequest;
      fParty: TSQLParty;
      fContactMech: TSQLContactMech;
      fDateSent: TDateTime;
    published
      property RespondingPartySeq: Integer read fRespondingPartySeq write fRespondingPartySeq;
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property Party: TSQLParty read fParty write fParty;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property DateSent: TDateTime read fDateSent write fDateSent;
  end;

  // 74
  TSQLDesiredFeature = class(TSQLRecord)
    private
      fRequirement: TSQLRequirement;
      fProductFeature: TSQLProductFeature;
      fOptionalInd: Boolean;
    published
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property OptionalInd: Boolean read fOptionalInd write fOptionalInd;
  end;

  // 75
  TSQLOrderRequirementCommitment = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fRequirement: TSQLRequirement;
      fQuantity: Double;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 76
  TSQLRequirement = class(TSQLRecord)
    private
      fRequirementType: TSQLRequirementType;
      fFacility: TSQLFacility;
      fDeliverable: TSQLDeliverable;
      fFixedAsset: TSQLFixedAsset;
      fProduct: TSQLProduct;
      fStatus: TSQLStatusItem;
      fDescription: RawUTF8;
      fRequirementStartDate: TDateTime;
      fRequiredByDate: TDateTime;
      fEstimatedBudget: Currency;
      fQuantity: Double;
      fUseCase: RawUTF8;
      fReason: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property RequirementType: TSQLRequirementType read fRequirementType write fRequirementType;
      property Facility: TSQLFacility read fFacility write fFacility;
      property Deliverable: TSQLDeliverable read fDeliverable write fDeliverable;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property Product: TSQLProduct read fProduct write fProduct;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Description: RawUTF8 read fDescription write fDescription;
      property RequirementStartDate: TDateTime read fRequirementStartDate write fRequirementStartDate;
      property RequiredByDate: TDateTime read fRequiredByDate write fRequiredByDate;
      property EstimatedBudget: Currency read fEstimatedBudget write fEstimatedBudget;
      property Quantity: Double read fQuantity write fQuantity;
      property UseCase: RawUTF8 read fUseCase write fUseCase;
      property Reason: RawUTF8 read fReason write fReason;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 77
  TSQLRequirementAttribute = class(TSQLRecord)
    private
      fRequirement: TSQLRequirement;
      fAttrName: TSQLOrderAdjustmentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
      property AttrName: TSQLOrderAdjustmentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 78
  TSQLRequirementBudgetAllocation = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fBudgetItemSeq: Integer;
      fRequirement: TSQLRequirement;
      fAmount: Currency;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 79
  TSQLRequirementCustRequest = class(TSQLRecord)
    private
      fCustRequest: TSQLCustRequest;
      fCustRequestItemSeq: Integer;
      fRequirement: TSQLRequirement;
    published
      property CustRequest: TSQLCustRequest read fCustRequest write fCustRequest;
      property CustRequestItemSeq: Integer read fCustRequestItemSeq write fCustRequestItemSeq;
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
  end;

  // 80
  TSQLRequirementRole = class(TSQLRecord)
    private
      fRequirement: TSQLRequirement;
      fParty: TSQLParty;
      fRoleType: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: Integer read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 81
  TSQLRequirementStatus = class(TSQLRecord)
    private
      fRequirement: TSQLRequirement;
      fStatus: TSQLStatusItem;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 82
  TSQLRequirementType = class(TSQLRecord)
    private
      fParent: TSQLRequirementType;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Parent: TSQLRequirementType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 83
  TSQLRequirementTypeAttr = class(TSQLRecord)
    private
      fRequirementType: TSQLRequirementType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property RequirementType: TSQLRequirementType read fRequirementType write fRequirementType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 84
  TSQLWorkReqFulfType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 85
  TSQLWorkRequirementFulfillment = class(TSQLRecord)
    private
      fRequirement: TSQLRequirement;
      fWorkEffort: TSQLWorkEffort;
      fWorkReqFulfType: TSQLWorkReqFulfType;
    published
      property Requirement: TSQLRequirement read fRequirement write fRequirement;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property WorkReqFulfType: TSQLWorkReqFulfType read fWorkReqFulfType write fWorkReqFulfType;
  end;

  // 86
  TSQLReturnAdjustment = class(TSQLRecord)
    private
      fReturnAdjustmentType: TSQLReturnAdjustmentType;
      fReturn: TSQLReturnHeader;
      fReturnItemSeq: Integer;
      fShipGroupSeq: Integer;
      fComments: RawUTF8;
      fDescription: RawUTF8;
      fReturnType: TSQLReturnType;
      fOrderAdjustment: TSQLOrderAdjustment;
      fAmount: Currency;
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: TSQLProductPromoRule;
      fProductPromoActionSeq: Integer;
      fProductFeature: Integer;
      fCorrespondingProduct: Integer;
      fTaxAuthorityRateSeq: Integer;
      fSourceReference: Integer;
      fSourcePercentage: Double;
      fCustomerReference: Integer;
      fPrimaryGeo: TSQLGeo;
      fSecondaryGeo: TSQLGeo;
      fExemptAmount: Currency;
      fTaxAuthGeo: TSQLGeo;
      fTaxAuthParty: Integer;
      fOverrideGlAccount: TSQLGlAccount;
      fIncludeInTax: Boolean;
      fIncludeInShipping: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property ReturnAdjustmentType: TSQLReturnAdjustmentType read fReturnAdjustmentType write fReturnAdjustmentType;
      property Return: TSQLReturnHeader read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Comments: RawUTF8 read fComments write fComments;
      property Description: RawUTF8 read fDescription write fDescription;
      property ReturnType: TSQLReturnType read fReturnType write fReturnType;
      property OrderAdjustment: TSQLOrderAdjustment read fOrderAdjustment write fOrderAdjustment;
      property Amount: Currency read fAmount write fAmount;
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRule read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductFeature: Integer read fProductFeature write fProductFeature;
      property CorrespondingProduct: Integer read fCorrespondingProduct write fCorrespondingProduct;
      property TaxAuthorityRateSeq: Integer read fTaxAuthorityRateSeq write fTaxAuthorityRateSeq;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property SourcePercentage: Double read fSourcePercentage write fSourcePercentage;
      property CustomerReference: Integer read fCustomerReference write fCustomerReference;
      property PrimaryGeo: TSQLGeo read fPrimaryGeo write fPrimaryGeo;
      property SecondaryGeo: TSQLGeo read fSecondaryGeo write fSecondaryGeo;
      property ExemptAmount: Currency read fExemptAmount write fExemptAmount;
      property TaxAuthGeo: TSQLGeo read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: Integer read fTaxAuthParty write fTaxAuthParty;
      property OverrideGlAccount: TSQLGlAccount read fOverrideGlAccount write fOverrideGlAccount;
      property IncludeInTax: Boolean read fIncludeInTax write fIncludeInTax;
      property IncludeInShipping: Boolean read fIncludeInShipping write fIncludeInShipping;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 87
  TSQLReturnAdjustmentType = class(TSQLRecord)
    private
      fParent: TSQLReturnAdjustmentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Parent: TSQLReturnAdjustmentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;


  // 88
  TSQLReturnHeader = class(TSQLRecord)
    private
      fReturnHeaderType: TSQLReturnHeaderType;
      fStatus: TSQLStatusItem;
      fCreatedBy: TSQLUserLogin;
      fFromParty: TSQLParty;
      fToParty: TSQLParty;
      fPaymentMethod: TSQLPaymentMethod;
      fFinAccount: TSQLFinAccount;
      fBillingAccount: TSQLBillingAccount;
      fEntryDate: TDateTime;
      fOriginContactMech: TSQLContactMech;
      fDestinationFacility: TSQLFacility;
      fNeedsInventoryReceive: Boolean;
      fCurrencyUom: TSQLUom;
      fSupplierRma: Integer;
    published
      property ReturnHeaderType: TSQLReturnHeaderType read fReturnHeaderType write fReturnHeaderType;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property CreatedBy: TSQLUserLogin read fCreatedBy write fCreatedBy;
      property FromParty: TSQLParty read fFromParty write fFromParty;
      property ToParty: TSQLParty read fToParty write fToParty;
      property PaymentMethod: TSQLPaymentMethod read fPaymentMethod write fPaymentMethod;
      property FinAccount: TSQLFinAccount read fFinAccount write fFinAccount;
      property BillingAccount: TSQLBillingAccount read fBillingAccount write fBillingAccount;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property OriginContactMech: TSQLContactMech read fOriginContactMech write fOriginContactMech;
      property DestinationFacility: TSQLFacility read fDestinationFacility write fDestinationFacility;
      property NeedsInventoryReceive: Boolean read fNeedsInventoryReceive write fNeedsInventoryReceive;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property SupplierRma: Integer read fSupplierRma write fSupplierRma;
  end;

  // 89
  TSQLReturnHeaderType = class(TSQLRecord)
    private
      fParent: TSQLReturnHeaderType;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Parent: TSQLReturnHeaderType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 90
  TSQLReturnItem = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeader;
      fFeturnItemSeq: Integer;
      fReturnReason: TSQLReturnReason;
      fReturnType: TSQLReturnType;
      fReturnItemType: TSQLReturnItemType;
      fProduct: TSQLProduct;
      fDescription: RawUTF8;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fStatus: TSQLStatusItem;
      fExpectedItemStatus: TSQLStatusItem;
      fReturnQuantity: Double;
      fReceivedQuantity: Double;
      fReturnPrice: Currency;
      fReturnItemResponse: TSQLReturnItemResponse;
    published
      property Return: TSQLReturnHeader read fReturn write fReturn;
      property FeturnItemSeq: Integer read fFeturnItemSeq write fFeturnItemSeq;
      property ReturnReason: TSQLReturnReason read fReturnReason write fReturnReason;
      property ReturnType: TSQLReturnType read fReturnType write fReturnType;
      property ReturnItemType: TSQLReturnItemType read fReturnItemType write fReturnItemType;
      property Product: TSQLProduct read fProduct write fProduct;
      property Description: RawUTF8 read fDescription write fDescription;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property ExpectedItemStatus: TSQLStatusItem read fExpectedItemStatus write fExpectedItemStatus;
      property ReturnQuantity: Double read fReturnQuantity write fReturnQuantity;
      property ReceivedQuantity: Double read fReceivedQuantity write fReceivedQuantity;
      property ReturnPrice: Currency read fReturnPrice write fReturnPrice;
      property ReturnItemResponse: TSQLReturnItemResponse read fReturnItemResponse write fReturnItemResponse;
  end;

  // 91
  TSQLReturnItemResponse = class(TSQLRecord)
    private
      fOrderPaymentPreference: TSQLOrderPaymentPreference;
      fReplacementOrder: TSQLOrderHeader;
      fPayment: TSQLPayment;
      fBillingAccount: TSQLBillingAccount;
      fFinAccountTrans: TSQLFinAccountTrans;
      fResponseAmount: Currency;
      fResponseDate: TDateTime;
    published
      property OrderPaymentPreference: TSQLOrderPaymentPreference read fOrderPaymentPreference write fOrderPaymentPreference;
      property ReplacementOrder: TSQLOrderHeader read fReplacementOrder write fReplacementOrder;
      property Payment: TSQLPayment read fPayment write fPayment;
      property BillingAccount: TSQLBillingAccount read fBillingAccount write fBillingAccount;
      property FinAccountTrans: TSQLFinAccountTrans read fFinAccountTrans write fFinAccountTrans;
      property ResponseAmount: Currency read fResponseAmount write fResponseAmount;
      property ResponseDate: TDateTime read fResponseDate write fResponseDate;
  end;

  // 92
  TSQLReturnItemType = class(TSQLRecord)
    private
      fParent: TSQLReturnItemType;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Parent: TSQLReturnItemType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 93
  TSQLReturnItemTypeMap = class(TSQLRecord)
    private
      fReturnItemMapKey: Integer;
      fReturnHeaderType: TSQLReturnHeaderType;
      fReturnItemType: TSQLReturnAdjustmentType;
    published
      property ReturnItemMapKey: Integer read fReturnItemMapKey write fReturnItemMapKey;
      property ReturnHeaderType: TSQLReturnHeaderType read fReturnHeaderType write fReturnHeaderType;
      property ReturnItemType: TSQLReturnAdjustmentType read fReturnItemType write fReturnItemType;
  end;

  // 94
  TSQLReturnReason = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fSequence: Integer;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property Sequence: Integer read fSequence write fSequence;
  end;

  // 95
  TSQLReturnStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fReturn: TSQLReturnHeader;
      fReturnItemSeq: Integer;
      fChangeByUserLogin: TSQLUserLogin;
      fStatusDatetime: TDateTime;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Return: TSQLReturnHeader read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
  end;

  // 96
  TSQLReturnType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
      fSequence: Integer;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Sequence: Integer read fSequence write fSequence;
  end;

  // 97
  TSQLReturnItemBilling = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeader;
      fReturnItemSeq: Integer;
      fInvoice: TSQLInvoice;
      fInvoiceItemSeq: Integer;
      fShipmentReceipt: TSQLShipmentReceipt;
      fQuantity: Double;
      fAmount: Currency;
    published
      property Return: TSQLReturnHeader read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property ShipmentReceipt: TSQLShipmentReceipt read fShipmentReceipt write fShipmentReceipt;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 98
  TSQLReturnItemShipment = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeader;
      fReturnItemSeq: Integer;
      fShipment: TSQLShipment;
      fShipmentItemSeq: Integer;
      fQuantity: Double;
    published
      property Return: TSQLReturnHeader read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property Shipment: TSQLShipment read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 99
  TSQLReturnContactMech = class(TSQLRecord)
    private
      fReturn: TSQLReturnHeader;
      fContactMechPurposeType: TSQLContactMechPurposeType;
      fContactMech: TSQLContactMech;
    published
      property Return: TSQLReturnHeader read fReturn write fReturn;
      property ContactMechPurposeType: TSQLContactMechPurposeType read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
  end;

  // 100
  TSQLCartAbandonedLine = class(TSQLRecord)
    private
      fVisit: Integer;
      fCartAbandonedLineSeq: Integer;
      fProduct: TSQLProduct;
      fProdCatalog: TSQLProdCatalog;
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
      property Product: TSQLProduct read fProduct write fProduct;
      property ProdCatalog: TSQLProdCatalog read fProdCatalog write fProdCatalog;
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
      fShoppingListType: TSQLShoppingListType;
      fParentShoppingList: TSQLShoppingList;
      fProductStore: TSQLProductStore;
      fVisitorId: Integer;
      fParty: TSQLParty;
      fListName: RawUTF8;
      fDescription: RawUTF8;
      fIsPublic: Boolean;
      fIsActive: Boolean;
      fCurrencyUom: TSQLUom;
      fShipmentMethodType: Integer;
      fCarrierParty: Integer;
      fCarrierRoleType: Integer;
      fContactMech: TSQLContactMech;
      fPaymentMethod: TSQLPaymentMethod;
      fRecurrenceInfo: TSQLRecurrenceInfo;
      fLastOrderedDate: TDateTime;
      fLastAdminModified: TDateTime;
      fProductPromoCode: TSQLProductPromoCode;
    published
      property ShoppingListType: TSQLShoppingListType read fShoppingListType write fShoppingListType;
      property ParentShoppingList: TSQLShoppingList read fParentShoppingList write fParentShoppingList;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property VisitorId: Integer read fVisitorId write fVisitorId;
      property Party: TSQLParty read fParty write fParty;
      property ListName: RawUTF8 read fListName write fListName;
      property Description: RawUTF8 read fDescription write fDescription;
      property IsPublic: Boolean read fIsPublic write fIsPublic;
      property IsActive: Boolean read fIsActive write fIsActive;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property ShipmentMethodType: Integer read fShipmentMethodType write fShipmentMethodType;
      property CarrierParty: Integer read fCarrierParty write fCarrierParty;
      property CarrierRoleType: Integer read fCarrierRoleType write fCarrierRoleType;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property PaymentMethod: TSQLPaymentMethod read fPaymentMethod write fPaymentMethod;
      property RecurrenceInfo: TSQLRecurrenceInfo read fRecurrenceInfo write fRecurrenceInfo;
      property LastOrderedDate: TDateTime read fLastOrderedDate write fLastOrderedDate;
      property LastAdminModified: TDateTime read fLastAdminModified write fLastAdminModified;
      property ProductPromoCode: TSQLProductPromoCode read fProductPromoCode write fProductPromoCode;
  end;

  // 102
  TSQLShoppingListItem = class(TSQLRecord)
    private
      fShoppingList: TSQLShoppingList;
      fShoppingListItemSeq: Integer;
      fProduct: TSQLProduct;
      fQuantity: Double;
      fModifiedPrice: Currency;
      fReservStart: TDateTime;
      fReservLength: Double;
      fReservPersons: Double;
      fQuantityPurchased: Double;
      fConfigId: Integer;
    published
      property ShoppingList: TSQLShoppingList read fShoppingList write fShoppingList;
      property ShoppingListItemSeq: Integer read fShoppingListItemSeq write fShoppingListItemSeq;
      property Product: TSQLProduct read fProduct write fProduct;
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
      fShoppingList: TSQLShoppingList;
      fShoppingListItemSeq: Integer;
      fSurveyResponse: TSQLSurveyResponse;
    published
      property ShoppingList: TSQLShoppingList read fShoppingList write fShoppingList;
      property ShoppingListItemSeq: Integer read fShoppingListItemSeq write fShoppingListItemSeq;
      property SurveyResponse: TSQLSurveyResponse read fSurveyResponse write fSurveyResponse;
  end;

  // 104
  TSQLShoppingListType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 105
  TSQLShoppingListWorkEffort = class(TSQLRecord)
    private
      fShoppingList: TSQLShoppingList;
      fWorkEffort: TSQLWorkEffort;
    published
      property ShoppingList: TSQLShoppingList read fShoppingList write fShoppingList;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
  end;

implementation

end.

