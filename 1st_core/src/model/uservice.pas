unit uService;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLJobSandbox = class(TSQLRecord)
    private
      fJobId: Integer;
      fJobName: RawUTF8;
      fRunTime: TDateTime;
      fPoolId: Integer;
      fStatus: TSQLStatusItemID;
      fParentJobId: Integer;
      fPreviousJobId: Integer;
      fServiceName: RawUTF8;
      fLoaderName: RawUTF8;
      fMaxRetry: Integer;
      fCurrentRetryCount: Integer;
      fAuthUserLogin: TSQLUserLoginID;
      fRunAsUser: TSQLUserLoginID;
      fRuntimeData: TSQLRuntimeDataID;
      fRecurrenceInfo: TSQLRecurrenceInfoID;
      fTempExpr: TSQLTemporalExpressionID;
      fCurrentRecurrenceCount: Integer;
      fMaxRecurrenceCount: Integer;
      fRunByInstanceId: Integer;
      fStartDateTime: TDateTime;
      fFinishDateTime: TDateTime;
      fCancelDateTime: TDateTime;
      fJobResult: RawUTF8;
    published
      property JobId: Integer read fJobId write fJobId;
      property JobName: RawUTF8 read fJobName write fJobName;
      property RunTime: TDateTime read fRunTime write fRunTime;
      property PoolId: Integer read fPoolId write fPoolId;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property ParentJobId: Integer read fParentJobId write fParentJobId;
      property PreviousJobId: Integer read fPreviousJobId write fPreviousJobId;
      property ServiceName: RawUTF8 read fServiceName write fServiceName;
      property LoaderName: RawUTF8 read fLoaderName write fLoaderName;
      property MaxRetry: Integer read fMaxRetry write fMaxRetry;
      property CurrentRetryCount: Integer read fCurrentRetryCount write fCurrentRetryCount;
      property AuthUserLogin: TSQLUserLoginID read fAuthUserLogin write fAuthUserLogin;
      property RunAsUser: TSQLUserLoginID read fRunAsUser write fRunAsUser;
      property RuntimeData: TSQLRuntimeDataID read fRuntimeData write fRuntimeData;
      property RecurrenceInfo: TSQLRecurrenceInfoID read fRecurrenceInfo write fRecurrenceInfo;
      property TempExpr: TSQLTemporalExpressionID read fTempExpr write fTempExpr;
      property CurrentRecurrenceCount: Integer read fCurrentRecurrenceCount write fCurrentRecurrenceCount;
      property MaxRecurrenceCount: Integer read fMaxRecurrenceCount write fMaxRecurrenceCount;
      property RunByInstanceId: Integer read fRunByInstanceId write fRunByInstanceId;
      property StartDateTime: TDateTime read fStartDateTime write fStartDateTime;
      property FinishDateTime: TDateTime read fFinishDateTime write fFinishDateTime;
      property CancelDateTime: TDateTime read fCancelDateTime write fCancelDateTime;
      property JobResult: RawUTF8 read fJobResult write fJobResult;
  end;

  // 2
  TSQLRecurrenceInfo = class(TSQLRecord)
    private
      fStartDateTime: TDateTime;
      fExceptionDateTimes: Integer;
      fRecurrenceDateTimes: Integer;
      fExceptionRule: TSQLRecurrenceRuleID;
      fRecurrenceRule: TSQLRecurrenceRuleID;
      fRecurrenceCount: Integer;
    published
      property StartDateTime: TDateTime read fStartDateTime write fStartDateTime;
      property ExceptionDateTimes: Integer read fExceptionDateTimes write fExceptionDateTimes;
      property RecurrenceDateTimes: Integer read fRecurrenceDateTimes write fRecurrenceDateTimes;
      property ExceptionRule: TSQLRecurrenceRuleID read fExceptionRule write fExceptionRule;
      property RecurrenceRule: TSQLRecurrenceRuleID read fRecurrenceRule write fRecurrenceRule;
      property RecurrenceCount: Integer read fRecurrenceCount write fRecurrenceCount;
  end;

  // 3
  TSQLRecurrenceRule = class(TSQLRecord)
    private
      fFrequency: RawUTF8;
      fUntilDateTime: TDateTime;
      fCountNumber: Integer;
      fIntervalNumber: Integer;
      fBySecondList: RawUTF8;
      fByMinuteList: RawUTF8;
      fByHourList: RawUTF8;
      fByDayList: RawUTF8;
      fByMonthDayList: RawUTF8;
      fByYearDayList: RawUTF8;
      fByWeekNoList: RawUTF8;
      fByMonthList: RawUTF8;
      fBySetPosList: RawUTF8;
      fWeekStart: RawUTF8;
      fXName: RawUTF8;
    published
      property Frequency: RawUTF8 read fFrequency write fFrequency;
      property UntilDateTime: TDateTime read fUntilDateTime write fUntilDateTime;
      property CountNumber: Integer read fCountNumber write fCountNumber;
      property IntervalNumber: Integer read fIntervalNumber write fIntervalNumber;
      property BySecondList: RawUTF8 read fBySecondList write fBySecondList;
      property ByMinuteList: RawUTF8 read fByMinuteList write fByMinuteList;
      property ByHourList: RawUTF8 read fByHourList write fByHourList;
      property ByDayList: RawUTF8 read fByDayList write fByDayList;
      property ByMonthDayList: RawUTF8 read fByMonthDayList write fByMonthDayList;
      property ByYearDayList: RawUTF8 read fByYearDayList write fByYearDayList;
      property ByWeekNoList: RawUTF8 read fByWeekNoList write fByWeekNoList;
      property ByMonthList: RawUTF8 read fByMonthList write fByMonthList;
      property BySetPosList: RawUTF8 read fBySetPosList write fBySetPosList;
      property WeekStart: RawUTF8 read fWeekStart write fWeekStart;
      property XName: RawUTF8 read fXName write fXName;
  end;

  // 3
  TSQLRuntimeData = class(TSQLRecord)
    private
      fRuntimeInfo: RawUTF8;
    published
      property RuntimeInfo: RawUTF8 read fRuntimeInfo write fRuntimeInfo;
  end;

  // 4
  TSQLTemporalExpression = class(TSQLRecord)
    private
      fTempExprTypeId: Integer;
      fDescription: RawUTF8;
      fDate1: TDateTime;
      fDate2: TDateTime;
      fInteger1: Integer;
      fInteger2: Integer;
      fString1: RawUTF8;
      fString2: RawUTF8;
    published
      property TempExprTypeId: Integer read fTempExprTypeId write fTempExprTypeId;
      property Description: RawUTF8 read fDescription write fDescription;
      property Date1: TDateTime read fDate1 write fDate1;
      property Date2: TDateTime read fDate2 write fDate2;
      property Integer1: Integer read fInteger1 write fInteger1;
      property Integer2: Integer read fInteger2 write fInteger2;
      property String1: RawUTF8 read fString1 write fString1;
      property String2: RawUTF8 read fString2 write fString2;
  end;

  // 5
  TSQLTemporalExpressionAssoc = class(TSQLRecord)
    private
      fFromTempExpr: TSQLTemporalExpressionID;
      fToTempExpr: TSQLTemporalExpressionID;
      fExprAssocType: Integer;
    published
      property FromTempExpr: TSQLTemporalExpressionID read fFromTempExpr write fFromTempExpr;
      property ToTempExpr: TSQLTemporalExpressionID read fToTempExpr write fToTempExpr;
      property ExprAssocType: Integer read fExprAssocType write fExprAssocType;
  end;

  // 6
  TSQLJobManagerLock = class(TSQLRecord)
    private
      fInstanceId: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fReasonEnum: TSQLEnumerationID;
      fComments: RawUTF8;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property InstanceId: Integer read fInstanceId write fInstanceId;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ReasonEnum: TSQLEnumerationID read fReasonEnum write fReasonEnum;
      property Comments: RawUTF8 read fComments write fComments;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 7
  TSQLServiceSemaphore = class(TSQLRecord)
    private
      fServiceName: RawUTF8;
      fLockedByInstanceId: Integer;
      fLockThread: RawUTF8;
      fLockTime: TDateTime;
    published
      property ServiceName: RawUTF8 read fServiceName write fServiceName;
      property LockedByInstanceId: Integer read fLockedByInstanceId write fLockedByInstanceId;
      property LockThread: RawUTF8 read fLockThread write fLockThread;
      property LockTime: TDateTime read fLockTime write fLockTime;
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

