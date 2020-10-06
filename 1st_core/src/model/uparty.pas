unit uParty;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;

type
  // 1 附录
  TSQLAddendum = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项
      fAgreementItem: TSQLAgreementItemID;
      //创建日期
      fCreationDate: TDateTime;
      //生效日期
      fEffectiveDate: TDateTime;
      //附录文本
      fText: RawUTF8;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItem: TSQLAgreementItemID read fAgreementItem write fAgreementItem;
      property CreationDate: TDateTime read fCreationDate write fCreationDate;
      property EffectiveDate: TDateTime read fEffectiveDate write fEffectiveDate;
      property Text: RawUTF8 Read fText write fText;
  end;

  // 2 协议
  TSQLAgreement = class(TSQLRecord)
    private
      //产品
      fProduct: TSQLProductID;
      //源当事人
      fPartyFrom: TSQLPartyID;
      //目标当事人
      fPartyTo: TSQLPartyID;
      //源角色类型
      fRoleTypeFrom: TSQLRoleTypeID;
      //目标角色类型
      fRoleTypeTo: TSQLRoleTypeID;
      //协议类型
      fAgreementType: TSQLAgreementTypeID;
      //协议日期
      fAgreementDate: TDateTime;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //说明
      fDescription: RawUTF8;
      //协议内容
      fTextData: RawUTF8;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property PartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
      property RoleTypeFrom: TSQLRoleTypeID read fRoleTypeFrom write fRoleTypeFrom;
      property RoleTypeTo: TSQLRoleTypeID read fRoleTypeTo write fRoleTypeTo;
      property AgreementType: TSQLAgreementTypeID read fAgreementType write fAgreementType;
      property AgreementDate: TDateTime read fAgreementDate write fAgreementDate;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime Read fThruDate write fThruDate;
      property Description: RawUTF8 Read fDescription write fDescription;
      property TextData: RawUTF8 Read fTextData write fTextData;
  end;

  // 3 协议属性
  TSQLAgreementAttribute = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //属性名
      fAttrName: TSQLAgreementTypeAttrID;
      //属性值
      fAttrValue: RawUTF8;
      //说明
      fAttrDescription: RawUTF8;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AttrName: TSQLAgreementTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 4 协议地理应用
  TSQLAgreementGeographicalApplic = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项
      fAgreementItem: TSQLAgreementItemID;
      //地理
      fGeo: TSQLGeoID;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItem: TSQLAgreementItemID read fAgreementItem write fAgreementItem;
      property Geo: TSQLGeoID read fGeo write fGeo;
  end;

  // 5 协议项
  TSQLAgreementItem = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项类型
      fAgreementItemType: TSQLAgreementItemTypeID;
      //币种
      fCurrencyUom: TSQLUomID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //协议文本
      fAgreementText: RawUTF8;
      //协议影像
      fAgreementImage: TSQLRawBlob;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemType: TSQLAgreementItemTypeID read fAgreementItemType write fAgreementItemType;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property AgreementText: RawUTF8 read fAgreementText write fAgreementText;
      property AgreementImage: TSQLRawBlob read fAgreementImage write fAgreementImage;
  end;

  // 6 协议项属性
  TSQLAgreementItemAttribute = class(TSQLRecord)
  private
    //协议
    fAgreement: TSQLAgreementID;
    //协议项序号
    fAgreementItemSeq: Integer;
    //属性名
    fAttrName: TSQLAgreementItemTypeAttrID;
    //属性值
    fAttrValue: RawUTF8;
    //说明
    fAttrDescription: RawUTF8;
  published
    property Agreement: TSQLAgreementID read fAgreement write fAgreement;
    property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
    property AttrName: TSQLAgreementItemTypeAttrID read fAttrName write fAttrName;
    property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
    property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 7 协议项类型
  TSQLAgreementItemType = class(TSQLRecord)
    private
      fParent: TSQLAgreementItemTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLAgreementItemTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 8 协议项类型属性
  TSQLAgreementItemTypeAttr = class(TSQLRecord)
    private
      //协议项类型
      fAgreementItemType: TSQLAgreementItemTypeID;
      //属性名
      fAttrName: TSQLAgreementItemAttributeID;
      //说明
      FDescription: RawUTF8;
    published
      property AgreementItemType: TSQLAgreementItemTypeID read fAgreementItemType write fAgreementItemType;
      property AttrName: TSQLAgreementItemAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 9 协议内容
  TSQLAgreementContent = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //协议内容类型
      fAgreementContentType: TSQLAgreementContentTypeID;
      //内容
      fContent: TSQLContentID;
      //起始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property AgreementContentType: TSQLAgreementContentTypeID read fAgreementContentType write fAgreementContentType;
      property Content: TSQLContentID read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 10 协议内容类型
  TSQLAgreementContentType = class(TSQLRecord)
  private
    fParent: TSQLAgreementContentTypeID;
    fHasTable: Boolean;
    fName: RawUTF8;
    FDescription: RawUTF8;
  published
    property Parent: TSQLAgreementContentTypeID read fParent write fParent;
    property HasTable: Boolean read fHasTable write fHasTable;
    property Name: RawUTF8 read fName write fName;
    property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 11 协议当事人应用
  TSQLAgreementPartyApplic = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //当事人
      fParty: TSQLPartyID;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property Party: TSQLPartyID read fParty write fParty;
  end;

  // 12 协议产品应用
  TSQLAgreementProductAppl = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //产品
      fProduct: TSQLProductID;
      //价格
      fPrice: Currency;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property Price: Currency read fPrice write fPrice;
  end;

  // 13 协议促销应用
  TSQLAgreementPromoAppl = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //产品促销
      fProductPromo: TSQLProductPromoID;
      //起始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //序号
      fSequenceNum: Integer;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 14 协议设施应用
  TSQLAgreementFacilityAppl = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //设施
      fFacility: TSQLFacilityID;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property Facility: TSQLFacilityID read fFacility write fFacility;
  end;

  // 15 协议角色
  TSQLAgreementRole = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //当事人
      fParty: TSQLPartyID;
      //角色类型
      fRoleType: TSQLRoleTypeID;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 16 协议条款
  TSQLAgreementTerm = class(TSQLRecord)
    private
      //条款类型
      fTermType: TSQLTermTypeID;
      //协议
      fAgreement: TSQLAgreementID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //发票项类型
      fInvoiceItemType: TSQLInvoiceItemTypeID;
      //起始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //条款值
      fTermValue: Currency;
      //条款天数
      fTermDays: Integer;
      //条款内容
      fTextValue: RawUTF8;
      //最小数量
      fMinQuantity: Double;
      //最大数量
      fMaxQuantity: Double;
      //描述
      fDescription: RawUTF8;
    published
      property TermType: TSQLTermTypeID read fTermType write fTermType;
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property InvoiceItemType: TSQLInvoiceItemTypeID read fInvoiceItemType write fInvoiceItemType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property TermValue: Currency read fTermValue write fTermValue;
      property TermDays: Integer read fTermDays write fTermDays;
      property TextValue: RawUTF8 read fTextValue write fTextValue;
      property MinQuantity: Double read fMinQuantity write fMinQuantity;
      property MaxQuantity: Double read fMaxQuantity write fMaxQuantity;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 17 协议条款属性
  TSQLAgreementTermAttribute = class(TSQLRecord)
    private
      //条款
      fAgreementTerm: TSQLAgreementTermID;
      //属性名
      fAttrName: RawUTF8;
      //属性值
      fAttrValue: RawUTF8;
    published
      property AgreementTerm: TSQLAgreementTermID read fAgreementTerm write fAgreementTerm;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
  end;

  // 18 协议类型
  TSQLAgreementType = class(TSQLRecord)
    private
      fParent: TSQLAgreementTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
   published
     property Parent: TSQLAgreementTypeID read fParent write fParent;
     property HasTable: Boolean read fHasTable write fHasTable;
     property Name: RawUTF8 read fName write fName;
     property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 19 协议类型属性
  TSQLAgreementTypeAttr = class(TSQLRecord)
    private
      fAgreementType: TSQLAgreementTypeID;
      fAttrName: TSQLAgreementAttributeID;
      fDescription: RawUTF8;
    published
      property AgreementType: TSQLAgreementTypeID read fAgreementType write fAgreementType;
      property AttrName: TSQLAgreementAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 20 协议工作计划应用
  TSQLAgreementWorkEffortApplic = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreementID;
      //协议项序号
      fAgreementItemSeq: Integer;
      //工作计划
      fWorkEffort: TSQLWorkEffortID;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
  end;

  // 21 条款类型
  TSQLTermType = class(TSQLRecord)
    private
      fParent: TSQLTermTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
   published
     property Parent: TSQLTermTypeID read fParent write fParent;
     property HasTable: Boolean read fHasTable write fHasTable;
     property Name: RawUTF8 read fName write fName;
     property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 22 条款类型属性
  TSQLTermTypeAttr = class(TSQLRecord)
    private
      fTermType: TSQLTermTypeID;
      fAttrName: Integer;
      fDescription: RawUTF8;
    published
      property TermType: TSQLTermTypeID read fTermType write fTermType;
      property AttrName: Integer read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 23 协议雇佣应用
  TSQLAgreementEmploymentAppl = class(TSQLRecord)
    private
      fAgreement: TSQLAgreementID;
      fAgreementItemSeq: Integer;
      fPartyFrom: TSQLPartyID;
      fPartyTo: TSQLPartyID;
      fRoleTypeFrom: TSQLRoleTypeID;
      fRoleTypeTo: TSQLRoleTypeID;
      fAgreementDate: TDateTime;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Agreement: TSQLAgreementID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property PartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
      property RoleTypeFrom: TSQLRoleTypeID read fRoleTypeFrom write fRoleTypeFrom;
      property RoleTypeTo: TSQLRoleTypeID read fRoleTypeTo write fRoleTypeTo;
      property AgreementDate: TDateTime read fAgreementDate write fAgreementDate;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 24
  TSQLCommContentAssocType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 25
  TSQLCommEventContentAssoc = class(TSQLRecord)
    private
      fContent: TSQLContentID;
      fCommunicationEvent: TSQLCommunicationEventID;
      fCommContentAssocType: TSQLCommContentAssocTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Content: TSQLContentID read fContent write fContent;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
      property CommContentAssocType: TSQLCommContentAssocTypeID read fCommContentAssocType write fCommContentAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 26
  TSQLCommunicationEvent = class(TSQLRecord)
    private
      fCommunicationEventType: TSQLCommunicationEventTypeID;
      fOrigCommEvent: Integer;
      fParentCommEvent: Integer;
      fStatusItem: TSQLStatusItemID;
      fContactMechType: TSQLContactMechTypeID;
      fContactMechFrom: TSQLContactMechID;
      fContactMechTo: TSQLContactMechID;
      fRoleTypeFrom: TSQLRoleTypeID;
      fRoleTypeTo: TSQLRoleTypeID;
      fPartyFrom: TSQLPartyID;
      fPartyTo: TSQLPartyID;
      fEntryDate: TDateTime;
      fDatetimeStarted: TDateTime;
      fDatetimeEnded: TDateTime;
      fSubject: RawUTF8;
      fContentMimeType: TSQLMimeTypeID;
      fContent: RawUTF8;
      fNote: RawUTF8;
      fReasonEnum: TSQLEnumerationID;
      fContactList: TSQLContactListID;
      fHeaderString: RawUTF8;
      fFromString: RawUTF8;
      fToString: RawUTF8;
      fCCString: RawUTF8;
      fBCCString: RawUTF8;
      fMessage: RawUTF8;
     published
      property CommunicationEventType: TSQLCommunicationEventTypeID read fCommunicationEventType write fCommunicationEventType;
      property OrigCommEvent: Integer read fOrigCommEvent write fOrigCommEvent;
      property ParentCommEvent: Integer read fParentCommEvent write fParentCommEvent;
      property StatusItem: TSQLStatusItemID read fStatusItem write fStatusItem;
      property ContactMechType: TSQLContactMechTypeID read fContactMechType write fContactMechType;
      property ContactMechFrom: TSQLContactMechID read fContactMechFrom write fContactMechFrom;
      property ContactMechTo: TSQLContactMechID read fContactMechTo write fContactMechTo;
      property RoleTypeFrom: TSQLRoleTypeID read fRoleTypeFrom write fRoleTypeFrom;
      property RoleTypeTo: TSQLRoleTypeID read fRoleTypeTo write fRoleTypeTo;
      property RPartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property DatetimeStarted: TDateTime read fDatetimeStarted write fDatetimeStarted;
      property DatetimeEnded: TDateTime read fDatetimeEnded write fDatetimeEnded;
      property Subject: RawUTF8 read fSubject write fSubject;
      property ContentMimeType: TSQLMimeTypeID read fContentMimeType write fContentMimeType;
      property Content: RawUTF8 read fContent write fContent;
      property Note: RawUTF8 read fNote write fNote;
      property ReasonEnum: TSQLEnumerationID read fReasonEnum write fReasonEnum;
      property ContactList: TSQLContactListID read fContactList write fContactList;
      property HeaderString: RawUTF8 read fHeaderString write fHeaderString;
      property FromString: RawUTF8 read fContent write fContent;
      property ToString: RawUTF8 read fFromString write fFromString;
      property CCString: RawUTF8 read fCCString write fCCString;
      property BCCString: RawUTF8 read fBCCString write fBCCString;
      property Message: RawUTF8 read fMessage write fMessage;
  end;

  // 27
  TSQLCommunicationEventProduct = class(TSQLRecord)
    private
     fProduct: TSQLProductID;
     fCommunicationEvent: TSQLCommunicationEventID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
  end;

  // 28
  TSQLCommunicationEventPrpTyp = class(TSQLRecord)
    private
      fParent: TSQLCommunicationEventPrpTypID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLCommunicationEventPrpTypID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 29
  TSQLCommunicationEventPurpose = class(TSQLRecord)
    private
     fCommunicationEventPrpTyp: TSQLCommunicationEventPrpTypID;
     fCommunicationEvent: TSQLCommunicationEventID;
     fDescription: RawUTF8;
    published
      property CommunicationEventPrpTyp: TSQLCommunicationEventPrpTypID read fCommunicationEventPrpTyp write fCommunicationEventPrpTyp;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 30
  TSQLCommunicationEventRole = class(TSQLRecord)
    private
      fCommunicationEvent: TSQLCommunicationEventID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fContactMech: TSQLContactMechID;
      fStatusItem: TSQLStatusItemID;
    published
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property StatusItem: TSQLStatusItemID read fStatusItem write fStatusItem;
  end;

  // 31
  TSQLCommunicationEventType = class(TSQLRecord)
    private
      fParent: TSQLCommunicationEventPrpTypID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fContactMechType: TSQLContactMechTypeID;
    published
      property Parent: TSQLCommunicationEventPrpTypID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property ContactMechType: TSQLContactMechTypeID read fContactMechType write fContactMechType;
  end;

  // 32 联系机制
  TSQLContactMech = class(TSQLRecord)
    private
      fContactMechType: TSQLContactMechTypeID;
      fInfoString: RawUTF8;
    published
      property ContactMechType: TSQLContactMechTypeID read fContactMechType write fContactMechType;
      property InfoString: RawUTF8 read fInfoString write fInfoString;
  end;

  // 33 联系机制属性
  TSQLContactMechAttribute = class(TSQLRecord)
    private
      fContactMech: TSQLContactMechID;
      fAttrName: TSQLContactMechTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property AttrName: TSQLContactMechTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 34 联系机制链
  TSQLContactMechLink = class(TSQLRecord)
    private
      fContactMechFrom: TSQLContactMechID;
      fContactMechTo: TSQLContactMechID;
    published
      property ContactMechFrom: TSQLContactMechID read fContactMechFrom write fContactMechFrom;
      property ContactMechTo: TSQLContactMechID read fContactMechTo write fContactMechTo;
  end;

  // 35 联系机制用途类型
  TSQLContactMechPurposeType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 36 联系机制类型
  TSQLContactMechType = class(TSQLRecord)
    private
      fParent: TSQLContactMechTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLContactMechTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 37 联系机制类型属性
  TSQLContactMechTypeAttr = class(TSQLRecord)
    private
      fContactMechType: TSQLContactMechTypeID;
      fAttrName: TSQLContactMechAttributeID;
      fDescription: RawUTF8;
    published
      property ContactMechType: TSQLContactMechTypeID read fContactMechType write fContactMechType;
      property AttrName: TSQLContactMechAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 38 联系机制类型用途
  TSQLContactMechTypePurpose = class(TSQLRecord)
    private
      fContactMechType: TSQLContactMechTypeID;
      fContactMechPurposeType: TSQLContactMechPurposeTypeID;
    published
      property ContactMechType: TSQLContactMechTypeID read fContactMechType write fContactMechType;
      property ContactMechPurposeType: TSQLContactMechPurposeTypeID read fContactMechPurposeType write fContactMechPurposeType;
  end;

  // 39 电子邮件地址校验
  TSQLEmailAddressVerification = class(TSQLRecord)
    private
      fEmailAddress: RawUTF8;
      fVerifyHash: RawUTF8;
      fExpireDate: TDateTime;
    published
      property EmailAddress: RawUTF8 read fEmailAddress write fEmailAddress;
      property VerifyHash: RawUTF8 read fVerifyHash write fVerifyHash;
      property ExpireDate: TDateTime read fExpireDate write fExpireDate;
  end;

  // 40 当事人联系机制
  TSQLPartyContactMech = class(TSQLRecord)
    private
      //当事人
      fParty: TSQLPartyID;
      //联系机制
      fContactMech: TSQLContactMechID;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //角色类型
      fRoleType: TSQLPartyRoleID;
      //同意请求
      fAllowSolicitation: Boolean;
      //补充
      fExtension: RawUTF8;
      //已验证
      fVerified: Boolean;
      //备注
      fComments: RawUTF8;
      //联系方式的年数
      fYearsWithContactMech: Integer;
      //联系方式的月数
      fMonthsWithContactMech: Integer;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property RoleType: TSQLPartyRoleID read fRoleType write fRoleType;
      property AllowSolicitation: Boolean read fAllowSolicitation write fAllowSolicitation;
      property Extension: RawUTF8 read fExtension write fExtension;
      property Verified: Boolean read fVerified write fVerified;
      property Comments: RawUTF8 read fComments write fComments;
      property YearsWithContactMech: Integer read fYearsWithContactMech write fYearsWithContactMech;
      property MonthsWithContactMech: Integer read fMonthsWithContactMech write fMonthsWithContactMech;
  end;

  // 41 当事人联系机制用途
  TSQLPartyContactMechPurpose = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fContactMech: TSQLContactMechID;
      fContactMechPurposeType: TSQLContactMechPurposeTypeID;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property ContactMechPurposeType: TSQLContactMechPurposeTypeID read fContactMechPurposeType write fContactMechPurposeType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 42 邮政地址表
  TSQLPostalAddress = class(TSQLRecord)
    private
      ///联系机制
      fContactMech: TSQLContactMechID;
      //目标名称
      fToName: RawUTF8;
      //附加名称
      fAttnName: RawUTF8;
      fAddress1: RawUTF8;
      fAddress2: RawUTF8;
      //门牌号
      fHouseNumber: Integer;
      fHouseNumberExt: RawUTF8;
      fDirections: RawUTF8;
      fCity: RawUTF8;
      fCityGeo: TSQLGeoID;
      fPostalCode: RawUTF8;
      fPostalCodeExt: RawUTF8;
      fCountryGeo: TSQLGeoID;
      fStateProvinceGeo: TSQLGeoID;
      fCountyGeo: TSQLGeoID;
      fMunicipalityGeo: TSQLGeoID;
      fPostalCodeGeo: TSQLGeoID;
      fGeoPoint: TSQLGeoPointID;
    published
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property ToName: RawUTF8 read fToName write fToName;
      property AttnName: RawUTF8 read fAttnName write fAttnName;
      property Address1: RawUTF8 read fAddress1 write fAddress1;
      property Address2: RawUTF8 read fAddress2 write fAddress2;
      property HouseNumber: Integer read fHouseNumber write fHouseNumber;
      property HouseNumberExt: RawUTF8 read fHouseNumberExt write fHouseNumberExt;
      property Directions: RawUTF8 read fDirections write fDirections;
      property City: RawUTF8 read fCity write fCity;
      property CityGeo: TSQLGeoID read fCityGeo write fCityGeo;
      property PostalCode: RawUTF8 read fPostalCode write fPostalCode;
      property PostalCodeExt: RawUTF8 read fPostalCodeExt write fPostalCodeExt;
      property CountryGeo: TSQLGeoID read fCountryGeo write fCountryGeo;
      property StateProvinceGeo: TSQLGeoID read fStateProvinceGeo write fStateProvinceGeo;
      property CountyGeo: TSQLGeoID read fCountyGeo write fCountyGeo;
      property MunicipalityGeo: TSQLGeoID read fMunicipalityGeo write fMunicipalityGeo;
      property PostalCodeGeo: TSQLGeoID read fPostalCodeGeo write fPostalCodeGeo;
      property GeoPoint: TSQLGeoPointID read fGeoPoint write fGeoPoint;
  end;

  // 43 邮政地址范围
  TSQLPostalAddressBoundary = class(TSQLRecord)
    private
      fContactMech: TSQLPostalAddressID;
      fGeo: TSQLGeoID;
    published
      property ContactMech: TSQLPostalAddressID read fContactMech write fContactMech;
      property Geo: TSQLGeoID read fGeo write fGeo;
  end;

  // 44
  TSQLTelecomNumber = class(TSQLRecord)
    private
      fContactMech: TSQLContactMechID;
      fCountryCode: RawUTF8;
      fAreaCode: RawUTF8;
      fContactNumber: RawUTF8;
      //问候名称
      fAskForName: RawUTF8;
    published
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property CountryCode: RawUTF8 read fCountryCode write fCountryCode;
      property AreaCode: RawUTF8 read fAreaCode write fAreaCode;
      property ContactNumber: RawUTF8 read fContactNumber write fContactNumber;
      property AskForName: RawUTF8 read fAskForName write fAskForName;
  end;

  // 45 有效联系机制角色
  TSQLValidContactMechRole = class(TSQLRecord)
    private
      fRoleType: TSQLRoleTypeID;
      fContactMechType: TSQLContactMechTypeID;
    published
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property ContactMechType: TSQLContactMechTypeID read fContactMechType write fContactMechType;
  end;

  // 46
  TSQLNeedType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 47
  TSQLPartyNeed = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fPartyType: TSQLPartyTypeID;
      fNeedType: TSQLNeedTypeID;
      fCommunicationEvent: TSQLCommunicationEventID;
      fProduct: TSQLProductID;
      fProductCategory: TSQLProductCategoryID;
      fVisit: Integer;
      fDatetimeRecorded: TDateTime;
      fDescription: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property PartyType: TSQLPartyTypeID read fPartyType write fPartyType;
      property NeedType: TSQLNeedTypeID read fNeedType write fNeedType;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property Visit: Integer read fVisit write fVisit;
      property DatetimeRecorded: TDateTime read fDatetimeRecorded write fDatetimeRecorded;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 48 地址匹配映射
  TSQLAddressMatchMap = class(TSQLRecord)
    private
      //映射键
      fMapKey: RawUTF8;
      //映射值
      fMapValue: RawUTF8;
      //序号数字
      fSequenceNum: Integer;
    published
      property MapKey: RawUTF8 read fMapKey write fMapKey;
      property MapValue: RawUTF8 read fMapValue write fMapValue;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 49 联盟
  TSQLAffiliate = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      //联盟名称
      fAffiliateName: RawUTF8;
      //联盟描述
      fAffiliateDescription: RawUTF8;
      //创建的年份
      fYearEstablished: Integer;
      //站点类型
      fSiteType: RawUTF8;
      //站点页面显示
      fSitePageViews: RawUTF8;
      //站点访问者
      fSiteVisitors: RawUTF8;
      fDateTimeCreated: TDateTime;
      //批准日期时间
      fDateTimeApproved: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property AffiliateName: RawUTF8 read fAffiliateName write fAffiliateName;
      property AffiliateDescription: RawUTF8 read fAffiliateDescription write fAffiliateDescription;
      property YearEstablished: Integer read fYearEstablished write fYearEstablished;
      property SiteType: RawUTF8 read fSiteType write fSiteType;
      property SitePageViews: RawUTF8 read fSitePageViews write fSitePageViews;
      property SiteVisitors: RawUTF8 read fSiteVisitors write fSiteVisitors;
      property DateTimeCreated: TDateTime read fDateTimeCreated write fDateTimeCreated;
      property DateTimeApproved: TDateTime read fDateTimeApproved write fDateTimeApproved;
  end;

  // 50 当事人
  TSQLParty = class(TSQLRecord)
    private
      //当事人类型
      fPartyType: TSQLPartyTypeID;
      //外部标识
      fExternal: Integer;
      //优先使用币种
      fPreferredCurrencyUom: TSQLUomID;
      fDescription: RawUTF8;
      fStatus: TSQLStatusItemID;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
      //数据源
      fDataSource: TSQLDataSourceID;
      //是否没有人看的
      fIsUnread: Boolean;
    published
      property PartyType: TSQLPartyTypeID read fPartyType write fPartyType;
      property External: Integer read fExternal write fExternal;
      property PreferredCurrencyUom: TSQLUomID read fPreferredCurrencyUom write fPreferredCurrencyUom;
      property Description: RawUTF8 read fDescription write fDescription;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
      property IsUnread: Boolean read fIsUnread write fIsUnread;
  end;

  // 51
  TSQLPartyIdentification = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fPartyIdentificationType: TSQLPartyIdentificationTypeID;
      fIdValue: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property PartyIdentificationType: TSQLPartyIdentificationTypeID read fPartyIdentificationType write fPartyIdentificationType;
      property IdValue: RawUTF8 read fIdValue write fIdValue;
  end;

  // 52
  TSQLPartyIdentificationType = class(TSQLRecord)
    private
      fParent: TSQLPartyIdentificationTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyIdentificationTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 53 当事人地理位置
  TSQLPartyGeoPoint = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fGeoPoint: TSQLGeoPointID;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property GeoPoint: TSQLGeoPointID read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 54 当事人属性
  TSQLPartyAttribute = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fAttrName: TSQLPartyTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property AttrName: TSQLPartyTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 55 当事人承运账户
  TSQLPartyCarrierAccount = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      //送货人员
      fCarrierParty: TSQLPartyID;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //客户或用户的账号,有时也作为承运人编号
      fAccountNumber: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property CarrierParty: TSQLPartyID read fCarrierParty write fCarrierParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AccountNumber: RawUTF8 read fAccountNumber write fAccountNumber;
  end;

  // 56 当事人分类
  TSQLPartyClassification = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fPartyClassificationGroup: TSQLPartyClassificationGroupID;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property PartyClassificationGroup: TSQLPartyClassificationGroupID read fPartyClassificationGroup write fPartyClassificationGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 57 当事人分组
  TSQLPartyClassificationGroup = class(TSQLRecord)
    private
      fPartyClassificationType: TSQLPartyClassificationTypeID;
      fParentGroup: TSQLPartyClassificationGroupID;
      fDescription: RawUTF8;
    published
      property PartyClassificationType: TSQLPartyClassificationTypeID read fPartyClassificationType write fPartyClassificationType;
      property ParentGroup: TSQLPartyClassificationGroupID read fParentGroup write fParentGroup;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 58 当事人分类类型
  TSQLPartyClassificationType = class(TSQLRecord)
    private
      fParent: TSQLPartyClassificationTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyClassificationTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 59 当事人内容
  TSQLPartyContent = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fContent: TSQLContentID;
      fPartyContentType: TSQLPartyContentTypeID;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property Content: TSQLContentID read fContent write fContent;
      property PartyContentType: TSQLPartyContentTypeID read fPartyContentType write fPartyContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 60 当事人内容类型
  TSQLPartyContentType = class(TSQLRecord)
    private
      fParent: TSQLPartyContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Parent: TSQLPartyContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 61 当事人数据源
  TSQLPartyDataSource = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fDataSource: TSQLDataSourceID;
      fFromDate: TDateTime;
      //访问标识
      fVisit: RawUTF8;
      fComments: RawUTF8;
      //是否创建
      fIsCreate: Boolean;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property DataSource: TSQLDataSourceID read fDataSource write fDataSource;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property Visit: RawUTF8 read fVisit write fVisit;
      property Comments: RawUTF8 read fcomments write fcomments;
      property IsCreate: Boolean read fIsCreate write fIsCreate;
  end;

  // 62 组织
  TSQLPartyGroup = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fGroupName: RawUTF8;
      //组织名称本地语言
      fGroupNameLocal: RawUTF8;
      //办公地点
      fOfficeSiteName: RawUTF8;
      //年收入
      fAnnualRevenue: Currency;
      fNumEmployees: Integer;
      //股票代码
      fTickerSymbol: RawUTF8;
      fComments: RawUTF8;
      fLogoImageUrl: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property GroupName: RawUTF8 read fGroupName write fGroupName;
      property GroupNameLocal: RawUTF8 read fGroupNameLocal write fGroupNameLocal;
      property OfficeSiteName: RawUTF8 read fOfficeSiteName write fOfficeSiteName;
      property AnnualRevenue: Currency read fAnnualRevenue write fAnnualRevenue;
      property NumEmployees: Integer read fNumEmployees write fNumEmployees;
      property TickerSymbol: RawUTF8 read fTickerSymbol write fTickerSymbol;
      property Comments: RawUTF8 read fComments write fComments;
      property LogoImageUrl: RawUTF8 read fLogoImageUrl write fLogoImageUrl;
  end;

  // 63 当事人地址验证服务
  TSQLPartyIcsAvsOverride = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      //地址验证服务字符串
      fAvsDeclineString: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property AvsDeclineString: RawUTF8 read fAvsDeclineString write fAvsDeclineString;
  end;

  // 64 当事人邀请
  TSQLPartyInvitation = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fPartyFrom: TSQLPartyID;
      fToName: RawUTF8;
      fEmailAddress: RawUTF8;
      fStatus: TSQLStatusItemID;
      //最后邀请日期
      fLastInviteDate: TDateTime;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property PartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property ToName: RawUTF8 read fToName write fToName;
      property EmailAddress: RawUTF8 read fEmailAddress write fEmailAddress;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property LastInviteDate: TDateTime read fLastInviteDate write fLastInviteDate;
  end;

  // 65 当事人邀请组关联
  TSQLPartyInvitationGroupAssoc = class(TSQLRecord)
    private
      fPartyInvitation: TSQLPartyInvitationID;
      //目标当事人
      fPartyTo: TSQLPartyID;
    published
      property PartyInvitation: TSQLPartyInvitationID read fPartyInvitation write fPartyInvitation;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
  end;

  // 66 当事人邀请角色关联
  TSQLPartyInvitationRoleAssoc = class(TSQLRecord)
    private
      fPartyInvitation: TSQLPartyInvitationID;
      //角色类型
      fRoleType: TSQLRoleTypeID;
    published
      property PartyInvitation: TSQLPartyInvitationID read fPartyInvitation write fPartyInvitation;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 67 当事人名称历史
  TSQLPartyNameHistory = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fChangeDate: TDateTime;
      fGroupName: RawUTF8;
      fFirstName: RawUTF8;
      fMiddleName: RawUTF8;
      fLastName: RawUTF8;
      fPersonalTitle: RawUTF8;
      fSuffix: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property ChangeDate: TDateTime read fChangeDate write fChangeDate;
      property GroupName: RawUTF8 read fGroupName write fGroupName;
      property FirstName: RawUTF8 read fFirstName write fFirstName;
      property MiddleName: RawUTF8 read fMiddleName write fMiddleName;
      property LastName: RawUTF8 read fLastName write fLastName;
      property PersonalTitle: RawUTF8 read fPersonalTitle write fPersonalTitle;
      property Suffix: RawUTF8 read fSuffix write fSuffix;
  end;

  // 68 当事人注释
  TSQLPartyNote = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fNote: TSQLNoteDataID;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property Note: TSQLNoteDataID read fNote write fNote;
  end;

  // 69 当事人默认概况表
  TSQLPartyProfileDefault = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      //产品店铺
      fProductStore: TSQLProductStoreID;
      //缺省送货地址
      fDefaultShipAddr: RawUTF8;
      //缺省账单地址
      fDefaultBillAddr: RawUTF8;
      //缺省支付方式
      fDefaultPayMeth: RawUTF8;
      //缺省送货方式
      fDefaultShipMeth: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property DefaultShipAddr: RawUTF8 read fDefaultShipAddr write fDefaultShipAddr;
      property DefaultBillAddr: RawUTF8 read fDefaultBillAddr write fDefaultBillAddr;
      property DefaultPayMeth: RawUTF8 read fDefaultPayMeth write fDefaultPayMeth;
      property DefaultShipMeth: RawUTF8 read fDefaultShipMeth write fDefaultShipMeth;
  end;

  // 70 当事人关系
  TSQLPartyRelationship = class(TSQLRecord)
    private
      fPartyFrom: TSQLPartyID;
      fPartyTo: TSQLPartyID;
      fRoleTypeFrom: TSQLRoleTypeID;
      fRoleTypeTo: TSQLRoleTypeID;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      fStatus: TSQLStatusItemID;
      //当事人关系名称
      fRelationshipName: RawUTF8;
      //安全组
      fSecurityGroup: TSQLSecurityGroupID;
      //优先类型
      fPriorityType: TSQLPriorityTypeID;
      fPartyRelationshipType: TSQLPartyRelationshipTypeID;
      //权限枚举
      fPermissionsEnum: RawUTF8;
      //职位头衔
      fPositionTitle: RawUTF8;
      fComments: RawUTF8;
    published
      property PartyFrom: TSQLPartyID read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLPartyID read fPartyTo write fPartyTo;
      property RoleTypeFrom: TSQLRoleTypeID read fRoleTypeFrom write fRoleTypeFrom;
      property RoleTypeTo: TSQLRoleTypeID read fRoleTypeTo write fRoleTypeTo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property RelationshipName: RawUTF8 read fRelationshipName write fRelationshipName;
      property SecurityGroup: TSQLSecurityGroupID read fSecurityGroup write fSecurityGroup;
      property PriorityType: TSQLPriorityTypeID read fPriorityType write fPriorityType;
      property PartyRelationshipType: TSQLPartyRelationshipTypeID read fPartyRelationshipType write fPartyRelationshipType;
      property PermissionsEnum: RawUTF8 read fPermissionsEnum write fPermissionsEnum;
      property PositionTitle: RawUTF8 read fPositionTitle write fPositionTitle;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 71 当事人关系类型
  TSQLPartyRelationshipType = class(TSQLRecord)
    private
      fParentType: TSQLPartyRelationshipTypeID;
      fHasTable: Boolean;
      fPartyRelationshipName: RawUTF8;
      fDescription: RawUTF8;
      fRoleTypeIdValidFrom: TSQLRoleTypeID;
      fRoleTypeIdValidTo: TSQLRoleTypeID;
    published
      property ParentType: TSQLPartyRelationshipTypeID read fParentType write fParentType;
      property HasTable: Boolean read fHasTable write fHasTable;
      property PartyRelationshipName: RawUTF8 read fPartyRelationshipName write fPartyRelationshipName;
      property Description: RawUTF8 read fDescription write fDescription;
      property RoleTypeIdValidFrom: TSQLRoleTypeID read fRoleTypeIdValidFrom write fRoleTypeIdValidFrom;
      property RoleTypeIdValidTo: TSQLRoleTypeID read fRoleTypeIdValidTo write fRoleTypeIdValidTo;
  end;

  // 72 当事人角色
  TSQLPartyRole = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 73 当事人状态
  TSQLPartyStatus = class(TSQLRecord)
    private
      fStatus: TSQLStatusItemID;
      fParty: TSQLPartyID;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLoginID;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property Party: TSQLPartyID read fParty write fParty;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLoginID read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 74 当事人类型
  TSQLPartyType = class(TSQLRecord)
    private
      fParent: TSQLPartyTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 75 当事人类型属性
  TSQLPartyTypeAttr = class(TSQLRecord)
    private
      fPartyType: TSQLPartyTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property PartyType: TSQLPartyTypeID read fPartyType write fPartyType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 76
  TSQLPerson = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fSalutation: RawUTF8;
      fFirstName: RawUTF8;
      fMiddleName: RawUTF8;
      fLastName: RawUTF8;
      fPersonTitle: RawUTF8;
      fSuffix: RawUTF8;
      fNickName: RawUTF8;
      fFirstNameLocal: RawUTF8;
      fMiddleNameLocal: RawUTF8;
      fLastNameLocal: RawUTF8;
      fOtherLocal: RawUTF8;
      fMember: Integer;
      //性别
      fGender: Boolean;
      fBirthDate: TDateTime;
      fDeceasedDate: TDateTime;
      fHeight: Double;
      fWeight: Double;
      fMothersMaidenName: RawUTF8;
      fMaritalStatus: Boolean;
      fSocialSecurityNumber: RawUTF8;
      fPassportNumber: RawUTF8;
      fPassportExpireDate: TDateTime;
      fTotalYearsWorkExperience: Double;
      fComments: RawUTF8;
      //雇用状态枚举标识
      fEmploymentStatusEnum: TSQLEnumerationID;
      //居住状态枚举
      fResidenceStatusEnum: TSQLEnumerationID;
      fOccupation: RawUTF8;
      //雇用年数
      fYearsWithEmployer: Double;
      fMonthsWithEmployer: Double;
      fExistingCustomer: Boolean;
      fCard: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property Salutation: RawUTF8 read fSalutation write fSalutation;
      property FirstName: RawUTF8 read fFirstName write fFirstName;
      property MiddleName: RawUTF8 read fMiddleName write fMiddleName;
      property LastName: RawUTF8 read fLastName write fLastName;
      property PersonTitle: RawUTF8 read fPersonTitle write fPersonTitle;
      property Suffix: RawUTF8 read fSuffix write fSuffix;
      property NickName: RawUTF8 read fNickName write fNickName;
      property FirstNameLocal: RawUTF8 read fFirstNameLocal write fFirstNameLocal;
      property MiddleNameLocal: RawUTF8 read fMiddleNameLocal write fMiddleNameLocal;
      property LastNameLocal: RawUTF8 read fLastNameLocal write fLastNameLocal;
      property OtherLocal: RawUTF8 read fOtherLocal write fOtherLocal;
      property Member: Integer read fMember write fMember;
      property Gender: Boolean read fGender write fGender;
      property BirthDate: TDateTime read fBirthDate write fBirthDate;
      property DeceasedDate: TDateTime read fDeceasedDate write fDeceasedDate;
      property Height: Double read fHeight write fHeight;
      property Weight: Double read fWeight write fWeight;
      property MothersMaidenName: RawUTF8 read fMothersMaidenName write fMothersMaidenName;
      property MaritalStatus: Boolean read fMaritalStatus write fMaritalStatus;
      property SocialSecurityNumber: RawUTF8 read fSocialSecurityNumber write fSocialSecurityNumber;
      property PassportNumber: RawUTF8 read fPassportNumber write fPassportNumber;
      property PassportExpireDate: TDateTime read fPassportExpireDate write fPassportExpireDate;
      property TotalYearsWorkExperience: Double read fTotalYearsWorkExperience write fTotalYearsWorkExperience;
      property Comments: RawUTF8 read fComments write fComments;
      property EmploymentStatusEnum: TSQLEnumerationID read fEmploymentStatusEnum write fEmploymentStatusEnum;
      property ResidenceStatusEnum: TSQLEnumerationID read fResidenceStatusEnum write fResidenceStatusEnum;
      property Occupation: RawUTF8 read fOccupation write fOccupation;
      property YearsWithEmployer: Double read fYearsWithEmployer write fYearsWithEmployer;
      property MonthsWithEmployer: Double read fMonthsWithEmployer write fMonthsWithEmployer;
      property ExistingCustomer: Boolean read fExistingCustomer write fExistingCustomer;
      property Card: RawUTF8 read fCard write fCard;
  end;

  // 77 优先类型
  TSQLPriorityType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 78 角色类型
  TSQLRoleType = class(TSQLRecord)
    private
      fParent: TSQLRoleTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLRoleTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 79 角色类型属性
  TSQLRoleTypeAttr = class(TSQLRecord)
    private
      fRoleType: TSQLRoleTypeID;
      fAttrName: TSQLPartyAttributeID;
      FDescription: RawUTF8;
    published
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property AttrName: TSQLPartyAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 80 供应商
  TSQLVendor = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      ///公司名称
      fManifestCompanyName: RawUTF8;
      //公司称号
      fManifestCompanyTitle: RawUTF8;
      //LOGO网址
      fManifestLogoUrl: RawUTF8;
      //政策
      fManifestPolicies: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property ManifestCompanyName: RawUTF8 read fManifestCompanyName write fManifestCompanyName;
      property ManifestCompanyTitle: RawUTF8 read fManifestCompanyTitle write fManifestCompanyTitle;
      property ManifestLogoUrl: RawUTF8 read fManifestLogoUrl write fManifestLogoUrl;
      property ManifestPolicies: RawUTF8 read fManifestPolicies write fManifestPolicies;
  end;

implementation

uses
  Classes, SysUtils;

end.

