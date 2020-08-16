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
      fBudgetType: TSQLBudgetType;
      fCustomTimePeriod: TSQLCustomTimePeriod;
      fComments: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property BudgetType: TSQLBudgetType read fBudgetType write fBudgetType;
      property CustomTimePeriod: TSQLCustomTimePeriod read fCustomTimePeriod write fCustomTimePeriod;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 2
  TSQLBudgetAttribute = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 3
  TSQLBudgetItem = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fBudgetItemSeq: Integer;
      fBudgetItemType: TSQLBudgetItemType;
      fAmount: Currency;
      fPurpose: RawUTF8;
      fJustification: RawUTF8;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property BudgetItemType: TSQLBudgetItemType read fBudgetItemType write fBudgetItemType;
      property Amount: Currency read fAmount write fAmount;
      property Purpose: RawUTF8 read fPurpose write fPurpose;
      property Justification: RawUTF8 read fJustification write fJustification;
  end;

  // 4
  TSQLBudgetItemAttribute = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fBudgetItemSeq: Integer;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 5
  TSQLBudgetItemType = class(TSQLRecord)
    private
      fParent: TSQLBudgetItemType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLBudgetItemType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 6
  TSQLBudgetItemTypeAttr = class(TSQLRecord)
    private
      fBudgetItemType: TSQLBudgetItemType;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property BudgetItemType: TSQLBudgetItemType read fBudgetItemType write fBudgetItemType;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 7
  TSQLBudgetReview = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fParty: TSQLParty;
      fBudgetReviewResultType: TSQLBudgetReviewResultType;
      fReviewDate: TDateTime;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property Party: TSQLParty read fParty write fParty;
      property BudgetReviewResultType: TSQLBudgetReviewResultType read fBudgetReviewResultType write fBudgetReviewResultType;
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
      fBudget: TSQLBudget;
      fRevisionSeq: Integer;
      fDateRevised: TDateTime;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property RevisionSeq: Integer read fRevisionSeq write fRevisionSeq;
      property DateRevised: TDateTime read fDateRevised write fDateRevised;
  end;

  // 10
  TSQLBudgetRevisionImpact = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fBudgetItemSeq: Integer;
      fRevisionSeq: Integer;
      fRevisedAmount: Currency;
      fAddDeleteFlag: TDateTime;
      fRevisionReason: RawUTF8;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property RevisionSeq: Integer read fRevisionSeq write fRevisionSeq;
      property RevisedAmount: Currency read fRevisedAmount write fRevisedAmount;
      property AddDeleteFlag: TDateTime read fAddDeleteFlag write fAddDeleteFlag;
      property RevisionReason: RawUTF8 read fRevisionReason write fRevisionReason;
  end;

  // 11
  TSQLBudgetRole = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fParty: TSQLParty;
      fRoleTypeId: Integer;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property Party: TSQLParty read fParty write fParty;
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
      fBudgetScenario: TSQLBudgetScenario;
      fBudget: TSQLBudget;
      fBudgetItemSeq: Integer;
      fAmountChange: Currency;
      fPercentageChange: Double;
    published
      property BudgetScenario: TSQLBudgetScenario read fBudgetScenario write fBudgetScenario;
      property Budget: TSQLBudget read fBudget write fBudget;
      property BudgetItemSeq: Integer read fBudgetItemSeq write fBudgetItemSeq;
      property AmountChange: Currency read fAmountChange write fAmountChange;
      property PercentageChange: Double read fPercentageChange write fPercentageChange;
  end;

  // 14
  TSQLBudgetScenarioRule = class(TSQLRecord)
    private
      fBudgetScenario: TSQLBudgetScenario;
      fBudgetItemType: TSQLBudgetItemType;
      fAmountChange: Currency;
      fPercentageChange: Double;
    published
      property BudgetScenario: TSQLBudgetScenario read fBudgetScenario write fBudgetScenario;
      property BudgetItemType: TSQLBudgetItemType read fBudgetItemType write fBudgetItemType;
      property AmountChange: Currency read fAmountChange write fAmountChange;
      property PercentageChange: Double read fPercentageChange write fPercentageChange;
  end;

  // 15
  TSQLBudgetStatus = class(TSQLRecord)
    private
      fBudget: TSQLBudget;
      fStatus: TSQLStatusItem;
      fStatusDate: TDateTime;
      fComments: RawUTF8;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property Budget: TSQLBudget read fBudget write fBudget;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property Comments: RawUTF8 read fComments write fComments;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 16
  TSQLBudgetType = class(TSQLRecord)
    private
      fParent: TSQLBudgetType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLBudgetType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 17
  TSQLBudgetTypeAttr = class(TSQLRecord)
    private
      fBudgetType: TSQLBudgetType;
      fAttrName: TSQLBudgetAttribute;
      fDescription: RawUTF8;
    published
      property BudgetType: TSQLBudgetType read fBudgetType write fBudgetType;
      property AttrName: TSQLBudgetAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 18
  TSQLFinAccount = class(TSQLRecord)
    private
      fFinAccountType: TSQLFinAccountType;
      fStatusId: Integer;
      fFinAccountName: RawUTF8;
      fFinAccountCode: RawUTF8;
      fFinAccountPin: RawUTF8;
      fCurrencyUom: TSQLUom;
      fOrganizationParty: TSQLParty;
      fOwnerParty: TSQLParty;
      fPostToGlAccount: TSQLGlAccount;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fIsRefundable: Boolean;
      fReplenishPayment: TSQLPaymentMethod;
      fReplenishLevel: Currency;
      fActualBalance: Currency;
      fAvailableBalance: Currency;
    published
      property FinAccountType: TSQLFinAccountType read fFinAccountType write fFinAccountType;
      property StatusId: Integer read fStatusId write fStatusId;
      property FinAccountName: RawUTF8 read fFinAccountName write fFinAccountName;
      property FinAccountCode: RawUTF8 read fFinAccountCode write fFinAccountCode;
      property FinAccountPin: RawUTF8 read fFinAccountPin write fFinAccountPin;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property OwnerParty: TSQLParty read fOwnerParty write fOwnerParty;
      property PostToGlAccount: TSQLGlAccount read fPostToGlAccount write fPostToGlAccount;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property IsRefundable: Boolean read fIsRefundable write fIsRefundable;
      property ReplenishPayment: TSQLPaymentMethod read fReplenishPayment write fReplenishPayment;
      property ReplenishLevel: Currency read fReplenishLevel write fReplenishLevel;
      property ActualBalance: Currency read fActualBalance write fActualBalance;
      property AvailableBalance: Currency read fAvailableBalance write fAvailableBalance;
  end;

  // 19
  TSQLFinAccountAttribute = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccount;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property FinAccount: TSQLFinAccount read fFinAccount write fFinAccount;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 20
  TSQLFinAccountAuth = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccount;
      fAmount: Currency;
      fCurrencyUom: TSQLUom;
      fAuthorizationDate: TDateTime;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property FinAccount: TSQLFinAccount read fFinAccount write fFinAccount;
      property Amount: Currency read fAmount write fAmount;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property AuthorizationDate: TDateTime read fAuthorizationDate write fAuthorizationDate;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 21
  TSQLFinAccountRole = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccount;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property FinAccount: TSQLFinAccount read fFinAccount write fFinAccount;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 22
  TSQLFinAccountStatus = class(TSQLRecord)
    private
      fFinAccount: TSQLFinAccount;
      fStatus: TSQLStatusItem;
      fStatusDate: TDateTime;
      fStatusEndDate: TDateTime;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property FinAccount: TSQLFinAccount read fFinAccount write fFinAccount;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property StatusEndDate: TDateTime read fStatusEndDate write fStatusEndDate;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 23
  TSQLFinAccountTrans = class(TSQLRecord)
    private
      fFinAccountTransType: TSQLFinAccountTransType;
      fFinAccount: TSQLFinAccount;
      fParty: TSQLParty;
      fGlReconciliation: TSQLGlReconciliation;
      fTransactionDate: TDateTime;
      fEntryDate: TDateTime;
      fAmount: Currency;
      fPayment: TSQLPayment;
      fOrderId: Integer;
      fOrderItemSeqId: Integer;
      fPerformedByParty: TSQLParty;
      fReasonEnum: TSQLEnumeration;
      fComments: RawUTF8;
      fStatus: TSQLStatusItem;
    published
      property FinAccountTransType: TSQLFinAccountTransType read fFinAccountTransType write fFinAccountTransType;
      property FinAccount: TSQLFinAccount read fFinAccount write fFinAccount;
      property Party: TSQLParty read fParty write fParty;
      property GlReconciliation: TSQLGlReconciliation read fGlReconciliation write fGlReconciliation;
      property TransactionDate: TDateTime read fTransactionDate write fTransactionDate;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property Amount: Currency read fAmount write fAmount;
      property Payment: TSQLPayment read fPayment write fPayment;
      property OrderId: Integer read fOrderId write fOrderId;
      property OrderItemSeqId: Integer read fOrderItemSeqId write fOrderItemSeqId;
      property PerformedByParty: TSQLParty read fPerformedByParty write fPerformedByParty;
      property ReasonEnum: TSQLEnumeration read fReasonEnum write fReasonEnum;
      property Comments: RawUTF8 read fComments write fComments;
      property Status: TSQLStatusItem read fStatus write fStatus;
  end;

  // 24
  TSQLFinAccountTransAttribute = class(TSQLRecord)
    private
      fFinAccountTrans: TSQLFinAccountTrans;
      fAttrName: TSQLFinAccountTransTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property FinAccountTrans: TSQLFinAccountTrans read fFinAccountTrans write fFinAccountTrans;
      property AttrName: TSQLFinAccountTransTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 25
  TSQLFinAccountTransType = class(TSQLRecord)
    private
      fParent: TSQLFinAccountTransType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLFinAccountTransType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 26
  TSQLFinAccountTransTypeAttr = class(TSQLRecord)
    private
      fFinAccountTransType: TSQLFinAccountTransType;
      fAttrName: TSQLFinAccountTransAttribute;
      fDescription: RawUTF8;
    published
      property FinAccountTransType: TSQLFinAccountTransType read fFinAccountTransType write fFinAccountTransType;
      property AttrName: TSQLFinAccountTransAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
  end;

  // 27
  TSQLFinAccountType = class(TSQLRecord)
    private
      fParent: TSQLFinAccountType;
      fReplenishEnum: TSQLEnumeration;
      fIsRefundable: Boolean;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLFinAccountType read fParent write fParent;
      property ReplenishEnum: TSQLEnumeration read fReplenishEnum write fReplenishEnum;
      property IsRefundable: Boolean read fIsRefundable write fIsRefundable;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 28
  TSQLFinAccountTypeAttr = class(TSQLRecord)
    private
      fFinAccountType: TSQLFinAccountType;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property FinAccountType: TSQLFinAccountType read fFinAccountType write fFinAccountType;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 29
  TSQLFinAccountTypeGlAccount = class(TSQLRecord)
    private
      fFinAccountType: TSQLFinAccountType;
      fOrganizationParty: TSQLParty;
      fGlAccount: TSQLGlAccount;
    published
      property FinAccountType: TSQLFinAccountType read fFinAccountType write fFinAccountType;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
  end;

  // 30
  TSQLFixedAsset = class(TSQLRecord)
    private
      fFixedAssetType: TSQLFixedAssetType;
      fParentFixedAsset: TSQLFixedAsset;
      fInstanceOfProduct: TSQLProduct;
      fClassEnum: TSQLEnumeration;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFixedAssetName: RawUTF8;
      fAcquireOrder: TSQLOrderHeader;
      fAcquireOrderItemSeq: Integer;
      fDateAcquired: TDateTime;
      fDateLastServiced: TDateTime;
      fDateNextService: TDateTime;
      fExpectedEndOfLife: TDateTime;
      fActualEndOfLife: TDateTime;
      fProductionCapacity: Double;
      fUom: TSQLUom;
      fCalendar: TSQLTechDataCalendar;
      fSerialNumber: RawUTF8;
      fLocatedAtFacility: TSQLFacility;
      fLocatedAtLocationSeq: Integer;
      fSalvageValue: Currency;
      fDepreciation: Currency;
      fPurchaseCost: Currency;
      fPurchaseCostUom: TSQLUom;
    published
      property FixedAssetType: TSQLFixedAssetType read fFixedAssetType write fFixedAssetType;
      property ParentFixedAsset: TSQLFixedAsset read fParentFixedAsset write fParentFixedAsset;
      property InstanceOfProduct: TSQLProduct read fInstanceOfProduct write fInstanceOfProduct;
      property ClassEnum: TSQLEnumeration read fClassEnum write fClassEnum;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FixedAssetName: RawUTF8 read fFixedAssetName write fFixedAssetName;
      property AcquireOrder: TSQLOrderHeader read fAcquireOrder write fAcquireOrder;
      property AcquireOrderItemSeq: Integer read fAcquireOrderItemSeq write fAcquireOrderItemSeq;
      property DateAcquired: TDateTime read fDateAcquired write fDateAcquired;
      property DateLastServiced: TDateTime read fDateLastServiced write fDateLastServiced;
      property DateNextService: TDateTime read fDateNextService write fDateNextService;
      property ExpectedEndOfLife: TDateTime read fExpectedEndOfLife write fExpectedEndOfLife;
      property ActualEndOfLife: TDateTime read fActualEndOfLife write fActualEndOfLife;
      property ProductionCapacity: Double read fProductionCapacity write fProductionCapacity;
      property Uom: TSQLUom read fUom write fUom;
      property Calendar: TSQLTechDataCalendar read fCalendar write fCalendar;
      property SerialNumber: RawUTF8 read fSerialNumber write fSerialNumber;
      property LocatedAtFacility: TSQLFacility read fLocatedAtFacility write fLocatedAtFacility;
      property LocatedAtLocationSeq: Integer read fLocatedAtLocationSeq write fLocatedAtLocationSeq;
      property SalvageValue: Currency read fSalvageValue write fSalvageValue;
      property Depreciation: Currency read fDepreciation write fDepreciation;
      property PurchaseCost: Currency read fPurchaseCost write fPurchaseCost;
      property PurchaseCostUom: TSQLUom read fPurchaseCostUom write fPurchaseCostUom;
  end;

  // 31
  TSQLFixedAssetAttribute = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fAttrName: TSQLFixedAssetTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property AttrName: TSQLFixedAssetTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 32
  TSQLFixedAssetDepMethod = class(TSQLRecord)
    private
      fDepreciationCustomMethod: TSQLCustomMethod;
      fFixedAsset: TSQLFixedAsset;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property DepreciationCustomMethod: TSQLCustomMethod read fDepreciationCustomMethod write fDepreciationCustomMethod;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 33
  TSQLFixedAssetGeoPoint = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fGeoPoint: TSQLGeoPoint;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property GeoPoint: TSQLGeoPoint read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 34
  TSQLFixedAssetIdent = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fFixedAssetIdentType: TSQLFixedAssetIdentType;
      fIdValue: RawUTF8;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property FixedAssetIdentType: TSQLFixedAssetIdentType read fFixedAssetIdentType write fFixedAssetIdentType;
      property IdValue: RawUTF8 read fIdValue write fIdValue;
  end;

  // 35
  TSQLFixedAssetIdentType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 36
  TSQLFixedAssetMaint = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fMaintHistSeq: Integer;
      fStatus: TSQLStatusItem;
      fProductMaintType: TSQLProductMaintType;
      fProductMaintSeq: Integer;
      fScheduleWorkEffort: TSQLWorkEffort;
      fIntervalQuantity: Double;
      fIntervalUom: TSQLUom;
      fProductMeterType: TSQLProductMeterType;
      fPurchaseOrder: TSQLOrderHeader;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property ProductMaintType: TSQLProductMaintType read fProductMaintType write fProductMaintType;
      property ProductMaintSeq: Integer read fProductMaintSeq write fProductMaintSeq;
      property ScheduleWorkEffort: TSQLWorkEffort read fScheduleWorkEffort write fScheduleWorkEffort;
      property IntervalQuantity: Double read fIntervalQuantity write fIntervalQuantity;
      property IntervalUom: TSQLUom read fIntervalUom write fIntervalUom;
      property ProductMeterType: TSQLProductMeterType read fProductMeterType write fProductMeterType;
      property PurchaseOrder: TSQLOrderHeader read fPurchaseOrder write fPurchaseOrder;
  end;

  // 37
  TSQLFixedAssetMeter = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fProductMeterType: TSQLProductMeterType;
      fReadingDate: TDateTime;
      fMeterValue: Double;
      fReadingReasonEnum: Integer;
      fMaintHistSeq: Integer;
      fWorkEffort: Integer;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property ProductMeterType: TSQLProductMeterType read fProductMeterType write fProductMeterType;
      property ReadingDate: TDateTime read fReadingDate write fReadingDate;
      property MeterValue: Double read fMeterValue write fMeterValue;
      property ReadingReasonEnum: Integer read fReadingReasonEnum write fReadingReasonEnum;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property WorkEffort: Integer read fWorkEffort write fWorkEffort;
  end;

  // 38
  TSQLFixedAssetProduct = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fProduct: TSQLProduct;
      fFixedAssetProductType: TSQLFixedAssetProductType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fQuantity: Double;
      fQuantityUom: TSQLUom;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property Product: TSQLProduct read fProduct write fProduct;
      property FixedAssetProductType: TSQLFixedAssetProductType read fFixedAssetProductType write fFixedAssetProductType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Quantity: Double read fQuantity write fQuantity;
      property QuantityUom: TSQLUom read fQuantityUom write fQuantityUom;
  end;

  // 39
  TSQLFixedAssetProductType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 40
  TSQLFixedAssetTypeGlAccount = class(TSQLRecord)
    private
      fFixedAssetType: TSQLFixedAssetType;
      fFixedAsset: TSQLFixedAsset;
      fOrganizationParty: TSQLParty;
      fAssetGlAccount: TSQLGlAccount;
      fAccDepGlAccount: TSQLGlAccount;
      fDepGlAccount: TSQLGlAccount;
      fProfitGlAccount: TSQLGlAccount;
      fLossGlAccount: TSQLGlAccount;
    published
      property FixedAssetType: TSQLFixedAssetType read fFixedAssetType write fFixedAssetType;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property AssetGlAccount: TSQLGlAccount read fAssetGlAccount write fAssetGlAccount;
      property AccDepGlAccount: TSQLGlAccount read fAccDepGlAccount write fAccDepGlAccount;
      property DepGlAccount: TSQLGlAccount read fDepGlAccount write fDepGlAccount;
      property ProfitGlAccount: TSQLGlAccount read fProfitGlAccount write fProfitGlAccount;
      property LossGlAccount: TSQLGlAccount read fLossGlAccount write fLossGlAccount;
  end;

  // 41
  TSQLFixedAssetRegistration = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fRegistrationDate: TDateTime;
      fGovAgencyParty: TSQLParty;
      fRegistrationNumber: RawUTF8;
      fLicenseNumber: RawUTF8;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property RegistrationDate: TDateTime read fRegistrationDate write fRegistrationDate;
      property GovAgencyParty: TSQLParty read fGovAgencyParty write fGovAgencyParty;
      property RegistrationNumber: RawUTF8 read fRegistrationNumber write fRegistrationNumber;
      property LicenseNumber: RawUTF8 read fLicenseNumber write fLicenseNumber;
  end;

  // 42
  TSQLFixedAssetStdCost = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fFixedAssetStdCostType: TSQLFixedAssetStdCostType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAmountUom: TSQLUom;
      fAmount: Currency;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property FixedAssetStdCostType: TSQLFixedAssetStdCostType read fFixedAssetStdCostType write fFixedAssetStdCostType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AmountUom: TSQLUom read fAmountUom write fAmountUom;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 43
  TSQLFixedAssetStdCostType = class(TSQLRecord)
    private
      fParent: TSQLFixedAssetStdCostType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLFixedAssetStdCostType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 44
  TSQLFixedAssetType = class(TSQLRecord)
    private
      fParent: TSQLFixedAssetType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLFixedAssetType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 45
  TSQLFixedAssetTypeAttr = class(TSQLRecord)
    private
      fFixedAssetType: TSQLFixedAssetType;
      fAttrName: TSQLCostComponentAttribute;
      fDescription: RawUTF8;
    published
      property FixedAssetType: TSQLFixedAssetType read fFixedAssetType write fFixedAssetType;
      property AttrName: TSQLCostComponentAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 46
  TSQLPartyFixedAssetAssignment = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFixedAsset: TSQLFixedAsset;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAllocatedDate: TDateTime;
      fStatus: TSQLStatusItem;
      fComments: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AllocatedDate: TDateTime read fAllocatedDate write fAllocatedDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 47
  TSQLFixedAssetMaintOrder = class(TSQLRecord)
    private
      fFixedAsset: TSQLFixedAsset;
      fMaintHistSeq: Integer;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
    published
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
  end;

  // 48
  TSQLAccommodationClass = class(TSQLRecord)
    private
      fParent: TSQLAccommodationClass;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLAccommodationClass read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 49
  TSQLAccommodationSpot = class(TSQLRecord)
    private
      fAccommodationClass: TSQLAccommodationClass;
      fFixedAsset: TSQLFixedAsset;
      fNumberOfSpaces: Integer;
      FDescription: RawUTF8;
    published
      property AccommodationClass: TSQLAccommodationClass read fAccommodationClass write fAccommodationClass;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property NumberOfSpaces: Integer read fNumberOfSpaces write fNumberOfSpaces;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 50
  TSQLAccommodationMap = class(TSQLRecord)
    private
      fAccommodationClass: TSQLAccommodationClass;
      fFixedAsset: TSQLFixedAsset;
      fAccommodationMapType: TSQLAccommodationMapType;
      fNumberOfSpaces: Integer;
    published
      property AccommodationClass: TSQLAccommodationClass read fAccommodationClass write fAccommodationClass;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property AccommodationMapType: TSQLAccommodationMapType read fAccommodationMapType write fAccommodationMapType;
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
      fInvoiceType: TSQLInvoiceType;
      fPartyIdFrom: TSQLParty;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fStatus: TSQLStatusItem;
      fBillingAccount: TSQLBillingAccount;
      fContactMech: TSQLContactMech;
      fInvoiceDate: TDateTime;
      fDueDate: TDateTime;
      fPaidDate: TDateTime;
      fInvoiceMessage: RawUTF8;
      fReferenceNumber: RawUTF8;
      fDescription: RawUTF8;
      fCurrencyUom: TSQLUom;
      fRecurrenceInfo: TSQLRecurrenceInfo;
    published
      property InvoiceType: TSQLInvoiceType read fInvoiceType write fInvoiceType;
      property PartyIdFrom: TSQLParty read fPartyIdFrom write fPartyIdFrom;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property BillingAccount: TSQLBillingAccount read fBillingAccount write fBillingAccount;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property InvoiceDate: TDateTime read fInvoiceDate write fInvoiceDate;
      property DueDate: TDateTime read  write fDueDate;
      property PaidDate: TDateTime read fPaidDate write fPaidDate;
      property InvoiceMessage: RawUTF8 read fInvoiceMessage write fInvoiceMessage;
      property ReferenceNumber: RawUTF8 read fReferenceNumber write fReferenceNumber;
      property Description: RawUTF8 read fDescription write fDescription;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property RecurrenceInfo: TSQLRecurrenceInfo read fRecurrenceInfo write fRecurrenceInfo;
  end;

  // 53
  TSQLInvoiceAttribute = class(TSQLRecord)
    private
      fInvoice: TSQLInvoice;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 54
  TSQLInvoiceContent = class(TSQLRecord)
    private
      fInvoice: TSQLInvoice;
      fInvoiceContentType: TSQLInvoiceContentType;
      fContent: TSQLContent;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceContentType: TSQLInvoiceContentType read fInvoiceContentType write fInvoiceContentType;
      property Content: TSQLContent read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 55
  TSQLInvoiceContentType = class(TSQLRecord)
    private
      fParent: TSQLInvoiceContentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLInvoiceContentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 56
  TSQLInvoiceContactMech = class(TSQLRecord)
    private
      fInvoice: TSQLInvoice;
      fContactMechPurposeType: TSQLContactMechPurposeType;
      fContactMech: TSQLContactMech;
    published
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property ContactMechPurposeType: TSQLContactMechPurposeType read fContactMechPurposeType write fContactMechPurposeType;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
  end;

  // 57
  TSQLInvoiceItem = class(TSQLRecord)
    private
      fInvoice: TSQLInvoice;
      fInvoiceItemSeq: Integer;
      fInvoiceItemType: TSQLInvoiceItemType;
      fOverrideGlAccount: TSQLGlAccount;
      fOverrideOrgParty: TSQLParty;
      fInventoryItem: TSQLInventoryItem;
      fProduct: TSQLProduct;
      fProductFeature: TSQLProductFeature;
      fParentInvoice: TSQLInvoiceItem;
      fParentInvoiceItemSeq: Integer;
      fUom: TSQLUom;
      fTaxableFlag: Boolean;
      fQuantity: Double;
      fAmount: Currency;
      fDescription: RawUTF8;
      fTaxAuthParty: TSQLParty;
      fTaxAuthGeo: TSQLGeo;
      fTaxAuthorityRateSeq: TSQLTaxAuthorityRateProduct;
      fSalesOpportunity: TSQLSalesOpportunity;
    published
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property InvoiceItemType: TSQLInvoiceItemType read fInvoiceItemType write fInvoiceItemType;
      property OverrideGlAccount: TSQLGlAccount read fOverrideGlAccount write fOverrideGlAccount;
      property OverrideOrgParty: TSQLParty read fOverrideOrgParty write fOverrideOrgParty;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property ParentInvoice: TSQLInvoiceItem read fParentInvoice write fParentInvoice;
      property ParentInvoiceItemSeq: Integer read fParentInvoiceItemSeq write fParentInvoiceItemSeq;
      property Uom: TSQLUom read fUom write fUom;
      property TaxableFlag: Boolean read fTaxableFlag write fTaxableFlag;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
      property Description: RawUTF8 read fDescription write fDescription;
      property TaxAuthParty: TSQLParty read fTaxAuthParty write fTaxAuthParty;
      property TaxAuthGeo: TSQLGeo read fTaxAuthGeo write fTaxAuthGeo;
      property TaxAuthorityRateSeq: TSQLTaxAuthorityRateProduct read fTaxAuthorityRateSeq write fTaxAuthorityRateSeq;
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
  end;

  // 58
  TSQLInvoiceItemAssoc = class(TSQLRecord)
    private
      fInvoiceFrom: TSQLInvoiceItem;
      fInvoiceItemSeqFrom: Integer;
      fInvoiceTo: TSQLInvoiceItem;
      fInvoiceItemSeqTo: Integer;
      fInvoiceItemAssocType: TSQLInvoiceItemAssocType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPartyFrom: TSQLParty;
      fPartyTo: TSQLParty;
      fQuantity: Double;
      fAmount: Currency;
    published
      property InvoiceFrom: TSQLInvoiceItem read fInvoiceFrom write fInvoiceFrom;
      property InvoiceItemSeqFrom: Integer read fInvoiceItemSeqFrom write fInvoiceItemSeqFrom;
      property InvoiceTo: TSQLInvoiceItem read fInvoiceTo write fInvoiceTo;
      property InvoiceItemSeqTo: Integer read fInvoiceItemSeqTo write fInvoiceItemSeqTo;
      property InvoiceItemAssocType: TSQLInvoiceItemAssocType read fInvoiceItemAssocType write fInvoiceItemAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PartyFrom: TSQLParty read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLParty read fPartyTo write fPartyTo;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Currency read fAmount write fAmount;
  end;

  // 59
  TSQLInvoiceItemAssocType = class(TSQLRecord)
    private
      fParent: TSQLInvoiceItemAssocType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLInvoiceItemAssocType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 60
  TSQLInvoiceItemAttribute = class(TSQLRecord)
    private
      fInvoice: TSQLInvoiceItem;
      fInvoiceItemSeq: Integer;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Invoice: TSQLInvoiceItem read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 61
  TSQLInvoiceItemType = class(TSQLRecord)
    private
      fInvoiceItemType: TSQLInvoiceItemType;
      fParent: TSQLInvoiceItemType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fDefaultGlAccount: TSQLGlAccount;
    published
      property InvoiceItemType: TSQLInvoiceItemType read fInvoiceItemType write fInvoiceItemType;
      property Parent: TSQLInvoiceItemType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property DefaultGlAccount: TSQLGlAccount read fDefaultGlAccount write fDefaultGlAccount;
  end;

  // 62
  TSQLInvoiceItemTypeAttr = class(TSQLRecord)
    private
      fInvoiceItemType: TSQLInvoiceItemType;
      fAttrName: TSQLCostComponentTypeAttr;
      fDescription: RawUTF8;
    published
      property InvoiceItemType: TSQLInvoiceItemType read fInvoiceItemType write fInvoiceItemType;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 63
  TSQLInvoiceItemTypeGlAccount = class(TSQLRecord)
    private
      fInvoiceItemType: TSQLInvoiceItemType;
      fOrganizationParty: TSQLParty;
      fGlAccount: TSQLGlAccount;
    published
      property InvoiceItemType: TSQLInvoiceItemType read fInvoiceItemType write fInvoiceItemType;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
  end;

  // 64
  TSQLInvoiceItemTypeMap = class(TSQLRecord)
    private
      fInvoiceType: TSQLInvoiceType;
      fInvoiceItemType: TSQLInvoiceItemType;
    published
      property InvoiceType: TSQLInvoiceType read fInvoiceType write fInvoiceType;
      property InvoiceItemType: TSQLInvoiceItemType read fInvoiceItemType write fInvoiceItemType;
  end;

  // 65
  TSQLInvoiceRole = class(TSQLRecord)
    private
      fInvoice: TSQLInvoice;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fDatetimePerformed: TDateTime;
      fPercentage: Double;
    published
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property DatetimePerformed: TDateTime read fDatetimePerformed write fDatetimePerformed;
      property Percentage: Double read fPercentage write fPercentage;
  end;

  // 66
  TSQLInvoiceStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fInvoice: TSQLInvoice;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 67
  TSQLInvoiceTerm = class(TSQLRecord)
    private
      fTermType: TSQLTermType;
      fInvoice: TSQLInvoice;
      fInvoiceItemSeq: Integer;
      fTermValue: Currency;
      fTermDays: Integer;
      fTextValue: RawUTF8;
      fDescription: RawUTF8;
      fUom: TSQLUom;
    published
      property TermType: TSQLTermType read fTermType write fTermType;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property TermValue: Currency read fTermValue write fTermValue;
      property TermDays: Integer read fTermDays write fTermDays;
      property TextValue: RawUTF8 read fTextValue write fTextValue;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUom read fUom write fUom;
  end;

  // 68
  TSQLInvoiceTermAttribute = class(TSQLRecord)
    private
      fInvoiceTerm: TSQLInvoiceTerm;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property InvoiceTerm: TSQLInvoiceTerm read fInvoiceTerm write fInvoiceTerm;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 69
  TSQLInvoiceType = class(TSQLRecord)
    private
      fParent: TSQLInvoiceType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLInvoiceType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 70
  TSQLInvoiceTypeAttr = class(TSQLRecord)
    private
      fInvoiceType: TSQLInvoiceType;
      fAttrName: TSQLCostComponentTypeAttr;
      fDescription: RawUTF8;
    published
      property InvoiceType: TSQLInvoiceType read fInvoiceType write fInvoiceType;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 71
  TSQLInvoiceNote = class(TSQLRecord)
    private
      fInvoice: TSQLInvoice;
      fNote: TSQLNoteData;
    published
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property Note: TSQLNoteData read fNote write fNote;
  end;

  // 72
  TSQLAcctgTrans = class(TSQLRecord)
    private
      fAcctgTransType: TSQLAcctgTransType;
      fDescription: RawUTF8;
      fTransactionDate: TDateTime;
      fIsPosted: Boolean;
      fPostedDate: TDateTime;
      fScheduledPostingDate TDateTime;
      fGlJournal: TSQLGlJournal;
      fGlFiscalType: TSQLGlFiscalType;
      fVoucherRef: RawUTF8;
      fVoucherDate: TDateTime;
      fGroupStatus: TSQLStatusItem;
      fFixedAsset: TSQLFixedAsset;
      fInventoryItem: TSQLInventoryItem;
      fPhysicalInventory: TSQLPhysicalInventory;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fInvoice: TSQLInvoice;
      fPayment: TSQLPayment;
      fFinAccountTrans: TSQLFinAccountTrans;
      fShipment: TSQLShipment;
      fReceipt: TSQLShipmentReceipt;
      fWorkEffort: TSQLWorkEffort;
      fTheirAcctgTrans: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property AcctgTransType: TSQLAcctgTransType read fAcctgTransType write fAcctgTransType;
      property Description: RawUTF8 read fDescription write fDescription;
      property TransactionDate: TDateTime read fTransactionDate write fTransactionDate;
      property IsPosted: Boolean read fIsPosted write fIsPosted;
      property PostedDate: TDateTime read fPostedDate write fPostedDate;
      property ScheduledPostingDate TDateTime read fScheduledPostingDate write fScheduledPostingDate;
      property GlJournal: TSQLGlJournal read fGlJournal write fGlJournal;
      property GlFiscalType: TSQLGlFiscalType read fGlFiscalType write fGlFiscalType;
      property VoucherRef: RawUTF8 read fVoucherRef write fVoucherRef;
      property VoucherDate: TDateTime read fVoucherDate write fVoucherDate;
      property GroupStatus: TSQLStatusItem read fGroupStatus write fGroupStatus;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property PhysicalInventory: TSQLPhysicalInventory read fPhysicalInventory write fPhysicalInventory;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property Payment: TSQLPayment read fPayment write fPayment;
      property FinAccountTrans: TSQLFinAccountTrans read fFinAccountTrans write fFinAccountTrans;
      property Shipment: TSQLShipment read fShipment write fShipment;
      property Receipt: TSQLShipmentReceipt read fReceipt write fReceipt;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property TheirAcctgTrans: Integer read fTheirAcctgTrans write fTheirAcctgTrans;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 73
  TSQLAcctgTransAttribute = class(TSQLRecord)
    private
      fAcctgTrans: TSQLAcctgTrans;
      fAttrName: TSQLInventoryItemTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property AcctgTrans: TSQLAcctgTrans read fAcctgTrans write fAcctgTrans;
      property AttrName: TSQLInventoryItemTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 74
  TSQLAcctgTransEntry = class(TSQLRecord)
    private
      fAcctgTrans: TSQLAcctgTrans;
      fAcctgTransEntrySeq: Integer;
      fAcctgTransEntryType: TSQLAcctgTransEntryType;
      fDescription: RawUTF8;
      fVoucherRef: RawUTF8;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fTheirParty: TSQLParty;
      fProduct: TSQLProduct;
      fTheirProduct: TSQLProduct;
      fInventoryItem: TSQLInventoryItem;
      fGlAccountType: TSQLGlAccountType;
      fGlAccount: TSQLGlAccount;
      fOrganizationParty: TSQLParty;
      fAmount: Currency;
      fCurrencyUom: TSQLUom;
      fOrigAmount: Currency;
      fOrigCurrencyUom: TSQLUom;
      fDebitCreditFlag: Boolean;
      fDueDate: TDateTime;
      fGroup: Integer;
      fTax: Integer;
      fReconcileStatus: TSQLStatusItem;
      fSettlementTerm: TSQLSettlementTerm;
      fIsSummary: Boolean;
    published
      property AcctgTrans: TSQLAcctgTrans read fAcctgTrans write fAcctgTrans;
      property AcctgTransEntrySeq: Integer read fAcctgTransEntrySeq write fAcctgTransEntrySeq;
      property AcctgTransEntryType: TSQLAcctgTransEntryType read fAcctgTransEntryType write fAcctgTransEntryType;
      property Description: RawUTF8 read fDescription write fDescription;
      property VoucherRef: RawUTF8 read fVoucherRef write fVoucherRef;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property TheirParty: TSQLParty read fTheirParty write fTheirParty;
      property Product: TSQLProduct read fProduct write fProduct;
      property TheirProduct: TSQLProduct read fTheirProduct write fTheirProduct;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property GlAccountType: TSQLGlAccountType read fGlAccountType write fGlAccountType;
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property Amount: Currency read fAmount write fAmount;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property OrigAmount: Currency read fOrigAmount write fOrigAmount;
      property OrigCurrencyUom: TSQLUom read fOrigCurrencyUom write fOrigCurrencyUom;
      property DebitCreditFlag: Boolean read fDebitCreditFlag write fDebitCreditFlag;
      property DueDate: TDateTime read fDueDate write fDueDate;
      property Group: Integer read fGroup write fGroup;
      property Tax: Integer read fTax write fTax;
      property ReconcileStatus: TSQLStatusItem read fReconcileStatus write fReconcileStatus;
      property SettlementTerm: TSQLSettlementTerm read fSettlementTerm write fSettlementTerm;
      property IsSummary: Boolean read fIsSummary write fIsSummary;
  end;

  // 75
  TSQLAcctgTransEntryType = class(TSQLRecord)
    private
      fParent: TSQLAcctgTransEntryType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLAcctgTransEntryType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 76
  TSQLAcctgTransType = class(TSQLRecord)
    private
      fParent: TSQLAcctgTransType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLAcctgTransType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 77
  TSQLAcctgTransTypeAttr = class(TSQLRecord)
    private
      fAcctgTransType: TSQLAcctgTransType;
      fAttrName: TSQLAcctgTransAttribute;
      FDescription: RawUTF8;
    published
      property AcctgTransType: TSQLAcctgTransType read fAcctgTransType write fAcctgTransType;
      property AttrName: TSQLAcctgTransAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 78
  TSQLGlAccount = class(TSQLRecord)
    private
      fGlAccountType: TSQLGlAccountType;
      fGlAccountClass: TSQLGlAccountClass;
      fGlResourceType: TSQLGlResourceType;
      fGlXbrlClass: TSQLGlXbrlClass;
      fParentGlAccount: TSQLGlAccount;
      fAccountCode: RawUTF8;
      fAccountName: RawUTF8;
      fDescription: RawUTF8;
      fProduct: TSQLProduct;
      fExternalId: Integer;
    published
      property GlAccountType: TSQLGlAccountType read fGlAccountType write fGlAccountType;
      property GlAccountClass: TSQLGlAccountClass read fGlAccountClass write fGlAccountClass;
      property GlResourceType: TSQLGlResourceType read fGlResourceType write fGlResourceType;
      property GlXbrlClass: TSQLGlXbrlClass read fGlXbrlClass write fGlXbrlClass;
      property ParentGlAccount: TSQLGlAccount read fParentGlAccount write fParentGlAccount;
      property AccountCode: RawUTF8 read fAccountCode write fAccountCode;
      property AccountName: RawUTF8 read fAccountName write fAccountName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Product: TSQLProduct read fProduct write fProduct;
      property ExternalId: Integer read fExternalId write fExternalId;
  end;

  // 79
  TSQLGlAccountClass = class(TSQLRecord)
    private
      fParentClass: TSQLGlAccountClass;
      fDescription: RawUTF8;
      fIsAssetClass: Boolean;
    published
      property ParentClass: TSQLGlAccountClass read fParentClass write fParentClass;
      property Description: RawUTF8 read fDescription write fDescription;
      property IsAssetClass: Boolean read fIsAssetClass write fIsAssetClass;
  end;

  // 80
  TSQLGlAccountGroup = class(TSQLRecord)
    private
      fGlAccountGroupType: TSQLGlAccountGroupType;
      fDescription: RawUTF8;
    published
      property GlAccountGroupType: TSQLGlAccountGroupType read fGlAccountGroupType write fGlAccountGroupType;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 81
  TSQLGlAccountGroupMember = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccount;
      fGlAccountGroupType: TSQLGlAccountGroupType;
      fGlAccountGroup: TSQLGlAccountGroup;
    published
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
      property GlAccountGroupType: TSQLGlAccountGroupType read fGlAccountGroupType write fGlAccountGroupType;
      property GlAccountGroup: TSQLGlAccountGroup read fGlAccountGroup write fGlAccountGroup;
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
      fGlAccount: TSQLGlAccount;
      fOrganizationParty: TSQLParty;
      fCustomTimePeriod: TSQLCustomTimePeriod;
      fOpeningBalance: Currency;
      fPostedDebits: Currency;
      fPostedCredits: Currency;
      fEndingBalance: Currency;
    published
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property CustomTimePeriod: TSQLCustomTimePeriod read fCustomTimePeriod write fCustomTimePeriod;
      property OpeningBalance: Currency read fOpeningBalance write fOpeningBalance;
      property PostedDebits: Currency read fPostedDebits write fPostedDebits;
      property PostedCredits: Currency read fPostedCredits write fPostedCredits;
      property EndingBalance: Currency read fEndingBalance write fEndingBalance;
  end;

  // 84
  TSQLGlAccountOrganization = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccount;
      fOrganizationParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
   published
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 85
  TSQLGlAccountRole = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccount;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
   published
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 86
  TSQLGlAccountType = class(TSQLRecord)
    private
      fParent: TSQLGlAccountType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLGlAccountType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 87
  TSQLGlAccountTypeDefault = class(TSQLRecord)
    private
      fGlAccountType: TSQLGlAccountType;
      fOrganizationParty: TSQLParty;
      fGlAccount: TSQLGlAccount;
    published
      property GlAccountType: TSQLGlAccountType read fGlAccountType write fGlAccountType;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
  end;

  // 88
  TSQLGlBudgetXref = class(TSQLRecord)
    private
      fGlAccount: TSQLGlAccount;
      fBudgetItemType: TSQLBudgetItemType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAllocationPercentage: Double;
    published
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
      property BudgetItemType: TSQLBudgetItemType read fBudgetItemType write fBudgetItemType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AllocationPercentage: Double read fAllocationPercentage write fAllocationPercentage;
  end;

  // 89
  TSQLGlFiscalType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 90
  TSQLGlJournal = class(TSQLRecord)
    private
      fGlJournalName: RawUTF8;
      fOrganizationParty: TSQLParty;
      fIsPosted: Boolean;
      fPostedDate: TDateTime;
    published
      property GlJournalName: RawUTF8 read fGlJournalName write fGlJournalName;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property IsPosted: Boolean read fIsPosted write fIsPosted;
      property PostedDate: TDateTime read fPostedDate write fPostedDate;
  end;

  // 91
  TSQLGlReconciliation = class(TSQLRecord)
    private
      fglReconciliationName: RawUTF8;
      FDescription: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
      fGlAccount: TSQLGlAccount;
      fStatus: TSQLStatusItem;
      fOrganizationParty: TSQLParty;
      fReconciledBalance: Currency;
      fOpeningBalance: Currency;
      fReconciledDate: TDateTime;
    published
      property  read  write ;
      property Description: RawUTF8 read FDescription write FDescription;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property ReconciledBalance: Currency read fReconciledBalance write fReconciledBalance;
      property OpeningBalance: Currency read fOpeningBalance write fOpeningBalance;
      property ReconciledDate: TDateTime read fReconciledDate write fReconciledDate;
  end;

  // 92
  TSQLGlReconciliationEntry = class(TSQLRecord)
    private
      fGlReconciliation: TSQLGlReconciliation;
      fAcctgTrans: TSQLAcctgTrans;
      fAcctgTransEntrySeq: Integer;
      fReconciledAmount: Currency;
    published
      property GlReconciliation: TSQLGlReconciliation read fGlReconciliation write fGlReconciliation;
      property AcctgTrans: TSQLAcctgTrans read fAcctgTrans write fAcctgTrans;
      property AcctgTransEntrySeq: Integer read fAcctgTransEntrySeq write fAcctgTransEntrySeq;
      property ReconciledAmount: Currency read fReconciledAmount write fReconciledAmount;
  end;

  // 93
  TSQLGlResourceType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 94
  TSQLGlXbrlClass = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 95
  TSQLPartyAcctgPreference = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fFiscalYearStartMonth: Integer;
      fFiscalYearStartDay: Integer;
      fTaxForm: TSQLEnumeration;
      fCogsMethod: TSQLEnumeration;
      fBaseCurrencyUom: TSQLUom;
      fInvoiceSeqCustMeth: TSQLCustomMethod;
      fInvoiceIdPrefix: RawUTF8;
      fLastInvoiceNumber: Integer;
      fLastInvoiceRestartDate: TDateTime;
      fUseInvoiceIdForReturns: Boolean;
      fQuoteSeqCustMethId: TSQLCustomMethod;
      fQuoteIdPrefix: RawUTF8;
      fLastQuoteNumber: Integer;
      fOrderSeqCustMeth: TSQLCustomMethod;
      fOrderIdPrefix: RawUTF8;
      fLastOrderNumber: Integer;
      fRefundPaymentMethod: TSQLPaymentMethod;
      fErrorGlJournalId: TSQLGlJournal;
    published
      property Party: TSQLParty read fParty write fParty;
      property FiscalYearStartMonth: Integer read fFiscalYearStartMonth write fFiscalYearStartMonth;
      property FiscalYearStartDay: Integer read fFiscalYearStartDay write fFiscalYearStartDay;
      property TaxForm: TSQLEnumeration read fTaxForm write fTaxForm;
      property CogsMethod: TSQLEnumeration read fCogsMethod write fCogsMethod;
      property BaseCurrencyUom: TSQLUom read fBaseCurrencyUom write fBaseCurrencyUom;
      property InvoiceSeqCustMeth: TSQLCustomMethod read fInvoiceSeqCustMeth write fInvoiceSeqCustMeth;
      property InvoiceIdPrefix: RawUTF8 read fInvoiceIdPrefix write fInvoiceIdPrefix;
      property LastInvoiceNumber: Integer read fLastInvoiceNumber write fLastInvoiceNumber;
      property LastInvoiceRestartDate: TDateTime read fLastInvoiceRestartDate write fLastInvoiceRestartDate;
      property UseInvoiceIdForReturns: Boolean read fUseInvoiceIdForReturns write fUseInvoiceIdForReturns;
      property QuoteSeqCustMethId: TSQLCustomMethod read fQuoteSeqCustMethId write fQuoteSeqCustMethId;
      property QuoteIdPrefix: RawUTF8 read fQuoteIdPrefix write fQuoteIdPrefix;
      property LastQuoteNumber: Integer read fLastQuoteNumber write fLastQuoteNumber;
      property OrderSeqCustMeth: TSQLCustomMethod read fOrderSeqCustMeth write fOrderSeqCustMeth;
      property OrderIdPrefix: RawUTF8 read fOrderIdPrefix write fOrderIdPrefix;
      property LastOrderNumber: Integer read fLastOrderNumber write fLastOrderNumber;
      property RefundPaymentMethod: TSQLPaymentMethod read fRefundPaymentMethod write fRefundPaymentMethod;
      property ErrorGlJournalId: TSQLGlJournal read fErrorGlJournalId write fErrorGlJournalId;
  end;

  // 96
  TSQLProductAverageCost = class(TSQLRecord)
    private
      fProductAverageCostType: TSQLProductAverageCostType;
      fOrganizationParty: TSQLParty;
      fProduct: TSQLProduct;
      fFacility: TSQLFacility;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAverageCost: Double;
    published
      property ProductAverageCostType: TSQLProductAverageCostType read fProductAverageCostType write fProductAverageCostType;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property Product: TSQLProduct read fProduct write fProduct;
      property Facility: TSQLFacility read fFacility write fFacility;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AverageCost: Double read fAverageCost write fAverageCost;
  end;

  // 97
  TSQLProductAverageCostType = class(TSQLRecord)
    private
      fParent: TSQLProductAverageCostType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductAverageCostType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 98
  TSQLSettlementTerm = class(TSQLRecord)
    private
      fTermName: RawUTF8;
      fTermValue: Double;
      fUom: TSQLUom;
    published
      property TermName: RawUTF8 read fTermName write fTermName;
      property TermValue: Double read fTermValue write fTermValue;
      property Uom: TSQLUom read fUom write fUom;
  end;

  // 99
  TSQLVarianceReasonGlAccount = class(TSQLRecord)
    private
      fVarianceReason: TSQLVarianceReason;
      fOrganizationParty: TSQLParty;
      fGlAccountL TSQLGlAccount;
    published
      property VarianceReason: TSQLVarianceReason read fVarianceReason write fVarianceReason;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property GlAccountL TSQLGlAccount read fGlAccountL write fGlAccountL;
  end;

  // 100
  TSQLBillingAccount = class(TSQLRecord)
    private
      fAccountLimit: Currency;
      fAccountCurrencyUom: TSQLUom;
      fContactMech: TSQLContactMech;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fDescription: RawUTF8;
      fExternalAccount: RawUTF8;
    published
      property AccountLimit: Currency read fAccountLimit write fAccountLimit;
      property AccountCurrencyUom: TSQLUom read fAccountCurrencyUom write fAccountCurrencyUom;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Description: RawUTF8 read fDescription write fDescription;
      property ExternalAccount: RawUTF8 read fExternalAccount write fExternalAccount;
  end;

  // 101
  TSQLBillingAccountRole = class(TSQLRecord)
    private
      fBillingAccount: TSQLBillingAccount;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property BillingAccount: TSQLBillingAccount read fBillingAccount write fBillingAccount;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 102
  TSQLBillingAccountTerm = class(TSQLRecord)
    private
      fBillingAccount: TSQLBillingAccount;
      fTermType: TSQLTermType;
      fTermValue: Currency;
      fTermDays: Integer;
      fUom: TSQLUom;
    published
      property BillingAccount: TSQLBillingAccount read fBillingAccount write fBillingAccount;
      property TermType: TSQLTermType read fTermType write fTermType;
      property TermValue: Currency read fTermValue write fTermValue;
      property TermDays: Integer read fTermDays write fTermDays;
      property Uom: TSQLUom read fUom write fUom;
  end;

  // 103
  TSQLBillingAccountTermAttr = class(TSQLRecord)
    private
      fBillingAccountTerm: TSQLBillingAccountTerm;
      fAttrName: TSQLTermTypeAttr;
      fAttrValue: RawUTF8;
    published
      property  read  write ;
      property AttrName: TSQLTermTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
  end;

  // 104
  TSQLCreditCard = class(TSQLRecord)
    private
      fPaymentMethod: TSQLPaymentMethod;
      fCardType: RawUTF8;
      fCardNumber: RawUTF8;
      fValidFromDate: TDateTime;

    published
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
  end;







{
  //
  TSQL = class(TSQLRecord)
    private
    published
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
  end;
}

implementation

end.

