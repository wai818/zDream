unit uCommon;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;

type
  // 1
  TSQLDataSource = class(TSQLRecord)
    private
      fDataSourceType: TSQLDataSourceTypeID;
      fDescription: RawUTF8;
    published
      property DataSourceType: TSQLDataSourceTypeID read fDataSourceType write fDataSourceType;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 2
  TSQLDataSourceType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 3
  TSQLEmailTemplateSetting = class(TSQLRecord)
    private
      fEmailType: TSQLEnumerationID;
      fDescription: RawUTF8;
      fBodyScreenLocation: RawUTF8;
      fXslfoAttachScreenLocation: RawUTF8;
      fFromAddress: RawUTF8;
      fCcAddress: RawUTF8;
      fBccAddress: RawUTF8;
      fSubject: RawUTF8;
      fContentType: RawUTF8;
    published
      property EmailType: TSQLEnumerationID read fEmailType write fEmailType;
      property Description: RawUTF8 read FDescription write FDescription;
      property BodyScreenLocation: RawUTF8 read fBodyScreenLocation write fBodyScreenLocation;
      property XslfoAttachScreenLocation: RawUTF8 read fXslfoAttachScreenLocation write fXslfoAttachScreenLocation;
      property FromAddress: RawUTF8 read fFromAddress write fFromAddress;
      property CcAddress: RawUTF8 read fCcAddress write fCcAddress;
      property BccAddress: RawUTF8 read fBccAddress write fBccAddress;
      property Subject: RawUTF8 read fSubject write fSubject;
      property ContentType: RawUTF8 read fContentType write fContentType;
  end;

  // 4
  TSQLEnumeration = class(TSQLRecord)
    private
      fName: RawUTF8;
      fEncode: RawUTF8;
      fEnumType: TSQLEnumerationTypeID;
      fEnumTypeEncode: RawUTF8;
      fEnumCode: RawUTF8;
      fSequence: Integer;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Name: RawUTF8 read fName write fName;
      property Encode: RawUTF8 read fEncode write fEncode;
      property EnumType: TSQLEnumerationTypeID read fEnumType write fEnumType;
      property EnumTypeEncode: RawUTF8 read fEnumTypeEncode write fEnumTypeEncode;
      property EnumCode: RawUTF8 read fEnumCode write fEnumCode;
      property Sequence: Integer read fSequence write fSequence;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 5
  TSQLEnumerationType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParent: TSQLEnumerationTypeID;
      fParentEncode: RawUTF8;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Parent: TSQLEnumerationTypeID read fParent write fParent;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 6
  TSQLCountryCapital = class(TSQLRecord)
    private
      fCountryCode: RawUTF8;
      fCountryCapital: RawUTF8;
    published
      property CountryCode: RawUTF8 read fCountryCode write fCountryCode;
      property CountryCapital: RawUTF8 read fCountryCapital write fCountryCapital;
  end;

  // 7
  TSQLCountryCode = class(TSQLRecord)
    private
      fCountryCode: RawUTF8;
      fCountryAbbr: RawUTF8;
      fCountryNumber: RawUTF8;
      fCountryName: RawUTF8;
    published
      property CountryCode: RawUTF8 read fCountryCode write fCountryCode;
      property CountryAbbr: RawUTF8 read fCountryAbbr write fCountryAbbr;
      property CountryNumber: RawUTF8 read fCountryNumber write fCountryNumber;
      property CountryName: RawUTF8 read fCountryName write fCountryName;
  end;

  // 8
  TSQLCountryTeleCode = class(TSQLRecord)
    private
      fCountryCode: TSQLCountryCodeID;
      fTeleCode: RawUTF8;
    published
      property CountryCode: TSQLCountryCodeID read fCountryCode write fCountryCode;
      property TeleCode: RawUTF8 read fTeleCode write fTeleCode;
  end;

  // 9
  TSQLCountryAddressFormat = class(TSQLRecord)
    private
      fGeo: TSQLGeoID;
      fGeoAssocType: TSQLGeoAssocTypeID;
      fRequireStateProvince: Integer;
      fRequirePostalCode: Boolean;
      fPostalCodeRegex: RawUTF8;
      fHasPostalCodeExt: Boolean;
      fRequirePostalCodeExt: Boolean;
      fAddressFormat: RawUTF8;
    published
      property Geo: TSQLGeoID read fGeo write fGeo;
      property GeoAssocType: TSQLGeoAssocTypeID read fGeoAssocType write fGeoAssocType;
      property RequireStateProvince: Integer read fRequireStateProvince write fRequireStateProvince;
      property RequirePostalCode: Boolean read fRequirePostalCode write fRequirePostalCode;
      property PostalCodeRegex: RawUTF8 read fPostalCodeRegex write fPostalCodeRegex;
      property HasPostalCodeExt: Boolean read fHasPostalCodeExt write fHasPostalCodeExt;
      property RequirePostalCodeExt: Boolean read fRequirePostalCodeExt write fRequirePostalCodeExt;
      property AddressFormat: RawUTF8 read fAddressFormat write fAddressFormat;
  end;

  // 10
  TSQLGeo = class(TSQLRecord)
    private
      fGeoType: TSQLGeoTypeID;
      fGeoName: RawUTF8;
      fGeoCode: RawUTF8;
      fGeoSecCode: RawUTF8;
      fAbbreviation: RawUTF8;
      fWellKnownText: RawUTF8;
    published
      property GeoType: TSQLGeoTypeID read fGeoType write fGeoType;
      property GeoName: RawUTF8 read fGeoName write fGeoName;
      property GeoCode: RawUTF8 read fGeoCode write fGeoCode;
      property GeoSecCode: RawUTF8 read fGeoSecCode write fGeoSecCode;
      property Abbreviation: RawUTF8 read fAbbreviation write fAbbreviation;
      property WellKnownText: RawUTF8 read fWellKnownText write fWellKnownText;
  end;

  // 11
  TSQLGeoAssoc = class(TSQLRecord)
    private
      fGeo: TSQLGeoID;
      fGeoTo: TSQLGeoID;
      fGeoAssocType: TSQLGeoAssocTypeID;
    published
      property Geo: TSQLGeoID read fGeo write fGeo;
      property GeoTo: TSQLGeoID read fGeoTo write fGeoTo;
      property GeoAssocType: TSQLGeoAssocTypeID read fGeoAssocType write fGeoAssocType;
  end;

  // 12
  TSQLGeoAssocType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 13
  TSQLGeoPoint = class(TSQLRecord)
    private
      fGeoPointTypeEnum: TSQLEnumerationID;
      fDescription: RawUTF8;
      fDataSource: TSQLDataSourceID;
      fLatitude: RawUTF8;
      fLongitude: RawUTF8;
      fElevation: Double;
      fElevationUom: TSQLUomID;
      fInformation: RawUTF8;
    published
      property GeoPointTypeEnum: TSQLEnumerationID read fGeoPointTypeEnum write fGeoPointTypeEnum;
      property Description: RawUTF8 read fDescription write fDescription;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
      property Latitude: RawUTF8 read fLatitude write fLatitude;
      property Longitude: RawUTF8 read fLongitude write fLongitude;
      property Elevation: Double read fElevation write fElevation;
      property ElevationUom: TSQLUomID read fElevationUom write fElevationUom;
      property Information: RawUTF8 read fInformation write fInformation;
  end;

  // 14
  TSQLGeoType = class(TSQLRecord)
    private
      fParent: TSQLGeoTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLGeoTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 15
  TSQLKeywordThesaurus = class(TSQLRecord)
    private
      fEnteredKeyword: RawUTF8;
      fAlternateKeyword: RawUTF8;
      fRelationshipEnum: TSQLEnumerationID;
    published
      property EnteredKeyword: RawUTF8 read fEnteredKeyword write fEnteredKeyword;
      property AlternateKeyword: RawUTF8 read fAlternateKeyword write fAlternateKeyword;
      property RelationshipEnum: TSQLEnumerationID read fRelationshipEnum write fRelationshipEnum;
  end;

  // 16
  TSQLStandardLanguage = class(TSQLRecord)
    private
      fLangCode3t: RawUTF8;
      fLangCode3b: RawUTF8;
      fLangCode2: RawUTF8;
      fLangName: RawUTF8;
      fLangFamily: RawUTF8;
      fLangCharset: RawUTF8;
    published
      property LangCode3t: RawUTF8 read fLangCode3t write fLangCode3t;
      property LangCode3b: RawUTF8 read fLangCode3b write fLangCode3b;
      property LangCode2: RawUTF8 read fLangCode2 write fLangCode2;
      property LangName: RawUTF8 read fLangName write fLangName;
      property LangFamily: RawUTF8 read fLangFamily write fLangFamily;
      property LangCharset: RawUTF8 read fLangCharset write fLangCharset;
  end;

  // 17
  TSQLCustomMethod = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fCustomMethodTypeEncode: RawUTF8;
      fCustomMethodType: TSQLCustomMethodTypeID;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property CustomMethodTypeEncode: RawUTF8 read fCustomMethodTypeEncode write fCustomMethodTypeEncode;
      property CustomMethodType: TSQLCustomMethodTypeID read fCustomMethodType write fCustomMethodType;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 18
  TSQLCustomMethodType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLCustomMethodTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLCustomMethodTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 19
  TSQLNoteData = class(TSQLRecord)
    private
      fNoteName: RawUTF8;
      fNoteInfo: RawUTF8;
      fNoteDateTime: TDateTime;
    published
      property NoteName: RawUTF8 read fNoteName write fNoteName;
      property NoteInfo: RawUTF8 read fNoteInfo write fNoteInfo;
      property NoteDateTime: TDateTime read fNoteDateTime write fNoteDateTime;
  end;

  // 20
  TSQLCustomTimePeriod = class(TSQLRecord)
    private
      fParentPeriod: TSQLCustomTimePeriodID;
      fPeriodType: TSQLPeriodTypeID;
      fPeriodNum: Integer;
      fPeriodName: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fIsClosed: Boolean;
    published
      property ParentPeriod: TSQLCustomTimePeriodID read fParentPeriod write fParentPeriod;
      property PeriodType: TSQLPeriodTypeID read fPeriodType write fPeriodType;
      property PeriodNum: Integer read fPeriodNum write fPeriodNum;
      property PeriodName: RawUTF8 read fPeriodName write fPeriodName;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property IsClosed: Boolean read fIsClosed write fIsClosed;
  end;

  // 21
  TSQLPeriodType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
      fPeriodLength: Integer;
      fUom: TSQLUomID;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property PeriodLength: Integer read fPeriodLength write fPeriodLength;
      property Uom: TSQLUomID read fUom write fUom;
  end;

  // 22
  TSQLStatusItem = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fStatusTypeEncode: RawUTF8;
      fStatusType: TSQLStatusTypeID;
      fStatusCode: RawUTF8;
      fSequence: Integer;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property StatusTypeEncode: RawUTF8 read fStatusTypeEncode write fStatusTypeEncode;
      property StatusType: TSQLStatusTypeID read fStatusType write fStatusType;
      property StatusCode: RawUTF8 read fStatusCode write fStatusCode;
      property Sequence: Integer read fSequence write fSequence;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 23
  TSQLStatusType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLStatusTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLStatusTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 24
  TSQLStatusValidChange = class(TSQLRecord)
    private
      fStatusEncode: RawUTF8;
      fStatusToEncode: RawUTF8;
      fStatus: TSQLStatusItemID;
      fStatusTo: TSQLStatusItemID;
      fConditionExpression: RawUTF8;
      fTransitionName: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property StatusEncode: RawUTF8 read fStatusEncode write fStatusEncode;
      property StatusToEncode: RawUTF8 read fStatusToEncode write fStatusToEncode;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property StatusTo: TSQLStatusItemID read fStatusTo write fStatusTo;
      property ConditionExpression: RawUTF8 read fConditionExpression write fConditionExpression;
      property TransitionName: RawUTF8 read fTransitionName write fTransitionName;
  end;

  // 25
  TSQLUom = class(TSQLRecord)
    private
      fUomType: TSQLUomTypeID;
      fAbbreviation: RawUTF8;
      fNumericCode: Integer;
      fDescription: RawUTF8;
    published
      property UomType: TSQLUomTypeID read fUomType write fUomType;
      property Abbreviation: RawUTF8 read fAbbreviation write fAbbreviation;
      property NumericCode: Integer read fNumericCode write fNumericCode;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 26
  TSQLUomConversion = class(TSQLRecord)
    private
      fUom: TSQLUomID;
      fUomTo: TSQLUomID;
      fConversionFactor: Double;
      fCustomMethod: TSQLCustomMethodID;
      fDecimalScale: Integer;
      fRoundingMode: Integer;
    published
      property Uom: TSQLUomID read fUom write fUom;
      property UomTo: TSQLUomID read fUomTo write fUomTo;
      property ConversionFactor: Double read fConversionFactor write fConversionFactor;
      property CustomMethod: TSQLCustomMethodID read fCustomMethod write fCustomMethod;
      property DecimalScale: Integer read fDecimalScale write fDecimalScale;
      property RoundingMode: Integer read fRoundingMode write fRoundingMode;
  end;

  // 27
  TSQLUomConversionDated = class(TSQLRecord)
    private
      fUom: TSQLUomID;
      fUomTo: TSQLUomID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fConversionFactor: Double;
      fCustomMethod: TSQLCustomMethodID;
      fDecimalScale: Integer;
      fRoundingMode: Integer;
      fPurposeEnum: TSQLEnumerationID;
    published
      property Uom: TSQLUomID read fUom write fUom;
      property UomTo: TSQLUomID read fUomTo write fUomTo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ConversionFactor: Double read fConversionFactor write fConversionFactor;
      property CustomMethod: TSQLCustomMethodID read fCustomMethod write fCustomMethod;
      property DecimalScale: Integer read fDecimalScale write fDecimalScale;
      property RoundingMode: Integer read fRoundingMode write fRoundingMode;
      property PurposeEnum: TSQLEnumerationID read fPurposeEnum write fPurposeEnum;
  end;

  // 28
  TSQLUomGroup = class(TSQLRecord)
    private
      fUom: TSQLUomID;
    published
      property Uom: TSQLUomID read fUom write fUom;
  end;

  // 29
  TSQLUomType = class(TSQLRecord)
    private
      fParent: TSQLUomTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLUomTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 30
  TSQLUserPreference = class(TSQLRecord)
    private
      fUserLogin: TSQLUserLoginID;
      fUserPrefTypeId: Integer;
      fUserPrefGroupType: TSQLUserPrefGroupTypeID;
      fUserPrefValue: RawUTF8;
      fUserPrefDataType: Integer;
    published
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property UserPrefTypeId: Integer read fUserPrefTypeId write fUserPrefTypeId;
      property UserPrefGroupType: TSQLUserPrefGroupTypeID read fUserPrefGroupType write fUserPrefGroupType;
      property UserPrefValue: RawUTF8 read fUserPrefValue write fUserPrefValue;
      property UserPrefDataType: Integer read fUserPrefDataType write fUserPrefDataType;
  end;

  // 31
  TSQLUserPrefGroupType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 32
  TSQLVisualThemeSet = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 33
  TSQLVisualTheme = class(TSQLRecord)
    private
      fVisualThemeSet: TSQLVisualThemeSetID;
      fDescription: RawUTF8;
    published
      property VisualThemeSet: TSQLVisualThemeSetID read fVisualThemeSet write fVisualThemeSet;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 34
  TSQLVisualThemeResource = class(TSQLRecord)
    private
      fVisualTheme: TSQLVisualThemeID;
      fResourceTypeEnum: TSQLEnumerationID;
      fSequenceId: Integer;
      fResourceValue: RawUTF8;
    published
      property VisualTheme: TSQLVisualThemeID read fVisualTheme write fVisualTheme;
      property ResourceTypeEnum: TSQLEnumerationID read fResourceTypeEnum write fResourceTypeEnum;
      property SequenceId: Integer read fSequenceId write fSequenceId;
      property ResourceValue: RawUTF8 read fResourceValue write fResourceValue;
  end;

  // 35
  TSQLPortalPortlet = class(TSQLRecord)
    private
      fPortletName: RawUTF8;
      fScreenName: RawUTF8;
      fScreenLocation: RawUTF8;
      fEditFormName: RawUTF8;
      fEditFormLocation: RawUTF8;
      fDescription: RawUTF8;
      fScreenshot: RawUTF8;
      fSecurityServiceName: RawUTF8;
      fSecurityMainAction: RawUTF8;
    published
      property PortletName: RawUTF8 read fPortletName write fPortletName;
      property ScreenName: RawUTF8 read fScreenName write fScreenName;
      property ScreenLocation: RawUTF8 read fScreenLocation write fScreenLocation;
      property EditFormName: RawUTF8 read fEditFormName write fEditFormName;
      property EditFormLocation: RawUTF8 read fEditFormLocation write fEditFormLocation;
      property Description: RawUTF8 read fDescription write fDescription;
      property Screenshot: RawUTF8 read fScreenshot write fScreenshot;
      property SecurityServiceName: RawUTF8 read fSecurityServiceName write fSecurityServiceName;
      property SecurityMainAction: RawUTF8 read fSecurityMainAction write fSecurityMainAction;
  end;

  // 36
  TSQLPortletCategory = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 37
  TSQLPortletPortletCategory = class(TSQLRecord)
    private
      fPortalPortlet: TSQLPortalPortletID;
      fPortletCategory: TSQLPortletCategoryID;
    published
      property PortalPortlet: TSQLPortalPortletID read fPortalPortlet write fPortalPortlet;
      property PortletCategory: TSQLPortletCategoryID read fPortletCategory write fPortletCategory;
  end;

  // 38
  TSQLPortalPage = class(TSQLRecord)
    private
      fPortalPageName: RawUTF8;
      fDescription: RawUTF8;
      fOwnerUserLoginId: Integer;
      fOriginalPortalPageId: Integer;
      fParentPortalPage: TSQLPortalPageID;
      fSequenceNum: Integer;
      fSecurityGroup: TSQLSecurityGroupID;
    published
      property PortalPageName: RawUTF8 read fPortalPageName write fPortalPageName;
      property Description: RawUTF8 read fDescription write fDescription;
      property OwnerUserLoginId: Integer read fOwnerUserLoginId write fOwnerUserLoginId;
      property OriginalPortalPageId: Integer read fOriginalPortalPageId write fOriginalPortalPageId;
      property ParentPortalPage: TSQLPortalPageID read fParentPortalPage write fParentPortalPage;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property SecurityGroup: TSQLSecurityGroupID read fSecurityGroup write fSecurityGroup;
  end;

  // 39
  TSQLPortalPageColumn = class(TSQLRecord)
    private
      fPortalPage: TSQLPortalPageID;
      fColumnSeqId: Integer;
      fColumnWidthPixels: Integer;
      fColumnWidthPercentage: Integer;
    published
      property PortalPage: TSQLPortalPageID read fPortalPage write fPortalPage;
      property ColumnSeqId: Integer read fColumnSeqId write fColumnSeqId;
      property ColumnWidthPixels: Integer read fColumnWidthPixels write fColumnWidthPixels;
      property ColumnWidthPercentage: Integer read fColumnWidthPercentage write fColumnWidthPercentage;
  end;

  // 40
  TSQLPortalPagePortlet = class(TSQLRecord)
    private
      fPortalPage: TSQLPortalPageColumnID;      //portalPageId, columnSeqId
      fPortalPortlet: TSQLPortalPortletID;
      fPortletSeqId: Integer;
      fSequenceNum: Integer;
    published
      property PortalPage: TSQLPortalPageColumnID read fPortalPage write fPortalPage;
      property PortalPortlet: TSQLPortalPortletID read fPortalPortlet write fPortalPortlet;
      property PortletSeqId: Integer read fPortletSeqId write fPortletSeqId;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 41
  TSQLPortletAttribute = class(TSQLRecord)
    private
      fPportalPageId: Integer;
      fPortalPortletId: Integer;
      fPortletSeqId: Integer;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
      fAttrType: RawUTF8;
    published
      property PportalPageId: Integer read fPportalPageId write fPportalPageId;
      property PortalPortletId: Integer read fPortalPortletId write fPortalPortletId;
      property PortletSeqId: Integer read fPortletSeqId write fPortletSeqId;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
      property AttrType: RawUTF8 read fAttrType write fAttrType;
  end;

  // 42
  TSQLSystemProperty = class(TSQLRecord)
    private
      fSystemResourceId: Integer;
      fSystemPropertyValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property SystemResourceId: Integer read fSystemResourceId write fSystemResourceId;
      property SystemPropertyValue: RawUTF8 read fSystemPropertyValue write fSystemPropertyValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

