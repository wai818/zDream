unit uHumanres;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLPartyQual = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fPartyQualType: TSQLPartyQualType;
      fQualificationDesc: RawUTF8;
      fTitle: RawUTF8;
      fStatus: TSQLStatusItem;
      fVerifStatus: TSQLStatusItem;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Party: TSQLParty read fParty write fParty;
      property PartyQualType: TSQLPartyQualType read fPartyQualType write fPartyQualType;
      property QualificationDesc: RawUTF8 read fQualificationDesc write fQualificationDesc;
      property Title: RawUTF8 read fTitle write fTitle;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property VerifStatus: TSQLStatusItem read fVerifStatus write fVerifStatus;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 2
  TSQLPartyQualType = class(TSQLRecord)
    private
      fParent: TSQLPartyQualType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyQualType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 3
  TSQLPartyResume = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fContent: TSQLContent;
      fResumeDate: TDateTime;
      fResumeText: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property Content: TSQLContent read fContent write fContent;
      property ResumeDate: TDateTime read fResumeDate write fResumeDate;
      property ResumeText: RawUTF8 read fResumeText write fResumeText;
  end;

  // 4
  TSQLPartySkill = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fSkillType: TSQLSkillType;
      fYearsExperience: Integer;
      fRating: Integer;
      fSkillLevel: Integer;
      fStartedUsingDate: TDateTime;
    published
      property Party: TSQLParty read fParty write fParty;
      property SkillType: TSQLSkillType read fSkillType write fSkillType;
      property YearsExperience: Integer read fYearsExperience write fYearsExperience;
      property Rating: Integer read fRating write fRating;
      property SkillLevel: Integer read fSkillLevel write fSkillLevel;
      property StartedUsingDate: TDateTime read fStartedUsingDate write fStartedUsingDate;
  end;

  // 5
  TSQLPerfRatingType = class(TSQLRecord)
    private
      fParent: TSQLPerfRatingType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPerfRatingType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 6
  TSQLPerfReview = class(TSQLRecord)
    private
      fEmployeeParty: TSQLPartyRole;
      //fEmployeeRoleType: TSQLPartyRole;
      fManagerParty: TSQLPartyRole;
      //fManagerRoleType: TSQLPartyRole;
      fPayment: TSQLPayment;
      fEmplPosition: TSQLEmplPosition;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmployeeParty: TSQLPartyRole read fEmployeeParty write fEmployeeParty;
      property ManagerParty: TSQLPartyRole read fManagerParty write fManagerParty;
      property Payment: TSQLPayment read fPayment write fPayment;
      property EmplPosition: TSQLEmplPosition read fEmplPosition write fEmplPosition;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 7
  TSQLPerfReviewItem = class(TSQLRecord)
    private
      fPerfReview: TSQLPerfReview;      //employeeParty, employeeRoleType, perfReview
      fPerfReviewItemSeq: Integer;
      fPerfReviewItemType: TSQLPerfReviewItemType;
      fPerfRatingType: TSQLPerfRatingType;
      fComments: RawUTF8;
    published
      property PerfReview: TSQLPerfReview read fPerfReview write fPerfReview;
      property PerfReviewItemSeq: Integer read fPerfReviewItemSeq write fPerfReviewItemSeq;
      property PerfReviewItemType: TSQLPerfReviewItemType read fPerfReviewItemType write fPerfReviewItemType;
      property PerfRatingType: TSQLPerfRatingType read fPerfRatingType write fPerfRatingType;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 8
  TSQLPerfReviewItemType = class(TSQLRecord)
    private
      fParent: TSQLPerfReviewItemType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPerfReviewItemType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 9
  TSQLPerformanceNote = class(TSQLRecord)
    private
      fParty: TSQLPartyRole;         //partyId, roleTypeId
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCommunicationDate: TDateTime;
      fComments: RawUTF8;
    published
      property Party: TSQLPartyRole read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CommunicationDate: TDateTime read fCommunicationDate write fCommunicationDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 10
  TSQLPersonTraining = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fTrainingRequest: TSQLTrainingRequest;
      fTrainingClassType: TSQLTrainingClassType;
      fWorkEffort: TSQLWorkEffort;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fApprover: TSQLPerson;
      fApprovalStatus: RawUTF8;
      fReason: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property TrainingRequest: TSQLTrainingRequest read fTrainingRequest write fTrainingRequest;
      property TrainingClassType: TSQLTrainingClassType read fTrainingClassType write fTrainingClassType;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Approver: TSQLPerson read fApprover write fApprover;
      property ApprovalStatus: RawUTF8 read fApprovalStatus write fApprovalStatus;
      property Reason: RawUTF8 read fReason write fReason;
  end;

  // 11
  TSQLResponsibilityType = class(TSQLRecord)
    private
      fParent: TSQLResponsibilityType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLResponsibilityType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 12
  TSQLSkillType = class(TSQLRecord)
    private
      fParent: TSQLSkillType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLSkillType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 13
  TSQLTrainingClassType = class(TSQLRecord)
    private
      fParent: TSQLTrainingClassType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLTrainingClassType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 14
  TSQLBenefitType = class(TSQLRecord)
    private
      fParent: TSQLBenefitType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fEmployerPaidPercentage: Double;
    published
      property Parent: TSQLBenefitType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property EmployerPaidPercentage: Double read fEmployerPaidPercentage write fEmployerPaidPercentage;
  end;

  // 15
  TSQLEmployment = class(TSQLRecord)
    private
      fPartyFrom: TSQLPartyRole;       //partyIdFrom, roleTypeIdFrom
      fPartyTo: TSQLPartyRole;       //partyIdTo, roleTypeIdTo
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fTerminationReason: TSQLTerminationReason;
      fTerminationType: TSQLTerminationType;
    published
      property PartyFrom: TSQLPartyRole read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyRole read fPartyTo write fPartyTo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property TerminationReason: TSQLTerminationReason read fTerminationReason write fTerminationReason;
      property TerminationType: TSQLTerminationType read fTerminationType write fTerminationType;
  end;

  // 16
  TSQLEmploymentApp = class(TSQLRecord)
    private
      fEmplPosition: TSQLEmplPosition;
      fStatus: TSQLStatusItem;
      fEmploymentAppSourceType: TSQLEmploymentAppSourceType;
      fApplyingParty: TSQLParty;
      fReferredByParty: TSQLParty;
      fApplicationDate: TDateTime;
      fApproverParty: TSQLParty;
      fJobRequisition: TSQLJobRequisition;
    published
      property EmplPosition: TSQLEmplPosition read fEmplPosition write fEmplPosition;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property EmploymentAppSourceType: TSQLEmploymentAppSourceType read fEmploymentAppSourceType write fEmploymentAppSourceType;
      property ApplyingParty: TSQLParty read fApplyingParty write fApplyingParty;
      property ReferredByParty: TSQLParty read fReferredByParty write fReferredByParty;
      property ApplicationDate: TDateTime read fApplicationDate write fApplicationDate;
      property ApproverParty: TSQLParty read fApproverParty write fApproverParty;
      property JobRequisition: TSQLJobRequisition read fJobRequisition write fJobRequisition;
  end;

  // 17
  TSQLEmploymentAppSourceType = class(TSQLRecord)
    private
      fParent: TSQLEmploymentAppSourceType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmploymentAppSourceType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 18
  TSQLEmplLeave = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fLeaveType: TSQLEmplLeaveType;
      fEmplLeaveReasonType: TSQLEmplLeaveReasonType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fApproverParty: TSQLParty;
      fLeaveStatus: TSQLStatusItem;
      fDescription: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property LeaveType: TSQLEmplLeaveType read fLeaveType write fLeaveType;
      property EmplLeaveReasonType: TSQLEmplLeaveReasonType read fEmplLeaveReasonType write fEmplLeaveReasonType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ApproverParty: TSQLParty read fApproverParty write fApproverParty;
      property LeaveStatus: TSQLStatusItem read fLeaveStatus write fLeaveStatus;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 19
  TSQLEmplLeaveType = class(TSQLRecord)
    private
      fParent: TSQLEmplLeaveType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmplLeaveType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 20
  TSQLPartyBenefit = class(TSQLRecord)
    private
      fPartyFrom: TSQLPartyRole;       //partyIdFrom, roleTypeIdFrom
      fPartyTo: TSQLPartyRole;       //partyIdTo, roleTypeIdTo
      fBenefitType: TSQLBenefitType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPeriodType: TSQLPeriodType;
      fCost: Currency;
      fActualEmployerPaidPercent: Double;
      fAvailableTime: Integer;
    published
      property PartyFrom: TSQLPartyRole read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyRole read fPartyTo write fPartyTo;
      property BenefitType: TSQLBenefitType read fBenefitType write fBenefitType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PeriodType: TSQLPeriodType read fPeriodType write fPeriodType;
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
      fEmployment: TSQLEmployment;    //roleTypeIdFrom, roleTypeIdTo, partyIdFrom, partyIdTo, emplFromDate
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSalaryStep: TSQLSalaryStep;    //salaryStepSeqId, payGradeId
      fPeriodType: TSQLPeriodType;
      fAmount: Currency;
      fComments: RawUTF8;
    published
      property Employment: TSQLEmployment read fEmployment write fEmployment;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SalaryStep: TSQLSalaryStep read fSalaryStep write fSalaryStep;
      property PeriodType: TSQLPeriodType read fPeriodType write fPeriodType;
      property Amount: Currency read fAmount write fAmount;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 23
  TSQLPayrollPreference = class(TSQLRecord)
    private
      fParty: TSQLPartyRole;               //partyId, roleTypeId
      fDeductionType: TSQLDeductionType;
      fPaymentMethodType: TSQLPaymentMethodType;
      fPeriodType: TSQLPeriodType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPercentage: Double;
      fFlatAmount: Currency;
      fRoutingNumber: RawUTF8;
      fAccountNumber: RawUTF8;
      fBankName: RawUTF8;
    published
      property Party: TSQLPartyRole read fParty write fParty;
      property DeductionType: TSQLDeductionType read fDeductionType write fDeductionType;
      property PaymentMethodType: TSQLPaymentMethodType read fPaymentMethodType write fPaymentMethodType;
      property PeriodType: TSQLPeriodType read fPeriodType write fPeriodType;
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
      fPayGrade: TSQLPayGrade;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fDateModified: TDateTime;
      fAmount: Currency;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property PayGrade: TSQLPayGrade read fPayGrade write fPayGrade;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property DateModified: TDateTime read fDateModified write fDateModified;
      property Amount: Currency read fAmount write fAmount;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
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
      fParent: TSQLTerminationType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLTerminationType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 27
  TSQLUnemploymentClaim = class(TSQLRecord)
    private
      fUnemploymentClaimDate: TDateTime;
      fDescription: RawUTF8;
      fStatus: TSQLStatusItem;
      fEmployment: TSQLEmployment;      //roleTypeIdFrom, roleTypeIdTo, partyIdFrom, partyIdTo, fromDate
      fThruDate: TDateTime;
    published
      property UnemploymentClaimDate: TDateTime read fUnemploymentClaimDate write fUnemploymentClaimDate;
      property Description: RawUTF8 read FDescription write FDescription;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Employment: TSQLEmployment read fEmployment write fEmployment;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 28
  TSQLEmplPosition = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fParty: TSQLParty;
      fBudget: TSQLBudgetItem;        //budgetId, budgetItemSeqId
      fEmplPositionType: TSQLEmplPositionType;
      fEstimatedFromDate: TDateTime;
      fEstimatedThruDate: TDateTime;
      fSalaryFlag: Boolean;
      fExemptFlag: Boolean;
      fFulltimeFlag: Boolean;
      fTemporaryFlag: Boolean;
      fActualFromDate: TDateTime;
      fActualThruDate: TDateTime;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property Party: TSQLParty read fParty write fParty;
      property Budget: TSQLBudgetItem read fBudget write fBudget;
      property EmplPositionType: TSQLEmplPositionType read fEmplPositionType write fEmplPositionType;
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
      fParent: TSQLEmplPositionClassType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmplPositionClassType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 30
  TSQLEmplPositionFulfillment = class(TSQLRecord)
    private
      fEmplPosition: TSQLEmplPosition;
      fParty: TSQLParty;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmplPosition: TSQLEmplPosition read fEmplPosition write fEmplPosition;
      property Party: TSQLParty read fParty write fParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 31
  TSQLEmplPositionReportingStruct = class(TSQLRecord)
    private
      fEmplPositionIdReportingTo: TSQLEmplPosition;
      fEmplPositionIdManagedBy: TSQLEmplPosition;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
      fPrimaryFlag: Boolean;
    published
      property EmplPositionIdReportingTo: TSQLEmplPosition read fEmplPositionIdReportingTo write fEmplPositionIdReportingTo;
      property EmplPositionIdManagedBy: TSQLEmplPosition read fEmplPositionIdManagedBy write fEmplPositionIdManagedBy;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
      property PrimaryFlag: Boolean read fPrimaryFlag write fPrimaryFlag;
  end;

  // 32
  TSQLEmplPositionResponsibility = class(TSQLRecord)
    private
      fEmplPosition: TSQLEmplPosition;
      fResponsibilityType: TSQLResponsibilityType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmplPosition: TSQLEmplPosition read fEmplPosition write fEmplPosition;
      property ResponsibilityType: TSQLResponsibilityType read fResponsibilityType write fResponsibilityType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 33
  TSQLEmplPositionType = class(TSQLRecord)
    private
      fParent: TSQLEmplPositionType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmplPositionType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 34
  TSQLEmplPositionTypeClass = class(TSQLRecord)
    private
      fEmplPositionType: TSQLEmplPositionType;
      fEmplPositionClassType: TSQLEmplPositionClassType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStandardHoursPerWeek: Double;
    published
      property EmplPositionType: TSQLEmplPositionType read fEmplPositionType write fEmplPositionType;
      property EmplPositionClassType: TSQLEmplPositionClassType read fEmplPositionClassType write fEmplPositionClassType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property StandardHoursPerWeek: Double read fStandardHoursPerWeek write fStandardHoursPerWeek;
  end;

  // 35
  TSQLValidResponsibility = class(TSQLRecord)
    private
      fEmplPositionType: TSQLEmplPositionType;
      fResponsibilityType: TSQLResponsibilityType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property EmplPositionType: TSQLEmplPositionType read fEmplPositionType write fEmplPositionType;
      property ResponsibilityType: TSQLResponsibilityType read fResponsibilityType write fResponsibilityType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 36
  TSQLEmplPositionTypeRate = class(TSQLRecord)
    private
      fEmplPositionType: TSQLEmplPositionType;
      fRateType: TSQLRateType;
      fSalaryStep: TSQLSalaryStep;            //payGradeId, salaryStepSeqId, fromDate
      fThruDate: TDateTime;
    published
      property EmplPositionType: TSQLEmplPositionType read fEmplPositionType write fEmplPositionType;
      property RateType: TSQLRateType read fRateType write fRateType;
      property SalaryStep: TSQLSalaryStep read fSalaryStep write fSalaryStep;
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
      fSkillType: TSQLSkillType;
      fNoOfResources: Integer;
      fJobPostingTypeEnum: TSQLEnumeration;
      fJobRequisitionDate: TDateTime;
      fExamTypeEnum: TSQLEnumeration;
      fRequiredOnDate: TDateTime;
    published
      property DurationMonths: Integer read fDurationMonths write fDurationMonths;
      property Age: Integer read fAge write fAge;
      property Gender: Boolean read fGender write fGender;
      property ExperienceMonths: Integer read fExperienceMonths write fExperienceMonths;
      property ExperienceYears: Integer read fExperienceYears write fExperienceYears;
      property Qualification: Integer read fQualification write fQualification;
      property JobLocation: Integer read fJobLocation write fJobLocation;
      property SkillType: TSQLSkillType read fSkillType write fSkillType;
      property NoOfResources: Integer read fNoOfResources write fNoOfResources;
      property JobPostingTypeEnum: TSQLEnumeration read fJobPostingTypeEnum write fJobPostingTypeEnum;
      property JobRequisitionDate: TDateTime read fJobRequisitionDate write fJobRequisitionDate;
      property ExamTypeEnum: TSQLEnumeration read fExamTypeEnum write fExamTypeEnum;
      property RequiredOnDate: TDateTime read fRequiredOnDate write fRequiredOnDate;
  end;

  // 38
  TSQLJobInterview = class(TSQLRecord)
    private
      fJobIntervieweeParty: TSQLParty;
      fJobRequisition: TSQLJobRequisition;
      fJobInterviewerParty: TSQLParty;
      fJobInterviewType: TSQLJobInterviewType;
      fGradeSecuredEnum: TSQLEnumeration;
      fJobInterviewResult: RawUTF8;
      fJobInterviewDate: TDateTime;
    published
      property JobIntervieweeParty: TSQLParty read fJobIntervieweeParty write fJobIntervieweeParty;
      property JobRequisition: TSQLJobRequisition read fJobRequisition write fJobRequisition;
      property JobInterviewerParty: TSQLParty read fJobInterviewerParty write fJobInterviewerParty;
      property JobInterviewType: TSQLJobInterviewType read fJobInterviewType write fJobInterviewType;
      property GradeSecuredEnum: TSQLEnumeration read fGradeSecuredEnum write fGradeSecuredEnum;
      property JobInterviewResult: RawUTF8 read fJobInterviewResult write fJobInterviewResult;
      property JobInterviewDate: TDateTime read fJobInterviewDate write fJobInterviewDate;
  end;

  // 39
  TSQLJobInterviewType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
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
      fParent: TSQLEmplLeaveReasonType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLEmplLeaveReasonType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

implementation

end.

