unit uWorkEffort;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLTimeEntry = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fRateTypeL TSQLRateType;
      fWorkEffort: TSQLWorkEffort;
      fTimesheet: TSQLTimesheet;
      fInvoice: TSQLInvoice;
      fInvoiceItemSeq: Integer;
      fHours: Double;
      fComments: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property RateTypeL TSQLRateType read fRateTypeL write fRateTypeL;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Timesheet: TSQLTimesheet read fTimesheet write fTimesheet;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property Hours: Double read fHours write fHours;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 2
  TSQLTimesheet = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fClientParty: TSQLParty;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItem;
      fApprovedByUserLogin: TSQLUserLogin;
      fComments: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property ClientParty: TSQLParty read fClientParty write fClientParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property ApprovedByUserLogin: TSQLUserLogin read fApprovedByUserLogin write fApprovedByUserLogin;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 3
  TSQLTimesheetRole = class(TSQLRecord)
    private
      fTimesheet: TSQLTimesheet;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
    published
      property Timesheet: TSQLTimesheet read fTimesheet write fTimesheet;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 4
  TSQLApplicationSandbox = class(TSQLRecord)
    private
      fWorkEffort: Integer;
      fParty: Integer;
      fRoleType: Integer;
      fFromDate: TDateTime;
      fRuntimeData: TSQLRuntimeData;
    published
      property WorkEffort: Integer read fWorkEffort write fWorkEffort;
      property Party: Integer read fParty write fParty;
      property RoleType: Integer read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property RuntimeData: TSQLRuntimeData read fRuntimeData write fRuntimeData;
  end;

  // 5
  TSQLCommunicationEventWorkEff = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fCommunicationEvent: TSQLCommunicationEvent;
      fDescription: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 6
  TSQLDeliverable = class(TSQLRecord)
    private
      fDeliverableType: TSQLDeliverableType;
      fDeliverableName: RawUTF8;
      fDescription: RawUTF8;
    published
      property DeliverableType: TSQLDeliverableType read fDeliverableType write fDeliverableType;
      property DeliverableName: RawUTF8 read fDeliverableName write fDeliverableName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 7
  TSQLDeliverableType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 8
  TSQLWorkEffort = class(TSQLRecord)
    private
      fWorkEffortType: TSQLWorkEffortType;
      fCurrentStatus: TSQLStatusItem;
      fLastStatusUpdate: TDateTime;
      fWorkEffortPurposeType: TSQLWorkEffortPurposeType;
      fWorkEffortParent: TSQLWorkEffort;
      fScopeEnum: TSQLEnumeration;
      fPriority: Integer;
      fPercentComplete: Integer;
      fWorkEffortName: RawUTF8;
      fShowAsEnum: Integer;
      fSendNotificationEmail: Boolean;
      fDescription: RawUTF8;
      fLocationDesc: RawUTF8;
      fEstimatedStartDate: TDateTime;
      fEstimatedCompletionDate: TDateTime;
      fActualStartDate: TDateTime;
      fActualCompletionDate: TDateTime;
      fEstimatedMilliSeconds: Double;
      fEstimatedSetupMillis: Double;
      fEstimateCalcMethod: TSQLCustomMethod;
      fActualMilliSeconds: Double;
      fActualSetupMillis: Double;
      fTotalMilliSecondsAllowed: Double;
      fTotalMoneyAllowed: Currency;
      fMoneyUom: TSQLUom;
      fSpecialTerms: RawUTF8;
      fTimeTransparency: Integer;
      fUniversal: RawUTF8;
      fSourceReference: Integer;
      fFixedAsset: TSQLFixedAsset;
      fFacility: TSQLFacility;
      fInfoUrl: RawUTF8;
      fRecurrenceInfo: TSQLRecurrenceInfo;
      fTempExpr: TSQLTemporalExpression;
      fRuntimeData: TSQLRuntimeData;
      fNote: TSQLNoteData;
      fServiceLoaderName: RawUTF8;
      fQuantityToProduce: Double;
      fQuantityProduced: Double;
      fQuantityRejected: Double;
      fReservPersons: Double;
      fReserv2ndPPPerc: Double;
      fReservNthPPPerc: Double;
      fAccommodationMap: TSQLAccommodationMap;
      fAccommodationSpot: TSQLAccommodationSpot;
      fRevisionNumber: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property WorkEffortType: TSQLWorkEffortType read fWorkEffortType write fWorkEffortType;
      property CurrentStatus: TSQLStatusItem read fCurrentStatus write fCurrentStatus;
      property LastStatusUpdate: TDateTime read fLastStatusUpdate write fLastStatusUpdate;
      property WorkEffortPurposeType: TSQLWorkEffortPurposeType read fWorkEffortPurposeType write fWorkEffortPurposeType;
      property WorkEffortParent: TSQLWorkEffort read fWorkEffortParent write fWorkEffortParent;
      property ScopeEnum: TSQLEnumeration read fScopeEnum write fScopeEnum;
      property Priority: Integer read fPriority write fPriority;
      property PercentComplete: Integer read fPercentComplete write fPercentComplete;
      property WorkEffortName: RawUTF8 read fWorkEffortName write fWorkEffortName;
      property ShowAsEnum: Integer read fShowAsEnum write fShowAsEnum;
      property SendNotificationEmail: Boolean read fSendNotificationEmail write fSendNotificationEmail;
      property Description: RawUTF8 read fDescription write fDescription;
      property LocationDesc: RawUTF8 read fLocationDesc write fLocationDesc;
      property EstimatedStartDate: TDateTime read fEstimatedStartDate write fEstimatedStartDate;
      property EstimatedCompletionDate: TDateTime read fEstimatedCompletionDate write fEstimatedCompletionDate;
      property ActualStartDate: TDateTime read fActualStartDate write fActualStartDate;
      property ActualCompletionDate: TDateTime read fActualCompletionDate write fActualCompletionDate;
      property EstimatedMilliSeconds: Double read fEstimatedMilliSeconds write fEstimatedMilliSeconds;
      property EstimatedSetupMillis: Double read fEstimatedSetupMillis write fEstimatedSetupMillis;
      property EstimateCalcMethod: TSQLCustomMethod read fEstimateCalcMethod write fEstimateCalcMethod;
      property ActualMilliSeconds: Double read fActualMilliSeconds write fActualMilliSeconds;
      property ActualSetupMillis: Double read fActualSetupMillis write fActualSetupMillis;
      property TotalMilliSecondsAllowed: Double read fTotalMilliSecondsAllowed write fTotalMilliSecondsAllowed;
      property TotalMoneyAllowed: Currency read fTotalMoneyAllowed write fTotalMoneyAllowed;
      property MoneyUom: TSQLUom read fMoneyUom write fMoneyUom;
      property SpecialTerms: RawUTF8 read fSpecialTerms write fSpecialTerms;
      property TimeTransparency: Integer read fTimeTransparency write fTimeTransparency;
      property Universal: RawUTF8 read fUniversal write fUniversal;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property Facility: TSQLFacility read fFacility write fFacility;
      property InfoUrl: RawUTF8 read fInfoUrl write fInfoUrl;
      property RecurrenceInfo: TSQLRecurrenceInfo read fRecurrenceInfo write fRecurrenceInfo;
      property TempExpr: TSQLTemporalExpression read fTempExpr write fTempExpr;
      property RuntimeData: TSQLRuntimeData read fRuntimeData write fRuntimeData;
      property Note: TSQLNoteData read fNote write fNote;
      property ServiceLoaderName: RawUTF8 read fServiceLoaderName write fServiceLoaderName;
      property QuantityToProduce: Double read fQuantityToProduce write fQuantityToProduce;
      property QuantityProduced: Double read fQuantityProduced write fQuantityProduced;
      property QuantityRejected: Double read fQuantityRejected write fQuantityRejected;
      property ReservPersons: Double read fReservPersons write fReservPersons;
      property Reserv2ndPPPerc: Double read fReserv2ndPPPerc write fReserv2ndPPPerc;
      property ReservNthPPPerc: Double read  write fReservNthPPPerc;
      property AccommodationMap: TSQLAccommodationMap read fAccommodationMap write fAccommodationMap;
      property AccommodationSpot: TSQLAccommodationSpot read fAccommodationSpot write fAccommodationSpot;
      property RevisionNumber: Integer read fRevisionNumber write fRevisionNumber;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 9
  TSQLWorkEffortAssoc = class(TSQLRecord)
    private
      fWorkEffortIdFrom: TSQLWorkEffort;
      fWorkEffortIdTo: TSQLWorkEffort;
      fWorkEffortAssocType: TSQLWorkEffortAssocType;
      fSequenceNum: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffortIdFrom: TSQLWorkEffort read fWorkEffortIdFrom write fWorkEffortIdFrom;
      property WorkEffortIdTo: TSQLWorkEffort read fWorkEffortIdTo write fWorkEffortIdTo;
      property WorkEffortAssocType: TSQLWorkEffortAssocType read fWorkEffortAssocType write fWorkEffortAssocType;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 10
  TSQLWorkEffortAssocAttribute = class(TSQLRecord)
    private
      fWorkEffortIdFrom: TSQLWorkEffort;
      fWorkEffortIdTo: TSQLWorkEffort;
      fWorkEffortAssocType: TSQLWorkEffortAssocType;
      fFromDate: TDateTime;
      fAttrName: TSQLInventoryItemTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property WorkEffortIdFrom: TSQLWorkEffort read fWorkEffortIdFrom write fWorkEffortIdFrom;
      property WorkEffortIdTo: TSQLWorkEffort read fWorkEffortIdTo write fWorkEffortIdTo;
      property WorkEffortAssocType: TSQLWorkEffortAssocType read fWorkEffortAssocType write fWorkEffortAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property AttrName: TSQLInventoryItemTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 11
  TSQLWorkEffortAssocType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortAssocType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortAssocType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 12
  TSQLWorkEffortAssocTypeAttr = class(TSQLRecord)
    private
      fWorkEffortAssocType: TSQLWorkEffortAssocType;
      fAttrName: TSQLInventoryItemTypeAttr;
      fDescription: RawUTF8;
    published
      property WorkEffortAssocType: TSQLWorkEffortAssocType read fWorkEffortAssocType write fWorkEffortAssocType;
      property AttrName: TSQLInventoryItemTypeAttr read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 13
  TSQLWorkEffortAttribute = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fAttrName: TSQLInventoryItemTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property AttrName: TSQLInventoryItemTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 14
  TSQLWorkEffortBilling = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fInvoice: TSQLInvoice;
      fInvoiceItemSeq: Integer;
      fPercentage: Double;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Invoice: TSQLInvoice read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property Percentage: Double read fPercentage write fPercentage;
  end;

  // 15
  TSQLWorkEffortContactMech = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fContactMech: TSQLContactMech;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 16
  TSQLWorkEffortContent = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fContent: TSQLContent;
      fWorkEffortContentType: TSQLWorkEffortContentType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Content: TSQLContent read fContent write fContent;
      property WorkEffortContentType: TSQLWorkEffortContentType read fWorkEffortContentType write fWorkEffortContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 17
  TSQLWorkEffortContentType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortContentType;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortContentType read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 18
  TSQLWorkEffortDeliverableProd = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fDeliverable: TSQLDeliverable;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Deliverable: TSQLDeliverable read fDeliverable write fDeliverable;
  end;

  // 19
  TSQLWorkEffortEventReminder = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fSequence: Integer;
      fContactMech: TSQLContactMech;
      fParty: TSQLParty;
      fReminderDateTime: TDateTime;
      fRepeatCount: Integer;
      fRepeatInterval: Integer;
      fCurrentCount: Integer;
      fReminderOffset: Integer;
      fLocale: Integer;
      fTimeZone: Integer;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Sequence: Integer read fSequence write fSequence;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property Party: TSQLParty read fParty write fParty;
      property ReminderDateTime: TDateTime read fReminderDateTime write fReminderDateTime;
      property RepeatCount: Integer read fRepeatCount write fRepeatCount;
      property RepeatInterval: Integer read fRepeatInterval write fRepeatInterval;
      property CurrentCount: Integer read fCurrentCount write fCurrentCount;
      property ReminderOffset: Integer read fReminderOffset write fReminderOffset;
      property Locale: Integer read fLocale write fLocale;
      property TimeZone: Integer read fTimeZone write fTimeZone;
  end;

  // 20
  TSQLWorkEffortFixedAssetAssign = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fFixedAsset: TSQLFixedAsset;
      fStatus: TSQLStatusItem;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAvailabilityStatus: TSQLStatusItem;
      fAllocatedCost: Currency;
      fComments: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AvailabilityStatus: TSQLStatusItem read fAvailabilityStatus write fAvailabilityStatus;
      property AllocatedCost: Currency read fAllocatedCost write fAllocatedCost;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 21
  TSQLWorkEffortFixedAssetStd = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fFixedAssetType: TSQLFixedAssetType;
      fEstimatedQuantity: Double;
      fEstimatedDuration: Double;
      fEstimatedCost: Currency;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property FixedAssetType: TSQLFixedAssetType read fFixedAssetType write fFixedAssetType;
      property EstimatedQuantity: Double read fEstimatedQuantity write fEstimatedQuantity;
      property EstimatedDuration: Double read fEstimatedDuration write fEstimatedDuration;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
  end;

  // 22
  TSQLWorkEffortGoodStandard = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fProduct: TSQLProduct;
      fWorkEffortGoodStdType: TSQLWorkEffortGoodStandardType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItem;
      fEstimatedQuantity: Double;
      fEstimatedCost: Currency;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Product: TSQLProduct read fProduct write fProduct;
      property WorkEffortGoodStdType: TSQLWorkEffortGoodStandardType read fWorkEffortGoodStdType write fWorkEffortGoodStdType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property EstimatedQuantity: Double read fEstimatedQuantity write fEstimatedQuantity;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
  end;

  // 23
  TSQLWorkEffortGoodStandardType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortGoodStandardType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortGoodStandardType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 24
  TSQLWorkEffortIcalData = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fIcalData: TSQLBlob;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property IcalData: TSQLBlob read fIcalData write fIcalData;
  end;

  // 25
  TSQLWorkEffortInventoryAssign = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fInventoryItem: TSQLInventoryItem;
      fStatus: TSQLStatusItem;
      fQuantity: Double;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 26
  TSQLWorkEffortInventoryProduced = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fInventoryItem: TSQLInventoryItem;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
  end;

  // 27
  TSQLWorkEffortCostCalc = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fCostComponentType: TSQLCostComponentType;
      fCostComponentCalc: TSQLCostComponentCalc;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property CostComponentType: TSQLCostComponentType read fCostComponentType write fCostComponentType;
      property CostComponentCalc: TSQLCostComponentCalc read fCostComponentCalc write fCostComponentCalc;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 28
  TSQLWorkEffortKeyword = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fKeyword: RawUTF8;
      fRelevancyWeight: Integer;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Keyword: RawUTF8 read fKeyword write fKeyword;
      property RelevancyWeight: Integer read fRelevancyWeight write fRelevancyWeight;
  end;

  // 29
  TSQLWorkEffortNote = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fNote: TSQLNoteData;
      fInternalNote: Boolean;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Note: TSQLNoteData read fNote write fNote;
      property InternalNote: Boolean read fInternalNote write fInternalNote;
  end;

  // 30
  TSQLWorkEffortPartyAssignment = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAssignedByUserLogin: TSQLUserLogin;
      fStatus: TSQLStatusItem;
      fStatusDateTime: TDateTime;
      fExpectationEnum: TSQLEnumeration;
      fDelegateReasonEnum: TSQLEnumeration;
      fFacility: TSQLFacility;
      fComments: RawUTF8;
      fMustRsvp: Boolean;
      fAvailabilityStatus: TSQLStatusItem;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AssignedByUserLogin: TSQLUserLogin read fAssignedByUserLogin write fAssignedByUserLogin;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property StatusDateTime: TDateTime read fStatusDateTime write fStatusDateTime;
      property ExpectationEnum: TSQLEnumeration read fExpectationEnum write fExpectationEnum;
      property DelegateReasonEnum: TSQLEnumeration read fDelegateReasonEnum write fDelegateReasonEnum;
      property Facility: TSQLFacility read fFacility write fFacility;
      property Comments: RawUTF8 read fComments write fComments;
      property MustRsvp: Boolean read fMustRsvp write fMustRsvp;
      property AvailabilityStatus: TSQLStatusItem read fAvailabilityStatus write fAvailabilityStatus;
  end;

  // 31
  TSQLWorkEffortPurposeType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortPurposeType;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortPurposeType read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 32
  TSQLWorkEffortReview = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fUserLogin: TSQLUserLogin;
      fReviewDate: TDateTime;
      fStatus: TSQLStatusItem;
      fPostedAnonymous: Boolean;
      fRating: Double;
      fReviewText: TSQLBolb;
   published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property UserLogin: TSQLUserLogin read fUserLogin write fUserLogin;
      property ReviewDate: TDateTime read fReviewDate write fReviewDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property PostedAnonymous: Boolean read fPostedAnonymous write fPostedAnonymous;
      property Rating: Double read fRating write fRating;
      property ReviewText: TSQLBolb read fReviewText write fReviewText;
  end;

  // 33
  TSQLWorkEffortSearchConstraint = class(TSQLRecord)
    private
      fWorkEffortSearchResult: TSQLWorkEffortSearchResult;
      fConstraintSeq: Integer;
      fConstraintName: RawUTF8;
      fInfoString: RawUTF8;
      fIncludeSubWorkEfforts: Boolean;
      fIsAnd: Boolean;
      fAnyPrefix: Boolean;
      fAnySuffix: Boolean;
      fRemoveStems: Boolean;
      fLowValue: RawUTF8;
      fHighValue: RawUTF8;
    published
      property WorkEffortSearchResult: TSQLWorkEffortSearchResult read fWorkEffortSearchResult write fWorkEffortSearchResult;
      property ConstraintSeq: Integer read fConstraintSeq write fConstraintSeq;
      property ConstraintName: RawUTF8 read fConstraintName write fConstraintName;
      property InfoString: RawUTF8 read fInfoString write fInfoString;
      property IncludeSubWorkEfforts: Boolean read fIncludeSubWorkEfforts write fIncludeSubWorkEfforts;
      property IsAnd: Boolean read fIsAnd write fIsAnd;
      property AnyPrefix: Boolean read fAnyPrefix write fAnyPrefix;
      property AnySuffix: Boolean read fAnySuffix write fAnySuffix;
      property RemoveStems: Boolean read fRemoveStems write fRemoveStems;
      property LowValue: RawUTF8 read fLowValue write fLowValue;
      property HighValue: RawUTF8 read fHighValue write fHighValue;
  end;

  // 34
  TSQLWorkEffortSearchResult = class(TSQLRecord)
    private
      fVisit: Integer;
      fOrderByName: RawUTF8;
      fIsAscending: Boolean;
      fNumResults: Integer;
      fSecondsTotal: Double;
      fSearchDate: TDateTime;
    published
      property Visit: Integer read fVisit write fVisit;
      property OrderByName: RawUTF8 read fOrderByName write fOrderByName;
      property IsAscending: Boolean read fIsAscending write fIsAscending;
      property NumResults: Integer read fNumResults write fNumResults;
      property SecondsTotal: Double read fSecondsTotal write fSecondsTotal;
      property SearchDate: TDateTime read fSearchDate write fSearchDate;
  end;

  // 35
  TSQLWorkEffortSkillStandard = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fSkillType: TSQLSkillType;
      fEstimatedNumPeople: Double;
      fEstimatedDuration: Double;
      fEstimatedCost: Currency;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property SkillType: TSQLSkillType read fSkillType write fSkillType;
      property EstimatedNumPeople: Double read fEstimatedNumPeople write fEstimatedNumPeople;
      property EstimatedDuration: Double read fEstimatedDuration write fEstimatedDuration;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
  end;

  // 36
  TSQLWorkEffortStatus = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fStatus: TSQLStatusItem;
      fStatusDatetime: TDateTime;
      fSetByUserLogin: TSQLUserLogin;
      fReason: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
      property SetByUserLogin: TSQLUserLogin read fSetByUserLogin write fSetByUserLogin;
      property Reason: RawUTF8 read fReason write fReason;
  end;

  // 37
  TSQLWorkEffortTransBox = class(TSQLRecord)
    private
      fprocessWorkEffort: TSQLWorkEffort;
      fToActivity: Integer;
      fTransition: Integer;
    published
      property processWorkEffort: TSQLWorkEffort read fprocessWorkEffort write fprocessWorkEffort;
      property ToActivity: Integer read fToActivity write fToActivity;
      property Transition: Integer read fTransition write fTransition;
  end;

  // 38
  TSQLWorkEffortType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 39
  TSQLWorkEffortTypeAttr = class(TSQLRecord)
    private
      fWorkEffortType: TSQLWorkEffortType;
      fAttrName: TSQLWorkEffortAttribute;
      fDescription: RawUTF8;
    published
      property WorkEffortType: TSQLWorkEffortType read fWorkEffortType write fWorkEffortType;
      property AttrName: TSQLWorkEffortAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 40
  TSQLWorkEffortSurveyAppl = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffort;
      fSurvey: TSQLSurvey;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property Survey: TSQLSurvey read fSurvey write fSurvey;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

implementation

end.

