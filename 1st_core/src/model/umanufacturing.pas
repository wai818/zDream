unit uManufacturing;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLProductManufacturingRule = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fProductIdFor: TSQLProduct;
      fProductIdIn: TSQLProduct;
      fRuleSeqId: Integer;
      fProductIdInSubst: TSQLProduct;
      fProductFeature: TSQLProductFeature;
      fRuleOperator: Integer;
      fQuantity: Double;
      fDescription: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductIdFor: TSQLProduct read fProductIdFor write fProductIdFor;
      property ProductIdIn: TSQLProduct read fProductIdIn write fProductIdIn;
      property RuleSeqId: Integer read fRuleSeqId write fRuleSeqId;
      property ProductIdInSubst: TSQLProduct read fProductIdInSubst write fProductIdInSubst;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property RuleOperator: Integer read fRuleOperator write fRuleOperator;
      property Quantity: Double read fQuantity write fQuantity;
      property Description: RawUTF8 read fDescription write fDescription;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 2
  TSQLTechDataCalendar = class(TSQLRecord)
    private
      fCalendar: TSQLTechDataCalendar;
      fDescription: RawUTF8;
      fCalendarWeek: TSQLTechDataCalendarWeek;
    published
      property Calendar: TSQLTechDataCalendar read fCalendar write fCalendar;
      property Description: RawUTF8 read fDescription write fDescription;
      property CalendarWeek: TSQLTechDataCalendarWeek read fCalendarWeek write fCalendarWeek;
  end;

  // 3
  TSQLTechDataCalendarExcDay = class(TSQLRecord)
    private
      fCalendar: TSQLTechDataCalendar;
      fExceptionDateStartTime: TDateTime;
      fExceptionCapacity: Double;
      fUsedCapacity: Double;
      fDescription: RawUTF8;
    published
      property Calendar: TSQLTechDataCalendar read fCalendar write fCalendar;
      property ExceptionDateStartTime: TDateTime read fExceptionDateStartTime write fExceptionDateStartTime;
      property ExceptionCapacity: Double read fExceptionCapacity write fExceptionCapacity;
      property UsedCapacity: Double read fUsedCapacity write fUsedCapacity;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 4
  TSQLTechDataCalendarExcWeek = class(TSQLRecord)
    private
      fCalendar: TSQLTechDataCalendar;
      fExceptionDateStart: TDateTime;
      fCalendarWeek: TSQLTechDataCalendarWeek;
      fDescription: RawUTF8;
    published
      property Calendar: TSQLTechDataCalendar read fCalendar write fCalendar;
      property ExceptionDateStart: TDateTime read fExceptionDateStart write fExceptionDateStart;
      property CalendarWeek: TSQLTechDataCalendarWeek read fCalendarWeek write fCalendarWeek;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 5
  TSQLTechDataCalendarWeek = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fMondayStartTime: TDateTime;
      fMondayCapacity: Double;
      fTuesdayStartTime: TDateTime;
      fTuesdayCapacity: Double;
      fWednesdayStartTime: TDateTime;
      fWednesdayCapacity: Double;
      fThursdayStartTime: TDateTime;
      fThursdayCapacity: Double;
      fFridayStartTime: TDateTime;
      fFridayCapacity: Double;
      fSaturdayStartTime: TDateTime;
      fSaturdayCapacity: Double;
      fSundayStartTime: TDateTime;
      fSundayCapacity: TDateTime;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property MondayStartTime: TDateTime read fMondayStartTime write fMondayStartTime;
      property MondayCapacity: Double read fMondayCapacity write fMondayCapacity;
      property TuesdayStartTime: TDateTime read fTuesdayStartTime write fTuesdayStartTime;
      property TuesdayCapacity: Double read fTuesdayCapacity write fTuesdayCapacity;
      property WednesdayStartTime: TDateTime read fWednesdayStartTime write fWednesdayStartTime;
      property WednesdayCapacity: Double read fWednesdayCapacity write fWednesdayCapacity;
      property ThursdayStartTime: TDateTime read fThursdayStartTime write fThursdayStartTime;
      property ThursdayCapacity: Double read fThursdayCapacity write fThursdayCapacity;
      property FridayStartTime: TDateTime read fFridayStartTime write fFridayStartTime;
      property FridayCapacity: Double read fFridayCapacity write fFridayCapacity;
      property SaturdayStartTime: TDateTime read fSaturdayStartTime write fSaturdayStartTime;
      property SaturdayCapacity: Double read fSaturdayCapacity write fSaturdayCapacity;
      property SundayStartTime: TDateTime read fSundayStartTime write fSundayStartTime;
      property SundayCapacity: TDateTime read fSundayCapacity write fSundayCapacity;
  end;

  // 6
  TSQLMrpEventType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 7
  TSQLMrpEvent = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fEventDate: TDateTime;
      fMrpEventType: TSQLMrpEventType;
      fFacility: TSQLFacility;
      fQuantity: Double;
      fEventName: RawUTF8;
      fIsLate: Boolean;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property EventDate: TDateTime read fEventDate write fEventDate;
      property MrpEventType: TSQLMrpEventType read fMrpEventType write fMrpEventType;
      property Facility: TSQLFacility read fFacility write fFacility;
      property Quantity: Double read fQuantity write fQuantity;
      property EventName: RawUTF8 read fEventName write fEventName;
      property IsLate: Boolean read fIsLate write fIsLate;
  end;

implementation

end.

