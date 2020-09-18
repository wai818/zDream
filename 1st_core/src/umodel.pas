unit uModel;

{$mode objfpc}{$H+}

interface

uses
  mORMot, uParty, uProduct, uOrder, uAccounting, uShipment, uMarketing, uWorkEffort,
  uManufacturing, uHumanres, uCommon;
  //Classes, SysUtils;

const
  //ROOT_NAME = 'core';
  ROOT_NAME_PARTY = 'party';
  ROOT_NAME_PRODUCT = 'product';
  ROOT_NAME_ORDER = 'order';
  ROOT_NAME_ACCOUNTING = 'accounting';
  ROOT_NAME_WORKEFFORT = 'workeffort';
  ROOT_NAME_SHIPMENT = 'shipment';
  ROOT_NAME_MARKETING = 'marketing';
  ROOT_NAME_MANUFACTURING = 'manufacturing';
  ROOT_NAME_HUMANRES = 'humanres';
  ROOT_NAME_COMMON = 'common';

  //function CreateModel: TSQLModel;
  function CreatePartyModel: TSQLModel;
  function CreateProductModel: TSQLModel;
  function CreateOrderModel: TSQLModel;
  function CreateAccountingModel: TSQLModel;
  function CreateWorkEffortModel: TSQLModel;
  function CreateShipmentModel: TSQLModel;
  function CreateMarketingModel: TSQLModel;
  function CreateManufacturingModel: TSQLModel;
  function CreateHumanresModel: TSQLModel;
  function CreateCommonModel: TSQLModel;

implementation


function CreatePartyModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLAddendum, TSQLAgreement, TSQLAgreementAttribute, TSQLAgreementGeographicalApplic,
    TSQLAgreementItem, TSQLAgreementItemAttribute, TSQLAgreementItemType,
    TSQLAgreementItemTypeAttr, TSQLAgreementContent, TSQLAgreementContentType,
    TSQLAgreementPartyApplic, TSQLAgreementProductAppl, TSQLAgreementPromoAppl,
    TSQLAgreementFacilityAppl,TSQLAgreementRole, TSQLAgreementTerm, TSQLAgreementTermAttribute,
    TSQLAgreementType, TSQLAgreementTypeAttr, TSQLAgreementWorkEffortApplic,
    TSQLTermType, TSQLTermTypeAttr, TSQLAgreementEmploymentAppl, TSQLCommContentAssocType,
    TSQLCommEventContentAssoc, TSQLCommunicationEvent, TSQLCommunicationEventProduct,
    TSQLCommunicationEventPrpTyp, TSQLCommunicationEventPurpose, TSQLCommunicationEventRole,
    TSQLCommunicationEventType, TSQLContactMech, TSQLContactMechAttribute, TSQLContactMechLink,
    TSQLContactMechPurposeType, TSQLContactMechType, TSQLContactMechTypeAttr,
    TSQLContactMechTypePurpose, TSQLEmailAddressVerification, TSQLPartyContactMech,
    TSQLPartyContactMechPurpose, TSQLPostalAddress, TSQLPostalAddressBoundary,
    TSQLTelecomNumber, TSQLValidContactMechRole, TSQLNeedType, TSQLPartyNeed,
    TSQLAddressMatchMap, TSQLAffiliate, TSQLParty, TSQLPartyIdentification,
    TSQLPartyIdentificationType, TSQLPartyGeoPoint, TSQLPartyAttribute, TSQLPartyCarrierAccount,
    TSQLPartyClassification, TSQLPartyClassificationGroup, TSQLPartyClassificationType,
    TSQLPartyContent, TSQLPartyContentType, TSQLPartyDataSource, TSQLPartyGroup,
    TSQLPartyIcsAvsOverride, TSQLPartyInvitation, TSQLPartyInvitationGroupAssoc,
    TSQLPartyInvitationRoleAssoc, TSQLPartyNameHistory, TSQLPartyNote, TSQLPartyProfileDefault,
    TSQLPartyRelationship, TSQLPartyRelationshipType, TSQLPartyRole, TSQLPartyStatus,
    TSQLPartyType, TSQLPartyTypeAttr, TSQLPerson, TSQLPriorityType, TSQLRoleType,
    TSQLRoleTypeAttr, TSQLVendor, TSQLUserLogin
  ], ROOT_NAME_PARTY);
