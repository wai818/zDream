unit uMarketing;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLMarketingCampaign = class(TSQLRecord)
    private
      fParentCampaign: TSQLMarketingCampaignID;
      fStatus: TSQLStatusItemID;
      fCampaignName: RawUTF8;
      fCampaignSummary: RawUTF8;
      fBudgetedCost: Currency;
      fActualCost: Currency;
      fEstimatedCost: Currency;
      fCurrencyUom: TSQLUomID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fIsActive: Boolean;
      fConvertedLeads: Integer;
      fExpectedResponsePercent: Double;
      fExpectedRevenue: Currency;
      fNumSent: Integer;
      fStartDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property ParentCampaign: TSQLMarketingCampaignID read fParentCampaign write fParentCampaign;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property CampaignName: RawUTF8 read fCampaignName write fCampaignName;
      property CampaignSummary: RawUTF8 read fCampaignSummary write fCampaignSummary;
      property BudgetedCost: Currency read fBudgetedCost write fBudgetedCost;
      property ActualCost: Currency read fActualCost write fActualCost;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property IsActive: Boolean read fIsActive write fIsActive;
      property ConvertedLeads: Integer read fConvertedLeads write fConvertedLeads;
      property ExpectedResponsePercent: Double read fExpectedResponsePercent write fExpectedResponsePercent;
      property ExpectedRevenue: Currency read fExpectedRevenue write fExpectedRevenue;
      property NumSent: Integer read fNumSent write fNumSent;
      property StartDate: TDateTime read fStartDate write fStartDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 2
  TSQLMarketingCampaignNote = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaignID;
      fNote: TSQLNoteDataID;
    published
      property MarketingCampaign: TSQLMarketingCampaignID read fMarketingCampaign write fMarketingCampaign;
      property Note: TSQLNoteDataID read fNote write fNote;
  end;

  // 3
  TSQLMarketingCampaignPrice = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaignID;
      fProductPriceRule: TSQLProductPriceRuleID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property MarketingCampaign: TSQLMarketingCampaignID read fMarketingCampaign write fMarketingCampaign;
      property ProductPriceRule: TSQLProductPriceRuleID read fProductPriceRule write fProductPriceRule;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
 end;

  // 4
  TSQLMarketingCampaignPromo = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaignID;
      fProductPromo: TSQLProductPromoID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property MarketingCampaign: TSQLMarketingCampaignID read fMarketingCampaign write fMarketingCampaign;
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 5
  TSQLMarketingCampaignRole = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaignID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property MarketingCampaign: TSQLMarketingCampaignID read fMarketingCampaign write fMarketingCampaign;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 6
  TSQLContactList = class(TSQLRecord)
    private
      fContactListType: TSQLContactListTypeID;
      fContactMechType: TSQLContactMechTypeID;
      fMarketingCampaign: TSQLMarketingCampaignID;
      fContactListName: RawUTF8;
      fDescription: RawUTF8;
      fComments: RawUTF8;
      fIsPublic: Boolean;
      fSingleUse: Boolean;
      fOwnerParty: TSQLPartyID;
      fVerifyEmailFrom: RawUTF8;
      fVerifyEmailScreen: RawUTF8;
      fVerifyEmailSubject: RawUTF8;
      fVerifyEmailWebSite: Integer;
      fOptOutScreen: RawUTF8;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property ContactListType: TSQLContactListTypeID read fContactListType write fContactListType;
      property ContactMechType: TSQLContactMechTypeID read fContactMechType write fContactMechType;
      property MarketingCampaign: TSQLMarketingCampaignID read fMarketingCampaign write fMarketingCampaign;
      property ContactListName: RawUTF8 read fContactListName write fContactListName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Comments: RawUTF8 read fComments write fComments;
      property IsPublic: Boolean read fIsPublic write fIsPublic;
      property SingleUse: Boolean read fSingleUse write fSingleUse;
      property OwnerParty: TSQLPartyID read fOwnerParty write fOwnerParty;
      property VerifyEmailFrom: RawUTF8 read fVerifyEmailFrom write fVerifyEmailFrom;
      property VerifyEmailScreen: RawUTF8 read fVerifyEmailScreen write fVerifyEmailScreen;
      property VerifyEmailSubject: RawUTF8 read fVerifyEmailSubject write fVerifyEmailSubject;
      property VerifyEmailWebSite: Integer read fVerifyEmailWebSite write fVerifyEmailWebSite;
      property OptOutScreen: RawUTF8 read fOptOutScreen write fOptOutScreen;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 7
  TSQLWebSiteContactList = class(TSQLRecord)
    private
      fWebSite: TSQLWebSiteID;
      fContactList: TSQLContactListID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WebSite: TSQLWebSiteID read fWebSite write fWebSite;
      property ContactList: TSQLContactListID read fContactList write fContactList;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 8
  TSQLContactListCommStatus = class(TSQLRecord)
    private
      fContactList: TSQLContactListID;
      fCommunicationEvent: TSQLCommunicationEventID;
      fContactMech: TSQLContactMechID;
      fParty: TSQLPartyID;
      fMessage: RawUTF8;
      fStatus: TSQLStatusItemID;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property ContactList: TSQLContactListID read fContactList write fContactList;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property Party: TSQLPartyID read fParty write fParty;
      property Message: RawUTF8 read fMessage write fMessage;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 9
  TSQLContactListParty = class(TSQLRecord)
    private
      fContactList: TSQLContactListID;
      fParty: TSQLPartyID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fpreferredContactMech: TSQLContactMechID;
    published
      property ContactList: TSQLContactListID read fContactList write fContactList;
      property Party: TSQLPartyID read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property preferredContactMech: TSQLContactMechID read fpreferredContactMech write fpreferredContactMech;
  end;

  // 10
  TSQLContactListPartyStatus = class(TSQLRecord)
    private
      fContactList: TSQLContactListID;
      fParty: TSQLPartyID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fSetByUserLogin: TSQLUserLoginID;
      fOptInVerifyCode: RawUTF8;
    published
      property ContactList: TSQLContactListID read fContactList write fContactList;
      property Party: TSQLPartyID read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property SetByUserLogin: TSQLUserLoginID read fSetByUserLogin write fSetByUserLogin;
      property OptInVerifyCode: RawUTF8 read fOptInVerifyCode write fOptInVerifyCode;
  end;

  // 11
  TSQLContactListType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 12
  TSQLSegmentGroup = class(TSQLRecord)
    private
      fSegmentGroupType: TSQLSegmentGroupTypeID;
      fDescription: RawUTF8;
      fProductStore: TSQLProductStoreID;
    published
      property SegmentGroupType: TSQLSegmentGroupTypeID read fSegmentGroupType write fSegmentGroupType;
      property Description: RawUTF8 read fDescription write fDescription;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
  end;

  // 13
  TSQLSegmentGroupClassification = class(TSQLRecord)
    private
      fSegmentGroup: TSQLSegmentGroupID;
      fPartyClassificationGroup: TSQLPartyClassificationGroupID;
    published
      property SegmentGroup: TSQLSegmentGroupID read fSegmentGroup write fSegmentGroup;
      property PartyClassificationGroup: TSQLPartyClassificationGroupID read fPartyClassificationGroup write fPartyClassificationGroup;
  end;

  // 14
  TSQLSegmentGroupGeo = class(TSQLRecord)
    private
      fSegmentGroup: TSQLSegmentGroupID;
      fGeo: TSQLGeoID;
    published
      property SegmentGroup: TSQLSegmentGroupID read fSegmentGroup write fSegmentGroup;
      property Geo: TSQLGeoID read fGeo write fGeo;
  end;

  // 15
  TSQLSegmentGroupRole = class(TSQLRecord)
    private
      fSegmentGroup: TSQLSegmentGroupID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
    published
      property SegmentGroup: TSQLSegmentGroupID read fSegmentGroup write fSegmentGroup;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 16
  TSQLSegmentGroupType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 17
  TSQLTrackingCode = class(TSQLRecord)
    private
      fTrackingCodeType: TSQLTrackingCodeTypeID;
      fMarketingCampaign: TSQLMarketingCampaignID;
      fRedirectUrl: RawUTF8;
      fOverrideLogo: RawUTF8;
      fOverrideCss: RawUTF8;
      fProdCatalogId: Integer;
      fComments: RawUTF8;
      fDescription: RawUTF8;
      fTrackableLifetime: Integer;
      fBillableLifetime: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fGroupId: Integer;
      fSubgroupId: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property TrackingCodeType: TSQLTrackingCodeTypeID read fTrackingCodeType write fTrackingCodeType;
      property MarketingCampaign: TSQLMarketingCampaignID read fMarketingCampaign write fMarketingCampaign;
      property RedirectUrl: RawUTF8 read fRedirectUrl write fRedirectUrl;
      property OverrideLogo: RawUTF8 read fOverrideLogo write fOverrideLogo;
      property OverrideCss: RawUTF8 read fOverrideCss write fOverrideCss;
      property ProdCatalogId: Integer read fProdCatalogId write fProdCatalogId;
      property Comments: RawUTF8 read fComments write fComments;
      property Description: RawUTF8 read fDescription write fDescription;
      property TrackableLifetime: Integer read fTrackableLifetime write fTrackableLifetime;
      property BillableLifetime: Integer read fBillableLifetime write fBillableLifetime;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property GroupId: Integer read fGroupId write fGroupId;
      property SubgroupId: Integer read fSubgroupId write fSubgroupId;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 18
  TSQLTrackingCodeOrder = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fTrackingCodeType: TSQLTrackingCodeTypeID;
      fTrackingCode: TSQLTrackingCodeID;
      fIsBillable: Boolean;
      fSiteId: RawUTF8;
      fHasExported: Boolean;
      fAffiliateReferredTimeStamp: TDateTime;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property TrackingCodeType: TSQLTrackingCodeTypeID read fTrackingCodeType write fTrackingCodeType;
      property TrackingCode: TSQLTrackingCodeID read fTrackingCode write fTrackingCode;
      property IsBillable: Boolean read fIsBillable write fIsBillable;
      property SiteId: RawUTF8 read fSiteId write fSiteId;
      property HasExported: Boolean read fHasExported write fHasExported;
      property AffiliateReferredTimeStamp: TDateTime read fAffiliateReferredTimeStamp write fAffiliateReferredTimeStamp;
  end;

  // 19
  TSQLTrackingCodeOrderReturn = class(TSQLRecord)
    private
      fReturnId: TSQLReturnHeaderID;
      fOrderId: TSQLOrderHeaderID;
      fOrderItemSeqId: Integer;
      fTrackingCodeType: TSQLTrackingCodeTypeID;
      fTrackingCode: TSQLTrackingCodeID;
      fIsBillable: Boolean;
      fSiteId: RawUTF8;
      fHasExported: Boolean;
      fAffiliateReferredTimeStamp: TDateTime;
    published
      property ReturnId: TSQLReturnHeaderID read fReturnId write fReturnId;
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property OrderItemSeqId: Integer read fOrderItemSeqId write fOrderItemSeqId;
      property TrackingCodeType: TSQLTrackingCodeTypeID read fTrackingCodeType write fTrackingCodeType;
      property TrackingCode: TSQLTrackingCodeID read fTrackingCode write fTrackingCode;
      property IsBillable: Boolean read fIsBillable write fIsBillable;
      property SiteId: RawUTF8 read fSiteId write fSiteId;
      property HasExported: Boolean read fHasExported write fHasExported;
      property AffiliateReferredTimeStamp: TDateTime read fAffiliateReferredTimeStamp write fAffiliateReferredTimeStamp;
  end;

  // 20
  TSQLTrackingCodeType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 21
  TSQLTrackingCodeVisit = class(TSQLRecord)
    private
      fTrackingCode: TSQLTrackingCodeID;
      fVisitId: Integer;
      fFromDate: TDateTime;
      fSourceEnum: TSQLEnumerationID;
    published
      property TrackingCode: TSQLTrackingCodeID read fTrackingCode write fTrackingCode;
      property VisitId: Integer read fVisitId write fVisitId;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property SourceEnum: TSQLEnumerationID read fSourceEnum write fSourceEnum;
  end;

  // 22
  TSQLSalesOpportunity = class(TSQLRecord)
    private
      fOpportunityName: RawUTF8;
      fDescription: RawUTF8;
      fNextStep: TSQLRawBlob;
      fNextStepDate: TDateTime;
      fEstimatedAmount: Currency;
      fEstimatedProbability: Double;
      fCurrencyUom: TSQLUomID;
      fMarketingCampaign: TSQLMarketingCampaignID;
      fDataSourceId: Integer;
      fEstimatedCloseDate: TDateTime;
      fOpportunityStage: TSQLSalesOpportunityStageID;
      fTypeEnum: TSQLEnumerationID;
      fCreatedByUserLogin: TSQLUserLoginID;
    published
      property OpportunityName: RawUTF8 read fOpportunityName write fOpportunityName;
      property Description: RawUTF8 read fDescription write fDescription;
      property NextStep: TSQLRawBlob read fNextStep write fNextStep;
      property NextStepDate: TDateTime read fNextStepDate write fNextStepDate;
      property EstimatedAmount: Currency read fEstimatedAmount write fEstimatedAmount;
      property EstimatedProbability: Double read fEstimatedProbability write fEstimatedProbability;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property MarketingCampaign: TSQLMarketingCampaignID read fMarketingCampaign write fMarketingCampaign;
      property DataSourceId: Integer read fDataSourceId write fDataSourceId;
      property EstimatedCloseDate: TDateTime read fEstimatedCloseDate write fEstimatedCloseDate;
      property OpportunityStage: TSQLSalesOpportunityStageID read fOpportunityStage write fOpportunityStage;
      property TypeEnum: TSQLEnumerationID read fTypeEnum write fTypeEnum;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
  end;

  // 23
  TSQLSalesOpportunityHistory = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunityID;
      fDescription: RawUTF8;
      fNextStep: TSQLRawBlob;
      fEstimatedAmount: Currency;
      fEstimatedProbability: Double;
      fCurrencyUom: TSQLUomID;
      fEstimatedCloseDate: TDateTime;
      fOpportunityStage: TSQLSalesOpportunityStageID;
      fChangeNote: TSQLRawBlob;
    published
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
      property Description: RawUTF8 read fDescription write fDescription;
      property NextStep: TSQLRawBlob read fNextStep write fNextStep;
      property EstimatedAmount: Currency read fEstimatedAmount write fEstimatedAmount;
      property EstimatedProbability: Double read fEstimatedProbability write fEstimatedProbability;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property EstimatedCloseDate: TDateTime read fEstimatedCloseDate write fEstimatedCloseDate;
      property OpportunityStage: TSQLSalesOpportunityStageID read fOpportunityStage write fOpportunityStage;
      property ChangeNote: TSQLRawBlob read fChangeNote write fChangeNote;
  end;

  // 24
  TSQLSalesOpportunityRole = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunityID;
      //fParty: TSQLPartyID;
      //fRoleType: TSQLRoleTypeID;
      fPartyRole: TSQLPartyRoleID;
    published
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
      //property Party: TSQLPartyID read fParty write fParty;
      //property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property PartyRole: TSQLPartyRoleID read fPartyRole write fPartyRole;
  end;

  // 25
  TSQLSalesOpportunityStage = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fDefaultProbability: Double;
      fSequenceNum: Integer;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property DefaultProbability: Double read fDefaultProbability write fDefaultProbability;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 26
  TSQLSalesOpportunityWorkEffort = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunityID;
      fWorkEffort: TSQLWorkEffortID;
    published
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
  end;

  // 27
  TSQLSalesOpportunityQuote = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunityID;
      fQuote: TSQLQuoteID;
    published
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
      property Quote: TSQLQuoteID read fQuote write fQuote;
  end;

  // 28
  TSQLSalesForecast = class(TSQLRecord)
    private
      fParentSalesForecast: TSQLSalesForecastID;
      fOrganizationParty: TSQLPartyID;
      fInternalParty: TSQLPartyID;
      fCustomTimePeriod: TSQLCustomTimePeriodID;
      fCurrencyUom: TSQLUomID;
      fQuotaAmount: Currency;
      fForecastAmount: Currency;
      fBestCaseAmount: Currency;
      fClosedAmount: Currency;
      fPercentOfQuotaForecast: Double;
      fPercentOfQuotaClosed: Double;
      fPipelineAmount: Currency;
      fCreatedByUserLogin: TSQLUserLoginID;
      fModifiedByUserLogin: TSQLUserLoginID;
    published
      property ParentSalesForecast: TSQLSalesForecastID read fParentSalesForecast write fParentSalesForecast;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property InternalParty: TSQLPartyID read fInternalParty write fInternalParty;
      property CustomTimePeriod: TSQLCustomTimePeriodID read fCustomTimePeriod write fCustomTimePeriod;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property QuotaAmount: Currency read fQuotaAmount write fQuotaAmount;
      property ForecastAmount: Currency read fForecastAmount write fForecastAmount;
      property BestCaseAmount: Currency read fBestCaseAmount write fBestCaseAmount;
      property ClosedAmount: Currency read fClosedAmount write fClosedAmount;
      property PercentOfQuotaForecast: Double read fPercentOfQuotaForecast write fPercentOfQuotaForecast;
      property PercentOfQuotaClosed: Double read fPercentOfQuotaClosed write fPercentOfQuotaClosed;
      property PipelineAmount: Currency read fPipelineAmount write fPipelineAmount;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property ModifiedByUserLogin: TSQLUserLoginID read fModifiedByUserLogin write fModifiedByUserLogin;
  end;

  // 29
  TSQLSalesForecastDetail = class(TSQLRecord)
    private
      fSalesForecast: TSQLSalesForecastID;
      fAmount: Currency;
      fQuantityUom: TSQLUomID;
      fQuantity: Double;
      fProduct: TSQLProductID;
      fProductCategory: TSQLProductCategoryID;
    published
      property SalesForecast: TSQLSalesForecastID read fSalesForecast write fSalesForecast;
      property Amount: Currency read fAmount write fAmount;
      property QuantityUom: TSQLUomID read fQuantityUom write fQuantityUom;
      property Quantity: Double read fQuantity write fQuantity;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
  end;

  // 30
  TSQLSalesForecastHistory = class(TSQLRecord)
    private
      fSalesForecast: TSQLSalesForecastID;
      fParentSalesForecast: TSQLSalesForecastID;
      fOrganizationParty: TSQLPartyID;
      fInternalParty: TSQLPartyID;
      fCustomTimePeriod: TSQLCustomTimePeriodID;
      fCurrencyUom: TSQLUomID;
      fQuotaAmount: Currency;
      fForecastAmount: Currency;
      fBestCaseAmount: Currency;
      fClosedAmount: Currency;
      fPercentOfQuotaForecast: Double;
      fPercentOfQuotaClosed: Double;
      fChangeNote: TSQLRawBlob;
    published
      property SalesForecast: TSQLSalesForecastID read fSalesForecast write fSalesForecast;
      property ParentSalesForecast: TSQLSalesForecastID read fParentSalesForecast write fParentSalesForecast;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property InternalParty: TSQLPartyID read fInternalParty write fInternalParty;
      property CustomTimePeriod: TSQLCustomTimePeriodID read fCustomTimePeriod write fCustomTimePeriod;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property QuotaAmount: Currency read fQuotaAmount write fQuotaAmount;
      property ForecastAmount: Currency read fForecastAmount write fForecastAmount;
      property BestCaseAmount: Currency read fBestCaseAmount write fBestCaseAmount;
      property ClosedAmount: Currency read fClosedAmount write fClosedAmount;
      property PercentOfQuotaForecast: Double read fPercentOfQuotaForecast write fPercentOfQuotaForecast;
      property PercentOfQuotaClosed: Double read fPercentOfQuotaClosed write fPercentOfQuotaClosed;
      property ChangeNote: TSQLRawBlob read fChangeNote write fChangeNote;
  end;

  // 31
  TSQLSalesOpportunityCompetitor = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunityID;
      fCompetitorParty: TSQLPartyID;
      fPositionEnum: Integer;
      fStrengths: TSQLRawBlob;
      fWeaknesses: TSQLRawBlob;
    published
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
      property CompetitorParty: TSQLPartyID read fCompetitorParty write fCompetitorParty;
      property PositionEnum: Integer read fPositionEnum write fPositionEnum;
      property Strengths: TSQLRawBlob read fStrengths write fStrengths;
      property Weaknesses: TSQLRawBlob read fWeaknesses write fWeaknesses;
  end;

  // 32
  TSQLSalesOpportunityTrckCode = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunityID;
      fReceivedDate: TDateTime;
    published
      property SalesOpportunity: TSQLSalesOpportunityID read fSalesOpportunity write fSalesOpportunity;
      property ReceivedDate: TDateTime read fReceivedDate write fReceivedDate;
  end;

implementation

end.

