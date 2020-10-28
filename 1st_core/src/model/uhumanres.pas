unit uHumanres;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;

type
  // 1
  TSQLPartyQual = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fPartyQualType: TSQLPartyQualTypeID;
      fQualificationDesc: RawUTF8;
      fTitle: RawUTF8;
      fStatus: TSQLStatusItemID;
      fVerifStatus: TSQLStatusItemID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property PartyQualType: TSQLPartyQualTypeID read fPartyQualType write fPartyQualType;
      property QualificationDesc: RawUTF8 read fQualificationDesc write fQualificationDesc;
      property Title: RawUTF8 read fTitle write fTitle;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property VerifStatus: TSQLStatusItemID read fVerifStatus write fVerifStatus;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 2
  TSQLPartyQualType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLPartyQualTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLPartyQualTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 3
  TSQLPartyResume = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fContent: TSQLContentID;
      fResumeDate: TDateTime;
      fResumeText: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property Content: TSQLContentID read fContent write fContent;
      property ResumeDate: TDateTime read fResumeDate write fResumeDate;
      property ResumeText: RawUTF8 read fResumeText write fResumeText;
  end;

  // 4
  TSQLPartySkill = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fSkillType: TSQLSkillTypeID;
      fYearsExperience: Integer;
      fRating: Integer;
      fSkillLevel: Integer;
      fStartedUsingDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property SkillType: TSQLSkillTypeID read fSkillType write fSkillType;
      property YearsExperience: Integer read fYearsExperience write fYearsExperience;
      property Rating: Integer read fRating write fRating;
      property SkillLevel: Integer read fSkillLevel write fSkillLevel;
      property StartedUsingDate: TDateTime read fStartedUsingDate write fStartedUsingDate;
  end;

  // 5
  TSQLPerfRatingType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLPerfRatingTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLPerfRatingTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 6
  TSQLPerfReview = class(TSQLRecord)
    private
      fEmployeeParty: TSQLPartyRoleID;
      //fEmployeeRoleType: TSQLPartyRoleID;
      fManagerParty: TSQLPartyRoleID;
      //fManagerRoleType: TSQLPartyRoleID;
      fPayment: TSQLPaymentID;
      fEmplPosition: TSQLEmplPositionID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmployeeParty: TSQLPartyRoleID read fEmployeeParty write fEmployeeParty;
      property ManagerParty: TSQLPartyRoleID read fManagerParty write fManagerParty;
      property Payment: TSQLPaymentID read fPayment write fPayment;
      property EmplPosition: TSQLEmplPositionID read fEmplPosition write fEmplPosition;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 7
  TSQLPerfReviewItem = class(TSQLRecord)
    private
      fPerfReview: TSQLPerfReviewID;      //employeeParty, employeeRoleType, perfReview
      fPerfReviewItemSeq: Integer;
      fPerfReviewItemType: TSQLPerfReviewItemTypeID;
      fPerfRatingType: TSQLPerfRatingTypeID;
      fComments: RawUTF8;
    published
      property PerfReview: TSQLPerfReviewID read fPerfReview write fPerfReview;
      property PerfReviewItemSeq: Integer read fPerfReviewItemSeq write fPerfReviewItemSeq;
      property PerfReviewItemType: TSQLPerfReviewItemTypeID read fPerfReviewItemType write fPerfReviewItemType;
      property PerfRatingType: TSQLPerfRatingTypeID read fPerfRatingType write fPerfRatingType;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 8
  TSQLPerfReviewItemType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLPerfReviewItemTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLPerfReviewItemTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 9
  TSQLPerformanceNote = class(TSQLRecord)
    private
      fParty: TSQLPartyRoleID;         //partyId, roleTypeId
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCommunicationDate: TDateTime;
      fComments: RawUTF8;
    published
      property Party: TSQLPartyRoleID read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CommunicationDate: TDateTime read fCommunicationDate write fCommunicationDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 10
  TSQLPersonTraining = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fTrainingRequest: TSQLTrainingRequestID;
      fTrainingClassType: TSQLTrainingClassTypeID;
      fWorkEffort: TSQLWorkEffortID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fApprover: TSQLPersonID;
      fApprovalStatus: RawUTF8;
      fReason: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property TrainingRequest: TSQLTrainingRequestID read fTrainingRequest write fTrainingRequest;
      property TrainingClassType: TSQLTrainingClassTypeID read fTrainingClassType write fTrainingClassType;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Approver: TSQLPersonID read fApprover write fApprover;
      property ApprovalStatus: RawUTF8 read fApprovalStatus write fApprovalStatus;
      property Reason: RawUTF8 read fReason write fReason;
  end;

  // 11
  TSQLResponsibilityType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLResponsibilityTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLResponsibilityTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 12
  TSQLSkillType = class(TSQLRecord)
    private
      fParent: TSQLSkillTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLSkillTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 13
  TSQLTrainingClassType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLTrainingClassTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLTrainingClassTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 14
  TSQLBenefitType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLBenefitTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fEmployerPaidPercentage: Double;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLBenefitTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property EmployerPaidPercentage: Double read fEmployerPaidPercentage write fEmployerPaidPercentage;
  end;

  // 15
  TSQLEmployment = class(TSQLRecord)
    private
      fPartyFrom: TSQLPartyRoleID;       //partyIdFrom, roleTypeIdFrom
      fPartyTo: TSQLPartyRoleID;       //partyIdTo, roleTypeIdTo
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fTerminationReason: TSQLTerminationReasonID;
      fTerminationType: TSQLTerminationTypeID;
    published
      property PartyFrom: TSQLPartyRoleID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyRoleID read fPartyTo write fPartyTo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property TerminationReason: TSQLTerminationReasonID read fTerminationReason write fTerminationReason;
      property TerminationType: TSQLTerminationTypeID read fTerminationType write fTerminationType;
  end;

  // 16
  TSQLEmploymentApp = class(TSQLRecord)
    private
      fEmplPosition: TSQLEmplPositionID;
      fStatus: TSQLStatusItemID;
      fEmploymentAppSourceType: TSQLEmploymentAppSourceTypeID;
      fApplyingParty: TSQLPartyID;
      fReferredByParty: TSQLPartyID;
      fApplicationDate: TDateTime;
      fApproverParty: TSQLPartyID;
      fJobRequisition: TSQLJobRequisitionID;
    published
      property EmplPosition: TSQLEmplPositionID read fEmplPosition write fEmplPosition;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property EmploymentAppSourceType: TSQLEmploymentAppSourceTypeID read fEmploymentAppSourceType write fEmploymentAppSourceType;
      property ApplyingParty: TSQLPartyID read fApplyingParty write fApplyingParty;
      property ReferredByParty: TSQLPartyID read fReferredByParty write fReferredByParty;
      property ApplicationDate: TDateTime read fApplicationDate write fApplicationDate;
      property ApproverParty: TSQLPartyID read fApproverParty write fApproverParty;
      property JobRequisition: TSQLJobRequisitionID read fJobRequisition write fJobRequisition;
  end;

  // 17
  TSQLEmploymentAppSourceType = class(TSQLRecord)
    private
      fParent: TSQLEmploymentAppSourceTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmploymentAppSourceTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 18
  TSQLEmplLeave = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fLeaveType: TSQLEmplLeaveTypeID;
      fEmplLeaveReasonType: TSQLEmplLeaveReasonTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fApproverParty: TSQLPartyID;
      fLeaveStatus: TSQLStatusItemID;
      fDescription: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property LeaveType: TSQLEmplLeaveTypeID read fLeaveType write fLeaveType;
      property EmplLeaveReasonType: TSQLEmplLeaveReasonTypeID read fEmplLeaveReasonType write fEmplLeaveReasonType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ApproverParty: TSQLPartyID read fApproverParty write fApproverParty;
      property LeaveStatus: TSQLStatusItemID read fLeaveStatus write fLeaveStatus;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 19
  TSQLEmplLeaveType = class(TSQLRecord)
    private
      fParent: TSQLEmplLeaveTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmplLeaveTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 20
  TSQLPartyBenefit = class(TSQLRecord)
    private
      fPartyFrom: TSQLPartyRoleID;       //partyIdFrom, roleTypeIdFrom
      fPartyTo: TSQLPartyRoleID;       //partyIdTo, roleTypeIdTo
      fBenefitType: TSQLBenefitTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPeriodType: TSQLPeriodTypeID;
      fCost: Currency;
      fActualEmployerPaidPercent: Double;
      fAvailableTime: Integer;
    published
      property PartyFrom: TSQLPartyRoleID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyRoleID read fPartyTo write fPartyTo;
      property BenefitType: TSQLBenefitTypeID read fBenefitType write fBenefitType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PeriodType: TSQLPeriodTypeID read fPeriodType write fPeriodType;
      property Cost: Currency read fCost write fCost;
      property ActualEmployerPaidPercent: Double read fActualEmployerPaidPercent write fActualEmployerPaidPercent;
      property AvailableTime: Integer read fAvailableTime write fAvailableTime;
  end;

  // 21
  TSQLPayGrade = class(TSQLRecord)
    private
      fPayGradeName: RawUTF8;
      fComments: RawUTF8;
    published
      property PayGradeName: RawUTF8 read fPayGradeName write fPayGradeName;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 22
  TSQLPayHistory = class(TSQLRecord)
    private
      fEmployment: TSQLEmploymentID;    //roleTypeIdFrom, roleTypeIdTo, partyIdFrom, partyIdTo, emplFromDate
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSalaryStep: TSQLSalaryStepID;    //salaryStepSeqId, payGradeId
      fPeriodType: TSQLPeriodTypeID;
      fAmount: Currency;
      fComments: RawUTF8;
    published
      property Employment: TSQLEmploymentID read fEmployment write fEmployment;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SalaryStep: TSQLSalaryStepID read fSalaryStep write fSalaryStep;
      property PeriodType: TSQLPeriodTypeID read fPeriodType write fPeriodType;
      property Amount: Currency read fAmount write fAmount;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 23
  TSQLPayrollPreference = class(TSQLRecord)
    private
      fParty: TSQLPartyRoleID;               //partyId, roleTypeId
      fDeductionType: TSQLDeductionTypeID;
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fPeriodType: TSQLPeriodTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPercentage: Double;
      fFlatAmount: Currency;
      fRoutingNumber: RawUTF8;
      fAccountNumber: RawUTF8;
      fBankName: RawUTF8;
    published
      property Party: TSQLPartyRoleID read fParty write fParty;
      property DeductionType: TSQLDeductionTypeID read fDeductionType write fDeductionType;
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property PeriodType: TSQLPeriodTypeID read fPeriodType write fPeriodType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Percentage: Double read fPercentage write fPercentage;
      property FlatAmount: Currency read fFlatAmount write fFlatAmount;
      property RoutingNumber: RawUTF8 read fRoutingNumber write fRoutingNumber;
      property AccountNumber: RawUTF8 read fAccountNumber write fAccountNumber;
      property BankName: RawUTF8 read fBankName write fBankName;
  end;

  // 24
  TSQLSalaryStep = class(TSQLRecord)
    private
      fPayGrade: TSQLPayGradeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fDateModified: TDateTime;
      fAmount: Currency;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property PayGrade: TSQLPayGradeID read fPayGrade write fPayGrade;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property DateModified: TDateTime read fDateModified write fDateModified;
      property Amount: Currency read fAmount write fAmount;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 25
  TSQLTerminationReason = class(TSQLRecord)
    private
      fReason: RawUTF8;
      fDescription: RawUTF8;
    published
      property Reason: RawUTF8 read fReason write fReason;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 26
  TSQLTerminationType = class(TSQLRecord)
    private
      fParent: TSQLTerminationTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLTerminationTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 27
  TSQLUnemploymentClaim = class(TSQLRecord)
    private
      fUnemploymentClaimDate: TDateTime;
      fDescription: RawUTF8;
      fStatus: TSQLStatusItemID;
      fEmployment: TSQLEmploymentID;      //roleTypeIdFrom, roleTypeIdTo, partyIdFrom, partyIdTo, fromDate
      fThruDate: TDateTime;
    published
      property UnemploymentClaimDate: TDateTime read fUnemploymentClaimDate write fUnemploymentClaimDate;
      property Description: RawUTF8 read FDescription write FDescription;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Employment: TSQLEmploymentID read fEmployment write fEmployment;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 28
  TSQLEmplPosition = class(TSQLRecord)
    private
      fStatus: TSQLStatusItemID;
      fParty: TSQLPartyID;
      fBudget: TSQLBudgetItemID;        //budgetId, budgetItemSeqId
      fEmplPositionType: TSQLEmplPositionTypeID;
      fEstimatedFromDate: TDateTime;
      fEstimatedThruDate: TDateTime;
      fSalaryFlag: Boolean;
      fExemptFlag: Boolean;
      fFulltimeFlag: Boolean;
      fTemporaryFlag: Boolean;
      fActualFromDate: TDateTime;
      fActualThruDate: TDateTime;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Party: TSQLPartyID read fParty write fParty;
      property Budget: TSQLBudgetItemID read fBudget write fBudget;
      property EmplPositionType: TSQLEmplPositionTypeID read fEmplPositionType write fEmplPositionType;
      property EstimatedFromDate: TDateTime read fEstimatedFromDate write fEstimatedFromDate;
      property EstimatedThruDate: TDateTime read fEstimatedThruDate write fEstimatedThruDate;
      property SalaryFlag: Boolean read fSalaryFlag write fSalaryFlag;
      property ExemptFlag: Boolean read fExemptFlag write fExemptFlag;
      property FulltimeFlag: Boolean read fFulltimeFlag write fFulltimeFlag;
      property TemporaryFlag: Boolean read fTemporaryFlag write fTemporaryFlag;
      property ActualFromDate: TDateTime read fActualFromDate write fActualFromDate;
      property ActualThruDate: TDateTime read fActualThruDate write fActualThruDate;
  end;

  // 29
  TSQLEmplPositionClassType = class(TSQLRecord)
    private
      fParent: TSQLEmplPositionClassTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmplPositionClassTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 30
  TSQLEmplPositionFulfillment = class(TSQLRecord)
    private
      fEmplPosition: TSQLEmplPositionID;
      fParty: TSQLPartyID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmplPosition: TSQLEmplPositionID read fEmplPosition write fEmplPosition;
      property Party: TSQLPartyID read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 31
  TSQLEmplPositionReportingStruct = class(TSQLRecord)
    private
      fEmplPositionIdReportingTo: TSQLEmplPositionID;
      fEmplPositionIdManagedBy: TSQLEmplPositionID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
      fPrimaryFlag: Boolean;
    published
      property EmplPositionIdReportingTo: TSQLEmplPositionID read fEmplPositionIdReportingTo write fEmplPositionIdReportingTo;
      property EmplPositionIdManagedBy: TSQLEmplPositionID read fEmplPositionIdManagedBy write fEmplPositionIdManagedBy;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
      property PrimaryFlag: Boolean read fPrimaryFlag write fPrimaryFlag;
  end;

  // 32
  TSQLEmplPositionResponsibility = class(TSQLRecord)
    private
      fEmplPosition: TSQLEmplPositionID;
      fResponsibilityType: TSQLResponsibilityTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmplPosition: TSQLEmplPositionID read fEmplPosition write fEmplPosition;
      property ResponsibilityType: TSQLResponsibilityTypeID read fResponsibilityType write fResponsibilityType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 33
  TSQLEmplPositionType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLEmplPositionTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLEmplPositionTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 34
  TSQLEmplPositionTypeClass = class(TSQLRecord)
    private
      fEmplPositionType: TSQLEmplPositionTypeID;
      fEmplPositionClassType: TSQLEmplPositionClassTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStandardHoursPerWeek: Double;
    published
      property EmplPositionType: TSQLEmplPositionTypeID read fEmplPositionType write fEmplPositionType;
      property EmplPositionClassType: TSQLEmplPositionClassTypeID read fEmplPositionClassType write fEmplPositionClassType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property StandardHoursPerWeek: Double read fStandardHoursPerWeek write fStandardHoursPerWeek;
  end;

  // 35
  TSQLValidResponsibility = class(TSQLRecord)
    private
      fEmplPositionType: TSQLEmplPositionTypeID;
      fResponsibilityType: TSQLResponsibilityTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmplPositionType: TSQLEmplPositionTypeID read fEmplPositionType write fEmplPositionType;
      property ResponsibilityType: TSQLResponsibilityTypeID read fResponsibilityType write fResponsibilityType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 36
  TSQLEmplPositionTypeRate = class(TSQLRecord)
    private
      fEmplPositionType: TSQLEmplPositionTypeID;
      fRateType: TSQLRateTypeID;
      fSalaryStep: TSQLSalaryStepID;            //payGradeId, salaryStepSeqId, fromDate
      fThruDate: TDateTime;
    published
      property EmplPositionType: TSQLEmplPositionTypeID read fEmplPositionType write fEmplPositionType;
      property RateType: TSQLRateTypeID read fRateType write fRateType;
      property SalaryStep: TSQLSalaryStepID read fSalaryStep write fSalaryStep;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 37
  TSQLJobRequisition = class(TSQLRecord)
    private
      fDurationMonths: Integer;
      fAge: Integer;
      fGender: Boolean;
      fExperienceMonths: Integer;
      fExperienceYears: Integer;
      fQualification: Integer;
      fJobLocation: Integer;
      fSkillType: TSQLSkillTypeID;
      fNoOfResources: Integer;
      fJobPostingTypeEnum: TSQLEnumerationID;
      fJobRequisitionDate: TDateTime;
      fExamTypeEnum: TSQLEnumerationID;
      fRequiredOnDate: TDateTime;
    published
      property DurationMonths: Integer read fDurationMonths write fDurationMonths;
      property Age: Integer read fAge write fAge;
      property Gender: Boolean read fGender write fGender;
      property ExperienceMonths: Integer read fExperienceMonths write fExperienceMonths;
      property ExperienceYears: Integer read fExperienceYears write fExperienceYears;
      property Qualification: Integer read fQualification write fQualification;
      property JobLocation: Integer read fJobLocation write fJobLocation;
      property SkillType: TSQLSkillTypeID read fSkillType write fSkillType;
      property NoOfResources: Integer read fNoOfResources write fNoOfResources;
      property JobPostingTypeEnum: TSQLEnumerationID read fJobPostingTypeEnum write fJobPostingTypeEnum;
      property JobRequisitionDate: TDateTime read fJobRequisitionDate write fJobRequisitionDate;
      property ExamTypeEnum: TSQLEnumerationID read fExamTypeEnum write fExamTypeEnum;
      property RequiredOnDate: TDateTime read fRequiredOnDate write fRequiredOnDate;
  end;

  // 38
  TSQLJobInterview = class(TSQLRecord)
    private
      fJobIntervieweeParty: TSQLPartyID;
      fJobRequisition: TSQLJobRequisitionID;
      fJobInterviewerParty: TSQLPartyID;
      fJobInterviewType: TSQLJobInterviewTypeID;
      fGradeSecuredEnum: TSQLEnumerationID;
      fJobInterviewResult: RawUTF8;
      fJobInterviewDate: TDateTime;
    published
      property JobIntervieweeParty: TSQLPartyID read fJobIntervieweeParty write fJobIntervieweeParty;
      property JobRequisition: TSQLJobRequisitionID read fJobRequisition write fJobRequisition;
      property JobInterviewerParty: TSQLPartyID read fJobInterviewerParty write fJobInterviewerParty;
      property JobInterviewType: TSQLJobInterviewTypeID read fJobInterviewType write fJobInterviewType;
      property GradeSecuredEnum: TSQLEnumerationID read fGradeSecuredEnum write fGradeSecuredEnum;
      property JobInterviewResult: RawUTF8 read fJobInterviewResult write fJobInterviewResult;
      property JobInterviewDate: TDateTime read fJobInterviewDate write fJobInterviewDate;
  end;

  // 39
  TSQLJobInterviewType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 40
  TSQLTrainingRequest = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 41
  TSQLEmplLeaveReasonType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLEmplLeaveReasonTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLEmplLeaveReasonTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