end;

function CreateProductModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLProdCatalog, TSQLProdCatalogCategory, TSQLProdCatalogCategoryType, TSQLProdCatalogInvFacility,
    TSQLProdCatalogRole, TSQLProductCategory, TSQLProductCategoryAttribute, TSQLProductCategoryContent,
    TSQLProductCategoryContentType, TSQLProductCategoryGlAccount, TSQLProductCategoryLink,
    TSQLProductCategoryMember, TSQLProductCategoryRole, TSQLProductCategoryRollup,
    TSQLProductCategoryType, TSQLProductCategoryTypeAttr, TSQLProductConfig, TSQLProductConfigItem,
    TSQLProdConfItemContent, TSQLProdConfItemContentType, TSQLProductConfigOption,
    TSQLProductConfigOptionIactn, TSQLProductConfigProduct, TSQLProductConfigConfig,
    TSQLProductConfigStats, TSQLConfigOptionProductOption, TSQLCostComponent,
    TSQLCostComponentAttribute, TSQLCostComponentType, TSQLCostComponentTypeAttr,
    TSQLCostComponentCalc, TSQLProductCostComponentCalc, TSQLContainer, TSQLContainerType,
    TSQLContainerGeoPoint, TSQLFacility, TSQLFacilityAttribute, TSQLFacilityCalendar,
    TSQLFacilityCalendarType, TSQLFacilityCarrierShipment, TSQLFacilityContactMech,
    TSQLFacilityContactMechPurpose, TSQLFacilityGroup, TSQLFacilityGroupMember,
    TSQLFacilityGroupRole, TSQLFacilityGroupRollup, TSQLFacilityGroupType, TSQLFacilityLocation,
    TSQLFacilityLocationGeoPoint, TSQLFacilityParty, TSQLFacilityContent, TSQLFacilityType,
    TSQLFacilityTypeAttr, TSQLProductFacility, TSQLProductFacilityLocation, TSQLProductFeature,
    TSQLProductFeatureAppl, TSQLProductFeatureApplType, TSQLProductFeatureApplAttr,
    TSQLProductFeatureCategory, TSQLProductFeatureCategoryAppl, TSQLProductFeatureCatGrpAppl,
    TSQLProductFeatureDataResource, TSQLProductFeatureGroup, TSQLProductFeatureGroupAppl,
    TSQLProductFeatureIactn, TSQLProductFeatureIactnType, TSQLProductFeatureType,
    TSQLProductFeaturePrice, TSQLInventoryItem, TSQLInventoryItemAttribute, TSQLInventoryItemDetail,
    TSQLInventoryItemStatus, TSQLInventoryItemTempRes, TSQLInventoryItemType, TSQLInventoryItemTypeAttr,
    TSQLInventoryItemVariance, TSQLInventoryItemLabelType, TSQLInventoryItemLabel,
    TSQLInventoryItemLabelAppl, TSQLInventoryTransfer, TSQLLot, TSQLPhysicalInventory,
    TSQLVarianceReason, TSQLProductPaymentMethodType, TSQLProductPrice, TSQLProductPriceAction,
    TSQLProductPriceActionType, TSQLProductPriceAutoNotice, TSQLProductPriceChange,
    TSQLProductPriceCond, TSQLProductPricePurpose, TSQLProductPriceRule, TSQLProductPriceType,
    TSQLQuantityBreak, TSQLQuantityBreakType, TSQLSaleType, TSQLGoodIdentification,
    TSQLGoodIdentificationType, TSQLProduct, TSQLProductAssoc, TSQLProductAssocType,
    TSQLProductRole, TSQLProductAttribute, TSQLProductCalculatedInfo, TSQLProductContent,
    TSQLProductContentType, TSQLProductGeo, TSQLProductGlAccount, TSQLProductKeyword,
    TSQLProductMeter, TSQLProductMeterType, TSQLProductMaint, TSQLProductMaintType,
    TSQLProductReview, TSQLProductSearchConstraint, TSQLProductSearchResult, TSQLProductType,
    TSQLProductTypeAttr, TSQLVendorProduct, TSQLProductPromo, TSQLProductPromoAction,
    TSQLProductPromoCategory, TSQLProductPromoCode, TSQLProductPromoCodeEmail, TSQLProductPromoCodeParty,
    TSQLProductPromoCond, TSQLProductPromoProduct, TSQLProductPromoRule, TSQLProductPromoUse,
    TSQLProductStore, TSQLProductStoreCatalog, TSQLProductStoreEmailSetting, TSQLProductStoreFinActSetting,
    TSQLProductStoreFacility, TSQLProductStoreGroup, TSQLProductStoreGroupMember,
    TSQLProductStoreGroupRole, TSQLProductStoreGroupRollup, TSQLProductStoreGroupType,
    TSQLProductStoreKeywordOvrd, TSQLProductStorePaymentSetting, TSQLProductStorePromoAppl,
    TSQLProductStoreRole, TSQLProductStoreShipmentMeth, TSQLProductStoreSurveyAppl,
    TSQLProductStoreVendorPayment, TSQLProductStoreVendorShipment, TSQLWebSite,
    TSQLProductSubscriptionResource, TSQLSubscription, TSQLSubscriptionActivity,
    TSQLSubscriptionAttribute, TSQLSubscriptionFulfillmentPiece, TSQLSubscriptionResource,
    TSQLSubscriptionType, TSQLSubscriptionTypeAttr, TSQLSubscriptionCommEvent, TSQLMarketInterest,
    TSQLReorderGuideline, TSQLSupplierPrefOrder, TSQLSupplierProduct, TSQLSupplierProductFeature,
    TSQLSupplierRatingType, TSQLProductPromoContent
  ], ROOT_NAME_PRODUCT);
