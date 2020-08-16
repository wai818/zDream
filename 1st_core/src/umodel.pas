unit uModel;

{$mode objfpc}{$H+}

interface

uses
  mORMot, uOrder, uParty, uProduct;
  //Classes, SysUtils;

const
  //ROOT_NAME = 'core';
  ROOT_NAME_PARTY = 'party';
  ROOT_NAME_PRODUCT = 'product';
  ROOT_NAME_ORDER = 'order';
  ROOT_NAME_ACCOUNTING = 'accounting';

  //function CreateModel: TSQLModel;
  function CreatePartyModel: TSQLModel;
  function CreateProductModel: TSQLModel;
  function CreateOrderModel: TSQLModel;
  function CreateAccountingModel: TSQLModel;

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
    TSQLRoleTypeAttr, TSQLVendor, TSQLCustomTimePeriod, TSQLNoteData, TSQLServerHit,
    TSQLServerHitBin, TSQLVisit, TSQLVisitor, TSQLUserLogin, TSQLUserLoginHistory
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
    TSQLBillingAccountTerm, TSQLBillingAccountTermAttr, TSQLCreditCard
  ], ROOT_NAME_ACCOUNTING);
end;

end.