implementation

uses
  Classes, SysUtils;

// 1
class procedure TSQLEnumeration.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLEnumeration;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLEnumeration.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','Enumeration.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update Enumeration set EnumType=(select c.id from EnumerationType c where c.Encode=EnumTypeEncode);');
    Server.Execute('update FinAccountType set ReplenishEnum=(select c.id from Enumeration c where c.Encode=FinAccountType.ReplenishEnumEncode);');
  finally
    Rec.Free;
  end;
end;

// 2
class procedure TSQLEnumerationType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLEnumerationType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLEnumerationType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','EnumerationType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update EnumerationType set parent=(select c.id from EnumerationType c where c.Encode=EnumerationType.ParentEncode);');
    Server.Execute('update Enumeration set EnumType=(select c.id from EnumerationType c where c.Encode=EnumTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 3
class procedure TSQLStatusType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLStatusType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLStatusType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','StatusType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update StatusType set Parent=(select c.id from StatusType c where c.Encode=StatusType.ParentEncode);');
    Server.Execute('update StatusItem set StatusType=(select c.id from StatusType c where c.Encode=StatusItem.StatusTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 4
class procedure TSQLStatusItem.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLStatusItem;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLStatusItem.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','StatusItem.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update StatusItem set StatusType=(select c.id from StatusType c where c.Encode=StatusItem.StatusTypeEncode);');
    Server.Execute('update StatusValidChange set Status=(select c.id from StatusItem c where c.Encode=StatusValidChange.StatusEncode);');
    Server.Execute('update StatusValidChange set StatusTo=(select c.id from StatusItem c where c.Encode=StatusValidChange.StatusToEncode);');
  finally
    Rec.Free;
  end;
end;

// 5
class procedure TSQLStatusValidChange.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLStatusValidChange;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLStatusValidChange.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','StatusValidChange.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update StatusValidChange set Status=(select c.id from StatusItem c where c.Encode=StatusValidChange.StatusEncode);');
    Server.Execute('update StatusValidChange set StatusTo=(select c.id from StatusItem c where c.Encode=StatusValidChange.StatusToEncode);');
  finally
    Rec.Free;
  end;
end;

// 6
class procedure TSQLCustomMethodType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLCustomMethodType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLCustomMethodType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','CustomMethodType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update CustomMethodType set Parent=(select c.id from CustomMethodType c where c.Encode=CustomMethodType.ParentEncode);');
    Server.Execute('update CustomMethod set CustomMethodType=(select c.id from CustomMethodType c where c.Encode=CustomMethodTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 7
class procedure TSQLCustomMethod.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLCustomMethod;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLCustomMethod.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','CustomMethod.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update CustomMethod set CustomMethodType=(select c.id from CustomMethodType c where c.Encode=CustomMethodTypeEncode);');
  finally
    Rec.Free;
  end;
end;

end.