end;

function CreateOrderModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLOrderAdjustment, TSQLOrderAdjustmentAttribute, TSQLOrderAdjustmentType,
    TSQLOrderAdjustmentBilling, TSQLOrderAdjustmentTypeAttr, TSQLOrderAttribute,
    TSQLOrderBlacklist, TSQLOrderBlacklistType, TSQLCommunicationEventOrder, TSQLOrderContactMech,
    TSQLOrderContent, TSQLOrderContentType, TSQLOrderDeliverySchedule, TSQLOrderHeader,
    TSQLOrderHeaderNote, TSQLOrderHeaderWorkEffort, TSQLOrderItem, TSQLOrderItemAssoc,
    TSQLOrderItemAssocType, TSQLOrderItemAttribute, TSQLOrderItemBilling, TSQLOrderItemChange,
    TSQLOrderItemContactMech, TSQLOrderItemGroup, TSQLOrderItemGroupOrder, TSQLOrderItemPriceInfo,
    TSQLOrderItemRole, TSQLOrderItemShipGroup, TSQLOrderItemShipGroupAssoc, TSQLOrderItemShipGrpInvRes,
    TSQLOrderItemType, TSQLOrderItemTypeAttr, TSQLOrderNotification, TSQLOrderPaymentPreference,
    TSQLOrderProductPromoCode, TSQLOrderRole, TSQLOrderShipment, TSQLOrderStatus,
    TSQLOrderSummaryEntry, TSQLOrderTerm, TSQLOrderTermAttribute, TSQLOrderType, TSQLOrderTypeAttr,
    TSQLProductOrderItem, TSQLWorkOrderItemFulfillment, TSQLQuote, TSQLQuoteAttribute,
    TSQLQuoteCoefficient, TSQLQuoteItem, TSQLQuoteNote, TSQLQuoteRole, TSQLQuoteTerm,
    TSQLQuoteTermAttribute, TSQLQuoteType, TSQLQuoteTypeAttr, TSQLQuoteWorkEffort,
    TSQLQuoteAdjustment, TSQLCustRequest, TSQLCustRequestAttribute, TSQLCustRequestCategory,
    TSQLCustRequestCommEvent, TSQLCustRequestContent, TSQLCustRequestItem, TSQLCustRequestNote,
    TSQLCustRequestItemNote, TSQLCustRequestItemWorkEffort, TSQLCustRequestResolution,
    TSQLCustRequestParty, TSQLCustRequestStatus, TSQLCustRequestType, TSQLCustRequestTypeAttr,
    TSQLCustRequestWorkEffort, TSQLRespondingParty, TSQLDesiredFeature, TSQLOrderRequirementCommitment,
    TSQLRequirement, TSQLRequirementAttribute, TSQLRequirementBudgetAllocation, TSQLRequirementCustRequest,
    TSQLRequirementRole, TSQLRequirementStatus, TSQLRequirementType, TSQLRequirementTypeAttr,
    TSQLWorkReqFulfType, TSQLWorkRequirementFulfillment, TSQLReturnAdjustment, TSQLReturnAdjustmentType,
    TSQLReturnHeader, TSQLReturnHeaderType, TSQLReturnItem, TSQLReturnItemResponse,
    TSQLReturnItemType, TSQLReturnItemTypeMap, TSQLReturnReason, TSQLReturnStatus,
    TSQLReturnType, TSQLReturnItemBilling, TSQLReturnItemShipment, TSQLReturnContactMech,
    TSQLCartAbandonedLine, TSQLShoppingList, TSQLShoppingListItem, TSQLShoppingListItemSurvey,
    TSQLShoppingListType, TSQLShoppingListWorkEffort
  ], ROOT_NAME_ORDER);
