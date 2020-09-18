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
      fAgreement: TSQLAgreement;
      //协议项
      fAgreementItem: TSQLAgreementItem;
      //创建日期
      fCreationDate: TDateTime;
      //生效日期
      fEffectiveDate: TDateTime;
      //附录文本
      fText: RawUTF8;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItem: TSQLAgreementItem read fAgreementItem write fAgreementItem;
      property CreationDate: TDateTime read fCreationDate write fCreationDate;
      property EffectiveDate: TDateTime read fEffectiveDate write fEffectiveDate;
      property Text: RawUTF8 Read fText write fText;
  end;

  // 2 协议
  TSQLAgreement = class(TSQLRecord)
    private
      //产品
      //fProduct: TSQLProduct;
      //源当事人
      fPartyFrom: TSQLParty;
      //目标当事人
      fPartyTo: TSQLParty;
      //源角色类型
      //fRoleTypeFrom: TSQLRoleType;
      //目标角色类型
      //fRoleTypeTo: TSQLRoleType;
      //协议类型
      fAgreementType: TSQLAgreementType;
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
      //property Product: TSQLProduct read fProduct write fProduct;
      property PartyFrom: TSQLParty read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLParty read fPartyTo write fPartyTo;
      //property RoleTypeFrom: TSQLRoleType read fRoleTypeFrom write fRoleTypeFrom;
      //property RoleTypeTo: TSQLRoleType read fRoleTypeTo write fRoleTypeTo;
      property AgreementType: TSQLAgreementType read fAgreementType write fAgreementType;
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
      fAgreement: TSQLAgreement;
      //属性名
      fAttrName: TSQLAgreementTypeAttr;
      //属性值
      fAttrValue: RawUTF8;
      //说明
      fAttrDescription: RawUTF8;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AttrName: TSQLAgreementTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 4 协议地理应用
  TSQLAgreementGeographicalApplic = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项
      fAgreementItem: TSQLAgreementItem;
      //地理
      //fGeo: TSQLGeo;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItem: TSQLAgreementItem read fAgreementItem write fAgreementItem;
      //property Geo: TSQLGeo read fGeo write fGeo;
  end;

  // 5 协议项
  TSQLAgreementItem = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项类型
      fAgreementItemType: TSQLAgreementItemType;
      //币种
      //fCurrencyUom: TSQLCurrencyUom;
      //协议项序号
      fAgreementItemSeq: Integer;
      //协议文本
      fAgreementText: RawUTF8;
      //协议影像
      fAgreementImage: TSQLRawBlob;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemType: TSQLAgreementItemType read fAgreementItemType write fAgreementItemType;
      //property CurrencyUom: TSQLCurrencyUom read fCurrencyUom write fCurrencyUom;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property AgreementText: RawUTF8 read fAgreementText write fAgreementText;
      property AgreementImage: TSQLRawBlob read fAgreementImage write fAgreementImage;
  end;

  // 6 协议项属性
  TSQLAgreementItemAttribute = class(TSQLRecord)
  private
    //协议
    fAgreement: TSQLAgreement;
    //协议项序号
    fAgreementItemSeq: Integer;
    //属性名
    fAttrName: TSQLAgreementItemTypeAttr;
    //属性值
    fAttrValue: RawUTF8;
    //说明
    fAttrDescription: RawUTF8;
  published
    property Agreement: TSQLAgreement read fAgreement write fAgreement;
    property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
    property AttrName: TSQLAgreementItemTypeAttr read fAttrName write fAttrName;
    property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
    property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 7 协议项类型
  TSQLAgreementItemType = class(TSQLRecord)
    private
      fParent: TSQLAgreementItemType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLAgreementItemType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 8 协议项类型属性
  TSQLAgreementItemTypeAttr = class(TSQLRecord)
    private
      //协议项类型
      fAgreementItemType: TSQLAgreementItemType;
      //属性名
      fAttrName: TSQLAgreementItemAttribute;
      //说明
      FDescription: RawUTF8;
    published
      property AgreementItemType: TSQLAgreementItemType read fAgreementItemType write fAgreementItemType;
      property AttrName: TSQLAgreementItemAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 9 协议内容
  TSQLAgreementContent = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项序号
      fAgreementItemSeq: Integer;
      //协议内容类型
      fAgreementContentType: TSQLAgreementContentType;
      //内容
      //fContent: TSQLContent;
      //起始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property AgreementContentType: TSQLAgreementContentType read fAgreementContentType write fAgreementContentType;
      //property Content: TSQLContent read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 10 协议内容类型
  TSQLAgreementContentType = class(TSQLRecord)
  private
    fParent: TSQLAgreementContentType;
    fHasTable: Boolean;
    fName: RawUTF8;
    FDescription: RawUTF8;
  published
    property Parent: TSQLAgreementContentType read fParent write fParent;
    property HasTable: Boolean read fHasTable write fHasTable;
    property Name: RawUTF8 read fName write fName;
    property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 11 协议当事人应用
  TSQLAgreementPartyApplic = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项序号
      fAgreementItemSeq: Integer;
      //当事人
      fParty: TSQLParty;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property Party: TSQLParty read fParty write fParty;
  end;

  // 12 协议产品应用
  TSQLAgreementProductAppl = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项序号
      fAgreementItemSeq: Integer;
      //产品
      //fProduct: TSQLProduct;
      //价格
      fPrice: Currency;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      //property Product: TSQLProduct read fProduct write fProduct;
      property Price: Currency read fPrice write fPrice;
  end;

  // 13 协议促销应用
  TSQLAgreementPromoAppl = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项序号
      fAgreementItemSeq: Integer;
      //产品促销
      //fProductPromo: TSQLProductPromo;
      //起始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //序号
      fSequenceNum: Integer;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      //property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 14 协议设施应用
  TSQLAgreementFacilityAppl = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项序号
      fAgreementItemSeq: Integer;
      //设施
      //fFacility: TSQLFacility;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      //property Facility: TSQLFacility read fFacility write fFacility;
  end;

  // 15 协议角色
  TSQLAgreementRole = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //当事人
      fParty: TSQLParty;
      //角色类型
      //fRoleType: TSQLRoleType;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property Party: TSQLParty read fParty write fParty;
      //property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 16 协议条款
  TSQLAgreementTerm = class(TSQLRecord)
    private
      //条款类型
      fTermType: TSQLTermType;
      //协议
      fAgreement: TSQLAgreement;
      //协议项序号
      fAgreementItemSeq: Integer;
      //发票项类型
      //fInvoiceItemType: TSQLInvoiceItemType;
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
      property TermType: TSQLTermType read fTermType write fTermType;
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      //property InvoiceItemType: TSQLInvoiceItemType read fInvoiceItemType write fInvoiceItemType;
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
      fAgreementTerm: TSQLAgreementTerm;
      //属性名
      fAttrName: RawUTF8;
      //属性值
      fAttrValue: RawUTF8;
    published
      property AgreementTerm: TSQLAgreementTerm read fAgreementTerm write fAgreementTerm;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
  end;

  // 18 协议类型
  TSQLAgreementType = class(TSQLRecord)
    private
      fParent: TSQLAgreementType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
   published
     property Parent: TSQLAgreementType read fParent write fParent;
     property HasTable: Boolean read fHasTable write fHasTable;
     property Name: RawUTF8 read fName write fName;
     property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 19 协议类型属性
  TSQLAgreementTypeAttr = class(TSQLRecord)
    private
      fAgreementType: TSQLAgreementType;
      fAttrName: TSQLAgreementAttribute;
      fDescription: RawUTF8;
    published
      property AgreementType: TSQLAgreementType read fAgreementType write fAgreementType;
      property AttrName: TSQLAgreementAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 20 协议工作计划应用
  TSQLAgreementWorkEffortApplic = class(TSQLRecord)
    private
      //协议
      fAgreement: TSQLAgreement;
      //协议项序号
      fAgreementItemSeq: Integer;
      //工作计划
      //fWorkEffort: TSQLWorkEffort;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      //property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
  end;

  // 21 条款类型
  TSQLTermType = class(TSQLRecord)
    private
      fParent: TSQLTermType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
   published
     property Parent: TSQLTermType read fParent write fParent;
     property HasTable: Boolean read fHasTable write fHasTable;
     property Name: RawUTF8 read fName write fName;
     property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 22 条款类型属性
  TSQLTermTypeAttr = class(TSQLRecord)
    private
      fTermType: TSQLTermType;
      fAttrName: Integer;
      fDescription: RawUTF8;
    published
      property TermType: TSQLTermType read fTermType write fTermType;
      property AttrName: Integer read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 23 协议雇佣应用
  TSQLAgreementEmploymentAppl = class(TSQLRecord)
    private
      fAgreement: TSQLAgreement;
      fAgreementItemSeq: Integer;
      fPartyFrom: TSQLParty;
      fPartyTo: TSQLParty;
      //fRoleTypeFrom: TSQLRoleType;
      //fRoleTypeTo: TSQLRoleType;
      fAgreementDate: TDateTime;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Agreement: TSQLAgreement read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property PartyFrom: TSQLParty read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLParty read fPartyTo write fPartyTo;
      //property RoleTypeFrom: TSQLRoleType read fRoleTypeFrom write fRoleTypeFrom;
      //property RoleTypeTo: TSQLRoleType read fRoleTypeTo write fRoleTypeTo;
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
      //fContent: TSQLContent;
      fCommunicationEvent: TSQLCommunicationEvent;
      fCommContentAssocType: TSQLCommContentAssocType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      //property Content: TSQLContent read fContent write fContent;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
      property CommContentAssocType: TSQLCommContentAssocType read fCommContentAssocType write fCommContentAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 26
  TSQLCommunicationEvent = class(TSQLRecord)
    private
      fCommunicationEventType: TSQLCommunicationEventType;
      fOrigCommEvent: Integer;
      fParentCommEvent: Integer;
      //fStatusItem: TSQLStatusItem;
      fContactMechType: TSQLContactMechType;
      fContactMechFrom: TSQLContactMech;
      fContactMechTo: TSQLContactMech;
      //fRoleTypeFrom: TSQLRoleType;
      //fRoleTypeTo: TSQLRoleType;
      fPartyFrom: TSQLParty;
      fPartyTo: TSQLParty;
      fEntryDate: TDateTime;
      fDatetimeStarted: TDateTime;
      fDatetimeEnded: TDateTime;
      fSubject: RawUTF8;
      //fContentMimeType: TSQLMimeType;
      fContent: RawUTF8;
      fNote: RawUTF8;
      //fReasonEnum: TSQLEnumeration;
      //fContactList: TSQLContactList;
      fHeaderString: RawUTF8;
      fFromString: RawUTF8;
      fToString: RawUTF8;
      fCCString: RawUTF8;
      fBCCString: RawUTF8;
      fMessage: RawUTF8;
     published
      property CommunicationEventType: TSQLCommunicationEventType read fCommunicationEventType write fCommunicationEventType;
      property OrigCommEvent: Integer read fOrigCommEvent write fOrigCommEvent;
      property ParentCommEvent: Integer read fParentCommEvent write fParentCommEvent;
      //property StatusItem: TSQLStatusItem read fStatusItem write fStatusItem;
      property ContactMechType: TSQLContactMechType read fContactMechType write fContactMechType;
      property ContactMechFrom: TSQLContactMech read fContactMechFrom write fContactMechFrom;
      property ContactMechTo: TSQLContactMech read fContactMechTo write fContactMechTo;
      //property RoleTypeFrom: TSQLRoleType read fRoleTypeFrom write fRoleTypeFrom;
      //property RoleTypeTo: TSQLRoleType read fRoleTypeTo write fRoleTypeTo;
      property RPartyFrom: TSQLParty read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLParty read fPartyTo write fPartyTo;
      property EntryDate: TDateTime read fEntryDate write fEntryDate;
      property DatetimeStarted: TDateTime read fDatetimeStarted write fDatetimeStarted;
      property DatetimeEnded: TDateTime read fDatetimeEnded write fDatetimeEnded;
      property Subject: RawUTF8 read fSubject write fSubject;
      //property ContentMimeType: TSQLMimeType read fContentMimeType write fContentMimeType;
      property Content: RawUTF8 read fContent write fContent;
      property Note: RawUTF8 read fNote write fNote;
      //property ReasonEnum: TSQLEnumeration read fReasonEnum write fReasonEnum;
      //property ContactList: TSQLContactList read fContactList write fContactList;
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
     //fProduct: TSQLProduct;
     fCommunicationEvent: TSQLCommunicationEvent;
    published
      //property Product: TSQLProduct read fProduct write fProduct;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
  end;

  // 28
  TSQLCommunicationEventPrpTyp = class(TSQLRecord)
    private
      fParent: TSQLCommunicationEventPrpTyp;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLCommunicationEventPrpTyp read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 29
  TSQLCommunicationEventPurpose = class(TSQLRecord)
    private
     fCommunicationEventPrpTyp: TSQLCommunicationEventPrpTyp;
     fCommunicationEvent: TSQLCommunicationEvent;
     fDescription: RawUTF8;
    published
      property CommunicationEventPrpTyp: TSQLCommunicationEventPrpTyp read fCommunicationEventPrpTyp write fCommunicationEventPrpTyp;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 30
  TSQLCommunicationEventRole = class(TSQLRecord)
    private
     fCommunicationEvent: TSQLCommunicationEvent;
     fParty: TSQLParty;
     //fRoleType: TSQLRoleType;
     fContactMech: TSQLContactMech;
     //fStatusItem: TSQLStatusItem;
    published
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
      property Party: TSQLParty read fParty write fParty;
      //property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      //property StatusItem: TSQLStatusItem read fStatusItem write fStatusItem;
  end;

  // 31
  TSQLCommunicationEventType = class(TSQLRecord)
    private
      fParent: TSQLCommunicationEventPrpTyp;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
      fContactMechType: TSQLContactMechType;
    published
      property Parent: TSQLCommunicationEventPrpTyp read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
      property ContactMechType: TSQLContactMechType read fContactMechType write fContactMechType;
  end;

  // 32 联系机制
  TSQLContactMech = class(TSQLRecord)
    private
      fContactMechType: TSQLContactMechType;
      fInfoString: RawUTF8;
    published
      property ContactMechType: TSQLContactMechType read fContactMechType write fContactMechType;
      property InfoString: RawUTF8 read fInfoString write fInfoString;
  end;

  // 33 联系机制属性
  TSQLContactMechAttribute = class(TSQLRecord)
    private
      fContactMech: TSQLContactMech;
      fAttrName: TSQLContactMechTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property AttrName: TSQLContactMechTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 34 联系机制链
  TSQLContactMechLink = class(TSQLRecord)
    private
      fContactMechFrom: TSQLContactMech;
      fContactMechTo: TSQLContactMech;
    published
      property ContactMechFrom: TSQLContactMech read fContactMechFrom write fContactMechFrom;
      property ContactMechTo: TSQLContactMech read fContactMechTo write fContactMechTo;
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
      fParent: TSQLContactMechType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLContactMechType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 37 联系机制类型属性
  TSQLContactMechTypeAttr = class(TSQLRecord)
    private
      fContactMechType: TSQLContactMechType;
      fAttrName: TSQLContactMechAttribute;
      fDescription: RawUTF8;
    published
      property ContactMechType: TSQLContactMechType read fContactMechType write fContactMechType;
      property AttrName: TSQLContactMechAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 38 联系机制类型用途
  TSQLContactMechTypePurpose = class(TSQLRecord)
    private
      fContactMechType: TSQLContactMechType;
      fContactMechPurposeType: TSQLContactMechPurposeType;
    published
      property ContactMechType: TSQLContactMechType read fContactMechType write fContactMechType;
      property ContactMechPurposeType: TSQLContactMechPurposeType read fContactMechPurposeType write fContactMechPurposeType;
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
      fParty: TSQLParty;
      //联系机制
      fContactMech: TSQLContactMech;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //角色类型
      //fRoleType: TSQLPartyRole;
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
      property Party: TSQLParty read fParty write fParty;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      //property RoleType: TSQLPartyRole read fRoleType write fRoleType;
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
      fParty: TSQLParty;
      fContactMech: TSQLContactMech;
      fContactMechPurposeType: TSQLContactMechPurposeType;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLParty read fParty write fParty;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property ContactMechPurposeType: TSQLContactMechPurposeType read fContactMechPurposeType write fContactMechPurposeType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 42 邮政地址表
  TSQLPostalAddress = class(TSQLRecord)
    private
      ///联系机制
      fContactMech: TSQLContactMech;
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
      //fCityGeo: TSQLGeo;
      fPostalCode: RawUTF8;
      fPostalCodeExt: RawUTF8;
      //fCountryGeo: TSQLGeo;
      //fStateProvinceGeo: TSQLGeo;
      //fCountyGeo: TSQLGeo;
      //fMunicipalityGeo: TSQLGeo;
      //fPostalCodeGeo: TSQLGeo;
      //fGeoPoint: TSQLGeoPoint;
    published
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property ToName: RawUTF8 read fToName write fToName;
      property AttnName: RawUTF8 read fAttnName write fAttnName;
      property Address1: RawUTF8 read fAddress1 write fAddress1;
      property Address2: RawUTF8 read fAddress2 write fAddress2;
      property HouseNumber: Integer read fHouseNumber write fHouseNumber;
      property HouseNumberExt: RawUTF8 read fHouseNumberExt write fHouseNumberExt;
      property Directions: RawUTF8 read fDirections write fDirections;
      property City: RawUTF8 read fCity write fCity;
      //property CityGeo: TSQLGeo read fCityGeo write fCityGeo;
      property PostalCode: RawUTF8 read fPostalCode write fPostalCode;
      property PostalCodeExt: RawUTF8 read fPostalCodeExt write fPostalCodeExt;
      //property CountryGeo: TSQLGeo read fCountryGeo write fCountryGeo;
      //property StateProvinceGeo: TSQLGeo read fStateProvinceGeo write fStateProvinceGeo;
      //property CountyGeo: TSQLGeo read fCountyGeo write fCountyGeo;
      //property MunicipalityGeo: TSQLGeo read fMunicipalityGeo write fMunicipalityGeo;
      //property PostalCodeGeo: TSQLGeo read fPostalCodeGeo write fPostalCodeGeo;
      //property GeoPoint: TSQLGeoPoint read fGeoPoint write fGeoPoint;
  end;

  // 43 邮政地址范围
  TSQLPostalAddressBoundary = class(TSQLRecord)
    private
      fContactMech: TSQLPostalAddress;
      //fGeo: TSQLGeo;
    published
      property ContactMech: TSQLPostalAddress read fContactMech write fContactMech;
      //property Geo: TSQLGeo read fGeo write fGeo;
  end;

  // 44
  TSQLTelecomNumber = class(TSQLRecord)
    private
      fContactMech: TSQLContactMech;
      fCountryCode: RawUTF8;
      fAreaCode: RawUTF8;
      fContactNumber: RawUTF8;
      //问候名称
      fAskForName: RawUTF8;
    published
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property CountryCode: RawUTF8 read fCountryCode write fCountryCode;
      property AreaCode: RawUTF8 read fAreaCode write fAreaCode;
      property ContactNumber: RawUTF8 read fContactNumber write fContactNumber;
      property AskForName: RawUTF8 read fAskForName write fAskForName;
  end;

  // 45 有效联系机制角色
  TSQLValidContactMechRole = class(TSQLRecord)
    private
      //fRoleType: TSQLRoleType;
      fContactMechType: TSQLContactMechType;
    published
      //property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property ContactMechType: TSQLContactMechType read fContactMechType write fContactMechType;
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
      fParty: TSQLParty;
      //fRoleType: TSQLRoleType;
      fPartyType: TSQLPartyType;
      fNeedType: TSQLNeedType;
      fCommunicationEvent: TSQLCommunicationEvent;
      //fProduct: TSQLProduct;
      //fProductCategory: TSQLProductCategory;
      fVisit: Integer;
      fDatetimeRecorded: TDateTime;
      fDescription: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      //property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property PartyType: TSQLPartyType read fPartyType write fPartyType;
      property NeedType: TSQLNeedType read fNeedType write fNeedType;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
      //property Product: TSQLProduct read fProduct write fProduct;
      //property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
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
      fParty: TSQLParty;
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
      property Party: TSQLParty read fParty write fParty;
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
      fPartyType: TSQLPartyType;
      //外部标识
      fExternal: Integer;
      //优先使用币种
      //fPreferredCurrencyUom: TSQLUom;
      fDescription: RawUTF8;
      //fStatus: TSQLStatusItem;
      fCreatedDate: TDateTime;
      //fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      //fLastModifiedByUserLogin: TSQLUserLogin;
      //数据源
      //fDataSource: TSQLDataSource;
      //是否没有人看的
      fIsUnread: Boolean;
    published
      property PartyType: TSQLPartyType read fPartyType write fPartyType;
      property External: Integer read fExternal write fExternal;
      //property PreferredCurrencyUom: TSQLUom read fPreferredCurrencyUom write fPreferredCurrencyUom;
      property Description: RawUTF8 read fDescription write fDescription;
      //property Status: TSQLStatusItem read fStatus write fStatus;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      //property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      //property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      //property DataSource: TSQLDataSource read fDataSource write fDataSource;
      property IsUnread: Boolean read fIsUnread write fIsUnread;
  end;

  // 51
  TSQLPartyIdentification = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fPartyIdentificationType: TSQLPartyIdentificationType;
      fIdValue: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property PartyIdentificationType: TSQLPartyIdentificationType read fPartyIdentificationType write fPartyIdentificationType;
      property IdValue: RawUTF8 read fIdValue write fIdValue;
  end;

  // 52
  TSQLPartyIdentificationType = class(TSQLRecord)
    private
      fParent: TSQLPartyIdentificationType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyIdentificationType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 53 当事人地理位置
  TSQLPartyGeoPoint = class(TSQLRecord)
    private
      fParty: TSQLParty;
      //fGeoPoint: TSQLGeoPoint;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLParty read fParty write fParty;
      //property GeoPoint: TSQLGeoPoint read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 54 当事人属性
  TSQLPartyAttribute = class(TSQLRecord)
    private
      fParty: TSQLParty;
      //fAttrName: TSQLPartyTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      //property AttrName: TSQLPartyTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 55 当事人承运账户
  TSQLPartyCarrierAccount = class(TSQLRecord)
    private
      fParty: TSQLParty;
      //送货人员
      fCarrierParty: TSQLParty;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //客户或用户的账号,有时也作为承运人编号
      fAccountNumber: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property CarrierParty: TSQLParty read fCarrierParty write fCarrierParty;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property AccountNumber: RawUTF8 read fAccountNumber write fAccountNumber;
  end;

  // 56 当事人分类
  TSQLPartyClassification = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fPartyClassificationGroup: TSQLPartyClassificationGroup;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLParty read fParty write fParty;
      property PartyClassificationGroup: TSQLPartyClassificationGroup read fPartyClassificationGroup write fPartyClassificationGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 57 当事人分组
  TSQLPartyClassificationGroup = class(TSQLRecord)
    private
      fPartyClassificationType: TSQLPartyClassificationType;
      fParentGroup: TSQLPartyClassificationGroup;
      fDescription: RawUTF8;
    published
      property PartyClassificationType: TSQLPartyClassificationType read fPartyClassificationType write fPartyClassificationType;
      property ParentGroup: TSQLPartyClassificationGroup read fParentGroup write fParentGroup;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 58 当事人分类类型
  TSQLPartyClassificationType = class(TSQLRecord)
    private
      fParent: TSQLPartyClassificationType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyClassificationType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 59 当事人内容
  TSQLPartyContent = class(TSQLRecord)
    private
      fParty: TSQLParty;
      //fContent: TSQLContent;
      fPartyContentType: TSQLPartyContentType;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
    published
      property Party: TSQLParty read fParty write fParty;
      //property Content: TSQLContent read fContent write fContent;
      property PartyContentType: TSQLPartyContentType read fPartyContentType write fPartyContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 60 当事人内容类型
  TSQLPartyContentType = class(TSQLRecord)
    private
      fParent: TSQLPartyContentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyContentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 61 当事人数据源
  TSQLPartyDataSource = class(TSQLRecord)
    private
      fParty: TSQLParty;
      //fDataSource: TSQLDataSource;
      fFromDate: TDateTime;
      //访问标识
      fVisit: RawUTF8;
      fComments: RawUTF8;
      //是否创建
      fIsCreate: Boolean;
    published
      property Party: TSQLParty read fParty write fParty;
      //property DataSource: TSQLDataSource read fDataSource write fDataSource;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property Visit: RawUTF8 read fVisit write fVisit;
      property Comments: RawUTF8 read fcomments write fcomments;
      property IsCreate: Boolean read fIsCreate write fIsCreate;
  end;

  // 62 组织
  TSQLPartyGroup = class(TSQLRecord)
    private
      fParty: TSQLParty;
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
      property Party: TSQLParty read fParty write fParty;
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
      fParty: TSQLParty;
      //地址验证服务字符串
      fAvsDeclineString: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property AvsDeclineString: RawUTF8 read fAvsDeclineString write fAvsDeclineString;
  end;

  // 64 当事人邀请
  TSQLPartyInvitation = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fPartyFrom: TSQLParty;
      fToName: RawUTF8;
      fEmailAddress: RawUTF8;
      //fStatus: TSQLStatusItem;
      //最后邀请日期
      fLastInviteDate: TDateTime;
    published
      property Party: TSQLParty read fParty write fParty;
      property PartyFrom: TSQLParty read fPartyFrom write fPartyFrom;
      property ToName: RawUTF8 read fToName write fToName;
      property EmailAddress: RawUTF8 read fEmailAddress write fEmailAddress;
      //property Status: TSQLStatusItem read fStatus write fStatus;
      property LastInviteDate: TDateTime read fLastInviteDate write fLastInviteDate;
  end;

  // 65 当事人邀请组关联
  TSQLPartyInvitationGroupAssoc = class(TSQLRecord)
    private
      fPartyInvitation: TSQLPartyInvitation;
      //目标当事人
      fPartyTo: TSQLParty;
    published
      property PartyInvitation: TSQLPartyInvitation read fPartyInvitation write fPartyInvitation;
      property PartyTo: TSQLParty read fPartyTo write fPartyTo;
  end;

  // 66 当事人邀请角色关联
  TSQLPartyInvitationRoleAssoc = class(TSQLRecord)
    private
      fPartyInvitation: TSQLPartyInvitation;
      //角色类型
      //fRoleType: TSQLRoleType;
    published
      property PartyInvitation: TSQLPartyInvitation read fPartyInvitation write fPartyInvitation;
      //property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 67 当事人名称历史
  TSQLPartyNameHistory = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fChangeDate: TDateTime;
      fGroupName: RawUTF8;
      fFirstName: RawUTF8;
      fMiddleName: RawUTF8;
      fLastName: RawUTF8;
      fPersonalTitle: RawUTF8;
      fSuffix: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
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
      fParty: TSQLParty;
      //fNote: TSQLNoteData;
    published
      property Party: TSQLParty read fParty write fParty;
      //property Note: TSQLNoteData read fNote write fNote;
  end;

  // 69 当事人默认概况表
  TSQLPartyProfileDefault = class(TSQLRecord)
    private
      fParty: TSQLParty;
      //产品店铺
      //fProductStore: TSQLProductStore;
      //缺省送货地址
      fDefaultShipAddr: RawUTF8;
      //缺省账单地址
      fDefaultBillAddr: RawUTF8;
      //缺省支付方式
      fDefaultPayMeth: RawUTF8;
      //缺省送货方式
      fDefaultShipMeth: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      //property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property DefaultShipAddr: RawUTF8 read fDefaultShipAddr write fDefaultShipAddr;
      property DefaultBillAddr: RawUTF8 read fDefaultBillAddr write fDefaultBillAddr;
      property DefaultPayMeth: RawUTF8 read fDefaultPayMeth write fDefaultPayMeth;
      property DefaultShipMeth: RawUTF8 read fDefaultShipMeth write fDefaultShipMeth;
  end;

  // 70 当事人关系
  TSQLPartyRelationship = class(TSQLRecord)
    private
      fPartyFrom: TSQLParty;
      fPartyTo: TSQLParty;
      //fRoleTypeFrom: TSQLRoleType;
      //fRoleTypeTo: TSQLRoleType;
      //开始日期
      fFromDate: TDateTime;
      //结束日期
      fThruDate: TDateTime;
      //fStatus: TSQLStatusItem;
      //当事人关系名称
      fRelationshipName: RawUTF8;
      //安全组
      //fSecurityGroup: TSQLSecurityGroup;
      //优先类型
      //fPriorityType: TSQLPriorityType;
      fPartyRelationshipType: TSQLPartyRelationshipType;
      //权限枚举
      fPermissionsEnum: RawUTF8;
      //职位头衔
      fPositionTitle: RawUTF8;
      fComments: RawUTF8;
    published
      property PartyFrom: TSQLParty read fPartyFrom write fPartyFrom;
      property PartyTo: TSQLParty read fPartyTo write fPartyTo;
      //property RoleTypeFrom: TSQLRoleType read fRoleTypeFrom write fRoleTypeFrom;
      //property RoleTypeTo: TSQLRoleType read fRoleTypeTo write fRoleTypeTo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      //property Status: TSQLStatusItem read fStatus write fStatus;
      property RelationshipName: RawUTF8 read fRelationshipName write fRelationshipName;
      //property SecurityGroup: TSQLSecurityGroup read fSecurityGroup write fSecurityGroup;
      //property PriorityType: TSQLPriorityType read fPriorityType write fPriorityType;
      property PartyRelationshipType: TSQLPartyRelationshipType read fPartyRelationshipType write fPartyRelationshipType;
      property PermissionsEnum: RawUTF8 read fPermissionsEnum write fPermissionsEnum;
      property PositionTitle: RawUTF8 read fPositionTitle write fPositionTitle;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 71 当事人关系类型
  TSQLPartyRelationshipType = class(TSQLRecord)
    private
      fParentType: TSQLPartyRelationshipType;
      fHasTable: Boolean;
      fPartyRelationshipName: RawUTF8;
      fDescription: RawUTF8;
      //fRoleTypeIdValidFrom: TSQLRoleType;
      //fRoleTypeIdValidTo: TSQLRoleType;
    published
      property ParentType: TSQLPartyRelationshipType read fParentType write fParentType;
      property HasTable: Boolean read fHasTable write fHasTable;
      property PartyRelationshipName: RawUTF8 read fPartyRelationshipName write fPartyRelationshipName;
      property Description: RawUTF8 read fDescription write fDescription;
      //property RoleTypeIdValidFrom: TSQLRoleType read fRoleTypeIdValidFrom write fRoleTypeIdValidFrom;
      //property RoleTypeIdValidTo: TSQLRoleType read fRoleTypeIdValidTo write fRoleTypeIdValidTo;
  end;

  // 72 当事人角色
  TSQLPartyRole = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
    published
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 73 当事人状态
  TSQLPartyStatus = class(TSQLRecord)
    private
      //fStatus: TSQLStatusItem;
      fParty: TSQLParty;
      fStatusDate: TDateTime;
      fChangeByUserLogin: TSQLUserLogin;
    published
      //property Status: TSQLStatusItem read fStatus write fStatus;
      property Party: TSQLParty read fParty write fParty;
      property StatusDate: TDateTime read fStatusDate write fStatusDate;
      property ChangeByUserLogin: TSQLUserLogin read fChangeByUserLogin write fChangeByUserLogin;
  end;

  // 74 当事人类型
  TSQLPartyType = class(TSQLRecord)
    private
      fParent: TSQLPartyType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLPartyType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 75 当事人类型属性
  TSQLPartyTypeAttr = class(TSQLRecord)
    private
      fPartyType: TSQLPartyType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property PartyType: TSQLPartyType read fPartyType write fPartyType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 76
  TSQLPerson = class(TSQLRecord)
    private
      fParty: TSQLParty;
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
      //fEmploymentStatusEnum: TSQLEnumeration;
      //居住状态枚举
      //fResidenceStatusEnum: TSQLEnumeration;
      fOccupation: RawUTF8;
      //雇用年数
      fYearsWithEmployer: Double;
      fMonthsWithEmployer: Double;
      fExistingCustomer: Boolean;
      fCard: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
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
      //property EmploymentStatusEnum: TSQLEnumeration read fEmploymentStatusEnum write fEmploymentStatusEnum;
      //property ResidenceStatusEnum: TSQLEnumeration read fResidenceStatusEnum write fResidenceStatusEnum;
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
      fParent: TSQLRoleType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLRoleType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 79 角色类型属性
  TSQLRoleTypeAttr = class(TSQLRecord)
    private
      fRoleType: TSQLRoleType;
      fAttrName: TSQLPartyAttribute;
      FDescription: RawUTF8;
    published
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property AttrName: TSQLPartyAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 80 供应商
  TSQLVendor = class(TSQLRecord)
    private
      fParty: TSQLParty;
      ///公司名称
      fManifestCompanyName: RawUTF8;
      //公司称号
      fManifestCompanyTitle: RawUTF8;
      //LOGO网址
      fManifestLogoUrl: RawUTF8;
      //政策
      fManifestPolicies: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property ManifestCompanyName: RawUTF8 read fManifestCompanyName write fManifestCompanyName;
      property ManifestCompanyTitle: RawUTF8 read fManifestCompanyTitle write fManifestCompanyTitle;
      property ManifestLogoUrl: RawUTF8 read fManifestLogoUrl write fManifestLogoUrl;
      property ManifestPolicies: RawUTF8 read fManifestPolicies write fManifestPolicies;
  end;

implementation

uses
  Classes, SysUtils;

end.

