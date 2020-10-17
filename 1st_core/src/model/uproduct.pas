unit uProduct;

{$mode objfpc}{$H+}

interface

uses
  SynCommons, mORMot, uForwardDeclaration;

type
  // 1 产品目录
  TSQLProdCatalog = class(TSQLRecord)
    private
      fCatalogName: RawUTF8;
      //使用快速增加
      fUseQuickAdd: Boolean;
      //样式表
      fStyleSheet: RawUTF8;
      //头logo
      fHeaderLogo: RawUTF8;
      //内容路径前缀
      fContentPathPrefix: RawUTF8;
      //模板路径前缀
      fTemplatePathPrefix: RawUTF8;
      //允许显示
      fViewAllowPermReqd: Boolean;
      //允许购买
      fPurchaseAllowPermReqd: Boolean;
    published
      property CatalogName: RawUTF8 read fCatalogName write fCatalogName;
      property UseQuickAdd: Boolean read fUseQuickAdd write fUseQuickAdd;
      property StyleSheet: RawUTF8 read fStyleSheet write fStyleSheet;
      property HeaderLogo: RawUTF8 read fHeaderLogo write fHeaderLogo;
      property ContentPathPrefix: RawUTF8 read fContentPathPrefix write fContentPathPrefix;
      property TemplatePathPrefix: RawUTF8 read fTemplatePathPrefix write fTemplatePathPrefix;
      property ViewAllowPermReqd: Boolean read fViewAllowPermReqd write fViewAllowPermReqd;
      property PurchaseAllowPermReqd: Boolean read fPurchaseAllowPermReqd write fPurchaseAllowPermReqd;
  end;

  // 2 产品目录种类
  TSQLProdCatalogCategory = class(TSQLRecord)
    private
      //产品目录
      fProdCatalog: TSQLProdCatalogID;
      //产品分类
      fProductCategory: TSQLProductCategoryID;
      //产品目录分类类型
      fProdCatalogCategoryType: TSQLProdCatalogCategoryTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      //序号数字
      fSequenceNum: Integer;
    published
      property ProdCatalog: TSQLProdCatalogID read fProdCatalog write fProdCatalog;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property ProdCatalogCategoryType: TSQLProdCatalogCategoryTypeID read fProdCatalogCategoryType write fProdCatalogCategoryType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 3 产品目录种类类型
  TSQLProdCatalogCategoryType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProdCatalogCategoryTypeID;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProdCatalogCategoryTypeID read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 4 产品目录库存设施
  TSQLProdCatalogInvFacility = class(TSQLRecord)
    private
      fProdCatalog: TSQLProdCatalogID;
      fFacility: TSQLFacilityID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProdCatalog: TSQLProdCatalogID read fProdCatalog write fProdCatalog;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 5 产品目录角色
  TSQLProdCatalogRole = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fProdCatalog: TSQLProdCatalogID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property ProdCatalog: TSQLProdCatalogID read fProdCatalog write fProdCatalog;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 6 产品分类
  TSQLProductCategory = class(TSQLRecord)
    private
      fProductCategoryType: TSQLProductCategoryTypeID;
      //主上级分类
      fPrimaryParentCategory: TSQLProductCategoryID;
      fCategoryName: RawUTF8;
      fDescription: RawUTF8;
      //详细描述
      fLongDescription: TSQLRawBlob;
      //分类图像URL
      fCategoryImageUrl: RawUTF8;
      //链接一图像
      fLinkOneImageUrl: RawUTF8;
      //链接二图像
      fLinkTwoImageUrl: RawUTF8;
      //详细屏幕
      fDetailScreen: RawUTF8;
      //列表中展示
      fShowInSelect: Boolean;
    published
      property ProductCategoryType: TSQLProductCategoryTypeID read fProductCategoryType write fProductCategoryType;
      property PrimaryParentCategory: TSQLProductCategoryID read fPrimaryParentCategory write fPrimaryParentCategory;
      property CategoryName: RawUTF8 read fCategoryName write fCategoryName;
      property Description: RawUTF8 read fDescription write fDescription;
      property LongDescription: TSQLRawBlob read fLongDescription write fLongDescription;
      property CategoryImageUrl: RawUTF8 read fCategoryImageUrl write fCategoryImageUrl;
      property LinkOneImageUrl: RawUTF8 read fLinkOneImageUrl write fLinkOneImageUrl;
      property LinkTwoImageUrl: RawUTF8 read fLinkTwoImageUrl write fLinkTwoImageUrl;
      property DetailScreen: RawUTF8 read fDetailScreen write fDetailScreen;
      property ShowInSelect: Boolean read fShowInSelect write fShowInSelect;
  end;

  // 7 产品分类属性
  TSQLProductCategoryAttribute = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 8 产品分类内容
  TSQLProductCategoryContent = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fContent: TSQLContentID;
      //产品分类内容类型
      fProdCatContentType: TSQLProductCategoryContentTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      //购买开始日期
      fPurchaseFromDate: TDateTime;
      //购买结束日期
      fPurchaseThruDate: TDateTime;
      //使用数量限制
      fUseCountLimit: Integer;
      //使用天数限制
      fUseDaysLimit: Integer;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property Content: TSQLContentID read fContent write fContent;
      property ProdCatContentType: TSQLProductCategoryContentTypeID read fProdCatContentType write fProdCatContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PurchaseFromDate: TDateTime read fPurchaseFromDate write fPurchaseFromDate;
      property PurchaseThruDate: TDateTime read fPurchaseThruDate write fPurchaseThruDate;
      property UseCountLimit: Integer read fUseCountLimit write fUseCountLimit;
      property UseDaysLimit: Integer read fUseDaysLimit write fUseDaysLimit;
  end;

  // 9 产品分类内容类型
  TSQLProductCategoryContentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductCategoryContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductCategoryContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 10 产品分类总账账务
  TSQLProductCategoryGlAccount = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fOrganizationParty: TSQLPartyID;
      fGlAccountType: TSQLGlAccountTypeID;
      fGlAccount: TSQLGlAccountID;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccountType: TSQLGlAccountTypeID read fGlAccountType write fGlAccountType;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 11 产品分类关联
  TSQLProductCategoryLink = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      //链接序号
      fLinkSeq: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
      //序号数字
      fSequenceNum: Integer;
      //标题文本
      fTitleText: RawUTF8;
      //详细说明
      fDetailText: TSQLRawBlob;
      //图像URL
      fImageUrl: RawUTF8;
      //图像2URL
      fImageTwoUrl: RawUTF8;
      //链接类型枚举
      fLinkTypeEnum: TSQLEnumerationID;
      //链接信息
      fLinkInfo: RawUTF8;
      //详细的子屏幕
      fDetailSubScreen: RawUTF8;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property LinkSeq: Integer read fLinkSeq write fLinkSeq;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property TitleText: RawUTF8 read fTitleText write fTitleText;
      property DetailText: TSQLRawBlob read fDetailText write fDetailText;
      property ImageUrl: RawUTF8 read fImageUrl write fImageUrl;
      property ImageTwoUrl: RawUTF8 read fImageTwoUrl write fImageTwoUrl;
      property LinkTypeEnum: TSQLEnumerationID read fLinkTypeEnum write fLinkTypeEnum;
      property LinkInfo: RawUTF8 read fLinkInfo write fLinkInfo;
      property DetailSubScreen: RawUTF8 read fDetailSubScreen write fDetailSubScreen;
  end;

  // 12 产品分类成员
  TSQLProductCategoryMember = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fProduct: TSQLProductID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
      fSequenceNum: Integer;
      //数量
      fQuantity: Double;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property Product: TSQLProductID read fProduct write fProduct;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 13 产品分类角色
  TSQLProductCategoryRole = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 14 产品分类隶属关系
  TSQLProductCategoryRollup = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fparentProductCategory: TSQLProductCategoryID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property parentProductCategory: TSQLProductCategoryID read fparentProductCategory write fparentProductCategory;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 15 产品分类类型
  TSQLProductCategoryType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductCategoryTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductCategoryTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 16 产品分类类型属性
  TSQLProductCategoryTypeAttr = class(TSQLRecord)
    private
      fProductCategoryType: TSQLProductCategoryTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property ProductCategoryType: TSQLProductCategoryTypeID read fProductCategoryType write fProductCategoryType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 17
  TSQLProductConfig = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fConfigItem: TSQLProductConfigItemID;
      fSequenceNum: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      FDescription: RawUTF8;
      FLongDescription: RawUTF8;
      fConfigType: RawUTF8;
      fDefaultConfigOption: RawUTF8;
      fIsMandatory: Boolean;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property ConfigItem: TSQLProductConfigItemID read fConfigItem write fConfigItem;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Description: RawUTF8 read FDescription write FDescription;
      property LongDescription: RawUTF8 read FLongDescription write FLongDescription;
      property ConfigType: RawUTF8 read fConfigType write fConfigType;
      property DefaultConfigOption: RawUTF8 read fDefaultConfigOption write fDefaultConfigOption;
      property IsMandatory: Boolean read fIsMandatory write fIsMandatory;
  end;

  // 18
  TSQLProductConfigItem = class(TSQLRecord)
    private
      fConfigItemType: RawUTF8;//?
      fConfigItemName: RawUTF8;
      FDescription: RawUTF8;
      FLongDescription: RawUTF8;
      fImageUrl: RawUTF8;
    published
      property ConfigItemType: RawUTF8 read fConfigItemType write fConfigItemType;
      property ConfigItemName: RawUTF8 read fConfigItemName write fConfigItemName;
      property Description: RawUTF8 read FDescription write FDescription;
      property LongDescription: RawUTF8 read FLongDescription write FLongDescription;
      property ImageUrl: RawUTF8 read fImageUrl write fImageUrl;
  end;

  // 19
  TSQLProdConfItemContent = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItemID;
      fContent: TSQLContentID;
      fConfItemContentType: TSQLProdConfItemContentTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ConfigItem: TSQLProductConfigItemID read fConfigItem write fConfigItem;
      property Content: TSQLContentID read fContent write fContent;
      property ConfItemContentType: TSQLProdConfItemContentTypeID read fConfItemContentType write fConfItemContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 20
  TSQLProdConfItemContentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProdConfItemContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
     public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProdConfItemContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 21
  TSQLProductConfigOption = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItemID;
      fConfigOption: RawUTF8;
      fConfigOptionName: RawUTF8;
      FDescription: RawUTF8;
      fSequenceNum: Integer;
    published
      property ConfigItem: TSQLProductConfigItemID read fConfigItem write fConfigItem;
      property ConfigOption: RawUTF8 read fConfigOption write fConfigOption;
      property ConfigOptionName: RawUTF8 read fConfigOptionName write fConfigOptionName;
      property Description: RawUTF8 read FDescription write FDescription;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 22
  TSQLProductConfigOptionIactn = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItemID;
      fConfigOption: TSQLProductConfigOptionID;
      fConfigItemTo: TSQLProductConfigItemID;
      fConfigOptionTo: TSQLProductConfigOptionID;
      fConfigIactnType: RawUTF8;               //?
      fSequenceNum: Integer;
      FDescription: RawUTF8;
    published
      property ConfigItem: TSQLProductConfigItemID read fConfigItem write fConfigItem;
      property ConfigOption: TSQLProductConfigOptionID read fConfigOption write fConfigOption;
      property ConfigItemTo: TSQLProductConfigItemID read fConfigItemTo write fConfigItemTo;
      property ConfigOptionTo: TSQLProductConfigOptionID read fConfigOptionTo write fConfigOptionTo;
      property ConfigIactnType: RawUTF8 read fConfigIactnType write fConfigIactnType;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 23
  TSQLProductConfigProduct = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItemID;
      fConfigOption: TSQLProductConfigOptionID;
      fProduct: TSQLProductID;
      fQuantity: Double;
      fSequenceNum: Integer;
    published
      property ConfigItem: TSQLProductConfigItemID read fConfigItem write fConfigItem;
      property ConfigOption: TSQLProductConfigOptionID read fConfigOption write fConfigOption;
      property Product: TSQLProductID read fProduct write fProduct;
      property Quantity: Double read fQuantity write fQuantity;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 24
  TSQLProductConfigConfig = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItemID;
      fConfigOption: TSQLProductConfigOptionID;
      fSequenceNum: Integer;
      FDescription: RawUTF8;
    published
      property ConfigItem: TSQLProductConfigItemID read fConfigItem write fConfigItem;
      property ConfigOption: TSQLProductConfigOptionID read fConfigOption write fConfigOption;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 25
  TSQLProductConfigStats = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fNumOfConfs: Double;
      fConfigType: RawUTF8; //HIDDEN, TEMPLATE, etc...
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property NumOfConfs: Double read fNumOfConfs write fNumOfConfs;
      property ConfigType: RawUTF8 read fConfigType write fConfigType;
  end;

  //? 26
  TSQLConfigOptionProductOption = class(TSQLRecord)
    private
      fConfigItem: Integer;
      fSequenceNum: Integer;
      fConfigOption: Integer;
      fproduct: Integer;
      fproductOption: Integer;
      FDescription: RawUTF8;
    published
      property ConfigItem: Integer read fConfigItem write fConfigItem;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property ConfigOption: Integer read fConfigOption write fConfigOption;
      property product: Integer read fproduct write fproduct;
      property productOption: Integer read fproductOption write fproductOption;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 27
  TSQLCostComponent = class(TSQLRecord)
    private
      fCostComponentType: TSQLCostComponentTypeID;
      fProduct: TSQLProductID;
      fProductFeature: TSQLProductFeatureID;
      fParty: TSQLPartyID;
      fGeo: TSQLGeoID;
      fWorkEffort: TSQLWorkEffortID;
      fFixedAsset: TSQLFixedAssetID;
      fCostComponentCalc: TSQLCostComponentCalcID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCost: Double;
      fCostUom: TSQLUomID;
    published
      property CostComponentType: TSQLCostComponentTypeID read fCostComponentType write fCostComponentType;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property Party: TSQLPartyID read fParty write fParty;
      property Geo: TSQLGeoID read fGeo write fGeo;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
      property CostComponentCalc: TSQLCostComponentCalcID read fCostComponentCalc write fCostComponentCalc;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Cost: Double read fCost write fCost;
      property CostUom: TSQLUomID read fCostUom write fCostUom;
  end;

  // 28
  TSQLCostComponentAttribute = class(TSQLRecord)
    private
      fCostComponent: TSQLCostComponentID;
      fAttrName: TSQLCostComponentTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property CostComponent: TSQLCostComponentID read fCostComponent write fCostComponent;
      property AttrName: TSQLCostComponentTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 29
  TSQLCostComponentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLCostComponentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLCostComponentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 30
  TSQLCostComponentTypeAttr = class(TSQLRecord)
    private
      fCostComponentType: TSQLCostComponentTypeID;
      fAttrName: TSQLCostComponentAttributeID;
      fDescription: RawUTF8;
    published
      property CostComponentType: TSQLCostComponentTypeID read fCostComponentType write fCostComponentType;
      property AttrName: TSQLCostComponentAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 31
  TSQLCostComponentCalc = class(TSQLRecord)
    private
      fCostGlAccountType: TSQLGlAccountTypeID;
      fOffsettingGlAccountType: TSQLGlAccountTypeID;
      fFixedCost: Currency;
      fVariableCost: Currency;
      fPerMilliSecond: Double;
      fCurrencyUom: TSQLUomID;
      fCostCustomMethod: TSQLCustomMethodID;
      fDescription: RawUTF8;
    published
      property CostGlAccountType: TSQLGlAccountTypeID read fCostGlAccountType write fCostGlAccountType;
      property OffsettingGlAccountType: TSQLGlAccountTypeID read fOffsettingGlAccountType write fOffsettingGlAccountType;
      property FixedCost: Currency read fFixedCost write fFixedCost;
      property VariableCost: Currency read fVariableCost write fVariableCost;
      property PerMilliSecond: Double read fPerMilliSecond write fPerMilliSecond;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property CostCustomMethod: TSQLCustomMethodID read fCostCustomMethod write fCostCustomMethod;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 32
  TSQLProductCostComponentCalc = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fCostComponentType: TSQLCostComponentTypeID;
      fCostComponentCalc: TSQLCostComponentCalcID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property CostComponentType: TSQLCostComponentTypeID read fCostComponentType write fCostComponentType;
      property CostComponentCalc: TSQLCostComponentCalcID read fCostComponentCalc write fCostComponentCalc;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 33
  TSQLContainer = class(TSQLRecord)
    private
      fContainerType: TSQLContainerTypeID;
      fFacility: TSQLFacilityID;
      fDescription: RawUTF8;
    published
      property ContainerType: TSQLContainerTypeID read fContainerType write fContainerType;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 34
  TSQLContainerType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 35
  TSQLContainerGeoPoint = class(TSQLRecord)
    private
      fContainer: TSQLContainerID;
      fGeoPoint: TSQLGeoPointID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Container: TSQLContainerID read fContainer write fContainer;
      property GeoPoint: TSQLGeoPointID read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 36
  TSQLFacility = class(TSQLRecord)
    private
      fFacilityType: TSQLFacilityTypeID;
      fParentFacility: TSQLFacilityID;
      fOwnerParty: TSQLPartyID;
      fDefaultInventoryItemType: TSQLInventoryItemTypeID;
      fFacilityName: RawUTF8;
      fPrimaryFacilityGroup: TSQLFacilityGroupID;
      fOldSquareFootage: Double;
      fFacilitySize: Double;
      fFacilitySizeUom: TSQLUomID;
      fProductStore: TSQLProductStoreID;
      fDefaultDaysToShip: Double;
      fOpenedDate: TDateTime;
      fClosedDate: TDateTime;
      fDescription: RawUTF8;
      fDefaultDimensionUom: TSQLUomID;
      fDefaultWeightUom: TSQLUomID;
      fGeoPoint: TSQLGeoPointID;
    published
      property FacilityType: TSQLFacilityTypeID read fFacilityType write fFacilityType;
      property ParentFacility: TSQLFacilityID read fParentFacility write fParentFacility;
      property OwnerParty: TSQLPartyID read fOwnerParty write fOwnerParty;
      property DefaultInventoryItemType: TSQLInventoryItemTypeID read fDefaultInventoryItemType write fDefaultInventoryItemType;
      property FacilityName: RawUTF8 read fFacilityName write fFacilityName;
      property PrimaryFacilityGroup: TSQLFacilityGroupID read fPrimaryFacilityGroup write fPrimaryFacilityGroup;
      property OldSquareFootage: Double read fOldSquareFootage write fOldSquareFootage;
      property FacilitySize: Double read fFacilitySize write fFacilitySize;
      property FacilitySizeUom: TSQLUomID read fFacilitySizeUom write fFacilitySizeUom;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property DefaultDaysToShip: Double read fDefaultDaysToShip write fDefaultDaysToShip;
      property OpenedDate: TDateTime read fOpenedDate write fOpenedDate;
      property ClosedDate: TDateTime read fClosedDate write fClosedDate;
      property Description: RawUTF8 read fDescription write fDescription;
      property DefaultDimensionUom: TSQLUomID read fDefaultDimensionUom write fDefaultDimensionUom;
      property DefaultWeightUom: TSQLUomID read fDefaultWeightUom write fDefaultWeightUom;
      property GeoPoint: TSQLGeoPointID read fGeoPoint write fGeoPoint;
  end;

  // 37
  TSQLFacilityAttribute = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fAttrName: TSQLFacilityTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property AttrName: TSQLFacilityTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 38
  TSQLFacilityCalendar = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fCalendar: TSQLTechDataCalendarID;
      fFacilityCalendarType: TSQLFacilityCalendarTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Calendar: TSQLTechDataCalendarID read fCalendar write fCalendar;
      property FacilityCalendarType: TSQLFacilityCalendarTypeID read fFacilityCalendarType write fFacilityCalendarType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 39
  TSQLFacilityCalendarType = class(TSQLRecord)
    private
      fParent: TSQLFacilityCalendarTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLFacilityCalendarTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 40
  TSQLFacilityCarrierShipment = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fParty: TSQLPartyID;
      fRoleType: TSQLCarrierShipmentMethodID;      //?
      fShipmentMethodType: TSQLShipmentMethodTypeID;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLCarrierShipmentMethodID read fRoleType write fRoleType;
      property ShipmentMethodType: TSQLShipmentMethodTypeID read fShipmentMethodType write fShipmentMethodType;
  end;

  // 41
  TSQLFacilityContactMech = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fContactMech: TSQLContactMechID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fExtension: RawUTF8;
      fComments: RawUTF8;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Extension: RawUTF8 read fExtension write fExtension;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 42
  TSQLFacilityContactMechPurpose = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fContactMech: TSQLContactMechID;
      fContactMechPurposeType: TSQLContactMechPurposeTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property ContactMechPurposeType: TSQLContactMechPurposeTypeID read fContactMechPurposeType write fContactMechPurposeType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 43
  TSQLFacilityGroup = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fFacilityGroupTypeEncode: RawUTF8;
      fPrimaryParentGroupEncode: RawUTF8;
      fFacilityGroupType: TSQLFacilityGroupTypeID;
      fPrimaryParentGroup: TSQLFacilityGroupID;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property FacilityGroupTypeEncode: RawUTF8 read fFacilityGroupTypeEncode write fFacilityGroupTypeEncode;
      property PrimaryParentGroupEncode: RawUTF8 read fPrimaryParentGroupEncode write fPrimaryParentGroupEncode;
      property FacilityGroupType: TSQLFacilityGroupTypeID read fFacilityGroupType write fFacilityGroupType;
      property PrimaryParentGroup: TSQLFacilityGroupID read fPrimaryParentGroup write fPrimaryParentGroup;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 44
  TSQLFacilityGroupMember = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fFacilityGroup: TSQLFacilityGroupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
   published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property FacilityGroup: TSQLFacilityGroupID read fFacilityGroup write fFacilityGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 45
  TSQLFacilityGroupRole = class(TSQLRecord)
    private
      fFacilityGroup: TSQLFacilityGroupID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
    published
      property FacilityGroup: TSQLFacilityGroupID read fFacilityGroup write fFacilityGroup;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 46
  TSQLFacilityGroupRollup = class(TSQLRecord)
    private
      fFacilityGroup: TSQLFacilityGroupID;
      fParentFacilityGroup: TSQLFacilityGroupRollupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property FacilityGroup: TSQLFacilityGroupID read fFacilityGroup write fFacilityGroup;
      property ParentFacilityGroup: TSQLFacilityGroupRollupID read fParentFacilityGroup write fParentFacilityGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 47
  TSQLFacilityGroupType = class(TSQLRecord)
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

  // 48
  TSQLFacilityLocation = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fLocationSeq: Integer;
      fLocationTypeEnum: TSQLEnumerationID;
      fArea: Integer;
      fAisle: Integer;
      fSection: Integer;
      fLevel: Integer;
      fPosition: Integer;
      fGeoPoint: TSQLGeoPointID;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property LocationSeq: Integer read fLocationSeq write fLocationSeq;
      property LocationTypeEnum: TSQLEnumerationID read fLocationTypeEnum write fLocationTypeEnum;
      property Area: Integer read fArea write fArea;
      property Aisle: Integer read fAisle write fAisle;
      property Section: Integer read fSection write fSection;
      property Level: Integer read fLevel write fLevel;
      property Position: Integer read fPosition write fPosition;
      property GeoPoint: TSQLGeoPointID read fGeoPoint write fGeoPoint;
  end;

  // 49
  TSQLFacilityLocationGeoPoint = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fLocationSeq: Integer;
      fGeoPoint: TSQLGeoPointID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property LocationSeq: Integer read fLocationSeq write fLocationSeq;
      property GeoPoint: TSQLGeoPointID read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 50
  TSQLFacilityParty = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 51
  TSQLFacilityContent = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fContent: TSQLContentID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Content: TSQLContentID read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 52
  TSQLFacilityType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLFacilityTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLFacilityTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 53
  TSQLFacilityTypeAttr = class(TSQLRecord)
    private
      fFacilityType: TSQLFacilityTypeID;
      fAttrName: TSQLFacilityAttributeID;
      fDescription: RawUTF8;
    published
      property FacilityType: TSQLFacilityTypeID read fFacilityType write fFacilityType;
      property AttrName: TSQLFacilityAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 54
  TSQLProductFacility = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fFacility: TSQLFacilityID;
      fMinimumStock: Double;
      fReorderQuantity: Double;
      fDaysToShip: Double;
      fLastInventoryCount: Double;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property MinimumStock: Double read fMinimumStock write fMinimumStock;
      property ReorderQuantity: Double read fReorderQuantity write fReorderQuantity;
      property DaysToShip: Double read fDaysToShip write fDaysToShip;
      property LastInventoryCount: Double read fLastInventoryCount write fLastInventoryCount;
  end;

  // 55
  TSQLProductFacilityLocation = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fFacility: TSQLFacilityID;
      fLocationSeq: Integer;
      fMinimumStock: Double;
      fMoveQuantity: Double;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property LocationSeq: Integer read fLocationSeq write fLocationSeq;
      property MinimumStock: Double read fMinimumStock write fMinimumStock;
      property MoveQuantity: Double read fMoveQuantity write fMoveQuantity;
  end;

  // 56
  TSQLProductFeature = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fProductFeatureTypeEncode: RawUTF8;
      fProductFeatureCategoryEncode: RawUTF8;
      fProductFeatureType: TSQLProductFeatureTypeID;
      fProductFeatureCategory: TSQLProductFeatureCategoryID;
      fDescription: RawUTF8;
      fUom: TSQLUomID;
      fNumberSpecified: Double;
      fDefaultAmount: Double;
      fDefaultSequenceNum: Integer;
      fAbbrev: RawUTF8;
      fIdCode: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ProductFeatureTypeEncode: RawUTF8 read fProductFeatureTypeEncode write fProductFeatureTypeEncode;
      property ProductFeatureCategoryEncode: RawUTF8 read fProductFeatureCategoryEncode write fProductFeatureCategoryEncode;
      property ProductFeatureType: TSQLProductFeatureTypeID read fProductFeatureType write fProductFeatureType;
      property ProductFeatureCategory: TSQLProductFeatureCategoryID read fProductFeatureCategory write fProductFeatureCategory;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUomID read fUom write fUom;
      property NumberSpecified: Double read fNumberSpecified write fNumberSpecified;
      property DefaultAmount: Double read fDefaultAmount write fDefaultAmount;
      property DefaultSequenceNum: Integer read fDefaultSequenceNum write fDefaultSequenceNum;
      property Abbrev: RawUTF8 read fAbbrev write fAbbrev;
      property IdCode: RawUTF8 read fIdCode write fIdCode;
  end;

  // 57
  TSQLProductFeatureAppl = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fProductFeature: TSQLProductFeatureID;
      fProductFeatureApplType: TSQLProductFeatureApplTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fAmount: Double;
      fRecurringAmount: Double;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property ProductFeatureApplType: TSQLProductFeatureApplTypeID read fProductFeatureApplType write fProductFeatureApplType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Amount: Double read fAmount write fAmount;
      property RecurringAmount: Double read fRecurringAmount write fRecurringAmount;
  end;

  // 58
  TSQLProductFeatureApplType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductFeatureApplTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductFeatureApplTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 59
  TSQLProductFeatureApplAttr = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fProductFeature: TSQLProductFeatureID;
      fFromDate: TDateTime;
      fAttrName: RawUTF8;
      fAttrValue: Double;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: Double read fAttrValue write fAttrValue;
  end;

  // 60
  TSQLProductFeatureCategory = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductFeatureCategoryID;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductFeatureCategoryID read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 61
  TSQLProductFeatureCategoryAppl = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fProductFeatureCategory: TSQLProductFeatureCategoryID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property ProductFeatureCategory: TSQLProductFeatureCategoryID read fProductFeatureCategory write fProductFeatureCategory;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 62
  TSQLProductFeatureCatGrpAppl = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fProductFeatureGroup: TSQLProductFeatureGroupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property ProductFeatureGroup: TSQLProductFeatureGroupID read fProductFeatureGroup write fProductFeatureGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 63
  TSQLProductFeatureDataResource = class(TSQLRecord)
    private
      fDataResource: TSQLDataResourceID;
      fProductFeature: TSQLProductFeatureID;
    published
      property DataResource: TSQLDataResourceID read fDataResource write fDataResource;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
  end;

  // 64
  TSQLProductFeatureGroup = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
   end;

  // 65
  TSQLProductFeatureGroupAppl = class(TSQLRecord)
    private
      fProductFeatureGroup: TSQLProductFeatureGroupID;
      fProductFeature: TSQLProductFeatureID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductFeatureGroup: TSQLProductFeatureGroupID read fProductFeatureGroup write fProductFeatureGroup;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 66
  TSQLProductFeatureIactn = class(TSQLRecord)
    private
      fProductFeature: TSQLProductFeatureID;
      fProductFeatureTo: TSQLProductFeatureID;
      fProductFeatureIactnType: TSQLProductFeatureIactnTypeID;
      fProduct: TSQLProductID;
    published
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property ProductFeatureTo: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property ProductFeatureIactnType: TSQLProductFeatureIactnTypeID read fProductFeatureIactnType write fProductFeatureIactnType;
      property Product: TSQLProductID read fProduct write fProduct;
  end;

  // 67
  TSQLProductFeatureIactnType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductFeatureIactnTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductFeatureIactnTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 68
  TSQLProductFeatureType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductFeatureTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductFeatureTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 69
  TSQLProductFeaturePrice = class(TSQLRecord)
    private
      fProductFeature: TSQLProductFeatureID;
      fProductPriceType: TSQLProductPriceTypeID;
      fCurrencyUom: TSQLUomID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPrice: Currency;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property ProductPriceType: TSQLProductPriceTypeID read fProductPriceType write fProductPriceType;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Price: Currency read fPrice write fPrice;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 70
  TSQLInventoryItem = class(TSQLRecord)
    private
      fInventoryItemType: TSQLInventoryItemTypeID;
      fProduct: TSQLProductID;
      fParty: TSQLPartyID;
      fOwnerParty: TSQLPartyID;
      fStatus: TSQLStatusItemID;
      fDatetimeReceived: TDateTime;
      fDatetimeManufactured: TDateTime;
      fExpireDate: TDateTime;
      fFacility: TSQLFacilityID;
      fContainer: TSQLContainerID;
      fLot: TSQLLotID;
      fUom: TSQLUomID;
      fBinNumber: Integer;
      fLocationSeq: Integer;
      fComments: RawUTF8;
      fQuantityOnHandTotal: Double;
      fAvailableToPromiseTotal: Double;
      fAccountingQuantityTotal: Double;
      fOldQuantityOnHand: Double;
      fOldAvailableToPromise: Double;
      fSerialNumber: RawUTF8;
      fSoftIdentifier: RawUTF8;
      fActivationNumber: RawUTF8;
      fActivationValidThru: TDateTime;
      fUnitCost: Currency;
      fCurrencyUom: TSQLUomID;
      fFixedAsset: TSQLFixedAssetID;
    published
      property InventoryItemType: TSQLInventoryItemTypeID read fInventoryItemType write fInventoryItemType;
      property Product: TSQLProductID read fProduct write fProduct;
      property Party: TSQLPartyID read fParty write fParty;
      property OwnerParty: TSQLPartyID read fOwnerParty write fOwnerParty;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property DatetimeReceived: TDateTime read fDatetimeReceived write fDatetimeReceived;
      property DatetimeManufactured: TDateTime read fDatetimeManufactured write fDatetimeManufactured;
      property ExpireDate: TDateTime read fExpireDate write fExpireDate;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Container: TSQLContainerID read fContainer write fContainer;
      property Lot: TSQLLotID read fLot write fLot;
      property Uom: TSQLUomID read fUom write fUom;
      property BinNumber: Integer read fBinNumber write fBinNumber;
      property LocationSeq: Integer read fLocationSeq write fLocationSeq;
      property Comments: RawUTF8 read fComments write fComments;
      property QuantityOnHandTotal: Double read fQuantityOnHandTotal write fQuantityOnHandTotal;
      property AvailableToPromiseTotal: Double read fAvailableToPromiseTotal write fAvailableToPromiseTotal;
      property AccountingQuantityTotal: Double read fAccountingQuantityTotal write fAccountingQuantityTotal;
      property OldQuantityOnHand: Double read fOldQuantityOnHand write fOldQuantityOnHand;
      property OldAvailableToPromise: Double read fOldAvailableToPromise write fOldAvailableToPromise;
      property SerialNumber: RawUTF8 read fSerialNumber write fSerialNumber;
      property SoftIdentifier: RawUTF8 read fSoftIdentifier write fSoftIdentifier;
      property ActivationNumber: RawUTF8 read fActivationNumber write fActivationNumber;
      property ActivationValidThru: TDateTime read fActivationValidThru write fActivationValidThru;
      property UnitCost: Currency read fUnitCost write fUnitCost;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property FixedAsset: TSQLFixedAssetID read fFixedAsset write fFixedAsset;
  end;

  // 71
  TSQLInventoryItemAttribute = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItemID;
      fAttrName: TSQLInventoryItemTypeAttrID;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property AttrName: TSQLInventoryItemTypeAttrID read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 72
  TSQLInventoryItemDetail = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItemID;
      fInventoryItemDetailSeq: Integer;
      fEffectiveDate: TDateTime;
      fQuantityOnHandDiff: Double;
      fAvailableToPromiseDiff: Double;
      fAccountingQuantityDiff: Double;
      fUnitCost: Double;
      fOrderId: Integer;  //?
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fShipment: Integer;
      fShipmentItemSeq: Integer;
      fReturn: Integer;
      fReturnItemSeq: Integer;
      fWorkEffort: TSQLWorkEffortID;
      fFixedAsset: Integer;
      fMaintHistSeq: Integer;
      fItemIssuance: Integer;
      fReceipt: TSQLShipmentReceiptID;
      fPhysicalInventory: TSQLPhysicalInventoryID;
      fReasonEnum: TSQLEnumerationID;
      fDescription: RawUTF8;
    published
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property InventoryItemDetailSeq: Integer read fInventoryItemDetailSeq write fInventoryItemDetailSeq;
      property EffectiveDate: TDateTime read fEffectiveDate write fEffectiveDate;
      property QuantityOnHandDiff: Double read fQuantityOnHandDiff write fQuantityOnHandDiff;
      property AvailableToPromiseDiff: Double read fAvailableToPromiseDiff write fAvailableToPromiseDiff;
      property AccountingQuantityDiff: Double read fAccountingQuantityDiff write fAccountingQuantityDiff;
      property UnitCost: Double read fUnitCost write fUnitCost;
      property OrderId: Integer read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Shipment: Integer read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Return: Integer read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property WorkEffort: TSQLWorkEffortID read fWorkEffort write fWorkEffort;
      property FixedAsset: Integer read fFixedAsset write fFixedAsset;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property ItemIssuance: Integer read fItemIssuance write fItemIssuance;
      property Receipt: TSQLShipmentReceiptID read fReceipt write fReceipt;
      property PhysicalInventory: TSQLPhysicalInventoryID read fPhysicalInventory write fPhysicalInventory;
      property ReasonEnum: TSQLEnumerationID read fReasonEnum write fReasonEnum;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 73
  TSQLInventoryItemStatus = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItemID;
      fStatus: TSQLStatusItemID;
      fStatusDatetime: TDateTime;
      fStatusEndDatetime: TDateTime;
      fChangeByUserLoginId: TSQLUserLoginID;
      fOwnerParty: Integer; //?
      fProduct: Integer;
    published
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
      property StatusEndDatetime: TDateTime read fStatusEndDatetime write fStatusEndDatetime;
      property ChangeByUserLoginId: TSQLUserLoginID read fChangeByUserLoginId write fChangeByUserLoginId;
      property OwnerParty: Integer read fOwnerParty write fOwnerParty;
      property Product: Integer read fProduct write fProduct;
  end;

  // 74
  TSQLInventoryItemTempRes = class(TSQLRecord)
    private
      fVisit: Integer;
      fProduct: TSQLProductID;
      fProductStore: TSQLProductStoreID;
      fQuantity: Double;
      fReservedDate: TDateTime;
    published
      property Visit: Integer read fVisit write fVisit;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property Quantity: Double read fQuantity write fQuantity;
      property ReservedDate: TDateTime read fReservedDate write fReservedDate;
  end;

  // 75
  TSQLInventoryItemType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLInventoryItemTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLInventoryItemTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 76
  TSQLInventoryItemTypeAttr = class(TSQLRecord)
    private
      fInventoryItemType: TSQLInventoryItemTypeID;
      fAttrName: TSQLInventoryItemAttributeID;
      fDescription: RawUTF8;
    published
      property InventoryItemType: TSQLInventoryItemTypeID read fInventoryItemType write fInventoryItemType;
      property AttrName: TSQLInventoryItemAttributeID read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 77
  TSQLInventoryItemVariance = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItemID;
      fPhysicalInventory: TSQLPhysicalInventoryID;
      fVarianceReason: TSQLVarianceReasonID;
      fAvailableToPromiseVar: Double;
      fQuantityOnHandVar: Double;
      fComments: RawUTF8;
    published
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property PhysicalInventory: TSQLPhysicalInventoryID read fPhysicalInventory write fPhysicalInventory;
      property VarianceReason: TSQLVarianceReasonID read fVarianceReason write fVarianceReason;
      property AvailableToPromiseVar: Double read fAvailableToPromiseVar write fAvailableToPromiseVar;
      property QuantityOnHandVar: Double read fQuantityOnHandVar write fQuantityOnHandVar;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 78
  TSQLInventoryItemLabelType = class(TSQLRecord)
    private
      fParent: TSQLInventoryItemLabelTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLInventoryItemLabelTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 79
  TSQLInventoryItemLabel = class(TSQLRecord)
    private
      fInventoryItemLabelType: TSQLInventoryItemLabelTypeID;
      FDescription: RawUTF8;
    published
      property InventoryItemLabelType: TSQLInventoryItemLabelTypeID read fInventoryItemLabelType write fInventoryItemLabelType;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 80
  TSQLInventoryItemLabelAppl = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItemID;
      fInventoryItemLabelType: TSQLInventoryItemLabelTypeID;
      fInventoryItemLabel: TSQLInventoryItemLabelID;
      fSequenceNum: Integer;
    published
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property InventoryItemLabelType: TSQLInventoryItemLabelTypeID read fInventoryItemLabelType write fInventoryItemLabelType;
      property InventoryItemLabel: TSQLInventoryItemLabelID read fInventoryItemLabel write fInventoryItemLabel;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 81
  TSQLInventoryTransfer = class(TSQLRecord)
    private
      fStatus: TSQLStatusItemID;
      fInventoryItem: TSQLInventoryItemID;
      fFacility: TSQLFacilityID;
      flocationSeq: Integer;
      fContainer: TSQLContainerID;
      fFacilityTo: TSQLFacilityID;
      fLocationSeqTo: Integer;
      fContainerTo: TSQLContainerID;
      fItemIssuance: TSQLItemIssuanceID;
      fSendDate: TDateTime;
      fReceiveDate: TDateTime;
      fComments: RawUTF8;
    published
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property locationSeq: Integer read flocationSeq write flocationSeq;
      property Container: TSQLContainerID read fContainer write fContainer;
      property FacilityTo: TSQLFacilityID read fFacilityTo write fFacilityTo;
      property LocationSeqTo: Integer read fLocationSeqTo write fLocationSeqTo;
      property ContainerTo: TSQLContainerID read fContainerTo write fContainerTo;
      property ItemIssuance: TSQLItemIssuanceID read fItemIssuance write fItemIssuance;
      property SendDate: TDateTime read fSendDate write fSendDate;
      property ReceiveDate: TDateTime read fReceiveDate write fReceiveDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 82 批
  TSQLLot = class(TSQLRecord)
    private
      fCreationDate: TDateTime;
      fQuantity: Double;
      fExpirationDate: TDateTime;
    published
      property CreationDate: TDateTime read fCreationDate write fCreationDate;
      property Quantity: Double read fQuantity write fQuantity;
      property ExpirationDate: TDateTime read fExpirationDate write fExpirationDate;
  end;

  // 83
  TSQLPhysicalInventory = class(TSQLRecord)
    private
      fPhysicalInventoryDate: TDateTime;
      fParty: TSQLPartyID;
      fGeneralComments: RawUTF8;
    published
      property PhysicalInventoryDate: TDateTime read fPhysicalInventoryDate write fPhysicalInventoryDate;
      property Party: TSQLPartyID read fParty write fParty;
      property GeneralComments: RawUTF8 read fGeneralComments write fGeneralComments;
  end;


  // 84 变化原因
  TSQLVarianceReason = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 85 产品支付方式类型
  TSQLProductPaymentMethodType = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fProductPricePurpose: TSQLProductPricePurposeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property ProductPricePurpose: TSQLProductPricePurposeID read fProductPricePurpose write fProductPricePurpose;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 86 产品价格
  TSQLProductPrice = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fProductPriceType: TSQLProductPriceTypeID;
      fProductPricePurpose: TSQLProductPricePurposeID;
      fCurrencyUom: TSQLUomID;
      fProductStoreGroup: TSQLProductStoreGroupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPrice: Currency;
      fTermUom: TSQLUomID;
      fCustomPriceCalcService: TSQLCustomMethodID;
      fPriceWithoutTax: Currency;
      fPriceWithTax: Currency;
      fTaxAmount: Currency;
      fTaxPercentage: Double;
      fTaxAuthParty: TSQLPartyID;
      fTaxAuthGeo: TSQLGeoID;
      fTaxInPrice: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductPriceType: TSQLProductPriceTypeID read fProductPriceType write fProductPriceType;
      property ProductPricePurpose: TSQLProductPricePurposeID read fProductPricePurpose write fProductPricePurpose;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property ProductStoreGroup: TSQLProductStoreGroupID read fProductStoreGroup write fProductStoreGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Price: Currency read fPrice write fPrice;
      property TermUom: TSQLUomID read fTermUom write fTermUom;
      property CustomPriceCalcService: TSQLCustomMethodID read fCustomPriceCalcService write fCustomPriceCalcService;
      property PriceWithoutTax: Currency read fPriceWithoutTax write fPriceWithoutTax;
      property PriceWithTax: Currency read fPriceWithTax write fPriceWithTax;
      property TaxAmount: Currency read fTaxAmount write fTaxAmount;
      property TaxPercentage: Double read fTaxPercentage write fTaxPercentage;
      property TaxAuthParty: TSQLPartyID read fTaxAuthParty write fTaxAuthParty;
      property TaxAuthGeo: TSQLGeoID read fTaxAuthGeo write fTaxAuthGeo;
      property TaxInPrice: Boolean read fTaxInPrice write fTaxInPrice;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 87
  TSQLProductPriceAction = class(TSQLRecord)
    private
      fProductPriceRule: TSQLProductPriceRuleID;
      fProductPriceActionSeq: Integer;
      fProductPriceActionType: TSQLProductPriceActionTypeID;
      fAmount: Double;
      fRateCode: RawUTF8;
    published
      property ProductPriceRule: TSQLProductPriceRuleID read fProductPriceRule write fProductPriceRule;
      property ProductPriceActionSeq: Integer read fProductPriceActionSeq write fProductPriceActionSeq;
      property ProductPriceActionType: TSQLProductPriceActionTypeID read fProductPriceActionType write fProductPriceActionType;
      property Amount: Double read fAmount write fAmount;
      property RateCode: RawUTF8 read fRateCode write fRateCode;
  end;

  // 88
  TSQLProductPriceActionType = class(TSQLRecord)
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

  // 89
  TSQLProductPriceAutoNotice = class(TSQLRecord)
    private
      fFacility: TSQLFacilityID;
      fRunDate: TDateTime;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property RunDate: TDateTime read fRunDate write fRunDate;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 90
  TSQLProductPriceChange = class(TSQLRecord)
    private
      fProduct: Integer;
      fProductPriceType: Integer;
      fProductPricePurpose: Integer;
      fCurrencyUom: Integer;
      fProductStoreGroup: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPrice: Currency;
      fOldPrice: Currency;
      fChangedDate: TDateTime;
      fChangedByUserLogin: TSQLUserLoginID;
    published
      property Product: Integer read fProduct write fProduct;
      property ProductPriceType: Integer read fProductPriceType write fProductPriceType;
      property ProductPricePurpose: Integer read fProductPricePurpose write fProductPricePurpose;
      property CurrencyUom: Integer read fCurrencyUom write fCurrencyUom;
      property ProductStoreGroup: Integer read fProductStoreGroup write fProductStoreGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Price: Currency read fPrice write fPrice;
      property OldPrice: Currency read fOldPrice write fOldPrice;
      property ChangedDate: TDateTime read fChangedDate write fChangedDate;
      property ChangedByUserLogin: TSQLUserLoginID read fChangedByUserLogin write fChangedByUserLogin;
  end;

  // 91
  TSQLProductPriceCond = class(TSQLRecord)
    private
      fProductPriceRule: TSQLProductPriceRuleID;
      fProductPriceCondSeq: Integer;
      fInputParamEnum: TSQLEnumerationID;
      fOperatorEnum: TSQLEnumerationID;
      fCondValue: RawUTF8;
    published
      property ProductPriceRule: TSQLProductPriceRuleID read fProductPriceRule write fProductPriceRule;
      property ProductPriceCondSeq: Integer read fProductPriceCondSeq write fProductPriceCondSeq;
      property InputParamEnum: TSQLEnumerationID read fInputParamEnum write fInputParamEnum;
      property OperatorEnum: TSQLEnumerationID read fOperatorEnum write fOperatorEnum;
      property CondValue: RawUTF8 read fCondValue write fCondValue;
  end;

  // 92
  TSQLProductPricePurpose = class(TSQLRecord)
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

  // 93
  TSQLProductPriceRule = class(TSQLRecord)
    private
      fRuleName: RawUTF8;
      FDescription: RawUTF8;
      fIsSale: Boolean;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property RuleName: RawUTF8 read fRuleName write fRuleName;
      property Description: RawUTF8 read FDescription write FDescription;
      property IsSale: Boolean read fIsSale write fIsSale;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 94
  TSQLProductPriceType = class(TSQLRecord)
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

  // 95
  TSQLQuantityBreak = class(TSQLRecord)
    private
      fQuantityBreakType: TSQLQuantityBreakTypeID;
      fFromQuantity: Double;
      fFhruQuantity: Double;
    published
      property QuantityBreakType: TSQLQuantityBreakTypeID read fQuantityBreakType write fQuantityBreakType;
      property FromQuantity: Double read fFromQuantity write fFromQuantity;
      property FhruQuantity: Double read fFhruQuantity write fFhruQuantity;
  end;

  // 96
  TSQLQuantityBreakType = class(TSQLRecord)
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

  // 97
  TSQLSaleType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 98
  TSQLGoodIdentification = class(TSQLRecord)
    private
      fGoodIdentificationType: TSQLGoodIdentificationTypeID;
      fProduct: TSQLProductID;
      fIdValue: RawUTF8;
    published
      property GoodIdentificationType: TSQLGoodIdentificationTypeID read fGoodIdentificationType write fGoodIdentificationType;
      property Product: TSQLProductID read fProduct write fProduct;
      property IdValue: RawUTF8 read fIdValue write fIdValue;
  end;

  // 99 商品标识类型
  TSQLGoodIdentificationType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLGoodIdentificationTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
     public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLGoodIdentificationTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 100
  TSQLProduct = class(TSQLRecord)
    private
      fProductType: TSQLProductTypeID;
      fPrimaryProductCategory: TSQLProductCategoryID;
      fFacility: TSQLFacilityID;
      fIntroductionDate: TDateTime;
      fReleaseDate: TDateTime;
      fSupportDiscontinuationDate: TDateTime;
      fSalesDiscontinuationDate: TDateTime;
      //当缺货时销售终止
      fSalesDiscWhenNotAvail: Boolean;
      fInternalName: RawUTF8;
      fBrandName: RawUTF8;
      fComments: RawUTF8;
      fProductName: RawUTF8;
      fDescription: RawUTF8;
      fLongDescription: TSQLRawBlob;
      fPriceDetailText: RawUTF8;
      fSmallImageUrl: RawUTF8;
      fMediumImageUrl: RawUTF8;
      fLargeImageUrl: RawUTF8;
      fDetailImageUrl: RawUTF8;
      fOriginalImageUrl: RawUTF8;
      fDetailScreen: TSQLRawBlob;
      fInventoryMessage: RawUTF8;
      fInventoryItemType: TSQLInventoryItemTypeID;
      //要求库存
      fRequireInventory: Boolean;
      fQuantityUom: TSQLUomID;
      //包含的数量
      fQuantityIncluded: Double;
      fPiecesIncluded: Double;
      //要求金额
      fRequireAmount: Boolean;
      //固定面额
      fFixedAmount: Currency;
      fAmountUomType: TSQLUomTypeID;
      fWeightUom: TSQLUomID;
      fShippingWeight: Double;
      fProductWeight: Double;
      fHeightUom: TSQLUomID;
      fProductHeight: Double;
      fShippingHeight: Double;
      fWidthUom: TSQLUomID;
      fProductWidth: Double;
      fShippingWidth: Double;
      fDepthUom: TSQLUomID;
      fProductDepth: Double;
      fShippingDepth: Double;
      fDiameterUom: TSQLUomID;
      fProductDiameter: Double;
      //产品等级
      fProductRating: Double;
      fRatingTypeEnum: TSQLEnumerationID;
      //是否可退货
      fReturnable: Boolean;
      //计税
      fTaxable: Boolean;
      //收费发货
      fChargeShipping: Boolean;
      //自动创建关键字
      fAutoCreateKeywords: Boolean;
      //包含在促销中
      fIncludeInPromotions: Boolean;
      //是虚拟产品
      fIsVirtual: Boolean;
      //是变形产品
      fIsVariant: Boolean;
      ///虚拟变形方法
      fVirtualVariantMethodEnum: TSQLEnumerationID;
      fOriginGeo: TSQLGeoID;
      //需求方式枚举
      fRequirementMethodEnum: TSQLEnumerationID;
      //物料清单级别
      fBillOfMaterialLevel: Double;
      //用于租赁的最大人数
      fReservMaxPersons: Double;
      //添加第二个人员。价格百分数
      fReserv2ndPPPerc: Double;
      //添加第N个人员。价格百分数
      fReservNthPPPerc: Double;
      //配置标识
      fConfig: Integer;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      {fLastModifiedByUserLogin: TSQLUserLoginID;
      fInShippingBox: Boolean;
      fDefaultShipmentBoxType: TSQLShipmentBoxTypeID;
      fLotIdFilledIn: TSQLRawBlob;
      fOrderDecimalQuantity: Boolean;}
    published
      property ProductType: TSQLProductTypeID read fProductType write fProductType;
      property PrimaryProductCategory: TSQLProductCategoryID read fPrimaryProductCategory write fPrimaryProductCategory;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property IntroductionDate: TDateTime read fIntroductionDate write fIntroductionDate;
      property ReleaseDate: TDateTime read fReleaseDate write fReleaseDate;
      property SupportDiscontinuationDate: TDateTime read fSupportDiscontinuationDate write fSupportDiscontinuationDate;
      property SalesDiscontinuationDate: TDateTime read fSalesDiscontinuationDate write fSalesDiscontinuationDate;
      property SalesDiscWhenNotAvail: Boolean read fSalesDiscWhenNotAvail write fSalesDiscWhenNotAvail;
      property InternalName: RawUTF8 read fInternalName write fInternalName;
      property BrandName: RawUTF8 read fBrandName write fBrandName;
      property Comments: RawUTF8 read fComments write fComments;
      property ProductName: RawUTF8 read fProductName write fProductName;
      property Description: RawUTF8 read fDescription write fDescription;
      property LongDescription: TSQLRawBlob read fLongDescription write fLongDescription;
      property PriceDetailText: RawUTF8 read fPriceDetailText write fPriceDetailText;
      property SmallImageUrl: RawUTF8 read fSmallImageUrl write fSmallImageUrl;
      property MediumImageUrl: RawUTF8 read fMediumImageUrl write fMediumImageUrl;
      property LargeImageUrl: RawUTF8 read fLargeImageUrl write fLargeImageUrl;
      property DetailImageUrl: RawUTF8 read fDetailImageUrl write fDetailImageUrl;
      property OriginalImageUrl: RawUTF8 read fOriginalImageUrl write fOriginalImageUrl;
      property DetailScreen: TSQLRawBlob read fDetailScreen write fDetailScreen;
      property InventoryMessage: RawUTF8 read fInventoryMessage write fInventoryMessage;
      property InventoryItemType: TSQLInventoryItemTypeID read fInventoryItemType write fInventoryItemType;
      property RequireInventory: Boolean read fRequireInventory write fRequireInventory;
      property QuantityUom: TSQLUomID read fQuantityUom write fQuantityUom;
      property QuantityIncluded: Double read fQuantityIncluded write fQuantityIncluded;
      property PiecesIncluded: Double read fPiecesIncluded write fPiecesIncluded;
      property RequireAmount: Boolean read fRequireAmount write fRequireAmount;
      property FixedAmount: Currency read fFixedAmount write fFixedAmount;
      property AmountUomType: TSQLUomTypeID read fAmountUomType write fAmountUomType;
      property WeightUom: TSQLUomID read fWeightUom write fWeightUom;
      property ShippingWeight: Double read fShippingWeight write fShippingWeight;
      property ProductWeight: Double read fProductWeight write fProductWeight;
      property HeightUom: TSQLUomID read fHeightUom write fHeightUom;
      property ProductHeight: Double read fProductHeight write fProductHeight;
      property ShippingHeight: Double read fShippingHeight write fShippingHeight;
      property WidthUom: TSQLUomID read fWidthUom write fWidthUom;
      property ProductWidth: Double read fProductWidth write fProductWidth;
      property ShippingWidth: Double read fShippingWidth write fShippingWidth;
      property DepthUom: TSQLUomID read fDepthUom write fDepthUom;
      property ProductDepth: Double read fProductDepth write fProductDepth;
      property ShippingDepth: Double read fShippingDepth write fShippingDepth;
      property DiameterUom: TSQLUomID read fDiameterUom write fDiameterUom;
      property ProductDiameter: Double read fProductDiameter write fProductDiameter;
      property ProductRating: Double read fProductRating write fProductRating;
      property RatingTypeEnum: TSQLEnumerationID read fRatingTypeEnum write fRatingTypeEnum;
      property Returnable: Boolean read fReturnable write fReturnable;
      property Taxable: Boolean read fTaxable write fTaxable;
      property ChargeShipping: Boolean read fChargeShipping write fChargeShipping;
      property AutoCreateKeywords: Boolean read fAutoCreateKeywords write fAutoCreateKeywords;
      property IncludeInPromotions: Boolean read fIncludeInPromotions write fIncludeInPromotions;
      property IsVirtual: Boolean read fIsVirtual write fIsVirtual;
      property IsVariant: Boolean read fIsVariant write fIsVariant;
      property VirtualVariantMethodEnum: TSQLEnumerationID read fVirtualVariantMethodEnum write fVirtualVariantMethodEnum;
      property OriginGeo: TSQLGeoID read fOriginGeo write fOriginGeo;
      property RequirementMethodEnum: TSQLEnumerationID read fRequirementMethodEnum write fRequirementMethodEnum;
      property BillOfMaterialLevel: Double read fBillOfMaterialLevel write fBillOfMaterialLevel;
      property ReservMaxPersons: Double read fReservMaxPersons write fReservMaxPersons;
      property Reserv2ndPPPerc: Double read fReserv2ndPPPerc write fReserv2ndPPPerc;
      property ReservNthPPPerc: Double read fReservNthPPPerc write fReservNthPPPerc;
      property Config: Integer read fConfig write fConfig;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      {property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      property InShippingBox: Boolean read fInShippingBox write fInShippingBox;
      property DefaultShipmentBoxType: TSQLShipmentBoxTypeID read fDefaultShipmentBoxType write fDefaultShipmentBoxType;
      property LotIdFilledIn: TSQLRawBlob read fLotIdFilledIn write fLotIdFilledIn;
      property OrderDecimalQuantity: Boolean read fOrderDecimalQuantity write fOrderDecimalQuantity;}
  end;

  // 101 产品关联
  TSQLProductAssoc = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fProductTo: TSQLProductID;
      fProductAssocType: TSQLProductAssocTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fReason: RawUTF8;
      fQuantity: Double;
      fScrapFactor: Double;
      fInstruction: RawUTF8;
      fRoutingWorkEffort: TSQLWorkEffortID;
      //预计计算方法
      fEstimateCalcMethod: TSQLCustomMethodID;
      //循环信息
      fRecurrenceInfo: TSQLRecurrenceInfoID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductTo: TSQLProductID read fProductTo write fProductTo;
      property ProductAssocType: TSQLProductAssocTypeID read fProductAssocType write fProductAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Reason: RawUTF8 read fReason write fReason;
      property Quantity: Double read fQuantity write fQuantity;
      property ScrapFactor: Double read fScrapFactor write fScrapFactor;
      property Instruction: RawUTF8 read fInstruction write fInstruction;
      property RoutingWorkEffort: TSQLWorkEffortID read fRoutingWorkEffort write fRoutingWorkEffort;
      property EstimateCalcMethod: TSQLCustomMethodID read fEstimateCalcMethod write fEstimateCalcMethod;
      property RecurrenceInfo: TSQLRecurrenceInfoID read fRecurrenceInfo write fRecurrenceInfo;
  end;

  // 102
  TSQLProductAssocType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductAssocTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductAssocTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 103
  TSQLProductRole = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fComments: RawUTF8;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 104
  TSQLProductAttribute = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrType: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrType: RawUTF8 read fAttrType write fAttrType;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 105 产品统计信息
  TSQLProductCalculatedInfo = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fTotalQuantityOrdered: Double;
      fTotalTimesViewed: Integer;
      fAverageCustomerRating: Double;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property TotalQuantityOrdered: Double read fTotalQuantityOrdered write fTotalQuantityOrdered;
      property TotalTimesViewed: Integer read fTotalTimesViewed write fTotalTimesViewed;
      property AverageCustomerRating: Double read fAverageCustomerRating write fAverageCustomerRating;
  end;

  // 106 产品内容
  TSQLProductContent = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fContent: TSQLContentID;
      fProductContentType: TSQLProductContentTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPurchaseFromDate: TDateTime;
      fPurchaseThruDate: TDateTime;
      fUseCountLimit: Integer;
      fUseTime: Integer;
      fUseTimeUom: TSQLUomID;
      fUseRoleType: TSQLRoleTypeID;
      fSequenceNum: Integer;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Content: TSQLContentID read fContent write fContent;
      property ProductContentType: TSQLProductContentTypeID read fProductContentType write fProductContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PurchaseFromDate: TDateTime read fPurchaseFromDate write fPurchaseFromDate;
      property PurchaseThruDate: TDateTime read fPurchaseThruDate write fPurchaseThruDate;
      property UseCountLimit: Integer read fUseCountLimit write fUseCountLimit;
      property UseTime: Integer read fUseTime write fUseTime;
      property UseTimeUom: TSQLUomID read fUseTimeUom write fUseTimeUom;
      property UseRoleType: TSQLRoleTypeID read fUseRoleType write fUseRoleType;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 107
  TSQLProductContentType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductContentTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductContentTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 108
  TSQLProductGeo = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fGeo: TSQLGeoID;
      fProductGeoEnum: TSQLEnumerationID;
      fDescription: RawUTF8;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Geo: TSQLGeoID read fGeo write fGeo;
      property ProductGeoEnum: TSQLEnumerationID read fProductGeoEnum write fProductGeoEnum;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 109 产品总账账户
  TSQLProductGlAccount = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fOrganizationParty: TSQLPartyID;
      fGlAccountType: TSQLGlAccountTypeID;
      fGlAccount: TSQLGlAccountID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property OrganizationParty: TSQLPartyID read fOrganizationParty write fOrganizationParty;
      property GlAccountType: TSQLGlAccountTypeID read fGlAccountType write fGlAccountType;
      property GlAccount: TSQLGlAccountID read fGlAccount write fGlAccount;
  end;

  // 110
  TSQLProductKeyword = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fKeyword: RawUTF8;
      fKeywordType: TSQLEnumerationID;
      fRelevancyWeight: Double;
      fStatus: TSQLStatusItemID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Keyword: RawUTF8 read fKeyword write fKeyword;
      property KeywordType: TSQLEnumerationID read fKeywordType write fKeywordType;
      property RelevancyWeight: Double read fRelevancyWeight write fRelevancyWeight;
      property Status: TSQLStatusItemID read fStatus write fStatus;
  end;

  // 111
  TSQLProductMeter = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fProductMeterType: TSQLProductMeterTypeID;
      fMeterUom: TSQLUomID;
      fMeterName: RawUTF8;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductMeterType: TSQLProductMeterTypeID read fProductMeterType write fProductMeterType;
      property MeterUom: TSQLUomID read fMeterUom write fMeterUom;
      property MeterName: RawUTF8 read fMeterName write fMeterName;
  end;

  // 112
  TSQLProductMeterType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fDefaultUom: TSQLUomID;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property DefaultUom: TSQLUomID read fDefaultUom write fDefaultUom;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 113 产品维护
  TSQLProductMaint = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fProductMaintSeq: RawUTF8;
      fProductMaintType: TSQLProductMaintTypeID;
      fMaintName: RawUTF8;
      //维护模板工作计划
      fMaintTemplateWorkEffort: TSQLWorkEffortID;
      //间隔数量
      fIntervalQuantity: Double;
      //间隔单位
      fIntervalUom: TSQLUomID;
      //间隔仪表类型
      fIntervalMeterType: TSQLProductMeterTypeID;
      //重复次数
      fRepeatCount: Integer;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductMaintSeq: RawUTF8 read fProductMaintSeq write fProductMaintSeq;
      property ProductMaintType: TSQLProductMaintTypeID read fProductMaintType write fProductMaintType;
      property MaintName: RawUTF8 read fMaintName write fMaintName;
      property MaintTemplateWorkEffort: TSQLWorkEffortID read fMaintTemplateWorkEffort write fMaintTemplateWorkEffort;
      property IntervalQuantity: Double read fIntervalQuantity write fIntervalQuantity;
      property IntervalUom: TSQLUomID read fIntervalUom write fIntervalUom;
      property IntervalMeterType: TSQLProductMeterTypeID read fIntervalMeterType write fIntervalMeterType;
      property RepeatCount: Integer read fRepeatCount write fRepeatCount;
  end;

  // 114
  TSQLProductMaintType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductMaintTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductMaintTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 115 产品评论
  TSQLProductReview = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fProduct: TSQLProductID;
      fUserLogin: TSQLUserLoginID;
      fStatus: TSQLStatusItemID;
      fPostedAnonymous: Boolean;
      fPostedDateTime: TDateTime;
      fProductRating: Double;
      fProductReview: TSQLRawBlob;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property Product: TSQLProductID read fProduct write fProduct;
      property UserLogin: TSQLUserLoginID read fUserLogin write fUserLogin;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property PostedAnonymous: Boolean read fPostedAnonymous write fPostedAnonymous;
      property PostedDateTime: TDateTime read fPostedDateTime write fPostedDateTime;
      property ProductRating: Double read fProductRating write fProductRating;
      property ProductReview: TSQLRawBlob read fProductReview write fProductReview;
  end;

  // 116
  TSQLProductSearchConstraint = class(TSQLRecord)
    private
      fProductSearchResult: TSQLProductSearchResultID;
      fConstraintSeq: RawUTF8;
      fConstraintName: RawUTF8;
      fInfoString: RawUTF8;
      //包括子分类
      fIncludeSubCategories: Boolean;
      fIsAnd: Boolean;
      //任意前缀
      fAnyPrefix: Boolean;
      //任意后缀
      fAnySuffix: Boolean;
      //去词干
      fRemoveStems: Boolean;
      fLowValue: RawUTF8;
      fHighValue: RawUTF8;
    published
      property ProductSearchResult: TSQLProductSearchResultID read fProductSearchResult write fProductSearchResult;
      property ConstraintSeq: RawUTF8 read fConstraintSeq write fConstraintSeq;
      property ConstraintName: RawUTF8 read fConstraintName write fConstraintName;
      property InfoString: RawUTF8 read fInfoString write fInfoString;
      property IncludeSubCategories: Boolean read fIncludeSubCategories write fIncludeSubCategories;
      property IsAnd: Boolean read fIsAnd write fIsAnd;
      property AnyPrefix: Boolean read fAnyPrefix write fAnyPrefix;
      property AnySuffix: Boolean read fAnySuffix write fAnySuffix;
      property RemoveStems: Boolean read fRemoveStems write fRemoveStems;
      property LowValue: RawUTF8 read fLowValue write fLowValue;
      property HighValue: RawUTF8 read fHighValue write fHighValue;
  end;

  // 117
  TSQLProductSearchResult = class(TSQLRecord)
    private
      fVisit: Integer;
      fOrderByName: RawUTF8;
      fIsAscending: Boolean;
      fNumResults: Integer;
      fSecondsTotal: Double;
      fSearchDate: TDateTime;
    published
      property Visit: Integer read fVisit write fVisit;
      property OrderByName: RawUTF8 read fOrderByName write fOrderByName;
      property IsAscending: Boolean read fIsAscending write fIsAscending;
      property NumResults: Integer read fNumResults write fNumResults;
      property SecondsTotal: Double read fSecondsTotal write fSecondsTotal;
      property SearchDate: TDateTime read fSearchDate write fSearchDate;
  end;

  // 118
  TSQLProductType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLProductTypeID;
      fIsPhysical: Boolean;
      fIsDigital: Boolean;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLProductTypeID read fParent write fParent;
      property IsPhysical: Boolean read fIsPhysical write fIsPhysical;
      property IsDigital: Boolean read fIsDigital write fIsDigital;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 119
  TSQLProductTypeAttr = class(TSQLRecord)
    private
      fProductType: TSQLProductTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property ProductType: TSQLProductTypeID read fProductType write fProductType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 120 卖方产品
  TSQLVendorProduct = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fVendorParty: TSQLPartyID;
      fProductStoreGroup: TSQLProductStoreGroupID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property VendorParty: TSQLPartyID read fVendorParty write fVendorParty;
      property ProductStoreGroup: TSQLProductStoreGroupID read fProductStoreGroup write fProductStoreGroup;
  end;

  // 121
  TSQLProductPromo = class(TSQLRecord)
    private
      fPromoName: RawUTF8;
      fPromoText: RawUTF8;
      fUserEntered: Boolean;
      fShowToCustomer: Boolean;
      fRequireCode: Boolean;
      fUseLimitPerOrder: Double;
      fUseLimitPerCustomer: Double;
      fUseLimitPerPromotion: Double;
      fBillbackFactor: Double;
      fOverrideOrgParty: TSQLPartyID;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property PromoName: RawUTF8 read fPromoName write fPromoName;
      property PromoText: RawUTF8 read fPromoText write fPromoText;
      property UserEntered: Boolean read fUserEntered write fUserEntered;
      property ShowToCustomer: Boolean read fShowToCustomer write fShowToCustomer;
      property RequireCode: Boolean read fRequireCode write fRequireCode;
      property UseLimitPerOrder: Double read fUseLimitPerOrder write fUseLimitPerOrder;
      property UseLimitPerCustomer: Double read fUseLimitPerCustomer write fUseLimitPerCustomer;
      property UseLimitPerPromotion: Double read fUseLimitPerPromotion write fUseLimitPerPromotion;
      property BillbackFactor: Double read fBillbackFactor write fBillbackFactor;
      property OverrideOrgParty: TSQLPartyID read fOverrideOrgParty write fOverrideOrgParty;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 122
  TSQLProductPromoAction = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: TSQLProductPromoRuleID;
      fProductPromoActionSeq: Integer;
      fProductPromoActionEnum: TSQLEnumerationID;
      fOrderAdjustmentType: TSQLOrderAdjustmentTypeID;
      fServiceName: RawUTF8;
      fQuantity: Double;
      fAmount: Double;
      fProduct: Integer;
      fParty: Integer;
      fUseCartQuantity: Boolean;
    published
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRuleID read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductPromoActionEnum: TSQLEnumerationID read fProductPromoActionEnum write fProductPromoActionEnum;
      property OrderAdjustmentType: TSQLOrderAdjustmentTypeID read fOrderAdjustmentType write fOrderAdjustmentType;
      property ServiceName: RawUTF8 read fServiceName write fServiceName;
      property Quantity: Double read fQuantity write fQuantity;
      property Amount: Double read fAmount write fAmount;
      property Product: Integer read fProduct write fProduct;
      property Party: Integer read fParty write fParty;
      property UseCartQuantity: Boolean read fUseCartQuantity write fUseCartQuantity;
  end;

  // 123
  TSQLProductPromoCategory = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: TSQLProductPromoRuleID;
      fProductPromoActionSeq: Integer;
      fproductPromoCondSeq: Integer;
      fProductCategory: TSQLProductCategoryID;
      fAndGroup: Integer;
      fProductPromoApplEnum: TSQLEnumerationID;
      fIncludeSubCategories: Boolean;
    published
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRuleID read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property productPromoCondSeq: Integer read fproductPromoCondSeq write fproductPromoCondSeq;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property AndGroup: Integer read fAndGroup write fAndGroup;
      property ProductPromoApplEnum: TSQLEnumerationID read fProductPromoApplEnum write fProductPromoApplEnum;
      property IncludeSubCategories: Boolean read fIncludeSubCategories write fIncludeSubCategories;
  end;

  // 124
  TSQLProductPromoCode = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromoID;
      fUserEntered: Boolean;
      fRequireEmailOrParty: Boolean;
      fUseLimitPerCode: Integer;
      fUseLimitPerCustomer: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLoginID;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLoginID;
    published
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property UserEntered: Boolean read fUserEntered write fUserEntered;
      property RequireEmailOrParty: Boolean read fRequireEmailOrParty write fRequireEmailOrParty;
      property UseLimitPerCode: Integer read fUseLimitPerCode write fUseLimitPerCode;
      property UseLimitPerCustomer: Integer read fUseLimitPerCustomer write fUseLimitPerCustomer;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLoginID read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLoginID read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 125
  TSQLProductPromoCodeEmail = class(TSQLRecord)
    private
      fProductPromoCode: TSQLProductPromoCodeID;
      fEmailAddress: RawUTF8;
    published
      property ProductPromoCode: TSQLProductPromoCodeID read fProductPromoCode write fProductPromoCode;
      property EmailAddress: RawUTF8 read fEmailAddress write fEmailAddress;
  end;

  // 126
  TSQLProductPromoCodeParty = class(TSQLRecord)
    private
      fProductPromoCode: TSQLProductPromoCodeID;
      fParty: TSQLPartyID;
    published
      property ProductPromoCode: TSQLProductPromoCodeID read fProductPromoCode write fProductPromoCode;
      property Party: TSQLPartyID read fParty write fParty;
  end;

  // 127
  TSQLProductPromoCond = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: TSQLProductPromoRuleID;
      fProductPromoCondSeq: Integer;
      fInputParamEnum: TSQLEnumerationID;
      fOperatorEnum: TSQLEnumerationID;
      fCondValue: RawUTF8;
      fOtherValue: RawUTF8;
    published
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRuleID read fProductPromoRule write fProductPromoRule;
      property ProductPromoCondSeq: Integer read fProductPromoCondSeq write fProductPromoCondSeq;
      property InputParamEnum: TSQLEnumerationID read fInputParamEnum write fInputParamEnum;
      property OperatorEnum: TSQLEnumerationID read fOperatorEnum write fOperatorEnum;
      property CondValue: RawUTF8 read fCondValue write fCondValue;
      property OtherValue: RawUTF8 read fOtherValue write fOtherValue;
  end;

  // 128
  TSQLProductPromoProduct = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: Integer;
      fProductPromoActionSeq: Integer;
      fProductPromoCondSeq: Integer;
      fProduct: TSQLProductID;
      fProductPromoApplEnum: TSQLEnumerationID;
    published
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: Integer read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductPromoCondSeq: Integer read fProductPromoCondSeq write fProductPromoCondSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductPromoApplEnum: TSQLEnumerationID read fProductPromoApplEnum write fProductPromoApplEnum;
  end;

  // 129
  TSQLProductPromoRule = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromoID;
      fProductPromoRule: Integer;
      fRuleName: RawUTF8;
    published
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoRule: Integer read fProductPromoRule write fProductPromoRule;
      property RuleName: RawUTF8 read fRuleName write fRuleName;
  end;

  // 130
  TSQLProductPromoUse = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeaderID;
      fPromoSequence: Integer;
      fProductPromo: TSQLProductPromoID;
      fProductPromoCode: TSQLProductPromoCodeID;
      fParty: TSQLPartyID;
      fTotalDiscountAmount: Currency;
      fQuantityLeftInActions: Double;
    published
      property OrderId: TSQLOrderHeaderID read fOrderId write fOrderId;
      property PromoSequence: Integer read fPromoSequence write fPromoSequence;
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property ProductPromoCode: TSQLProductPromoCodeID read fProductPromoCode write fProductPromoCode;
      property Party: TSQLPartyID read fParty write fParty;
      property TotalDiscountAmount: Currency read fTotalDiscountAmount write fTotalDiscountAmount;
      property QuantityLeftInActions: Double read fQuantityLeftInActions write fQuantityLeftInActions;
  end;

  // 131
  TSQLProductStore = class(TSQLRecord)
    private
      fProductStoreGroup: TSQLProductStoreGroupID;
      fStoreName: RawUTF8;
      fCompanyName: RawUTF8;
      fTitle: RawUTF8;
      fSubtitle: RawUTF8;
      fPayToParty: TSQLPartyID;
      fDaysToCancelNonPay: Integer;
      fManualAuthIsCapture: Boolean;
      fProrateShipping: Boolean;
      fProrateTaxes: Boolean;
      fViewCartOnAdd: Boolean;
      fAutoSaveCart: Boolean;
      fAutoApproveReviews: Boolean;
      fIsDemoStore: Boolean;
      fIsImmediatelyFulfilled: Boolean;
      fInventoryFacility: TSQLFacilityID;
      fOneInventoryFacility: Boolean;
      fCheckInventory: Boolean;
      fReserveInventory: Boolean;
      fReserveOrderEnum: TSQLEnumerationID;
      fRequireInventory: Boolean;
      fBalanceResOnOrderCreation: Boolean;
      fRequirementMethodEnum: TSQLEnumerationID;
      fOrderNumberPrefix: RawUTF8;
      fDefaultLocaleString: RawUTF8;
      fDefaultCurrencyUomId: TSQLUomID;
      fDefaultTimeZoneString: RawUTF8;
      fDefaultSalesChannelEnum: TSQLEnumerationID;
      fAllowPassword: Boolean;
      fDefaultPassword: RawUTF8;
      fExplodeOrderItems: Boolean;
      fCheckGcBalance: Boolean;
      fRetryFailedAuths: Boolean;
      fHeaderApprovedStatus: TSQLStatusItemID;
      fItemApprovedStatus: TSQLStatusItemID;
      fDigitalItemApprovedStatus: TSQLStatusItemID;
      fHeaderDeclinedStatus: TSQLStatusItemID;
      fItemDeclinedStatus: TSQLStatusItemID;
      fHeaderCancelStatus: TSQLStatusItemID;
      fItemCancelStatus: TSQLStatusItemID;
      fAuthDeclinedMessage: RawUTF8;
      fAuthFraudMessage: RawUTF8;
      fAuthErrorMessage: RawUTF8;
      fVisualTheme: Integer;
      fStoreCreditAccountEnum: TSQLEnumerationID;
      fUsePrimaryEmailUsername: Boolean;
      fRequireCustomerRole: Boolean;
      fAutoInvoiceDigitalItems: Boolean;
      fReqShipAddrForDigItems: Boolean;
      fShowCheckoutGiftOptions: Boolean;
      fSelectPaymentTypePerItem: Boolean;
      fShowPricesWithVatTax: Boolean;
      fShowTaxIsExempt: Boolean;
      fVatTaxAuthGeo: Integer;
      fVatTaxAuthParty: Integer;
      fEnableAutoSuggestionList: Boolean;
      fEnableDigProdUpload: Boolean;
      fProdSearchExcludeVariants: Boolean;
      fDigProdUploadCategory: Integer;
      fAutoOrderCcTryExp: Boolean;
      fAutoOrderCcTryOtherCards: Boolean;
      fAutoOrderCcTryLaterNsf: Boolean;
      fAutoOrderCcTryLaterMax: Integer;
      fStoreCreditValidDays: Integer;
      {fAutoApproveInvoice: Boolean;
      fAutoApproveOrder: Boolean;
      fShipIfCaptureFails: RawUTF8;
      fSetOwnerUponIssuance: Boolean;
      fReqReturnInventoryReceive: Boolean;
      fAddToCartRemoveIncompat: Boolean;
      fAddToCartReplaceUpsell: Boolean;
      fSplitPayPrefPerShpGrp: Boolean;
      fManagedByLot: Boolean;
      fShowOutOfStockProducts: Boolean;
      fOrderDecimalQuantity: Boolean;
      fAllowComment: Boolean;}
    published
      property ProductStoreGroup: TSQLProductStoreGroupID read fProductStoreGroup write fProductStoreGroup;
      property StoreName: RawUTF8 read fStoreName write fStoreName;
      property CompanyName: RawUTF8 read fCompanyName write fCompanyName;
      property Title: RawUTF8 read fTitle write fTitle;
      property Subtitle: RawUTF8 read fSubtitle write fSubtitle;
      property PayToParty: TSQLPartyID read fPayToParty write fPayToParty;
      property DaysToCancelNonPay: Integer read fDaysToCancelNonPay write fDaysToCancelNonPay;
      property ManualAuthIsCapture: Boolean read fManualAuthIsCapture write fManualAuthIsCapture;
      property ProrateShipping: Boolean read fProrateShipping write fProrateShipping;
      property ProrateTaxes: Boolean read fProrateTaxes write fProrateTaxes;
      property ViewCartOnAdd: Boolean read fViewCartOnAdd write fViewCartOnAdd;
      property AutoSaveCart: Boolean read fAutoSaveCart write fAutoSaveCart;
      property AutoApproveReviews: Boolean read fAutoApproveReviews write fAutoApproveReviews;
      property IsDemoStore: Boolean read fIsDemoStore write fIsDemoStore;
      property IsImmediatelyFulfilled: Boolean read fIsImmediatelyFulfilled write fIsImmediatelyFulfilled;
      property InventoryFacility: TSQLFacilityID read fInventoryFacility write fInventoryFacility;
      property OneInventoryFacility: Boolean read fOneInventoryFacility write fOneInventoryFacility;
      property CheckInventory: Boolean read fCheckInventory write fCheckInventory;
      property ReserveInventory: Boolean read fReserveInventory write fReserveInventory;
      property ReserveOrderEnum: TSQLEnumerationID read fReserveOrderEnum write fReserveOrderEnum;
      property RequireInventory: Boolean read fRequireInventory write fRequireInventory;
      property BalanceResOnOrderCreation: Boolean read fBalanceResOnOrderCreation write fBalanceResOnOrderCreation;
      property RequirementMethodEnum: TSQLEnumerationID read fRequirementMethodEnum write fRequirementMethodEnum;
      property OrderNumberPrefix: RawUTF8 read fOrderNumberPrefix write fOrderNumberPrefix;
      property DefaultLocaleString: RawUTF8 read fDefaultLocaleString write fDefaultLocaleString;
      property DefaultCurrencyUomId: TSQLUomID read fDefaultCurrencyUomId write fDefaultCurrencyUomId;
      property DefaultTimeZoneString: RawUTF8 read fDefaultTimeZoneString write fDefaultTimeZoneString;
      property DefaultSalesChannelEnum: TSQLEnumerationID read fDefaultSalesChannelEnum write fDefaultSalesChannelEnum;
      property AllowPassword: Boolean read fAllowPassword write fAllowPassword;
      property DefaultPassword: RawUTF8 read fDefaultPassword write fDefaultPassword;
      property ExplodeOrderItems: Boolean read fExplodeOrderItems write fExplodeOrderItems;
      property CheckGcBalance: Boolean read fCheckGcBalance write fCheckGcBalance;
      property RetryFailedAuths: Boolean read fRetryFailedAuths write fRetryFailedAuths;
      property HeaderApprovedStatus: TSQLStatusItemID read fHeaderApprovedStatus write fHeaderApprovedStatus;
      property ItemApprovedStatus: TSQLStatusItemID read fItemApprovedStatus write fItemApprovedStatus;
      property DigitalItemApprovedStatus: TSQLStatusItemID read fDigitalItemApprovedStatus write fDigitalItemApprovedStatus;
      property HeaderDeclinedStatus: TSQLStatusItemID read fHeaderDeclinedStatus write fHeaderDeclinedStatus;
      property ItemDeclinedStatus: TSQLStatusItemID read fItemDeclinedStatus write fItemDeclinedStatus;
      property HeaderCancelStatus: TSQLStatusItemID read fHeaderCancelStatus write fHeaderCancelStatus;
      property ItemCancelStatus: TSQLStatusItemID read fItemCancelStatus write fItemCancelStatus;
      property AuthDeclinedMessage: RawUTF8 read fAuthDeclinedMessage write fAuthDeclinedMessage;
      property AuthFraudMessage: RawUTF8 read fAuthFraudMessage write fAuthFraudMessage;
      property AuthErrorMessage: RawUTF8 read fAuthErrorMessage write fAuthErrorMessage;
      property VisualTheme: Integer read fVisualTheme write fVisualTheme;
      property StoreCreditAccountEnum: TSQLEnumerationID read fStoreCreditAccountEnum write fStoreCreditAccountEnum;
      property UsePrimaryEmailUsername: Boolean read fUsePrimaryEmailUsername write fUsePrimaryEmailUsername;
      property RequireCustomerRole: Boolean read fRequireCustomerRole write fRequireCustomerRole;
      property AutoInvoiceDigitalItems: Boolean read fAutoInvoiceDigitalItems write fAutoInvoiceDigitalItems;
      property ReqShipAddrForDigItems: Boolean read fReqShipAddrForDigItems write fReqShipAddrForDigItems;
      property ShowCheckoutGiftOptions: Boolean read fShowCheckoutGiftOptions write fShowCheckoutGiftOptions;
      property SelectPaymentTypePerItem: Boolean read fSelectPaymentTypePerItem write fSelectPaymentTypePerItem;
      property ShowPricesWithVatTax: Boolean read fShowPricesWithVatTax write fShowPricesWithVatTax;
      property ShowTaxIsExempt: Boolean read fShowTaxIsExempt write fShowTaxIsExempt;
      property VatTaxAuthGeo: Integer read fVatTaxAuthGeo write fVatTaxAuthGeo;
      property VatTaxAuthParty: Integer read fVatTaxAuthParty write fVatTaxAuthParty;
      property EnableAutoSuggestionList: Boolean read fEnableAutoSuggestionList write fEnableAutoSuggestionList;
      property EnableDigProdUpload: Boolean read fEnableDigProdUpload write fEnableDigProdUpload;
      property ProdSearchExcludeVariants: Boolean read fProdSearchExcludeVariants write fProdSearchExcludeVariants;
      property DigProdUploadCategory: Integer read fDigProdUploadCategory write fDigProdUploadCategory;
      property AutoOrderCcTryExp: Boolean read fAutoOrderCcTryExp write fAutoOrderCcTryExp;
      property AutoOrderCcTryOtherCards: Boolean read fAutoOrderCcTryOtherCards write fAutoOrderCcTryOtherCards;
      property AutoOrderCcTryLaterNsf: Boolean read fAutoOrderCcTryLaterNsf write fAutoOrderCcTryLaterNsf;
      property AutoOrderCcTryLaterMax: Integer read fAutoOrderCcTryLaterMax write fAutoOrderCcTryLaterMax;
      property StoreCreditValidDays: Integer read fStoreCreditValidDays write fStoreCreditValidDays;
      {property AutoApproveInvoice: Boolean read fAutoApproveInvoice write fAutoApproveInvoice;
      property AutoApproveOrder: Boolean read fAutoApproveOrder write fAutoApproveOrder;
      property ShipIfCaptureFails: RawUTF8 read fShipIfCaptureFails write fShipIfCaptureFails;
      property SetOwnerUponIssuance: Boolean read fSetOwnerUponIssuance write fSetOwnerUponIssuance;
      property ReqReturnInventoryReceive: Boolean read fReqReturnInventoryReceive write fReqReturnInventoryReceive;
      property AddToCartRemoveIncompat: Boolean read fAddToCartRemoveIncompat write fAddToCartRemoveIncompat;
      property AddToCartReplaceUpsell: Boolean read fAddToCartReplaceUpsell write fAddToCartReplaceUpsell;
      property SplitPayPrefPerShpGrp: Boolean read fSplitPayPrefPerShpGrp write fSplitPayPrefPerShpGrp;
      property ManagedByLot: Boolean read fManagedByLot write fManagedByLot;
      property ShowOutOfStockProducts: Boolean read fShowOutOfStockProducts write fShowOutOfStockProducts;
      property OrderDecimalQuantity: Boolean read fOrderDecimalQuantity write fOrderDecimalQuantity;
      property AllowComment: Boolean read fAllowComment write fAllowComment;}
  end;

  // 132
  TSQLProductStoreCatalog = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fProdCatalog: TSQLProdCatalogID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property ProdCatalog: TSQLProdCatalogID read fProdCatalog write fProdCatalog;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 133
  TSQLProductStoreEmailSetting = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fEmailType: TSQLEnumerationID;
      fBodyScreenLocation: RawUTF8;
      fXslfoAttachScreenLocation: RawUTF8;
      fFromAddress: RawUTF8;
      fCcAddress: RawUTF8;
      fBccAddress: RawUTF8;
      fSubject: RawUTF8;
      fContentType: RawUTF8;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property EmailType: TSQLEnumerationID read fEmailType write fEmailType;
      property BodyScreenLocation: RawUTF8 read fBodyScreenLocation write fBodyScreenLocation;
      property XslfoAttachScreenLocation: RawUTF8 read fXslfoAttachScreenLocation write fXslfoAttachScreenLocation;
      property FromAddress: RawUTF8 read fFromAddress write fFromAddress;
      property CcAddress: RawUTF8 read fCcAddress write fCcAddress;
      property BccAddress: RawUTF8 read fBccAddress write fBccAddress;
      property Subject: RawUTF8 read fSubject write fSubject;
      property ContentType: RawUTF8 read fContentType write fContentType;
  end;

  // 134 商店金融账户设置
  TSQLProductStoreFinActSetting = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fFinAccountType: TSQLFinAccountTypeID;
      //要求个人识别号码
      fRequirePinCode: Boolean;
      //决定是否基于存储在金融账户的的礼品论证码校验礼品卡号，设置为N则使用外部礼品卡提供者
      fValidateGCFinAcct: Boolean;
      //自动生成的账号长度
      fAccountCodeLength: Integer;
      //自动生成的个人识别号码长度
      fPinCodeLength: Integer;
      //这类型账户的有效天数
      fAccountValidDays: Integer;
      //这类型账户预授权的有效天数
      fAuthValidDays: Integer;
      //这个调查通常用来收集信息，比如：购买者名称、收件人、电子邮件、消息等，非常灵活。
      fPurchaseSurvey: TSQLSurveyID;
      //字段名称上的“发送到电子邮件地址的购买调查
      fPurchSurveySendTo: RawUTF8;
      //采购调查是否抄送我
      fPurchSurveyCopyMe: RawUTF8;
      //允许预授权到负值
      fAllowAuthToNegative: Boolean;
      //最小余额
      fMinBalance: Currency;
      //补充阈值
      fReplenishThreshold: Currency;
      //补尝方法枚举
      fReplenishMethodEnumId: TSQLEnumerationID;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property FinAccountType: TSQLFinAccountTypeID read fFinAccountType write fFinAccountType;
      property RequirePinCode: Boolean read fRequirePinCode write fRequirePinCode;
      property ValidateGCFinAcct: Boolean read fValidateGCFinAcct write fValidateGCFinAcct;
      property AccountCodeLength: Integer read fAccountCodeLength write fAccountCodeLength;
      property PinCodeLength: Integer read fPinCodeLength write fPinCodeLength;
      property AccountValidDays: Integer read fAccountValidDays write fAccountValidDays;
      property AuthValidDays: Integer read fAuthValidDays write fAuthValidDays;
      property PurchaseSurvey: TSQLSurveyID read fPurchaseSurvey write fPurchaseSurvey;
      property PurchSurveySendTo: RawUTF8 read fPurchSurveySendTo write fPurchSurveySendTo;
      property PurchSurveyCopyMe: RawUTF8 read fPurchSurveyCopyMe write fPurchSurveyCopyMe;
      property AllowAuthToNegative: Boolean read fAllowAuthToNegative write fAllowAuthToNegative;
      property MinBalance: Currency read fMinBalance write fMinBalance;
      property ReplenishThreshold: Currency read fReplenishThreshold write fReplenishThreshold;
      property ReplenishMethodEnumId: TSQLEnumerationID read fReplenishMethodEnumId write fReplenishMethodEnumId;
  end;

  // 135 产品商店设施
  TSQLProductStoreFacility = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fFacility: TSQLFacilityID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 136 产品商店分组
  TSQLProductStoreGroup = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fGroupTypeEncode: RawUTF8;
      fPrimaryGroupEncode: RawUTF8;
      fProductStoreGroupType: TSQLProductStoreGroupTypeID;
      fPrimaryParentGroup: TSQLProductStoreGroupID;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property GroupTypeEncode: RawUTF8 read fGroupTypeEncode write fGroupTypeEncode;
      property PrimaryGroupEncode: RawUTF8 read fPrimaryGroupEncode write fPrimaryGroupEncode;
      property ProductStoreGroupType: TSQLProductStoreGroupTypeID read fProductStoreGroupType write fProductStoreGroupType;
      property PrimaryParentGroup: TSQLProductStoreGroupID read fPrimaryParentGroup write fPrimaryParentGroup;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 137 产品商店分组会员
  TSQLProductStoreGroupMember = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fProductStoreGroup: TSQLProductStoreGroupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property ProductStoreGroup: TSQLProductStoreGroupID read fProductStoreGroup write fProductStoreGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 138 产品商店分组角色
  TSQLProductStoreGroupRole = class(TSQLRecord)
    private
      fProductStoreGroup: TSQLProductStoreGroupID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
    published
      property ProductStoreGroup: TSQLProductStoreGroupID read fProductStoreGroup write fProductStoreGroup;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
  end;

  // 139 产品商店分组隶属关系
  TSQLProductStoreGroupRollup = class(TSQLRecord)
    private
      fProductStoreGroup: TSQLProductStoreGroupID;
      fParentGroup: TSQLProductStoreGroupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStoreGroup: TSQLProductStoreGroupID read fProductStoreGroup write fProductStoreGroup;
      property ParentGroup: TSQLProductStoreGroupID read fParentGroup write fParentGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
   end;

  // 140
  TSQLProductStoreGroupType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 141 产品商店关键字覆盖
  TSQLProductStoreKeywordOvrd = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fKeyword: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fTarget: RawUTF8;
      fTargetTypeEnum: TSQLEnumerationID;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property Keyword: RawUTF8 read fKeyword write fKeyword;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Target: RawUTF8 read fTarget write fTarget;
      property TargetTypeEnum: TSQLEnumerationID read fTargetTypeEnum write fTargetTypeEnum;
  end;

  // 142 产品商店支付设置
  TSQLProductStorePaymentSetting = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fPaymentServiceTypeEnum: TSQLEnumerationID;
      fPaymentService: RawUTF8;
      fPaymentCustomMethod: TSQLCustomMethodID;
      fPaymentGatewayConfig: TSQLPaymentGatewayConfigID;
      fPaymentPropertiesPath: RawUTF8;
      fApplyToAllProducts: Boolean;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property PaymentServiceTypeEnum: TSQLEnumerationID read fPaymentServiceTypeEnum write fPaymentServiceTypeEnum;
      property PaymentService: RawUTF8 read fPaymentService write fPaymentService;
      property PaymentCustomMethod: TSQLCustomMethodID read fPaymentCustomMethod write fPaymentCustomMethod;
      property PaymentGatewayConfig: TSQLPaymentGatewayConfigID read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property PaymentPropertiesPath: RawUTF8 read fPaymentPropertiesPath write fPaymentPropertiesPath;
      property ApplyToAllProducts: Boolean read fApplyToAllProducts write fApplyToAllProducts;
  end;

  // 143 产品商店促销应用
  TSQLProductStorePromoAppl = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fProductPromo: TSQLProductPromoID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fManualOnly: Boolean;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property ManualOnly: Boolean read fManualOnly write fManualOnly;
  end;

  // 144
  TSQLProductStoreRole = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fProductStore: TSQLProductStoreID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 145 产品商店货运方式
  TSQLProductStoreShipmentMeth = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fShipmentMethodType: TSQLShipmentMethodTypeID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fCompanyParty: TSQLPartyID;
      fMinWeight: Double;
      fMaxWeight: Double;
      fMinSize: Double;
      fMaxSize: Double;
      fMinTotal: Currency;
      fMaxTotal: Currency;
      fAllowUspsAddr: Boolean;
      fRequireUspsAddr: Boolean;
      fAllowCompanyAddr: Boolean;
      fRequireCompanyAddr: Boolean;
      //包括非计费项
      fIncludeNoChargeItems: Boolean;
      //包含特征组
      fIncludeFeatureGroup: Integer;
      fExcludeFeatureGroup: Integer;
      fIncludeGeo: TSQLGeoID;
      fExcludeGeo: TSQLGeoID;
      fServiceName: RawUTF8;
      fConfigProps: RawUTF8;
      fShipmentCustomMethod: TSQLCustomMethodID;
      fShipmentGatewayConfig: TSQLShipmentGatewayConfigID;
      fSequenceNumber: Integer;
      fAllowancePercent: Double;
      fMinimumPrice: Currency;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property ShipmentMethodType: TSQLShipmentMethodTypeID read fShipmentMethodType write fShipmentMethodType;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property CompanyParty: TSQLPartyID read fCompanyParty write fCompanyParty;
      property MinWeight: Double read fMinWeight write fMinWeight;
      property MaxWeight: Double read fMaxWeight write fMaxWeight;
      property MinSize: Double read fMinSize write fMinSize;
      property MaxSize: Double read fMaxSize write fMaxSize;
      property MinTotal: Currency read fMinTotal write fMinTotal;
      property MaxTotal: Currency read fMaxTotal write fMaxTotal;
      property AllowUspsAddr: Boolean read fAllowUspsAddr write fAllowUspsAddr;
      property RequireUspsAddr: Boolean read fRequireUspsAddr write fRequireUspsAddr;
      property AllowCompanyAddr: Boolean read fAllowCompanyAddr write fAllowCompanyAddr;
      property RequireCompanyAddr: Boolean read fRequireCompanyAddr write fRequireCompanyAddr;
      property IncludeNoChargeItems: Boolean read fIncludeNoChargeItems write fIncludeNoChargeItems;
      property IncludeFeatureGroup: Integer read fIncludeFeatureGroup write fIncludeFeatureGroup;
      property ExcludeFeatureGroup: Integer read fExcludeFeatureGroup write fExcludeFeatureGroup;
      property IncludeGeo: TSQLGeoID read fIncludeGeo write fIncludeGeo;
      property ExcludeGeo: TSQLGeoID read fExcludeGeo write fExcludeGeo;
      property ServiceName: RawUTF8 read fServiceName write fServiceName;
      property ConfigProps: RawUTF8 read fConfigProps write fConfigProps;
      property ShipmentCustomMethod: TSQLCustomMethodID read fShipmentCustomMethod write fShipmentCustomMethod;
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfigID read fShipmentGatewayConfig write fShipmentGatewayConfig;
      property SequenceNumber: Integer read fSequenceNumber write fSequenceNumber;
      property AllowancePercent: Double read fAllowancePercent write fAllowancePercent;
      property MinimumPrice: Currency read fMinimumPrice write fMinimumPrice;
  end;

  // 146 产品商店调查应用
  TSQLProductStoreSurveyAppl = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fSurveyApplType: TSQLSurveyApplTypeID;
      fGroupName: RawUTF8;
      fSurvey: TSQLSurveyID;
      fProduct: TSQLProductID;
      fProductCategory: TSQLProductCategoryID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSurveyTemplate: RawUTF8;
      fResultTemplate: RawUTF8;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property SurveyApplType: TSQLSurveyApplTypeID read fSurveyApplType write fSurveyApplType;
      property GroupName: RawUTF8 read fGroupName write fGroupName;
      property Survey: TSQLSurveyID read fSurvey write fSurvey;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SurveyTemplate: RawUTF8 read fSurveyTemplate write fSurveyTemplate;
      property ResultTemplate: RawUTF8 read fResultTemplate write fResultTemplate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 147 产品商店卖方支付
  TSQLProductStoreVendorPayment = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fVendorParty: TSQLPartyID;
      fPaymentMethodType: TSQLPaymentMethodTypeID;
      fCreditCardEnum: TSQLEnumerationID;
   published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property VendorParty: TSQLPartyID read fVendorParty write fVendorParty;
      property PaymentMethodType: TSQLPaymentMethodTypeID read fPaymentMethodType write fPaymentMethodType;
      property CreditCardEnum: TSQLEnumerationID read fCreditCardEnum write fCreditCardEnum;
  end;

  // 148 产品商店卖方货运
  TSQLProductStoreVendorShipment = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fVendorParty: TSQLPartyID;
      fShipmentMethodType: TSQLShipmentMethodTypeID;
      fCarrierParty: TSQLPartyID;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property VendorParty: TSQLPartyID read fVendorParty write fVendorParty;
      property ShipmentMethodType: TSQLShipmentMethodTypeID read fShipmentMethodType write fShipmentMethodType;
      property CarrierParty: TSQLPartyID read fCarrierParty write fCarrierParty;
  end;

  // 149
  TSQLWebSite = class(TSQLRecord)
    private
      fProductStore: TSQLProductStoreID;
      fAllowProductStoreChange: Boolean;
      fHostedPathAlias: RawUTF8;
      fIsDefault: Boolean;
      fDisplayMaintenancePage: Boolean;
    published
      property ProductStore: TSQLProductStoreID read fProductStore write fProductStore;
      property AllowProductStoreChange: Boolean read fAllowProductStoreChange write fAllowProductStoreChange;
      property HostedPathAlias: RawUTF8 read fHostedPathAlias write fHostedPathAlias;
      property IsDefault: Boolean read fIsDefault write fIsDefault;
      property DisplayMaintenancePage: Boolean read fDisplayMaintenancePage write fDisplayMaintenancePage;
  end;

  // 150
  TSQLProductSubscriptionResource = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fSubscriptionResource: TSQLSubscriptionResourceID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPurchaseFromDate: TDateTime;
      fPurchaseThruDate: TDateTime;
      fMaxLifeTime: Double;
      fMaxLifeTimeUom: TSQLUomID;
      fAvailableTime: Double;
      fAvailableTimeUom: TSQLUomID;
      fUseCountLimit: Double;
      fUseTime: Double;
      fUseTimeUom: TSQLUomID;
      fUseRoleType: TSQLRoleTypeID;
      fAutomaticExtend: Boolean;
      fCanclAutmExtTime: Double;
      fCanclAutmExtTimeUom: TSQLUomID;
      fGracePeriodOnExpiry: Double;
      fGracePeriodOnExpiryUom: TSQLUomID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property SubscriptionResource: TSQLSubscriptionResourceID read fSubscriptionResource write fSubscriptionResource;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PurchaseFromDate: TDateTime read fPurchaseFromDate write fPurchaseFromDate;
      property PurchaseThruDate: TDateTime read fPurchaseThruDate write fPurchaseThruDate;
      property MaxLifeTime: Double read fMaxLifeTime write fMaxLifeTime;
      property MaxLifeTimeUom: TSQLUomID read fMaxLifeTimeUom write fMaxLifeTimeUom;
      property AvailableTime: Double read fAvailableTime write fAvailableTime;
      property AvailableTimeUom: TSQLUomID read fAvailableTimeUom write fAvailableTimeUom;
      property UseCountLimit: Double read fUseCountLimit write fUseCountLimit;
      property UseTime: Double read fUseTime write fUseTime;
      property UseTimeUom: TSQLUomID read fUseTimeUom write fUseTimeUom;
      property UseRoleType: TSQLRoleTypeID read fUseRoleType write fUseRoleType;
      property AutomaticExtend: Boolean read fAutomaticExtend write fAutomaticExtend;
      property CanclAutmExtTime: Double read fCanclAutmExtTime write fCanclAutmExtTime;
      property CanclAutmExtTimeUom: TSQLUomID read fCanclAutmExtTimeUom write fCanclAutmExtTimeUom;
      property GracePeriodOnExpiry: Double read fGracePeriodOnExpiry write fGracePeriodOnExpiry;
      property GracePeriodOnExpiryUom: TSQLUomID read fGracePeriodOnExpiryUom write fGracePeriodOnExpiryUom;
  end;

  // 151
  TSQLSubscription = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fSubscriptionResource: TSQLSubscriptionResourceID;
      fCommunicationEvent: Integer;
      fContactMech: TSQLContactMechID;
      fOriginatedFromParty: TSQLPartyID;
      fOriginatedFromRoleType: TSQLRoleTypeID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fPartyNeed: Integer;
      fNeedType: TSQLNeedTypeID;
      fOrderId: TSQLOrderItemID;
      fOrderItemSeq: Integer;
      fProduct: TSQLProductID;
      fProductCategory: TSQLProductCategoryID;
      fInventoryItem: TSQLInventoryItemID;
      fSubscriptionType: TSQLSubscriptionTypeID;
      fExternalSubscription: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPurchaseFromDate: TDateTime;
      fPurchaseThruDate: TDateTime;
      fMaxLifeTime: Double;
      fMaxLifeTimeUom: TSQLUomID;
      fAvailableTime: Double;
      fAvailableTimeUom: TSQLUomID;
      fUseCountLimit: Double;
      fUseTime: Double;
      fUseTimeUom: TSQLUomID;
      fAutomaticExtend: Boolean;
      fCanclAutmExtTime: Double;
      fCanclAutmExtTimeUom: TSQLUomID;
      fGracePeriodOnExpiry: Double;
      fGracePeriodOnExpiryUom: TSQLUomID;
      fExpirationCompletedDate: TDateTime;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property SubscriptionResource: TSQLSubscriptionResourceID read fSubscriptionResource write fSubscriptionResource;
      property CommunicationEvent: Integer read fCommunicationEvent write fCommunicationEvent;
      property ContactMech: TSQLContactMechID read fContactMech write fContactMech;
      property OriginatedFromParty: TSQLPartyID read fOriginatedFromParty write fOriginatedFromParty;
      property OriginatedFromRoleType: TSQLRoleTypeID read fOriginatedFromRoleType write fOriginatedFromRoleType;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property PartyNeed: Integer read fPartyNeed write fPartyNeed;
      property NeedType: TSQLNeedTypeID read fNeedType write fNeedType;
      property OrderId: TSQLOrderItemID read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Product: TSQLProductID read fProduct write fProduct;
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property InventoryItem: TSQLInventoryItemID read fInventoryItem write fInventoryItem;
      property SubscriptionType: TSQLSubscriptionTypeID read fSubscriptionType write fSubscriptionType;
      property ExternalSubscription: Integer read fExternalSubscription write fExternalSubscription;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PurchaseFromDate: TDateTime read fPurchaseFromDate write fPurchaseFromDate;
      property PurchaseThruDate: TDateTime read fPurchaseThruDate write fPurchaseThruDate;
      property MaxLifeTime: Double read fMaxLifeTime write fMaxLifeTime;
      property MaxLifeTimeUom: TSQLUomID read fMaxLifeTimeUom write fMaxLifeTimeUom;
      property AvailableTime: Double read fAvailableTime write fAvailableTime;
      property AvailableTimeUom: TSQLUomID read fAvailableTimeUom write fAvailableTimeUom;
      property UseCountLimit: Double read fUseCountLimit write fUseCountLimit;
      property UseTime: Double read fUseTime write fUseTime;
      property UseTimeUom: TSQLUomID read fUseTimeUom write fUseTimeUom;
      property AutomaticExtend: Boolean read fAutomaticExtend write fAutomaticExtend;
      property CanclAutmExtTime: Double read fCanclAutmExtTime write fCanclAutmExtTime;
      property CanclAutmExtTimeUom: TSQLUomID read fCanclAutmExtTimeUom write fCanclAutmExtTimeUom;
      property GracePeriodOnExpiry: Double read fGracePeriodOnExpiry write fGracePeriodOnExpiry;
      property GracePeriodOnExpiryUom: TSQLUomID read fGracePeriodOnExpiryUom write fGracePeriodOnExpiryUom;
      property ExpirationCompletedDate: TDateTime read fExpirationCompletedDate write fExpirationCompletedDate;
  end;

  // 152
  TSQLSubscriptionActivity = class(TSQLRecord)
    private
      fComments: RawUTF8;
      fDateSent: TDateTime;
    published
      property Comments: RawUTF8 read fComments write fComments;
      property DateSent: TDateTime read fDateSent write fDateSent;
  end;

  // 153
  TSQLSubscriptionAttribute = class(TSQLRecord)
    private
      fSubscription: TSQLSubscriptionID;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Subscription: TSQLSubscriptionID read fSubscription write fSubscription;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 154
  TSQLSubscriptionFulfillmentPiece = class(TSQLRecord)
    private
      fSubscriptionActivity: TSQLSubscriptionActivityID;
      fSubscription: TSQLSubscriptionID;
    published
      property SubscriptionActivity: TSQLSubscriptionActivityID read fSubscriptionActivity write fSubscriptionActivity;
      property Subscription: TSQLSubscriptionID read fSubscription write fSubscription;
  end;

  // 155
  TSQLSubscriptionResource = class(TSQLRecord)
    private
      fParentResource: TSQLSubscriptionResourceID;
      fDescription: RawUTF8;
      fContent: TSQLContentID;
      fWebSite: TSQLWebSiteID;
      fServiceNameOnExpiry: RawUTF8;
    published
      property ParentResource: TSQLSubscriptionResourceID read fParentResource write fParentResource;
      property Description: RawUTF8 read fDescription write fDescription;
      property Content: TSQLContentID read fContent write fContent;
      property WebSite: TSQLWebSiteID read fWebSite write fWebSite;
      property ServiceNameOnExpiry: RawUTF8 read fServiceNameOnExpiry write fServiceNameOnExpiry;
  end;

  // 156
  TSQLSubscriptionType = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fParentEncode: RawUTF8;
      fParent: TSQLSubscriptionTypeID;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property ParentEncode: RawUTF8 read fParentEncode write fParentEncode;
      property Parent: TSQLSubscriptionTypeID read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 157
  TSQLSubscriptionTypeAttr = class(TSQLRecord)
    private
      fSubscriptionType: TSQLSubscriptionTypeID;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property SubscriptionType: TSQLSubscriptionTypeID read fSubscriptionType write fSubscriptionType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 158
  TSQLSubscriptionCommEvent = class(TSQLRecord)
    private
      fSubscription: TSQLSubscriptionID;
      fCommunicationEvent: TSQLCommunicationEventID;
    published
      property Subscription: TSQLSubscriptionID read fSubscription write fSubscription;
      property CommunicationEvent: TSQLCommunicationEventID read fCommunicationEvent write fCommunicationEvent;
  end;

  // 159
  TSQLMarketInterest = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategoryID;
      fPartyClassificationGroup: TSQLPartyClassificationGroupID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductCategory: TSQLProductCategoryID read fProductCategory write fProductCategory;
      property PartyClassificationGroup: TSQLPartyClassificationGroupID read fPartyClassificationGroup write fPartyClassificationGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 160
  TSQLReorderGuideline = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fParty: TSQLPartyID;
      fRoleType: TSQLRoleTypeID;
      fFacility: TSQLFacilityID;
      fGeo: TSQLGeoID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fReorderQuantity: Double;
      fReorderLevel: Double;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Party: TSQLPartyID read fParty write fParty;
      property RoleType: TSQLRoleTypeID read fRoleType write fRoleType;
      property Facility: TSQLFacilityID read fFacility write fFacility;
      property Geo: TSQLGeoID read fGeo write fGeo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ReorderQuantity: Double read fReorderQuantity write fReorderQuantity;
      property ReorderLevel: Double read fReorderLevel write fReorderLevel;
  end;

  // 161
  TSQLSupplierPrefOrder = class(TSQLRecord)
    private
      fEncode: RawUTF8;
      fName: RawUTF8;
      fDescription: RawUTF8;
    public
      class procedure InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions); override;
    published
      property Encode: RawUTF8 read fEncode write fEncode;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 162
  TSQLSupplierProduct = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fParty: TSQLPartyID;
      fAvailableFromDate: TDateTime;
      fAvailableThruDate: TDateTime;
      fSupplierPrefOrder: TSQLSupplierPrefOrderID;
      fSupplierRatingType: TSQLSupplierRatingTypeID;
      fStandardLeadTimeDays: Double;
      fMinimumOrderQuantity: Double;
      fOrderQtyIncrements: Double;
      fUnitsIncluded: Double;
      fQuantityUom: TSQLUomID;
      fAgreement: TSQLAgreementItemID;
      fAgreementItemSeq: Integer;
      fLastPrice: Currency;
      fShippingPrice: Currency;
      fCurrencyUom: TSQLUomID;
      fSupplierProductName: RawUTF8;
      fCanDropShip: Boolean;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property Party: TSQLPartyID read fParty write fParty;
      property AvailableFromDate: TDateTime read fAvailableFromDate write fAvailableFromDate;
      property AvailableThruDate: TDateTime read fAvailableThruDate write fAvailableThruDate;
      property SupplierPrefOrder: TSQLSupplierPrefOrderID read fSupplierPrefOrder write fSupplierPrefOrder;
      property SupplierRatingType: TSQLSupplierRatingTypeID read fSupplierRatingType write fSupplierRatingType;
      property StandardLeadTimeDays: Double read fStandardLeadTimeDays write fStandardLeadTimeDays;
      property MinimumOrderQuantity: Double read fMinimumOrderQuantity write fMinimumOrderQuantity;
      property OrderQtyIncrements: Double read fOrderQtyIncrements write fOrderQtyIncrements;
      property UnitsIncluded: Double read fUnitsIncluded write fUnitsIncluded;
      property QuantityUom: TSQLUomID read fQuantityUom write fQuantityUom;
      property Agreement: TSQLAgreementItemID read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property LastPrice: Currency read fLastPrice write fLastPrice;
      property ShippingPrice: Currency read fShippingPrice write fShippingPrice;
      property CurrencyUom: TSQLUomID read fCurrencyUom write fCurrencyUom;
      property SupplierProductName: RawUTF8 read fSupplierProductName write fSupplierProductName;
      property CanDropShip: Boolean read fCanDropShip write fCanDropShip;
  end;

  // 163
  TSQLSupplierProductFeature = class(TSQLRecord)
    private
      fParty: TSQLPartyID;
      fProductFeature: TSQLProductFeatureID;
      fDescription: RawUTF8;
      fUom: TSQLUomID;
      fIdCode: RawUTF8;
    published
      property Party: TSQLPartyID read fParty write fParty;
      property ProductFeature: TSQLProductFeatureID read fProductFeature write fProductFeature;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUomID read fUom write fUom;
      property IdCode: RawUTF8 read fIdCode write fIdCode;
  end;

  // 164
  TSQLSupplierRatingType = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 165
  TSQLProductPromoContent = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromoID;
      fContent: TSQLContentID;
      fProductPromoContentType: TSQLProductContentTypeID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductPromo: TSQLProductPromoID read fProductPromo write fProductPromo;
      property Content: TSQLContentID read fContent write fContent;
      property ProductPromoContentType: TSQLProductContentTypeID read fProductPromoContentType write fProductPromoContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 166
  TSQLProductGroupOrder = class(TSQLRecord)
    private
      fProduct: TSQLProductID;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItemID;
      fReqOrderQty: Double;
      fSoldOrderQty: Double;
      fJob: TSQLJobSandboxID;
    published
      property Product: TSQLProductID read fProduct write fProduct;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItemID read fStatus write fStatus;
      property ReqOrderQty: Double read fReqOrderQty write fReqOrderQty;
      property SoldOrderQty: Double read fSoldOrderQty write fSoldOrderQty;
      property Job: TSQLJobSandboxID read fJob write fJob;
  end;