end;

function CreateAccountingModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLBudget, TSQLBudgetAttribute, TSQLBudgetItem, TSQLBudgetItemAttribute, TSQLBudgetItemType,
    TSQLBudgetItemTypeAttr, TSQLBudgetReview, TSQLBudgetReviewResultType, TSQLBudgetRevision,
    TSQLBudgetRevisionImpact, TSQLBudgetRole, TSQLBudgetScenario, TSQLBudgetScenarioApplication,
    TSQLBudgetScenarioRule, TSQLBudgetStatus, TSQLBudgetType, TSQLBudgetTypeAttr, TSQLFinAccount,
    TSQLFinAccountAttribute, TSQLFinAccountAuth, TSQLFinAccountRole, TSQLFinAccountStatus,
    TSQLFinAccountTrans, TSQLFinAccountTransAttribute, TSQLFinAccountTransType, TSQLFinAccountTransTypeAttr,
    TSQLFinAccountType, TSQLFinAccountTypeAttr, TSQLFinAccountTypeGlAccount, TSQLFixedAsset,
    TSQLFixedAssetAttribute, TSQLFixedAssetDepMethod, TSQLFixedAssetGeoPoint, TSQLFixedAssetIdent,
    TSQLFixedAssetIdentType, TSQLFixedAssetMaint, TSQLFixedAssetMeter, TSQLFixedAssetProduct,
    TSQLFixedAssetProductType, TSQLFixedAssetTypeGlAccount, TSQLFixedAssetRegistration,
    TSQLFixedAssetStdCost, TSQLFixedAssetStdCostType, TSQLFixedAssetType, TSQLFixedAssetTypeAttr,
    TSQLPartyFixedAssetAssignment, TSQLFixedAssetMaintOrder, TSQLAccommodationClass,
    TSQLAccommodationSpot, TSQLAccommodationMap, TSQLAccommodationMapType, TSQLInvoice,
    TSQLInvoiceAttribute, TSQLInvoiceContent, TSQLInvoiceContentType, TSQLInvoiceContactMech,
    TSQLInvoiceItem, TSQLInvoiceItemAssoc, TSQLInvoiceItemAssocType, TSQLInvoiceItemAttribute,
    TSQLInvoiceItemType, TSQLInvoiceItemTypeAttr, TSQLInvoiceItemTypeGlAccount, TSQLInvoiceItemTypeMap,
    TSQLInvoiceRole, TSQLInvoiceStatus, TSQLInvoiceTerm, TSQLInvoiceTermAttribute,
    TSQLInvoiceType, TSQLInvoiceTypeAttr, TSQLInvoiceNote, TSQLAcctgTrans, TSQLAcctgTransAttribute,
    TSQLAcctgTransEntry, TSQLAcctgTransEntryType, TSQLAcctgTransType, TSQLAcctgTransTypeAttr,
    TSQLGlAccount, TSQLGlAccountClass, TSQLGlAccountGroup, TSQLGlAccountGroupMember,
    TSQLGlAccountGroupType, TSQLGlAccountHistory, TSQLGlAccountOrganization, TSQLGlAccountRole,
    TSQLGlAccountType, TSQLGlAccountTypeDefault, TSQLGlBudgetXref, TSQLGlFiscalType,
    TSQLGlJournal, TSQLGlReconciliation, TSQLGlReconciliationEntry, TSQLGlResourceType,
    TSQLGlXbrlClass, TSQLPartyAcctgPreference, TSQLProductAverageCost, TSQLProductAverageCostType,
    TSQLSettlementTerm, TSQLVarianceReasonGlAccount, TSQLBillingAccount, TSQLBillingAccountRole,
    TSQLBillingAccountTerm, TSQLBillingAccountTermAttr, TSQLCreditCard, TSQLCreditCardTypeGlAccount,
    TSQLDeduction, TSQLDeductionType, TSQLEftAccount, TSQLCheckAccount, TSQLGiftCard,
    TSQLGiftCardFulfillment, TSQLPayment, TSQLPaymentApplication, TSQLPaymentAttribute,
    TSQLPaymentBudgetAllocation, TSQLPaymentContent, TSQLPaymentContentType, TSQLPaymentMethod,
    TSQLPaymentMethodType, TSQLPaymentMethodTypeGlAccount, TSQLPaymentType, TSQLPaymentTypeAttr,
    TSQLPaymentGlAccountTypeMap, TSQLPaymentGatewayConfigType, TSQLPaymentGatewayConfig,
    TSQLPaymentGatewaySagePay, TSQLPaymentGatewayAuthorizeNet, TSQLPaymentGatewayEway,
    TSQLPaymentGatewayCyberSource, TSQLPaymentGatewayPayflowPro, TSQLPaymentGatewayPayPal,
    TSQLPaymentGatewayClearCommerce, TSQLPaymentGatewayWorldPay, TSQLPaymentGatewayOrbital,
    TSQLPaymentGatewaySecurePay, TSQLPaymentGatewayiDEAL, TSQLPaymentGatewayRespMsg,
    TSQLPaymentGatewayResponse, TSQLPaymentGroup, TSQLPaymentGroupType, TSQLPaymentGroupMember,
    TSQLPayPalPaymentMethod, TSQLValueLinkKey, TSQLPartyTaxAuthInfo, TSQLTaxAuthority,
    TSQLTaxAuthorityAssoc, TSQLTaxAuthorityAssocType, TSQLTaxAuthorityCategory, TSQLTaxAuthorityGlAccount,
    TSQLTaxAuthorityRateProduct, TSQLTaxAuthorityRateType, TSQLZipSalesRuleLookup,
    TSQLZipSalesTaxLookup, TSQLPartyGlAccount, TSQLRateType, TSQLRateAmount, TSQLPartyRate,
    TSQLGlAccountCategory, TSQLGlAccountCategoryMember, TSQLGlAccountCategoryType
  ], ROOT_NAME_ACCOUNTING);
