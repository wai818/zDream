unit uContent;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLContent = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fContentTypeEncode: RawUTF8;
      fContentType: TSQLContentTypeID;
      fOwnerContent: TSQLContentID;
      fDecoratorContent: TSQLContentID;
      fInstanceOfContent: TSQLContentID;
      fDataResource: TSQLDataResourceID;
      fTemplateDataResource: TSQLDataResourceID;
      fDataSource: TSQLDataSourceID;
      fStatus: TSQLStatusItemID;
      fPrivilegeEnum: TSQLEnumerationID;
      fServiceName: RawUTF8;
      fCustomMethod: TSQLCustomMethodID;
      fContentName: RawUTF8;
      fDescription: RawUTF8;
      fLocaleString: RawUTF8;
      fMimeType: TSQLMimeTypeID;
      fCharacterSet: TSQLCharacterSetID;
      fChildLeafCount: Integer;
      fChildBranchCount: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ContentTypeEncode: RawUTF8 read fContentTypeEncode write fContentTypeEncode;
      property ContentType: TSQLContentTypeID read fContentType write fContentType;
      property OwnerContent: TSQLContentID read fOwnerContent write fOwnerContent;
      property DecoratorContent: TSQLContentID read fDecoratorContent write fDecoratorContent;
      property InstanceOfContent: TSQLContentID read fInstanceOfContent write fInstanceOfContent;
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property TemplateDataResource: TSQLDataResourceID read fTemplateDataResource write fTemplateDataResource;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property PrivilegeEnum: TSQLEnumerationID read fPrivilegeEnum write fPrivilegeEnum;
      property ServiceName: RawUTF8 read fServiceName write fServiceName;
      property CustomMethod: TSQLCustomMethodID read fCustomMethod write fCustomMethod;
      property ContentName: RawUTF8 read fContentName write fContentName;
      property Description: RawUTF8 read fDescription write fDescription;
      property LocaleString: RawUTF8 read fLocaleString write fLocaleString;
      property MimeType: TSQLMimeTypeID read fMimeType write fMimeType;
      property CharacterSet: TSQLCharacterSetID read fCharacterSet write fCharacterSet;
      property ChildLeafCount: Integer read fChildLeafCount write fChildLeafCount;
      property ChildBranchCount: Integer read fChildBranchCount write fChildBranchCount;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 2
  TSQLContentApproval = class(TSQLRecord)
    private
      fContent: TSQLContentRevisionID;                  //contentId, contentRevisionSeqId
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fApprovalStatus: TSQLStatusItemID;
      fApprovalDate: TDateTime;
      fSequenceNum: Integer;
      fComments: RawUTF8;
    published
      property Content: TSQLContentRevisionID read fContent write fContent;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property ApprovalStatus: TSQLStatusItemID read fApprovalStatus write fApprovalStatus;
      property ApprovalDate: TDateTime read fApprovalDate write fApprovalDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 3
  TSQLContentAssoc = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fContentIdTo: TSQLContentID;
      fContentAssocType: TSQLContentAssocTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fContentAssocPredicate: TSQLContentAssocPredicateID;
      fDataSource: TSQLDataSourceID;
      fSequenceNum: Integer;
      fMapKey: RawUTF8;
      fUpperCoordinate: Integer;
      fLeftCoordinate: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property Content: TSQLContentID read fContent write fContent;
      property ContentIdTo: TSQLContentID read fContentIdTo write fContentIdTo;
      property ContentAssocType: TSQLContentAssocTypeID read fContentAssocType write fContentAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ContentAssocPredicate: TSQLContentAssocPredicateID read fContentAssocPredicate write fContentAssocPredicate;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property MapKey: RawUTF8 read fMapKey write fMapKey;
      property UpperCoordinate: Integer read fUpperCoordinate write fUpperCoordinate;
      property LeftCoordinate: Integer read fLeftCoordinate write fLeftCoordinate;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 4
  TSQLContentAssocPredicate = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 5
  TSQLContentAssocType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 6
  TSQLContentAttribute = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Content: TSQLContentID read fContent write fContent;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 7
  TSQLContentMetaData = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fMetaDataPredicate: TSQLMetaDataPredicateID;
      fMetaDataValue: RawUTF8;
      fDataSource: TSQLDataSourceID;
    published
      property Content: TSQLContentID read fContent write fContent;
      property MetaDataPredicate: TSQLMetaDataPredicateID read fMetaDataPredicate write fMetaDataPredicate;
      property MetaDataValue: RawUTF8 read fMetaDataValue write fMetaDataValue;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
  end;

  // 8
  TSQLContentOperation = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 9
  TSQLContentPurpose = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fContentPurposeType: TSQLContentPurposeTypeID;
      fSequenceNum: Integer;
    published
      property Content: TSQLContentID read fContent write fContent;
      property ContentPurposeType: TSQLContentPurposeTypeID read fContentPurposeType write fContentPurposeType;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 10
  TSQLContentPurposeOperation = class(TSQLRecord)
    private
      fContentPurposeType: TSQLContentPurposeTypeID;
      fRoleType: TSQLRoleTypeID;
      fStatus: TSQLStatusItemID;
      fPrivilegeEnum: TSQLEnumerationID;
    published
      property ContentPurposeType: TSQLContentPurposeTypeID read fContentPurposeType write fContentPurposeType;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property PrivilegeEnum: TSQLEnumerationID read fPrivilegeEnum write fPrivilegeEnum;
  end;

  // 11
  TSQLContentPurposeType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 12
  TSQLContentRevision = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fContentRevisionSeq: Integer;
      fCommittedByParty: TSQLPartyID;
      fComments: RawUTF8;
    published
      property Content: TSQLContentID read fContent write fContent;
      property ContentRevisionSeq: Integer read fContentRevisionSeq write fContentRevisionSeq;
      property CommittedByParty: TSQLPartyID read fCommittedByParty write fCommittedByParty;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 13
  TSQLContentRevisionItem = class(TSQLRecord)
    private
      fContentRevision: TSQLContentRevisionID;    //contentId, contentRevisionSeqId
      fItemContent: Integer;
      fOldDataResource: TSQLDataResourceID;
      fNewDataResource: TSQLDataResourceID;
    published
      property ContentRevision: TSQLContentRevisionID read fContentRevision write fContentRevision;
      property ItemContent: Integer read fItemContent write fItemContent;
      property OldDataResource: TSQLDataResourceID read fOldDataResource write fOldDataResource;
      property NewDataResource: TSQLDataResourceID read fNewDataResource write fNewDataResource;
  end;

  // 14
  TSQLContentRole = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fParty: TSQLPartyRoleID;         //partyId, roleTypeId
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Content: TSQLContentID read fContent write fContent;
      property Party: TSQLPartyRoleID read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 15
  TSQLContentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 16
  TSQLContentTypeAttr = class(TSQLRecord)
    private
      fContentType: TSQLContentTypeID;
      fAttrName: TSQLContentAttributeID;
      fDescription: RawUTF8;
    published
      property ContentType: TSQLContentTypeID read fContentType write fContentType;
      property AttrName: TSQLContentAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 17
  TSQLAudioDataResource = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fAudioData: TSQLRawBlob;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property AudioData: TSQLRawBlob read fAudioData write fAudioData;
  end;

  // 18
  TSQLCharacterSet = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 19
  TSQLDataCategory = class(TSQLRecord)
    private
      fParentCategory: TSQLDataCategoryID;
      fCategoryName: RawUTF8;
    published
      property ParentCategory: TSQLDataCategoryID read fParentCategory write fParentCategory;
      property CategoryName: RawUTF8 read fCategoryName write fCategoryName;
  end;

  // 20
  TSQLDataResource = class(TSQLRecord)
    private
      fDataResourceType: TSQLDataResourceTypeID;
      fDataTemplateType: TSQLDataTemplateTypeID;
      fDataCategory: TSQLDataCategoryID;
      fDataSource: TSQLDataSourceID;
      fStatus: TSQLStatusItemID;
      fDataResourceName: RawUTF8;
      fLocaleString: RawUTF8;
      fMimeType: TSQLMimeTypeID;
      fCharacterSet: TSQLCharacterSetID;
      fObjectInfo: RawUTF8;
      fSurvey: TSQLSurveyID;
      fSurveyResponse: TSQLSurveyResponseID;
      fRelatedDetailId: TRecordReference;     //根据dataResourceType，关联Survey, SurveyResponse等
      fIsPublic: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property DataResourceType: TSQLDataResourceTypeID read fDataResourceType write fDataResourceType;
      property DataTemplateType: TSQLDataTemplateTypeID read fDataTemplateType write fDataTemplateType;
      property DataCategory: TSQLDataCategoryID read fDataCategory write fDataCategory;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property DataResourceName: RawUTF8 read fDataResourceName write fDataResourceName;
      property LocaleString: RawUTF8 read fLocaleString write fLocaleString;
      property MimeType: TSQLMimeTypeID read fMimeType write fMimeType;
      property CharacterSet: TSQLCharacterSetID read fCharacterSet write fCharacterSet;
      property ObjectInfo: RawUTF8 read fObjectInfo write fObjectInfo;
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property SurveyResponse: TSQLSurveyResponseID read fSurveyResponse write fSurveyResponse;
      property RelatedDetailId: TRecordReference read fRelatedDetailId write fRelatedDetailId;
      property IsPublic: Boolean read fIsPublic write fIsPublic;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 21
  TSQLDataResourceAttribute = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fAttrName: TRecordReference;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property AttrName: TRecordReference read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 22
  TSQLDataResourceMetaData = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fMetaDataPredicate: TSQLMetaDataPredicateID;
      fMetaDataValue: RawUTF8;
      fDataSource: TSQLDataSourceID;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property MetaDataPredicate: TSQLMetaDataPredicateID read fMetaDataPredicate write fMetaDataPredicate;
      property MetaDataValue: RawUTF8 read fMetaDataValue write fMetaDataValue;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
  end;

  // 23
  TSQLDataResourcePurpose = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fContentPurposeType: TSQLContentPurposeTypeID;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property ContentPurposeType: TSQLContentPurposeTypeID read fContentPurposeType write fContentPurposeType;
  end;

  // 24
  TSQLDataResourceRole = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fPartyRole: TSQLPartyRoleID;          //partyId, roleTypeId
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property PartyRole: TSQLPartyRoleID read fPartyRole write fPartyRole;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 25
  TSQLDataResourceType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLDataResourceTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLDataResourceTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 26
  TSQLDataResourceTypeAttr = class(TSQLRecord)
    private
      fDataResourceType: TSQLDataResourceTypeID;
      fAttrName: TSQLDataResourceAttributeID;
      fDescription: RawUTF8;
    published
      property DataResourceType: TSQLDataResourceTypeID read fDataResourceType write fDataResourceType;
      property AttrName: TSQLDataResourceAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 27
  TSQLDataTemplateType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
      fExtension: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Extension: RawUTF8 read fExtension write fExtension;
  end;

  // 28
  TSQLElectronicText = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fTextData: RawUTF8;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property TextData: RawUTF8 read fTextData write fTextData;
  end;

  // 29
  TSQLFileExtension = class(TSQLRecord)
    private
      fFileExtensionName: RawUTF8;
      fMimeType: TSQLMimeTypeID;
    published
      property FileExtensionName: RawUTF8 read fFileExtensionName write fFileExtensionName;
      property MimeType: TSQLMimeTypeID read fMimeType write fMimeType;
  end;

  // 30
  TSQLImageDataResource = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fImageData: TSQLRawBlob;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property ImageData: TSQLRawBlob read fImageData write fImageData;
  end;

  // 31
  TSQLMetaDataPredicate = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 32
  TSQLMimeType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 33
  TSQLMimeTypeHtmlTemplate = class(TSQLRecord)
    private
      fMimeType: TSQLMimeTypeID;
      fTemplateLocation: RawUTF8;
    published
      property MimeType: TSQLMimeTypeID read fMimeType write fMimeType;
      property TemplateLocation: RawUTF8 read fTemplateLocation write fTemplateLocation;
  end;

  // 34
  TSQLOtherDataResource = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fDataResourceContent: TSQLRawBlob;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property DataResourceContent: TSQLRawBlob read fDataResourceContent write fDataResourceContent;
  end;

  // 35
  TSQLVideoDataResource = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fVideoData: TSQLRawBlob;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property VideoData: TSQLRawBlob read fVideoData write fVideoData;
  end;

  // 36
  TSQLDocument = class(TSQLRecord)
    private
      fDocumentType: TSQLDocumentTypeID;
      fDateCreated: TDateTime;
      fComments: RawUTF8;
      fDocumentLocation: RawUTF8;
      fDocumentText: RawUTF8;
      fImageData: TSQLRawBlob;
    published
      property DocumentType: TSQLDocumentTypeID read fDocumentType write fDocumentType;
      property DateCreated: TDateTime read fDateCreated write fDateCreated;
      property Comments: RawUTF8 read fComments write fComments;
      property DocumentLocation: RawUTF8 read fDocumentLocation write fDocumentLocation;
      property DocumentText: RawUTF8 read fDocumentText write fDocumentText;
      property ImageData: TSQLRawBlob read fImageData write fImageData;
  end;

  // 37
  TSQLDocumentAttribute = class(TSQLRecord)
    private
      fDocument: TSQLDocumentID;
      fAttrName: TSQLDocumentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Document: TSQLDocumentID read fDocument write fDocument;
      property AttrName: TSQLDocumentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 38
  TSQLDocumentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLDocumentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLDocumentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 39
  TSQLDocumentTypeAttr = class(TSQLRecord)
    private
      fDocumentType: TSQLDocumentTypeID;
      fAttrName: TSQLDocumentAttributeID;
      fDescription: RawUTF8;
    published
      property DocumentType: TSQLDocumentTypeID read fDocumentType write fDocumentType;
      property AttrName: TSQLDocumentAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 40
  TSQLWebPreferenceType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 41
  TSQLWebUserPreference = class(TSQLRecord)
    private
      fUserLogin: TSQLUserLoginID;
      fParty: TSQLPartyID;
      fVisitId: Integer;                   //session
      fWebPreferenceType: TSQLWebPreferenceTypeID;
      fWebPreferenceValue: RawUTF8;
    published
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property Party: TSQLPartyID read fParty write fParty;
      property VisitId: Integer read fVisitId write fVisitId;
      property WebPreferenceType: TSQLWebPreferenceTypeID read fWebPreferenceType write fWebPreferenceType;
      property WebPreferenceValue: RawUTF8 read fWebPreferenceValue write fWebPreferenceValue;
  end;

  // 42
  TSQLSurvey = class(TSQLRecord)
    private
      fSurveyName: RawUTF8;
      fDescription: RawUTF8;
      fComments: RawUTF8;
      fSubmitCaption: RawUTF8;
      fResponseService: RawUTF8;
      fIsAnonymous: Boolean;
      fAllowMultiple: Boolean;
      fAllowUpdate: Boolean;
      fAcroFormContentId: Integer;         //PDF with AcroForm
    published
      property SurveyName: RawUTF8 read fSurveyName write fSurveyName;
      property Description: RawUTF8 read fDescription write fDescription;
      property Comments: RawUTF8 read fComments write fComments;
      property SubmitCaption: RawUTF8 read fSubmitCaption write fSubmitCaption;
      property ResponseService: RawUTF8 read fResponseService write fResponseService;
      property IsAnonymous: Boolean read fIsAnonymous write fIsAnonymous;
      property AllowMultiple: Boolean read fAllowMultiple write fAllowMultiple;
      property AllowUpdate: Boolean read fAllowUpdate write fAllowUpdate;
      property AcroFormContentId: Integer read fAcroFormContentId write fAcroFormContentId;
  end;

  // 43
  TSQLSurveyApplType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 44
  TSQLSurveyMultiResp = class(TSQLRecord)
    private
      fSurvey: TSQLSurveyID;
      fMultiRespTitle: RawUTF8;
    published
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property MultiRespTitle: RawUTF8 read fMultiRespTitle write fMultiRespTitle;
  end;

  // 45
  TSQLSurveyMultiRespColumn = class(TSQLRecord)
    private
      fSurvey: TSQLSurveyID;
      fSurveyMultiResp: TSQLSurveyMultiRespID;
      fSurveyMultiRespColId: Integer;
      fColumnTitle: RawUTF8;
      fSequenceNum: Integer;
    published
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property SurveyMultiResp: TSQLSurveyMultiRespID read fSurveyMultiResp write fSurveyMultiResp;
      property SurveyMultiRespColId: Integer read fSurveyMultiRespColId write fSurveyMultiRespColId;
      property ColumnTitle: RawUTF8 read fColumnTitle write fColumnTitle;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 46
  TSQLSurveyPage = class(TSQLRecord)
    private
      fSurvey: TSQLSurveyID;
      fSurveyPageSeqId: Integer;
      fPageName: RawUTF8;
      fSequenceNum: Integer;
    published
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property SurveyPageSeqId: Integer read fSurveyPageSeqId write fSurveyPageSeqId;
      property PageName: RawUTF8 read fPageName write fPageName;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 47
  TSQLSurveyQuestion = class(TSQLRecord)
    private
      fSurveyQuestionCategory: TSQLSurveyQuestionCategoryID;
      fSurveyQuestionType: TSQLSurveyQuestionTypeID;
      fDescription: RawUTF8;
      fQuestion: RawUTF8;
      fHint: RawUTF8;
      fEnumType: TSQLEnumerationID;
      fGeo: TSQLGeoID;
      fFormatString: RawUTF8;
    published
      property SurveyQuestionCategory: TSQLSurveyQuestionCategoryID read fSurveyQuestionCategory write fSurveyQuestionCategory;
      property SurveyQuestionType: TSQLSurveyQuestionTypeID read fSurveyQuestionType write fSurveyQuestionType;
      property Description: RawUTF8 read fDescription write fDescription;
      property Question: RawUTF8 read fQuestion write fQuestion;
      property Hint: RawUTF8 read fHint write fHint;
      property EnumType: TSQLEnumerationID read fEnumType write fEnumType;
      property Geo: TSQLGeoID read fGeo write fGeo;
      property FormatString: RawUTF8 read fFormatString write fFormatString;
  end;

  // 48
  TSQLSurveyQuestionAppl = class(TSQLRecord)
    private
      fSurvey: TSQLSurveyID;
      fSurveyQuestion: TSQLSurveyQuestionID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSurveyPage: TSQLSurveyPageID;          //surveyId, surveyPageSeqId
      fSurveyMultiResp: TSQLSurveyMultiRespID;            //surveyId, surveyMultiRespId
      fSurveyMultiRespColumn: TSQLSurveyMultiRespColumnID;               //surveyId, surveyMultiRespId, surveyMultiRespColId
      fRequiredField: Boolean;
      fSequenceNum: Integer;
      fExternalFieldRef: RawUTF8;
      fSurveyQuestionOption: TSQLSurveyQuestionOptionID;                 //withSurveyQuestionId, withSurveyOptionSeqId
    published
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property SurveyQuestion: TSQLSurveyQuestionID read fSurveyQuestion write fSurveyQuestion;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SurveyPage: TSQLSurveyPageID read fSurveyPage write fSurveyPage;
      property SurveyMultiResp: TSQLSurveyMultiRespID read fSurveyMultiResp write fSurveyMultiResp;
      property SurveyMultiRespColumn: TSQLSurveyMultiRespColumnID read fSurveyMultiRespColumn write fSurveyMultiRespColumn;
      property RequiredField: Boolean read fRequiredField write fRequiredField;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property ExternalFieldRef: RawUTF8 read fExternalFieldRef write fExternalFieldRef;
      property SurveyQuestionOption: TSQLSurveyQuestionOptionID read fSurveyQuestionOption write fSurveyQuestionOption;
  end;

  // 49
  TSQLSurveyQuestionCategory = class(TSQLRecord)
    private
      fParent: TSQLSurveyQuestionCategoryID;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Parent: TSQLSurveyQuestionCategoryID read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 50
  TSQLSurveyQuestionOption = class(TSQLRecord)
    private
      fSurveyQuestion: TSQLSurveyQuestionID;
      fSurveyOptionSeqId: Integer;
      fDescription: RawUTF8;
      fSequenceNum: Integer;
      fAmountBase: Currency;
      fAmountBaseUom: TSQLUomID;
      fWeightFactor: Double;
      fDuration: Integer;
      fDurationUom: TSQLUomID;
    published
      property SurveyQuestion: TSQLSurveyQuestionID read fSurveyQuestion write fSurveyQuestion;
      property SurveyOptionSeqId: Integer read fSurveyOptionSeqId write fSurveyOptionSeqId;
      property Description: RawUTF8 read fDescription write fDescription;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property AmountBase: Currency read fAmountBase write fAmountBase;
      property AmountBaseUom: TSQLUomID read fAmountBaseUom write fAmountBaseUom;
      property WeightFactor: Double read fWeightFactor write fWeightFactor;
      property Duration: Integer read fDuration write fDuration;
      property DurationUom: TSQLUomID read fDurationUom write fDurationUom;
  end;

  // 51
  TSQLSurveyQuestionType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 52
  TSQLSurveyResponse = class(TSQLRecord)
    private
      fSurvey: TSQLSurveyID;
      fParty: TSQLPartyID;
      fResponseDate: TDateTime;
      fLastModifiedDate: TDateTime;
      fReference: TRecordReference;
      fGeneralFeedback: RawUTF8;
      fOrderId: TSQLOrderItemID;          //orderId, orderItemSeqId
      fStatus: TSQLStatusItemID;
    published
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property Party: TSQLPartyID read fParty write fParty;
      property ResponseDate: TDateTime read fResponseDate write fResponseDate;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property Reference: TRecordReference read fReference write fReference;
      property GeneralFeedback: RawUTF8 read fGeneralFeedback write fGeneralFeedback;
      property OrderId: TSQLOrderItemID read fOrderId write fOrderId;
      property Status: TSQLStatusItemID read fStatus write fStatus;
  end;

  // 53
  TSQLSurveyResponseAnswer = class(TSQLRecord)
    private
      fSurveyResponse: TSQLSurveyResponseID;
      fSurveyQuestion: TSQLSurveyQuestionID;
      fSurveyMultiRespCol: TRecordReference;
      fSurveyMultiResp: TRecordReference;
      fBooleanResponse: Boolean;
      fCurrencyResponse: Currency;
      fFloatResponse: Double;
      fNumericResponse: Integer;
      fTextResponse: RawUTF8;
      fSurveyOptionSeq: TSQLSurveyQuestionOptionID;
      fContent: TSQLContentID;
      fAnsweredDate: TDateTime;
      fAmountBase: Currency;
      fAmountBaseUom: TSQLUomID;
      fWeightFactor: Double;
      fDuration: Integer;
      fDurationUom: TSQLUomID;
      fSequenceNum: Integer;
    published
      property SurveyResponse: TSQLSurveyResponseID read fSurveyResponse write fSurveyResponse;
      property SurveyQuestion: TSQLSurveyQuestionID read fSurveyQuestion write fSurveyQuestion;
      property SurveyMultiRespCol: TRecordReference read fSurveyMultiRespCol write fSurveyMultiRespCol;
      property SurveyMultiResp: TRecordReference read fSurveyMultiResp write fSurveyMultiResp;
      property BooleanResponse: Boolean read fBooleanResponse write fBooleanResponse;
      property CurrencyResponse: Currency read fCurrencyResponse write fCurrencyResponse;
      property FloatResponse: Double read fFloatResponse write fFloatResponse;
      property NumericResponse: Integer read fNumericResponse write fNumericResponse;
      property TextResponse: RawUTF8 read fTextResponse write fTextResponse;
      property SurveyOptionSeq: TSQLSurveyQuestionOptionID read fSurveyOptionSeq write fSurveyOptionSeq;
      property Content: TSQLContentID read fContent write fContent;
      property AnsweredDate: TDateTime read fAnsweredDate write fAnsweredDate;
      property AmountBase: Currency read fAmountBase write fAmountBase;
      property AmountBaseUom: TSQLUomID read fAmountBaseUom write fAmountBaseUom;
      property WeightFactor: Double read fWeightFactor write fWeightFactor;
      property Duration: Integer read fDuration write fDuration;
      property DurationUom: TSQLUomID read fDurationUom write fDurationUom;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 54
  TSQLSurveyTrigger = class(TSQLRecord)
    private
      fSurvey: TSQLSurveyID;
      fSurveyApplType: TSQLSurveyApplTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property SurveyApplType: TSQLSurveyApplTypeID read fSurveyApplType write fSurveyApplType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 55
  TSQLWebSiteContent = class(TSQLRecord)
    private
      fWebSite: TSQLWebSiteID;
      fContent: TSQLContentID;
      fWebSiteContentType: TSQLWebSiteContentTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property WebSite: TSQLWebSiteID read fWebSite write fWebSite;
      property Content: TSQLContentID read fContent write fContent;
      property WebSiteContentType: TSQLWebSiteContentTypeID read fWebSiteContentType write fWebSiteContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 56
  TSQLWebSiteContentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLWebSiteContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLWebSiteContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 57
  TSQLWebSitePathAlias = class(TSQLRecord)
    private
      fWebSite: TSQLWebSiteID;
      fPathAlias: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fAliasTo: RawUTF8;
      fContent: TSQLContentID;
      fMapKey: RawUTF8;
    published
      property WebSite: TSQLWebSiteID read fWebSite write fWebSite;
      property PathAlias: RawUTF8 read fPathAlias write fPathAlias;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AliasTo: RawUTF8 read fAliasTo write fAliasTo;
      property Content: TSQLContentID read fContent write fContent;
      property MapKey: RawUTF8 read fMapKey write fMapKey;
  end;

  // 58
  TSQLWebSitePublishPoint = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fTemplateTitle: RawUTF8;
      fStyleSheetFile: RawUTF8;
      fLogo: RawUTF8;
      fMedallionLogo: RawUTF8;
      fLineLogo: RawUTF8;
      fLeftBarId: TRecordReference;
      fRightBarId: TRecordReference;
      fContentDept: TRecordReference;
      fAboutContentId: TRecordReference;
    published
      property Content: TSQLContentID read fContent write fContent;
      property TemplateTitle: RawUTF8 read fTemplateTitle write fTemplateTitle;
      property StyleSheetFile: RawUTF8 read fStyleSheetFile write fStyleSheetFile;
      property Logo: RawUTF8 read fLogo write fLogo;
      property MedallionLogo: RawUTF8 read fMedallionLogo write fMedallionLogo;
      property LineLogo: RawUTF8 read fLineLogo write fLineLogo;
      property LeftBarId: TRecordReference read fLeftBarId write fLeftBarId;
      property RightBarId: TRecordReference read fRightBarId write fRightBarId;
      property ContentDept: TRecordReference read fContentDept write fContentDept;
      property AboutContentId: TRecordReference read fAboutContentId write fAboutContentId;
  end;

  // 59
  TSQLWebSiteRole = class(TSQLRecord)
    private
      fParty: TSQLPartyRoleID;         //partyId, roleTypeId
      fWebSite: TSQLWebSiteID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Party: TSQLPartyRoleID read fParty write fParty;
      property WebSite: TSQLWebSiteID read fWebSite write fWebSite;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 60
  TSQLContentKeyword = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fKeyword: RawUTF8;
      fRelevancyWeight: Integer;
    published
      property Content: TSQLContentID read fContent write fContent;
      property Keyword: RawUTF8 read fKeyword write fKeyword;
      property RelevancyWeight: Integer read fRelevancyWeight write fRelevancyWeight;
  end;

  // 61
  TSQLContentSearchConstraint = class(TSQLRecord)
    private
      fContentSearchResult: TSQLContentSearchResultID;
      fConstraintSeq: Integer;
      fConstraintName: RawUTF8;
      fInfoString: RawUTF8;
      fIncludeSubCategories: Boolean;
      fIsAnd: Boolean;
      fAnyPrefix: Boolean;
      fAnySuffix: Boolean;
      fRemoveStems: Boolean;
      fLowValue: RawUTF8;
      fHighValue: RawUTF8;
    published
      property ContentSearchResult: TSQLContentSearchResultID read fContentSearchResult write fContentSearchResult;
      property ConstraintSeq: Integer read fConstraintSeq write fConstraintSeq;
      property ConstraintName: RawUTF8 read fConstraintName write fConstraintName;
      property InfoString: RawUTF8 read fInfoString write fInfoString;
      property IncludeSubCategories: Boolean read fIncludeSubCategories write fIncludeSubCategories;
      property IsAnd: Boolean read fIsAnd write fIsAnd;
      property AnyPrefix: Boolean read fAnyPrefix write fAnyPrefix;
      property AnySuffix: Boolean read fAnySuffix write fAnySuffix;
      property RemoveStems: Boolean read fRemoveStems write fRemoveStems;
      property LowValue: RawUTF8 read fLowValue write fLowValue;
      property HighValue: RawUTF8 read fHighValue write fHighValue;
  end;

  // 62
  TSQLContentSearchResult = class(TSQLRecord)
    private
      fVisitId: Integer;
      fOrderByName: RawUTF8;
      fIsAscending: Boolean;
      fNumResults: Integer;
      fSecondsTotal: Double;
      fSearchDate: TDateTime;
    published
      property VisitId: Integer read fVisitId write fVisitId;
      property OrderByName: RawUTF8 read fOrderByName write fOrderByName;
      property IsAscending: Boolean read fIsAscending write fIsAscending;
      property NumResults: Integer read fNumResults write fNumResults;
      property SecondsTotal: Double read fSecondsTotal write fSecondsTotal;
      property SearchDate: TDateTime read fSearchDate write fSearchDate;
  end;

  // 63
  TSQLWebAnalyticsConfig = class(TSQLRecord)
    private
      fWebSite: TSQLWebSiteID;
      fWebAnalyticsType: TSQLWebAnalyticsTypeID;
      fWebAnalyticsCode: RawUTF8;
    published
      property WebSite: TSQLWebSiteID read fWebSite write fWebSite;
      property WebAnalyticsType: TSQLWebAnalyticsTypeID read fWebAnalyticsType write fWebAnalyticsType;
      property WebAnalyticsCode: RawUTF8 read fWebAnalyticsCode write fWebAnalyticsCode;
  end;

  // 64
  TSQLWebAnalyticsType = class(TSQLRecord)
    private
      fParent: TSQLWebAnalyticsTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLWebAnalyticsTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

