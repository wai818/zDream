unit uShipment;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;//Classes, SysUtils;

type
  // 1
  TSQLItemIssuance = class(TSQLRecord)
    private
      fOrderId: TSQLOrderItem;
      //fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fInventoryItem: Integer;
      fShipment: TSQLShipmentItem;
      //fShipmentItemSeq: Integer;
      fFixedAsset: TSQLFixedAssetMaint;
      //fMaintHistSeq: Integer;
      fIssuedDateTime: TDateTime;
      fIssuedByUserLogin: TSQLUserLogin;
      fQuantity: Double;
      fCancelQuantity: Double;
    published
      property OrderId: TSQLOrderItem read fOrderId write fOrderId;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: Integer read fInventoryItem write fInventoryItem;
      property Shipment: TSQLShipmentItem read fShipment write fShipment;
      property FixedAsset: TSQLFixedAssetMaint read fFixedAsset write fFixedAsset;
      property IssuedDateTime: TDateTime read fIssuedDateTime write fIssuedDateTime;
      property IssuedByUserLogin: TSQLUserLogin read fIssuedByUserLogin write fIssuedByUserLogin;
      property Quantity: Double read fQuantity write fQuantity;
      property CancelQuantity: Double read fCancelQuantity write fCancelQuantity;
  end;

  // 2
  TSQLItemIssuanceRole = class(TSQLRecord)
    private
      fItemIssuance: TSQLItemIssuance;
      fPartyRole: TSQLPartyRole;          //partyId, roleTypeId
    published
      property ItemIssuance: TSQLItemIssuance read fItemIssuance write fItemIssuance;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
  end;

  // 3
  TSQLPicklist = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fFacility: TSQLFacility;
      fShipmentMethodType: TSQLShipmentMethodType;
      fStatus: TSQLStatusItem;
      fPicklistDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property Facility: TSQLFacility read fFacility write fFacility;
      property ShipmentMethodType: TSQLShipmentMethodType read fShipmentMethodType write fShipmentMethodType;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property PicklistDate: TDateTime read fPicklistDate write fPicklistDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 4
  TSQLPicklistBin = class(TSQLRecord)
    private
      fPicklist: TSQLPicklist;
      fBinLocationNumber: Integer;
      fPrimaryOrder: TSQLOrderHeader;
      fPrimaryShipGroupSeq: Integer;
    published
      property Picklist: TSQLPicklist read fPicklist write fPicklist;
      property BinLocationNumber: Integer read fBinLocationNumber write fBinLocationNumber;
      property PrimaryOrder: TSQLOrderHeader read fPrimaryOrder write fPrimaryOrder;
      property PrimaryShipGroupSeq: Integer read fPrimaryShipGroupSeq write fPrimaryShipGroupSeq;
  end;

  // 5
  TSQLPicklistItem = class(TSQLRecord)
    private
      fPicklistBin: TSQLPicklistBin;
      fOrderId: TSQLOrderHeader;
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fInventoryItem: TSQLInventoryItem;
      fStatusItem: TSQLStatusItem;
      fQuantity: Double;
    published
      property PicklistBin: TSQLPicklistBin read fPicklistBin write fPicklistBin;
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property StatusItem: TSQLStatusItem read fStatusItem write fStatusItem;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 6
  TSQLPicklistRole = class(TSQLRecord)
    private
      fPicklist: TSQLPicklist;
      fPartyRole: TSQLPartyRole;               //partyId, roleTypeId
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property Picklist: TSQLPicklist read fPicklist write fPicklist;
      property PartyRole: TSQLPartyRole read fPartyRole write fPartyRole;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 7
  TSQLPicklistStatusHistory = class(TSQLRecord)
    private
    published
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
      property  read  write ;
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