end;

function CreateWorkEffortModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLTimeEntry, TSQLTimesheet, TSQLTimesheetRole, TSQLApplicationSandbox, TSQLCommunicationEventWorkEff,
    TSQLDeliverable, TSQLDeliverableType, TSQLWorkEffort, TSQLWorkEffortAssoc, TSQLWorkEffortAssocAttribute,
    TSQLWorkEffortAssocType, TSQLWorkEffortAssocTypeAttr, TSQLWorkEffortAttribute, TSQLWorkEffortBilling,
    TSQLWorkEffortContactMech, TSQLWorkEffortContent, TSQLWorkEffortContentType, TSQLWorkEffortDeliverableProd,
    TSQLWorkEffortEventReminder, TSQLWorkEffortFixedAssetAssign, TSQLWorkEffortFixedAssetStd,
    TSQLWorkEffortGoodStandard, TSQLWorkEffortGoodStandardType, TSQLWorkEffortIcalData,
    TSQLWorkEffortInventoryAssign, TSQLWorkEffortInventoryProduced, TSQLWorkEffortCostCalc,
    TSQLWorkEffortKeyword, TSQLWorkEffortNote, TSQLWorkEffortPartyAssignment, TSQLWorkEffortPurposeType,
    TSQLWorkEffortReview, TSQLWorkEffortSearchConstraint, TSQLWorkEffortSearchResult,
    TSQLWorkEffortSkillStandard, TSQLWorkEffortStatus, TSQLWorkEffortTransBox, TSQLWorkEffortType,
    TSQLWorkEffortTypeAttr, TSQLWorkEffortSurveyAppl
  ], ROOT_NAME_WORKEFFORT);
