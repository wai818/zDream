unit uCommon;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  TSQLUserLogin = class(TSQLRecord)
    private
    published
  end;
  TSQLContent = class(TSQLRecord)
    private
    published
  end;
  TSQLRecurrenceInfo = class(TSQLRecord)
    private
    published
  end;
  TSQLSurveyResponse = class(TSQLRecord)
    private
    published
  end;
  TSQLDataResource = class(TSQLRecord)
    private
    published
  end;
  TSQLSurvey = class(TSQLRecord)
    private
    published
  end;
  TSQLSurveyApplType = class(TSQLRecord)
    private
    published
  end;
  TSQLJobSandbox = class(TSQLRecord)
    private
    published
  end;
  TSQLPaymentGatewayConfigTyp = class(TSQLRecord)
    private
    published
  end;
  TSQLDocument = class(TSQLRecord)
    private
    published
  end;
 TSQLRuntimeData = class(TSQLRecord)
    private
    published
  end;
  TSQLTemporalExpression = class(TSQLRecord)
    private
    published
  end;
  TSQLSecurityGroup = class(TSQLRecord)
    private
    published
  end;




  // 1
  TSQLDataSource = class(TSQLRecord)
    private
      fDataSourceType: TSQLDataSourceType;
      fDescription: RawUTF8;
    published
      property DataSourceType: TSQLDataSourceType read fDataSourceType write fDataSourceType;
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
      fEmailType: TSQLEnumeration;
      fDescription: RawUTF8;
      fBodyScreenLocation: RawUTF8;
      fXslfoAttachScreenLocation: RawUTF8;
      fFromAddress: RawUTF8;
      fCcAddress: RawUTF8;
      fBccAddress: RawUTF8;
      fSubject: RawUTF8;
      fContentType: RawUTF8;
    published
      property EmailType: TSQLEnumeration read fEmailType write fEmailType;
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
      fEnumType: TSQLEnumerationType;
      fEnumCode: RawUTF8;
      fSequence: Integer;
      FDescription: RawUTF8;
    published
      property EnumType: TSQLEnumerationType read fEnumType write fEnumType;
      property EnumCode: RawUTF8 read fEnumCode write fEnumCode;
      property Sequence: Integer read fSequence write fSequence;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 5
  TSQLEnumerationType = class(TSQLRecord)
    private
      fParent: TSQLEnumerationType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEnumerationType read fParent write fParent;
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
      fCountryCode: TSQLCountryCode;
      fTeleCode: RawUTF8;
    published
      property CountryCode: TSQLCountryCode read fCountryCode write fCountryCode;
      property TeleCode: RawUTF8 read fTeleCode write fTeleCode;
  end;

  // 9
  TSQLCountryAddressFormat = class(TSQLRecord)
    private
      fGeo: TSQLGeo;
      fGeoAssocType: TSQLGeoAssocType;
      fRequireStateProvince: Integer;
      fRequirePostalCode: Boolean;
      fPostalCodeRegex: RawUTF8;
      fHasPostalCodeExt: Boolean;
      fRequirePostalCodeExt: Boolean;
      fAddressFormat: RawUTF8;
    published
      property Geo: TSQLGeo read fGeo write fGeo;
      property GeoAssocType: TSQLGeoAssocType read fGeoAssocType write fGeoAssocType;
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
      fGeoType: TSQLGeoType;
      fGeoName: RawUTF8;
      fGeoCode: RawUTF8;
      fGeoSecCode: RawUTF8;
      fAbbreviation: RawUTF8;
      fWellKnownText: RawUTF8;
    published
      property GeoType: TSQLGeoType read fGeoType write fGeoType;
      property GeoName: RawUTF8 read fGeoName write fGeoName;
      property GeoCode: RawUTF8 read fGeoCode write fGeoCode;
      property GeoSecCode: RawUTF8 read fGeoSecCode write fGeoSecCode;
      property Abbreviation: RawUTF8 read fAbbreviation write fAbbreviation;
      property WellKnownText: RawUTF8 read fWellKnownText write fWellKnownText;
  end;

  // 11
  TSQLGeoAssoc = class(TSQLRecord)
    private
      fGeo: TSQLGeo;
      fGeoTo: TSQLGeo;
      fGeoAssocType: TSQLGeoAssocType;
    published
      property Geo: TSQLGeo read fGeo write fGeo;
      property GeoTo: TSQLGeo read fGeoTo write fGeoTo;
      property GeoAssocType: TSQLGeoAssocType read fGeoAssocType write fGeoAssocType;
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
      fGeoPointTypeEnum: TSQLEnumeration;
      fDescription: RawUTF8;
      fDataSource: TSQLDataSource;
      fLatitude: RawUTF8;
      fLongitude: RawUTF8;
      fElevation: Double;
      fElevationUom: TSQLUom;
      fInformation: RawUTF8;
    published
      property GeoPointTypeEnum: TSQLEnumeration read fGeoPointTypeEnum write fGeoPointTypeEnum;
      property Description: RawUTF8 read fDescription write fDescription;
      property DataSource: TSQLDataSource read fDataSource write fDataSource;
      property Latitude: RawUTF8 read fLatitude write fLatitude;
      property Longitude: RawUTF8 read fLongitude write fLongitude;
      property Elevation: Double read fElevation write fElevation;
      property ElevationUom: TSQLUom read fElevationUom write fElevationUom;
      property Information: RawUTF8 read fInformation write fInformation;
  end;

  // 14
  TSQLGeoType = class(TSQLRecord)
    private
      fParent: TSQLGeoType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLGeoType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 15
  TSQLKeywordThesaurus = class(TSQLRecord)
    private
      fEnteredKeyword: RawUTF8;
      fAlternateKeyword: RawUTF8;
      fRelationshipEnum: TSQLEnumeration;
    published
      property EnteredKeyword: RawUTF8 read fEnteredKeyword write fEnteredKeyword;
      property AlternateKeyword: RawUTF8 read fAlternateKeyword write fAlternateKeyword;
      property RelationshipEnum: TSQLEnumeration read fRelationshipEnum write fRelationshipEnum;
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
      fCustomMethodType: TSQLCustomMethodType;
      fCustomMethodName: RawUTF8;
      fDescription: RawUTF8;
    published
      property CustomMethodType: TSQLCustomMethodType read fCustomMethodType write fCustomMethodType;
      property CustomMethodName: RawUTF8 read fCustomMethodName write fCustomMethodName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 18
  TSQLCustomMethodType = class(TSQLRecord)
    private
      fParent: TSQLCustomMethodType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLCustomMethodType read fParent write fParent;
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
      fParentPeriod: TSQLCustomTimePeriod;
      fPeriodType: TSQLPeriodType;
      fPeriodNum: Integer;
      fPeriodName: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fIsClosed: Boolean;
    published
      property ParentPeriod: TSQLCustomTimePeriod read fParentPeriod write fParentPeriod;
      property PeriodType: TSQLPeriodType read fPeriodType write fPeriodType;
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
      fUom: TSQLUom;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
      property PeriodLength: Integer read fPeriodLength write fPeriodLength;
      property Uom: TSQLUom read fUom write fUom;
  end;

  // 22
  TSQLStatusItem = class(TSQLRecord)
    private
      fStatusType: TSQLStatusType;
      fStatusCode: RawUTF8;
      fSequenceId: Integer;
      fDescription: RawUTF8;
    published
      property StatusType: TSQLStatusType read fStatusType write fStatusType;
      property StatusCode: RawUTF8 read fStatusCode write fStatusCode;
      property SequenceId: Integer read fSequenceId write fSequenceId;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 23
  TSQLStatusType = class(TSQLRecord)
    private
      fParent: TSQLStatusType;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Parent: TSQLStatusType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 24
  TSQLStatusValidChange = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fStatusTo: TSQLStatusItem;
      fConditionExpression: RawUTF8;
      fTransitionName: RawUTF8;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property StatusTo: TSQLStatusItem read fStatusTo write fStatusTo;
      property ConditionExpression: RawUTF8 read fConditionExpression write fConditionExpression;
      property TransitionName: RawUTF8 read fTransitionName write fTransitionName;
  end;

  // 25
  TSQLUom = class(TSQLRecord)
    private
      fUomType: TSQLUomType;
      fAbbreviation: RawUTF8;
      fNumericCode: Integer;
      fDescription: RawUTF8;
    published
      property UomType: TSQLUomType read fUomType write fUomType;
      property Abbreviation: RawUTF8 read fAbbreviation write fAbbreviation;
      property NumericCode: Integer read fNumericCode write fNumericCode;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 26
  TSQLUomConversion = class(TSQLRecord)
    private
      fUom: TSQLUom;
      fUomTo: TSQLUom;
      fConversionFactor: Double;
      fCustomMethod: TSQLCustomMethod;
      fDecimalScale: Integer;
      fRoundingMode: Integer;
    published
      property Uom: TSQLUom read fUom write fUom;
      property UomTo: TSQLUom read fUomTo write fUomTo;
      property ConversionFactor: Double read fConversionFactor write fConversionFactor;
      property CustomMethod: TSQLCustomMethod read fCustomMethod write fCustomMethod;
      property DecimalScale: Integer read fDecimalScale write fDecimalScale;
      property RoundingMode: Integer read fRoundingMode write fRoundingMode;
  end;

  // 27
  TSQLUomConversionDated = class(TSQLRecord)
    private
      fUom: TSQLUom;
      fUomTo: TSQLUom;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fConversionFactor: Double;
      fCustomMethod: TSQLCustomMethod;
      fDecimalScale: Integer;
      fRoundingMode: Integer;
      fPurposeEnum: TSQLEnumeration;
    published
      property Uom: TSQLUom read fUom write fUom;
      property UomTo: TSQLUom read fUomTo write fUomTo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ConversionFactor: Double read fConversionFactor write fConversionFactor;
      property CustomMethod: TSQLCustomMethod read fCustomMethod write fCustomMethod;
      property DecimalScale: Integer read fDecimalScale write fDecimalScale;
      property RoundingMode: Integer read fRoundingMode write fRoundingMode;
      property PurposeEnum: TSQLEnumeration read fPurposeEnum write fPurposeEnum;
  end;

  // 28
  TSQLUomGroup = class(TSQLRecord)
    private
      fUom: TSQLUom;
    published
      property Uom: TSQLUom read fUom write fUom;
  end;

  // 29
  TSQLUomType = class(TSQLRecord)
    private
      fParent: TSQLUomType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLUomType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 30
  TSQLUserPreference = class(TSQLRecord)
    private
      fUserLogin: TSQLUserLogin;
      fUserPrefTypeId: Integer;
      fUserPrefGroupType: TSQLUserPrefGroupType;
      fUserPrefValue: RawUTF8;
      fUserPrefDataType: Integer;
    published
      property UserLogin: TSQLUserLogin read fUserLogin write fUserLogin;
      property UserPrefTypeId: Integer read fUserPrefTypeId write fUserPrefTypeId;
      property UserPrefGroupType: TSQLUserPrefGroupType read fUserPrefGroupType write fUserPrefGroupType;
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
      fVisualThemeSet: TSQLVisualThemeSet;
      fDescription: RawUTF8;
    published
      property VisualThemeSet: TSQLVisualThemeSet read fVisualThemeSet write fVisualThemeSet;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 34
  TSQLVisualThemeResource = class(TSQLRecord)
    private
      fVisualTheme: TSQLVisualTheme;
      fResourceTypeEnum: TSQLEnumeration;
      fSequenceId: Integer;
      fResourceValue: RawUTF8;
    published
      property VisualTheme: TSQLVisualTheme read fVisualTheme write fVisualTheme;
      property ResourceTypeEnum: TSQLEnumeration read fResourceTypeEnum write fResourceTypeEnum;
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
      fPortalPortlet: TSQLPortalPortlet;
      fPortletCategory: TSQLPortletCategory;
    published
      property PortalPortlet: TSQLPortalPortlet read fPortalPortlet write fPortalPortlet;
      property PortletCategory: TSQLPortletCategory read fPortletCategory write fPortletCategory;
  end;

  // 38
  TSQLPortalPage = class(TSQLRecord)
    private
      fPortalPageName: RawUTF8;
      fDescription: RawUTF8;
      fOwnerUserLoginId: Integer;
      fOriginalPortalPageId: Integer;
      fParentPortalPage: TSQLPortalPage;
      fSequenceNum: Integer;
      fSecurityGroup: TSQLSecurityGroup;
    published
      property PortalPageName: RawUTF8 read fPortalPageName write fPortalPageName;
      property Description: RawUTF8 read fDescription write fDescription;
      property OwnerUserLoginId: Integer read fOwnerUserLoginId write fOwnerUserLoginId;
      property OriginalPortalPageId: Integer read fOriginalPortalPageId write fOriginalPortalPageId;
      property ParentPortalPage: TSQLPortalPage read fParentPortalPage write fParentPortalPage;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property SecurityGroup: TSQLSecurityGroup read fSecurityGroup write fSecurityGroup;
  end;

  // 39
  TSQLPortalPageColumn = class(TSQLRecord)
    private
      fPortalPage: TSQLPortalPage;
      fColumnSeqId: Integer;
      fColumnWidthPixels: Integer;
      fColumnWidthPercentage: Integer;
    published
      property PortalPage: TSQLPortalPage read fPortalPage write fPortalPage;
      property ColumnSeqId: Integer read fColumnSeqId write fColumnSeqId;
      property ColumnWidthPixels: Integer read fColumnWidthPixels write fColumnWidthPixels;
      property ColumnWidthPercentage: Integer read fColumnWidthPercentage write fColumnWidthPercentage;
  end;

  // 40
  TSQLPortalPagePortlet = class(TSQLRecord)
    private
      fPortalPage: TSQLPortalPageColumn;      //portalPageId, columnSeqId
      fPortalPortlet: TSQLPortalPortlet;
      fPortletSeqId: Integer;
      fSequenceNum: Integer;
    published
      property PortalPage: TSQLPortalPageColumn read fPortalPage write fPortalPage;
      property PortalPortlet: TSQLPortalPortlet read fPortalPortlet write fPortalPortlet;
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