implementation

uses
  Classes, SysUtils;

// 1
class procedure TSQLCostComponentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLCostComponentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLCostComponentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','CostComponentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update CostComponentType set parent=(select c.id from CostComponentType c where c.Encode=CostComponentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 2
class procedure TSQLGoodIdentificationType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLGoodIdentificationType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLGoodIdentificationType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','GoodIdentificationType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update GoodIdentificationType set parent=(select c.id from GoodIdentificationType c where c.Encode=GoodIdentificationType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 3
class procedure TSQLProdCatalogCategoryType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProdCatalogCategoryType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProdCatalogCategoryType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProdCatalogCategoryType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProdCatalogCategoryType set parent=(select c.id from ProdCatalogCategoryType c where c.Encode=ProdCatalogCategoryType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 4
class procedure TSQLProductAssocType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductAssocType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductAssocType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductAssocType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductAssocType set parent=(select c.id from ProductAssocType c where c.Encode=ProductAssocType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 5
class procedure TSQLProductCategoryType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductCategoryType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductCategoryType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductCategoryType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductCategoryType set parent=(select c.id from ProductCategoryType c where c.Encode=ProductCategoryType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 6
class procedure TSQLProductCategoryContentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductCategoryContentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductCategoryContentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductCategoryContentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductCategoryContentType set parent=(select c.id from ProductCategoryContentType c where c.Encode=ProductCategoryContentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 7
class procedure TSQLProductContentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductContentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductContentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductContentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductContentType set parent=(select c.id from ProductContentType c where c.Encode=ProductContentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 8
class procedure TSQLProdConfItemContentType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProdConfItemContentType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProdConfItemContentType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProdConfItemContentType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProdConfItemContentType set parent=(select c.id from ProdConfItemContentType c where c.Encode=ProdConfItemContentType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 9
class procedure TSQLProductFeatureApplType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductFeatureApplType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductFeatureApplType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductFeatureApplType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductFeatureApplType set parent=(select c.id from ProductFeatureApplType c where c.Encode=ProductFeatureApplType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 10
class procedure TSQLProductFeatureIactnType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductFeatureIactnType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductFeatureIactnType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductFeatureIactnType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductFeatureIactnType set parent=(select c.id from ProductFeatureIactnType c where c.Encode=ProductFeatureIactnType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 11
class procedure TSQLProductFeatureType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductFeatureType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductFeatureType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductFeatureType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductFeatureType set parent=(select c.id from ProductFeatureType c where c.Encode=ProductFeatureType.ParentEncode);');
    Server.Execute('update ProductFeature set ProductFeatureType=(select c.id from ProductFeatureType c where c.Encode=ProductFeature.ProductFeatureTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 12
class procedure TSQLProductMeterType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductMeterType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductMeterType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductMeterType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 13
class procedure TSQLProductMaintType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductMaintType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductMaintType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductMaintType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductMaintType set parent=(select c.id from ProductMaintType c where c.Encode=ProductMaintType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 14
class procedure TSQLProductPriceType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductPriceType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductPriceType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductPriceType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 15
class procedure TSQLProductPricePurpose.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductPricePurpose;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductPricePurpose.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductPricePurpose.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 16
class procedure TSQLProductPriceActionType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductPriceActionType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductPriceActionType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductPriceActionType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 17
class procedure TSQLProductType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductType set parent=(select c.id from ProductType c where c.Encode=ProductType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 18
class procedure TSQLFacilityType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFacilityType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFacilityType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FacilityType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update FacilityType set parent=(select c.id from FacilityType c where c.Encode=FacilityType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 19
class procedure TSQLFacilityGroupType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFacilityGroupType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFacilityGroupType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FacilityGroupType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update FacilityGroup set FacilityGroupType=(select c.id from FacilityGroupType c where c.Encode=FacilityGroup.FacilityGroupTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 20
class procedure TSQLFacilityGroup.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLFacilityGroup;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLFacilityGroup.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','FacilityGroup.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update FacilityGroup set PrimaryParentGroup=(select c.id from FacilityGroup c where c.Encode=FacilityGroup.PrimaryParentGroupEncode);');
    Server.Execute('update FacilityGroup set FacilityGroupType=(select c.id from FacilityGroupType c where c.Encode=FacilityGroup.FacilityGroupTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 21
class procedure TSQLInventoryItemType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLInventoryItemType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLInventoryItemType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','InventoryItemType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update InventoryItemType set Parent=(select c.id from InventoryItemType c where c.Encode=InventoryItemType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 22
class procedure TSQLProductStoreGroup.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductStoreGroup;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductStoreGroup.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductStoreGroup.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductStoreGroup set PrimaryParentGroup=(select c.id from ProductStoreGroup c where c.Encode=ProductStoreGroup.PrimaryGroupEncode);');
    Server.Execute('update ProductStoreGroup set ProductStoreGroupType=(select c.id from ProductStoreGroupType c where c.Encode=ProductStoreGroup.GroupTypeEncode);');
  finally
    Rec.Free;
  end;
end;

// 23
class procedure TSQLVarianceReason.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLVarianceReason;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLVarianceReason.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','VarianceReason.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 24
class procedure TSQLSupplierPrefOrder.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLSupplierPrefOrder;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLSupplierPrefOrder.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','SupplierPrefOrder.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

// 25
class procedure TSQLSubscriptionType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLSubscriptionType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLSubscriptionType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','SubscriptionType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update SubscriptionType set parent=(select c.id from SubscriptionType c where c.Encode=SubscriptionType.ParentEncode);');
  finally
    Rec.Free;
  end;
end;

// 26
class procedure TSQLProductFeatureCategory.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductFeatureCategory;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductFeatureCategory.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductFeatureCategory.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductFeatureCategory set parent=(select c.id from ProductFeatureCategory c where c.Encode=ProductFeatureCategory.ParentEncode);');
    Server.Execute('update ProductFeature set ProductFeatureCategory=(select c.id from ProductFeatureCategory c where c.Encode=ProductFeature.ProductFeatureCategoryEncode);');
  finally
    Rec.Free;
  end;
end;

// 27
class procedure TSQLProductFeature.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLProductFeature;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLProductFeature.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','ProductFeature.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
    Server.Execute('update ProductFeature set ProductFeatureType=(select c.id from ProductFeatureType c where c.Encode=ProductFeature.ProductFeatureTypeEncode);');
    Server.Execute('update ProductFeature set ProductFeatureCategory=(select c.id from ProductFeatureCategory c where c.Encode=ProductFeature.ProductFeatureCategoryEncode);');
  finally
    Rec.Free;
  end;
end;

// 28
class procedure TSQLQuantityBreakType.InitializeTable(Server: TSQLRestServer; const FieldName: RawUTF8; Options: TSQLInitializeTableOptions);
var Rec: TSQLQuantityBreakType;
begin
  inherited;
  if FieldName<>'' then exit; // create database only if void
  Rec := TSQLQuantityBreakType.CreateAndFillPrepare(StringFromFile(ConcatPaths([ExtractFilePath(paramstr(0)),'../seed','QuantityBreakType.json'])));
  try
    while Rec.FillOne do
      Server.Add(Rec,true);
  finally
    Rec.Free;
  end;
end;

end.

