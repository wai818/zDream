unit uMarketing;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLMarketingCampaign = class(TSQLRecord)
    private
      fParentCampaign: TSQLMarketingCampaign;
      fStatus: TSQLStatusItem;
      fCampaignName: RawUTF8;
      fCampaignSummary: RawUTF8;
      fBudgetedCost: Currency;
      fActualCost: Currency;
      fEstimatedCost: Currency;
      fCurrencyUom: TSQLUom;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fIsActive: Boolean;
      fConvertedLeads: Integer;
      fExpectedResponsePercent: Double;
      fExpectedRevenue: Currency;
      fNumSent: Integer;
      fStartDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property ParentCampaign: TSQLMarketingCampaign read fParentCampaign write fParentCampaign;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property CampaignName: RawUTF8 read fCampaignName write fCampaignName;
      property CampaignSummary: RawUTF8 read fCampaignSummary write fCampaignSummary;
      property BudgetedCost: Currency read fBudgetedCost write fBudgetedCost;
      property ActualCost: Currency read fActualCost write fActualCost;
      property EstimatedCost: Currency read fEstimatedCost write fEstimatedCost;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property IsActive: Boolean read fIsActive write fIsActive;
      property ConvertedLeads: Integer read fConvertedLeads write fConvertedLeads;
      property ExpectedResponsePercent: Double read fExpectedResponsePercent write fExpectedResponsePercent;
      property ExpectedRevenue: Currency read fExpectedRevenue write fExpectedRevenue;
      property NumSent: Integer read fNumSent write fNumSent;
      property StartDate: TDateTime read fStartDate write fStartDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 2
  TSQLMarketingCampaignNote = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaign;
      fNote: TSQLNoteData;
    published
      property MarketingCampaign: TSQLMarketingCampaign read fMarketingCampaign write fMarketingCampaign;
      property Note: TSQLNoteData read fNote write fNote;
  end;

  // 3
  TSQLMarketingCampaignPrice = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaign;
      fProductPriceRule: TSQLProductPriceRule;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property MarketingCampaign: TSQLMarketingCampaign read fMarketingCampaign write fMarketingCampaign;
      property ProductPriceRule: TSQLProductPriceRule read fProductPriceRule write fProductPriceRule;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
 end;

  // 4
  TSQLMarketingCampaignPromo = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaign;
      fProductPromo: TSQLProductPromo;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property MarketingCampaign: TSQLMarketingCampaign read fMarketingCampaign write fMarketingCampaign;
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 5
  TSQLMarketingCampaignRole = class(TSQLRecord)
    private
      fMarketingCampaign: TSQLMarketingCampaign;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property MarketingCampaign: TSQLMarketingCampaign read fMarketingCampaign write fMarketingCampaign;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 6
  TSQLContactList = class(TSQLRecord)
    private
      fContactListType: TSQLContactListType;
      fContactMechType: TSQLContactMechType;
      fMarketingCampaign: TSQLMarketingCampaign;
      fContactListName: RawUTF8;
      fDescription: RawUTF8;
      fComments: RawUTF8;
      fIsPublic: Boolean;
      fSingleUse: Boolean;
      fOwnerParty: TSQLParty;
      fVerifyEmailFrom: RawUTF8;
      fVerifyEmailScreen: RawUTF8;
      fVerifyEmailSubject: RawUTF8;
      fVerifyEmailWebSite: Integer;
      fOptOutScreen: RawUTF8;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property ContactListType: TSQLContactListType read fContactListType write fContactListType;
      property ContactMechType: TSQLContactMechType read fContactMechType write fContactMechType;
      property MarketingCampaign: TSQLMarketingCampaign read fMarketingCampaign write fMarketingCampaign;
      property ContactListName: RawUTF8 read fContactListName write fContactListName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Comments: RawUTF8 read fComments write fComments;
      property IsPublic: Boolean read fIsPublic write fIsPublic;
      property SingleUse: Boolean read fSingleUse write fSingleUse;
      property OwnerParty: TSQLParty read fOwnerParty write fOwnerParty;
      property VerifyEmailFrom: RawUTF8 read fVerifyEmailFrom write fVerifyEmailFrom;
      property VerifyEmailScreen: RawUTF8 read fVerifyEmailScreen write fVerifyEmailScreen;
      property VerifyEmailSubject: RawUTF8 read fVerifyEmailSubject write fVerifyEmailSubject;
      property VerifyEmailWebSite: Integer read fVerifyEmailWebSite write fVerifyEmailWebSite;
      property OptOutScreen: RawUTF8 read fOptOutScreen write fOptOutScreen;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 7
  TSQLWebSiteContactList = class(TSQLRecord)
    private
      fWebSite: TSQLWebSite;
      fContactList: TSQLContactList;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WebSite: TSQLWebSite read fWebSite write fWebSite;
      property ContactList: TSQLContactList read fContactList write fContactList;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 8
  TSQLContactListCommStatus = class(TSQLRecord)
    private
      fContactList: TSQLContactList;
      fCommunicationEvent: TSQLCommunicationEvent;
      fContactMech: TSQLContactMech;
      fParty: TSQLParty;
      fMessage: RawUTF8;
      fStatus: TSQLStatusItem;
      fChangeByUserLogin: TSQLUserLogin;
    published
      property ContactList: TSQLContactList read fContactList write fContactList;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property Party: TSQLParty read fParty write fParty;
      property Message: RawUTF8 read fMessage write fMessage;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 9
  TSQLContactListParty = class(TSQLRecord)
    private
      fContactList: TSQLContactList;
      fParty: TSQLParty;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItem;
      fpreferredContactMech: TSQLContactMech;
    published
      property ContactList: TSQLContactList read fContactList write fContactList;
      property Party: TSQLParty read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property preferredContactMech: TSQLContactMech read fpreferredContactMech write fpreferredContactMech;
  end;

  // 10
  TSQLContactListPartyStatus = class(TSQLRecord)
    private
      fContactList: TSQLContactList;
      fParty: TSQLParty;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItem;
      fSetByUserLogin: TSQLUserLogin;
      fOptInVerifyCode: RawUTF8;
    published
      property ContactList: TSQLContactList read fContactList write fContactList;
      property Party: TSQLParty read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property SetByUserLogin: TSQLUserLogin read fSetByUserLogin write fSetByUserLogin;
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
      fSegmentGroupType: TSQLSegmentGroupType;
      fDescription: RawUTF8;
      fProductStore: TSQLProductStore;
    published
      property SegmentGroupType: TSQLSegmentGroupType read fSegmentGroupType write fSegmentGroupType;
      property Description: RawUTF8 read fDescription write fDescription;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
  end;

  // 13
  TSQLSegmentGroupClassification = class(TSQLRecord)
    private
      fSegmentGroup: TSQLSegmentGroup;
      fPartyClassificationGroup: TSQLPartyClassificationGroup;
    published
      property SegmentGroup: TSQLSegmentGroup read fSegmentGroup write fSegmentGroup;
      property PartyClassificationGroup: TSQLPartyClassificationGroup read fPartyClassificationGroup write fPartyClassificationGroup;
  end;

  // 14
  TSQLSegmentGroupGeo = class(TSQLRecord)
    private
      fSegmentGroup: TSQLSegmentGroup;
      fGeo: TSQLGeo;
    published
      property SegmentGroup: TSQLSegmentGroup read fSegmentGroup write fSegmentGroup;
      property Geo: TSQLGeo read fGeo write fGeo;
  end;

  // 15
  TSQLSegmentGroupRole = class(TSQLRecord)
    private
      fSegmentGroup: TSQLSegmentGroup;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
    published
      property SegmentGroup: TSQLSegmentGroup read fSegmentGroup write fSegmentGroup;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
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
      fTrackingCodeType: TSQLTrackingCodeType;
      fMarketingCampaign: TSQLMarketingCampaign;
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
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property TrackingCodeType: TSQLTrackingCodeType read fTrackingCodeType write fTrackingCodeType;
      property MarketingCampaign: TSQLMarketingCampaign read fMarketingCampaign write fMarketingCampaign;
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
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 18
  TSQLTrackingCodeOrder = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fTrackingCodeType: TSQLTrackingCodeType;
      fTrackingCode: TSQLTrackingCode;
      fIsBillable: Boolean;
      fSiteId: RawUTF8;
      fHasExported: Boolean;
      fAffiliateReferredTimeStamp: TDateTime;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property TrackingCodeType: TSQLTrackingCodeType read fTrackingCodeType write fTrackingCodeType;
      property TrackingCode: TSQLTrackingCode read fTrackingCode write fTrackingCode;
      property IsBillable: Boolean read fIsBillable write fIsBillable;
      property SiteId: RawUTF8 read fSiteId write fSiteId;
      property HasExported: Boolean read fHasExported write fHasExported;
      property AffiliateReferredTimeStamp: TDateTime read fAffiliateReferredTimeStamp write fAffiliateReferredTimeStamp;
  end;

  // 19
  TSQLTrackingCodeOrderReturn = class(TSQLRecord)
    private
      fReturnId: TSQLReturnHeader;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeqId: Integer;
      fTrackingCodeType: TSQLTrackingCodeType;
      fTrackingCode: TSQLTrackingCode;
      fIsBillable: Boolean;
      fSiteId: RawUTF8;
      fHasExported: Boolean;
      fAffiliateReferredTimeStamp: TDateTime;
    published
      property ReturnId: TSQLReturnHeader read fReturnId write fReturnId;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeqId: Integer read fOrderItemSeqId write fOrderItemSeqId;
      property TrackingCodeType: TSQLTrackingCodeType read fTrackingCodeType write fTrackingCodeType;
      property TrackingCode: TSQLTrackingCode read fTrackingCode write fTrackingCode;
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
      fTrackingCode: TSQLTrackingCode;
      fVisitId: Integer;
      fFromDate: TDateTime;
      fSourceEnum: TSQLEnumeration;
    published
      property TrackingCode: TSQLTrackingCode read fTrackingCode write fTrackingCode;
      property VisitId: Integer read fVisitId write fVisitId;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property SourceEnum: TSQLEnumeration read fSourceEnum write fSourceEnum;
  end;

  // 22
  TSQLSalesOpportunity = class(TSQLRecord)
    private
      fOpportunityName: RawUTF8;
      fDescription: RawUTF8;
      fNextStep: TSQLBlob;
      fNextStepDate: TDateTime;
      fEstimatedAmount: Currency;
      fEstimatedProbability: Double;
      fCurrencyUom: TSQLUom;
      fMarketingCampaign: TSQLMarketingCampaign;
      fDataSourceId: Integer;
      fEstimatedCloseDate: TDateTime;
      fOpportunityStage: TSQLSalesOpportunityStage;
      fTypeEnum: TSQLEnumeration;
      fCreatedByUserLogin: TSQLUserLogin;
    published
      property OpportunityName: RawUTF8 read fOpportunityName write fOpportunityName;
      property Description: RawUTF8 read fDescription write fDescription;
      property NextStep: TSQLBlob read fNextStep write fNextStep;
      property NextStepDate: TDateTime read fNextStepDate write fNextStepDate;
      property EstimatedAmount: Currency read fEstimatedAmount write fEstimatedAmount;
      property EstimatedProbability: Double read fEstimatedProbability write fEstimatedProbability;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property MarketingCampaign: TSQLMarketingCampaign read fMarketingCampaign write fMarketingCampaign;
      property DataSourceId: Integer read fDataSourceId write fDataSourceId;
      property EstimatedCloseDate: TDateTime read fEstimatedCloseDate write fEstimatedCloseDate;
      property OpportunityStage: TSQLSalesOpportunityStage read fOpportunityStage write fOpportunityStage;
      property TypeEnum: TSQLEnumeration read fTypeEnum write fTypeEnum;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
  end;

  // 23
  TSQLSalesOpportunityHistory = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunity;
      fDescription: RawUTF8;
      fNextStep: TSQLBlob;
      fEstimatedAmount: Currency;
      fEstimatedProbability: Double;
      fCurrencyUom: TSQLUom;
      fEstimatedCloseDate: TDateTime;
      fOpportunityStage: TSQLSalesOpportunityStage;
      fChangeNote: TSQLBlob;
    published
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
      property Description: RawUTF8 read fDescription write fDescription;
      property NextStep: TSQLBlob read fNextStep write fNextStep;
      property EstimatedAmount: Currency read fEstimatedAmount write fEstimatedAmount;
      property EstimatedProbability: Double read fEstimatedProbability write fEstimatedProbability;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property EstimatedCloseDate: TDateTime read fEstimatedCloseDate write fEstimatedCloseDate;
      property OpportunityStage: TSQLSalesOpportunityStage read fOpportunityStage write fOpportunityStage;
      property ChangeNote: TSQLBlob read fChangeNote write fChangeNote;
  end;

  // 24
  TSQLSalesOpportunityRole = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunity;
      //fParty: TSQLParty;
      //fRoleType: TSQLRoleType;
      fPartyRole: TSQLPartyRole;
    published
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
      //property Party: TSQLParty read fParty write fParty;
      //property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
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
      fSalesOpportunity: TSQLSalesOpportunity;
      fWorkEffort: TSQLWorkEffort;
    published
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
  end;

  // 27
  TSQLSalesOpportunityQuote = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunity;
      fQuote: TSQLQuote;
    published
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
      property Quote: TSQLQuote read fQuote write fQuote;
  end;

  // 28
  TSQLSalesForecast = class(TSQLRecord)
    private
      fParentSalesForecast: TSQLSalesForecast;
      fOrganizationParty: TSQLParty;
      fInternalParty: TSQLParty;
      fCustomTimePeriod: TSQLCustomTimePeriod;
      fCurrencyUom: TSQLUom;
      fQuotaAmount: Currency;
      fForecastAmount: Currency;
      fBestCaseAmount: Currency;
      fClosedAmount: Currency;
      fPercentOfQuotaForecast: Double;
      fPercentOfQuotaClosed: Double;
      fPipelineAmount: Currency;
      fCreatedByUserLogin: TSQLUserLogin;
      fModifiedByUserLogin: TSQLUserLogin;
    published
      property ParentSalesForecast: TSQLSalesForecast read fParentSalesForecast write fParentSalesForecast;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property InternalParty: TSQLParty read fInternalParty write fInternalParty;
      property CustomTimePeriod: TSQLCustomTimePeriod read fCustomTimePeriod write fCustomTimePeriod;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property QuotaAmount: Currency read fQuotaAmount write fQuotaAmount;
      property ForecastAmount: Currency read fForecastAmount write fForecastAmount;
      property BestCaseAmount: Currency read fBestCaseAmount write fBestCaseAmount;
      property ClosedAmount: Currency read fClosedAmount write fClosedAmount;
      property PercentOfQuotaForecast: Double read fPercentOfQuotaForecast write fPercentOfQuotaForecast;
      property PercentOfQuotaClosed: Double read fPercentOfQuotaClosed write fPercentOfQuotaClosed;
      property PipelineAmount: Currency read fPipelineAmount write fPipelineAmount;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property ModifiedByUserLogin: TSQLUserLogin read fModifiedByUserLogin write fModifiedByUserLogin;
  end;

  // 29
  TSQLSalesForecastDetail = class(TSQLRecord)
    private
      fSalesForecast: TSQLSalesForecast;
      fAmount: Currency;
      fQuantityUom: TSQLUom;
      fQuantity: Double;
      fProduct: TSQLProduct;
      fProductCategory: TSQLProductCategory;
    published
      property SalesForecast: TSQLSalesForecast read fSalesForecast write fSalesForecast;
      property Amount: Currency read fAmount write fAmount;
      property QuantityUom: TSQLUom read fQuantityUom write fQuantityUom;
      property Quantity: Double read fQuantity write fQuantity;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
  end;

  // 30
  TSQLSalesForecastHistory = class(TSQLRecord)
    private
      fSalesForecast: TSQLSalesForecast;
      fParentSalesForecast: TSQLSalesForecast;
      fOrganizationParty: TSQLParty;
      fInternalParty: TSQLParty;
      fCustomTimePeriod: TSQLCustomTimePeriod;
      fCurrencyUom: TSQLUom;
      fQuotaAmount: Currency;
      fForecastAmount: Currency;
      fBestCaseAmount: Currency;
      fClosedAmount: Currency;
      fPercentOfQuotaForecast: Double;
      fPercentOfQuotaClosed: Double;
      fChangeNote: TSQLBlob;
    published
      property SalesForecast: TSQLSalesForecast read fSalesForecast write fSalesForecast;
      property ParentSalesForecast: TSQLSalesForecast read fParentSalesForecast write fParentSalesForecast;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property InternalParty: TSQLParty read fInternalParty write fInternalParty;
      property CustomTimePeriod: TSQLCustomTimePeriod read fCustomTimePeriod write fCustomTimePeriod;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property QuotaAmount: Currency read fQuotaAmount write fQuotaAmount;
      property ForecastAmount: Currency read fForecastAmount write fForecastAmount;
      property BestCaseAmount: Currency read fBestCaseAmount write fBestCaseAmount;
      property ClosedAmount: Currency read fClosedAmount write fClosedAmount;
      property PercentOfQuotaForecast: Double read fPercentOfQuotaForecast write fPercentOfQuotaForecast;
      property PercentOfQuotaClosed: Double read fPercentOfQuotaClosed write fPercentOfQuotaClosed;
      property ChangeNote: TSQLBlob read fChangeNote write fChangeNote;
  end;

  // 31
  TSQLSalesOpportunityCompetitor = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunity;
      fCompetitorParty: TSQLParty;
      fPositionEnum: Integer;
      fStrengths: TSQLBlob;
      fWeaknesses: TSQLBlob;
    published
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
      property CompetitorParty: TSQLParty read fCompetitorParty write fCompetitorParty;
      property PositionEnum: Integer read fPositionEnum write fPositionEnum;
      property Strengths: TSQLBlob read fStrengths write fStrengths;
      property Weaknesses: TSQLBlob read fWeaknesses write fWeaknesses;
  end;

  // 32
  TSQLSalesOpportunityTrckCode = class(TSQLRecord)
    private
      fSalesOpportunity: TSQLSalesOpportunity;
      fReceivedDate: TDateTime;
    published
      property SalesOpportunity: TSQLSalesOpportunity read fSalesOpportunity write fSalesOpportunity;
      property ReceivedDate: TDateTime read fReceivedDate write fReceivedDate;
  end;

implementation

end.

