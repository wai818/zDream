unit uForwardDeclaration;

{$mode objfpc}{$H+}

interface

uses
   SynCommons, mORMot;//Classes, SysUtils;

type
  TSQLUserLogin = class of TSQLRecord;
  TSQLUserLoginID = type TID;
  TSQLUserLoginToBeDeletedID = type TID;

  TSQLContent = class of TSQLRecord;
  TSQLContentID = type TID;
  TSQLContentToBeDeletedID = type TID;

  TSQLRecurrenceInfo = class of TSQLRecord;
  TSQLRecurrenceInfoID = type TID;
  TSQLRecurrenceInfoToBeDeletedID = type TID;

  TSQLSurveyResponse = class of TSQLRecord;
  TSQLSurveyResponseID = type TID;
  TSQLSurveyResponseToBeDeletedID = type TID;

  TSQLDataResource = class of TSQLRecord;
  TSQLDataResourceID = type TID;
  TSQLDataResourceToBeDeletedID = type TID;

  TSQLSurvey = class of TSQLRecord;
  TSQLSurveyID = type TID;
  TSQLSurveyToBeDeletedID = type TID;

  TSQLSurveyApplType = class of TSQLRecord;
  TSQLSurveyApplTypeID = type TID;
  TSQLSurveyApplTypeToBeDeletedID = type TID;

  TSQLJobSandbox = class of TSQLRecord;
  TSQLJobSandboxID = type TID;
  TSQLJobSandboxToBeDeletedID = type TID;

  TSQLPaymentGatewayConfigTyp = class of TSQLRecord;
  TSQLPaymentGatewayConfigTypID = type TID;
  TSQLPaymentGatewayConfigTypToBeDeletedID = type TID;

  TSQLDocument = class of TSQLRecord;
  TSQLDocumentID = type TID;
  TSQLDocumentToBeDeletedID = type TID;

  TSQLRuntimeData = class of TSQLRecord;
  TSQLRuntimeDataID = type TID;
  TSQLRuntimeDataToBeDeletedID = type TID;

  TSQLTemporalExpression = class of TSQLRecord;
  TSQLTemporalExpressionID = type TID;
  TSQLTemporalExpressionToBeDeletedID = type TID;

  TSQLSecurityGroup = class of TSQLRecord;
  TSQLSecurityGroupID = type TID;
  TSQLSecurityGroupToBeDeletedID = type TID;







  // apache-ofbiz\applications\datamodel\entitydef\party-entitymodel.xml
  TSQLAddendum = class of TSQLRecord;
  TSQLAddendumID = type TID;
  TSQLAddendumToBeDeletedID = type TID;

  TSQLAgreement = class of TSQLRecord;
  TSQLAgreementID = type TID;
  TSQLAgreementToBeDeletedID = type TID;

  TSQLAgreementAttribute = class of TSQLRecord;
  TSQLAgreementAttributeID = type TID;
  TSQLAgreementAttributeToBeDeletedID = type TID;

  TSQLAgreementGeographicalApplic = class of TSQLRecord;
  TSQLAgreementGeographicalApplicID = type TID;
  TSQLAgreementGeographicalApplicToBeDeletedID = type TID;

  TSQLAgreementItem = class of TSQLRecord;
  TSQLAgreementItemID = type TID;
  TSQLAgreementItemToBeDeletedID = type TID;

  TSQLAgreementItemAttribute = class of TSQLRecord;
  TSQLAgreementItemAttributeID = type TID;
  TSQLAgreementItemAttributeToBeDeletedID = type TID;

  TSQLAgreementItemType = class of TSQLRecord;
  TSQLAgreementItemTypeID = type TID;
  TSQLAgreementItemTypeToBeDeletedID = type TID;

  TSQLAgreementItemTypeAttr = class of TSQLRecord;
  TSQLAgreementItemTypeAttrID = type TID;
  TSQLAgreementItemTypeAttrToBeDeletedID = type TID;

  TSQLAgreementContent = class of TSQLRecord;
  TSQLAgreementContentID = type TID;
  TSQLAgreementContentToBeDeletedID = type TID;

  TSQLAgreementContentType = class of TSQLRecord;
  TSQLAgreementContentTypeID = type TID;
  TSQLAgreementContentTypeToBeDeletedID = type TID;

  TSQLAgreementPartyApplic = class of TSQLRecord;
  TSQLAgreementPartyApplicID = type TID;
  TSQLAgreementPartyApplicToBeDeletedID = type TID;

  TSQLAgreementProductAppl = class of TSQLRecord;
  TSQLAgreementProductApplID = type TID;
  TSQLAgreementProductApplToBeDeletedID = type TID;

  TSQLAgreementPromoAppl = class of TSQLRecord;
  TSQLAgreementPromoApplID = type TID;
  TSQLAgreementPromoApplToBeDeletedID = type TID;

  TSQLAgreementFacilityAppl = class of TSQLRecord;
  TSQLAgreementFacilityApplID = type TID;
  TSQLAgreementFacilityApplToBeDeletedID = type TID;

  TSQLAgreementRole = class of TSQLRecord;
  TSQLAgreementRoleID = type TID;
  TSQLAgreementRoleToBeDeletedID = type TID;

  TSQLAgreementTerm = class of TSQLRecord;
  TSQLAgreementTermID = type TID;
  TSQLAgreementTermToBeDeletedID = type TID;

  TSQLAgreementTermAttribute = class of TSQLRecord;
  TSQLAgreementTermAttributeID = type TID;
  TSQLAgreementTermAttributeToBeDeletedID = type TID;

  TSQLAgreementType = class of TSQLRecord;
  TSQLAgreementTypeID = type TID;
  TSQLAgreementTypeToBeDeletedID = type TID;

  TSQLAgreementTypeAttr = class of TSQLRecord;
  TSQLAgreementTypeAttrID = type TID;
  TSQLAgreementTypeAttrToBeDeletedID = type TID;

  TSQLAgreementWorkEffortApplic = class of TSQLRecord;
  TSQLAgreementWorkEffortApplicID = type TID;
  TSQLAgreementWorkEffortApplicToBeDeletedID = type TID;

  TSQLTermType = class of TSQLRecord;
  TSQLTermTypeID = type TID;
  TSQLTermTypeToBeDeletedID = type TID;

  TSQLTermTypeAttr = class of TSQLRecord;
  TSQLTermTypeAttrID = type TID;
  TSQLTermTypeAttrToBeDeletedID = type TID;

  TSQLAgreementEmploymentAppl = class of TSQLRecord;
  TSQLAgreementEmploymentApplID = type TID;
  TSQLAgreementEmploymentApplToBeDeletedID = type TID;

  TSQLCommContentAssocType = class of TSQLRecord;
  TSQLCommContentAssocTypeID = type TID;
  TSQLCommContentAssocTypeToBeDeletedID = type TID;

  TSQLCommEventContentAssoc = class of TSQLRecord;
  TSQLCommEventContentAssocID = type TID;
  TSQLCommEventContentAssocToBeDeletedID = type TID;

  TSQLCommunicationEvent = class of TSQLRecord;
  TSQLCommunicationEventID = type TID;
  TSQLCommunicationEventToBeDeletedID = type TID;

  TSQLCommunicationEventProduct = class of TSQLRecord;
  TSQLCommunicationEventProductID = type TID;
  TSQLCommunicationEventProductToBeDeletedID = type TID;

  TSQLCommunicationEventPrpTyp = class of TSQLRecord;
  TSQLCommunicationEventPrpTypID = type TID;
  TSQLCommunicationEventPrpTypToBeDeletedID = type TID;

  TSQLCommunicationEventPurpose = class of TSQLRecord;
  TSQLCommunicationEventPurposeID = type TID;
  TSQLCommunicationEventPurposeToBeDeletedID = type TID;

  TSQLCommunicationEventRole = class of TSQLRecord;
  TSQLCommunicationEventRoleID = type TID;
  TSQLCommunicationEventRoleToBeDeletedID = type TID;

  TSQLCommunicationEventType = class of TSQLRecord;
  TSQLCommunicationEventTypeID = type TID;
  TSQLCommunicationEventTypeToBeDeletedID = type TID;

  TSQLContactMech = class of TSQLRecord;
  TSQLContactMechID = type TID;
  TSQLContactMechToBeDeletedID = type TID;

  TSQLContactMechAttribute = class of TSQLRecord;
  TSQLContactMechAttributeID = type TID;
  TSQLContactMechAttributeToBeDeletedID = type TID;

  TSQLContactMechLink = class of TSQLRecord;
  TSQLContactMechLinkID = type TID;
  TSQLContactMechLinkToBeDeletedID = type TID;

  TSQLContactMechPurposeType = class of TSQLRecord;
  TSQLContactMechPurposeTypeID = type TID;
  TSQLContactMechPurposeTypeToBeDeletedID = type TID;

  TSQLContactMechType = class of TSQLRecord;
  TSQLContactMechTypeID = type TID;
  TSQLContactMechTypeToBeDeletedID = type TID;

  TSQLContactMechTypeAttr = class of TSQLRecord;
  TSQLContactMechTypeAttrID = type TID;
  TSQLContactMechTypeAttrToBeDeletedID = type TID;

  TSQLContactMechTypePurpose = class of TSQLRecord;
  TSQLContactMechTypePurposeID = type TID;
  TSQLContactMechTypePurposeToBeDeletedID = type TID;

  TSQLEmailAddressVerification = class of TSQLRecord;
  TSQLEmailAddressVerificationID = type TID;
  TSQLEmailAddressVerificationToBeDeletedID = type TID;

  TSQLPartyContactMech = class of TSQLRecord;
  TSQLPartyContactMechID = type TID;
  TSQLPartyContactMechToBeDeletedID = type TID;

  TSQLPartyContactMechPurpose = class of TSQLRecord;
  TSQLPartyContactMechPurposeID = type TID;
  TSQLPartyContactMechPurposeToBeDeletedID = type TID;

  TSQLPostalAddress = class of TSQLRecord;
  TSQLPostalAddressID = type TID;
  TSQLPostalAddressToBeDeletedID = type TID;

  TSQLPostalAddressBoundary = class of TSQLRecord;
  TSQLPostalAddressBoundaryID = type TID;
  TSQLPostalAddressBoundaryToBeDeletedID = type TID;

  TSQLTelecomNumber = class of TSQLRecord;
  TSQLTelecomNumberID = type TID;
  TSQLTelecomNumberToBeDeletedID = type TID;

  TSQLValidContactMechRole = class of TSQLRecord;
  TSQLValidContactMechRoleID = type TID;
  TSQLValidContactMechRoleToBeDeletedID = type TID;

  TSQLNeedType = class of TSQLRecord;
  TSQLNeedTypeID = type TID;
  TSQLNeedTypeToBeDeletedID = type TID;

  TSQLPartyNeed = class of TSQLRecord;
  TSQLPartyNeedID = type TID;
  TSQLPartyNeedToBeDeletedID = type TID;

  TSQLAddressMatchMap = class of TSQLRecord;
  TSQLAddressMatchMapID = type TID;
  TSQLAddressMatchMapToBeDeletedID = type TID;

  TSQLAffiliate = class of TSQLRecord;
  TSQLAffiliateID = type TID;
  TSQLAffiliateToBeDeletedID = type TID;

  TSQLParty = class of TSQLRecord;
  TSQLPartyID = type TID;
  TSQLPartyToBeDeletedID = type TID;

  TSQLPartyIdentification = class of TSQLRecord;
  TSQLPartyIdentificationID = type TID;
  TSQLPartyIdentificationToBeDeletedID = type TID;

  TSQLPartyIdentificationType = class of TSQLRecord;
  TSQLPartyIdentificationTypeID = type TID;
  TSQLPartyIdentificationTypeToBeDeletedID = type TID;

  TSQLPartyGeoPoint = class of TSQLRecord;
  TSQLPartyGeoPointID = type TID;
  TSQLPartyGeoPointToBeDeletedID = type TID;

  TSQLPartyAttribute = class of TSQLRecord;
  TSQLPartyAttributeID = type TID;
  TSQLPartyAttributeToBeDeletedID = type TID;

  TSQLPartyCarrierAccount = class of TSQLRecord;
  TSQLPartyCarrierAccountID = type TID;
  TSQLPartyCarrierAccountToBeDeletedID = type TID;

  TSQLPartyClassification = class of TSQLRecord;
  TSQLPartyClassificationID = type TID;
  TSQLPartyClassificationToBeDeletedID = type TID;

  TSQLPartyClassificationGroup = class of TSQLRecord;
  TSQLPartyClassificationGroupID = type TID;
  TSQLPartyClassificationGroupToBeDeletedID = type TID;

  TSQLPartyClassificationType = class of TSQLRecord;
  TSQLPartyClassificationTypeID = type TID;
  TSQLPartyClassificationTypeToBeDeletedID = type TID;

  TSQLPartyContent = class of TSQLRecord;
  TSQLPartyContentID = type TID;
  TSQLPartyContentToBeDeletedID = type TID;

  TSQLPartyContentType = class of TSQLRecord;
  TSQLPartyContentTypeID = type TID;
  TSQLPartyContentTypeToBeDeletedID = type TID;

  TSQLPartyDataSource = class of TSQLRecord;
  TSQLPartyDataSourceID = type TID;
  TSQLPartyDataSourceToBeDeletedID = type TID;

  TSQLPartyGroup = class of TSQLRecord;
  TSQLPartyGroupID = type TID;
  TSQLPartyGroupToBeDeletedID = type TID;

  TSQLPartyIcsAvsOverride = class of TSQLRecord;
  TSQLPartyIcsAvsOverrideID = type TID;
  TSQLPartyIcsAvsOverrideToBeDeletedID = type TID;

  TSQLPartyInvitation = class of TSQLRecord;
  TSQLPartyInvitationID = type TID;
  TSQLPartyInvitationToBeDeletedID = type TID;

  TSQLPartyInvitationGroupAssoc = class of TSQLRecord;
  TSQLPartyInvitationGroupAssocID = type TID;
  TSQLPartyInvitationGroupAssocToBeDeletedID = type TID;

  TSQLPartyInvitationRoleAssoc = class of TSQLRecord;
  TSQLPartyInvitationRoleAssocID = type TID;
  TSQLPartyInvitationRoleAssocToBeDeletedID = type TID;

  TSQLPartyNameHistory = class of TSQLRecord;
  TSQLPartyNameHistoryID = type TID;
  TSQLPartyNameHistoryToBeDeletedID = type TID;

  TSQLPartyNote = class of TSQLRecord;
  TSQLPartyNoteID = type TID;
  TSQLPartyNoteToBeDeletedID = type TID;

  TSQLPartyProfileDefault = class of TSQLRecord;
  TSQLPartyProfileDefaultID = type TID;
  TSQLPartyProfileDefaultToBeDeletedID = type TID;

  TSQLPartyRelationship = class of TSQLRecord;
  TSQLPartyRelationshipID = type TID;
  TSQLPartyRelationshipToBeDeletedID = type TID;

  TSQLPartyRelationshipType = class of TSQLRecord;
  TSQLPartyRelationshipTypeID = type TID;
  TSQLPartyRelationshipTypeToBeDeletedID = type TID;

  TSQLPartyRole = class of TSQLRecord;
  TSQLPartyRoleID = type TID;
  TSQLPartyRoleToBeDeletedID = type TID;

  TSQLPartyStatus = class of TSQLRecord;
  TSQLPartyStatusID = type TID;
  TSQLPartyStatusToBeDeletedID = type TID;

  TSQLPartyType = class of TSQLRecord;
  TSQLPartyTypeID = type TID;
  TSQLPartyTypeToBeDeletedID = type TID;

  TSQLPartyTypeAttr = class of TSQLRecord;
  TSQLPartyTypeAttrID = type TID;
  TSQLPartyTypeAttrToBeDeletedID = type TID;

  TSQLPerson = class of TSQLRecord;
  TSQLPersonID = type TID;
  TSQLPersonToBeDeletedID = type TID;

  TSQLPriorityType = class of TSQLRecord;
  TSQLPriorityTypeID = type TID;
  TSQLPriorityTypeToBeDeletedID = type TID;

  TSQLRoleType = class of TSQLRecord;
  TSQLRoleTypeID = type TID;
  TSQLRoleTypeToBeDeletedID = type TID;

  TSQLRoleTypeAttr = class of TSQLRecord;
  TSQLRoleTypeAttrID = type TID;
  TSQLRoleTypeAttrToBeDeletedID = type TID;

  TSQLVendor = class of TSQLRecord;
  TSQLVendorID = type TID;
  TSQLVendorToBeDeletedID = type TID;


  // apache-ofbiz\applications\datamodel\entitydef\product-entitymodel.xml
  TSQLProdCatalog = class of TSQLRecord;
  TSQLProdCatalogID = type TID;
  TSQLProdCatalogToBeDeletedID = type TID;

  TSQLProdCatalogCategory = class of TSQLRecord;
  TSQLProdCatalogCategoryID = type TID;
  TSQLProdCatalogCategoryToBeDeletedID = type TID;

  TSQLProdCatalogCategoryType = class of TSQLRecord;
  TSQLProdCatalogCategoryTypeID = type TID;
  TSQLProdCatalogCategoryTypeToBeDeletedID = type TID;

  TSQLProdCatalogInvFacility = class of TSQLRecord;
  TSQLProdCatalogInvFacilityID = type TID;
  TSQLProdCatalogInvFacilityToBeDeletedID = type TID;

  TSQLProdCatalogRole = class of TSQLRecord;
  TSQLProdCatalogRoleID = type TID;
  TSQLProdCatalogRoleToBeDeletedID = type TID;

  TSQLProductCategory = class of TSQLRecord;
  TSQLProductCategoryID = type TID;
  TSQLProductCategoryToBeDeletedID = type TID;

  TSQLProductCategoryAttribute = class of TSQLRecord;
  TSQLProductCategoryAttributeID = type TID;
  TSQLProductCategoryAttributeToBeDeletedID = type TID;

  TSQLProductCategoryContent = class of TSQLRecord;
  TSQLProductCategoryContentID = type TID;
  TSQLProductCategoryContentToBeDeletedID = type TID;

  TSQLProductCategoryContentType = class of TSQLRecord;
  TSQLProductCategoryContentTypeID = type TID;
  TSQLProductCategoryContentTypeToBeDeletedID = type TID;

  TSQLProductCategoryGlAccount = class of TSQLRecord;
  TSQLProductCategoryGlAccountID = type TID;
  TSQLProductCategoryGlAccountToBeDeletedID = type TID;

  TSQLProductCategoryLink = class of TSQLRecord;
  TSQLProductCategoryLinkID = type TID;
  TSQLProductCategoryLinkToBeDeletedID = type TID;

  TSQLProductCategoryMember = class of TSQLRecord;
  TSQLProductCategoryMemberID = type TID;
  TSQLProductCategoryMemberToBeDeletedID = type TID;

  TSQLProductCategoryRole = class of TSQLRecord;
  TSQLProductCategoryRoleID = type TID;
  TSQLProductCategoryRoleToBeDeletedID = type TID;

  TSQLProductCategoryRollup = class of TSQLRecord;
  TSQLProductCategoryRollupID = type TID;
  TSQLProductCategoryRollupToBeDeletedID = type TID;

  TSQLProductCategoryType = class of TSQLRecord;
  TSQLProductCategoryTypeID = type TID;
  TSQLProductCategoryTypeToBeDeletedID = type TID;

  TSQLProductCategoryTypeAttr = class of TSQLRecord;
  TSQLProductCategoryTypeAttrID = type TID;
  TSQLProductCategoryTypeAttrToBeDeletedID = type TID;

  TSQLProductConfig = class of TSQLRecord;
  TSQLProductConfigID = type TID;
  TSQLProductConfigToBeDeletedID = type TID;

  TSQLProductConfigItem = class of TSQLRecord;
  TSQLProductConfigItemID = type TID;
  TSQLProductConfigItemToBeDeletedID = type TID;

  TSQLProdConfItemContent = class of TSQLRecord;
  TSQLProdConfItemContentID = type TID;
  TSQLProdConfItemContentToBeDeletedID = type TID;

  TSQLProdConfItemContentType = class of TSQLRecord;
  TSQLProdConfItemContentTypeID = type TID;
  TSQLProdConfItemContentTypeToBeDeletedID = type TID;

  TSQLProductConfigOption = class of TSQLRecord;
  TSQLProductConfigOptionID = type TID;
  TSQLProductConfigOptionToBeDeletedID = type TID;

  TSQLProductConfigOptionIactn = class of TSQLRecord;
  TSQLProductConfigOptionIactnID = type TID;
  TSQLProductConfigOptionIactnToBeDeletedID = type TID;

  TSQLProductConfigProduct = class of TSQLRecord;
  TSQLProductConfigProductID = type TID;
  TSQLProductConfigProductToBeDeletedID = type TID;

  TSQLProductConfigConfig = class of TSQLRecord;
  TSQLProductConfigConfigID = type TID;
  TSQLProductConfigConfigToBeDeletedID = type TID;

  TSQLProductConfigStats = class of TSQLRecord;
  TSQLProductConfigStatsID = type TID;
  TSQLProductConfigStatsToBeDeletedID = type TID;

  TSQLConfigOptionProductOption = class of TSQLRecord;
  TSQLConfigOptionProductOptionID = type TID;
  TSQLConfigOptionProductOptionToBeDeletedID = type TID;

  TSQLCostComponent = class of TSQLRecord;
  TSQLCostComponentID = type TID;
  TSQLCostComponentToBeDeletedID = type TID;

  TSQLCostComponentAttribute = class of TSQLRecord;
  TSQLCostComponentAttributeID = type TID;
  TSQLCostComponentAttributeToBeDeletedID = type TID;

  TSQLCostComponentType = class of TSQLRecord;
  TSQLCostComponentTypeID = type TID;
  TSQLCostComponentTypeToBeDeletedID = type TID;

  TSQLCostComponentTypeAttr = class of TSQLRecord;
  TSQLCostComponentTypeAttrID = type TID;
  TSQLCostComponentTypeAttrToBeDeletedID = type TID;

  TSQLCostComponentCalc = class of TSQLRecord;
  TSQLCostComponentCalcID = type TID;
  TSQLCostComponentCalcToBeDeletedID = type TID;

  TSQLProductCostComponentCalc = class of TSQLRecord;
  TSQLProductCostComponentCalcID = type TID;
  TSQLProductCostComponentCalcToBeDeletedID = type TID;

  TSQLContainer = class of TSQLRecord;
  TSQLContainerID = type TID;
  TSQLContainerToBeDeletedID = type TID;

  TSQLContainerType = class of TSQLRecord;
  TSQLContainerTypeID = type TID;
  TSQLContainerTypeToBeDeletedID = type TID;

  TSQLContainerGeoPoint = class of TSQLRecord;
  TSQLContainerGeoPointID = type TID;
  TSQLContainerGeoPointToBeDeletedID = type TID;

  TSQLFacility = class of TSQLRecord;
  TSQLFacilityID = type TID;
  TSQLFacilityToBeDeletedID = type TID;

  TSQLFacilityAttribute = class of TSQLRecord;
  TSQLFacilityAttributeID = type TID;
  TSQLFacilityAttributeToBeDeletedID = type TID;

  TSQLFacilityCalendar = class of TSQLRecord;
  TSQLFacilityCalendarID = type TID;
  TSQLFacilityCalendarToBeDeletedID = type TID;

  TSQLFacilityCalendarType = class of TSQLRecord;
  TSQLFacilityCalendarTypeID = type TID;
  TSQLFacilityCalendarTypeToBeDeletedID = type TID;

  TSQLFacilityCarrierShipment = class of TSQLRecord;
  TSQLFacilityCarrierShipmentID = type TID;
  TSQLFacilityCarrierShipmentToBeDeletedID = type TID;

  TSQLFacilityContactMech = class of TSQLRecord;
  TSQLFacilityContactMechID = type TID;
  TSQLFacilityContactMechToBeDeletedID = type TID;

  TSQLFacilityContactMechPurpose = class of TSQLRecord;
  TSQLFacilityContactMechPurposeID = type TID;
  TSQLFacilityContactMechPurposeToBeDeletedID = type TID;

  TSQLFacilityGroup = class of TSQLRecord;
  TSQLFacilityGroupID = type TID;
  TSQLFacilityGroupToBeDeletedID = type TID;

  TSQLFacilityGroupMember = class of TSQLRecord;
  TSQLFacilityGroupMemberID = type TID;
  TSQLFacilityGroupMemberToBeDeletedID = type TID;

  TSQLFacilityGroupRole = class of TSQLRecord;
  TSQLFacilityGroupRoleID = type TID;
  TSQLFacilityGroupRoleToBeDeletedID = type TID;

  TSQLFacilityGroupRollup = class of TSQLRecord;
  TSQLFacilityGroupRollupID = type TID;
  TSQLFacilityGroupRollupToBeDeletedID = type TID;

  TSQLFacilityGroupType = class of TSQLRecord;
  TSQLFacilityGroupTypeID = type TID;
  TSQLFacilityGroupTypeToBeDeletedID = type TID;

  TSQLFacilityLocation = class of TSQLRecord;
  TSQLFacilityLocationID = type TID;
  TSQLFacilityLocationToBeDeletedID = type TID;

  TSQLFacilityLocationGeoPoint = class of TSQLRecord;
  TSQLFacilityLocationGeoPointID = type TID;
  TSQLFacilityLocationGeoPointToBeDeletedID = type TID;

  TSQLFacilityParty = class of TSQLRecord;
  TSQLFacilityPartyID = type TID;
  TSQLFacilityPartyToBeDeletedID = type TID;

  TSQLFacilityContent = class of TSQLRecord;
  TSQLFacilityContentID = type TID;
  TSQLFacilityContentToBeDeletedID = type TID;

  TSQLFacilityType = class of TSQLRecord;
  TSQLFacilityTypeID = type TID;
  TSQLFacilityTypeToBeDeletedID = type TID;

  TSQLFacilityTypeAttr = class of TSQLRecord;
  TSQLFacilityTypeAttrID = type TID;
  TSQLFacilityTypeAttrToBeDeletedID = type TID;

  TSQLProductFacility = class of TSQLRecord;
  TSQLProductFacilityID = type TID;
  TSQLProductFacilityToBeDeletedID = type TID;

  TSQLProductFacilityLocation = class of TSQLRecord;
  TSQLProductFacilityLocationID = type TID;
  TSQLProductFacilityLocationToBeDeletedID = type TID;

  TSQLProductFeature = class of TSQLRecord;
  TSQLProductFeatureID = type TID;
  TSQLProductFeatureToBeDeletedID = type TID;

  TSQLProductFeatureAppl = class of TSQLRecord;
  TSQLProductFeatureApplID = type TID;
  TSQLProductFeatureApplToBeDeletedID = type TID;

  TSQLProductFeatureApplType = class of TSQLRecord;
  TSQLProductFeatureApplTypeID = type TID;
  TSQLProductFeatureApplTypeToBeDeletedID = type TID;

  TSQLProductFeatureApplAttr = class of TSQLRecord;
  TSQLProductFeatureApplAttrID = type TID;
  TSQLProductFeatureApplAttrToBeDeletedID = type TID;

  TSQLProductFeatureCategory = class of TSQLRecord;
  TSQLProductFeatureCategoryID = type TID;
  TSQLProductFeatureCategoryToBeDeletedID = type TID;

  TSQLProductFeatureCategoryAppl = class of TSQLRecord;
  TSQLProductFeatureCategoryApplID = type TID;
  TSQLProductFeatureCategoryApplToBeDeletedID = type TID;

  TSQLProductFeatureCatGrpAppl = class of TSQLRecord;
  TSQLProductFeatureCatGrpApplID = type TID;
  TSQLProductFeatureCatGrpApplToBeDeletedID = type TID;

  TSQLProductFeatureDataResource = class of TSQLRecord;
  TSQLProductFeatureDataResourceID = type TID;
  TSQLProductFeatureDataResourceToBeDeletedID = type TID;

  TSQLProductFeatureGroup = class of TSQLRecord;
  TSQLProductFeatureGroupID = type TID;
  TSQLProductFeatureGroupToBeDeletedID = type TID;

  TSQLProductFeatureGroupAppl = class of TSQLRecord;
  TSQLProductFeatureGroupApplID = type TID;
  TSQLProductFeatureGroupApplToBeDeletedID = type TID;

  TSQLProductFeatureIactn = class of TSQLRecord;
  TSQLProductFeatureIactnID = type TID;
  TSQLProductFeatureIactnToBeDeletedID = type TID;

  TSQLProductFeatureIactnType = class of TSQLRecord;
  TSQLProductFeatureIactnTypeID = type TID;
  TSQLProductFeatureIactnTypeToBeDeletedID = type TID;

  TSQLProductFeatureType = class of TSQLRecord;
  TSQLProductFeatureTypeID = type TID;
  TSQLProductFeatureTypeToBeDeletedID = type TID;

  TSQLProductFeaturePrice = class of TSQLRecord;
  TSQLProductFeaturePriceID = type TID;
  TSQLProductFeaturePriceToBeDeletedID = type TID;

  TSQLInventoryItem = class of TSQLRecord;
  TSQLInventoryItemID = type TID;
  TSQLInventoryItemToBeDeletedID = type TID;

  TSQLInventoryItemAttribute = class of TSQLRecord;
  TSQLInventoryItemAttributeID = type TID;
  TSQLInventoryItemAttributeToBeDeletedID = type TID;

  TSQLInventoryItemDetail = class of TSQLRecord;
  TSQLInventoryItemDetailID = type TID;
  TSQLInventoryItemDetailToBeDeletedID = type TID;

  TSQLInventoryItemStatus = class of TSQLRecord;
  TSQLInventoryItemStatusID = type TID;
  TSQLInventoryItemStatusToBeDeletedID = type TID;

  TSQLInventoryItemTempRes = class of TSQLRecord;
  TSQLInventoryItemTempResID = type TID;
  TSQLInventoryItemTempResToBeDeletedID = type TID;

  TSQLInventoryItemType = class of TSQLRecord;
  TSQLInventoryItemTypeID = type TID;
  TSQLInventoryItemTypeToBeDeletedID = type TID;

  TSQLInventoryItemTypeAttr = class of TSQLRecord;
  TSQLInventoryItemTypeAttrID = type TID;
  TSQLInventoryItemTypeAttrToBeDeletedID = type TID;

  TSQLInventoryItemVariance = class of TSQLRecord;
  TSQLInventoryItemVarianceID = type TID;
  TSQLInventoryItemVarianceToBeDeletedID = type TID;

  TSQLInventoryItemLabelType = class of TSQLRecord;
  TSQLInventoryItemLabelTypeID = type TID;
  TSQLInventoryItemLabelTypeToBeDeletedID = type TID;

  TSQLInventoryItemLabel = class of TSQLRecord;
  TSQLInventoryItemLabelID = type TID;
  TSQLInventoryItemLabelToBeDeletedID = type TID;

  TSQLInventoryItemLabelAppl = class of TSQLRecord;
  TSQLInventoryItemLabelApplID = type TID;
  TSQLInventoryItemLabelApplToBeDeletedID = type TID;

  TSQLInventoryTransfer = class of TSQLRecord;
  TSQLInventoryTransferID = type TID;
  TSQLInventoryTransferToBeDeletedID = type TID;

  TSQLLot = class of TSQLRecord;
  TSQLLotID = type TID;
  TSQLLotToBeDeletedID = type TID;

  TSQLPhysicalInventory = class of TSQLRecord;
  TSQLPhysicalInventoryID = type TID;
  TSQLPhysicalInventoryToBeDeletedID = type TID;

  TSQLVarianceReason = class of TSQLRecord;
  TSQLVarianceReasonID = type TID;
  TSQLVarianceReasonToBeDeletedID = type TID;

  TSQLProductPaymentMethodType = class of TSQLRecord;
  TSQLProductPaymentMethodTypeID = type TID;
  TSQLProductPaymentMethodTypeToBeDeletedID = type TID;

  TSQLProductPrice = class of TSQLRecord;
  TSQLProductPriceID = type TID;
  TSQLProductPriceToBeDeletedID = type TID;

  TSQLProductPriceAction = class of TSQLRecord;
  TSQLProductPriceActionID = type TID;
  TSQLProductPriceActionToBeDeletedID = type TID;

  TSQLProductPriceActionType = class of TSQLRecord;
  TSQLProductPriceActionTypeID = type TID;
  TSQLProductPriceActionTypeToBeDeletedID = type TID;

  TSQLProductPriceAutoNotice = class of TSQLRecord;
  TSQLProductPriceAutoNoticeID = type TID;
  TSQLProductPriceAutoNoticeToBeDeletedID = type TID;

  TSQLProductPriceChange = class of TSQLRecord;
  TSQLProductPriceChangeID = type TID;
  TSQLProductPriceChangeToBeDeletedID = type TID;

  TSQLProductPriceCond = class of TSQLRecord;
  TSQLProductPriceCondID = type TID;
  TSQLProductPriceCondToBeDeletedID = type TID;

  TSQLProductPricePurpose = class of TSQLRecord;
  TSQLProductPricePurposeID = type TID;
  TSQLProductPricePurposeToBeDeletedID = type TID;

  TSQLProductPriceRule = class of TSQLRecord;
  TSQLProductPriceRuleID = type TID;
  TSQLProductPriceRuleToBeDeletedID = type TID;

  TSQLProductPriceType = class of TSQLRecord;
  TSQLProductPriceTypeID = type TID;
  TSQLProductPriceTypeToBeDeletedID = type TID;

  TSQLQuantityBreak = class of TSQLRecord;
  TSQLQuantityBreakID = type TID;
  TSQLQuantityBreakToBeDeletedID = type TID;

  TSQLQuantityBreakType = class of TSQLRecord;
  TSQLQuantityBreakTypeID = type TID;
  TSQLQuantityBreakTypeToBeDeletedID = type TID;

  TSQLSaleType = class of TSQLRecord;
  TSQLSaleTypeID = type TID;
  TSQLSaleTypeToBeDeletedID = type TID;

  TSQLGoodIdentification = class of TSQLRecord;
  TSQLGoodIdentificationID = type TID;
  TSQLGoodIdentificationToBeDeletedID = type TID;

  TSQLGoodIdentificationType = class of TSQLRecord;
  TSQLGoodIdentificationTypeID = type TID;
  TSQLGoodIdentificationTypeToBeDeletedID = type TID;

  TSQLProduct = class of TSQLRecord;
  TSQLProductID = type TID;
  TSQLProductToBeDeletedID = type TID;

  TSQLProductAssoc = class of TSQLRecord;
  TSQLProductAssocID = type TID;
  TSQLProductAssocToBeDeletedID = type TID;

  TSQLProductAssocType = class of TSQLRecord;
  TSQLProductAssocTypeID = type TID;
  TSQLProductAssocTypeToBeDeletedID = type TID;

  TSQLProductRole = class of TSQLRecord;
  TSQLProductRoleID = type TID;
  TSQLProductRoleToBeDeletedID = type TID;

  TSQLProductAttribute = class of TSQLRecord;
  TSQLProductAttributeID = type TID;
  TSQLProductAttributeToBeDeletedID = type TID;

  TSQLProductCalculatedInfo = class of TSQLRecord;
  TSQLProductCalculatedInfoID = type TID;
  TSQLProductCalculatedInfoToBeDeletedID = type TID;

  TSQLProductContent = class of TSQLRecord;
  TSQLProductContentID = type TID;
  TSQLProductContentToBeDeletedID = type TID;

  TSQLProductContentType = class of TSQLRecord;
  TSQLProductContentTypeID = type TID;
  TSQLProductContentTypeToBeDeletedID = type TID;

  TSQLProductGeo = class of TSQLRecord;
  TSQLProductGeoID = type TID;
  TSQLProductGeoToBeDeletedID = type TID;

  TSQLProductGlAccount = class of TSQLRecord;
  TSQLProductGlAccountID = type TID;
  TSQLProductGlAccountToBeDeletedID = type TID;

  TSQLProductKeyword = class of TSQLRecord;
  TSQLProductKeywordID = type TID;
  TSQLProductKeywordToBeDeletedID = type TID;

  TSQLProductMeter = class of TSQLRecord;
  TSQLProductMeterID = type TID;
  TSQLProductMeterToBeDeletedID = type TID;

  TSQLProductMeterType = class of TSQLRecord;
  TSQLProductMeterTypeID = type TID;
  TSQLProductMeterTypeToBeDeletedID = type TID;

  TSQLProductMaint = class of TSQLRecord;
  TSQLProductMaintID = type TID;
  TSQLProductMaintToBeDeletedID = type TID;

  TSQLProductMaintType = class of TSQLRecord;
  TSQLProductMaintTypeID = type TID;
  TSQLProductMaintTypeToBeDeletedID = type TID;

  TSQLProductReview = class of TSQLRecord;
  TSQLProductReviewID = type TID;
  TSQLProductReviewToBeDeletedID = type TID;

  TSQLProductSearchConstraint = class of TSQLRecord;
  TSQLProductSearchConstraintID = type TID;
  TSQLProductSearchConstraintToBeDeletedID = type TID;

  TSQLProductSearchResult = class of TSQLRecord;
  TSQLProductSearchResultID = type TID;
  TSQLProductSearchResultToBeDeletedID = type TID;

  TSQLProductType = class of TSQLRecord;
  TSQLProductTypeID = type TID;
  TSQLProductTypeToBeDeletedID = type TID;

  TSQLProductTypeAttr = class of TSQLRecord;
  TSQLProductTypeAttrID = type TID;
  TSQLProductTypeAttrToBeDeletedID = type TID;

  TSQLVendorProduct = class of TSQLRecord;
  TSQLVendorProductID = type TID;
  TSQLVendorProductToBeDeletedID = type TID;

  TSQLProductPromo = class of TSQLRecord;
  TSQLProductPromoID = type TID;
  TSQLProductPromoToBeDeletedID = type TID;

  TSQLProductPromoAction = class of TSQLRecord;
  TSQLProductPromoActionID = type TID;
  TSQLProductPromoActionToBeDeletedID = type TID;

  TSQLProductPromoCategory = class of TSQLRecord;
  TSQLProductPromoCategoryID = type TID;
  TSQLProductPromoCategoryToBeDeletedID = type TID;

  TSQLProductPromoCode = class of TSQLRecord;
  TSQLProductPromoCodeID = type TID;
  TSQLProductPromoCodeToBeDeletedID = type TID;

  TSQLProductPromoCodeEmail = class of TSQLRecord;
  TSQLProductPromoCodeEmailID = type TID;
  TSQLProductPromoCodeEmailToBeDeletedID = type TID;

  TSQLProductPromoCodeParty = class of TSQLRecord;
  TSQLProductPromoCodePartyID = type TID;
  TSQLProductPromoCodePartyToBeDeletedID = type TID;

  TSQLProductPromoCond = class of TSQLRecord;
  TSQLProductPromoCondID = type TID;
  TSQLProductPromoCondToBeDeletedID = type TID;

  TSQLProductPromoProduct = class of TSQLRecord;
  TSQLProductPromoProductID = type TID;
  TSQLProductPromoProductToBeDeletedID = type TID;

  TSQLProductPromoRule = class of TSQLRecord;
  TSQLProductPromoRuleID = type TID;
  TSQLProductPromoRuleToBeDeletedID = type TID;

  TSQLProductPromoUse = class of TSQLRecord;
  TSQLProductPromoUseID = type TID;
  TSQLProductPromoUseToBeDeletedID = type TID;

  TSQLProductStore = class of TSQLRecord;
  TSQLProductStoreID = type TID;
  TSQLProductStoreToBeDeletedID = type TID;

  TSQLProductStoreCatalog = class of TSQLRecord;
  TSQLProductStoreCatalogID = type TID;
  TSQLProductStoreCatalogToBeDeletedID = type TID;

  TSQLProductStoreEmailSetting = class of TSQLRecord;
  TSQLProductStoreEmailSettingID = type TID;
  TSQLProductStoreEmailSettingToBeDeletedID = type TID;

  TSQLProductStoreFinActSetting = class of TSQLRecord;
  TSQLProductStoreFinActSettingID = type TID;
  TSQLProductStoreFinActSettingToBeDeletedID = type TID;

  TSQLProductStoreFacility = class of TSQLRecord;
  TSQLProductStoreFacilityID = type TID;
  TSQLProductStoreFacilityToBeDeletedID = type TID;

  TSQLProductStoreGroup = class of TSQLRecord;
  TSQLProductStoreGroupID = type TID;
  TSQLProductStoreGroupToBeDeletedID = type TID;

  TSQLProductStoreGroupMember = class of TSQLRecord;
  TSQLProductStoreGroupMemberID = type TID;
  TSQLProductStoreGroupMemberToBeDeletedID = type TID;

  TSQLProductStoreGroupRole = class of TSQLRecord;
  TSQLProductStoreGroupRoleID = type TID;
  TSQLProductStoreGroupRoleToBeDeletedID = type TID;

  TSQLProductStoreGroupRollup = class of TSQLRecord;
  TSQLProductStoreGroupRollupID = type TID;
  TSQLProductStoreGroupRollupToBeDeletedID = type TID;

  TSQLProductStoreGroupType = class of TSQLRecord;
  TSQLProductStoreGroupTypeID = type TID;
  TSQLProductStoreGroupTypeToBeDeletedID = type TID;

  TSQLProductStoreKeywordOvrd = class of TSQLRecord;
  TSQLProductStoreKeywordOvrdID = type TID;
  TSQLProductStoreKeywordOvrdToBeDeletedID = type TID;

  TSQLProductStorePaymentSetting = class of TSQLRecord;
  TSQLProductStorePaymentSettingID = type TID;
  TSQLProductStorePaymentSettingToBeDeletedID = type TID;

  TSQLProductStorePromoAppl = class of TSQLRecord;
  TSQLProductStorePromoApplID = type TID;
  TSQLProductStorePromoApplToBeDeletedID = type TID;

  TSQLProductStoreRole = class of TSQLRecord;
  TSQLProductStoreRoleID = type TID;
  TSQLProductStoreRoleToBeDeletedID = type TID;

  TSQLProductStoreShipmentMeth = class of TSQLRecord;
  TSQLProductStoreShipmentMethID = type TID;
  TSQLProductStoreShipmentMethToBeDeletedID = type TID;

  TSQLProductStoreSurveyAppl = class of TSQLRecord;
  TSQLProductStoreSurveyApplID = type TID;
  TSQLProductStoreSurveyApplToBeDeletedID = type TID;

  TSQLProductStoreVendorPayment = class of TSQLRecord;
  TSQLProductStoreVendorPaymentID = type TID;
  TSQLProductStoreVendorPaymentToBeDeletedID = type TID;

  TSQLProductStoreVendorShipment = class of TSQLRecord;
  TSQLProductStoreVendorShipmentID = type TID;
  TSQLProductStoreVendorShipmentToBeDeletedID = type TID;

  TSQLWebSite = class of TSQLRecord;
  TSQLWebSiteID = type TID;
  TSQLWebSiteToBeDeletedID = type TID;

  TSQLProductSubscriptionResource = class of TSQLRecord;
  TSQLProductSubscriptionResourceID = type TID;
  TSQLProductSubscriptionResourceToBeDeletedID = type TID;

  TSQLSubscription = class of TSQLRecord;
  TSQLSubscriptionID = type TID;
  TSQLSubscriptionToBeDeletedID = type TID;

  TSQLSubscriptionActivity = class of TSQLRecord;
  TSQLSubscriptionActivityID = type TID;
  TSQLSubscriptionActivityToBeDeletedID = type TID;

  TSQLSubscriptionAttribute = class of TSQLRecord;
  TSQLSubscriptionAttributeID = type TID;
  TSQLSubscriptionAttributeToBeDeletedID = type TID;

  TSQLSubscriptionFulfillmentPiece = class of TSQLRecord;
  TSQLSubscriptionFulfillmentPieceID = type TID;
  TSQLSubscriptionFulfillmentPieceToBeDeletedID = type TID;

  TSQLSubscriptionResource = class of TSQLRecord;
  TSQLSubscriptionResourceID = type TID;
  TSQLSubscriptionResourceToBeDeletedID = type TID;

  TSQLSubscriptionType = class of TSQLRecord;
  TSQLSubscriptionTypeID = type TID;
  TSQLSubscriptionTypeToBeDeletedID = type TID;

  TSQLSubscriptionTypeAttr = class of TSQLRecord;
  TSQLSubscriptionTypeAttrID = type TID;
  TSQLSubscriptionTypeAttrToBeDeletedID = type TID;

  TSQLSubscriptionCommEvent = class of TSQLRecord;
  TSQLSubscriptionCommEventID = type TID;
  TSQLSubscriptionCommEventToBeDeletedID = type TID;

  TSQLMarketInterest = class of TSQLRecord;
  TSQLMarketInterestID = type TID;
  TSQLMarketInterestToBeDeletedID = type TID;

  TSQLReorderGuideline = class of TSQLRecord;
  TSQLReorderGuidelineID = type TID;
  TSQLReorderGuidelineToBeDeletedID = type TID;

  TSQLSupplierPrefOrder = class of TSQLRecord;
  TSQLSupplierPrefOrderID = type TID;
  TSQLSupplierPrefOrderToBeDeletedID = type TID;

  TSQLSupplierProduct = class of TSQLRecord;
  TSQLSupplierProductID = type TID;
  TSQLSupplierProductToBeDeletedID = type TID;

  TSQLSupplierProductFeature = class of TSQLRecord;
  TSQLSupplierProductFeatureID = type TID;
  TSQLSupplierProductFeatureToBeDeletedID = type TID;

  TSQLSupplierRatingType = class of TSQLRecord;
  TSQLSupplierRatingTypeID = type TID;
  TSQLSupplierRatingTypeToBeDeletedID = type TID;

  TSQLProductPromoContent = class of TSQLRecord;
  TSQLProductPromoContentID = type TID;
  TSQLProductPromoContentToBeDeletedID = type TID;

  TSQLProductGroupOrder = class of TSQLRecord;
  TSQLProductGroupOrderID = type TID;
  TSQLProductGroupOrderToBeDeletedID = type TID;




  // apache-ofbiz\applications\datamodel\entitydef\order-entitymodel.xml
  TSQLOrderAdjustment = class of TSQLRecord;
  TSQLOrderAdjustmentID = type TID;
  TSQLOrderAdjustmentToBeDeletedID = type TID;

  TSQLOrderAdjustmentAttribute = class of TSQLRecord;
  TSQLOrderAdjustmentAttributeID = type TID;
  TSQLOrderAdjustmentAttributeToBeDeletedID = type TID;

  TSQLOrderAdjustmentType = class of TSQLRecord;
  TSQLOrderAdjustmentTypeID = type TID;
  TSQLOrderAdjustmentTypeToBeDeletedID = type TID;

  TSQLOrderAdjustmentBilling = class of TSQLRecord;
  TSQLOrderAdjustmentBillingID = type TID;
  TSQLOrderAdjustmentBillingToBeDeletedID = type TID;

  TSQLOrderAdjustmentTypeAttr = class of TSQLRecord;
  TSQLOrderAdjustmentTypeAttrID = type TID;
  TSQLOrderAdjustmentTypeAttrToBeDeletedID = type TID;

  TSQLOrderAttribute = class of TSQLRecord;
  TSQLOrderAttributeID = type TID;
  TSQLOrderAttributeToBeDeletedID = type TID;

  TSQLOrderBlacklist = class of TSQLRecord;
  TSQLOrderBlacklistID = type TID;
  TSQLOrderBlacklistToBeDeletedID = type TID;

  TSQLOrderBlacklistType = class of TSQLRecord;
  TSQLOrderBlacklistTypeID = type TID;
  TSQLOrderBlacklistTypeToBeDeletedID = type TID;

  TSQLCommunicationEventOrder = class of TSQLRecord;
  TSQLCommunicationEventOrderID = type TID;
  TSQLCommunicationEventOrderToBeDeletedID = type TID;

  TSQLOrderContactMech = class of TSQLRecord;
  TSQLOrderContactMechID = type TID;
  TSQLOrderContactMechToBeDeletedID = type TID;

  TSQLOrderContent = class of TSQLRecord;
  TSQLOrderContentID = type TID;
  TSQLOrderContentToBeDeletedID = type TID;

  TSQLOrderContentType = class of TSQLRecord;
  TSQLOrderContentTypeID = type TID;
  TSQLOrderContentTypeToBeDeletedID = type TID;

  TSQLOrderDeliverySchedule = class of TSQLRecord;
  TSQLOrderDeliveryScheduleID = type TID;
  TSQLOrderDeliveryScheduleToBeDeletedID = type TID;

  TSQLOrderHeader = class of TSQLRecord;
  TSQLOrderHeaderID = type TID;
  TSQLOrderHeaderToBeDeletedID = type TID;

  TSQLOrderHeaderNote = class of TSQLRecord;
  TSQLOrderHeaderNoteID = type TID;
  TSQLOrderHeaderNoteToBeDeletedID = type TID;

  TSQLOrderHeaderWorkEffort = class of TSQLRecord;
  TSQLOrderHeaderWorkEffortID = type TID;
  TSQLOrderHeaderWorkEffortToBeDeletedID = type TID;

  TSQLOrderItem = class of TSQLRecord;
  TSQLOrderItemID = type TID;
  TSQLOrderItemToBeDeletedID = type TID;

  TSQLOrderItemAssoc = class of TSQLRecord;
  TSQLOrderItemAssocID = type TID;
  TSQLOrderItemAssocToBeDeletedID = type TID;

  TSQLOrderItemAssocType = class of TSQLRecord;
  TSQLOrderItemAssocTypeID = type TID;
  TSQLOrderItemAssocTypeToBeDeletedID = type TID;

  TSQLOrderItemAttribute = class of TSQLRecord;
  TSQLOrderItemAttributeID = type TID;
  TSQLOrderItemAttributeToBeDeletedID = type TID;

  TSQLOrderItemBilling = class of TSQLRecord;
  TSQLOrderItemBillingID = type TID;
  TSQLOrderItemBillingToBeDeletedID = type TID;

  TSQLOrderItemChange = class of TSQLRecord;
  TSQLOrderItemChangeID = type TID;
  TSQLOrderItemChangeToBeDeletedID = type TID;

  TSQLOrderItemContactMech = class of TSQLRecord;
  TSQLOrderItemContactMechID = type TID;
  TSQLOrderItemContactMechToBeDeletedID = type TID;

  TSQLOrderItemGroup = class of TSQLRecord;
  TSQLOrderItemGroupID = type TID;
  TSQLOrderItemGroupToBeDeletedID = type TID;

  TSQLOrderItemGroupOrder = class of TSQLRecord;
  TSQLOrderItemGroupOrderID = type TID;
  TSQLOrderItemGroupOrderToBeDeletedID = type TID;

  TSQLOrderItemPriceInfo = class of TSQLRecord;
  TSQLOrderItemPriceInfoID = type TID;
  TSQLOrderItemPriceInfoToBeDeletedID = type TID;

  TSQLOrderItemRole = class of TSQLRecord;
  TSQLOrderItemRoleID = type TID;
  TSQLOrderItemRoleToBeDeletedID = type TID;

  TSQLOrderItemShipGroup = class of TSQLRecord;
  TSQLOrderItemShipGroupID = type TID;
  TSQLOrderItemShipGroupToBeDeletedID = type TID;

  TSQLOrderItemShipGroupAssoc = class of TSQLRecord;
  TSQLOrderItemShipGroupAssocID = type TID;
  TSQLOrderItemShipGroupAssocToBeDeletedID = type TID;

  TSQLOrderItemShipGrpInvRes = class of TSQLRecord;
  TSQLOrderItemShipGrpInvResID = type TID;
  TSQLOrderItemShipGrpInvResToBeDeletedID = type TID;

  TSQLOrderItemType = class of TSQLRecord;
  TSQLOrderItemTypeID = type TID;
  TSQLOrderItemTypeToBeDeletedID = type TID;

  TSQLOrderItemTypeAttr = class of TSQLRecord;
  TSQLOrderItemTypeAttrID = type TID;
  TSQLOrderItemTypeAttrToBeDeletedID = type TID;

  TSQLOrderNotification = class of TSQLRecord;
  TSQLOrderNotificationID = type TID;
  TSQLOrderNotificationToBeDeletedID = type TID;

  TSQLOrderPaymentPreference = class of TSQLRecord;
  TSQLOrderPaymentPreferenceID = type TID;
  TSQLOrderPaymentPreferenceToBeDeletedID = type TID;

  TSQLOrderProductPromoCode = class of TSQLRecord;
  TSQLOrderProductPromoCodeID = type TID;
  TSQLOrderProductPromoCodeToBeDeletedID = type TID;

  TSQLOrderRole = class of TSQLRecord;
  TSQLOrderRoleID = type TID;
  TSQLOrderRoleToBeDeletedID = type TID;

  TSQLOrderShipment = class of TSQLRecord;
  TSQLOrderShipmentID = type TID;
  TSQLOrderShipmentToBeDeletedID = type TID;

  TSQLOrderStatus = class of TSQLRecord;
  TSQLOrderStatusID = type TID;
  TSQLOrderStatusToBeDeletedID = type TID;

  TSQLOrderSummaryEntry = class of TSQLRecord;
  TSQLOrderSummaryEntryID = type TID;
  TSQLOrderSummaryEntryToBeDeletedID = type TID;

  TSQLOrderTerm = class of TSQLRecord;
  TSQLOrderTermID = type TID;
  TSQLOrderTermToBeDeletedID = type TID;

  TSQLOrderTermAttribute = class of TSQLRecord;
  TSQLOrderTermAttributeID = type TID;
  TSQLOrderTermAttributeToBeDeletedID = type TID;

  TSQLOrderType = class of TSQLRecord;
  TSQLOrderTypeID = type TID;
  TSQLOrderTypeToBeDeletedID = type TID;

  TSQLOrderTypeAttr = class of TSQLRecord;
  TSQLOrderTypeAttrID = type TID;
  TSQLOrderTypeAttrToBeDeletedID = type TID;

  TSQLProductOrderItem = class of TSQLRecord;
  TSQLProductOrderItemID = type TID;
  TSQLProductOrderItemToBeDeletedID = type TID;

  TSQLWorkOrderItemFulfillment = class of TSQLRecord;
  TSQLWorkOrderItemFulfillmentID = type TID;
  TSQLWorkOrderItemFulfillmentToBeDeletedID = type TID;

  TSQLQuote = class of TSQLRecord;
  TSQLQuoteID = type TID;
  TSQLQuoteToBeDeletedID = type TID;

  TSQLQuoteAttribute = class of TSQLRecord;
  TSQLQuoteAttributeID = type TID;
  TSQLQuoteAttributeToBeDeletedID = type TID;

  TSQLQuoteCoefficient = class of TSQLRecord;
  TSQLQuoteCoefficientID = type TID;
  TSQLQuoteCoefficientToBeDeletedID = type TID;

  TSQLQuoteItem = class of TSQLRecord;
  TSQLQuoteItemID = type TID;
  TSQLQuoteItemToBeDeletedID = type TID;

  TSQLQuoteNote = class of TSQLRecord;
  TSQLQuoteNoteID = type TID;
  TSQLQuoteNoteToBeDeletedID = type TID;

  TSQLQuoteRole = class of TSQLRecord;
  TSQLQuoteRoleID = type TID;
  TSQLQuoteRoleToBeDeletedID = type TID;

  TSQLQuoteTerm = class of TSQLRecord;
  TSQLQuoteTermID = type TID;
  TSQLQuoteTermToBeDeletedID = type TID;

  TSQLQuoteTermAttribute = class of TSQLRecord;
  TSQLQuoteTermAttributeID = type TID;
  TSQLQuoteTermAttributeToBeDeletedID = type TID;

  TSQLQuoteType = class of TSQLRecord;
  TSQLQuoteTypeID = type TID;
  TSQLQuoteTypeToBeDeletedID = type TID;

  TSQLQuoteTypeAttr = class of TSQLRecord;
  TSQLQuoteTypeAttrID = type TID;
  TSQLQuoteTypeAttrToBeDeletedID = type TID;

  TSQLQuoteWorkEffort = class of TSQLRecord;
  TSQLQuoteWorkEffortID = type TID;
  TSQLQuoteWorkEffortToBeDeletedID = type TID;

  TSQLQuoteAdjustment = class of TSQLRecord;
  TSQLQuoteAdjustmentID = type TID;
  TSQLQuoteAdjustmentToBeDeletedID = type TID;

  TSQLCustRequest = class of TSQLRecord;
  TSQLCustRequestID = type TID;
  TSQLCustRequestToBeDeletedID = type TID;

  TSQLCustRequestAttribute = class of TSQLRecord;
  TSQLCustRequestAttributeID = type TID;
  TSQLCustRequestAttributeToBeDeletedID = type TID;

  TSQLCustRequestCategory = class of TSQLRecord;
  TSQLCustRequestCategoryID = type TID;
  TSQLCustRequestCategoryToBeDeletedID = type TID;

  TSQLCustRequestCommEvent = class of TSQLRecord;
  TSQLCustRequestCommEventID = type TID;
  TSQLCustRequestCommEventToBeDeletedID = type TID;

  TSQLCustRequestContent = class of TSQLRecord;
  TSQLCustRequestContentID = type TID;
  TSQLCustRequestContentToBeDeletedID = type TID;

  TSQLCustRequestItem = class of TSQLRecord;
  TSQLCustRequestItemID = type TID;
  TSQLCustRequestItemToBeDeletedID = type TID;

  TSQLCustRequestNote = class of TSQLRecord;
  TSQLCustRequestNoteID = type TID;
  TSQLCustRequestNoteToBeDeletedID = type TID;

  TSQLCustRequestItemNote = class of TSQLRecord;
  TSQLCustRequestItemNoteID = type TID;
  TSQLCustRequestItemNoteToBeDeletedID = type TID;

  TSQLCustRequestItemWorkEffort = class of TSQLRecord;
  TSQLCustRequestItemWorkEffortID = type TID;
  TSQLCustRequestItemWorkEffortToBeDeletedID = type TID;

  TSQLCustRequestResolution = class of TSQLRecord;
  TSQLCustRequestResolutionID = type TID;
  TSQLCustRequestResolutionToBeDeletedID = type TID;

  TSQLCustRequestParty = class of TSQLRecord;
  TSQLCustRequestPartyID = type TID;
  TSQLCustRequestPartyToBeDeletedID = type TID;

  TSQLCustRequestStatus = class of TSQLRecord;
  TSQLCustRequestStatusID = type TID;
  TSQLCustRequestStatusToBeDeletedID = type TID;

  TSQLCustRequestType = class of TSQLRecord;
  TSQLCustRequestTypeID = type TID;
  TSQLCustRequestTypeToBeDeletedID = type TID;

  TSQLCustRequestTypeAttr = class of TSQLRecord;
  TSQLCustRequestTypeAttrID = type TID;
  TSQLCustRequestTypeAttrToBeDeletedID = type TID;

  TSQLCustRequestWorkEffort = class of TSQLRecord;
  TSQLCustRequestWorkEffortID = type TID;
  TSQLCustRequestWorkEffortToBeDeletedID = type TID;

  TSQLRespondingParty = class of TSQLRecord;
  TSQLRespondingPartyID = type TID;
  TSQLRespondingPartyToBeDeletedID = type TID;

  TSQLDesiredFeature = class of TSQLRecord;
  TSQLDesiredFeatureID = type TID;
  TSQLDesiredFeatureToBeDeletedID = type TID;

  TSQLOrderRequirementCommitment = class of TSQLRecord;
  TSQLOrderRequirementCommitmentID = type TID;
  TSQLOrderRequirementCommitmentToBeDeletedID = type TID;

  TSQLRequirement = class of TSQLRecord;
  TSQLRequirementID = type TID;
  TSQLRequirementToBeDeletedID = type TID;

  TSQLRequirementAttribute = class of TSQLRecord;
  TSQLRequirementAttributeID = type TID;
  TSQLRequirementAttributeToBeDeletedID = type TID;

  TSQLRequirementBudgetAllocation = class of TSQLRecord;
  TSQLRequirementBudgetAllocationID = type TID;
  TSQLRequirementBudgetAllocationToBeDeletedID = type TID;

  TSQLRequirementCustRequest = class of TSQLRecord;
  TSQLRequirementCustRequestID = type TID;
  TSQLRequirementCustRequestToBeDeletedID = type TID;

  TSQLRequirementRole = class of TSQLRecord;
  TSQLRequirementRoleID = type TID;
  TSQLRequirementRoleToBeDeletedID = type TID;

  TSQLRequirementStatus = class of TSQLRecord;
  TSQLRequirementStatusID = type TID;
  TSQLRequirementStatusToBeDeletedID = type TID;

  TSQLRequirementType = class of TSQLRecord;
  TSQLRequirementTypeID = type TID;
  TSQLRequirementTypeToBeDeletedID = type TID;

  TSQLRequirementTypeAttr = class of TSQLRecord;
  TSQLRequirementTypeAttrID = type TID;
  TSQLRequirementTypeAttrToBeDeletedID = type TID;

  TSQLWorkReqFulfType = class of TSQLRecord;
  TSQLWorkReqFulfTypeID = type TID;
  TSQLWorkReqFulfTypeToBeDeletedID = type TID;

  TSQLWorkRequirementFulfillment = class of TSQLRecord;
  TSQLWorkRequirementFulfillmentID = type TID;
  TSQLWorkRequirementFulfillmentToBeDeletedID = type TID;

  TSQLReturnAdjustment = class of TSQLRecord;
  TSQLReturnAdjustmentID = type TID;
  TSQLReturnAdjustmentToBeDeletedID = type TID;

  TSQLReturnAdjustmentType = class of TSQLRecord;
  TSQLReturnAdjustmentTypeID = type TID;
  TSQLReturnAdjustmentTypeToBeDeletedID = type TID;

  TSQLReturnHeader = class of TSQLRecord;
  TSQLReturnHeaderID = type TID;
  TSQLReturnHeaderToBeDeletedID = type TID;

  TSQLReturnHeaderType = class of TSQLRecord;
  TSQLReturnHeaderTypeID = type TID;
  TSQLReturnHeaderTypeToBeDeletedID = type TID;

  TSQLReturnItem = class of TSQLRecord;
  TSQLReturnItemID = type TID;
  TSQLReturnItemToBeDeletedID = type TID;

  TSQLReturnItemResponse = class of TSQLRecord;
  TSQLReturnItemResponseID = type TID;
  TSQLReturnItemResponseToBeDeletedID = type TID;

  TSQLReturnItemType = class of TSQLRecord;
  TSQLReturnItemTypeID = type TID;
  TSQLReturnItemTypeToBeDeletedID = type TID;

  TSQLReturnItemTypeMap = class of TSQLRecord;
  TSQLReturnItemTypeMapID = type TID;
  TSQLReturnItemTypeMapToBeDeletedID = type TID;

  TSQLReturnReason = class of TSQLRecord;
  TSQLReturnReasonID = type TID;
  TSQLReturnReasonToBeDeletedID = type TID;

  TSQLReturnStatus = class of TSQLRecord;
  TSQLReturnStatusID = type TID;
  TSQLReturnStatusToBeDeletedID = type TID;

  TSQLReturnType = class of TSQLRecord;
  TSQLReturnTypeID = type TID;
  TSQLReturnTypeToBeDeletedID = type TID;

  TSQLReturnItemBilling = class of TSQLRecord;
  TSQLReturnItemBillingID = type TID;
  TSQLReturnItemBillingToBeDeletedID = type TID;

  TSQLReturnItemShipment = class of TSQLRecord;
  TSQLReturnItemShipmentID = type TID;
  TSQLReturnItemShipmentToBeDeletedID = type TID;

  TSQLReturnContactMech = class of TSQLRecord;
  TSQLReturnContactMechID = type TID;
  TSQLReturnContactMechToBeDeletedID = type TID;

  TSQLCartAbandonedLine = class of TSQLRecord;
  TSQLCartAbandonedLineID = type TID;
  TSQLCartAbandonedLineToBeDeletedID = type TID;

  TSQLShoppingList = class of TSQLRecord;
  TSQLShoppingListID = type TID;
  TSQLShoppingListToBeDeletedID = type TID;

  TSQLShoppingListItem = class of TSQLRecord;
  TSQLShoppingListItemID = type TID;
  TSQLShoppingListItemToBeDeletedID = type TID;

  TSQLShoppingListItemSurvey = class of TSQLRecord;
  TSQLShoppingListItemSurveyID = type TID;
  TSQLShoppingListItemSurveyToBeDeletedID = type TID;

  TSQLShoppingListType = class of TSQLRecord;
  TSQLShoppingListTypeID = type TID;
  TSQLShoppingListTypeToBeDeletedID = type TID;

  TSQLShoppingListWorkEffort = class of TSQLRecord;
  TSQLShoppingListWorkEffortID = type TID;
  TSQLShoppingListWorkEffortToBeDeletedID = type TID;





  // apache-ofbiz\applications\datamodel\entitydef\accounting-entitymodel.xml
  TSQLBudget = class of TSQLRecord;
  TSQLBudgetID = type TID;
  TSQLBudgetToBeDeletedID = type TID;

  TSQLBudgetAttribute = class of TSQLRecord;
  TSQLBudgetAttributeID = type TID;
  TSQLBudgetAttributeToBeDeletedID = type TID;

  TSQLBudgetItem = class of TSQLRecord;
  TSQLBudgetItemID = type TID;
  TSQLBudgetItemToBeDeletedID = type TID;

  TSQLBudgetItemAttribute = class of TSQLRecord;
  TSQLBudgetItemAttributeID = type TID;
  TSQLBudgetItemAttributeToBeDeletedID = type TID;

  TSQLBudgetItemType = class of TSQLRecord;
  TSQLBudgetItemTypeID = type TID;
  TSQLBudgetItemTypeToBeDeletedID = type TID;

  TSQLBudgetItemTypeAttr = class of TSQLRecord;
  TSQLBudgetItemTypeAttrID = type TID;
  TSQLBudgetItemTypeAttrToBeDeletedID = type TID;

  TSQLBudgetReview = class of TSQLRecord;
  TSQLBudgetReviewID = type TID;
  TSQLBudgetReviewToBeDeletedID = type TID;

  TSQLBudgetReviewResultType = class of TSQLRecord;
  TSQLBudgetReviewResultTypeID = type TID;
  TSQLBudgetReviewResultTypeToBeDeletedID = type TID;

  TSQLBudgetRevision = class of TSQLRecord;
  TSQLBudgetRevisionID = type TID;
  TSQLBudgetRevisionToBeDeletedID = type TID;

  TSQLBudgetRevisionImpact = class of TSQLRecord;
  TSQLBudgetRevisionImpactID = type TID;
  TSQLBudgetRevisionImpactToBeDeletedID = type TID;

  TSQLBudgetRole = class of TSQLRecord;
  TSQLBudgetRoleID = type TID;
  TSQLBudgetRoleToBeDeletedID = type TID;

  TSQLBudgetScenario = class of TSQLRecord;
  TSQLBudgetScenarioID = type TID;
  TSQLBudgetScenarioToBeDeletedID = type TID;

  TSQLBudgetScenarioApplication = class of TSQLRecord;
  TSQLBudgetScenarioApplicationID = type TID;
  TSQLBudgetScenarioApplicationToBeDeletedID = type TID;

  TSQLBudgetScenarioRule = class of TSQLRecord;
  TSQLBudgetScenarioRuleID = type TID;
  TSQLBudgetScenarioRuleToBeDeletedID = type TID;

  TSQLBudgetStatus = class of TSQLRecord;
  TSQLBudgetStatusID = type TID;
  TSQLBudgetStatusToBeDeletedID = type TID;

  TSQLBudgetType = class of TSQLRecord;
  TSQLBudgetTypeID = type TID;
  TSQLBudgetTypeToBeDeletedID = type TID;

  TSQLBudgetTypeAttr = class of TSQLRecord;
  TSQLBudgetTypeAttrID = type TID;
  TSQLBudgetTypeAttrToBeDeletedID = type TID;

  TSQLFinAccount = class of TSQLRecord;
  TSQLFinAccountID = type TID;
  TSQLFinAccountToBeDeletedID = type TID;

  TSQLFinAccountAttribute = class of TSQLRecord;
  TSQLFinAccountAttributeID = type TID;
  TSQLFinAccountAttributeToBeDeletedID = type TID;

  TSQLFinAccountAuth = class of TSQLRecord;
  TSQLFinAccountAuthID = type TID;
  TSQLFinAccountAuthToBeDeletedID = type TID;

  TSQLFinAccountRole = class of TSQLRecord;
  TSQLFinAccountRoleID = type TID;
  TSQLFinAccountRoleToBeDeletedID = type TID;

  TSQLFinAccountStatus = class of TSQLRecord;
  TSQLFinAccountStatusID = type TID;
  TSQLFinAccountStatusToBeDeletedID = type TID;

  TSQLFinAccountTrans = class of TSQLRecord;
  TSQLFinAccountTransID = type TID;
  TSQLFinAccountTransToBeDeletedID = type TID;

  TSQLFinAccountTransAttribute = class of TSQLRecord;
  TSQLFinAccountTransAttributeID = type TID;
  TSQLFinAccountTransAttributeToBeDeletedID = type TID;

  TSQLFinAccountTransType = class of TSQLRecord;
  TSQLFinAccountTransTypeID = type TID;
  TSQLFinAccountTransTypeToBeDeletedID = type TID;

  TSQLFinAccountTransTypeAttr = class of TSQLRecord;
  TSQLFinAccountTransTypeAttrID = type TID;
  TSQLFinAccountTransTypeAttrToBeDeletedID = type TID;

  TSQLFinAccountType = class of TSQLRecord;
  TSQLFinAccountTypeID = type TID;
  TSQLFinAccountTypeToBeDeletedID = type TID;

  TSQLFinAccountTypeAttr = class of TSQLRecord;
  TSQLFinAccountTypeAttrID = type TID;
  TSQLFinAccountTypeAttrToBeDeletedID = type TID;

  TSQLFinAccountTypeGlAccount = class of TSQLRecord;
  TSQLFinAccountTypeGlAccountID = type TID;
  TSQLFinAccountTypeGlAccountToBeDeletedID = type TID;

  TSQLFixedAsset = class of TSQLRecord;
  TSQLFixedAssetID = type TID;
  TSQLFixedAssetToBeDeletedID = type TID;

  TSQLFixedAssetAttribute = class of TSQLRecord;
  TSQLFixedAssetAttributeID = type TID;
  TSQLFixedAssetAttributeToBeDeletedID = type TID;

  TSQLFixedAssetDepMethod = class of TSQLRecord;
  TSQLFixedAssetDepMethodID = type TID;
  TSQLFixedAssetDepMethodToBeDeletedID = type TID;

  TSQLFixedAssetGeoPoint = class of TSQLRecord;
  TSQLFixedAssetGeoPointID = type TID;
  TSQLFixedAssetGeoPointToBeDeletedID = type TID;

  TSQLFixedAssetIdent = class of TSQLRecord;
  TSQLFixedAssetIdentID = type TID;
  TSQLFixedAssetIdentToBeDeletedID = type TID;

  TSQLFixedAssetIdentType = class of TSQLRecord;
  TSQLFixedAssetIdentTypeID = type TID;
  TSQLFixedAssetIdentTypeToBeDeletedID = type TID;

  TSQLFixedAssetMaint = class of TSQLRecord;
  TSQLFixedAssetMaintID = type TID;
  TSQLFixedAssetMaintToBeDeletedID = type TID;

  TSQLFixedAssetMeter = class of TSQLRecord;
  TSQLFixedAssetMeterID = type TID;
  TSQLFixedAssetMeterToBeDeletedID = type TID;

  TSQLFixedAssetProduct = class of TSQLRecord;
  TSQLFixedAssetProductID = type TID;
  TSQLFixedAssetProductToBeDeletedID = type TID;

  TSQLFixedAssetProductType = class of TSQLRecord;
  TSQLFixedAssetProductTypeID = type TID;
  TSQLFixedAssetProductTypeToBeDeletedID = type TID;

  TSQLFixedAssetTypeGlAccount = class of TSQLRecord;
  TSQLFixedAssetTypeGlAccountID = type TID;
  TSQLFixedAssetTypeGlAccountToBeDeletedID = type TID;

  TSQLFixedAssetRegistration = class of TSQLRecord;
  TSQLFixedAssetRegistrationID = type TID;
  TSQLFixedAssetRegistrationToBeDeletedID = type TID;

  TSQLFixedAssetStdCost = class of TSQLRecord;
  TSQLFixedAssetStdCostID = type TID;
  TSQLFixedAssetStdCostToBeDeletedID = type TID;

  TSQLFixedAssetStdCostType = class of TSQLRecord;
  TSQLFixedAssetStdCostTypeID = type TID;
  TSQLFixedAssetStdCostTypeToBeDeletedID = type TID;

  TSQLFixedAssetType = class of TSQLRecord;
  TSQLFixedAssetTypeID = type TID;
  TSQLFixedAssetTypeToBeDeletedID = type TID;

  TSQLFixedAssetTypeAttr = class of TSQLRecord;
  TSQLFixedAssetTypeAttrID = type TID;
  TSQLFixedAssetTypeAttrToBeDeletedID = type TID;

  TSQLPartyFixedAssetAssignment = class of TSQLRecord;
  TSQLPartyFixedAssetAssignmentID = type TID;
  TSQLPartyFixedAssetAssignmentToBeDeletedID = type TID;

  TSQLFixedAssetMaintOrder = class of TSQLRecord;
  TSQLFixedAssetMaintOrderID = type TID;
  TSQLFixedAssetMaintOrderToBeDeletedID = type TID;

  TSQLAccommodationClass = class of TSQLRecord;
  TSQLAccommodationClassID = type TID;
  TSQLAccommodationClassToBeDeletedID = type TID;

  TSQLAccommodationSpot = class of TSQLRecord;
  TSQLAccommodationSpotID = type TID;
  TSQLAccommodationSpotToBeDeletedID = type TID;

  TSQLAccommodationMap = class of TSQLRecord;
  TSQLAccommodationMapID = type TID;
  TSQLAccommodationMapToBeDeletedID = type TID;

  TSQLAccommodationMapType = class of TSQLRecord;
  TSQLAccommodationMapTypeID = type TID;
  TSQLAccommodationMapTypeToBeDeletedID = type TID;

  TSQLInvoice = class of TSQLRecord;
  TSQLInvoiceID = type TID;
  TSQLInvoiceToBeDeletedID = type TID;

  TSQLInvoiceAttribute = class of TSQLRecord;
  TSQLInvoiceAttributeID = type TID;
  TSQLInvoiceAttributeToBeDeletedID = type TID;

  TSQLInvoiceContent = class of TSQLRecord;
  TSQLInvoiceContentID = type TID;
  TSQLInvoiceContentToBeDeletedID = type TID;

  TSQLInvoiceContentType = class of TSQLRecord;
  TSQLInvoiceContentTypeID = type TID;
  TSQLInvoiceContentTypeToBeDeletedID = type TID;

  TSQLInvoiceContactMech = class of TSQLRecord;
  TSQLInvoiceContactMechID = type TID;
  TSQLInvoiceContactMechToBeDeletedID = type TID;

  TSQLInvoiceItem = class of TSQLRecord;
  TSQLInvoiceItemID = type TID;
  TSQLInvoiceItemToBeDeletedID = type TID;

  TSQLInvoiceItemAssocTSQLInvoiceItemAssoc = class of TSQLRecord;
  TSQLInvoiceItemAssocTSQLInvoiceItemAssocID = type TID;
  TSQLInvoiceItemAssocTSQLInvoiceItemAssocToBeDeletedID = type TID;

  TSQLInvoiceItemAssocType = class of TSQLRecord;
  TSQLInvoiceItemAssocTypeID = type TID;
  TSQLInvoiceItemAssocTypeToBeDeletedID = type TID;

  TSQLInvoiceItemAttribute = class of TSQLRecord;
  TSQLInvoiceItemAttributeID = type TID;
  TSQLInvoiceItemAttributeToBeDeletedID = type TID;

  TSQLInvoiceItemType = class of TSQLRecord;
  TSQLInvoiceItemTypeID = type TID;
  TSQLInvoiceItemTypeToBeDeletedID = type TID;

  TSQLInvoiceItemTypeAttr = class of TSQLRecord;
  TSQLInvoiceItemTypeAttrID = type TID;
  TSQLInvoiceItemTypeAttrToBeDeletedID = type TID;

  TSQLInvoiceItemTypeGlAccount = class of TSQLRecord;
  TSQLInvoiceItemTypeGlAccountID = type TID;
  TSQLInvoiceItemTypeGlAccountToBeDeletedID = type TID;

  TSQLInvoiceItemTypeMap = class of TSQLRecord;
  TSQLInvoiceItemTypeMapID = type TID;
  TSQLInvoiceItemTypeMapToBeDeletedID = type TID;

  TSQLInvoiceRole = class of TSQLRecord;
  TSQLInvoiceRoleID = type TID;
  TSQLInvoiceRoleToBeDeletedID = type TID;

  TSQLInvoiceStatus = class of TSQLRecord;
  TSQLInvoiceStatusID = type TID;
  TSQLInvoiceStatusToBeDeletedID = type TID;

  TSQLInvoiceTerm = class of TSQLRecord;
  TSQLInvoiceTermID = type TID;
  TSQLInvoiceTermToBeDeletedID = type TID;

  TSQLInvoiceTermAttribute = class of TSQLRecord;
  TSQLInvoiceTermAttributeID = type TID;
  TSQLInvoiceTermAttributeToBeDeletedID = type TID;

  TSQLInvoiceType = class of TSQLRecord;
  TSQLInvoiceTypeID = type TID;
  TSQLInvoiceTypeToBeDeletedID = type TID;

  TSQLInvoiceTypeAttr = class of TSQLRecord;
  TSQLInvoiceTypeAttrID = type TID;
  TSQLInvoiceTypeAttrToBeDeletedID = type TID;

  TSQLInvoiceNote = class of TSQLRecord;
  TSQLInvoiceNoteID = type TID;
  TSQLInvoiceNoteToBeDeletedID = type TID;

  TSQLAcctgTrans = class of TSQLRecord;
  TSQLAcctgTransID = type TID;
  TSQLAcctgTransToBeDeletedID = type TID;

  TSQLAcctgTransAttribute = class of TSQLRecord;
  TSQLAcctgTransAttributeID = type TID;
  TSQLAcctgTransAttributeToBeDeletedID = type TID;

  TSQLAcctgTransEntry = class of TSQLRecord;
  TSQLAcctgTransEntryID = type TID;
  TSQLAcctgTransEntryToBeDeletedID = type TID;

  TSQLAcctgTransEntryType = class of TSQLRecord;
  TSQLAcctgTransEntryTypeID = type TID;
  TSQLAcctgTransEntryTypeToBeDeletedID = type TID;

  TSQLAcctgTransType = class of TSQLRecord;
  TSQLAcctgTransTypeID = type TID;
  TSQLAcctgTransTypeToBeDeletedID = type TID;

  TSQLAcctgTransTypeAttr = class of TSQLRecord;
  TSQLAcctgTransTypeAttrID = type TID;
  TSQLAcctgTransTypeAttrToBeDeletedID = type TID;

  TSQLGlAccount = class of TSQLRecord;
  TSQLGlAccountID = type TID;
  TSQLGlAccountToBeDeletedID = type TID;

  TSQLGlAccountClass = class of TSQLRecord;
  TSQLGlAccountClassID = type TID;
  TSQLGlAccountClassToBeDeletedID = type TID;

  TSQLGlAccountGroup = class of TSQLRecord;
  TSQLGlAccountGroupID = type TID;
  TSQLGlAccountGroupToBeDeletedID = type TID;

  TSQLGlAccountGroupMember = class of TSQLRecord;
  TSQLGlAccountGroupMemberID = type TID;
  TSQLGlAccountGroupMemberToBeDeletedID = type TID;

  TSQLGlAccountGroupType = class of TSQLRecord;
  TSQLGlAccountGroupTypeID = type TID;
  TSQLGlAccountGroupTypeToBeDeletedID = type TID;

  TSQLGlAccountHistory = class of TSQLRecord;
  TSQLGlAccountHistoryID = type TID;
  TSQLGlAccountHistoryToBeDeletedID = type TID;

  TSQLGlAccountOrganization = class of TSQLRecord;
  TSQLGlAccountOrganizationID = type TID;
  TSQLGlAccountOrganizationToBeDeletedID = type TID;

  TSQLGlAccountRole = class of TSQLRecord;
  TSQLGlAccountRoleID = type TID;
  TSQLGlAccountRoleToBeDeletedID = type TID;

  TSQLGlAccountType = class of TSQLRecord;
  TSQLGlAccountTypeID = type TID;
  TSQLGlAccountTypeToBeDeletedID = type TID;

  TSQLGlAccountTypeDefault = class of TSQLRecord;
  TSQLGlAccountTypeDefaultID = type TID;
  TSQLGlAccountTypeDefaultToBeDeletedID = type TID;

  TSQLGlBudgetXref = class of TSQLRecord;
  TSQLGlBudgetXrefID = type TID;
  TSQLGlBudgetXrefToBeDeletedID = type TID;

  TSQLGlFiscalType = class of TSQLRecord;
  TSQLGlFiscalTypeID = type TID;
  TSQLGlFiscalTypeToBeDeletedID = type TID;

  TSQLGlJournal = class of TSQLRecord;
  TSQLGlJournalID = type TID;
  TSQLGlJournalToBeDeletedID = type TID;

  TSQLGlReconciliation = class of TSQLRecord;
  TSQLGlReconciliationID = type TID;
  TSQLGlReconciliationToBeDeletedID = type TID;

  TSQLGlReconciliationEntry = class of TSQLRecord;
  TSQLGlReconciliationEntryID = type TID;
  TSQLGlReconciliationEntryToBeDeletedID = type TID;

  TSQLGlResourceType = class of TSQLRecord;
  TSQLGlResourceTypeID = type TID;
  TSQLGlResourceTypeToBeDeletedID = type TID;

  TSQLGlXbrlClass = class of TSQLRecord;
  TSQLGlXbrlClassID = type TID;
  TSQLGlXbrlClassToBeDeletedID = type TID;

  TSQLPartyAcctgPreference = class of TSQLRecord;
  TSQLPartyAcctgPreferenceID = type TID;
  TSQLPartyAcctgPreferenceToBeDeletedID = type TID;

  TSQLProductAverageCost = class of TSQLRecord;
  TSQLProductAverageCostID = type TID;
  TSQLProductAverageCostToBeDeletedID = type TID;

  TSQLProductAverageCostType = class of TSQLRecord;
  TSQLProductAverageCostTypeID = type TID;
  TSQLProductAverageCostTypeToBeDeletedID = type TID;

  TSQLSettlementTerm = class of TSQLRecord;
  TSQLSettlementTermID = type TID;
  TSQLSettlementTermToBeDeletedID = type TID;

  TSQLVarianceReasonGlAccount = class of TSQLRecord;
  TSQLVarianceReasonGlAccountID = type TID;
  TSQLVarianceReasonGlAccountToBeDeletedID = type TID;

  TSQLBillingAccount = class of TSQLRecord;
  TSQLBillingAccountID = type TID;
  TSQLBillingAccountToBeDeletedID = type TID;

  TSQLBillingAccountRole = class of TSQLRecord;
  TSQLBillingAccountRoleID = type TID;
  TSQLBillingAccountRoleToBeDeletedID = type TID;

  TSQLBillingAccountTerm = class of TSQLRecord;
  TSQLBillingAccountTermID = type TID;
  TSQLBillingAccountTermToBeDeletedID = type TID;

  TSQLBillingAccountTermAttr = class of TSQLRecord;
  TSQLBillingAccountTermAttrID = type TID;
  TSQLBillingAccountTermAttrToBeDeletedID = type TID;

  TSQLCreditCard = class of TSQLRecord;
  TSQLCreditCardID = type TID;
  TSQLCreditCardToBeDeletedID = type TID;

  TSQLCreditCardTypeGlAccount = class of TSQLRecord;
  TSQLCreditCardTypeGlAccountID = type TID;
  TSQLCreditCardTypeGlAccountToBeDeletedID = type TID;

  TSQLDeduction = class of TSQLRecord;
  TSQLDeductionID = type TID;
  TSQLDeductionToBeDeletedID = type TID;

  TSQLDeductionType = class of TSQLRecord;
  TSQLDeductionTypeID = type TID;
  TSQLDeductionTypeToBeDeletedID = type TID;

  TSQLEftAccount = class of TSQLRecord;
  TSQLEftAccountID = type TID;
  TSQLEftAccountToBeDeletedID = type TID;

  TSQLCheckAccount = class of TSQLRecord;
  TSQLCheckAccountID = type TID;
  TSQLCheckAccountToBeDeletedID = type TID;

  TSQLGiftCard = class of TSQLRecord;
  TSQLGiftCardID = type TID;
  TSQLGiftCardToBeDeletedID = type TID;

  TSQLGiftCardFulfillment = class of TSQLRecord;
  TSQLGiftCardFulfillmentID = type TID;
  TSQLGiftCardFulfillmentToBeDeletedID = type TID;

  TSQLPayment = class of TSQLRecord;
  TSQLPaymentID = type TID;
  TSQLPaymentToBeDeletedID = type TID;

  TSQLPaymentApplication = class of TSQLRecord;
  TSQLPaymentApplicationID = type TID;
  TSQLPaymentApplicationToBeDeletedID = type TID;

  TSQLPaymentAttribute = class of TSQLRecord;
  TSQLPaymentAttributeID = type TID;
  TSQLPaymentAttributeToBeDeletedID = type TID;

  TSQLPaymentBudgetAllocation = class of TSQLRecord;
  TSQLPaymentBudgetAllocationID = type TID;
  TSQLPaymentBudgetAllocationToBeDeletedID = type TID;

  TSQLPaymentContent = class of TSQLRecord;
  TSQLPaymentContentID = type TID;
  TSQLPaymentContentToBeDeletedID = type TID;

  TSQLPaymentContentType = class of TSQLRecord;
  TSQLPaymentContentTypeID = type TID;
  TSQLPaymentContentTypeToBeDeletedID = type TID;

  TSQLPaymentMethod = class of TSQLRecord;
  TSQLPaymentMethodID = type TID;
  TSQLPaymentMethodToBeDeletedID = type TID;

  TSQLPaymentMethodType = class of TSQLRecord;
  TSQLPaymentMethodTypeID = type TID;
  TSQLPaymentMethodTypeToBeDeletedID = type TID;

  TSQLPaymentMethodTypeGlAccount = class of TSQLRecord;
  TSQLPaymentMethodTypeGlAccountID = type TID;
  TSQLPaymentMethodTypeGlAccountToBeDeletedID = type TID;

  TSQLPaymentType = class of TSQLRecord;
  TSQLPaymentTypeID = type TID;
  TSQLPaymentTypeToBeDeletedID = type TID;

  TSQLPaymentTypeAttr = class of TSQLRecord;
  TSQLPaymentTypeAttrID = type TID;
  TSQLPaymentTypeAttrToBeDeletedID = type TID;

  TSQLPaymentGlAccountTypeMap = class of TSQLRecord;
  TSQLPaymentGlAccountTypeMapID = type TID;
  TSQLPaymentGlAccountTypeMapToBeDeletedID = type TID;

  TSQLPaymentGatewayConfigType = class of TSQLRecord;
  TSQLPaymentGatewayConfigTypeID = type TID;
  TSQLPaymentGatewayConfigTypeToBeDeletedID = type TID;

  TSQLPaymentGatewayConfig = class of TSQLRecord;
  TSQLPaymentGatewayConfigID = type TID;
  TSQLPaymentGatewayConfigToBeDeletedID = type TID;

  TSQLPaymentGatewaySagePay = class of TSQLRecord;
  TSQLPaymentGatewaySagePayID = type TID;
  TSQLPaymentGatewaySagePayToBeDeletedID = type TID;

  TSQLPaymentGatewayAuthorizeNet = class of TSQLRecord;
  TSQLPaymentGatewayAuthorizeNetID = type TID;
  TSQLPaymentGatewayAuthorizeNetToBeDeletedID = type TID;

  TSQLPaymentGatewayEway = class of TSQLRecord;
  TSQLPaymentGatewayEwayID = type TID;
  TSQLPaymentGatewayEwayToBeDeletedID = type TID;

  TSQLPaymentGatewayCyberSource = class of TSQLRecord;
  TSQLPaymentGatewayCyberSourceID = type TID;
  TSQLPaymentGatewayCyberSourceToBeDeletedID = type TID;

  TSQLPaymentGatewayPayflowPro = class of TSQLRecord;
  TSQLPaymentGatewayPayflowProID = type TID;
  TSQLPaymentGatewayPayflowProToBeDeletedID = type TID;

  TSQLPaymentGatewayPayPal = class of TSQLRecord;
  TSQLPaymentGatewayPayPalID = type TID;
  TSQLPaymentGatewayPayPalToBeDeletedID = type TID;

  TSQLPaymentGatewayClearCommerce = class of TSQLRecord;
  TSQLPaymentGatewayClearCommerceID = type TID;
  TSQLPaymentGatewayClearCommerceToBeDeletedID = type TID;

  TSQLPaymentGatewayWorldPay = class of TSQLRecord;
  TSQLPaymentGatewayWorldPayID = type TID;
  TSQLPaymentGatewayWorldPayToBeDeletedID = type TID;

  TSQLPaymentGatewayOrbital = class of TSQLRecord;
  TSQLPaymentGatewayOrbitalID = type TID;
  TSQLPaymentGatewayOrbitalToBeDeletedID = type TID;

  TSQLPaymentGatewaySecurePay = class of TSQLRecord;
  TSQLPaymentGatewaySecurePayID = type TID;
  TSQLPaymentGatewaySecurePayToBeDeletedID = type TID;

  TSQLPaymentGatewayiDEAL = class of TSQLRecord;
  TSQLPaymentGatewayiDEALID = type TID;
  TSQLPaymentGatewayiDEALToBeDeletedID = type TID;

  TSQLPaymentGatewayRespMsg = class of TSQLRecord;
  TSQLPaymentGatewayRespMsgID = type TID;
  TSQLPaymentGatewayRespMsgToBeDeletedID = type TID;

  TSQLPaymentGatewayResponse = class of TSQLRecord;
  TSQLPaymentGatewayResponseID = type TID;
  TSQLPaymentGatewayResponseToBeDeletedID = type TID;

  TSQLPaymentGroup = class of TSQLRecord;
  TSQLPaymentGroupID = type TID;
  TSQLPaymentGroupToBeDeletedID = type TID;

  TSQLPaymentGroupType = class of TSQLRecord;
  TSQLPaymentGroupTypeID = type TID;
  TSQLPaymentGroupTypeToBeDeletedID = type TID;

  TSQLPaymentGroupMember = class of TSQLRecord;
  TSQLPaymentGroupMemberID = type TID;
  TSQLPaymentGroupMemberToBeDeletedID = type TID;

  TSQLPayPalPaymentMethod = class of TSQLRecord;
  TSQLPayPalPaymentMethodID = type TID;
  TSQLPayPalPaymentMethodToBeDeletedID = type TID;

  TSQLValueLinkKey = class of TSQLRecord;
  TSQLValueLinkKeyID = type TID;
  TSQLValueLinkKeyToBeDeletedID = type TID;

  TSQLPartyTaxAuthInfo = class of TSQLRecord;
  TSQLPartyTaxAuthInfoID = type TID;
  TSQLPartyTaxAuthInfoToBeDeletedID = type TID;

  TSQLTaxAuthority = class of TSQLRecord;
  TSQLTaxAuthorityID = type TID;
  TSQLTaxAuthorityToBeDeletedID = type TID;

  TSQLTaxAuthorityAssoc = class of TSQLRecord;
  TSQLTaxAuthorityAssocID = type TID;
  TSQLTaxAuthorityAssocToBeDeletedID = type TID;

  TSQLTaxAuthorityAssocType = class of TSQLRecord;
  TSQLTaxAuthorityAssocTypeID = type TID;
  TSQLTaxAuthorityAssocTypeToBeDeletedID = type TID;

  TSQLTaxAuthorityCategory = class of TSQLRecord;
  TSQLTaxAuthorityCategoryID = type TID;
  TSQLTaxAuthorityCategoryToBeDeletedID = type TID;

  TSQLTaxAuthorityGlAccount = class of TSQLRecord;
  TSQLTaxAuthorityGlAccountID = type TID;
  TSQLTaxAuthorityGlAccountToBeDeletedID = type TID;

  TSQLTaxAuthorityRateProduct = class of TSQLRecord;
  TSQLTaxAuthorityRateProductID = type TID;
  TSQLTaxAuthorityRateProductToBeDeletedID = type TID;

  TSQLTaxAuthorityRateType = class of TSQLRecord;
  TSQLTaxAuthorityRateTypeID = type TID;
  TSQLTaxAuthorityRateTypeToBeDeletedID = type TID;

  TSQLZipSalesRuleLookup = class of TSQLRecord;
  TSQLZipSalesRuleLookupID = type TID;
  TSQLZipSalesRuleLookupToBeDeletedID = type TID;

  TSQLZipSalesTaxLookup = class of TSQLRecord;
  TSQLZipSalesTaxLookupID = type TID;
  TSQLZipSalesTaxLookupToBeDeletedID = type TID;

  TSQLPartyGlAccount = class of TSQLRecord;
  TSQLPartyGlAccountID = type TID;
  TSQLPartyGlAccountToBeDeletedID = type TID;

  TSQLRateType = class of TSQLRecord;
  TSQLRateTypeID = type TID;
  TSQLRateTypeToBeDeletedID = type TID;

  TSQLRateAmount = class of TSQLRecord;
  TSQLRateAmountID = type TID;
  TSQLRateAmountToBeDeletedID = type TID;

  TSQLPartyRate = class of TSQLRecord;
  TSQLPartyRateID = type TID;
  TSQLPartyRateToBeDeletedID = type TID;

  TSQLGlAccountCategory = class of TSQLRecord;
  TSQLGlAccountCategoryID = type TID;
  TSQLGlAccountCategoryToBeDeletedID = type TID;

  TSQLGlAccountCategoryMember = class of TSQLRecord;
  TSQLGlAccountCategoryMemberID = type TID;
  TSQLGlAccountCategoryMemberToBeDeletedID = type TID;

  TSQLGlAccountCategoryType = class of TSQLRecord;
  TSQLGlAccountCategoryTypeID = type TID;
  TSQLGlAccountCategoryTypeToBeDeletedID = type TID;










  // apache-ofbiz\applications\datamodel\entitydef\workeffort-entitymodel.xml
  TSQLTimeEntry = class of TSQLRecord;
  TSQLTimeEntryID = type TID;
  TSQLTimeEntryToBeDeletedID = type TID;

  TSQLTimesheet = class of TSQLRecord;
  TSQLTimesheetID = type TID;
  TSQLTimesheetToBeDeletedID = type TID;

  TSQLTimesheetRole = class of TSQLRecord;
  TSQLTimesheetRoleID = type TID;
  TSQLTimesheetRoleToBeDeletedID = type TID;

  TSQLApplicationSandbox = class of TSQLRecord;
  TSQLApplicationSandboxID = type TID;
  TSQLApplicationSandboxToBeDeletedID = type TID;

  TSQLCommunicationEventWorkEff = class of TSQLRecord;
  TSQLCommunicationEventWorkEffID = type TID;
  TSQLCommunicationEventWorkEffToBeDeletedID = type TID;

  TSQLDeliverable = class of TSQLRecord;
  TSQLDeliverableID = type TID;
  TSQLDeliverableToBeDeletedID = type TID;

  TSQLDeliverableType = class of TSQLRecord;
  TSQLDeliverableTypeID = type TID;
  TSQLDeliverableTypeToBeDeletedID = type TID;

  TSQLWorkEffort = class of TSQLRecord;
  TSQLWorkEffortID = type TID;
  TSQLWorkEffortToBeDeletedID = type TID;

  TSQLWorkEffortAssoc = class of TSQLRecord;
  TSQLWorkEffortAssocID = type TID;
  TSQLWorkEffortAssocToBeDeletedID = type TID;

  TSQLWorkEffortAssocAttribute = class of TSQLRecord;
  TSQLWorkEffortAssocAttributeID = type TID;
  TSQLWorkEffortAssocAttributeToBeDeletedID = type TID;

  TSQLWorkEffortAssocType = class of TSQLRecord;
  TSQLWorkEffortAssocTypeID = type TID;
  TSQLWorkEffortAssocTypeToBeDeletedID = type TID;

  TSQLWorkEffortAssocTypeAttr = class of TSQLRecord;
  TSQLWorkEffortAssocTypeAttrID = type TID;
  TSQLWorkEffortAssocTypeAttrToBeDeletedID = type TID;

  TSQLWorkEffortAttribute = class of TSQLRecord;
  TSQLWorkEffortAttributeID = type TID;
  TSQLWorkEffortAttributeToBeDeletedID = type TID;

  TSQLWorkEffortBilling = class of TSQLRecord;
  TSQLWorkEffortBillingID = type TID;
  TSQLWorkEffortBillingToBeDeletedID = type TID;

  TSQLWorkEffortContactMech = class of TSQLRecord;
  TSQLWorkEffortContactMechID = type TID;
  TSQLWorkEffortContactMechToBeDeletedID = type TID;

  TSQLWorkEffortContent = class of TSQLRecord;
  TSQLWorkEffortContentID = type TID;
  TSQLWorkEffortContentToBeDeletedID = type TID;

  TSQLWorkEffortContentType = class of TSQLRecord;
  TSQLWorkEffortContentTypeID = type TID;
  TSQLWorkEffortContentTypeToBeDeletedID = type TID;

  TSQLWorkEffortDeliverableProd = class of TSQLRecord;
  TSQLWorkEffortDeliverableProdID = type TID;
  TSQLWorkEffortDeliverableProdToBeDeletedID = type TID;

  TSQLWorkEffortEventReminder = class of TSQLRecord;
  TSQLWorkEffortEventReminderID = type TID;
  TSQLWorkEffortEventReminderToBeDeletedID = type TID;

  TSQLWorkEffortFixedAssetAssign = class of TSQLRecord;
  TSQLWorkEffortFixedAssetAssignID = type TID;
  TSQLWorkEffortFixedAssetAssignToBeDeletedID = type TID;

  TSQLWorkEffortFixedAssetStd = class of TSQLRecord;
  TSQLWorkEffortFixedAssetStdID = type TID;
  TSQLWorkEffortFixedAssetStdToBeDeletedID = type TID;

  TSQLWorkEffortGoodStandard = class of TSQLRecord;
  TSQLWorkEffortGoodStandardID = type TID;
  TSQLWorkEffortGoodStandardToBeDeletedID = type TID;

  TSQLWorkEffortGoodStandardType = class of TSQLRecord;
  TSQLWorkEffortGoodStandardTypeID = type TID;
  TSQLWorkEffortGoodStandardTypeToBeDeletedID = type TID;

  TSQLWorkEffortIcalData = class of TSQLRecord;
  TSQLWorkEffortIcalDataID = type TID;
  TSQLWorkEffortIcalDataToBeDeletedID = type TID;

  TSQLWorkEffortInventoryAssign = class of TSQLRecord;
  TSQLWorkEffortInventoryAssignID = type TID;
  TSQLWorkEffortInventoryAssignToBeDeletedID = type TID;

  TSQLWorkEffortInventoryProduced = class of TSQLRecord;
  TSQLWorkEffortInventoryProducedID = type TID;
  TSQLWorkEffortInventoryProducedToBeDeletedID = type TID;

  TSQLWorkEffortCostCalc = class of TSQLRecord;
  TSQLWorkEffortCostCalcID = type TID;
  TSQLWorkEffortCostCalcToBeDeletedID = type TID;

  TSQLWorkEffortKeyword = class of TSQLRecord;
  TSQLWorkEffortKeywordID = type TID;
  TSQLWorkEffortKeywordToBeDeletedID = type TID;

  TSQLWorkEffortNote = class of TSQLRecord;
  TSQLWorkEffortNoteID = type TID;
  TSQLWorkEffortNoteToBeDeletedID = type TID;

  TSQLWorkEffortPartyAssignment = class of TSQLRecord;
  TSQLWorkEffortPartyAssignmentID = type TID;
  TSQLWorkEffortPartyAssignmentToBeDeletedID = type TID;

  TSQLWorkEffortPurposeType = class of TSQLRecord;
  TSQLWorkEffortPurposeTypeID = type TID;
  TSQLWorkEffortPurposeTypeToBeDeletedID = type TID;

  TSQLWorkEffortReview = class of TSQLRecord;
  TSQLWorkEffortReviewID = type TID;
  TSQLWorkEffortReviewToBeDeletedID = type TID;

  TSQLWorkEffortSearchConstraint = class of TSQLRecord;
  TSQLWorkEffortSearchConstraintID = type TID;
  TSQLWorkEffortSearchConstraintToBeDeletedID = type TID;

  TSQLWorkEffortSearchResult = class of TSQLRecord;
  TSQLWorkEffortSearchResultID = type TID;
  TSQLWorkEffortSearchResultToBeDeletedID = type TID;

  TSQLWorkEffortSkillStandard = class of TSQLRecord;
  TSQLWorkEffortSkillStandardID = type TID;
  TSQLWorkEffortSkillStandardToBeDeletedID = type TID;

  TSQLWorkEffortStatus = class of TSQLRecord;
  TSQLWorkEffortStatusID = type TID;
  TSQLWorkEffortStatusToBeDeletedID = type TID;

  TSQLWorkEffortTransBox = class of TSQLRecord;
  TSQLWorkEffortTransBoxID = type TID;
  TSQLWorkEffortTransBoxToBeDeletedID = type TID;

  TSQLWorkEffortType = class of TSQLRecord;
  TSQLWorkEffortTypeID = type TID;
  TSQLWorkEffortTypeToBeDeletedID = type TID;

  TSQLWorkEffortTypeAttr = class of TSQLRecord;
  TSQLWorkEffortTypeAttrID = type TID;
  TSQLWorkEffortTypeAttrToBeDeletedID = type TID;

  TSQLWorkEffortSurveyAppl = class of TSQLRecord;
  TSQLWorkEffortSurveyApplID = type TID;
  TSQLWorkEffortSurveyApplToBeDeletedID = type TID;










  // apache-ofbiz\applications\datamodel\entitydef\shipment-entitymodel.xml
  TSQLItemIssuance = class of TSQLRecord;
  TSQLItemIssuanceID = type TID;
  TSQLItemIssuanceToBeDeletedID = type TID;

  TSQLItemIssuanceRole = class of TSQLRecord;
  TSQLItemIssuanceRoleID = type TID;
  TSQLItemIssuanceRoleToBeDeletedID = type TID;

  TSQLPicklist = class of TSQLRecord;
  TSQLPicklistID = type TID;
  TSQLPicklistToBeDeletedID = type TID;

  TSQLPicklistBin = class of TSQLRecord;
  TSQLPicklistBinID = type TID;
  TSQLPicklistBinToBeDeletedID = type TID;

  TSQLPicklistItem = class of TSQLRecord;
  TSQLPicklistItemID = type TID;
  TSQLPicklistItemToBeDeletedID = type TID;

  TSQLPicklistRole = class of TSQLRecord;
  TSQLPicklistRoleID = type TID;
  TSQLPicklistRoleToBeDeletedID = type TID;

  TSQLPicklistStatusHistory = class of TSQLRecord;
  TSQLPicklistStatusHistoryID = type TID;
  TSQLPicklistStatusHistoryToBeDeletedID = type TID;

  TSQLRejectionReason = class of TSQLRecord;
  TSQLRejectionReasonID = type TID;
  TSQLRejectionReasonToBeDeletedID = type TID;

  TSQLShipmentReceipt = class of TSQLRecord;
  TSQLShipmentReceiptID = type TID;
  TSQLShipmentReceiptToBeDeletedID = type TID;

  TSQLShipmentReceiptRole = class of TSQLRecord;
  TSQLShipmentReceiptRoleID = type TID;
  TSQLShipmentReceiptRoleToBeDeletedID = type TID;

  TSQLCarrierShipmentMethod = class of TSQLRecord;
  TSQLCarrierShipmentMethodID = type TID;
  TSQLCarrierShipmentMethodToBeDeletedID = type TID;

  TSQLCarrierShipmentBoxType = class of TSQLRecord;
  TSQLCarrierShipmentBoxTypeID = type TID;
  TSQLCarrierShipmentBoxTypeToBeDeletedID = type TID;

  TSQLDelivery = class of TSQLRecord;
  TSQLDeliveryID = type TID;
  TSQLDeliveryToBeDeletedID = type TID;

  TSQLShipment = class of TSQLRecord;
  TSQLShipmentID = type TID;
  TSQLShipmentToBeDeletedID = type TID;

  TSQLShipmentAttribute = class of TSQLRecord;
  TSQLShipmentAttributeID = type TID;
  TSQLShipmentAttributeToBeDeletedID = type TID;

  TSQLShipmentBoxType = class of TSQLRecord;
  TSQLShipmentBoxTypeID = type TID;
  TSQLShipmentBoxTypeToBeDeletedID = type TID;

  TSQLShipmentContactMech = class of TSQLRecord;
  TSQLShipmentContactMechID = type TID;
  TSQLShipmentContactMechToBeDeletedID = type TID;

  TSQLShipmentContactMechType = class of TSQLRecord;
  TSQLShipmentContactMechTypeID = type TID;
  TSQLShipmentContactMechTypeToBeDeletedID = type TID;

  TSQLShipmentCostEstimate = class of TSQLRecord;
  TSQLShipmentCostEstimateID = type TID;
  TSQLShipmentCostEstimateToBeDeletedID = type TID;

  TSQLShipmentGatewayConfigType = class of TSQLRecord;
  TSQLShipmentGatewayConfigTypeID = type TID;
  TSQLShipmentGatewayConfigTypeToBeDeletedID = type TID;

  TSQLShipmentGatewayConfig = class of TSQLRecord;
  TSQLShipmentGatewayConfigID = type TID;
  TSQLShipmentGatewayConfigToBeDeletedID = type TID;

  TSQLShipmentGatewayDhl = class of TSQLRecord;
  TSQLShipmentGatewayDhlID = type TID;
  TSQLShipmentGatewayDhlToBeDeletedID = type TID;

  TSQLShipmentGatewayFedex = class of TSQLRecord;
  TSQLShipmentGatewayFedexID = type TID;
  TSQLShipmentGatewayFedexToBeDeletedID = type TID;

  TSQLShipmentGatewayUps = class of TSQLRecord;
  TSQLShipmentGatewayUpsID = type TID;
  TSQLShipmentGatewayUpsToBeDeletedID = type TID;

  TSQLShipmentGatewayUsps = class of TSQLRecord;
  TSQLShipmentGatewayUspsID = type TID;
  TSQLShipmentGatewayUspsToBeDeletedID = type TID;

  TSQLShipmentItem = class of TSQLRecord;
  TSQLShipmentItemID = type TID;
  TSQLShipmentItemToBeDeletedID = type TID;

  TSQLShipmentItemBilling = class of TSQLRecord;
  TSQLShipmentItemBillingID = type TID;
  TSQLShipmentItemBillingToBeDeletedID = type TID;

  TSQLShipmentItemFeature = class of TSQLRecord;
  TSQLShipmentItemFeatureID = type TID;
  TSQLShipmentItemFeatureToBeDeletedID = type TID;

  TSQLShipmentMethodType = class of TSQLRecord;
  TSQLShipmentMethodTypeID = type TID;
  TSQLShipmentMethodTypeToBeDeletedID = type TID;

  TSQLShipmentPackage = class of TSQLRecord;
  TSQLShipmentPackageID = type TID;
  TSQLShipmentPackageToBeDeletedID = type TID;

  TSQLShipmentPackageContent = class of TSQLRecord;
  TSQLShipmentPackageContentID = type TID;
  TSQLShipmentPackageContentToBeDeletedID = type TID;

  TSQLShipmentPackageRouteSeg = class of TSQLRecord;
  TSQLShipmentPackageRouteSegID = type TID;
  TSQLShipmentPackageRouteSegToBeDeletedID = type TID;

  TSQLShipmentRouteSegment = class of TSQLRecord;
  TSQLShipmentRouteSegmentID = type TID;
  TSQLShipmentRouteSegmentToBeDeletedID = type TID;

  TSQLShipmentStatus = class of TSQLRecord;
  TSQLShipmentStatusID = type TID;
  TSQLShipmentStatusToBeDeletedID = type TID;

  TSQLShipmentType = class of TSQLRecord;
  TSQLShipmentTypeID = type TID;
  TSQLShipmentTypeToBeDeletedID = type TID;

  TSQLShipmentTypeAttr = class of TSQLRecord;
  TSQLShipmentTypeAttrID = type TID;
  TSQLShipmentTypeAttrToBeDeletedID = type TID;

  TSQLShippingDocument = class of TSQLRecord;
  TSQLShippingDocumentID = type TID;
  TSQLShippingDocumentToBeDeletedID = type TID;




  // apache-ofbiz\applications\datamodel\entitydef\marketing-entitymodel.xml
  TSQLMarketingCampaign = class of TSQLRecord;
  TSQLMarketingCampaignID = type TID;
  TSQLMarketingCampaignToBeDeletedID = type TID;

  TSQLMarketingCampaignNote = class of TSQLRecord;
  TSQLMarketingCampaignNoteID = type TID;
  TSQLMarketingCampaignNoteToBeDeletedID = type TID;

  TSQLMarketingCampaignPrice = class of TSQLRecord;
  TSQLMarketingCampaignPriceID = type TID;
  TSQLMarketingCampaignPriceToBeDeletedID = type TID;

  TSQLMarketingCampaignPromo = class of TSQLRecord;
  TSQLMarketingCampaignPromoID = type TID;
  TSQLMarketingCampaignPromoToBeDeletedID = type TID;

  TSQLMarketingCampaignRole = class of TSQLRecord;
  TSQLMarketingCampaignRoleID = type TID;
  TSQLMarketingCampaignRoleToBeDeletedID = type TID;

  TSQLContactList = class of TSQLRecord;
  TSQLContactListID = type TID;
  TSQLContactListToBeDeletedID = type TID;

  TSQLWebSiteContactList = class of TSQLRecord;
  TSQLWebSiteContactListID = type TID;
  TSQLWebSiteContactListToBeDeletedID = type TID;

  TSQLContactListCommStatus = class of TSQLRecord;
  TSQLContactListCommStatusID = type TID;
  TSQLContactListCommStatusToBeDeletedID = type TID;

  TSQLContactListParty = class of TSQLRecord;
  TSQLContactListPartyID = type TID;
  TSQLContactListPartyToBeDeletedID = type TID;

  TSQLContactListPartyStatus = class of TSQLRecord;
  TSQLContactListPartyStatusID = type TID;
  TSQLContactListPartyStatusToBeDeletedID = type TID;

  TSQLContactListType = class of TSQLRecord;
  TSQLContactListTypeID = type TID;
  TSQLContactListTypeToBeDeletedID = type TID;

  TSQLSegmentGroup = class of TSQLRecord;
  TSQLSegmentGroupID = type TID;
  TSQLSegmentGroupToBeDeletedID = type TID;

  TSQLSegmentGroupClassification = class of TSQLRecord;
  TSQLSegmentGroupClassificationID = type TID;
  TSQLSegmentGroupClassificationToBeDeletedID = type TID;

  TSQLSegmentGroupGeo = class of TSQLRecord;
  TSQLSegmentGroupGeoID = type TID;
  TSQLSegmentGroupGeoToBeDeletedID = type TID;

  TSQLSegmentGroupRole = class of TSQLRecord;
  TSQLSegmentGroupRoleID = type TID;
  TSQLSegmentGroupRoleToBeDeletedID = type TID;

  TSQLSegmentGroupType = class of TSQLRecord;
  TSQLSegmentGroupTypeID = type TID;
  TSQLSegmentGroupTypeToBeDeletedID = type TID;

  TSQLTrackingCode = class of TSQLRecord;
  TSQLTrackingCodeID = type TID;
  TSQLTrackingCodeToBeDeletedID = type TID;

  TSQLTrackingCodeOrder = class of TSQLRecord;
  TSQLTrackingCodeOrderID = type TID;
  TSQLTrackingCodeOrderToBeDeletedID = type TID;

  TSQLTrackingCodeOrderReturn = class of TSQLRecord;
  TSQLTrackingCodeOrderReturnID = type TID;
  TSQLTrackingCodeOrderReturnToBeDeletedID = type TID;

  TSQLTrackingCodeType = class of TSQLRecord;
  TSQLTrackingCodeTypeID = type TID;
  TSQLTrackingCodeTypeToBeDeletedID = type TID;

  TSQLTrackingCodeVisit = class of TSQLRecord;
  TSQLTrackingCodeVisitID = type TID;
  TSQLTrackingCodeVisitToBeDeletedID = type TID;

  TSQLSalesOpportunity = class of TSQLRecord;
  TSQLSalesOpportunityID = type TID;
  TSQLSalesOpportunityToBeDeletedID = type TID;

  TSQLSalesOpportunityHistory = class of TSQLRecord;
  TSQLSalesOpportunityHistoryID = type TID;
  TSQLSalesOpportunityHistoryToBeDeletedID = type TID;

  TSQLSalesOpportunityRole = class of TSQLRecord;
  TSQLSalesOpportunityRoleID = type TID;
  TSQLSalesOpportunityRoleToBeDeletedID = type TID;

  TSQLSalesOpportunityStage = class of TSQLRecord;
  TSQLSalesOpportunityStageID = type TID;
  TSQLSalesOpportunityStageToBeDeletedID = type TID;

  TSQLSalesOpportunityWorkEffort = class of TSQLRecord;
  TSQLSalesOpportunityWorkEffortID = type TID;
  TSQLSalesOpportunityWorkEffortToBeDeletedID = type TID;

  TSQLSalesOpportunityQuote = class of TSQLRecord;
  TSQLSalesOpportunityQuoteID = type TID;
  TSQLSalesOpportunityQuoteToBeDeletedID = type TID;

  TSQLSalesForecast = class of TSQLRecord;
  TSQLSalesForecastID = type TID;
  TSQLSalesForecastToBeDeletedID = type TID;

  TSQLSalesForecastDetail = class of TSQLRecord;
  TSQLSalesForecastDetailID = type TID;
  TSQLSalesForecastDetailToBeDeletedID = type TID;

  TSQLSalesForecastHistory = class of TSQLRecord;
  TSQLSalesForecastHistoryID = type TID;
  TSQLSalesForecastHistoryToBeDeletedID = type TID;

  TSQLSalesOpportunityCompetitor = class of TSQLRecord;
  TSQLSalesOpportunityCompetitorID = type TID;
  TSQLSalesOpportunityCompetitorToBeDeletedID = type TID;

  TSQLSalesOpportunityTrckCode = class of TSQLRecord;
  TSQLSalesOpportunityTrckCodeID = type TID;
  TSQLSalesOpportunityTrckCodeToBeDeletedID = type TID;









  // apache-ofbiz\applications\datamodel\entitydef\manufacturing-entitymodel.xml
  TSQLProductManufacturingRule = class of TSQLRecord;
  TSQLProductManufacturingRuleID = type TID;
  TSQLProductManufacturingRuleToBeDeletedID = type TID;

  TSQLTechDataCalendar = class of TSQLRecord;
  TSQLTechDataCalendarID = type TID;
  TSQLTechDataCalendarToBeDeletedID = type TID;

  TSQLTechDataCalendarExcDay = class of TSQLRecord;
  TSQLTechDataCalendarExcDayID = type TID;
  TSQLTechDataCalendarExcDayToBeDeletedID = type TID;

  TSQLTechDataCalendarExcWeek = class of TSQLRecord;
  TSQLTechDataCalendarExcWeekID = type TID;
  TSQLTechDataCalendarExcWeekToBeDeletedID = type TID;

  TSQLTechDataCalendarWeek = class of TSQLRecord;
  TSQLTechDataCalendarWeekID = type TID;
  TSQLTechDataCalendarWeekToBeDeletedID = type TID;

  TSQLMrpEventType = class of TSQLRecord;
  TSQLMrpEventTypeID = type TID;
  TSQLMrpEventTypeToBeDeletedID = type TID;

  TSQLMrpEvent = class of TSQLRecord;
  TSQLMrpEventID = type TID;
  TSQLMrpEventToBeDeletedID = type TID;




  // apache-ofbiz\applications\datamodel\entitydef\humanres-entitymodel.xml
  TSQLPartyQual = class of TSQLRecord;
  TSQLPartyQualID = type TID;
  TSQLPartyQualToBeDeletedID = type TID;

  TSQLPartyQualType = class of TSQLRecord;
  TSQLPartyQualTypeID = type TID;
  TSQLPartyQualTypeToBeDeletedID = type TID;

  TSQLPartyResume = class of TSQLRecord;
  TSQLPartyResumeID = type TID;
  TSQLPartyResumeToBeDeletedID = type TID;

  TSQLPartySkill = class of TSQLRecord;
  TSQLPartySkillID = type TID;
  TSQLPartySkillToBeDeletedID = type TID;

  TSQLPerfRatingType = class of TSQLRecord;
  TSQLPerfRatingTypeID = type TID;
  TSQLPerfRatingTypeToBeDeletedID = type TID;

  TSQLPerfReview = class of TSQLRecord;
  TSQLPerfReviewID = type TID;
  TSQLPerfReviewToBeDeletedID = type TID;

  TSQLPerfReviewItem = class of TSQLRecord;
  TSQLPerfReviewItemID = type TID;
  TSQLPerfReviewItemToBeDeletedID = type TID;

  TSQLPerfReviewItemType = class of TSQLRecord;
  TSQLPerfReviewItemTypeID = type TID;
  TSQLPerfReviewItemTypeToBeDeletedID = type TID;

  TSQLPerformanceNote = class of TSQLRecord;
  TSQLPerformanceNoteID = type TID;
  TSQLPerformanceNoteToBeDeletedID = type TID;

  TSQLPersonTraining = class of TSQLRecord;
  TSQLPersonTrainingID = type TID;
  TSQLPersonTrainingToBeDeletedID = type TID;

  TSQLResponsibilityType = class of TSQLRecord;
  TSQLResponsibilityTypeID = type TID;
  TSQLResponsibilityTypeToBeDeletedID = type TID;

  TSQLSkillType = class of TSQLRecord;
  TSQLSkillTypeID = type TID;
  TSQLSkillTypeToBeDeletedID = type TID;

  TSQLTrainingClassType = class of TSQLRecord;
  TSQLTrainingClassTypeID = type TID;
  TSQLTrainingClassTypeToBeDeletedID = type TID;

  TSQLBenefitType = class of TSQLRecord;
  TSQLBenefitTypeID = type TID;
  TSQLBenefitTypeToBeDeletedID = type TID;

  TSQLEmployment = class of TSQLRecord;
  TSQLEmploymentID = type TID;
  TSQLEmploymentToBeDeletedID = type TID;

  TSQLEmploymentApp = class of TSQLRecord;
  TSQLEmploymentAppID = type TID;
  TSQLEmploymentAppToBeDeletedID = type TID;

  TSQLEmploymentAppSourceType = class of TSQLRecord;
  TSQLEmploymentAppSourceTypeID = type TID;
  TSQLEmploymentAppSourceTypeToBeDeletedID = type TID;

  TSQLEmplLeave = class of TSQLRecord;
  TSQLEmplLeaveID = type TID;
  TSQLEmplLeaveToBeDeletedID = type TID;

  TSQLEmplLeaveType = class of TSQLRecord;
  TSQLEmplLeaveTypeID = type TID;
  TSQLEmplLeaveTypeToBeDeletedID = type TID;

  TSQLPartyBenefit = class of TSQLRecord;
  TSQLPartyBenefitID = type TID;
  TSQLPartyBenefitToBeDeletedID = type TID;

  TSQLPayGrade = class of TSQLRecord;
  TSQLPayGradeID = type TID;
  TSQLPayGradeToBeDeletedID = type TID;

  TSQLPayHistory = class of TSQLRecord;
  TSQLPayHistoryID = type TID;
  TSQLPayHistoryToBeDeletedID = type TID;

  TSQLPayrollPreference = class of TSQLRecord;
  TSQLPayrollPreferenceID = type TID;
  TSQLPayrollPreferenceToBeDeletedID = type TID;

  TSQLSalaryStep = class of TSQLRecord;
  TSQLSalaryStepID = type TID;
  TSQLSalaryStepToBeDeletedID = type TID;

  TSQLTerminationReason = class of TSQLRecord;
  TSQLTerminationReasonID = type TID;
  TSQLTerminationReasonToBeDeletedID = type TID;

  TSQLTerminationType = class of TSQLRecord;
  TSQLTerminationTypeID = type TID;
  TSQLTerminationTypeToBeDeletedID = type TID;

  TSQLUnemploymentClaim = class of TSQLRecord;
  TSQLUnemploymentClaimID = type TID;
  TSQLUnemploymentClaimToBeDeletedID = type TID;

  TSQLEmplPosition = class of TSQLRecord;
  TSQLEmplPositionID = type TID;
  TSQLEmplPositionToBeDeletedID = type TID;

  TSQLEmplPositionClassType = class of TSQLRecord;
  TSQLEmplPositionClassTypeID = type TID;
  TSQLEmplPositionClassTypeToBeDeletedID = type TID;

  TSQLEmplPositionFulfillment = class of TSQLRecord;
  TSQLEmplPositionFulfillmentID = type TID;
  TSQLEmplPositionFulfillmentToBeDeletedID = type TID;

  TSQLEmplPositionReportingStruct = class of TSQLRecord;
  TSQLEmplPositionReportingStructID = type TID;
  TSQLEmplPositionReportingStructToBeDeletedID = type TID;

  TSQLEmplPositionResponsibility = class of TSQLRecord;
  TSQLEmplPositionResponsibilityID = type TID;
  TSQLEmplPositionResponsibilityToBeDeletedID = type TID;

  TSQLEmplPositionType = class of TSQLRecord;
  TSQLEmplPositionTypeID = type TID;
  TSQLEmplPositionTypeToBeDeletedID = type TID;

  TSQLEmplPositionTypeClass = class of TSQLRecord;
  TSQLEmplPositionTypeClassID = type TID;
  TSQLEmplPositionTypeClassToBeDeletedID = type TID;

  TSQLValidResponsibility = class of TSQLRecord;
  TSQLValidResponsibilityID = type TID;
  TSQLValidResponsibilityToBeDeletedID = type TID;

  TSQLEmplPositionTypeRate = class of TSQLRecord;
  TSQLEmplPositionTypeRateID = type TID;
  TSQLEmplPositionTypeRateToBeDeletedID = type TID;

  TSQLJobRequisition = class of TSQLRecord;
  TSQLJobRequisitionID = type TID;
  TSQLJobRequisitionToBeDeletedID = type TID;

  TSQLJobInterview = class of TSQLRecord;
  TSQLJobInterviewID = type TID;
  TSQLJobInterviewToBeDeletedID = type TID;

  TSQLJobInterviewType = class of TSQLRecord;
  TSQLJobInterviewTypeID = type TID;
  TSQLJobInterviewTypeToBeDeletedID = type TID;

  TSQLTrainingRequest = class of TSQLRecord;
  TSQLTrainingRequestID = type TID;
  TSQLTrainingRequestToBeDeletedID = type TID;

  TSQLEmplLeaveReasonType = class of TSQLRecord;
  TSQLEmplLeaveReasonTypeID = type TID;
  TSQLEmplLeaveReasonTypeToBeDeletedID = type TID;




  // apache-ofbiz\applications\datamodel\entitydef\content-entitymodel.xml






  // apache-ofbiz\framework\common\entitydef\entitymodel.xml
  TSQLDataSource = class of TSQLRecord;
  TSQLDataSourceID = type TID;
  TSQLDataSourceToBeDeletedID = type TID;

  TSQLDataSourceType = class of TSQLRecord;
  TSQLDataSourceTypeID = type TID;
  TSQLDataSourceTypeToBeDeletedID = type TID;

  TSQLEmailTemplateSetting = class of TSQLRecord;
  TSQLEmailTemplateSettingID = type TID;
  TSQLEmailTemplateSettingToBeDeletedID = type TID;

  TSQLEnumeration = class of TSQLRecord;
  TSQLEnumerationID = type TID;
  TSQLEnumerationToBeDeletedID = type TID;

  TSQLEnumerationType = class of TSQLRecord;
  TSQLEnumerationTypeID = type TID;
  TSQLEnumerationTypeToBeDeletedID = type TID;

  TSQLCountryCapital = class of TSQLRecord;
  TSQLCountryCapitalID = type TID;
  TSQLCountryCapitalToBeDeletedID = type TID;

  TSQLCountryCode = class of TSQLRecord;
  TSQLCountryCodeID = type TID;
  TSQLCountryCodeToBeDeletedID = type TID;

  TSQLCountryTeleCode = class of TSQLRecord;
  TSQLCountryTeleCodeID = type TID;
  TSQLCountryTeleCodeToBeDeletedID = type TID;

  TSQLCountryAddressFormat = class of TSQLRecord;
  TSQLCountryAddressFormatID = type TID;
  TSQLCountryAddressFormatToBeDeletedID = type TID;

  TSQLGeo = class of TSQLRecord;
  TSQLGeoID = type TID;
  TSQLGeoToBeDeletedID = type TID;

  TSQLGeoAssoc = class of TSQLRecord;
  TSQLGeoAssocID = type TID;
  TSQLGeoAssocToBeDeletedID = type TID;

  TSQLGeoAssocType = class of TSQLRecord;
  TSQLGeoAssocTypeID = type TID;
  TSQLGeoAssocTypeToBeDeletedID = type TID;

  TSQLGeoPoint = class of TSQLRecord;
  TSQLGeoPointID = type TID;
  TSQLGeoPointToBeDeletedID = type TID;

  TSQLGeoType = class of TSQLRecord;
  TSQLGeoTypeID = type TID;
  TSQLGeoTypeToBeDeletedID = type TID;

  TSQLKeywordThesaurus = class of TSQLRecord;
  TSQLKeywordThesaurusID = type TID;
  TSQLKeywordThesaurusToBeDeletedID = type TID;

  TSQLStandardLanguage = class of TSQLRecord;
  TSQLStandardLanguageID = type TID;
  TSQLStandardLanguageToBeDeletedID = type TID;

  TSQLCustomMethod = class of TSQLRecord;
  TSQLCustomMethodID = type TID;
  TSQLCustomMethodToBeDeletedID = type TID;

  TSQLCustomMethodType = class of TSQLRecord;
  TSQLCustomMethodTypeID = type TID;
  TSQLCustomMethodTypeToBeDeletedID = type TID;

  TSQLNoteData = class of TSQLRecord;
  TSQLNoteDataID = type TID;
  TSQLNoteDataToBeDeletedID = type TID;

  TSQLCustomTimePeriod = class of TSQLRecord;
  TSQLCustomTimePeriodID = type TID;
  TSQLCustomTimePeriodToBeDeletedID = type TID;

  TSQLPeriodType = class of TSQLRecord;
  TSQLPeriodTypeID = type TID;
  TSQLPeriodTypeToBeDeletedID = type TID;

  TSQLStatusItem = class of TSQLRecord;
  TSQLStatusItemID = type TID;
  TSQLStatusItemToBeDeletedID = type TID;

  TSQLStatusType = class of TSQLRecord;
  TSQLStatusTypeID = type TID;
  TSQLStatusTypeToBeDeletedID = type TID;

  TSQLStatusValidChange = class of TSQLRecord;
  TSQLStatusValidChangeID = type TID;
  TSQLStatusValidChangeToBeDeletedID = type TID;

  TSQLUom = class of TSQLRecord;
  TSQLUomID = type TID;
  TSQLUomToBeDeletedID = type TID;

  TSQLUomConversion = class of TSQLRecord;
  TSQLUomConversionID = type TID;
  TSQLUomConversionToBeDeletedID = type TID;

  TSQLUomConversionDated = class of TSQLRecord;
  TSQLUomConversionDatedID = type TID;
  TSQLUomConversionDatedToBeDeletedID = type TID;

  TSQLUomGroup = class of TSQLRecord;
  TSQLUomGroupID = type TID;
  TSQLUomGroupToBeDeletedID = type TID;

  TSQLUomType = class of TSQLRecord;
  TSQLUomTypeID = type TID;
  TSQLUomTypeToBeDeletedID = type TID;

  TSQLUserPreference = class of TSQLRecord;
  TSQLUserPreferenceID = type TID;
  TSQLUserPreferenceToBeDeletedID = type TID;

  TSQLUserPrefGroupType = class of TSQLRecord;
  TSQLUserPrefGroupTypeID = type TID;
  TSQLUserPrefGroupTypeToBeDeletedID = type TID;

  TSQLVisualThemeSet = class of TSQLRecord;
  TSQLVisualThemeSetID = type TID;
  TSQLVisualThemeSetToBeDeletedID = type TID;

  TSQLVisualTheme = class of TSQLRecord;
  TSQLVisualThemeID = type TID;
  TSQLVisualThemeToBeDeletedID = type TID;

  TSQLVisualThemeResource = class of TSQLRecord;
  TSQLVisualThemeResourceID = type TID;
  TSQLVisualThemeResourceToBeDeletedID = type TID;

  TSQLPortalPortlet = class of TSQLRecord;
  TSQLPortalPortletID = type TID;
  TSQLPortalPortletToBeDeletedID = type TID;

  TSQLPortletCategory = class of TSQLRecord;
  TSQLPortletCategoryID = type TID;
  TSQLPortletCategoryToBeDeletedID = type TID;

  TSQLPortletPortletCategory = class of TSQLRecord;
  TSQLPortletPortletCategoryID = type TID;
  TSQLPortletPortletCategoryToBeDeletedID = type TID;

  TSQLPortalPage = class of TSQLRecord;
  TSQLPortalPageID = type TID;
  TSQLPortalPageToBeDeletedID = type TID;

  TSQLPortalPageColumn = class of TSQLRecord;
  TSQLPortalPageColumnID = type TID;
  TSQLPortalPageColumnToBeDeletedID = type TID;

  TSQLPortalPagePortlet = class of TSQLRecord;
  TSQLPortalPagePortletID = type TID;
  TSQLPortalPagePortletToBeDeletedID = type TID;

  TSQLPortletAttribute = class of TSQLRecord;
  TSQLPortletAttributeID = type TID;
  TSQLPortletAttributeToBeDeletedID = type TID;

  TSQLSystemProperty = class of TSQLRecord;
  TSQLSystemPropertyID = type TID;
  TSQLSystemPropertyToBeDeletedID = type TID;



  // apache-ofbiz\framework\security\entitydef\entitymodel.xml



implementation

end.

