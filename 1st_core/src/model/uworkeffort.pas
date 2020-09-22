unit uWorkEffort;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLTimeEntry = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fRateType: TSQLRateTypeID;
      fWorkEffort: TSQLWorkEffortID;
      fTimesheet: TSQLTimesheetID;
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fHours: Double;
      fComments: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property RateType: TSQLRateTypeID read fRateType write fRateType;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Timesheet: TSQLTimesheetID read fTimesheet write fTimesheet;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property Hours: Double read fHours write fHours;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 2
  TSQLTimesheet = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fClientParty: TSQLPartyID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fApprovedByUserLogin: TSQLUserLoginID;
      fComments: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property ClientParty: TSQLPartyID read fClientParty write fClientParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property ApprovedByUserLogin: TSQLUserLoginID read fApprovedByUserLogin write fApprovedByUserLogin;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 3
  TSQLTimesheetRole = class(TSQLRecord)
    private
      fTimesheet: TSQLTimesheetID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
    published
      property Timesheet: TSQLTimesheetID read fTimesheet write fTimesheet;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 4
  TSQLApplicationSandbox = class(TSQLRecord)
    private
      fWorkEffort: Integer;
      fParty: Integer;
      fRoleType: Integer;
      fFromDate: TDateTime;
      fRuntimeData: TSQLRuntimeDataID;
    published
      property WorkEffort: Integer read fWorkEffort write fWorkEffort;
      property Party: Integer read fParty write fParty;
      property RoleType: Integer read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property RuntimeData: TSQLRuntimeDataID read fRuntimeData write fRuntimeData;
  end;

  // 5
  TSQLCommunicationEventWorkEff = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fCommunicationEvent: TSQLCommunicationEventID;
      fDescription: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 6
  TSQLDeliverable = class(TSQLRecord)
    private
      fDeliverableType: TSQLDeliverableTypeID;
      fDeliverableName: RawUTF8;
      fDescription: RawUTF8;
    published
      property DeliverableType: TSQLDeliverableTypeID read fDeliverableType write fDeliverableType;
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
      fWorkEffortType: TSQLWorkEffortTypeID;
      fCurrentStatus: TSQLStatusItemID;
      fLastStatusUpdate: TDateTime;
      fWorkEffortPurposeType: TSQLWorkEffortPurposeTypeID;
      fWorkEffortParent: TSQLWorkEffortID;
      fScopeEnum: TSQLEnumerationID;
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
      fEstimateCalcMethod: TSQLCustomMethodID;
      fActualMilliSeconds: Double;
      fActualSetupMillis: Double;
      fTotalMilliSecondsAllowed: Double;
      fTotalMoneyAllowed: Currency;
      fMoneyUom: TSQLUomID;
      fSpecialTerms: RawUTF8;
      fTimeTransparency: Integer;
      fUniversal: RawUTF8;
      fSourceReference: Integer;
      fFixedAsset: TSQLFixedAssetID;
      fFacility: TSQLFacilityID;
      fInfoUrl: RawUTF8;
      fRecurrenceInfo: TSQLRecurrenceInfoID;
      fTempExpr: TSQLTemporalExpressionID;
      fRuntimeData: TSQLRuntimeDataID;
      fNote: TSQLNoteDataID;
      fServiceLoaderName: RawUTF8;
      fQuantityToProduce: Double;
      fQuantityProduced: Double;
      fQuantityRejected: Double;
      fReservPersons: Double;
      fReserv2ndPPPerc: Double;
      fReservNthPPPerc: Double;
      fAccommodationMap: TSQLAccommodationMapID;
      fAccommodationSpot: TSQLAccommodationSpotID;
      fRevisionNumber: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property WorkEffortType: TSQLWorkEffortTypeID read fWorkEffortType write fWorkEffortType;
      property CurrentStatus: TSQLStatusItemID read fCurrentStatus write fCurrentStatus;
      property LastStatusUpdate: TDateTime read fLastStatusUpdate write fLastStatusUpdate;
      property WorkEffortPurposeType: TSQLWorkEffortPurposeTypeID read fWorkEffortPurposeType write fWorkEffortPurposeType;
      property WorkEffortParent: TSQLWorkEffortID read fWorkEffortParent write fWorkEffortParent;
      property ScopeEnum: TSQLEnumerationID read fScopeEnum write fScopeEnum;
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
      property EstimateCalcMethod: TSQLCustomMethodID read fEstimateCalcMethod write fEstimateCalcMethod;
      property ActualMilliSeconds: Double read fActualMilliSeconds write fActualMilliSeconds;
      property ActualSetupMillis: Double read fActualSetupMillis write fActualSetupMillis;
      property TotalMilliSecondsAllowed: Double read fTotalMilliSecondsAllowed write fTotalMilliSecondsAllowed;
      property TotalMoneyAllowed: Currency read fTotalMoneyAllowed write fTotalMoneyAllowed;
      property MoneyUom: TSQLUomID read fMoneyUom write fMoneyUom;
      property SpecialTerms: RawUTF8 read fSpecialTerms write fSpecialTerms;
      property TimeTransparency: Integer read fTimeTransparency write fTimeTransparency;
      property Universal: RawUTF8 read fUniversal write fUniversal;
      property SourceReference: Integer read fSourceReference write fSourceReference;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property InfoUrl: RawUTF8 read fInfoUrl write fInfoUrl;
      property RecurrenceInfo: TSQLRecurrenceInfoID read fRecurrenceInfo write fRecurrenceInfo;
      property TempExpr: TSQLTemporalExpressionID read fTempExpr write fTempExpr;
      property RuntimeData: TSQLRuntimeDataID read fRuntimeData write fRuntimeData;
      property Note: TSQLNoteDataID read fNote write fNote;
      property ServiceLoaderName: RawUTF8 read fServiceLoaderName write fServiceLoaderName;
      property QuantityToProduce: Double read fQuantityToProduce write fQuantityToProduce;
      property QuantityProduced: Double read fQuantityProduced write fQuantityProduced;
      property QuantityRejected: Double read fQuantityRejected write fQuantityRejected;
      property ReservPersons: Double read fReservPersons write fReservPersons;
      property Reserv2ndPPPerc: Double read fReserv2ndPPPerc write fReserv2ndPPPerc;
      property ReservNthPPPerc: Double read fReservNthPPPerc write fReservNthPPPerc;
      property AccommodationMap: TSQLAccommodationMapID read fAccommodationMap write fAccommodationMap;
      property AccommodationSpot: TSQLAccommodationSpotID read fAccommodationSpot write fAccommodationSpot;
      property RevisionNumber: Integer read fRevisionNumber write fRevisionNumber;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 9
  TSQLWorkEffortAssoc = class(TSQLRecord)
    private
      fWorkEffortIdFrom: TSQLWorkEffortID;
      fWorkEffortIdTo: TSQLWorkEffortID;
      fWorkEffortAssocType: TSQLWorkEffortAssocTypeID;
      fSequenceNum: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffortIdFrom: TSQLWorkEffortID read fWorkEffortIdFrom write fWorkEffortIdFrom;
      property WorkEffortIdTo: TSQLWorkEffortID read fWorkEffortIdTo write fWorkEffortIdTo;
      property WorkEffortAssocType: TSQLWorkEffortAssocTypeID read fWorkEffortAssocType write fWorkEffortAssocType;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 10
  TSQLWorkEffortAssocAttribute = class(TSQLRecord)
    private
      fWorkEffortIdFrom: TSQLWorkEffortID;
      fWorkEffortIdTo: TSQLWorkEffortID;
      fWorkEffortAssocType: TSQLWorkEffortAssocTypeID;
      fFromDate: TDateTime;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property WorkEffortIdFrom: TSQLWorkEffortID read fWorkEffortIdFrom write fWorkEffortIdFrom;
      property WorkEffortIdTo: TSQLWorkEffortID read fWorkEffortIdTo write fWorkEffortIdTo;
      property WorkEffortAssocType: TSQLWorkEffortAssocTypeID read fWorkEffortAssocType write fWorkEffortAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 11
  TSQLWorkEffortAssocType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortAssocTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortAssocTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 12
  TSQLWorkEffortAssocTypeAttr = class(TSQLRecord)
    private
      fWorkEffortAssocType: TSQLWorkEffortAssocTypeID;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fDescription: RawUTF8;
    published
      property WorkEffortAssocType: TSQLWorkEffortAssocTypeID read fWorkEffortAssocType write fWorkEffortAssocType;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 13
  TSQLWorkEffortAttribute = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 14
  TSQLWorkEffortBilling = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fInvoice: TSQLInvoiceID;
      fInvoiceItemSeq: Integer;
      fPercentage: Double;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Invoice: TSQLInvoiceID read fInvoice write fInvoice;
      property InvoiceItemSeq: Integer read fInvoiceItemSeq write fInvoiceItemSeq;
      property Percentage: Double read fPercentage write fPercentage;
  end;

  // 15
  TSQLWorkEffortContactMech = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fContactMech: TSQLContactMechID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 16
  TSQLWorkEffortContent = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fContent: TSQLContentID;
      fWorkEffortContentType: TSQLWorkEffortContentTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Content: TSQLContentID read fContent write fContent;
      property WorkEffortContentType: TSQLWorkEffortContentTypeID read fWorkEffortContentType write fWorkEffortContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 17
  TSQLWorkEffortContentType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortContentTypeID;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortContentTypeID read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 18
  TSQLWorkEffortDeliverableProd = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fDeliverable: TSQLDeliverableID;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Deliverable: TSQLDeliverableID read fDeliverable write fDeliverable;
  end;

  // 19
  TSQLWorkEffortEventReminder = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fSequence: Integer;
      fContactMech: TSQLContactMechID;
      fParty: TSQLPartyID;
      fReminderDateTime: TDateTime;
      fRepeatCount: Integer;
      fRepeatInterval: Integer;
      fCurrentCount: Integer;
      fReminderOffset: Integer;
      fLocale: Integer;
      fTimeZone: Integer;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Sequence: Integer read fSequence write fSequence;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property Party: TSQLPartyID read fParty write fParty;
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
      fWorkEffort: TSQLWorkEffortID;
      fFixedAsset: TSQLFixedAssetID;
      fStatus: TSQLStatusItemID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAvailabilityStatus: TSQLStatusItemID;
      fAllocatedCost: Currency;
      fComments: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AvailabilityStatus: TSQLStatusItemID read fAvailabilityStatus write fAvailabilityStatus;
      property AllocatedCost: Currency read fAllocatedCost write fAllocatedCost;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 21
  TSQLWorkEffortFixedAssetStd = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fFixedAssetType: TSQLFixedAssetTypeID;
      fEstimatedQuantity: Double;
      fEstimatedDuration: Double;
      fEstimatedCost: Currency;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property FixedAssetType: TSQLFixedAssetTypeID read fFixedAssetType write fFixedAssetType;
      property EstimatedQuantity: Double read fEstimatedQuantity write fEstimatedQuantity;
      property EstimatedDuration: Double read fEstimatedDuration write fEstimatedDuration;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
  end;

  // 22
  TSQLWorkEffortGoodStandard = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fProduct: TSQLProductID;
      fWorkEffortGoodStdType: TSQLWorkEffortGoodStandardTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fEstimatedQuantity: Double;
      fEstimatedCost: Currency;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Product: TSQLProductID read fProduct write fProduct;
      property WorkEffortGoodStdType: TSQLWorkEffortGoodStandardTypeID read fWorkEffortGoodStdType write fWorkEffortGoodStdType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property EstimatedQuantity: Double read fEstimatedQuantity write fEstimatedQuantity;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
  end;

  // 23
  TSQLWorkEffortGoodStandardType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortGoodStandardTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortGoodStandardTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 24
  TSQLWorkEffortIcalData = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fIcalData: TSQLRawBlob;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property IcalData: TSQLRawBlob read fIcalData write fIcalData;
  end;

  // 25
  TSQLWorkEffortInventoryAssign = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fInventoryItem: TSQLInventoryItemID;
      fStatus: TSQLStatusItemID;
      fQuantity: Double;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 26
  TSQLWorkEffortInventoryProduced = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fInventoryItem: TSQLInventoryItemID;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
  end;

  // 27
  TSQLWorkEffortCostCalc = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fCostComponentType: TSQLCostComponentTypeID;
      fCostComponentCalc: TSQLCostComponentCalcID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property CostComponentType: TSQLCostComponentTypeID read fCostComponentType write fCostComponentType;
      property CostComponentCalc: TSQLCostComponentCalcID read fCostComponentCalc write fCostComponentCalc;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 28
  TSQLWorkEffortKeyword = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fKeyword: RawUTF8;
      fRelevancyWeight: Integer;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Keyword: RawUTF8 read fKeyword write fKeyword;
      property RelevancyWeight: Integer read fRelevancyWeight write fRelevancyWeight;
  end;

  // 29
  TSQLWorkEffortNote = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fNote: TSQLNoteDataID;
      fInternalNote: Boolean;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Note: TSQLNoteDataID read fNote write fNote;
      property InternalNote: Boolean read fInternalNote write fInternalNote;
  end;

  // 30
  TSQLWorkEffortPartyAssignment = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAssignedByUserLogin: TSQLUserLoginID;
      fStatus: TSQLStatusItemID;
      fStatusDateTime: TDateTime;
      fExpectationEnum: TSQLEnumerationID;
      fDelegateReasonEnum: TSQLEnumerationID;
      fFacility: TSQLFacilityID;
      fComments: RawUTF8;
      fMustRsvp: Boolean;
      fAvailabilityStatus: TSQLStatusItemID;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AssignedByUserLogin: TSQLUserLoginID read fAssignedByUserLogin write fAssignedByUserLogin;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property StatusDateTime: TDateTime read fStatusDateTime write fStatusDateTime;
      property ExpectationEnum: TSQLEnumerationID read fExpectationEnum write fExpectationEnum;
      property DelegateReasonEnum: TSQLEnumerationID read fDelegateReasonEnum write fDelegateReasonEnum;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Comments: RawUTF8 read fComments write fComments;
      property MustRsvp: Boolean read fMustRsvp write fMustRsvp;
      property AvailabilityStatus: TSQLStatusItemID read fAvailabilityStatus write fAvailabilityStatus;
  end;

  // 31
  TSQLWorkEffortPurposeType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortPurposeTypeID;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortPurposeTypeID read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 32
  TSQLWorkEffortReview = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fUserLogin: TSQLUserLoginID;
      fReviewDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fPostedAnonymous: Boolean;
      fRating: Double;
      fReviewText: TSQLRawBlob;
   published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property ReviewDate: TDateTime read fReviewDate write fReviewDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property PostedAnonymous: Boolean read fPostedAnonymous write fPostedAnonymous;
      property Rating: Double read fRating write fRating;
      property ReviewText: TSQLRawBlob read fReviewText write fReviewText;
  end;

  // 33
  TSQLWorkEffortSearchConstraint = class(TSQLRecord)
    private
      fWorkEffortSearchResult: TSQLWorkEffortSearchResultID;
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
      property WorkEffortSearchResult: TSQLWorkEffortSearchResultID read fWorkEffortSearchResult write fWorkEffortSearchResult;
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
      fWorkEffort: TSQLWorkEffortID;
      fSkillType: TSQLSkillTypeID;
      fEstimatedNumPeople: Double;
      fEstimatedDuration: Double;
      fEstimatedCost: Currency;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property SkillType: TSQLSkillTypeID read fSkillType write fSkillType;
      property EstimatedNumPeople: Double read fEstimatedNumPeople write fEstimatedNumPeople;
      property EstimatedDuration: Double read fEstimatedDuration write fEstimatedDuration;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
  end;

  // 36
  TSQLWorkEffortStatus = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fStatus: TSQLStatusItemID;
      fStatusDatetime: TDateTime;
      fSetByUserLogin: TSQLUserLoginID;
      fReason: RawUTF8;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
      property SetByUserLogin: TSQLUserLoginID read fSetByUserLogin write fSetByUserLogin;
      property Reason: RawUTF8 read fReason write fReason;
  end;

  // 37
  TSQLWorkEffortTransBox = class(TSQLRecord)
    private
      fprocessWorkEffort: TSQLWorkEffortID;
      fToActivity: Integer;
      fTransition: Integer;
    published
      property processWorkEffort: TSQLWorkEffortID read fprocessWorkEffort write fprocessWorkEffort;
      property ToActivity: Integer read fToActivity write fToActivity;
      property Transition: Integer read fTransition write fTransition;
  end;

  // 38
  TSQLWorkEffortType = class(TSQLRecord)
    private
      fParent: TSQLWorkEffortTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWorkEffortTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 39
  TSQLWorkEffortTypeAttr = class(TSQLRecord)
    private
      fWorkEffortType: TSQLWorkEffortTypeID;
      fAttrName: TSQLWorkEffortAttributeID;
      fDescription: RawUTF8;
    published
      property WorkEffortType: TSQLWorkEffortTypeID read fWorkEffortType write fWorkEffortType;
      property AttrName: TSQLWorkEffortAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 40
  TSQLWorkEffortSurveyAppl = class(TSQLRecord)
    private
      fWorkEffort: TSQLWorkEffortID;
      fSurvey: TSQLSurveyID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

implementation

end.

