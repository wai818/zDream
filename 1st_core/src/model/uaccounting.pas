unit uAccounting;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLBudget = class(TSQLRecord)
    private
      fName: RawUTF8;
      fBudgetType: TSQLBudgetTypeID;
      fCustomTimePeriod: TSQLCustomTimePeriodID;
      fComments: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property BudgetType: TSQLBudgetTypeID read fBudgetType write fBudgetType;
      property CustomTimePeriod: TSQLCustomTimePeriodID read fCustomTimePeriod write fCustomTimePeriod;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 2
  TSQLBudgetAttribute = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 3
  TSQLBudgetItem = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fBudgetItemSeq: Integer;
      fBudgetItemType: TSQLBudgetItemTypeID;
      fAmount: Currency;
      fPurpose: RawUTF8;
      fJustification: RawUTF8;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property BudgetItemType: TSQLBudgetItemTypeID read fBudgetItemType write fBudgetItemType;
      property Amount: Currency read fAmount write fAmount;
      property Purpose: RawUTF8 read fPurpose write fPurpose;
      property Justification: RawUTF8 read fJustification write fJustification;
  end;

  // 4
  TSQLBudgetItemAttribute = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fBudgetItemSeq: Integer;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 5
  TSQLBudgetItemType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLBudgetItemTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLBudgetItemTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 6
  TSQLBudgetItemTypeAttr = class(TSQLRecord)
    private
      fBudgetItemType: TSQLBudgetItemTypeID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property BudgetItemType: TSQLBudgetItemTypeID read fBudgetItemType write fBudgetItemType;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 7
  TSQLBudgetReview = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fParty: TSQLPartyID;
      fBudgetReviewResultType: TSQLBudgetReviewResultTypeID;
      fReviewDate: TDateTime;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property Party: TSQLPartyID read fParty write fParty;
      property BudgetReviewResultType: TSQLBudgetReviewResultTypeID read fBudgetReviewResultType write fBudgetReviewResultType;
      property ReviewDate: TDateTime read fReviewDate write fReviewDate;
  end;

  // 8
  TSQLBudgetReviewResultType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
      fComments: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 9
  TSQLBudgetRevision = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fRevisionSeq: Integer;
      fDateRevised: TDateTime;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property RevisionSeq: Integer read fRevisionSeq write fRevisionSeq;
      property DateRevised: TDateTime read fDateRevised write fDateRevised;
  end;

  // 10
  TSQLBudgetRevisionImpact = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fBudgetItemSeq: Integer;
      fRevisionSeq: Integer;
      fRevisedAmount: Currency;
      fAddDeleteFlag: TDateTime;
      fRevisionReason: RawUTF8;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property RevisionSeq: Integer read fRevisionSeq write fRevisionSeq;
      property RevisedAmount: Currency read fRevisedAmount write fRevisedAmount;
      property AddDeleteFlag: TDateTime read fAddDeleteFlag write fAddDeleteFlag;
      property RevisionReason: RawUTF8 read fRevisionReason write fRevisionReason;
  end;

  // 11
  TSQLBudgetRole = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fParty: TSQLPartyID;
      fRoleTypeId: Integer;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleTypeId: Integer read fRoleTypeId write fRoleTypeId;
  end;

  // 12
  TSQLBudgetScenario = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 13
  TSQLBudgetScenarioApplication = class(TSQLRecord)
    private
      fBudgetScenario: TSQLBudgetScenarioID;
      fBudget: TSQLBudgetID;
      fBudgetItemSeq: Integer;
      fAmountChange: Currency;
      fPercentageChange: Double;
    published
      property BudgetScenario: TSQLBudgetScenarioID read fBudgetScenario write fBudgetScenario;
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property AmountChange: Currency read fAmountChange write fAmountChange;
      property PercentageChange: Double read fPercentageChange write fPercentageChange;
  end;

  // 14
  TSQLBudgetScenarioRule = class(TSQLRecord)
    private
      fBudgetScenario: TSQLBudgetScenarioID;
      fBudgetItemType: TSQLBudgetItemTypeID;
      fAmountChange: Currency;
      fPercentageChange: Double;
    published
      property BudgetScenario: TSQLBudgetScenarioID read fBudgetScenario write fBudgetScenario;
      property BudgetItemType: TSQLBudgetItemTypeID read fBudgetItemType write fBudgetItemType;
      property AmountChange: Currency read fAmountChange write fAmountChange;
      property PercentageChange: Double read fPercentageChange write fPercentageChange;
  end;

  // 15
  TSQLBudgetStatus = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fStatus: TSQLStatusItemID;
      fStatusDate: TDateTime;
      fComments: RawUTF8;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property Comments: RawUTF8 read fComments write fComments;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 16
  TSQLBudgetType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLBudgetTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLBudgetTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 17
  TSQLBudgetTypeAttr = class(TSQLRecord)
    private
      fBudgetType: TSQLBudgetTypeID;
      fAttrName: TSQLBudgetAttributeID;
      fDescription: RawUTF8;
    published
      property BudgetType: TSQLBudgetTypeID read fBudgetType write fBudgetType;
      property AttrName: TSQLBudgetAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 18
  TSQLFinAccount = class(TSQLRecord)
    private
      fFinAccountType: TSQLFinAccountTypeID;
      fStatusId: Integer;
      fFinAccountName: RawUTF8;
      fFinAccountCode: RawUTF8;
      fFinAccountPin: RawUTF8;
      fCurrencyUom: TSQLUomID;
      fOrganizationParty: TSQLPartyID;
      fOwnerParty: TSQLPartyID;
      fPostToGlAccount: TSQLGlAccountID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fIsRefundable: Boolean;
      fReplenishPayment: TSQLPaymentMethodID;
      fReplenishLevel: Currency;
      fActualBalance: Currency;
      fAvailableBalance: Currency;
    published
      property FinAccountType: TSQLFinAccountTypeID read fFinAccountType write fFinAccountType;
      property StatusId: Integer read fStatusId write fStatusId;
      property FinAccountName: RawUTF8 read fFinAccountName write fFinAccountName;
      property FinAccountCode: RawUTF8 read fFinAccountCode write fFinAccountCode;
      property FinAccountPin: RawUTF8 read fFinAccountPin write fFinAccountPin;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property OwnerParty: TSQLPartyID read fOwnerParty write fOwnerParty;
      property PostToGlAccount: TSQLGlAccountID read fPostToGlAccount write fPostToGlAccount;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property IsRefundable: Boolean read fIsRefundable write fIsRefundable;
      property ReplenishPayment: TSQLPaymentMethodID read fReplenishPayment write fReplenishPayment;
      property ReplenishLevel: Currency read fReplenishLevel write fReplenishLevel;
      property ActualBalance: Currency read fActualBalance write fActualBalance;
      property AvailableBalance: Currency read fAvailableBalance write fAvailableBalance;
  end;

  // 19
  TSQLFinAccountAttribute = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccountID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 20
  TSQLFinAccountAuth = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccountID;
      fAmount: Currency;
      fCurrencyUom: TSQLUomID;
      fAuthorizationDate: TDateTime;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property Amount: Currency read fAmount write fAmount;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property AuthorizationDate: TDateTime read fAuthorizationDate write fAuthorizationDate;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 21
  TSQLFinAccountRole = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccountID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 22
  TSQLFinAccountStatus = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccountID;
      fStatus: TSQLStatusItemID;
      fStatusDate: TDateTime;
      fStatusEndDate: TDateTime;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property StatusEndDate: TDateTime read fStatusEndDate write fStatusEndDate;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 23
  TSQLFinAccountTrans = class(TSQLRecord)
    private
      fFinAccountTransType: TSQLFinAccountTransTypeID;
      fFinAccount: TSQLFinAccountID;
      fParty: TSQLPartyID;
      fGlReconciliation: TSQLGlReconciliationID;
      fTransactionDate: TDateTime;
      fEntryDate: TDateTime;
      fAmount: Currency;
      fPayment: TSQLPaymentID;
      fOrderId: Integer;
      fOrderItemSeqId: Integer;
      fPerformedByParty: TSQLPartyID;
      fReasonEnum: TSQLEnumerationID;
      fComments: RawUTF8;
      fStatus: TSQLStatusItemID;
    published
      property FinAccountTransType: TSQLFinAccountTransTypeID read fFinAccountTransType write fFinAccountTransType;
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property Party: TSQLPartyID read fParty write fParty;
      property GlReconciliation: TSQLGlReconciliationID read fGlReconciliation write fGlReconciliation;
      property TransactionDate: TDateTime read fTransactionDate write fTransactionDate;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property Amount: Currency read fAmount write fAmount;
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property OrderId: Integer read fOrderId write fOrderId;
      property OrderItemSeqId: Integer read fOrderItemSeqId write fOrderItemSeqId;
      property PerformedByParty: TSQLPartyID read fPerformedByParty write fPerformedByParty;
      property ReasonEnum: TSQLEnumerationID read fReasonEnum write fReasonEnum;
      property Comments: RawUTF8 read fComments write fComments;
      property Status: TSQLStatusItemID read fStatus write fStatus;
  end;

  // 24
  TSQLFinAccountTransAttribute = class(TSQLRecord)
    private
      fFinAccountTrans: TSQLFinAccountTransID;
      fAttrName: TSQLFinAccountTransTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property FinAccountTrans: TSQLFinAccountTransID read fFinAccountTrans write fFinAccountTrans;
      property AttrName: TSQLFinAccountTransTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 25
  TSQLFinAccountTransType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLFinAccountTransTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLFinAccountTransTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 26
  TSQLFinAccountTransTypeAttr = class(TSQLRecord)
    private
      fFinAccountTransType: TSQLFinAccountTransTypeID;
      fAttrName: TSQLFinAccountTransAttributeID;
      fDescription: RawUTF8;
    published
      property FinAccountTransType: TSQLFinAccountTransTypeID read fFinAccountTransType write fFinAccountTransType;
      property AttrName: TSQLFinAccountTransAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 27
  TSQLFinAccountType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fReplenishEnumEncode: RawUTF8;
      fParent: TSQLFinAccountTypeID;
      fReplenishEnum: TSQLEnumerationID;
      fIsRefundable: Boolean;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property ReplenishEnumEncode: RawUTF8 read fReplenishEnumEncode write fReplenishEnumEncode;
      property Parent: TSQLFinAccountTypeID read fParent write fParent;
      property ReplenishEnum: TSQLEnumerationID read fReplenishEnum write fReplenishEnum;
      property IsRefundable: Boolean read fIsRefundable write fIsRefundable;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 28
  TSQLFinAccountTypeAttr = class(TSQLRecord)
    private
      fFinAccountType: TSQLFinAccountTypeID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property FinAccountType: TSQLFinAccountTypeID read fFinAccountType write fFinAccountType;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 29
  TSQLFinAccountTypeGlAccount = class(TSQLRecord)
    private
      fFinAccountType: TSQLFinAccountTypeID;
      fOrganizationParty: TSQLPartyID;
      fGlAccount: TSQLGlAccountID;
    published
      property FinAccountType: TSQLFinAccountTypeID read fFinAccountType write fFinAccountType;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 30
  TSQLFixedAsset = class(TSQLRecord)
    private
      fFixedAssetType: TSQLFixedAssetTypeID;
      fParentFixedAsset: TSQLFixedAssetID;
      fInstanceOfProduct: TSQLProductID;
      fClassEnum: TSQLEnumerationID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFixedAssetName: RawUTF8;
      fAcquireOrder: TSQLOrderHeaderID;
      fAcquireOrderItemSeq: Integer;
      fDateAcquired: TDateTime;
      fDateLastServiced: TDateTime;
      fDateNextService: TDateTime;
      fExpectedEndOfLife: TDateTime;
      fActualEndOfLife: TDateTime;
      fProductionCapacity: Double;
      fUom: TSQLUomID;
      fCalendar: TSQLTechDataCalendarID;
      fSerialNumber: RawUTF8;
      fLocatedAtFacility: TSQLFacilityID;
      fLocatedAtLocationSeq: Integer;
      fSalvageValue: Currency;
      fDepreciation: Currency;
      fPurchaseCost: Currency;
      fPurchaseCostUom: TSQLUomID;
    published
      property FixedAssetType: TSQLFixedAssetTypeID read fFixedAssetType write fFixedAssetType;
      property ParentFixedAsset: TSQLFixedAssetID read fParentFixedAsset write fParentFixedAsset;
      property InstanceOfProduct: TSQLProductID read fInstanceOfProduct write fInstanceOfProduct;
      property ClassEnum: TSQLEnumerationID read fClassEnum write fClassEnum;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FixedAssetName: RawUTF8 read fFixedAssetName write fFixedAssetName;
      property AcquireOrder: TSQLOrderHeaderID read fAcquireOrder write fAcquireOrder;
      property AcquireOrderItemSeq: Integer read fAcquireOrderItemSeq write fAcquireOrderItemSeq;
      property DateAcquired: TDateTime read fDateAcquired write fDateAcquired;
      property DateLastServiced: TDateTime read fDateLastServiced write fDateLastServiced;
      property DateNextService: TDateTime read fDateNextService write fDateNextService;
      property ExpectedEndOfLife: TDateTime read fExpectedEndOfLife write fExpectedEndOfLife;
      property ActualEndOfLife: TDateTime read fActualEndOfLife write fActualEndOfLife;
      property ProductionCapacity: Double read fProductionCapacity write fProductionCapacity;
      property Uom: TSQLUomID read fUom write fUom;
      property Calendar: TSQLTechDataCalendarID read fCalendar write fCalendar;
      property SerialNumber: RawUTF8 read fSerialNumber write fSerialNumber;
      property LocatedAtFacility: TSQLFacilityID read fLocatedAtFacility write fLocatedAtFacility;
      property LocatedAtLocationSeq: Integer read fLocatedAtLocationSeq write fLocatedAtLocationSeq;
      property SalvageValue: Currency read fSalvageValue write fSalvageValue;
      property Depreciation: Currency read fDepreciation write fDepreciation;
      property PurchaseCost: Currency read fPurchaseCost write fPurchaseCost;
      property PurchaseCostUom: TSQLUomID read fPurchaseCostUom write fPurchaseCostUom;
  end;

  // 31
  TSQLFixedAssetAttribute = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fAttrName: TSQLFixedAssetTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property AttrName: TSQLFixedAssetTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 32
  TSQLFixedAssetDepMethod = class(TSQLRecord)
    private
      fDepreciationCustomMethod: TSQLCustomMethodID;
      fFixedAsset: TSQLFixedAssetID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property DepreciationCustomMethod: TSQLCustomMethodID read fDepreciationCustomMethod write fDepreciationCustomMethod;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 33
  TSQLFixedAssetGeoPoint = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fGeoPoint: TSQLGeoPointID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property GeoPoint: TSQLGeoPointID read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 34
  TSQLFixedAssetIdent = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fFixedAssetIdentType: TSQLFixedAssetIdentTypeID;
      fIdValue: RawUTF8;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property FixedAssetIdentType: TSQLFixedAssetIdentTypeID read fFixedAssetIdentType write fFixedAssetIdentType;
      property IdValue: RawUTF8 read fIdValue write fIdValue;
  end;

  // 35
  TSQLFixedAssetIdentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 36
  TSQLFixedAssetMaint = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fMaintHistSeq: Integer;
      fStatus: TSQLStatusItemID;
      fProductMaintType: TSQLProductMaintTypeID;
      fProductMaintSeq: Integer;
      fScheduleWorkEffort: TSQLWorkEffortID;
      fIntervalQuantity: Double;
      fIntervalUom: TSQLUomID;
      fProductMeterType: TSQLProductMeterTypeID;
      fPurchaseOrder: TSQLOrderHeaderID;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property ProductMaintType: TSQLProductMaintTypeID read fProductMaintType write fProductMaintType;
      property ProductMaintSeq: Integer read fProductMaintSeq write fProductMaintSeq;
      property ScheduleWorkEffort: TSQLWorkEffortID read fScheduleWorkEffort write fScheduleWorkEffort;
      property IntervalQuantity: Double read fIntervalQuantity write fIntervalQuantity;
      property IntervalUom: TSQLUomID read fIntervalUom write fIntervalUom;
      property ProductMeterType: TSQLProductMeterTypeID read fProductMeterType write fProductMeterType;
      property PurchaseOrder: TSQLOrderHeaderID read fPurchaseOrder write fPurchaseOrder;
  end;

  // 37
  TSQLFixedAssetMeter = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fProductMeterType: TSQLProductMeterTypeID;
      fReadingDate: TDateTime;
      fMeterValue: Double;
      fReadingReasonEnum: Integer;
      fMaintHistSeq: Integer;
      fWorkEffort: Integer;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property ProductMeterType: TSQLProductMeterTypeID read fProductMeterType write fProductMeterType;
      property ReadingDate: TDateTime read fReadingDate write fReadingDate;
      property MeterValue: Double read fMeterValue write fMeterValue;
      property ReadingReasonEnum: Integer read fReadingReasonEnum write fReadingReasonEnum;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property WorkEffort: Integer read fWorkEffort write fWorkEffort;
  end;

  // 38
  TSQLFixedAssetProduct = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fProduct: TSQLProductID;
      fFixedAssetProductType: TSQLFixedAssetProductTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fQuantity: Double;
      fQuantityUom: TSQLUomID;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property Product: TSQLProductID read fProduct write fProduct;
      property FixedAssetProductType: TSQLFixedAssetProductTypeID read fFixedAssetProductType write fFixedAssetProductType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Quantity: Double read fQuantity write fQuantity;
      property QuantityUom: TSQLUomID read fQuantityUom write fQuantityUom;
  end;

  // 39
  TSQLFixedAssetProductType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 40
  TSQLFixedAssetTypeGlAccount = class(TSQLRecord)
    private
      fFixedAssetType: TSQLFixedAssetTypeID;
      fFixedAsset: TSQLFixedAssetID;
      fOrganizationParty: TSQLPartyID;
      fAssetGlAccount: TSQLGlAccountID;
      fAccDepGlAccount: TSQLGlAccountID;
      fDepGlAccount: TSQLGlAccountID;
      fProfitGlAccount: TSQLGlAccountID;
      fLossGlAccount: TSQLGlAccountID;
    published
      property FixedAssetType: TSQLFixedAssetTypeID read fFixedAssetType write fFixedAssetType;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property AssetGlAccount: TSQLGlAccountID read fAssetGlAccount write fAssetGlAccount;
      property AccDepGlAccount: TSQLGlAccountID read fAccDepGlAccount write fAccDepGlAccount;
      property DepGlAccount: TSQLGlAccountID read fDepGlAccount write fDepGlAccount;
      property ProfitGlAccount: TSQLGlAccountID read fProfitGlAccount write fProfitGlAccount;
      property LossGlAccount: TSQLGlAccountID read fLossGlAccount write fLossGlAccount;
  end;

  // 41
  TSQLFixedAssetRegistration = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fRegistrationDate: TDateTime;
      fGovAgencyParty: TSQLPartyID;
      fRegistrationNumber: RawUTF8;
      fLicenseNumber: RawUTF8;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property RegistrationDate: TDateTime read fRegistrationDate write fRegistrationDate;
      property GovAgencyParty: TSQLPartyID read fGovAgencyParty write fGovAgencyParty;
      property RegistrationNumber: RawUTF8 read fRegistrationNumber write fRegistrationNumber;
      property LicenseNumber: RawUTF8 read fLicenseNumber write fLicenseNumber;
  end;

  // 42
  TSQLFixedAssetStdCost = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fFixedAssetStdCostType: TSQLFixedAssetStdCostTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAmountUom: TSQLUomID;
      fAmount: Currency;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property FixedAssetStdCostType: TSQLFixedAssetStdCostTypeID read fFixedAssetStdCostType write fFixedAssetStdCostType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AmountUom: TSQLUomID read fAmountUom write fAmountUom;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 43
  TSQLFixedAssetStdCostType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLFixedAssetStdCostTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLFixedAssetStdCostTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 44
  TSQLFixedAssetType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLFixedAssetTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLFixedAssetTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 45
  TSQLFixedAssetTypeAttr = class(TSQLRecord)
    private
      fFixedAssetType: TSQLFixedAssetTypeID;
      fAttrName: TSQLCostComponentAttributeID;
      fDescription: RawUTF8;
    published
      property FixedAssetType: TSQLFixedAssetTypeID read fFixedAssetType write fFixedAssetType;
      property AttrName: TSQLCostComponentAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 46
  TSQLPartyFixedAssetAssignment = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFixedAsset: TSQLFixedAssetID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAllocatedDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fComments: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AllocatedDate: TDateTime read fAllocatedDate write fAllocatedDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 47
  TSQLFixedAssetMaintOrder = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAssetID;
      fMaintHistSeq: Integer;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
    published
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
  end;

  // 48
  TSQLAccommodationClass = class(TSQLRecord)
    private
      fParent: TSQLAccommodationClassID;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLAccommodationClassID read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 49
  TSQLAccommodationSpot = class(TSQLRecord)
    private
      fAccommodationClass: TSQLAccommodationClassID;
      fFixedAsset: TSQLFixedAssetID;
      fNumberOfSpaces: Integer;
      FDescription: RawUTF8;
    published
      property AccommodationClass: TSQLAccommodationClassID read fAccommodationClass write fAccommodationClass;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property NumberOfSpaces: Integer read fNumberOfSpaces write fNumberOfSpaces;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 50
  TSQLAccommodationMap = class(TSQLRecord)
    private
      fAccommodationClass: TSQLAccommodationClassID;
      fFixedAsset: TSQLFixedAssetID;
      fAccommodationMapType: TSQLAccommodationMapTypeID;
      fNumberOfSpaces: Integer;
    published
      property AccommodationClass: TSQLAccommodationClassID read fAccommodationClass write fAccommodationClass;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property AccommodationMapType: TSQLAccommodationMapTypeID read fAccommodationMapType write fAccommodationMapType;
      property NumberOfSpaces: Integer read fNumberOfSpaces write fNumberOfSpaces;
  end;

  // 51
  TSQLAccommodationMapType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 52
  TSQLInvoice = class(TSQLRecord)
    private
      fInvoiceType: TSQLInvoiceTypeID;
      fPartyIdFrom: TSQLPartyID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fStatus: TSQLStatusItemID;
      fBillingAccount: TSQLBillingAccountID;
      fContactMech: TSQLContactMechID;
      fInvoiceDate: TDateTime;
      fDueDate: TDateTime;
      fPaidDate: TDateTime;
      fInvoiceMessage: RawUTF8;
      fReferenceNumber: RawUTF8;
      fDescription: RawUTF8;
      fCurrencyUom: TSQLUomID;
      fRecurrenceInfo: TSQLRecurrenceInfoID;
    published
      property InvoiceType: TSQLInvoiceTypeID read fInvoiceType write fInvoiceType;
      property PartyIdFrom: TSQLPartyID read fPartyIdFrom write fPartyIdFrom;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property BillingAccount: TSQLBillingAccountID read fBillingAccount write fBillingAccount;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property InvoiceDate: TDateTime read fInvoiceDate write fInvoiceDate;
      property DueDate: TDateTime read fDueDate write fDueDate;
      property PaidDate: TDateTime read fPaidDate write fPaidDate;
      property InvoiceMessage: RawUTF8 read fInvoiceMessage write fInvoiceMessage;
      property ReferenceNumber: RawUTF8 read fReferenceNumber write fReferenceNumber;
      property Description: RawUTF8 read fDescription write fDescription;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property RecurrenceInfo: TSQLRecurrenceInfoID read fRecurrenceInfo write fRecurrenceInfo;
  end;

  // 53
  TSQLInvoiceAttribute = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 54
  TSQLInvoiceContent = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceID;
      fInvoiceContentType: TSQLInvoiceContentTypeID;
      fContent: TSQLContentID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceContentType: TSQLInvoiceContentTypeID read fInvoiceContentType write fInvoiceContentType;
      property Content: TSQLContentID read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 55
  TSQLInvoiceContentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLInvoiceContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLInvoiceContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 56
  TSQLInvoiceContactMech = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceID;
      fContactMechPurposeType: TSQLContactMechPurposeTypeID;
      fContactMech: TSQLContactMechID;
    published
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property ContactMechPurposeType: TSQLContactMechPurposeTypeID read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
  end;

  // 57
  TSQLInvoiceItem = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fInvoiceItemType: TSQLInvoiceItemTypeID;
      fOverrideGlAccount: TSQLGlAccountID;
      fOverrideOrgParty: TSQLPartyID;
      fInventoryItem: TSQLInventoryItemID;
      fProduct: TSQLProductID;
      fProductFeature: TSQLProductFeatureID;
      fParentInvoice: TSQLInvoiceItemID;
      fParentInvoiceItemSeq: Integer;
      fUom: TSQLUomID;
      fTaxableFlag: Boolean;
      fQuantity: Double;
      fAmount: Currency;
      fDescription: RawUTF8;
      fTaxAuthParty: TSQLPartyID;
      fTaxAuthGeo: TSQLGeoID;
      fTaxAuthorityRateSeq: TSQLTaxAuthorityRateProductID;
      fSalesOpportunity: TSQLSalesOpportunityID;
    published
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property InvoiceItemType: TSQLInvoiceItemTypeID read fInvoiceItemType write fInvoiceItemType;
      property OverrideGlAccount: TSQLGlAccountID read fOverrideGlAccount write fOverrideGlAccount;
      property OverrideOrgParty: TSQLPartyID read fOverrideOrgParty write fOverrideOrgParty;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property ParentInvoice: TSQLInvoiceItemID read fParentInvoice write fParentInvoice;
      property ParentInvoiceItemSeq: Integer read fParentInvoiceItemSeq write fParentInvoiceItemSeq;
      property Uom: TSQLUomID read fUom write fUom;
      property TaxableFlag: Boolean read fTaxableFlag write fTaxableFlag;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
      property Description: RawUTF8 read fDescription write fDescription;
      property TaxAuthParty: TSQLPartyID read fTaxAuthParty write fTaxAuthParty;
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthorityRateSeq: TSQLTaxAuthorityRateProductID read fTaxAuthorityRateSeq write fTaxAuthorityRateSeq;
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
  end;

  // 58
  TSQLInvoiceItemAssoc = class(TSQLRecord)
    private
      fInvoiceFrom: TSQLInvoiceItemID;
      fInvoiceItemSeqFrom: Integer;
      fInvoiceTo: TSQLInvoiceItemID;
      fInvoiceItemSeqTo: Integer;
      fInvoiceItemAssocType: TSQLInvoiceItemAssocTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPartyFrom: TSQLPartyID;
      fPartyTo: TSQLPartyID;
      fQuantity: Double;
      fAmount: Currency;
    published
      property InvoiceFrom: TSQLInvoiceItemID read fInvoiceFrom write fInvoiceFrom;
      property InvoiceItemSeqFrom: Integer read fInvoiceItemSeqFrom write fInvoiceItemSeqFrom;
      property InvoiceTo: TSQLInvoiceItemID read fInvoiceTo write fInvoiceTo;
      property InvoiceItemSeqTo: Integer read fInvoiceItemSeqTo write fInvoiceItemSeqTo;
      property InvoiceItemAssocType: TSQLInvoiceItemAssocTypeID read fInvoiceItemAssocType write fInvoiceItemAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 59
  TSQLInvoiceItemAssocType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLInvoiceItemAssocTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLInvoiceItemAssocTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 60
  TSQLInvoiceItemAttribute = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceItemID;
      fInvoiceItemSeq: Integer;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Invoice: TSQLInvoiceItemID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 61
  TSQLInvoiceItemType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fDefaultGlAccountEncode: RawUTF8;
      fInvoiceItemType: TSQLInvoiceItemTypeID;
      fParent: TSQLInvoiceItemTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fDefaultGlAccount: TSQLGlAccountID;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property DefaultGlAccountEncode: RawUTF8 read fDefaultGlAccountEncode write fDefaultGlAccountEncode;
      property InvoiceItemType: TSQLInvoiceItemTypeID read fInvoiceItemType write fInvoiceItemType;
      property Parent: TSQLInvoiceItemTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property DefaultGlAccount: TSQLGlAccountID read fDefaultGlAccount write fDefaultGlAccount;
  end;

  // 62
  TSQLInvoiceItemTypeAttr = class(TSQLRecord)
    private
      fInvoiceItemType: TSQLInvoiceItemTypeID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fDescription: RawUTF8;
    published
      property InvoiceItemType: TSQLInvoiceItemTypeID read fInvoiceItemType write fInvoiceItemType;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 63
  TSQLInvoiceItemTypeGlAccount = class(TSQLRecord)
    private
      fInvoiceItemType: TSQLInvoiceItemTypeID;
      fOrganizationParty: TSQLPartyID;
      fGlAccount: TSQLGlAccountID;
    published
      property InvoiceItemType: TSQLInvoiceItemTypeID read fInvoiceItemType write fInvoiceItemType;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 64
  TSQLInvoiceItemTypeMap = class(TSQLRecord)
    private
      fInvoiceTypeEncode: RawUTF8;
      fInvoiceItemMapKey: RawUTF8;
      fInvoiceItemTypeEncode: RawUTF8;
      fInvoiceType: TSQLInvoiceTypeID;
      fInvoiceItemType: TSQLInvoiceItemTypeID;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property InvoiceTypeEncode: RawUTF8 read fInvoiceTypeEncode write fInvoiceTypeEncode;
      property InvoiceItemMapKey: RawUTF8 read fInvoiceItemMapKey write fInvoiceItemMapKey;
      property InvoiceItemTypeEncode: RawUTF8 read fInvoiceItemTypeEncode write fInvoiceItemTypeEncode;
      property InvoiceType: TSQLInvoiceTypeID read fInvoiceType write fInvoiceType;
      property InvoiceItemType: TSQLInvoiceItemTypeID read fInvoiceItemType write fInvoiceItemType;
  end;

  // 65
  TSQLInvoiceRole = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fDatetimePerformed: TDateTime;
      fPercentage: Double;
    published
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property DatetimePerformed: TDateTime read fDatetimePerformed write fDatetimePerformed;
      property Percentage: Double read fPercentage write fPercentage;
  end;

  // 66
  TSQLInvoiceStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItemID;
      fInvoice: TSQLInvoiceID;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 67
  TSQLInvoiceTerm = class(TSQLRecord)
    private
      fTermType: TSQLTermTypeID;
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fTermValue: Currency;
      fTermDays: Integer;
      fTextValue: RawUTF8;
      fDescription: RawUTF8;
      fUom: TSQLUomID;
    published
      property TermType: TSQLTermTypeID read fTermType write fTermType;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property TermValue: Currency read fTermValue write fTermValue;
      property TermDays: Integer read fTermDays write fTermDays;
      property TextValue: RawUTF8 read fTextValue write fTextValue;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUomID read fUom write fUom;
  end;

  // 68
  TSQLInvoiceTermAttribute = class(TSQLRecord)
    private
      fInvoiceTerm: TSQLInvoiceTermID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property InvoiceTerm: TSQLInvoiceTermID read fInvoiceTerm write fInvoiceTerm;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 69
  TSQLInvoiceType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLInvoiceTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLInvoiceTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 70
  TSQLInvoiceTypeAttr = class(TSQLRecord)
    private
      fInvoiceType: TSQLInvoiceTypeID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fDescription: RawUTF8;
    published
      property InvoiceType: TSQLInvoiceTypeID read fInvoiceType write fInvoiceType;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 71
  TSQLInvoiceNote = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceID;
      fNote: TSQLNoteDataID;
    published
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property Note: TSQLNoteDataID read fNote write fNote;
  end;

  // 72
  TSQLAcctgTrans = class(TSQLRecord)
    private
      fAcctgTransType: TSQLAcctgTransTypeID;
      fDescription: RawUTF8;
      fTransactionDate: TDateTime;
      fIsPosted: Boolean;
      fPostedDate: TDateTime;
      fScheduledPostingDate: TDateTime;
      fGlJournal: TSQLGlJournalID;
      fGlFiscalType: TSQLGlFiscalTypeID;
      fVoucherRef: RawUTF8;
      fVoucherDate: TDateTime;
      fGroupStatus: TSQLStatusItemID;
      fFixedAsset: TSQLFixedAssetID;
      fInventoryItem: TSQLInventoryItemID;
      fPhysicalInventory: TSQLPhysicalInventoryID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fInvoice: TSQLInvoiceID;
      fPayment: TSQLPaymentID;
      fFinAccountTrans: TSQLFinAccountTransID;
      fShipment: TSQLShipmentID;
      fReceipt: TSQLShipmentReceiptID;
      fWorkEffort: TSQLWorkEffortID;
      fTheirAcctgTrans: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property AcctgTransType: TSQLAcctgTransTypeID read fAcctgTransType write fAcctgTransType;
      property Description: RawUTF8 read fDescription write fDescription;
      property TransactionDate: TDateTime read fTransactionDate write fTransactionDate;
      property IsPosted: Boolean read fIsPosted write fIsPosted;
      property PostedDate: TDateTime read fPostedDate write fPostedDate;
      property ScheduledPostingDate: TDateTime read fScheduledPostingDate write fScheduledPostingDate;
      property GlJournal: TSQLGlJournalID read fGlJournal write fGlJournal;
      property GlFiscalType: TSQLGlFiscalTypeID read fGlFiscalType write fGlFiscalType;
      property VoucherRef: RawUTF8 read fVoucherRef write fVoucherRef;
      property VoucherDate: TDateTime read fVoucherDate write fVoucherDate;
      property GroupStatus: TSQLStatusItemID read fGroupStatus write fGroupStatus;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property PhysicalInventory: TSQLPhysicalInventoryID read fPhysicalInventory write fPhysicalInventory;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property FinAccountTrans: TSQLFinAccountTransID read fFinAccountTrans write fFinAccountTrans;
      property Shipment: TSQLShipmentID read fShipment write fShipment;
      property Receipt: TSQLShipmentReceiptID read fReceipt write fReceipt;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property TheirAcctgTrans: Integer read fTheirAcctgTrans write fTheirAcctgTrans;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 73
  TSQLAcctgTransAttribute = class(TSQLRecord)
    private
      fAcctgTrans: TSQLAcctgTransID;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property AcctgTrans: TSQLAcctgTransID read fAcctgTrans write fAcctgTrans;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 74
  TSQLAcctgTransEntry = class(TSQLRecord)
    private
      fAcctgTrans: TSQLAcctgTransID;
      fAcctgTransEntrySeq: Integer;
      fAcctgTransEntryType: TSQLAcctgTransEntryTypeID;
      fDescription: RawUTF8;
      fVoucherRef: RawUTF8;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fTheirParty: TSQLPartyID;
      fProduct: TSQLProductID;
      fTheirProduct: TSQLProductID;
      fInventoryItem: TSQLInventoryItemID;
      fGlAccountType: TSQLGlAccountTypeID;
      fGlAccount: TSQLGlAccountID;
      fOrganizationParty: TSQLPartyID;
      fAmount: Currency;
      fCurrencyUom: TSQLUomID;
      fOrigAmount: Currency;
      fOrigCurrencyUom: TSQLUomID;
      fDebitCreditFlag: Boolean;
      fDueDate: TDateTime;
      fGroupId: Integer;
      fTax: Integer;
      fReconcileStatus: TSQLStatusItemID;
      fSettlementTerm: TSQLSettlementTermID;
      fIsSummary: Boolean;
    published
      property AcctgTrans: TSQLAcctgTransID read fAcctgTrans write fAcctgTrans;
      property AcctgTransEntrySeq: Integer read fAcctgTransEntrySeq write fAcctgTransEntrySeq;
      property AcctgTransEntryType: TSQLAcctgTransEntryTypeID read fAcctgTransEntryType write fAcctgTransEntryType;
      property Description: RawUTF8 read fDescription write fDescription;
      property VoucherRef: RawUTF8 read fVoucherRef write fVoucherRef;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property TheirParty: TSQLPartyID read fTheirParty write fTheirParty;
      property Product: TSQLProductID read fProduct write fProduct;
      property TheirProduct: TSQLProductID read fTheirProduct write fTheirProduct;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property GlAccountType: TSQLGlAccountTypeID read fGlAccountType write fGlAccountType;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property Amount: Currency read fAmount write fAmount;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property OrigAmount: Currency read fOrigAmount write fOrigAmount;
      property OrigCurrencyUom: TSQLUomID read fOrigCurrencyUom write fOrigCurrencyUom;
      property DebitCreditFlag: Boolean read fDebitCreditFlag write fDebitCreditFlag;
      property DueDate: TDateTime read fDueDate write fDueDate;
      property GroupId: Integer read fGroupId write fGroupId;
      property Tax: Integer read fTax write fTax;
      property ReconcileStatus: TSQLStatusItemID read fReconcileStatus write fReconcileStatus;
      property SettlementTerm: TSQLSettlementTermID read fSettlementTerm write fSettlementTerm;
      property IsSummary: Boolean read fIsSummary write fIsSummary;
  end;

  // 75
  TSQLAcctgTransEntryType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLAcctgTransEntryTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLAcctgTransEntryTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 76
  TSQLAcctgTransType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLAcctgTransTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLAcctgTransTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 77
  TSQLAcctgTransTypeAttr = class(TSQLRecord)
    private
      fAcctgTransType: TSQLAcctgTransTypeID;
      fAttrName: TSQLAcctgTransAttributeID;
      FDescription: RawUTF8;
    published
      property AcctgTransType: TSQLAcctgTransTypeID read fAcctgTransType write fAcctgTransType;
      property AttrName: TSQLAcctgTransAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 78
  TSQLGlAccount = class(TSQLRecord)
    private
      fGlAccountType: TSQLGlAccountTypeID;
      fGlAccountClass: TSQLGlAccountClassID;
      fGlResourceType: TSQLGlResourceTypeID;
      fGlXbrlClass: TSQLGlXbrlClassID;
      fParentGlAccount: TSQLGlAccountID;
      fAccountCode: RawUTF8;
      fAccountName: RawUTF8;
      fDescription: RawUTF8;
      fProduct: TSQLProductID;
      fExternalId: Integer;
    published
      property GlAccountType: TSQLGlAccountTypeID read fGlAccountType write fGlAccountType;
      property GlAccountClass: TSQLGlAccountClassID read fGlAccountClass write fGlAccountClass;
      property GlResourceType: TSQLGlResourceTypeID read fGlResourceType write fGlResourceType;
      property GlXbrlClass: TSQLGlXbrlClassID read fGlXbrlClass write fGlXbrlClass;
      property ParentGlAccount: TSQLGlAccountID read fParentGlAccount write fParentGlAccount;
      property AccountCode: RawUTF8 read fAccountCode write fAccountCode;
      property AccountName: RawUTF8 read fAccountName write fAccountName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Product: TSQLProductID read fProduct write fProduct;
      property ExternalId: Integer read fExternalId write fExternalId;
  end;

  // 79
  TSQLGlAccountClass = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLGlAccountClassID;
      fName: RawUTF8;
      fDescription: RawUTF8;
      fIsAssetClass: Boolean;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLGlAccountClassID read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property IsAssetClass: Boolean read fIsAssetClass write fIsAssetClass;
  end;

  // 80
  TSQLGlAccountGroup = class(TSQLRecord)
    private
      fGlAccountGroupType: TSQLGlAccountGroupTypeID;
      fDescription: RawUTF8;
    published
      property GlAccountGroupType: TSQLGlAccountGroupTypeID read fGlAccountGroupType write fGlAccountGroupType;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 81
  TSQLGlAccountGroupMember = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccountID;
      fGlAccountGroupType: TSQLGlAccountGroupTypeID;
      fGlAccountGroup: TSQLGlAccountGroupID;
    published
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property GlAccountGroupType: TSQLGlAccountGroupTypeID read fGlAccountGroupType write fGlAccountGroupType;
      property GlAccountGroup: TSQLGlAccountGroupID read fGlAccountGroup write fGlAccountGroup;
  end;

  // 82
  TSQLGlAccountGroupType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 83
  TSQLGlAccountHistory = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccountID;
      fOrganizationParty: TSQLPartyID;
      fCustomTimePeriod: TSQLCustomTimePeriodID;
      fOpeningBalance: Currency;
      fPostedDebits: Currency;
      fPostedCredits: Currency;
      fEndingBalance: Currency;
    published
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property CustomTimePeriod: TSQLCustomTimePeriodID read fCustomTimePeriod write fCustomTimePeriod;
      property OpeningBalance: Currency read fOpeningBalance write fOpeningBalance;
      property PostedDebits: Currency read fPostedDebits write fPostedDebits;
      property PostedCredits: Currency read fPostedCredits write fPostedCredits;
      property EndingBalance: Currency read fEndingBalance write fEndingBalance;
  end;

  // 84
  TSQLGlAccountOrganization = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccountID;
      fOrganizationParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
   published
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 85
  TSQLGlAccountRole = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccountID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
   published
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 86
  TSQLGlAccountType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLGlAccountTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLGlAccountTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 87
  TSQLGlAccountTypeDefault = class(TSQLRecord)
    private
      fGlAccountType: TSQLGlAccountTypeID;
      fOrganizationParty: TSQLPartyID;
      fGlAccount: TSQLGlAccountID;
    published
      property GlAccountType: TSQLGlAccountTypeID read fGlAccountType write fGlAccountType;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 88
  TSQLGlBudgetXref = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccountID;
      fBudgetItemType: TSQLBudgetItemTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAllocationPercentage: Double;
    published
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property BudgetItemType: TSQLBudgetItemTypeID read fBudgetItemType write fBudgetItemType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AllocationPercentage: Double read fAllocationPercentage write fAllocationPercentage;
  end;

  // 89
  TSQLGlFiscalType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 90
  TSQLGlJournal = class(TSQLRecord)
    private
      fGlJournalName: RawUTF8;
      fOrganizationParty: TSQLPartyID;
      fIsPosted: Boolean;
      fPostedDate: TDateTime;
    published
      property GlJournalName: RawUTF8 read fGlJournalName write fGlJournalName;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property IsPosted: Boolean read fIsPosted write fIsPosted;
      property PostedDate: TDateTime read fPostedDate write fPostedDate;
  end;

  // 91
  TSQLGlReconciliation = class(TSQLRecord)
    private
      fGlReconciliationName: RawUTF8;
      FDescription: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
      fGlAccount: TSQLGlAccountID;
      fStatus: TSQLStatusItemID;
      fOrganizationParty: TSQLPartyID;
      fReconciledBalance: Currency;
      fOpeningBalance: Currency;
      fReconciledDate: TDateTime;
    published
      property GlReconciliationName: RawUTF8 read fGlReconciliationName write fGlReconciliationName;
      property Description: RawUTF8 read FDescription write FDescription;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property ReconciledBalance: Currency read fReconciledBalance write fReconciledBalance;
      property OpeningBalance: Currency read fOpeningBalance write fOpeningBalance;
      property ReconciledDate: TDateTime read fReconciledDate write fReconciledDate;
  end;

  // 92
  TSQLGlReconciliationEntry = class(TSQLRecord)
    private
      fGlReconciliation: TSQLGlReconciliationID;
      fAcctgTrans: TSQLAcctgTransID;
      fAcctgTransEntrySeq: Integer;
      fReconciledAmount: Currency;
    published
      property GlReconciliation: TSQLGlReconciliationID read fGlReconciliation write fGlReconciliation;
      property AcctgTrans: TSQLAcctgTransID read fAcctgTrans write fAcctgTrans;
      property AcctgTransEntrySeq: Integer read fAcctgTransEntrySeq write fAcctgTransEntrySeq;
      property ReconciledAmount: Currency read fReconciledAmount write fReconciledAmount;
  end;

  // 93
  TSQLGlResourceType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 94
  TSQLGlXbrlClass = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 95
  TSQLPartyAcctgPreference = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fFiscalYearStartMonth: Integer;
      fFiscalYearStartDay: Integer;
      fTaxForm: TSQLEnumerationID;
      fCogsMethod: TSQLEnumerationID;
      fBaseCurrencyUom: TSQLUomID;
      fInvoiceSeqCustMeth: TSQLCustomMethodID;
      fInvoiceIdPrefix: RawUTF8;
      fLastInvoiceNumber: Integer;
      fLastInvoiceRestartDate: TDateTime;
      fUseInvoiceIdForReturns: Boolean;
      fQuoteSeqCustMethId: TSQLCustomMethodID;
      fQuoteIdPrefix: RawUTF8;
      fLastQuoteNumber: Integer;
      fOrderSeqCustMeth: TSQLCustomMethodID;
      fOrderIdPrefix: RawUTF8;
      fLastOrderNumber: Integer;
      fRefundPaymentMethod: TSQLPaymentMethodID;
      fErrorGlJournalId: TSQLGlJournalID;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property FiscalYearStartMonth: Integer read fFiscalYearStartMonth write fFiscalYearStartMonth;
      property FiscalYearStartDay: Integer read fFiscalYearStartDay write fFiscalYearStartDay;
      property TaxForm: TSQLEnumerationID read fTaxForm write fTaxForm;
      property CogsMethod: TSQLEnumerationID read fCogsMethod write fCogsMethod;
      property BaseCurrencyUom: TSQLUomID read fBaseCurrencyUom write fBaseCurrencyUom;
      property InvoiceSeqCustMeth: TSQLCustomMethodID read fInvoiceSeqCustMeth write fInvoiceSeqCustMeth;
      property InvoiceIdPrefix: RawUTF8 read fInvoiceIdPrefix write fInvoiceIdPrefix;
      property LastInvoiceNumber: Integer read fLastInvoiceNumber write fLastInvoiceNumber;
      property LastInvoiceRestartDate: TDateTime read fLastInvoiceRestartDate write fLastInvoiceRestartDate;
      property UseInvoiceIdForReturns: Boolean read fUseInvoiceIdForReturns write fUseInvoiceIdForReturns;
      property QuoteSeqCustMethId: TSQLCustomMethodID read fQuoteSeqCustMethId write fQuoteSeqCustMethId;
      property QuoteIdPrefix: RawUTF8 read fQuoteIdPrefix write fQuoteIdPrefix;
      property LastQuoteNumber: Integer read fLastQuoteNumber write fLastQuoteNumber;
      property OrderSeqCustMeth: TSQLCustomMethodID read fOrderSeqCustMeth write fOrderSeqCustMeth;
      property OrderIdPrefix: RawUTF8 read fOrderIdPrefix write fOrderIdPrefix;
      property LastOrderNumber: Integer read fLastOrderNumber write fLastOrderNumber;
      property RefundPaymentMethod: TSQLPaymentMethodID read fRefundPaymentMethod write fRefundPaymentMethod;
      property ErrorGlJournalId: TSQLGlJournalID read fErrorGlJournalId write fErrorGlJournalId;
  end;

  // 96
  TSQLProductAverageCost = class(TSQLRecord)
    private
      fProductAverageCostType: TSQLProductAverageCostTypeID;
      fOrganizationParty: TSQLPartyID;
      fProduct: TSQLProductID;
      fFacility: TSQLFacilityID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAverageCost: Double;
    published
      property ProductAverageCostType: TSQLProductAverageCostTypeID read fProductAverageCostType write fProductAverageCostType;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property Product: TSQLProductID read fProduct write fProduct;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AverageCost: Double read fAverageCost write fAverageCost;
  end;

  // 97
  TSQLProductAverageCostType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductAverageCostTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductAverageCostTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 98
  TSQLSettlementTerm = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fUomEncode: RawUTF8;
      fTermName: RawUTF8;
      fTermValue: Integer;
      fUom: TSQLUomID;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property UomEncode: RawUTF8 read fUomEncode write fUomEncode;
      property TermName: RawUTF8 read fTermName write fTermName;
      property TermValue: Integer read fTermValue write fTermValue;
      property Uom: TSQLUomID read fUom write fUom;
  end;

  // 99
  TSQLVarianceReasonGlAccount = class(TSQLRecord)
    private
      fVarianceReason: TSQLVarianceReasonID;
      fOrganizationParty: TSQLPartyID;
      fGlAccountL: TSQLGlAccountID;
    published
      property VarianceReason: TSQLVarianceReasonID read fVarianceReason write fVarianceReason;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccountL: TSQLGlAccountID read fGlAccountL write fGlAccountL;
  end;

  // 100
  TSQLBillingAccount = class(TSQLRecord)
    private
      fAccountLimit: Currency;
      fAccountCurrencyUom: TSQLUomID;
      fContactMech: TSQLContactMechID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fDescription: RawUTF8;
      fExternalAccount: RawUTF8;
    published
      property AccountLimit: Currency read fAccountLimit write fAccountLimit;
      property AccountCurrencyUom: TSQLUomID read fAccountCurrencyUom write fAccountCurrencyUom;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Description: RawUTF8 read fDescription write fDescription;
      property ExternalAccount: RawUTF8 read fExternalAccount write fExternalAccount;
  end;

  // 101
  TSQLBillingAccountRole = class(TSQLRecord)
    private
      fBillingAccount: TSQLBillingAccountID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property BillingAccount: TSQLBillingAccountID read fBillingAccount write fBillingAccount;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 102
  TSQLBillingAccountTerm = class(TSQLRecord)
    private
      fBillingAccount: TSQLBillingAccountID;
      fTermType: TSQLTermTypeID;
      fTermValue: Currency;
      fTermDays: Integer;
      fUom: TSQLUomID;
    published
      property BillingAccount: TSQLBillingAccountID read fBillingAccount write fBillingAccount;
      property TermType: TSQLTermTypeID read fTermType write fTermType;
      property TermValue: Currency read fTermValue write fTermValue;
      property TermDays: Integer read fTermDays write fTermDays;
      property Uom: TSQLUomID read fUom write fUom;
  end;

  // 103
  TSQLBillingAccountTermAttr = class(TSQLRecord)
    private
      fBillingAccountTerm: TSQLBillingAccountTermID;
      fAttrName: TSQLTermTypeAttrID;
      fAttrValue: RawUTF8;
    published
      property BillingAccountTerm: TSQLBillingAccountTermID read fBillingAccountTerm write fBillingAccountTerm;
      property AttrName: TSQLTermTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
  end;

  // 104
  TSQLCreditCard = class(TSQLRecord)
    private
      fPaymentMethod: TSQLPaymentMethodID;
      fCardType: RawUTF8;
      fCardNumber: RawUTF8;
      fValidFromDate: TDateTime;
      fExpireDate: TDateTime;
      fIssueNumber: TDateTime;
      fCompanyNameOnCard: RawUTF8;
      fTitleOnCard: RawUTF8;
      fFirstNameOnCard: RawUTF8;
      fMiddleNameOnCard: RawUTF8;
      fLastNameOnCard: RawUTF8;
      fSuffixOnCard: RawUTF8;
      fContactMech: TSQLContactMechID;
      fConsecutiveFailedAuths: Integer;
      fLastFailedAuthDate: TDateTime;
      fConsecutiveFailedNsf: Integer;
      fLastFailedNsfDate: TDateTime;
    published
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property CardType: RawUTF8 read fCardType write fCardType;
      property CardNumber: RawUTF8 read fCardNumber write fCardNumber;
      property ValidFromDate: TDateTime read fValidFromDate write fValidFromDate;
      property ExpireDate: TDateTime read fExpireDate write fExpireDate;
      property IssueNumber: TDateTime read fIssueNumber write fIssueNumber;
      property CompanyNameOnCard: RawUTF8 read fCompanyNameOnCard write fCompanyNameOnCard;
      property TitleOnCard: RawUTF8 read fTitleOnCard write fTitleOnCard;
      property FirstNameOnCard: RawUTF8 read fFirstNameOnCard write fFirstNameOnCard;
      property MiddleNameOnCard: RawUTF8 read fMiddleNameOnCard write fMiddleNameOnCard;
      property LastNameOnCard: RawUTF8 read fLastNameOnCard write fLastNameOnCard;
      property SuffixOnCard: RawUTF8 read fSuffixOnCard write fSuffixOnCard;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property ConsecutiveFailedAuths: Integer read fConsecutiveFailedAuths write fConsecutiveFailedAuths;
      property LastFailedAuthDate: TDateTime read fLastFailedAuthDate write fLastFailedAuthDate;
      property ConsecutiveFailedNsf: Integer read fConsecutiveFailedNsf write fConsecutiveFailedNsf;
      property LastFailedNsfDate: TDateTime read fLastFailedNsfDate write fLastFailedNsfDate;
  end;

  // 105
  TSQLCreditCardTypeGlAccount = class(TSQLRecord)
    private
      fCardType: RawUTF8;
      fOrganizationParty: TSQLPartyID;
      fGlAccount: TSQLGlAccountID;
    published
      property CardType: RawUTF8 read fCardType write fCardType;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 106
  TSQLDeduction = class(TSQLRecord)
    private
      fDeductionType: TSQLDeductionTypeID;
      fPayment: TSQLPaymentID;
      fAmount: Currency;
    published
      property DeductionType: TSQLDeductionTypeID read fDeductionType write fDeductionType;
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 107
  TSQLDeductionType = class(TSQLRecord)
    private
      fParent: TSQLDeductionTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLDeductionTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 108
  TSQLEftAccount = class(TSQLRecord)
    private
      fPaymentMethod: TSQLPaymentMethodID;
      fBankName: RawUTF8;
      fRoutingNumber: RawUTF8;
      fAccountType: RawUTF8;
      fAccountNumber: RawUTF8;
      fNameOnAccount: RawUTF8;
      fCompanyNameOnAccount: RawUTF8;
      fContactMech: TSQLContactMechID;
      fYearsAtBank: Integer;
    published
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property BankName: RawUTF8 read fBankName write fBankName;
      property RoutingNumber: RawUTF8 read fRoutingNumber write fRoutingNumber;
      property AccountType: RawUTF8 read fAccountType write fAccountType;
      property AccountNumber: RawUTF8 read fAccountNumber write fAccountNumber;
      property NameOnAccount: RawUTF8 read fNameOnAccount write fNameOnAccount;
      property CompanyNameOnAccount: RawUTF8 read fCompanyNameOnAccount write fCompanyNameOnAccount;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property YearsAtBank: Integer read fYearsAtBank write fYearsAtBank;
  end;

  // 109
  TSQLCheckAccount = class(TSQLRecord)
    private
      fPaymentMethod: TSQLPaymentMethodID;
      fBankName: RawUTF8;
      fRoutingNumber: RawUTF8;
      fAccountType: RawUTF8;
      fAccountNumber: RawUTF8;
      fNameOnAccount: RawUTF8;
      fCompanyNameOnAccount: RawUTF8;
      fContactMech: TSQLContactMechID;
      fBranchCode: RawUTF8;
    published
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property BankName: RawUTF8 read fBankName write fBankName;
      property RoutingNumber: RawUTF8 read fRoutingNumber write fRoutingNumber;
      property AccountType: RawUTF8 read fAccountType write fAccountType;
      property AccountNumber: RawUTF8 read fAccountNumber write fAccountNumber;
      property NameOnAccount: RawUTF8 read fNameOnAccount write fNameOnAccount;
      property CompanyNameOnAccount: RawUTF8 read fCompanyNameOnAccount write fCompanyNameOnAccount;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property BranchCode: RawUTF8 read fBranchCode write fBranchCode;
  end;

  // 110
  TSQLGiftCard = class(TSQLRecord)
    private
      fPaymentMethod: TSQLPaymentMethodID;
      fCardNumber: RawUTF8;
      fPinNumber: RawUTF8;
      fExpireDate: TDateTime;
      fContactMech: TSQLContactMechID;
    published
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property CardNumber: RawUTF8 read fCardNumber write fCardNumber;
      property PinNumber: RawUTF8 read fPinNumber write fPinNumber;
      property ExpireDate: TDateTime read fExpireDate write fExpireDate;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
  end;

  // 111
  TSQLGiftCardFulfillment = class(TSQLRecord)
    private
      fTypeEnum: TSQLEnumerationID;
      fMerchant: RawUTF8;
      fParty: TSQLPartyID;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeq: Integer;
      fSurveyResponse: TSQLSurveyResponseID;
      fCardNumber: RawUTF8;
      fPinNumber: RawUTF8;
      fAmount: Currency;
      fResponseCode: RawUTF8;
      fReferenceNum: RawUTF8;
      fAuthCode: RawUTF8;
      fFulfillmentDate: TDateTime;
    published
      property TypeEnum: TSQLEnumerationID read fTypeEnum write fTypeEnum;
      property Merchant: RawUTF8 read fMerchant write fMerchant;
      property Party: TSQLPartyID read fParty write fParty;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property SurveyResponse: TSQLSurveyResponseID read fSurveyResponse write fSurveyResponse;
      property CardNumber: RawUTF8 read fCardNumber write fCardNumber;
      property PinNumber: RawUTF8 read fPinNumber write fPinNumber;
      property Amount: Currency read fAmount write fAmount;
      property ResponseCode: RawUTF8 read fResponseCode write fResponseCode;
      property ReferenceNum: RawUTF8 read fReferenceNum write fReferenceNum;
      property AuthCode: RawUTF8 read fAuthCode write fAuthCode;
      property FulfillmentDate: TDateTime read fFulfillmentDate write fFulfillmentDate;
  end;

  // 112
  TSQLPayment = class(TSQLRecord)
    private
      fPaymentType: TSQLPaymentTypeID;
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fPaymentMethod: TSQLPaymentMethodID;
      fPaymentGatewayResponse: TSQLPaymentGatewayResponseID;
      fPaymentPreference: TSQLOrderPaymentPreferenceID;
      fPartyFrom: TSQLPartyID;
      fPartyTo: TSQLPartyID;
      fRoleTypeTo: TSQLRoleTypeID;
      fStatus: TSQLStatusItemID;
      fEffectiveDate: TDateTime;
      fPaymentRefNum: RawUTF8;
      fAmount: Currency;
      fCurrencyUom: TSQLUomID;
      fComments: RawUTF8;
      fFinAccountTrans: TSQLFinAccountTransID;
      fOverrideGlAccount: TSQLGlAccountID;
      fActualCurrencyAmount: Currency;
      fActualCurrencyUom: TSQLUomID;
    published
      property PaymentType: TSQLPaymentTypeID read fPaymentType write fPaymentType;
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property PaymentGatewayResponse: TSQLPaymentGatewayResponseID read fPaymentGatewayResponse write fPaymentGatewayResponse;
      property PaymentPreference: TSQLOrderPaymentPreferenceID read fPaymentPreference write fPaymentPreference;
      property PartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
      property RoleTypeTo: TSQLRoleTypeID read fRoleTypeTo write fRoleTypeTo;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property EffectiveDate: TDateTime read fEffectiveDate write fEffectiveDate;
      property PaymentRefNum: RawUTF8 read fPaymentRefNum write fPaymentRefNum;
      property Amount: Currency read fAmount write fAmount;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property Comments: RawUTF8 read fComments write fComments;
      property FinAccountTrans: TSQLFinAccountTransID read fFinAccountTrans write fFinAccountTrans;
      property OverrideGlAccount: TSQLGlAccountID read fOverrideGlAccount write fOverrideGlAccount;
      property ActualCurrencyAmount: Currency read fActualCurrencyAmount write fActualCurrencyAmount;
      property ActualCurrencyUom: TSQLUomID read fActualCurrencyUom write fActualCurrencyUom;
  end;

  // 113
  TSQLPaymentApplication = class(TSQLRecord)
    private
      fPayment: TSQLPaymentID;
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fBillingAccount: TSQLBillingAccountID;
      fOverrideGlAccount: TSQLGlAccountID;
      fToPayment: TSQLPaymentID;
      fTaxAuthGeo: TSQLGeoID;
      fAmountApplied: Currency;
    published
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property BillingAccount: TSQLBillingAccountID read fBillingAccount write fBillingAccount;
      property OverrideGlAccount: TSQLGlAccountID read fOverrideGlAccount write fOverrideGlAccount;
      property ToPayment: TSQLPaymentID read fToPayment write fToPayment;
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property AmountApplied: Currency read fAmountApplied write fAmountApplied;
  end;

  // 114
  TSQLPaymentAttribute = class(TSQLRecord)
    private
      fPayment: TSQLPaymentID;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 115
  TSQLPaymentBudgetAllocation = class(TSQLRecord)
    private
      fBudget: TSQLBudgetID;
      fBudgetItemSeq: Integer;
      fPayment: TSQLPaymentID;
      fAmount: Currency;
    published
      property Budget: TSQLBudgetID read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 116
  TSQLPaymentContent = class(TSQLRecord)
    private
      fPayment: TSQLPaymentID;
      fPaymentContentType: TSQLPaymentContentTypeID;
      fContent: TSQLContentID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property PaymentContentType: TSQLPaymentContentTypeID read fPaymentContentType write fPaymentContentType;
      property Content: TSQLContentID read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 117
  TSQLPaymentContentType = class(TSQLRecord)
    private
      fParent: TSQLPaymentContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPaymentContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 118
  TSQLPaymentMethod = class(TSQLRecord)
    private
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fParty: TSQLPartyID;
      fGlAccount: TSQLGlAccountID;
      fFinAccount: TSQLFinAccountID;
      fDescription: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
   published
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property Party: TSQLPartyID read fParty write fParty;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property FinAccount: TSQLFinAccountID read fFinAccount write fFinAccount;
      property Description: RawUTF8 read fDescription write fDescription;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 119
  TSQLPaymentMethodType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fDefaultGlAccount: TSQLGlAccountID;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property DefaultGlAccount: TSQLGlAccountID read fDefaultGlAccount write fDefaultGlAccount;
  end;

  // 120
  TSQLPaymentMethodTypeGlAccount = class(TSQLRecord)
    private
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fOrganizationParty: TSQLPartyID;
      fGlAccount: TSQLGlAccountID;
    published
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 121
  TSQLPaymentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLPaymentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLPaymentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 122
  TSQLPaymentTypeAttr = class(TSQLRecord)
    private
      fPaymentType: TSQLPaymentTypeID;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fDescription: RawUTF8;
    published
      property PaymentType: TSQLPaymentTypeID read fPaymentType write fPaymentType;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
 end;

  // 123
  TSQLPaymentGlAccountTypeMap = class(TSQLRecord)
    private
      fPaymentType: TSQLPaymentTypeID;
      fOrganizationParty: TSQLPartyID;
      fGlAccountType: TSQLGlAccountTypeID;
    published
      property PaymentType: TSQLPaymentTypeID read fPaymentType write fPaymentType;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccountType: TSQLGlAccountTypeID read fGlAccountType write fGlAccountType;
  end;

  // 124
  TSQLPaymentGatewayConfigType = class(TSQLRecord)
    private
      fParent: TSQLPaymentGatewayConfigTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPaymentGatewayConfigTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 125
  TSQLPaymentGatewayConfig = class(TSQLRecord)
    private
      fPaymentGatewayConfigType: TSQLPaymentGatewayConfigTypeID;
      FDescription: RawUTF8;
    published
      property PaymentGatewayConfigType: TSQLPaymentGatewayConfigTypeID read fPaymentGatewayConfigType write fPaymentGatewayConfigType;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 126
  TSQLPaymentGatewaySagePay = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fVendor: RawUTF8;
      fProductionHost: RawUTF8;
      fTestingHost: RawUTF8;
      fSagePayMode: RawUTF8;
      fProtocolVersion: RawUTF8;
      fAuthenticationTransType: RawUTF8;
      fAuthenticationUrl: RawUTF8;
      fAuthoriseTransType: RawUTF8;
      fAuthoriseUrl: RawUTF8;
      fReleaseTransType: RawUTF8;
      fReleaseUrl: RawUTF8;
      fVoidUrl: RawUTF8;
      fRefundUrl: RawUTF8;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property Vendor: RawUTF8 read fVendor write fVendor;
      property ProductionHost: RawUTF8 read fProductionHost write fProductionHost;
      property TestingHost: RawUTF8 read fTestingHost write fTestingHost;
      property SagePayMode: RawUTF8 read fSagePayMode write fSagePayMode;
      property ProtocolVersion: RawUTF8 read fProtocolVersion write fProtocolVersion;
      property AuthenticationTransType: RawUTF8 read fAuthenticationTransType write fAuthenticationTransType;
      property AuthenticationUrl: RawUTF8 read fAuthenticationUrl write fAuthenticationUrl;
      property AuthoriseTransType: RawUTF8 read fAuthoriseTransType write fAuthoriseTransType;
      property AuthoriseUrl: RawUTF8 read fAuthoriseUrl write fAuthoriseUrl;
      property ReleaseTransType: RawUTF8 read fReleaseTransType write fReleaseTransType;
      property ReleaseUrl: RawUTF8 read fReleaseUrl write fReleaseUrl;
      property VoidUrl: RawUTF8 read fVoidUrl write fVoidUrl;
      property RefundUrl: RawUTF8 read fRefundUrl write fRefundUrl;
  end;

  // 127
  TSQLPaymentGatewayAuthorizeNet = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fTransactionUrl: RawUTF8;
      fCertificateAlias: RawUTF8;
      fApiVersion: RawUTF8;
      fDelimitedData: RawUTF8;
      fDelimiterChar: RawUTF8;
      fCpVersion: RawUTF8;
      fCpMarketType: RawUTF8;
      fCpDeviceType: RawUTF8;
      fMethod: RawUTF8;
      fEmailCustomer: RawUTF8;
      fEmailMerchant: RawUTF8;
      fTestMode: RawUTF8;
      fRelayResponse: RawUTF8;
      fTranKey: RawUTF8;
      fUser: RawUTF8;
      fPwd: RawUTF8;
      fTransDescription: RawUTF8;
      fDuplicateWindow: Integer;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property TransactionUrl: RawUTF8 read fTransactionUrl write fTransactionUrl;
      property CertificateAlias: RawUTF8 read fCertificateAlias write fCertificateAlias;
      property ApiVersion: RawUTF8 read fApiVersion write fApiVersion;
      property DelimitedData: RawUTF8 read fDelimitedData write fDelimitedData;
      property DelimiterChar: RawUTF8 read fDelimiterChar write fDelimiterChar;
      property CpVersion: RawUTF8 read fCpVersion write fCpVersion;
      property CpMarketType: RawUTF8 read fCpMarketType write fCpMarketType;
      property CpDeviceType: RawUTF8 read fCpDeviceType write fCpDeviceType;
      property Method: RawUTF8 read fMethod write fMethod;
      property EmailCustomer: RawUTF8 read fEmailCustomer write fEmailCustomer;
      property EmailMerchant: RawUTF8 read fEmailMerchant write fEmailMerchant;
      property TestMode: RawUTF8 read fTestMode write fTestMode;
      property RelayResponse: RawUTF8 read fRelayResponse write fRelayResponse;
      property TranKey: RawUTF8 read fTranKey write fTranKey;
      property User: RawUTF8 read fUser write fUser;
      property Pwd: RawUTF8 read fPwd write fPwd;
      property TransDescription: RawUTF8 read fTransDescription write fTransDescription;
      property DuplicateWindow: Integer read fDuplicateWindow write fDuplicateWindow;
  end;

  // 128
  TSQLPaymentGatewayEway = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fCustomer: RawUTF8;
      fRefundPwd: RawUTF8;
      fTestMode: RawUTF8;
      fEnableCvn: RawUTF8;
      fEnableBeagle: RawUTF8;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property Customer: RawUTF8 read fCustomer write fCustomer;
      property RefundPwd: RawUTF8 read fRefundPwd write fRefundPwd;
      property TestMode: RawUTF8 read fTestMode write fTestMode;
      property EnableCvn: RawUTF8 read fEnableCvn write fEnableCvn;
      property EnableBeagle: RawUTF8 read fEnableBeagle write fEnableBeagle;
  end;

  // 129
  TSQLPaymentGatewayCyberSource = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fMerchant: RawUTF8;
      fApiVersion: RawUTF8;
      fProduction: RawUTF8;
      fKeysDir: RawUTF8;
      fKeysFile: RawUTF8;
      fLogEnabled: RawUTF8;
      fLogDir: RawUTF8;
      fLogFile: RawUTF8;
      fLogSize: Integer;
      fMerchantDescr: RawUTF8;
      fMerchantContact: RawUTF8;
      fAutoBill: RawUTF8;
      fEnableDav: Boolean;
      fFraudScore: Boolean;
      fIgnoreAvs: RawUTF8;
      fDisableBillAvs: Boolean;
      fAvsDeclineCodes: RawUTF8;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property Merchant: RawUTF8 read fMerchant write fMerchant;
      property ApiVersion: RawUTF8 read fApiVersion write fApiVersion;
      property Production: RawUTF8 read fProduction write fProduction;
      property KeysDir: RawUTF8 read fKeysDir write fKeysDir;
      property KeysFile: RawUTF8 read fKeysFile write fKeysFile;
      property LogEnabled: RawUTF8 read fLogEnabled write fLogEnabled;
      property LogDir: RawUTF8 read fLogDir write fLogDir;
      property LogFile: RawUTF8 read fLogFile write fLogFile;
      property LogSize: Integer read fLogSize write fLogSize;
      property MerchantDescr: RawUTF8 read fMerchantDescr write fMerchantDescr;
      property MerchantContact: RawUTF8 read fMerchantContact write fMerchantContact;
      property AutoBill: RawUTF8 read fAutoBill write fAutoBill;
      property EnableDav: Boolean read fEnableDav write fEnableDav;
      property FraudScore: Boolean read fFraudScore write fFraudScore;
      property IgnoreAvs: RawUTF8 read fIgnoreAvs write fIgnoreAvs;
      property DisableBillAvs: Boolean read fDisableBillAvs write fDisableBillAvs;
      property AvsDeclineCodes: RawUTF8 read fAvsDeclineCodes write fAvsDeclineCodes;
  end;

  // 130
  TSQLPaymentGatewayPayflowPro = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fCertsPath: RawUTF8;
      fHostAddress: RawUTF8;
      fHostPort: Integer;
      fTimeout: Integer;
      fProxyAddress: RawUTF8;
      fProxyPort: Integer;
      fProxyLogon: RawUTF8;
      fProxyPassword: RawUTF8;
      fVendor: RawUTF8;
      fUser: RawUTF8;
      fPwd: RawUTF8;
      fPartner: RawUTF8;
      fCheckAvs: Boolean;
      fCheckCvv2: Boolean;
      fPreAuth: Boolean;
      fEnableTransmit: RawUTF8;
      fLogFileName: RawUTF8;
      fLoggingLevel: Integer;
      fMaxLogFileSize: Integer;
      fStackTraceOn: Boolean;
      fRedirectUrl: RawUTF8;
      fCancelReturnUrl: RawUTF8;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property CertsPath: RawUTF8 read fCertsPath write fCertsPath;
      property HostAddress: RawUTF8 read fHostAddress write fHostAddress;
      property HostPort: Integer read fHostPort write fHostPort;
      property Timeout: Integer read fTimeout write fTimeout;
      property ProxyAddress: RawUTF8 read fProxyAddress write fProxyAddress;
      property ProxyPort: Integer read fProxyPort write fProxyPort;
      property ProxyLogon: RawUTF8 read fProxyLogon write fProxyLogon;
      property ProxyPassword: RawUTF8 read fProxyPassword write fProxyPassword;
      property Vendor: RawUTF8 read fVendor write fVendor;
      property User: RawUTF8 read fUser write fUser;
      property Pwd: RawUTF8 read fPwd write fPwd;
      property Partner: RawUTF8 read fPartner write fPartner;
      property CheckAvs: Boolean read fCheckAvs write fCheckAvs;
      property CheckCvv2: Boolean read fCheckCvv2 write fCheckCvv2;
      property PreAuth: Boolean read fPreAuth write fPreAuth;
      property EnableTransmit: RawUTF8 read fEnableTransmit write fEnableTransmit;
      property LogFileName: RawUTF8 read fLogFileName write fLogFileName;
      property LoggingLevel: Integer read fLoggingLevel write fLoggingLevel;
      property MaxLogFileSize: Integer read fMaxLogFileSize write fMaxLogFileSize;
      property StackTraceOn: Boolean read fStackTraceOn write fStackTraceOn;
      property RedirectUrl: RawUTF8 read fRedirectUrl write fRedirectUrl;
      property CancelReturnUrl: RawUTF8 read fCancelReturnUrl write fCancelReturnUrl;
  end;

  // 131
  TSQLPaymentGatewayPayPal = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fBusinessEmail: RawUTF8;
      fApiUserName: RawUTF8;
      fApiPassword: RawUTF8;
      fApiSignature: RawUTF8;
      fApiEnvironment: RawUTF8;
      fNotifyUrl: RawUTF8;
      fReturnUrl: RawUTF8;
      fCancelReturnUrl: RawUTF8;
      fImageUrl: RawUTF8;
      fConfirmTemplate: RawUTF8;
      fRedirectUrl: RawUTF8;
      fConfirmUrl: RawUTF8;
      fShippingCallbackUrl: RawUTF8;
      fRequireConfirmedShipping: Boolean;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property BusinessEmail: RawUTF8 read fBusinessEmail write fBusinessEmail;
      property ApiUserName: RawUTF8 read fApiUserName write fApiUserName;
      property ApiPassword: RawUTF8 read fApiPassword write fApiPassword;
      property ApiSignature: RawUTF8 read fApiSignature write fApiSignature;
      property ApiEnvironment: RawUTF8 read fApiEnvironment write fApiEnvironment;
      property NotifyUrl: RawUTF8 read fNotifyUrl write fNotifyUrl;
      property ReturnUrl: RawUTF8 read fReturnUrl write fReturnUrl;
      property CancelReturnUrl: RawUTF8 read fCancelReturnUrl write fCancelReturnUrl;
      property ImageUrl: RawUTF8 read fImageUrl write fImageUrl;
      property ConfirmTemplate: RawUTF8 read fConfirmTemplate write fConfirmTemplate;
      property RedirectUrl: RawUTF8 read fRedirectUrl write fRedirectUrl;
      property ConfirmUrl: RawUTF8 read fConfirmUrl write fConfirmUrl;
      property ShippingCallbackUrl: RawUTF8 read fShippingCallbackUrl write fShippingCallbackUrl;
      property RequireConfirmedShipping: Boolean read fRequireConfirmedShipping write fRequireConfirmedShipping;
  end;

  // 132
  TSQLPaymentGatewayClearCommerce = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fSource: RawUTF8;
      fGroupId: RawUTF8;
      fClient: RawUTF8;
      fUsername: RawUTF8;
      fPwd: RawUTF8;
      fUserAlias: RawUTF8;
      fEffectiveAlias: RawUTF8;
      fProcessMode: Boolean;
      fServerURL: RawUTF8;
      fEnableCVM: Boolean;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property Source: RawUTF8 read fSource write fSource;
      property GroupId: RawUTF8 read fGroupId write fGroupId;
      property Client: RawUTF8 read fClient write fClient;
      property Username: RawUTF8 read fUsername write fUsername;
      property Pwd: RawUTF8 read fPwd write fPwd;
      property UserAlias: RawUTF8 read fUserAlias write fUserAlias;
      property EffectiveAlias: RawUTF8 read fEffectiveAlias write fEffectiveAlias;
      property ProcessMode: Boolean read fProcessMode write fProcessMode;
      property ServerURL: RawUTF8 read fServerURL write fServerURL;
      property EnableCVM: Boolean read fEnableCVM write fEnableCVM;
  end;

  // 133
  TSQLPaymentGatewayWorldPay = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fRedirectUrl: RawUTF8;
      //Worldpay instance Id
      fInstId: RawUTF8;
      fAuthMode: Boolean;
      fFixContact: Boolean;
      fHideContact: Boolean;
      fHideCurrency: Boolean;
      fLangId: RawUTF8;
      fNoLanguageMenu: Boolean;
      fWithDelivery: Boolean;
      fTestMode: Integer;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property RedirectUrl: RawUTF8 read fRedirectUrl write fRedirectUrl;
      property InstId: RawUTF8 read fInstId write fInstId;
      property AuthMode: Boolean read fAuthMode write fAuthMode;
      property FixContact: Boolean read fFixContact write fFixContact;
      property HideContact: Boolean read fHideContact write fHideContact;
      property HideCurrency: Boolean read fHideCurrency write fHideCurrency;
      property LangId: RawUTF8 read fLangId write fLangId;
      property NoLanguageMenu: Boolean read fNoLanguageMenu write fNoLanguageMenu;
      property WithDelivery: Boolean read fWithDelivery write fWithDelivery;
      property TestMode: Integer read fTestMode write fTestMode;
  end;

  // 134
  TSQLPaymentGatewayOrbital = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fUsername: RawUTF8;
      fConnectionPassword: RawUTF8;
      fMerchantId: RawUTF8;
      fEngineClass: RawUTF8;
      fHostName: RawUTF8;
      fPort: Integer;
      fHostNameFailover: RawUTF8;
      fPortFailover: Integer;
      fConnectionTimeoutSeconds: Integer;
      fReadTimeoutSeconds: Integer;
      fAuthorizationURI: RawUTF8;
      fSdkVersion: RawUTF8;
      fSslSocketFactory: RawUTF8;
      fResponseType: RawUTF8;
   published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property Username: RawUTF8 read fUsername write fUsername;
      property ConnectionPassword: RawUTF8 read fConnectionPassword write fConnectionPassword;
      property MerchantId: RawUTF8 read fMerchantId write fMerchantId;
      property EngineClass: RawUTF8 read fEngineClass write fEngineClass;
      property HostName: RawUTF8 read fHostName write fHostName;
      property Port: Integer read fPort write fPort;
      property HostNameFailover: RawUTF8 read fHostNameFailover write fHostNameFailover;
      property PortFailover: Integer read fPortFailover write fPortFailover;
      property ConnectionTimeoutSeconds: Integer read fConnectionTimeoutSeconds write fConnectionTimeoutSeconds;
      property ReadTimeoutSeconds: Integer read fReadTimeoutSeconds write fReadTimeoutSeconds;
      property AuthorizationURI: RawUTF8 read fAuthorizationURI write fAuthorizationURI;
      property SdkVersion: RawUTF8 read fSdkVersion write fSdkVersion;
      property SslSocketFactory: RawUTF8 read fSslSocketFactory write fSslSocketFactory;
      property ResponseType: RawUTF8 read fResponseType write fResponseType;
  end;

  // 135
  TSQLPaymentGatewaySecurePay = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fMerchantId: RawUTF8;
      fPwd: RawUTF8;
      fServerURL: RawUTF8;
      fProcessTimeout: Integer;
      fEnableAmountRound: Boolean;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property MerchantId: RawUTF8 read fMerchantId write fMerchantId;
      property Pwd: RawUTF8 read fPwd write fPwd;
      property ServerURL: RawUTF8 read fServerURL write fServerURL;
      property ProcessTimeout: Integer read fProcessTimeout write fProcessTimeout;
      property EnableAmountRound: Boolean read fEnableAmountRound write fEnableAmountRound;
  end;

  // 136
  TSQLPaymentGatewayiDEAL = class(TSQLRecord)
    private
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fMerchantId: RawUTF8;
      fMerchantSubId: RawUTF8;
      fMerchantReturnURL: RawUTF8;
      fAcquirerURL: RawUTF8;
      fAcquirerTimeout: RawUTF8;
      fPrivateCert: RawUTF8;
      fAcquirerKeyStoreFilename: RawUTF8;
      fAcquirerKeyStorePassword: RawUTF8;
      fMerchantKeyStoreFilename: RawUTF8;
      fMerchantKeyStorePassword: RawUTF8;
      fExpirationPeriod: RawUTF8;
    published
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property MerchantId: RawUTF8 read fMerchantId write fMerchantId;
      property MerchantSubId: RawUTF8 read fMerchantSubId write fMerchantSubId;
      property MerchantReturnURL: RawUTF8 read fMerchantReturnURL write fMerchantReturnURL;
      property AcquirerURL: RawUTF8 read fAcquirerURL write fAcquirerURL;
      property AcquirerTimeout: RawUTF8 read fAcquirerTimeout write fAcquirerTimeout;
      property PrivateCert: RawUTF8 read fPrivateCert write fPrivateCert;
      property AcquirerKeyStoreFilename: RawUTF8 read fAcquirerKeyStoreFilename write fAcquirerKeyStoreFilename;
      property AcquirerKeyStorePassword: RawUTF8 read fAcquirerKeyStorePassword write fAcquirerKeyStorePassword;
      property MerchantKeyStoreFilename: RawUTF8 read fMerchantKeyStoreFilename write fMerchantKeyStoreFilename;
      property MerchantKeyStorePassword: RawUTF8 read fMerchantKeyStorePassword write fMerchantKeyStorePassword;
      property ExpirationPeriod: RawUTF8 read fExpirationPeriod write fExpirationPeriod;
  end;

  // 137
  TSQLPaymentGatewayRespMsg = class(TSQLRecord)
    private
      fPaymentGatewayResponse: TSQLPaymentGatewayResponseID;
      fPgrMessage: RawUTF8;
    published
      property PaymentGatewayResponse: TSQLPaymentGatewayResponseID read fPaymentGatewayResponse write fPaymentGatewayResponse;
      property PgrMessage: RawUTF8 read fPgrMessage write fPgrMessage;
  end;

  // 138
  TSQLPaymentGatewayResponse = class(TSQLRecord)
    private
      fPaymentServiceTypeEnum: TSQLEnumerationID;
      fOrderPaymentPreference: TSQLOrderPaymentPreferenceID;
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fPaymentMethod: TSQLPaymentMethodID;
      fTransCodeEnum: TSQLEnumerationID;
      fAmount: Currency;
      fCurrencyUom: TSQLUomID;
      fReferenceNum: RawUTF8;
      fAltReference: RawUTF8;
      fSubReference: RawUTF8;
      fGatewayCode: RawUTF8;
      fGatewayFlag: RawUTF8;
      fGatewayAvsResult: RawUTF8;
      fGatewayCvResult: RawUTF8;
      fGatewayScoreResult: RawUTF8;
      fGatewayMessage: RawUTF8;
      fTransactionDate: TDateTime;
      fResultDeclined: Boolean;
      fResultNsf: Boolean;
      fResultBadExpire: Boolean;
      fResultBadCardNumber: Boolean;
    published
      property PaymentServiceTypeEnum: TSQLEnumerationID read fPaymentServiceTypeEnum write fPaymentServiceTypeEnum;
      property OrderPaymentPreference: TSQLOrderPaymentPreferenceID read fOrderPaymentPreference write fOrderPaymentPreference;
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property TransCodeEnum: TSQLEnumerationID read fTransCodeEnum write fTransCodeEnum;
      property Amount: Currency read fAmount write fAmount;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property ReferenceNum: RawUTF8 read fReferenceNum write fReferenceNum;
      property AltReference: RawUTF8 read fAltReference write fAltReference;
      property SubReference: RawUTF8 read fSubReference write fSubReference;
      property GatewayCode: RawUTF8 read fGatewayCode write fGatewayCode;
      property GatewayFlag: RawUTF8 read fGatewayFlag write fGatewayFlag;
      property GatewayAvsResult: RawUTF8 read fGatewayAvsResult write fGatewayAvsResult;
      property GatewayCvResult: RawUTF8 read fGatewayCvResult write fGatewayCvResult;
      property GatewayScoreResult: RawUTF8 read fGatewayScoreResult write fGatewayScoreResult;
      property GatewayMessage: RawUTF8 read fGatewayMessage write fGatewayMessage;
      property TransactionDate: TDateTime read fTransactionDate write fTransactionDate;
      property ResultDeclined: Boolean read fResultDeclined write fResultDeclined;
      property ResultNsf: Boolean read fResultNsf write fResultNsf;
      property ResultBadExpire: Boolean read fResultBadExpire write fResultBadExpire;
      property ResultBadCardNumber: Boolean read fResultBadCardNumber write fResultBadCardNumber;
  end;

  // 139
  TSQLPaymentGroup = class(TSQLRecord)
    private
      fPaymentGroupType: TSQLPaymentGroupTypeID;
      fPaymentGroupName: RawUTF8;
    published
      property PaymentGroupType: TSQLPaymentGroupTypeID read fPaymentGroupType write fPaymentGroupType;
      property PaymentGroupName: RawUTF8 read fPaymentGroupName write fPaymentGroupName;
  end;

  // 140
  TSQLPaymentGroupType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLPaymentGroupTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLPaymentGroupTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 141
  TSQLPaymentGroupMember = class(TSQLRecord)
    private
      fPaymentGroup: TSQLPaymentGroupID;
      fPayment: TSQLPaymentID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property PaymentGroup: TSQLPaymentGroupID read fPaymentGroup write fPaymentGroup;
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 142
  TSQLPayPalPaymentMethod = class(TSQLRecord)
    private
      {fPaymentMethod: TSQLPaymentMethodID;
      fPayer: Integer;
      fExpressCheckoutToken: RawUTF8;
      fPayerStatus: RawUTF8;
      fAvsAddr: Boolean;
      fAvsZip: Boolean;
      fCorrelation: Integer;
      fContactMech: TSQLContactMechID;
      fTransaction: Integer;
    published
      property PaymentMethod: TSQLPaymentMethodID read fPaymentMethod write fPaymentMethod;
      property Payer: Integer read fPayer write fPayer;
      property ExpressCheckoutToken: RawUTF8 read fExpressCheckoutToken write fExpressCheckoutToken;
      property PayerStatus: RawUTF8 read fPayerStatus write fPayerStatus;
      property AvsAddr: Boolean read fAvsAddr write fAvsAddr;
      property AvsZip: Boolean read fAvsZip write fAvsZip;
      property Correlation: Integer read fCorrelation write fCorrelation;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property Transaction: Integer read fTransaction write fTransaction;}
  end;

  // 143
  TSQLValueLinkKey = class(TSQLRecord)
    private
      fMerchant: Integer;
      fPublicKey: TSQLRawBlob;
      fPrivateKey: TSQLRawBlob;
      fExchangeKey: TSQLRawBlob;
      fWorkingKey: TSQLRawBlob;
      fWorkingKeyIndex: TSQLRawBlob;
      fLastWorkingKey: TSQLRawBlob;
      fCreatedDate: TDateTime;
      fCreatedByTerminal: Integer;
      fCreatedByUserLogin: Integer;
      fLastModifiedDate: TDateTime;
      fLastModifiedByTerminal: Integer;
      fLastModifiedByUserLogin: Integer;
    published
      property Merchant: Integer read fMerchant write fMerchant;
      property PublicKey: TSQLRawBlob read fPublicKey write fPublicKey;
      property PrivateKey: TSQLRawBlob read fPrivateKey write fPrivateKey;
      property ExchangeKey: TSQLRawBlob read fExchangeKey write fExchangeKey;
      property WorkingKey: TSQLRawBlob read fWorkingKey write fWorkingKey;
      property WorkingKeyIndex: TSQLRawBlob read fWorkingKeyIndex write fWorkingKeyIndex;
      property LastWorkingKey: TSQLRawBlob read fLastWorkingKey write fLastWorkingKey;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByTerminal: Integer read fCreatedByTerminal write fCreatedByTerminal;
      property CreatedByUserLogin: Integer read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByTerminal: Integer read fLastModifiedByTerminal write fLastModifiedByTerminal;
      property LastModifiedByUserLogin: Integer read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 144
  TSQLPartyTaxAuthInfo = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fTaxAuthGeoId: Integer;
      fTaxAuthPartyId: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPartyTaxId: Integer;
      fIsExempt: Boolean;
      fIsNexus: Boolean;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property TaxAuthGeoId: Integer read fTaxAuthPartyId write fTaxAuthPartyId;
      property TaxAuthPartyId: Integer read fTaxAuthPartyId write fTaxAuthPartyId;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PartyTaxId: Integer read fPartyTaxId write fPartyTaxId;
      property IsExempt: Boolean read fIsExempt write fIsExempt;
      property IsNexus: Boolean read fIsNexus write fIsNexus;
  end;

  // 145
  TSQLTaxAuthority = class(TSQLRecord)
    private
      fTaxAuthGeo: TSQLGeoID;
      fTaxAuthParty: TSQLPartyID;
      fRequireTaxIdForExemption: Boolean;
      fTaxIdFormatPattern: RawUTF8;
      fIncludeTaxInPrice: Currency;
    published
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: TSQLPartyID read fTaxAuthParty write fTaxAuthParty;
      property RequireTaxIdForExemption: Boolean read fRequireTaxIdForExemption write fRequireTaxIdForExemption;
      property TaxIdFormatPattern: RawUTF8 read fTaxIdFormatPattern write fTaxIdFormatPattern;
      property IncludeTaxInPrice: Currency read fIncludeTaxInPrice write fIncludeTaxInPrice;
  end;

  // 146
  TSQLTaxAuthorityAssoc = class(TSQLRecord)
    private
      fTaxAuthGeo: TSQLGeoID;
      fTaxAuthParty: TSQLPartyID;
      fToTaxAuthGeo: TSQLGeoID;
      fToTaxAuthParty: TSQLPartyID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fTaxAuthorityAssocType: TSQLTaxAuthorityAssocTypeID;
    published
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: TSQLPartyID read fTaxAuthParty write fTaxAuthParty;
      property ToTaxAuthGeo: TSQLGeoID read fToTaxAuthGeo write fToTaxAuthGeo;
      property ToTaxAuthParty: TSQLPartyID read fToTaxAuthParty write fToTaxAuthParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property TaxAuthorityAssocType: TSQLTaxAuthorityAssocTypeID read fTaxAuthorityAssocType write fTaxAuthorityAssocType;
  end;

  // 147
  TSQLTaxAuthorityAssocType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 148
  TSQLTaxAuthorityCategory = class(TSQLRecord)
    private
      fTaxAuthGeo: TSQLGeoID;
      fTaxAuthParty: TSQLPartyID;
      fProductCategory: TSQLProductCategoryID;
    published
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: TSQLPartyID read fTaxAuthParty write fTaxAuthParty;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
  end;

  // 149
  TSQLTaxAuthorityGlAccount = class(TSQLRecord)
    private
      fTaxAuthGeo: TSQLGeoID;
      fTaxAuthParty: TSQLPartyID;
      fOrganizationParty: TSQLPartyID;
      fGlAccount: TSQLGlAccountID;
    published
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: TSQLPartyID read fTaxAuthParty write fTaxAuthParty;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 150
  TSQLTaxAuthorityRateProduct = class(TSQLRecord)
    private
      fTaxAuthorityRateSeq: Integer;
      fTaxAuthGeo: TSQLGeoID;
      fTaxAuthParty: TSQLPartyID;
      fTaxAuthorityRateType: TSQLTaxAuthorityRateTypeID;
      fProductStore: TSQLProductStoreID;
      fProductCategory: TSQLProductCategoryID;
      fTitleTransferEnum: Integer;
      fMinItemPrice: Currency;
      fMinPurchase: Currency;
      fTaxShipping: Boolean;
      fTaxPercentage: Double;
      fTaxPromotions: Boolean;
      FDescription: RawUTF8;
      fIsTaxInShippingPrice: Boolean;
    published
      property TaxAuthorityRateSeq: Integer read fTaxAuthorityRateSeq write fTaxAuthorityRateSeq;
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthParty: TSQLPartyID read fTaxAuthParty write fTaxAuthParty;
      property TaxAuthorityRateType: TSQLTaxAuthorityRateTypeID read fTaxAuthorityRateType write fTaxAuthorityRateType;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property TitleTransferEnum: Integer read fTitleTransferEnum write fTitleTransferEnum;
      property MinItemPrice: Currency read fMinItemPrice write fMinItemPrice;
      property MinPurchase: Currency read fMinPurchase write fMinPurchase;
      property TaxShipping: Boolean read fTaxShipping write fTaxShipping;
      property TaxPercentage: Double read fTaxPercentage write fTaxPercentage;
      property TaxPromotions: Boolean read fTaxPromotions write fTaxPromotions;
      property Description: RawUTF8 read fDescription write fDescription;
      property IsTaxInShippingPrice: Boolean read fIsTaxInShippingPrice write fIsTaxInShippingPrice;
  end;

  // 151
  TSQLTaxAuthorityRateType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 152
  TSQLZipSalesRuleLookup = class(TSQLRecord)
    private
      fStateCode: RawUTF8;
      fCity: RawUTF8;
      fCounty: RawUTF8;
      fFromDate: TDateTime;
      fIdCode: RawUTF8;
      fTaxable: RawUTF8;
      fShipCond: RawUTF8;
    published
      property StateCode: RawUTF8 read fStateCode write fStateCode;
      property City: RawUTF8 read fCity write fCity;
      property County: RawUTF8 read fCounty write fCounty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property IdCode: RawUTF8 read fIdCode write fIdCode;
      property Taxable: RawUTF8 read fTaxable write fTaxable;
      property ShipCond: RawUTF8 read fShipCond write fShipCond;
  end;

  // 153
  TSQLZipSalesTaxLookup = class(TSQLRecord)
    private
      fZipCode: RawUTF8;
      fStateCode: RawUTF8;
      fCity: RawUTF8;
      fCounty: RawUTF8;
      fFromDate: TDateTime;
      fCountyFips: RawUTF8;
      fCountyDefault: Boolean;
      fGeneralDefault: Boolean;
      fInsideCity: Boolean;
      fGeoCode: RawUTF8;
      fStateSalesTax: Double;
      fCitySalesTax: Double;
      fCityLocalSalesTax: Double;
      fCountySalesTax: Double;
      fCountyLocalSalesTax: Double;
      fComboSalesTax: Double;
      fStateUseTax: Double;
      fCityUseTax: Double;
      fCityLocalUseTax: Double;
      fCountyUseTax: Double;
      fCountyLocalUseTax: Double;
      fComboUseTax: Double;
    published
      property ZipCode: RawUTF8 read fZipCode write fZipCode;
      property StateCode: RawUTF8 read fStateCode write fStateCode;
      property City: RawUTF8 read fCity write fCity;
      property County: RawUTF8 read fCounty write fCounty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property CountyFips: RawUTF8 read fCountyFips write fCountyFips;
      property CountyDefault: Boolean read fCountyDefault write fCountyDefault;
      property GeneralDefault: Boolean read fGeneralDefault write fGeneralDefault;
      property InsideCity: Boolean read fInsideCity write fInsideCity;
      property GeoCode: RawUTF8 read fGeoCode write fGeoCode;
      property StateSalesTax: Double read fStateSalesTax write fStateSalesTax;
      property CitySalesTax: Double read fCitySalesTax write fCitySalesTax;
      property CityLocalSalesTax: Double read fCityLocalSalesTax write fCityLocalSalesTax;
      property CountySalesTax: Double read fCountySalesTax write fCountySalesTax;
      property CountyLocalSalesTax: Double read fCountyLocalSalesTax write fCountyLocalSalesTax;
      property ComboSalesTax: Double read fComboSalesTax write fComboSalesTax;
      property StateUseTax: Double read fStateUseTax write fStateUseTax;
      property CityUseTax: Double read fCityUseTax write fCityUseTax;
      property CityLocalUseTax: Double read fCityLocalUseTax write fCityLocalUseTax;
      property CountyUseTax: Double read fCountyUseTax write fCountyUseTax;
      property CountyLocalUseTax: Double read fCountyLocalUseTax write fCountyLocalUseTax;
      property ComboUseTax: Double read fComboUseTax write fComboUseTax;
  end;

  // 154
  TSQLPartyGlAccount = class(TSQLRecord)
    private
      fOrganizationParty: TSQLPartyID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fGlAccountType: TSQLGlAccountTypeID;
      fGlAccount: TSQLGlAccountID;
    published
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property GlAccountType: TSQLGlAccountTypeID read fGlAccountType write fGlAccountType;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 155
  TSQLRateType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 156
  TSQLRateAmount = class(TSQLRecord)
    private
      fRateType: TSQLRateTypeID;
      fRateCurrencyUom: TSQLUomID;
      fPeriodType: TSQLPeriodTypeID;
      fWorkEffort: TSQLWorkEffortID;
      fEmplPositionType: TSQLEmplPositionTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fRateAmount: Currency;
    published
      property RateType: TSQLRateTypeID read fRateType write fRateType;
      property RateCurrencyUom: TSQLUomID read fRateCurrencyUom write fRateCurrencyUom;
      property PeriodType: TSQLPeriodTypeID read fPeriodType write fPeriodType;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property EmplPositionType: TSQLEmplPositionTypeID read fEmplPositionType write fEmplPositionType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property RateAmount: Currency read fRateAmount write fRateAmount;
  end;

  // 157
  TSQLPartyRate = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fRateType: TSQLRateTypeID;
      fDefaultRate: Boolean;
      fPercentageUsed: Double;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property RateType: TSQLRateTypeID read fRateType write fRateType;
      property DefaultRate: Boolean read fDefaultRate write fDefaultRate;
      property PercentageUsed: Double read fPercentageUsed write fPercentageUsed;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 158
  TSQLGlAccountCategory = class(TSQLRecord)
    private
      fGlAccountCategoryType: TSQLGlAccountCategoryTypeID;
      fDescription: RawUTF8;
    published
      property GlAccountCategoryType: TSQLGlAccountCategoryTypeID read fGlAccountCategoryType write fGlAccountCategoryType;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 159
  TSQLGlAccountCategoryMember = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccountID;
      fGlAccountCategory: TSQLGlAccountCategoryID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAmountPercentage: Double;
    published
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
      property GlAccountCategory: TSQLGlAccountCategoryID read fGlAccountCategory write fGlAccountCategory;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AmountPercentage: Double read fAmountPercentage write fAmountPercentage;
  end;

  // 160
  TSQLGlAccountCategoryType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