end;

function CreateShipmentModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLItemIssuance, TSQLItemIssuanceRole, TSQLPicklist, TSQLPicklistBin, TSQLPicklistItem,
    TSQLPicklistRole, TSQLPicklistStatusHistory, TSQLRejectionReason, TSQLShipmentReceipt,
    TSQLShipmentReceiptRole, TSQLCarrierShipmentMethod, TSQLCarrierShipmentBoxType,
    TSQLDelivery, TSQLShipment, TSQLShipmentAttribute, TSQLShipmentBoxType, TSQLShipmentContactMech,
    TSQLShipmentContactMechType, TSQLShipmentCostEstimate, TSQLShipmentGatewayConfigType,
    TSQLShipmentGatewayConfig, TSQLShipmentGatewayDhl, TSQLShipmentGatewayFedex, TSQLShipmentGatewayUps,
    TSQLShipmentGatewayUsps, TSQLShipmentItem, TSQLShipmentItemBilling, TSQLShipmentItemFeature,
    TSQLShipmentMethodType, TSQLShipmentPackage, TSQLShipmentPackageContent, TSQLShipmentPackageRouteSeg,
    TSQLShipmentRouteSegment, TSQLShipmentStatus, TSQLShipmentType, TSQLShipmentTypeAttr,
    TSQLShippingDocument
  ], ROOT_NAME_SHIPMENT);
end;

function CreateMarketingModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLMarketingCampaign, TSQLMarketingCampaignNote, TSQLMarketingCampaignPrice,
    TSQLMarketingCampaignPromo, TSQLMarketingCampaignRole, TSQLContactList, TSQLWebSiteContactList,
    TSQLContactListCommStatus, TSQLContactListParty, TSQLContactListPartyStatus, TSQLContactListType,
    TSQLSegmentGroup, TSQLSegmentGroupClassification, TSQLSegmentGroupGeo, TSQLSegmentGroupRole,
    TSQLSegmentGroupType, TSQLTrackingCode, TSQLTrackingCodeOrder, TSQLTrackingCodeOrderReturn,
    TSQLTrackingCodeType, TSQLTrackingCodeVisit, TSQLSalesOpportunity, TSQLSalesOpportunityHistory,
    TSQLSalesOpportunityRole, TSQLSalesOpportunityStage, TSQLSalesOpportunityWorkEffort,
    TSQLSalesOpportunityQuote, TSQLSalesForecast, TSQLSalesForecastDetail, TSQLSalesForecastHistory,
    TSQLSalesOpportunityCompetitor, TSQLSalesOpportunityTrckCode
  ], ROOT_NAME_MARKETING);
end;

function CreateManufacturingModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLProductManufacturingRule, TSQLTechDataCalendar, TSQLTechDataCalendarExcDay,
    TSQLTechDataCalendarExcWeek, TSQLTechDataCalendarWeek, TSQLMrpEventType, TSQLMrpEvent
  ], ROOT_NAME_MANUFACTURING);
end;

function CreateHumanresModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLPartyQual, TSQLPartyQualType, TSQLPartyResume, TSQLPartySkill, TSQLPerfRatingType,
    TSQLPerfReview, TSQLPerfReviewItem, TSQLPerfReviewItemType, TSQLPerformanceNote, TSQLPersonTraining,
    TSQLResponsibilityType, TSQLSkillType, TSQLTrainingClassType, TSQLBenefitType, TSQLEmployment,
    TSQLEmploymentApp, TSQLEmploymentAppSourceType, TSQLEmplLeave, TSQLEmplLeaveType,
    TSQLPartyBenefit, TSQLPayGrade, TSQLPayHistory, TSQLPayrollPreference, TSQLSalaryStep,
    TSQLTerminationReason, TSQLTerminationType, TSQLUnemploymentClaim, TSQLEmplPosition,
    TSQLEmplPositionClassType, TSQLEmplPositionFulfillment, TSQLEmplPositionReportingStruct,
    TSQLEmplPositionResponsibility, TSQLEmplPositionType, TSQLEmplPositionTypeClass,
    TSQLValidResponsibility, TSQLEmplPositionTypeRate, TSQLJobRequisition, TSQLJobInterview,
    TSQLJobInterviewType, TSQLTrainingRequest, TSQLEmplLeaveReasonType
  ], ROOT_NAME_HUMANRES);
end;

function CreateCommonModel: TSQLModel;
begin
  result := TSQLModel.Create([
    TSQLDataSource, TSQLDataSourceType, TSQLEmailTemplateSetting, TSQLEnumeration,
    TSQLEnumerationType, TSQLCountryCapital, TSQLCountryCode, TSQLCountryTeleCode,
    TSQLCountryAddressFormat, TSQLGeo, TSQLGeoAssoc, TSQLGeoAssocType, TSQLGeoPoint,
    TSQLGeoType, TSQLKeywordThesaurus, TSQLStandardLanguage, TSQLCustomMethod, TSQLCustomMethodType,
    TSQLNoteData, TSQLCustomTimePeriod, TSQLPeriodType, TSQLStatusItem, TSQLStatusType,
    TSQLStatusValidChange, TSQLUom, TSQLUomConversion, TSQLUomConversionDated, TSQLUomGroup,
    TSQLUomType, TSQLUserPreference, TSQLUserPrefGroupType, TSQLVisualThemeSet, TSQLVisualTheme,
    TSQLVisualThemeResource, TSQLPortalPortlet, TSQLPortletCategory, TSQLPortletPortletCategory,
    TSQLPortalPage, TSQLPortalPageColumn, TSQLPortalPagePortlet, TSQLPortletAttribute,
    TSQLSystemProperty
  ], ROOT_NAME_COMMON);
end;

end.

