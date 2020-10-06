unit uSecurity;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLX509IssuerProvision = class(TSQLRecord)
    private
      fCommonName: RawUTF8;
      fOrganizationalUnit: RawUTF8;
      fOrganizationName: RawUTF8;
      fCityLocality: RawUTF8;
      fStateProvince: RawUTF8;
      fCountry: RawUTF8;
      fSerialNumber: RawUTF8;
    published
      property CommonName: RawUTF8 read fCommonName write fCommonName;
      property OrganizationalUnit: RawUTF8 read fOrganizationalUnit write fOrganizationalUnit;
      property OrganizationName: RawUTF8 read fOrganizationName write fOrganizationName;
      property CityLocality: RawUTF8 read fCityLocality write fCityLocality;
      property StateProvince: RawUTF8 read fStateProvince write fStateProvince;
      property Country: RawUTF8 read fCountry write fCountry;
      property SerialNumber: RawUTF8 read fSerialNumber write fSerialNumber;
  end;

  // 2
  TSQLUserLogin = class(TSQLRecord)
    private
      fCurrentPassword: RawUTF8;
      fPasswordHint: RawUTF8;
      fIsSystem: Boolean;
      fEnabled: Boolean;
      fHasLoggedOut: Boolean;
      fRequirePasswordChange: Boolean;
      fLastCurrencyUom: TSQLUomID;
      fLastLocale: RawUTF8;
      fLastTimeZone: RawUTF8;
      fDisabledDateTime: TDateTime;
      fSuccessiveFailedLogins: Integer;
      fExternalAuthId: RawUTF8;
    published
      property CurrentPassword: RawUTF8 read fCurrentPassword write fCurrentPassword;
      property PasswordHint: RawUTF8 read fPasswordHint write fPasswordHint;
      property IsSystem: Boolean read fIsSystem write fIsSystem;
      property Enabled: Boolean read fEnabled write fEnabled;
      property HasLoggedOut: Boolean read fHasLoggedOut write fHasLoggedOut;
      property RequirePasswordChange: Boolean read fRequirePasswordChange write fRequirePasswordChange;
      property LastCurrencyUom: TSQLUomID read fLastCurrencyUom write fLastCurrencyUom;
      property LastLocale: RawUTF8 read fLastLocale write fLastLocale;
      property LastTimeZone: RawUTF8 read fLastTimeZone write fLastTimeZone;
      property DisabledDateTime: TDateTime read fDisabledDateTime write fDisabledDateTime;
      property SuccessiveFailedLogins: Integer read fSuccessiveFailedLogins write fSuccessiveFailedLogins;
      property ExternalAuthId: RawUTF8 read fExternalAuthId write fExternalAuthId;
  end;

  // 3
  TSQLUserLoginPasswordHistory = class(TSQLRecord)
    private
      fUserLogin: TSQLUserLoginID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCurrentPassword: RawUTF8;
    published
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CurrentPassword: RawUTF8 read fCurrentPassword write fCurrentPassword;
  end;

  // 4
  TSQLUserLoginHistory = class(TSQLRecord)
    private
      fUserLogin: TSQLUserLoginID;
      fVisitId: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPasswordUsed: RawUTF8;
      fSuccessfulLogin: Boolean;
    published
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property VisitId: RawUTF8 read fVisitId write fVisitId;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PasswordUsed: RawUTF8 read fPasswordUsed write fPasswordUsed;
      property SuccessfulLogin: Boolean read fSuccessfulLogin write fSuccessfulLogin;
  end;

  // 5
  TSQLUserLoginSession = class(TSQLRecord)
    private
      fUserLogin: TSQLUserLoginID;
      fSavedDate: TDateTime;
      fSessionData: TSQLRawBlob;
    published
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property SavedDate: TDateTime read fSavedDate write fSavedDate;
      property SessionData: TSQLRawBlob read fSessionData write fSessionData;
  end;

  // 6
  TSQLSecurityGroup = class(TSQLRecord)
    private
      fGroupName: RawUTF8;
      fDescription: RawUTF8;
    published
      property GroupName: RawUTF8 read fGroupName write fGroupName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 7
  TSQLSecurityGroupPermission = class(TSQLRecord)
    private
      fGroupId: TSQLSecurityGroupID;
      fPermission: TSQLSecurityPermissionID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property GroupId: TSQLSecurityGroupID read fGroupId write fGroupId;
      property Permission: TSQLSecurityPermissionID read fPermission write fPermission;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 8
  TSQLSecurityPermission = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 9
  TSQLUserLoginSecurityGroup = class(TSQLRecord)
    private
      fUserLogin: TSQLUserLoginID;
      fGroupId: TSQLSecurityGroupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property GroupId: TSQLSecurityGroupID read fGroupId write fGroupId;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 10
  TSQLProtectedView = class(TSQLRecord)
    private
      fGroupId: TSQLSecurityGroupID;
      fViewName: RawUTF8;
      fMaxHits: Integer;
      fMaxHitsDuration: Integer;
      fTarpitDuration: Integer;
    published
      property GroupId: TSQLSecurityGroupID read fGroupId write fGroupId;
      property ViewName: RawUTF8 read fViewName write fViewName;
      property MaxHits: Integer read fMaxHits write fMaxHits;
      property MaxHitsDuration: Integer read fMaxHitsDuration write fMaxHitsDuration;
      property TarpitDuration: Integer read fTarpitDuration write fTarpitDuration;
  end;

  // 11
  TSQLTarpittedLoginView = class(TSQLRecord)
    private
      fViewName: RawUTF8;
      fUserLogin: TSQLUserLoginID;
      fTarpitReleaseDateTime: Integer;
    published
      property ViewName: RawUTF8 read fViewName write fViewName;
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property TarpitReleaseDateTime: Integer read fTarpitReleaseDateTime write fTarpitReleaseDateTime;
  end;

  // 12
  TSQLUserLoginSecurityQuestion = class(TSQLRecord)
    private
      fQuestionEnum: TSQLEnumerationID;
      fUserLogin: TSQLUserLoginID;
      fSecurityAnswer: RawUTF8;
    published
      property QuestionEnum: TSQLEnumerationID read fQuestionEnum write fQuestionEnum;
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property SecurityAnswer: RawUTF8 read fSecurityAnswer write fSecurityAnswer;
  end;

implementation

end.

