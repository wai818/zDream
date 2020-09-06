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