implementation

uses
  Classes, SysUtils;

// applications/datamodel/data/seed/AccountingSeedData.xml

// 1
class procedure TSQLAcctgTransType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLAcctgTransType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLAcctgTransType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','AcctgTransType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update AcctgTransType set parent=(select c.id from AcctgTransType c where c.Encode=AcctgTransType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 2
class procedure TSQLAcctgTransEntryType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLAcctgTransEntryType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLAcctgTransEntryType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','AcctgTransEntryType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update AcctgTransEntryType set parent=(select c.id from AcctgTransEntryType c where c.Encode=AcctgTransEntryType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 3
class procedure TSQLBudgetItemType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLBudgetItemType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLBudgetItemType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','BudgetItemType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update BudgetItemType set parent=(select c.id from BudgetItemType c where c.Encode=BudgetItemType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 4
class procedure TSQLBudgetType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLBudgetType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLBudgetType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','BudgetType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update BudgetType set parent=(select c.id from BudgetType c where c.Encode=BudgetType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 5
class procedure TSQLFinAccountTransType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFinAccountTransType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFinAccountTransType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FinAccountTransType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update FinAccountTransType set parent=(select c.id from FinAccountTransType c where c.Encode=FinAccountTransType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 6
class procedure TSQLFinAccountType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFinAccountType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFinAccountType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FinAccountType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update FinAccountType set parent=(select c.id from FinAccountType c where c.Encode=FinAccountType.ParentEncode);');
    Server.Execute('update FinAccountType set ReplenishEnum=(select c.id from Enumeration c where c.Encode=FinAccountType.ReplenishEnumEncode);');
  finally
    Rec.Free;
  end;
end;

// 7
class procedure TSQLFixedAssetType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFixedAssetType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFixedAssetType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FixedAssetType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update FixedAssetType set parent=(select c.id from FixedAssetType c where c.Encode=FixedAssetType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 8
class procedure TSQLFixedAssetIdentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFixedAssetIdentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFixedAssetIdentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FixedAssetIdentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 9
class procedure TSQLFixedAssetProductType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFixedAssetProductType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFixedAssetProductType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FixedAssetProductType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 10
class procedure TSQLGlAccountClass.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLGlAccountClass;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLGlAccountClass.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','GlAccountClass.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update GlAccountClass set parent=(select c.id from GlAccountClass c where c.Encode=GlAccountClass.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 11
class procedure TSQLGlAccountType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLGlAccountType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLGlAccountType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','GlAccountType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update GlAccountType set parent=(select c.id from GlAccountType c where c.Encode=GlAccountType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 12
class procedure TSQLGlResourceType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLGlResourceType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLGlResourceType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','GlResourceType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 13
class procedure TSQLGlXbrlClass.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLGlXbrlClass;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLGlXbrlClass.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','GlXbrlClass.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 14
class procedure TSQLGlFiscalType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLGlFiscalType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLGlFiscalType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','GlFiscalType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 15
class procedure TSQLGlAccountCategoryType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLGlAccountCategoryType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLGlAccountCategoryType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','GlAccountCategoryType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 16
class procedure TSQLInvoiceContentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLInvoiceContentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLInvoiceContentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','InvoiceContentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update InvoiceContentType set parent=(select c.id from InvoiceContentType c where c.Encode=InvoiceContentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 17
class procedure TSQLInvoiceItemType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLInvoiceItemType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLInvoiceItemType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','InvoiceItemType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update InvoiceItemType set parent=(select c.id from InvoiceItemType c where c.Encode=InvoiceItemType.ParentEncode);');
    Server.Execute('update InvoiceItemType set DefaultGlAccount=(select c.id from GlAccount c where c.Encode=InvoiceItemType.DefaultGlAccountEncode);');
    Server.Execute('update InvoiceItemTypeMap set InvoiceItemType=(select c.id from InvoiceItemType c where c.Encode=InvoiceItemTypeMap.InvoiceItemTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 18
class procedure TSQLInvoiceType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLInvoiceType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLInvoiceType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','InvoiceType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update InvoiceType set parent=(select c.id from InvoiceType c where c.Encode=InvoiceType.ParentEncode);');
    Server.Execute('update InvoiceItemTypeMap set InvoiceType=(select c.id from InvoiceType c where c.Encode=InvoiceItemTypeMap.InvoiceTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 19
class procedure TSQLInvoiceItemAssocType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLInvoiceItemAssocType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLInvoiceItemAssocType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','InvoiceItemAssocType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update InvoiceItemAssocType set parent=(select c.id from InvoiceItemAssocType c where c.Encode=InvoiceItemAssocType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 19
class procedure TSQLInvoiceItemTypeMap.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLInvoiceItemTypeMap;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLInvoiceItemTypeMap.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','InvoiceItemTypeMap.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update InvoiceItemTypeMap set InvoiceType=(select c.id from InvoiceType c where c.Encode=InvoiceItemTypeMap.InvoiceTypeEncode);');
    Server.Execute('update InvoiceItemTypeMap set InvoiceItemType=(select c.id from InvoiceItemType c where c.Encode=InvoiceItemTypeMap.InvoiceItemTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 20
class procedure TSQLPaymentMethodType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLPaymentMethodType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLPaymentMethodType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','PaymentMethodType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 21
class procedure TSQLPaymentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLPaymentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLPaymentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','PaymentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update PaymentType set parent=(select c.id from PaymentType c where c.Encode=PaymentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 22
class procedure TSQLPaymentGroupType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLPaymentGroupType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLPaymentGroupType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','PaymentGroupType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update PaymentGroupType set parent=(select c.id from PaymentGroupType c where c.Encode=PaymentGroupType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 23
class procedure TSQLSettlementTerm.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLSettlementTerm;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLSettlementTerm.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','SettlementTerm.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update SettlementTerm set Uom=(select c.id from Uom c where c.Encode=SettlementTerm.UomEncode);');
  finally
    Rec.Free;
  end;
end;

// 24
class procedure TSQLFixedAssetStdCostType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFixedAssetStdCostType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFixedAssetStdCostType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FixedAssetStdCostType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update FixedAssetStdCostType set parent=(select c.id from FixedAssetStdCostType c where c.Encode=FixedAssetStdCostType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 25
class procedure TSQLTaxAuthorityAssocType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLTaxAuthorityAssocType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLTaxAuthorityAssocType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','TaxAuthorityAssocType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 26
class procedure TSQLTaxAuthorityRateType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLTaxAuthorityRateType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLTaxAuthorityRateType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','TaxAuthorityRateType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 27
class procedure TSQLRateType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLRateType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLRateType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','RateType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 28
class procedure TSQLProductAverageCostType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductAverageCostType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductAverageCostType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductAverageCostType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductAverageCostType set parent=(select c.id from ProductAverageCostType c where c.Encode=ProductAverageCostType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

end.