implementation

uses
  Classes, SysUtils;

// 1
class procedure TSQLPartyQualType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLPartyQualType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLPartyQualType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','PartyQualType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update PartyQualType set Parent=(select c.id from PartyQualType c where c.Encode=PartyQualType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 2
class procedure TSQLEmplPositionType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLEmplPositionType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLEmplPositionType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','EmplPositionType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update EmplPositionType set Parent=(select c.id from EmplPositionType c where c.Encode=EmplPositionType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 3
class procedure TSQLResponsibilityType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLResponsibilityType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLResponsibilityType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ResponsibilityType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ResponsibilityType set Parent=(select c.id from ResponsibilityType c where c.Encode=ResponsibilityType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 4
class procedure TSQLBenefitType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLBenefitType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLBenefitType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','BenefitType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update BenefitType set Parent=(select c.id from BenefitType c where c.Encode=BenefitType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 5
class procedure TSQLTrainingClassType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLTrainingClassType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLTrainingClassType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','TrainingClassType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update TrainingClassType set Parent=(select c.id from TrainingClassType c where c.Encode=TrainingClassType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 6
class procedure TSQLJobInterviewType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLJobInterviewType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLJobInterviewType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','JobInterviewType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 5
class procedure TSQLEmplLeaveReasonType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLEmplLeaveReasonType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLEmplLeaveReasonType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','EmplLeaveReasonType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update EmplLeaveReasonType set Parent=(select c.id from EmplLeaveReasonType c where c.Encode=EmplLeaveReasonType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 6
class procedure TSQLPerfReviewItemType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLPerfReviewItemType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLPerfReviewItemType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','PerfReviewItemType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update PerfReviewItemType set Parent=(select c.id from PerfReviewItemType c where c.Encode=PerfReviewItemType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 7
class procedure TSQLPerfRatingType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLPerfRatingType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLPerfRatingType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','PerfRatingType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update PerfRatingType set Parent=(select c.id from PerfRatingType c where c.Encode=PerfRatingType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

end.