implementation

uses
  Classes, SysUtils;

// 1
class procedure TSQLContentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLContentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLContentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ContentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ContentType set parent=(select c.id from ContentType c where c.Encode=ContentType.ParentEncode);');
    Server.Execute('update Content set ContentType=(select c.id from ContentType c where c.Encode=Content.ContentTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 2
class procedure TSQLContentAssocType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLContentAssocType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLContentAssocType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ContentAssocType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 3
class procedure TSQLContentAssocPredicate.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLContentAssocPredicate;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLContentAssocPredicate.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ContentAssocPredicate.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 4
class procedure TSQLMetaDataPredicate.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLMetaDataPredicate;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLMetaDataPredicate.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','MetaDataPredicate.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 5
class procedure TSQLDataResourceType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLDataResourceType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLDataResourceType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','DataResourceType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update DataResourceType set parent=(select c.id from DataResourceType c where c.Encode=DataResourceType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 6
class procedure TSQLDataTemplateType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLDataTemplateType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLDataTemplateType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','DataTemplateType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 7
class procedure TSQLDocumentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLDocumentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLDocumentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','DocumentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update DocumentType set parent=(select c.id from DocumentType c where c.Encode=DocumentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 8
class procedure TSQLWebSiteContentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLWebSiteContentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLWebSiteContentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','WebSiteContentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update WebSiteContentType set parent=(select c.id from WebSiteContentType c where c.Encode=WebSiteContentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 9
class procedure TSQLContent.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLContent;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLContent.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','Content.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update Content set ContentType=(select c.id from ContentType c where c.Encode=Content.ContentTypeEncode);');
  finally
    Rec.Free;
  end;
end;

end.

