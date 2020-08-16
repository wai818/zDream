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
      fProdCatalog: TSQLProdCatalog;
      //产品分类
      fProductCategory: TSQLProductCategory;
      //产品目录分类类型
      fProdCatalogCategoryType: TSQLProdCatalogCategoryType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      //序号数字
      fSequenceNum: Integer;
    published
      property ProdCatalog: TSQLProdCatalog read fProdCatalog write fProdCatalog;
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property ProdCatalogCategoryType: TSQLProdCatalogCategoryType read fProdCatalogCategoryType write fProdCatalogCategoryType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 3 产品目录种类类型
  TSQLProdCatalogCategoryType = class(TSQLRecord)
    private
      fParent: TSQLProdCatalogCategoryType;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProdCatalogCategoryType read fParent write fParent;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 4 产品目录库存设施
  TSQLProdCatalogInvFacility = class(TSQLRecord)
    private
      fProdCatalog: TSQLProdCatalog;
      fFacility: TSQLFacility;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProdCatalog: TSQLProdCatalog read fProdCatalog write fProdCatalog;
      property Facility: TSQLFacility read fFacility write fFacility;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 5 产品目录角色
  TSQLProdCatalogRole = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fProdCatalog: TSQLProdCatalog;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property ProdCatalog: TSQLProdCatalog read fProdCatalog write fProdCatalog;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 6 产品分类
  TSQLProductCategory = class(TSQLRecord)
    private
      fProductCategoryType: TSQLProductCategoryType;
      //主上级分类
      fPrimaryParentCategory: TSQLProductCategory;
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
      property ProductCategoryType: TSQLProductCategoryType read fProductCategoryType write fProductCategoryType;
      property PrimaryParentCategory: TSQLProductCategory read fPrimaryParentCategory write fPrimaryParentCategory;
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
      fProductCategory: TSQLProductCategory;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fDescription: RawUTF8;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 8 产品分类内容
  TSQLProductCategoryContent = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fContent: TSQLContent;
      //产品分类内容类型
      fProdCatContentType: TSQLProductCategoryContentType;
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
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property Content: TSQLContent read fContent write fContent;
      property ProdCatContentType: TSQLProductCategoryContentType read fProdCatContentType write fProdCatContentType;
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
      fParent: TSQLProductCategoryContentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductCategoryContentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 10 产品分类总账账务
  TSQLProductCategoryGlAccount = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fOrganizationParty: TSQLParty;
      fGlAccountType: TSQLGlAccountType;
      fGlAccount: TSQLGlAccount;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property GlAccountType: TSQLGlAccountType read fGlAccountType write fGlAccountType;
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
  end;

  // 11 产品分类关联
  TSQLProductCategoryLink = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
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
      fLinkTypeEnum: TSQLEnumeration;
      //链接信息
      fLinkInfo: RawUTF8;
      //详细的子屏幕
      fDetailSubScreen: RawUTF8;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property LinkSeq: Integer read fLinkSeq write fLinkSeq;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property TitleText: RawUTF8 read fTitleText write fTitleText;
      property DetailText: TSQLRawBlob read fDetailText write fDetailText;
      property ImageUrl: RawUTF8 read fImageUrl write fImageUrl;
      property ImageTwoUrl: RawUTF8 read fImageTwoUrl write fImageTwoUrl;
      property LinkTypeEnum: TSQLEnumeration read fLinkTypeEnum write fLinkTypeEnum;
      property LinkInfo: RawUTF8 read fLinkInfo write fLinkInfo;
      property DetailSubScreen: RawUTF8 read fDetailSubScreen write fDetailSubScreen;
  end;

  // 12 产品分类成员
  TSQLProductCategoryMember = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fProduct: TSQLProduct;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
      fSequenceNum: Integer;
      //数量
      fQuantity: Double;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property Product: TSQLProduct read fProduct write fProduct;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Quantity: Double read fQuantity write fQuantity;
  end;

  // 13 产品分类角色
  TSQLProductCategoryRole = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fComments: RawUTF8;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 14 产品分类隶属关系
  TSQLProductCategoryRollup = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fparentProductCategory: TSQLProductCategory;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property parentProductCategory: TSQLProductCategory read fparentProductCategory write fparentProductCategory;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 15 产品分类类型
  TSQLProductCategoryType = class(TSQLRecord)
    private
      fParent: TSQLProductCategoryType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductCategoryType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 16 产品分类类型属性
  TSQLProductCategoryTypeAttr = class(TSQLRecord)
    private
      fProductCategoryType: TSQLProductCategoryType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property ProductCategoryType: TSQLProductCategoryType read fProductCategoryType write fProductCategoryType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 17
  TSQLProductConfig = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fConfigItem: TSQLProductConfigItem;
      fSequenceNum: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      FDescription: RawUTF8;
      FLongDescription: RawUTF8;
      fConfigType: RawUTF8;
      fDefaultConfigOption: RawUTF8;
      fIsMandatory: Boolean;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ConfigItem: TSQLProductConfigItem read fConfigItem write fConfigItem;
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
      fConfigItem: TSQLProductConfigItem;
      fContent: TSQLContent;
      fConfItemContentType: TSQLProdConfItemContentType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ConfigItem: TSQLProductConfigItem read fConfigItem write fConfigItem;
      property Content: TSQLContent read fContent write fContent;
      property ConfItemContentType: TSQLProdConfItemContentType read fConfItemContentType write fConfItemContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 20
  TSQLProdConfItemContentType = class(TSQLRecord)
    private
      fParent: TSQLProdConfItemContentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProdConfItemContentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 21
  TSQLProductConfigOption = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItem;
      fConfigOption: RawUTF8;
      fConfigOptionName: RawUTF8;
      FDescription: RawUTF8;
      fSequenceNum: Integer;
    published
      property ConfigItem: TSQLProductConfigItem read fConfigItem write fConfigItem;
      property ConfigOption: RawUTF8 read fConfigOption write fConfigOption;
      property ConfigOptionName: RawUTF8 read fConfigOptionName write fConfigOptionName;
      property Description: RawUTF8 read FDescription write FDescription;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 22
  TSQLProductConfigOptionIactn = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItem;
      fConfigOption: TSQLProductConfigOption;
      fConfigItemTo: TSQLProductConfigItem;
      fConfigOptionTo: TSQLProductConfigOption;
      fConfigIactnType: RawUTF8;               //?
      fSequenceNum: Integer;
      FDescription: RawUTF8;
    published
      property ConfigItem: TSQLProductConfigItem read fConfigItem write fConfigItem;
      property ConfigOption: TSQLProductConfigOption read fConfigOption write fConfigOption;
      property ConfigItemTo: TSQLProductConfigItem read fConfigItemTo write fConfigItemTo;
      property ConfigOptionTo: TSQLProductConfigOption read fConfigOptionTo write fConfigOptionTo;
      property ConfigIactnType: RawUTF8 read fConfigIactnType write fConfigIactnType;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 23
  TSQLProductConfigProduct = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItem;
      fConfigOption: TSQLProductConfigOption;
      fProduct: TSQLProduct;
      fQuantity: Double;
      fSequenceNum: Integer;
    published
      property ConfigItem: TSQLProductConfigItem read fConfigItem write fConfigItem;
      property ConfigOption: TSQLProductConfigOption read fConfigOption write fConfigOption;
      property Product: TSQLProduct read fProduct write fProduct;
      property Quantity: Double read fQuantity write fQuantity;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 24
  TSQLProductConfigConfig = class(TSQLRecord)
    private
      fConfigItem: TSQLProductConfigItem;
      fConfigOption: TSQLProductConfigOption;
      fSequenceNum: Integer;
      FDescription: RawUTF8;
    published
      property ConfigItem: TSQLProductConfigItem read fConfigItem write fConfigItem;
      property ConfigOption: TSQLProductConfigOption read fConfigOption write fConfigOption;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 25
  TSQLProductConfigStats = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fNumOfConfs: Double;
      fConfigType: RawUTF8; //HIDDEN, TEMPLATE, etc...
    published
      property Product: TSQLProduct read fProduct write fProduct;
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
      fCostComponentType: TSQLCostComponentType;
      fProduct: TSQLProduct;
      fProductFeature: TSQLProductFeature;
      fParty: TSQLParty;
      fGeo: TSQLGeo;
      fWorkEffort: TSQLWorkEffort;
      fFixedAsset: TSQLFixedAsset;
      fCostComponentCalc: TSQLCostComponentCalc;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCost: Double;
      fCostUom: TSQLUom;
    published
      property CostComponentType: TSQLCostComponentType read fCostComponentType write fCostComponentType;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property Party: TSQLParty read fParty write fParty;
      property Geo: TSQLGeo read fGeo write fGeo;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
      property CostComponentCalc: TSQLCostComponentCalc read fCostComponentCalc write fCostComponentCalc;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Cost: Double read fCost write fCost;
      property CostUom: TSQLUom read fCostUom write fCostUom;
  end;

  // 28
  TSQLCostComponentAttribute = class(TSQLRecord)
    private
      fCostComponent: TSQLCostComponent;
      fAttrName: TSQLCostComponentTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property CostComponent: TSQLCostComponent read fCostComponent write fCostComponent;
      property AttrName: TSQLCostComponentTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 29
  TSQLCostComponentType = class(TSQLRecord)
    private
      fParent: TSQLCostComponentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLCostComponentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 30
  TSQLCostComponentTypeAttr = class(TSQLRecord)
    private
      fCostComponentType: TSQLCostComponentType;
      fAttrName: TSQLCostComponentAttribute;
      fDescription: RawUTF8;
    published
      property CostComponentType: TSQLCostComponentType read fCostComponentType write fCostComponentType;
      property AttrName: TSQLCostComponentAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 31
  TSQLCostComponentCalc = class(TSQLRecord)
    private
      fCostGlAccountType: TSQLGlAccountType;
      fOffsettingGlAccountType: TSQLGlAccountType;
      fFixedCost: Currency;
      fVariableCost: Currency;
      fPerMilliSecond: Double;
      fCurrencyUom: TSQLUom;
      fCostCustomMethod: TSQLCustomMethod;
      fDescription: RawUTF8;
    published
      property CostGlAccountType: TSQLGlAccountType read fCostGlAccountType write fCostGlAccountType;
      property OffsettingGlAccountType: TSQLGlAccountType read fOffsettingGlAccountType write fOffsettingGlAccountType;
      property FixedCost: Currency read fFixedCost write fFixedCost;
      property VariableCost: Currency read fVariableCost write fVariableCost;
      property PerMilliSecond: Double read fPerMilliSecond write fPerMilliSecond;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property CostCustomMethod: TSQLCustomMethod read fCostCustomMethod write fCostCustomMethod;
      property Description: RawUTF8 read fDescription writefDescription ;
  end;

  // 32
  TSQLProductCostComponentCalc = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fCostComponentType: TSQLCostComponentType;
      fCostComponentCalc: TSQLCostComponentCalc;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property CostComponentType: TSQLCostComponentType read fCostComponentType write fCostComponentType;
      property CostComponentCalc: TSQLCostComponentCalc read fCostComponentCalc write fCostComponentCalc;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 33
  TSQLContainer = class(TSQLRecord)
    private
      fContainerType: TSQLContainerType;
      fFacility: TSQLFacility;
      fDescription: RawUTF8;
    published
      property ContainerType: TSQLContainerType read fContainerType write fContainerType;
      property Facility: TSQLFacility read fFacility write fFacility;
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
      fContainer: TSQLContainer;
      fGeoPoint: TSQLGeoPoint;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Container: TSQLContainer read fContainer write fContainer;
      property GeoPoint: TSQLGeoPoint read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 36
  TSQLFacility = class(TSQLRecord)
    private
      fFacilityType: TSQLFacilityType;
      fParentFacility: TSQLFacility;
      fOwnerParty: TSQLParty;
      fDefaultInventoryItemType: TSQLInventoryItemType;
      fFacilityName: RawUTF8;
      fPrimaryFacilityGroup: TSQLFacilityGroup;
      fOldSquareFootage: Double;
      fFacilitySize: Double;
      fFacilitySizeUom: TSQLUom;
      fProductStore: TSQLProductStore;
      fDefaultDaysToShip: Double;
      fOpenedDate: TDateTime;
      fClosedDate: TDateTime;
      fDescription: RawUTF8;
      fDefaultDimensionUom: TSQLUom;
      fDefaultWeightUom: TSQLUom;
      fGeoPoint: TSQLGeoPoint;
    published
      property FacilityType: TSQLFacilityType read fFacilityType write fFacilityType;
      property ParentFacility: TSQLFacility read fParentFacility write fParentFacility;
      property OwnerParty: TSQLParty read fOwnerParty write fOwnerParty;
      property DefaultInventoryItemType: TSQLInventoryItemType read fDefaultInventoryItemType write fDefaultInventoryItemType;
      property FacilityName: RawUTF8 read fFacilityName write fFacilityName;
      property PrimaryFacilityGroup: TSQLFacilityGroup read fPrimaryFacilityGroup write fPrimaryFacilityGroup;
      property OldSquareFootage: Double read fOldSquareFootage write fOldSquareFootage;
      property FacilitySize: Double read fFacilitySize write fFacilitySize;
      property FacilitySizeUom: TSQLUom read fFacilitySizeUom write fFacilitySizeUom;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property DefaultDaysToShip: Double read fDefaultDaysToShip write fDefaultDaysToShip;
      property OpenedDate: TDateTime read fOpenedDate write fOpenedDate;
      property ClosedDate: TDateTime read fClosedDate write fClosedDate;
      property Description: RawUTF8 read fDescription write fDescription;
      property DefaultDimensionUom: TSQLUom read fDefaultDimensionUom write fDefaultDimensionUom;
      property DefaultWeightUom: TSQLUom read fDefaultWeightUom write fDefaultWeightUom;
      property GeoPoint: TSQLGeoPoint read fGeoPoint write fGeoPoint;
  end;

  // 37
  TSQLFacilityAttribute = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fAttrName: TSQLFacilityTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property AttrName: TSQLFacilityTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 38
  TSQLFacilityCalendar = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fCalendar: TSQLTechDataCalendar;
      fFacilityCalendarType: TSQLFacilityCalendarType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property Calendar: TSQLTechDataCalendar read fCalendar write fCalendar;
      property FacilityCalendarType: TSQLFacilityCalendarType read fFacilityCalendarType write fFacilityCalendarType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 39
  TSQLFacilityCalendarType = class(TSQLRecord)
    private
      fParent: TSQLFacilityCalendarType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLFacilityCalendarType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 40
  TSQLFacilityCarrierShipment = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fParty: TSQLParty;
      fRoleType: TSQLCarrierShipmentMethod;      //?
      fShipmentMethodType: TSQLShipmentMethodType;
    published
      property  read  write ;
  end;

  // 41
  TSQLFacilityContactMech = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fContactMech: TSQLContactMech;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fExtension: RawUTF8;
      fComments: RawUTF8;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Extension: RawUTF8 read fExtension write fExtension;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 42
  TSQLFacilityContactMechPurpose = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fContactMech: TSQLContactMech;
      fContactMechPurposeType: TSQLContactMechPurposeType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property ContactMechPurposeType: TSQLContactMechPurposeType read fContactMechPurposeType write fContactMechPurposeType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 43
  TSQLFacilityGroup = class(TSQLRecord)
    private
      fFacilityGroupType: TSQLFacilityGroupType;
      fPrimaryParentGroup: TSQLFacilityGroup;
      fFacilityGroupName: RawUTF8;
      fDescription: RawUTF8;
    published
      property FacilityGroupType: TSQLFacilityGroupType read fFacilityGroupType write fFacilityGroupType;
      property PrimaryParentGroup: TSQLFacilityGroup read fPrimaryParentGroup write fPrimaryParentGroup;
      property FacilityGroupName: RawUTF8 read fFacilityGroupName write fFacilityGroupName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 44
  TSQLFacilityGroupMember = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fFacilityGroup: TSQLFacilityGroup;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
   published
      property Facility: TSQLFacility read fFacility write fFacility;
      property FacilityGroup: TSQLFacilityGroup read fFacilityGroup write fFacilityGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 45
  TSQLFacilityGroupRole = class(TSQLRecord)
    private
      fFacilityGroup: TSQLFacilityGroup;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
    published
      property FacilityGroup: TSQLFacilityGroup read fFacilityGroup write fFacilityGroup;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 46
  TSQLFacilityGroupRollup = class(TSQLRecord)
    private
      fFacilityGroup: TSQLFacilityGroup;
      fParentFacilityGroup: TSQLFacilityGroupRollup;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property FacilityGroup: TSQLFacilityGroup read fFacilityGroup write fFacilityGroup;
      property ParentFacilityGroup: TSQLFacilityGroupRollup read fParentFacilityGroup write fParentFacilityGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 47
  TSQLFacilityGroupType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 48
  TSQLFacilityLocation = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fLocationSeq: Integer;
      fLocationTypeEnum: TSQLEnumeration;
      fArea: Integer;
      fAisle: Integer;
      fSection: Integer;
      fLevel: Integer;
      fPosition: Integer;
      fGeoPoint: YSQLGeoPoint;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property LocationSeq: Integer read fLocationSeq write fLocationSeq;
      property LocationTypeEnum: TSQLEnumeration read fLocationTypeEnum write fLocationTypeEnum;
      property Area: Integer read fArea write fArea;
      property Aisle: Integer read fAisle write fAisle;
      property Section: Integer read fSection write fSection;
      property Level: Integer read fLevel write fLevel;
      property Position: Integer read fPosition write fPosition;
      property GeoPoint: YSQLGeoPoint read fGeoPoint write fGeoPoint;
  end;

  // 49
  TSQLFacilityLocationGeoPoint = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fLocationSeq: Integer;
      fGeoPoint: TSQLGeoPoint;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property LocationSeq: Integer read fLocationSeq write ffLocationSeq;
      property GeoPoint: TSQLGeoPoint read fGeoPoint write fGeoPoint;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 50
  TSQLFacilityParty = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 51
  TSQLFacilityContent = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fContent: TSQLContent;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property Facility: TSQLFacility read fFacility write fFacility;
      property Content: TSQLContent read fContent write fContent;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 52
  TSQLFacilityType = class(TSQLRecord)
    private
      fParent: TSQLFacilityType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLFacilityType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 53
  TSQLFacilityTypeAttr = class(TSQLRecord)
    private
      fFacilityType: TSQLFacilityType;
      fAttrName: FacilityAttribute;
      fDescription: RawUTF8;
    published
      property FacilityType: TSQLFacilityType read fFacilityType write fFacilityType;
      property AttrName: FacilityAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 54
  TSQLProductFacility = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fFacility: TSQLFacility;
      fMinimumStock: Double;
      fReorderQuantity: Double;
      fDaysToShip: Double;
      fLastInventoryCount: Double;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Facility: TSQLFacility read fFacility write fFacility;
      property MinimumStock: Double read fMinimumStock write fMinimumStock;
      property ReorderQuantity: Double read fReorderQuantity write fReorderQuantity;
      property DaysToShip: Double read fDaysToShip write fDaysToShip;
      property LastInventoryCount: Double read fLastInventoryCount write fLastInventoryCount;
  end;

  // 55
  TSQLProductFacilityLocation = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fFacility: TSQLFacility;
      fLocationSeq: Integer;
      fMinimumStock: Double;
      fMoveQuantity: Double;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Facility: TSQLFacility read fFacility write fFacility;
      property LocationSeq: Integer read fLocationSeq write fLocationSeq;
      property MinimumStock: Double read fMinimumStock write fMinimumStock;
      property MoveQuantity: Double read fMoveQuantity write fMoveQuantity;
  end;

  // 56
  TSQLProductFeature = class(TSQLRecord)
    private
      fProductFeatureType: TSQLProductFeatureType;
      fProductFeatureCategory: TSQLProductFeatureCategory;
      fDescription: RawUTF8;
      fUom: TSQLUom;
      fNumberSpecified: Double;
      fDefaultAmount: Double;
      fDefaultSequenceNum: Double;
      fAbbrev: RawUTF8;
      fIdCode: RawUTF8;
    published
      property ProductFeatureType: TSQLProductFeatureType read fProductFeatureType write fProductFeatureType;
      property ProductFeatureCategory: TSQLProductFeatureCategory read fProductFeatureCategory write fProductFeatureCategory;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUom read fUom write fUom;
      property NumberSpecified: Double read fNumberSpecified write fNumberSpecified;
      property DefaultAmount: Double read fDefaultAmount write fDefaultAmount;
      property DefaultSequenceNum: Double read fDefaultSequenceNum write fDefaultSequenceNum;
      property Abbrev: RawUTF8 read fAbbrev write fAbbrev;
      property IdCode: RawUTF8 read fIdCode write fIdCode;
  end;

  // 57
  TSQLProductFeatureAppl = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fProductFeature: TSQLProductFeature;
      fProductFeatureApplType: TSQLProductFeatureApplType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fAmount: Double;
      fRecurringAmount: Double;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property ProductFeatureApplType: TSQLProductFeatureApplType read fProductFeatureApplType write fProductFeatureApplType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Amount: Double read fAmount write fAmount;
      property RecurringAmount: Double read fRecurringAmount write fRecurringAmount;
  end;

  // 58
  TSQLProductFeatureApplType = class(TSQLRecord)
    private
      fParent: TSQLProductFeatureApplType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductFeatureApplType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 59
  TSQLProductFeatureApplAttr = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fProductFeature: TSQLProductFeature;
      fFromDate: TDateTime;
      fAttrName: RawUTF8;
      fAttrValue: Double;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: Double read fAttrValue write fAttrValue;
  end;

  // 60
  TSQLProductFeatureCategory = class(TSQLRecord)
    private
      fParentCategory: TSQLProductFeatureCategory;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property ParentCategory: TSQLProductFeatureCategory read fParentCategory write fParentCategory;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 61
  TSQLProductFeatureCategoryAppl = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fProductFeatureCategory: TSQLProductFeatureCategory;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property ProductFeatureCategory: TSQLProductFeatureCategory read fProductFeatureCategory write fProductFeatureCategory;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 62
  TSQLProductFeatureCatGrpAppl = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fProductFeatureGroup: TSQLProductFeatureGroup;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property ProductFeatureGroup: TSQLProductFeatureGroup read fProductFeatureGroup write fProductFeatureGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 63
  TSQLProductFeatureDataResource = class(TSQLRecord)
    private
      fDataResource: TSQLDataResource;
      fProductFeature: TSQLProductFeature;
    published
      property DataResource: TSQLDataResource read fDataResource write fDataResource;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
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
      fProductFeatureGroup: TSQLProductFeatureGroup;
      fProductFeature: TSQLProductFeature;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductFeatureGroup: TSQLProductFeatureGroup read fProductFeatureGroup write fProductFeatureGroup;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 66
  TSQLProductFeatureIactn = class(TSQLRecord)
    private
      fProductFeature: TSQLProductFeature;
      fProductFeatureTo: TSQLProductFeature;
      fProductFeatureIactnType: TSQLProductFeatureIactnType;
      fProduct: TSQLProduct;
    published
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property ProductFeatureTo: TSQLProductFeature read fProductFeature write fProductFeature;
      property ProductFeatureIactnType: TSQLProductFeatureIactnType read fProductFeatureIactnType write fProductFeatureIactnType;
      property Product: TSQLProduct read fProduct write fProduct;
  end;

  // 67
  TSQLProductFeatureIactnType = class(TSQLRecord)
    private
      fParent: TSQLProductFeatureIactnType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductFeatureIactnType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 68
  TSQLProductFeatureType = class(TSQLRecord)
    private
      fParent: TSQLProductFeatureType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductFeatureType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 69
  TSQLProductFeaturePrice = class(TSQLRecord)
    private
      fProductFeature: TSQLProductFeature;
      fProductPriceType: TSQLProductPriceType;
      fCurrencyUom: TSQLUom;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPrice: Currency;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property ProductPriceType: TSQLProductPriceType read fProductPriceType write fProductPriceType;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Price: Currency read fPrice write fPrice;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 70
  TSQLInventoryItem = class(TSQLRecord)
    private
      fInventoryItemType: TSQLInventoryItemType;
      fProduct: TSQLProduct;
      fParty: TSQLParty;
      fOwnerParty: TSQLParty;
      fStatus: TSQLStatusItem;
      fDatetimeReceived: TDateTime;
      fDatetimeManufactured: TDateTime;
      fExpireDate: TDateTime;
      fFacility: TSQLFacility;
      fContainer: TSQLContainer;
      fLot: TSQLLot;
      fUom: TSQLUom;
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
      fCurrencyUom: TSQLUom;
      fFixedAsset: TSQLFixedAsset;
    published
      property InventoryItemType: TSQLInventoryItemType read fInventoryItemType write fInventoryItemType;
      property Product: TSQLProduct read fProduct write fProduct;
      property Party: TSQLParty read fParty write fParty;
      property OwnerParty: TSQLParty read fOwnerParty write fOwnerParty;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property DatetimeReceived: TDateTime read fDatetimeReceived write fDatetimeReceived;
      property DatetimeManufactured: TDateTime read fDatetimeManufactured write fDatetimeManufactured;
      property ExpireDate: TDateTime read fExpireDate write fExpireDate;
      property Facility: TSQLFacility read fFacility write fFacility;
      property Container: TSQLContainer read fContainer write fContainer;
      property Lot: TSQLLot read fLot write fLot;
      property Uom: TSQLUom read fUom write fUom;
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
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property FixedAsset: TSQLFixedAsset read fFixedAsset write fFixedAsset;
  end;

  // 71
  TSQLInventoryItemAttribute = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItem;
      fAttrName: TSQLInventoryItemTypeAttr;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property AttrName: TSQLInventoryItemTypeAttr read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 72
  TSQLInventoryItemDetail = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItem;
      fInventoryItemDetailSeq: Integer;
      fEffectiveDate: TDateTime;
      fQuantityOnHandDiff: Double;
      fAvailableToPromiseDiff: Double;
      fAccountingQuantityDiff: Double;
      fUnitCost: Double;
      fOrder: Integer;  //?
      fOrderItemSeq: Integer;
      fShipGroupSeq: Integer;
      fShipment: Integer;
      fShipmentItemSeq: Integer;
      fReturn: Integer;
      fReturnItemSeq: Integer;
      fWorkEffort: TSQLWorkEffort;
      fFixedAsset: Integer;
      fMaintHistSeq: Integer;
      fItemIssuance: Integer;
      fReceipt: TSQLShipmentReceipt;
      fPhysicalInventory: TSQLPhysicalInventory;
      fReasonEnum: TSQLEnumeration;
      fDescription: RawUTF8;
    published
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property InventoryItemDetailSeq: Integer read fInventoryItemDetailSeq write fInventoryItemDetailSeq;
      property EffectiveDate: TDateTime read fEffectiveDate write fEffectiveDate;
      property QuantityOnHandDiff: Double read fQuantityOnHandDiff write fQuantityOnHandDiff;
      property AvailableToPromiseDiff: Double read fAvailableToPromiseDiff write fAvailableToPromiseDiff;
      property AccountingQuantityDiff: Double read fAccountingQuantityDiff write fAccountingQuantityDiff;
      property UnitCost: Double read fUnitCost write fUnitCost;
      property Order: Integer read fOrder write fOrder;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property ShipGroupSeq: Integer read fShipGroupSeq write fShipGroupSeq;
      property Shipment: Integer read fShipment write fShipment;
      property ShipmentItemSeq: Integer read fShipmentItemSeq write fShipmentItemSeq;
      property Return: Integer read fReturn write fReturn;
      property ReturnItemSeq: Integer read fReturnItemSeq write fReturnItemSeq;
      property WorkEffort: TSQLWorkEffort read fWorkEffort write fWorkEffort;
      property FixedAsset: Integer read fFixedAsset write fFixedAsset;
      property MaintHistSeq: Integer read fMaintHistSeq write fMaintHistSeq;
      property ItemIssuance: Integer read fItemIssuance write fItemIssuance;
      property Receipt: TSQLShipmentReceipt read fReceipt write fReceipt;
      property PhysicalInventory: TSQLPhysicalInventory read fPhysicalInventory write fPhysicalInventory;
      property ReasonEnum: TSQLEnumeration read fReasonEnum write fReasonEnum;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 73
  TSQLInventoryItemStatus = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItem;
      fStatus: TSQLStatusItem;
      fStatusDatetime: TDateTime;
      fStatusEndDatetime: TDateTime;
      fChangeByUserLoginId: TSQLUserLogin;
      fOwnerParty: Integer; //?
      fProduct: Integer;
    published
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property StatusDatetime: TDateTime read fStatusDatetime write fStatusDatetime;
      property StatusEndDatetime: TDateTime read fStatusEndDatetime write fStatusEndDatetime;
      property ChangeByUserLoginId: TSQLUserLogin read ChangeByUserLoginId write fChangeByUserLoginId;
      property OwnerParty: Integer read fOwnerParty write fOwnerParty;
      property Product: Integer read fProduct write fProduct;
  end;

  // 74
  TSQLInventoryItemTempRes = class(TSQLRecord)
    private
      fVisit: Integer;
      fProduct: TSQLProduct;
      fProductStore: TSQLProductStore;
      fQuantity: Double;
      fReservedDate: TDateTime;
    published
      property Visit: Integer read fVisit write fVisit;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property Quantity: Double read fQuantity write fQuantity;
      property ReservedDate: TDateTime read fReservedDate write fReservedDate;
  end;

  // 75
  TSQLInventoryItemType = class(TSQLRecord)
    private
      fParent: TSQLInventoryItemType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLInventoryItemType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 76
  TSQLInventoryItemTypeAttr = class(TSQLRecord)
    private
      fInventoryItemType: TSQLInventoryItemType;
      fAttrName: TSQLInventoryItemAttribute;
      fDescription: TawUTF8;
    published
      property InventoryItemType: TSQLInventoryItemType read fInventoryItemType write fInventoryItemType;
      property AttrName: TSQLInventoryItemAttribute read fAttrName write fAttrName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 77
  TSQLInventoryItemVariance = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItem;
      fPhysicalInventory: TSQLPhysicalInventory;
      fVarianceReason: TSQLVarianceReason;
      fAvailableToPromiseVar: Double;
      fQuantityOnHandVar: Double;
      fComments: RawUTF8;
    published
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property PhysicalInventory: TSQLPhysicalInventory read fPhysicalInventory write fPhysicalInventory;
      property VarianceReason: TSQLVarianceReason read fVarianceReason write fVarianceReason;
      property AvailableToPromiseVar: Double read fAvailableToPromiseVar write fAvailableToPromiseVar;
      property QuantityOnHandVar: Double read fQuantityOnHandVar write fQuantityOnHandVar;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 78
  TSQLInventoryItemLabelType = class(TSQLRecord)
    private
      fParent: TSQLInventoryItemLabelType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLInventoryItemLabelType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 79
  TSQLInventoryItemLabel = class(TSQLRecord)
    private
      fInventoryItemLabelType: TSQLInventoryItemLabelType;
      FDescription: RawUTF8;
    published
      property InventoryItemLabelType: TSQLInventoryItemLabelType read fInventoryItemLabelType write fInventoryItemLabelType;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 80
  TSQLInventoryItemLabelAppl = class(TSQLRecord)
    private
      fInventoryItem: TSQLInventoryItem;
      fInventoryItemLabelType: TSQLInventoryItemLabelType;
      fInventoryItemLabel: TSQLInventoryItemLabel;
      fSequenceNum: Integer;
    published
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property InventoryItemLabelType: TSQLInventoryItemLabelType read fInventoryItemLabelType write fInventoryItemLabelType;
      property InventoryItemLabel: TSQLInventoryItemLabel read fInventoryItemLabel write fInventoryItemLabel;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 81
  TSQLInventoryTransfer = class(TSQLRecord)
    private
      fStatus: TSQLStatusItem;
      fInventoryItem: TSQLInventoryItem;
      fFacility: TSQLFacility;
      flocationSeq: Integer;
      fContainer: TSQLContainer;
      fFacilityTo: TSQLFacility;
      fLocationSeqTo: Integer;
      fContainerTo: TSQLContainer;
      fItemIssuance: TSQLItemIssuance;
      fSendDate: TDateTime;
      fReceiveDate: TDateTime;
      fComments: RawUTF8;
    published
      property Status: TSQLStatusItem read fStatus write fStatus;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property Facility: TSQLFacility read fFacility write fFacility;
      property locationSeq: Integer read flocationSeq write flocationSeq;
      property Container: TSQLContainer read fContainer write fContainer;
      property FacilityTo: TSQLFacility read fFacilityTo write fFacilityTo;
      property LocationSeqTo: Integer read fLocationSeqTo write fLocationSeqTo;
      property ContainerTo: TSQLContainer read fContainerTo write fContainerTo;
      property ItemIssuance: TSQLItemIssuance read fItemIssuance write fItemIssuance;
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
      fParty: TSQLParty;
      fGeneralComments: RawUTF8;
    published
      property PhysicalInventoryDate: TDateTime read fPhysicalInventoryDate write fPhysicalInventoryDate;
      property Party: TSQLParty read fParty write fParty;
      property GeneralComments: RawUTF8 read fGeneralComments write fGeneralComments;
  end;


  // 84 变化原因
  TSQLVarianceReason = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 85 产品支付方式类型
  TSQLProductPaymentMethodType = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fPaymentMethodType: TSQLPaymentMethodType;
      fProductPricePurpose: TSQLProductPricePurpose;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property PaymentMethodType: TSQLPaymentMethodType read fPaymentMethodType write fPaymentMethodType;
      property ProductPricePurpose: TSQLProductPricePurpose read fProductPricePurpose write fProductPricePurpose;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 86 产品价格
  TSQLProductPrice = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fProductPriceType: TSQLProductPriceType;
      fProductPricePurpose: TSQLProductPricePurpose;
      fCurrencyUom: TSQLUom;
      fProductStoreGroup: TSQLProductStoreGroup;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPrice: Currency;
      fTermUom: TSQLUom;
      fCustomPriceCalcService: TSQLCustomMethod;
      fPriceWithoutTax: Currency;
      fPriceWithTax: Currency;
      fTaxAmount: Currency;
      fTaxPercentage: Double;
      fTaxAuthParty: TSQLParty;
      fTaxAuthGeo: TSQLGeo;
      fTaxInPrice: Boolean;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductPriceType: TSQLProductPriceType read fProductPriceType write fProductPriceType;
      property ProductPricePurpose: TSQLProductPricePurpose read fProductPricePurpose write fProductPricePurpose;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property ProductStoreGroup: TSQLProductStoreGroup read fProductStoreGroup write fProductStoreGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Price: Currency read fPrice write fPrice;
      property TermUom: TSQLUom read fTermUom write fTermUom;
      property CustomPriceCalcService: TSQLCustomMethod read fCustomPriceCalcService write fCustomPriceCalcService;
      property PriceWithoutTax: Currency read fPriceWithoutTax write fPriceWithoutTax;
      property PriceWithTax: Currency read fPriceWithTax write fPriceWithTax;
      property TaxAmount: Currency read fTaxAmount write fTaxAmount;
      property TaxPercentage: Double read fTaxPercentage write fTaxPercentage;
      property TaxAuthParty: TSQLParty read fTaxAuthParty write fTaxAuthParty;
      property TaxAuthGeo: TSQLGeo read fTaxAuthGeo write fTaxAuthGeo;
      property TaxInPrice: Boolean read fTaxInPrice write fTaxInPrice;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 87
  TSQLProductPriceAction = class(TSQLRecord)
    private
      fProductPriceRule: TSQLProductPriceRule;
      fProductPriceActionSeq: Integer;
      fProductPriceActionType: TSQLProductPriceActionType;
      fAmount: Double;
      fRateCode: RawUTF8;
    published
      property ProductPriceRule: TSQLProductPriceRule read fProductPriceRule write fProductPriceRule;
      property ProductPriceActionSeq: Integer read fProductPriceActionSeq write fProductPriceActionSeq;
      property ProductPriceActionType: TSQLProductPriceActionType read fProductPriceActionType write fProductPriceActionType;
      property Amount: Double read fAmount write fAmount;
      property RateCode: RawUTF8 read fRateCode write fRateCode;
  end;

  // 88
  TSQLProductPriceActionType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 89
  TSQLProductPriceAutoNotice = class(TSQLRecord)
    private
      fFacility: TSQLFacility;
      fRunDate: TDateTime;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property TSQLFacility read fFacility write fFacility;
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
      fChangedByUserLogin: TSQLUserLogin;
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
      property ChangedByUserLogin: TSQLUserLogin read fChangedByUserLogin write fChangedByUserLogin;
  end;

  // 91
  TSQLProductPriceCond = class(TSQLRecord)
    private
      fProductPriceRule: TSQLProductPriceRule;
      fProductPriceCondSeq: Integer;
      fInputParamEnum: TSQLEnumeration;
      fOperatorEnum: TSQLEnumeration;
      fCondValue: RawUTF8;
    published
      property ProductPriceRule: TSQLProductPriceRule read fProductPriceRule write fProductPriceRule;
      property ProductPriceCondSeq: Integer read fProductPriceCondSeq write fProductPriceCondSeq;
      property InputParamEnum: TSQLEnumeration read fInputParamEnum write fInputParamEnum;
      property OperatorEnum: TSQLEnumeration read fOperatorEnum write fOperatorEnum;
      property CondValue: RawUTF8 read fCondValue write fCondValue;
  end;

  // 92
  TSQLProductPricePurpose = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
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
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 95
  TSQLQuantityBreak = class(TSQLRecord)
    private
      fQuantityBreakType: TSQLQuantityBreakType;
      fFromQuantity: Double;
      fFhruQuantity: Double;
    published
      property QuantityBreakType: TSQLQuantityBreakType read fQuantityBreakType write fQuantityBreakType;
      property FromQuantity: Double read fFromQuantity write fFromQuantity;
      property FhruQuantity: Double read fFhruQuantity write fFhruQuantity;
  end;

  // 96
  TSQLQuantityBreakType = class(TSQLRecord)
    private
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
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
      fGoodIdentificationType: TSQLGoodIdentificationType;
      fProduct: TSQLProduct;
      fIdValue: RawUTF8;
    published
      property GoodIdentificationType: TSQLGoodIdentificationType read fGoodIdentificationType write fGoodIdentificationType;
      property Product: TSQLProduct read fProduct write fProduct;
      property IdValue: RawUTF8 read fIdValue write fIdValue;
  end;

  // 99 商品标识类型
  TSQLGoodIdentificationType = class(TSQLRecord)
    private
      fParent: TSQLGoodIdentificationType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLGoodIdentificationType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 100
  TSQLProduct = class(TSQLRecord)
    private
      fProductType: TSQLProductType;
      fPrimaryProductCategory: TSQLProductCategory;
      fFacility: TSQLFacility;
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
      fInventoryItemType: TSQLInventoryItemType;
      //要求库存
      fRequireInventory: Boolean;
      fQuantityUom: TSQLUom;
      //包含的数量
      fQuantityIncluded: Double;
      fPiecesIncluded: Double;
      //要求金额
      fRequireAmount: Boolean;
      //固定面额
      fFixedAmount: Currency;
      fAmountUomType: TSQLUomType;
      fWeightUom: TSQLUom;
      fShippingWeight: Double;
      fProductWeight: Double;
      fHeightUom: TSQLUom;
      fProductHeight: Double;
      fShippingHeight: Double;
      fWidthUom: TSQLUom;
      fProductWidth: Double;
      fShippingWidth: Double;
      fDepthUom: TSQLUom;
      fProductDepth: Double;
      fShippingDepth: Double;
      fDiameterUom: TSQLUom;
      fProductDiameter: Double;
      //产品等级
      fProductRating: Double;
      fRatingTypeEnum: TSQLEnumeration;
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
      fVirtualVariantMethodEnum: TSQLEnumeration;
      fOriginGeo: TSQLGeo;
      //需求方式枚举
      fRequirementMethodEnum: TSQLEnumeration;
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
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
      fInShippingBox: Boolean;
      fDefaultShipmentBoxType: TSQLShipmentBoxType;
      fLotIdFilledIn: TSQLRawBlob;
      fOrderDecimalQuantity: Boolean;
    published
      property ProductType: TSQLProductType read fProductType write fProductType;
      property PrimaryProductCategory: TSQLProductCategory read fPrimaryProductCategory write fPrimaryProductCategory;
      property Facility: TSQLFacility read fFacility write fFacility;
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
      property InventoryItemType: TSQLInventoryItemType read fInventoryItemType write fInventoryItemType;
      property RequireInventory: Boolean read fRequireInventory write fRequireInventory;
      property QuantityUom: TSQLUom read fQuantityUom write fQuantityUom;
      property QuantityIncluded: Double read fQuantityIncluded write fQuantityIncluded;
      property PiecesIncluded: Double read fPiecesIncluded write fPiecesIncluded;
      property RequireAmount: Boolean read fRequireAmount write fRequireAmount;
      property FixedAmount: Currency read fFixedAmount write fFixedAmount;
      property AmountUomType: TSQLUomType read fAmountUomType write fAmountUomType;
      property WeightUom: TSQLUom read fWeightUom write fWeightUom;
      property ShippingWeight: Double read fShippingWeight write fShippingWeight;
      property ProductWeight: Double read fProductWeight write fProductWeight;
      property HeightUom: TSQLUom read fHeightUom write fHeightUom;
      property ProductHeight: Double read fProductHeight write fProductHeight;
      property ShippingHeight: Double read fShippingHeight write fShippingHeight;
      property WidthUom: TSQLUom read fWidthUom write fWidthUom;
      property ProductWidth: Double read fProductWidth write fProductWidth;
      property ShippingWidth: Double read fShippingWidth write fShippingWidth;
      property DepthUom: TSQLUom read fDepthUom write fDepthUom;
      property ProductDepth: Double read fProductDepth write fProductDepth;
      property ShippingDepth: Double read fShippingDepth write fShippingDepth;
      property DiameterUom: TSQLUom read fDiameterUom write fDiameterUom;
      property ProductDiameter: Double read fProductDiameter write fProductDiameter;
      property ProductRating: Double read fProductRating write fProductRating;
      property RatingTypeEnum: TSQLEnumeration read fRatingTypeEnum write fRatingTypeEnum;
      property Returnable: Boolean read fReturnable write fReturnable;
      property Taxable: Boolean read fTaxable write fTaxable;
      property ChargeShipping: Boolean read fChargeShipping write fChargeShipping;
      property AutoCreateKeywords: Boolean read fAutoCreateKeywords write fAutoCreateKeywords;
      property IncludeInPromotions: Boolean read fIncludeInPromotions write fIncludeInPromotions;
      property IsVirtual: Boolean read fIsVirtual write fIsVirtual;
      property IsVariant: Boolean read fIsVariant write fIsVariant;
      property VirtualVariantMethodEnum: TSQLEnumeration read fVirtualVariantMethodEnum write fVirtualVariantMethodEnum;
      property OriginGeo: TSQLGeo read fOriginGeo write fOriginGeo;
      property RequirementMethodEnum: TSQLEnumeration read fRequirementMethodEnum write fRequirementMethodEnum;
      property BillOfMaterialLevel: Double read fBillOfMaterialLevel write fBillOfMaterialLevel;
      property ReservMaxPersons: Double read fReservMaxPersons write fReservMaxPersons;
      property Reserv2ndPPPerc: Double read fReserv2ndPPPerc write fReserv2ndPPPerc;
      property ReservNthPPPerc: Double read fReservNthPPPerc write fReservNthPPPerc;
      property Config: Integer read fConfig write fConfig;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
      property InShippingBox: Boolean read fInShippingBox write fInShippingBox;
      property DefaultShipmentBoxType: TSQLShipmentBoxType read fDefaultShipmentBoxType write fDefaultShipmentBoxType;
      property LotIdFilledIn: TSQLRawBlob read fLotIdFilledIn write fLotIdFilledIn;
      property OrderDecimalQuantity: Boolean read fOrderDecimalQuantity write fOrderDecimalQuantity;
  end;

  // 101 产品关联
  TSQLProductAssoc = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fProductTo: TSQLProduct;
      fProductAssocType: TSQLProductAssocType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fReason: RawUTF8;
      fQuantity: Double;
      fScrapFactor: Double;
      fInstruction: RawUTF8;
      fRoutingWorkEffort: TSQLWorkEffort;
      //预计计算方法
      fEstimateCalcMethod: TSQLCustomMethod;
      //循环信息
      fRecurrenceInfo: TSQLRecurrenceInfo;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductTo: TSQLProduct read fProductTo write fProductTo;
      property ProductAssocType: TSQLProductAssocType read fProductAssocType write fProductAssocType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Reason: RawUTF8 read fReason write fReason;
      property Quantity: Double read fQuantity write fQuantity;
      property ScrapFactor: Double read fScrapFactor write fScrapFactor;
      property Instruction: RawUTF8 read fInstruction write fInstruction;
      property RoutingWorkEffort: TSQLWorkEffort read fRoutingWorkEffort write fRoutingWorkEffort;
      property EstimateCalcMethod: TSQLCustomMethod read EstimateCalcMethod write EstimateCalcMethod;
      property RecurrenceInfo: TSQLRecurrenceInfo read fRecurrenceInfo write fRecurrenceInfo;
  end;

  // 102
  TSQLProductAssocType = class(TSQLRecord)
    private
      fParent: TSQLProductAssocType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductAssocType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 103
  TSQLProductRole = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fComments: RawUTF8;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property Comments: RawUTF8 read fComments write fComments;
  end;

  // 104
  TSQLProductAttribute = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrType: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrType: RawUTF8 read fAttrType write fAttrType;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 105 产品统计信息
  TSQLProductCalculatedInfo = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fTotalQuantityOrdered: Double;
      fTotalTimesViewed: Integer;
      fAverageCustomerRating: Double;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property TotalQuantityOrdered: Double read fTotalQuantityOrdered write fTotalQuantityOrdered;
      property TotalTimesViewed: Integer read fTotalTimesViewed write fTotalTimesViewed;
      property AverageCustomerRating: Double read fAverageCustomerRating write fAverageCustomerRating;
  end;

  // 106 产品内容
  TSQLProductContent = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fContent: TSQLContent;
      fProductContentType: TSQLProductContentType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPurchaseFromDate: TDateTime;
      fPurchaseThruDate: TDateTime;
      fUseCountLimit: Integer;
      fUseTime: Integer;
      fUseTimeUom: TSQLUom;
      fUseRoleType: TSQLRoleType;
      fSequenceNum: Integer;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Content: TSQLContent read fContent write fContent;
      property ProductContentType: TSQLProductContentType read fProductContentType write fProductContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PurchaseFromDate: TDateTime read fPurchaseFromDate write fPurchaseFromDate;
      property PurchaseThruDate: TDateTime read fPurchaseThruDate write fPurchaseThruDate;
      property UseCountLimit: Integer read fUseCountLimit write fUseCountLimit;
      property UseTime: Integer read fUseTime write fUseTime;
      property UseTimeUom: TSQLUom read fUseTimeUom write fUseTimeUom;
      property UseRoleType: TSQLRoleType read fUseRoleType write fUseRoleType;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 107
  TSQLProductContentType = class(TSQLRecord)
    private
      fParent: TSQLProductContentType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductContentType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 108
  TSQLProductGeo = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fGeo: TSQLGeo;
      fProductGeoEnum: TSQLEnumeration;
      fDescription: RawUTF8;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Geo: TSQLGeo read fGeo write fGeo;
      property ProductGeoEnum: TSQLEnumeration read fProductGeoEnum write fProductGeoEnum;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 109 产品总账账户
  TSQLProductGlAccount = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fOrganizationParty: TSQLParty;
      fGlAccountType: TSQLGlAccountType;
      fGlAccount: TSQLGlAccount;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property OrganizationParty: TSQLParty read fOrganizationParty write fOrganizationParty;
      property GlAccountType: TSQLGlAccountType read fGlAccountType write fGlAccountType;
      property GlAccount: TSQLGlAccount read fGlAccount write fGlAccount;
  end;

  // 110
  TSQLProductKeyword = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fKeyword: RawUTF8;
      fKeywordType: TSQLEnumeration;
      fRelevancyWeight: Double;
      fStatus: TSQLStatusItem;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Keyword: RawUTF8 read fKeyword write fKeyword;
      property KeywordType: TSQLEnumeration read fKeywordType write fKeywordType;
      property RelevancyWeight: Double read fRelevancyWeight write fRelevancyWeight;
      property Status: TSQLStatusItem read fStatus write fStatus;
  end;

  // 111
  TSQLProductMeter = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fProductMeterType: TSQLProductMeterType;
      fMeterUom: TSQLUom;
      fMeterName: RawUTF8;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductMeterType: TSQLProductMeterType read fProductMeterType write fProductMeterType;
      property MeterUom: TSQLUom read fMeterUom write fMeterUom;
      property MeterName: RawUTF8 read fMeterName write fMeterName;
  end;

  // 112
  TSQLProductMeterType = class(TSQLRecord)
    private
      fDefaultUom: TSQLUom;
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property DefaultUom: TSQLUom read fDefaultUom write fDefaultUom;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 113 产品维护
  TSQLProductMaint = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fProductMaintSeq: RawUTF8;
      fProductMaintType: TSQLProductMaintType;
      fMaintName: RawUTF8;
      //维护模板工作计划
      fMaintTemplateWorkEffort: TSQLWorkEffort;
      //间隔数量
      fIntervalQuantity: Double;
      //间隔单位
      fIntervalUom: TSQLUom;
      //间隔仪表类型
      fIntervalMeterType: TSQLProductMeterType;
      //重复次数
      fRepeatCount: Integer;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductMaintSeq: RawUTF8 read fProductMaintSeq write fProductMaintSeq;
      property ProductMaintType: TSQLProductMaintType read fProductMaintType write fProductMaintType;
      property MaintName: RawUTF8 read fMaintName write fMaintName;
      property MaintTemplateWorkEffort: TSQLWorkEffort read fMaintTemplateWorkEffort write fMaintTemplateWorkEffort;
      property IntervalQuantity: Double read fIntervalQuantity write fIntervalQuantity;
      property IntervalUom: TSQLUom read fIntervalUom write fIntervalUom;
      property IntervalMeterType: TSQLProductMeterType read fIntervalMeterType write fIntervalMeterType;
      property RepeatCount: Integer read fRepeatCount write fRepeatCount;
  end;

  // 114
  TSQLProductMaintType = class(TSQLRecord)
    private
      fParent: TSQLProductMaintType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductMaintType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 115 产品评论
  TSQLProductReview = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fProduct: TSQLProduct;
      fUserLogin: TSQLUserLogin;
      fStatus: TSQLStatusItem;
      fPostedAnonymous: Boolean;
      fPostedDateTime: TDateTime;
      fProductRating: Double;
      fProductReview: TSQLRawBlob;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property Product: TSQLProduct read fProduct write fProduct;
      property UserLogin: TSQLUserLogin read fUserLogin write fUserLogin;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property PostedAnonymous: Boolean read fPostedAnonymous write fPostedAnonymous;
      property PostedDateTime: TDateTime read fPostedDateTime write fPostedDateTime;
      property ProductRating: Double read fProductRating write fProductRating;
      property ProductReview: TSQLRawBlob read fProductReview write fProductReview;
  end;

  // 116
  TSQLProductSearchConstraint = class(TSQLRecord)
    private
      fProductSearchResult: TSQLProductSearchResult;
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
      property ProductSearchResult: TSQLProductSearchResult read fProductSearchResult write fProductSearchResult;
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
      fParent: TSQLProductType;
      fIsPhysical: Boolean;
      fIsDigital: Boolean;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLProductType read fParent write fParent;
      property IsPhysical: Boolean read fIsPhysical write fIsPhysical;
      property IsDigital: Boolean read fIsDigital write fIsDigital;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 119
  TSQLProductTypeAttr = class(TSQLRecord)
    private
      fProductType: TSQLProductType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property ProductType: TSQLProductType read fProductType write fProductType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 120 卖方产品
  TSQLVendorProduct = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fVendorParty: TSQLParty;
      fProductStoreGroup: TSQLProductStoreGroup;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property VendorParty: TSQLParty read fVendorParty write fVendorParty;
      property ProductStoreGroup: TSQLProductStoreGroup read fProductStoreGroup write fProductStoreGroup;
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
      fOverrideOrgParty: TSQLParty;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
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
      property OverrideOrgParty: TSQLParty read fOverrideOrgParty write fOverrideOrgParty;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 122
  TSQLProductPromoAction = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: TSQLProductPromoRule;
      fProductPromoActionSeq: Integer;
      fProductPromoActionEnum: TSQLEnumeration;
      fOrderAdjustmentType: TSQLOrderAdjustmentType;
      fServiceName: RawUTF8;
      fQuantity: Double;
      fAmount: Double;
      fProduct: Integer;
      fParty: Integer;
      fUseCartQuantity: Boolean;
    published
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRule read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductPromoActionEnum: TSQLEnumeration read fProductPromoActionEnum write fProductPromoActionEnum;
      property OrderAdjustmentType: TSQLOrderAdjustmentType read fOrderAdjustmentType write fOrderAdjustmentType;
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
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: TSQLProductPromoRule;
      fProductPromoActionSeq: Integer;
      fproductPromoCondSeq: Integer;
      fProductCategory: TSQLProductCategory;
      fAndGroup: Integer;
      fProductPromoApplEnum: TSQLEnumeration;
      fIncludeSubCategories: Boolean;
    published
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRule read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property productPromoCondSeq: Integer read fproductPromoCondSeq write fproductPromoCondSeq;
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property AndGroup: Integer read fAndGroup write fAndGroup;
      property ProductPromoApplEnum: TSQLEnumeration read fProductPromoApplEnum write fProductPromoApplEnum;
      property IncludeSubCategories: Boolean read fIncludeSubCategories write fIncludeSubCategories;
  end;

  // 124
  TSQLProductPromoCode = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromo;
      fUserEntered: Boolean;
      fRequireEmailOrParty: Boolean;
      fUseLimitPerCode: Integer;
      fUseLimitPerCustomer: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fCreatedDate: TDateTime;
      fCreatedByUserLogin: TSQLUserLogin;
      fLastModifiedDate: TDateTime;
      fLastModifiedByUserLogin: TSQLUserLogin;
    published
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property UserEntered: Boolean read fUserEntered write fUserEntered;
      property RequireEmailOrParty: Boolean read fRequireEmailOrParty write fRequireEmailOrParty;
      property UseLimitPerCode: Integer read fUseLimitPerCode write fUseLimitPerCode;
      property UseLimitPerCustomer: Integer read fUseLimitPerCustomer write fUseLimitPerCustomer;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      property CreatedByUserLogin: TSQLUserLogin read fCreatedByUserLogin write fCreatedByUserLogin;
      property LastModifiedDate: TDateTime read fLastModifiedDate write fLastModifiedDate;
      property LastModifiedByUserLogin: TSQLUserLogin read fLastModifiedByUserLogin write fLastModifiedByUserLogin;
  end;

  // 125
  TSQLProductPromoCodeEmail = class(TSQLRecord)
    private
      fProductPromoCode: TSQLProductPromoCode;
      fEmailAddress: RawUTF8;
    published
      property ProductPromoCode: TSQLProductPromoCode read fProductPromoCode write fProductPromoCode;
      property EmailAddress: RawUTF8 read fEmailAddress write fEmailAddress;
  end;

  // 126
  TSQLProductPromoCodeParty = class(TSQLRecord)
    private
      fProductPromoCode: TSQLProductPromoCode;
      fParty: TSQLParty;
    published
      property ProductPromoCode: TSQLProductPromoCode read fProductPromoCode write fProductPromoCode;
      property Party: TSQLParty read fParty write fParty;
  end;

  // 127
  TSQLProductPromoCond = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: TSQLProductPromoRule;
      fProductPromoCondSeq: Integer;
      fInputParamEnum: TSQLEnumeration;
      fOperatorEnum: TSQLEnumeration;
      fCondValue: RawUTF8;
      fOtherValue: RawUTF8;
    published
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: TSQLProductPromoRule read fProductPromoRule write fProductPromoRule;
      property ProductPromoCondSeq: Integer read fProductPromoCondSeq write fProductPromoCondSeq;
      property InputParamEnum: TSQLEnumeration read fInputParamEnum write fInputParamEnum;
      property OperatorEnum: TSQLEnumeration read fOperatorEnum write fOperatorEnum;
      property CondValue: RawUTF8 read fCondValue write fCondValue;
      property OtherValue: RawUTF8 read fOtherValue write fOtherValue;
  end;

  // 128
  TSQLProductPromoProduct = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: Integer;
      fProductPromoActionSeq: Integer;
      fProductPromoCondSeq: Integer;
      fProduct: TSQLProduct;
      fProductPromoApplEnum: TSQLEnumeration;
    published
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: Integer read fProductPromoRule write fProductPromoRule;
      property ProductPromoActionSeq: Integer read fProductPromoActionSeq write fProductPromoActionSeq;
      property ProductPromoCondSeq: Integer read fProductPromoCondSeq write fProductPromoCondSeq;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductPromoApplEnum: TSQLEnumeration read fProductPromoApplEnum write fProductPromoApplEnum;
  end;

  // 129
  TSQLProductPromoRule = class(TSQLRecord)
    private
      fProductPromo: TSQLProductPromo;
      fProductPromoRule: Integer;
      fRuleName: RawUTF8;
    published
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoRule: Integer read fProductPromoRule write fProductPromoRule;
      property RuleName: RawUTF8 read fRuleName write fRuleName;
  end;

  // 130
  TSQLProductPromoUse = class(TSQLRecord)
    private
      fOrderId: TSQLOrderHeader;
      fPromoSequence: Integer;
      fProductPromo: TSQLProductPromo;
      fProductPromoCode: TSQLProductPromoCode;
      fParty: TSQLParty;
      fTotalDiscountAmount: Currency;
      fQuantityLeftInActions: Double;
    published
      property OrderId: TSQLOrderHeader read fOrderId write fOrderId;
      property PromoSequence: Integer read fPromoSequence write fPromoSequence;
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property ProductPromoCode: TSQLProductPromoCode read fProductPromoCode write fProductPromoCode;
      property Party: TSQLParty read fParty write fParty;
      property TotalDiscountAmount: Currency read fTotalDiscountAmount write fTotalDiscountAmount;
      property QuantityLeftInActions: Double read fQuantityLeftInActions write fQuantityLeftInActions;
  end;

  // 131
  TSQLProductStore = class(TSQLRecord)
    private
      fProductStoreGroup: TSQLProductStoreGroup;
      fStoreName: RawUTF8;
      fCompanyName: RawUTF8;
      fTitle: RawUTF8;
      fSubtitle: RawUTF8;
      fPayToParty: TSQLParty;
      fDaysToCancelNonPay: Integer;
      fManualAuthIsCapture: Boolean;
      fProrateShipping: Boolean;
      fProrateTaxes: Boolean;
      fViewCartOnAdd: Boolean;
      fAutoSaveCart: Boolean;
      fAutoApproveReviews: Boolean;
      fIsDemoStore: Boolean;
      fIsImmediatelyFulfilled: Boolean;
      fInventoryFacility: TSQLFacility;
      fOneInventoryFacility: Boolean;
      fCheckInventory: Boolean;
      fReserveInventory: Boolean;
      fReserveOrderEnum: TSQLEnumeration;
      fRequireInventory: Boolean;
      fBalanceResOnOrderCreation: Boolean;
      fRequirementMethodEnum: TSQLEnumeration;
      fOrderNumberPrefix: RawUTF8;
      fDefaultLocaleString: RawUTF8;
      fDefaultCurrencyUomId: TSQLUom;
      fDefaultTimeZoneString: RawUTF8;
      fDefaultSalesChannelEnum: TSQLEnumeration;
      fAllowPassword: Boolean;
      fDefaultPassword: RawUTF8;
      fExplodeOrderItems: Boolean;
      fCheckGcBalance: Boolean;
      fRetryFailedAuths: Boolean;
      fHeaderApprovedStatus: TSQLStatusItem;
      fItemApprovedStatus: TSQLStatusItem;
      fDigitalItemApprovedStatus: TSQLStatusItem;
      fHeaderDeclinedStatus: TSQLStatusItem;
      fItemDeclinedStatus: TSQLStatusItem;
      fHeaderCancelStatus: TSQLStatusItem;
      fItemCancelStatus: TSQLStatusItem;
      fAuthDeclinedMessage: RawUTF8;
      fAuthFraudMessage: RawUTF8;
      fAuthErrorMessage: RawUTF8;
      fVisualTheme: Integer;
      fStoreCreditAccountEnum: TSQLEnumeration;
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
      fAutoApproveInvoice: Boolean;
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
      fAllowComment: Boolean;
    published
      property ProductStoreGroup: TSQLProductStoreGroup read fProductStoreGroup write fProductStoreGroup;
      property StoreName: RawUTF8 read fStoreName write fStoreName;
      property CompanyName: RawUTF8 read fCompanyName write fCompanyName;
      property Title: RawUTF8 read fTitle write fTitle;
      property Subtitle: RawUTF8 read fSubtitle write fSubtitle;
      property PayToParty: TSQLParty read fPayToParty write fPayToParty;
      property DaysToCancelNonPay: Integer read fDaysToCancelNonPay write fDaysToCancelNonPay;
      property ManualAuthIsCapture: Boolean read fManualAuthIsCapture write fManualAuthIsCapture;
      property ProrateShipping: Boolean read fProrateShipping write fProrateShipping;
      property ProrateTaxes: Boolean read fProrateTaxes write fProrateTaxes;
      property ViewCartOnAdd: Boolean read fViewCartOnAdd write fViewCartOnAdd;
      property AutoSaveCart: Boolean read fAutoSaveCart write fAutoSaveCart;
      property AutoApproveReviews: Boolean read fAutoApproveReviews write fAutoApproveReviews;
      property IsDemoStore: Boolean read fIsDemoStore write fIsDemoStore;
      property IsImmediatelyFulfilled: Boolean read fIsImmediatelyFulfilled write fIsImmediatelyFulfilled;
      property InventoryFacility: TSQLFacility read fInventoryFacility write fInventoryFacility;
      property OneInventoryFacility: Boolean read fOneInventoryFacility write fOneInventoryFacility;
      property CheckInventory: Boolean read fCheckInventory write fCheckInventory;
      property ReserveInventory: Boolean read fReserveInventory write fReserveInventory;
      property ReserveOrderEnum: TSQLEnumeration read fReserveOrderEnum write fReserveOrderEnum;
      property RequireInventory: Boolean read fRequireInventory write fRequireInventory;
      property BalanceResOnOrderCreation: Boolean read fBalanceResOnOrderCreation write fBalanceResOnOrderCreation;
      property RequirementMethodEnum: TSQLEnumeration read fRequirementMethodEnum write fRequirementMethodEnum;
      property OrderNumberPrefix: RawUTF8 read fOrderNumberPrefix write fOrderNumberPrefix;
      property DefaultLocaleString: RawUTF8 read fDefaultLocaleString write fDefaultLocaleString;
      property DefaultCurrencyUomId: TSQLUom read fDefaultCurrencyUomId write fDefaultCurrencyUomId;
      property DefaultTimeZoneString: RawUTF8 read fDefaultTimeZoneString write fDefaultTimeZoneString;
      property DefaultSalesChannelEnum: TSQLEnumeration read fDefaultSalesChannelEnum write fDefaultSalesChannelEnum;
      property AllowPassword: Boolean read fAllowPassword write fAllowPassword;
      property DefaultPassword: RawUTF8 read fDefaultPassword write fDefaultPassword;
      property ExplodeOrderItems: Boolean read fExplodeOrderItems write fExplodeOrderItems;
      property CheckGcBalance: Boolean read fCheckGcBalance write fCheckGcBalance;
      property RetryFailedAuths: Boolean read fRetryFailedAuths write fRetryFailedAuths;
      property HeaderApprovedStatus: TSQLStatusItem read fHeaderApprovedStatus write fHeaderApprovedStatus;
      property ItemApprovedStatus: TSQLStatusItem read fItemApprovedStatus write fItemApprovedStatus;
      property DigitalItemApprovedStatus: TSQLStatusItem read fDigitalItemApprovedStatus write fDigitalItemApprovedStatus;
      property HeaderDeclinedStatus: TSQLStatusItem read fHeaderDeclinedStatus write fHeaderDeclinedStatus;
      property ItemDeclinedStatus: TSQLStatusItem read fItemDeclinedStatus write fItemDeclinedStatus;
      property HeaderCancelStatus: TSQLStatusItem read fHeaderCancelStatus write fHeaderCancelStatus;
      property ItemCancelStatus: TSQLStatusItem read fItemCancelStatus write fItemCancelStatus;
      property AuthDeclinedMessage: RawUTF8 read fAuthDeclinedMessage write fAuthDeclinedMessage;
      property AuthFraudMessage: RawUTF8 read fAuthFraudMessage write fAuthFraudMessage;
      property AuthErrorMessage: RawUTF8 read fAuthErrorMessage write fAuthErrorMessage;
      property VisualTheme: Integer read fVisualTheme write fVisualTheme;
      property StoreCreditAccountEnum: TSQLEnumeration read fStoreCreditAccountEnum write fStoreCreditAccountEnum;
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
      property AutoApproveInvoice: Boolean read fAutoApproveInvoice write fAutoApproveInvoice;
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
      property AllowComment: Boolean read fAllowComment write fAllowComment;
  end;

  // 132
  TSQLProductStoreCatalog = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fProdCatalog: TSQLProdCatalog;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property ProdCatalog: TSQLProdCatalog read fProdCatalog write fProdCatalog;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 133
  TSQLProductStoreEmailSetting = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fEmailType: TSQLEnumeration;
      fBodyScreenLocation: RawUTF8;
      fXslfoAttachScreenLocation: RawUTF8;
      fFromAddress: RawUTF8;
      fCcAddress: RawUTF8;
      fBccAddress: RawUTF8;
      fSubject: RawUTF8;
      fContentType: RawUTF8;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property EmailType: TSQLEnumeration read fEmailType write fEmailType;
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
      fProductStore: TSQLProductStore;
      fFinAccountType: TSQLFinAccountType;
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
      fPurchaseSurvey: TSQLSurvey;
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
      fReplenishMethodEnumId: TSQLEnumeration;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property FinAccountType: TSQLFinAccountType read fFinAccountType write fFinAccountType;
      property RequirePinCode: Boolean read fRequirePinCode write fRequirePinCode;
      property ValidateGCFinAcct: Boolean read fValidateGCFinAcct write fValidateGCFinAcct;
      property AccountCodeLength: Integer read fAccountCodeLength write fAccountCodeLength;
      property PinCodeLength: Integer read fPinCodeLength write fPinCodeLength;
      property AccountValidDays: Integer read fAccountValidDays write fAccountValidDays;
      property AuthValidDays: Integer read fAuthValidDays write fAuthValidDays;
      property PurchaseSurvey: TSQLSurvey read fPurchaseSurvey write fPurchaseSurvey;
      property PurchSurveySendTo: RawUTF8 read fPurchSurveySendTo write fPurchSurveySendTo;
      property PurchSurveyCopyMe: RawUTF8 read fPurchSurveyCopyMe write fPurchSurveyCopyMe;
      property AllowAuthToNegative: Boolean read fAllowAuthToNegative write fAllowAuthToNegative;
      property MinBalance: Currency read fMinBalance write fMinBalance;
      property ReplenishThreshold: Currency read fReplenishThreshold write fReplenishThreshold;
      property ReplenishMethodEnumId: TSQLEnumeration read fReplenishMethodEnumId write fReplenishMethodEnumId;
  end;

  // 135 产品商店设施
  TSQLProductStoreFacility = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fFacility: TSQLFacility;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property Facility: TSQLFacility read fFacility write fFacility;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 136 产品商店分组
  TSQLProductStoreGroup = class(TSQLRecord)
    private
      fProductStoreGroupType: TSQLProductStoreGroupType;
      fPrimaryParentGroup: TSQLProductStoreGroup;
      fProductStoreGroupName: RawUTF8;
      fDescription: RawUTF8;
    published
      property ProductStoreGroupType: TSQLProductStoreGroupType read fProductStoreGroupType write fProductStoreGroupType;
      property PrimaryParentGroup: TSQLProductStoreGroup read fPrimaryParentGroup write fPrimaryParentGroup;
      property ProductStoreGroupName: RawUTF8 read fProductStoreGroupName write fProductStoreGroupName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 137 产品商店分组会员
  TSQLProductStoreGroupMember = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fProductStoreGroup: TSQLProductStoreGroup;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property ProductStoreGroup: TSQLProductStoreGroup read fProductStoreGroup write fProductStoreGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 138 产品商店分组角色
  TSQLProductStoreGroupRole = class(TSQLRecord)
    private
      fProductStoreGroup: TSQLProductStoreGroup;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
    published
      property ProductStoreGroup: TSQLProductStoreGroup read fProductStoreGroup write fProductStoreGroup;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
  end;

  // 139 产品商店分组隶属关系
  TSQLProductStoreGroupRollup = class(TSQLRecord)
    private
      fProductStoreGroup: TSQLProductStoreGroup;
      fParentGroup: TSQLProductStoreGroup;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property ProductStoreGroup: TSQLProductStoreGroup read fProductStoreGroup write fProductStoreGroup;
      property ParentGroup: TSQLProductStoreGroup read fParentGroup write fParentGroup;
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
      fProductStore: TSQLProductStore;
      fKeyword: RawUTF8;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fTarget: RawUTF8;
      fTargetTypeEnum: TSQLEnumeration;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property Keyword: RawUTF8 read fKeyword write fKeyword;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Target: RawUTF8 read fTarget write fTarget;
      property TargetTypeEnum: TSQLEnumeration read fTargetTypeEnum write fTargetTypeEnum;
  end;

  // 142 产品商店支付设置
  TSQLProductStorePaymentSetting = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fPaymentMethodType: TSQLPaymentMethodType;
      fPaymentServiceTypeEnum: TSQLEnumeration;
      fPaymentService: RawUTF8;
      fPaymentCustomMethod: TSQLCustomMethod;
      fPaymentGatewayConfig: TSQLPaymentGatewayConfig;
      fPaymentPropertiesPath: RawUTF8;
      fApplyToAllProducts: Boolean;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property PaymentMethodType: TSQLPaymentMethodType read fPaymentMethodType write fPaymentMethodType;
      property PaymentServiceTypeEnum: TSQLEnumeration read fPaymentServiceTypeEnum write fPaymentServiceTypeEnum;
      property PaymentService: RawUTF8 read fPaymentService write fPaymentService;
      property PaymentCustomMethod: TSQLCustomMethod read fPaymentCustomMethod write fPaymentCustomMethod;
      property PaymentGatewayConfig: TSQLPaymentGatewayConfig read fPaymentGatewayConfig write fPaymentGatewayConfig;
      property PaymentPropertiesPath: RawUTF8 read fPaymentPropertiesPath write fPaymentPropertiesPath;
      property ApplyToAllProducts: Boolean read fApplyToAllProducts write fApplyToAllProducts;
  end;

  // 143 产品商店促销应用
  TSQLProductStorePromoAppl = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fProductPromo: TSQLProductPromo;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
      fManualOnly: Boolean;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
      property ManualOnly: Boolean read fManualOnly write fManualOnly;
  end;

  // 144
  TSQLProductStoreRole = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fProductStore: TSQLProductStore;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSequenceNum: Integer;
    published
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 145 产品商店货运方式
  TSQLProductStoreShipmentMeth = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fShipmentMethodType: TSQLShipmentMethodType;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fCompanyParty: TSQLParty;
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
      fIncludeGeo: TSQLGeo;
      fExcludeGeo: TSQLGeo;
      fServiceName: RawUTF8;
      fConfigProps: RawUTF8;
      fShipmentCustomMethod: TSQLCustomMethod;
      fShipmentGatewayConfig: TSQLShipmentGatewayConfig;
      fSequenceNumber: Integer;
      fAllowancePercent: Double;
      fMinimumPrice: Currency;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property ShipmentMethodType: TSQLShipmentMethodType read fShipmentMethodType write fShipmentMethodType;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property CompanyParty: TSQLParty read fCompanyParty write fCompanyParty;
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
      property IncludeGeo: TSQLGeo read fIncludeGeo write fIncludeGeo;
      property ExcludeGeo: TSQLGeo read fExcludeGeo write fExcludeGeo;
      property ServiceName: RawUTF8 read fServiceName write fServiceName;
      property ConfigProps: RawUTF8 read fConfigProps write fConfigProps;
      property ShipmentCustomMethod: TSQLCustomMethod read fShipmentCustomMethod write fShipmentCustomMethod;
      property ShipmentGatewayConfig: TSQLShipmentGatewayConfig read fShipmentGatewayConfig write fShipmentGatewayConfig;
      property SequenceNumber: Integer read fSequenceNumber write fSequenceNumber;
      property AllowancePercent: Double read fAllowancePercent write fAllowancePercent;
      property MinimumPrice: Currency read fMinimumPrice write fMinimumPrice;
  end;

  // 146 产品商店调查应用
  TSQLProductStoreSurveyAppl = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fSurveyApplType: TSQLSurveyApplType;
      fGroupName: RawUTF8;
      fSurvey: TSQLSurvey;
      fProduct: TSQLProduct;
      fProductCategory: TSQLProductCategory;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fSurveyTemplate: RawUTF8;
      fResultTemplate: RawUTF8;
      fSequenceNum: Integer;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property SurveyApplType: TSQLSurveyApplType read fSurveyApplType write fSurveyApplType;
      property GroupName: RawUTF8 read fGroupName write fGroupName;
      property Survey: TSQLSurvey read fSurvey write fSurvey;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property SurveyTemplate: RawUTF8 read fSurveyTemplate write fSurveyTemplate;
      property ResultTemplate: RawUTF8 read fResultTemplate write fResultTemplate;
      property SequenceNum: Integer read fSequenceNum write fSequenceNum;
  end;

  // 147 产品商店卖方支付
  TSQLProductStoreVendorPayment = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fVendorParty: TSQLParty;
      fPaymentMethodType: TSQLPaymentMethodType;
      fCreditCardEnum: TSQLEnumeration;
   published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property VendorParty: TSQLParty read fVendorParty write fVendorParty;
      property PaymentMethodType: TSQLPaymentMethodType read fPaymentMethodType write fPaymentMethodType;
      property CreditCardEnum: TSQLEnumeration read fCreditCardEnum write fCreditCardEnum;
  end;

  // 148 产品商店卖方货运
  TSQLProductStoreVendorShipment = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fVendorParty: TSQLParty;
      fShipmentMethodType: TSQLShipmentMethodType;
      fCarrierParty: TSQLParty;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property VendorParty: TSQLParty read fVendorParty write fVendorParty;
      property ShipmentMethodType: TSQLShipmentMethodType read fShipmentMethodType write fShipmentMethodType;
      property CarrierParty: TSQLParty read fCarrierParty write fCarrierParty;
  end;

  // 149
  TSQLWebSite = class(TSQLRecord)
    private
      fProductStore: TSQLProductStore;
      fAllowProductStoreChange: Boolean;
      fHostedPathAlias: RawUTF8;
      fIsDefault: Boolean;
      fDisplayMaintenancePage: Boolean;
    published
      property ProductStore: TSQLProductStore read fProductStore write fProductStore;
      property AllowProductStoreChange: Boolean read fAllowProductStoreChange write fAllowProductStoreChange;
      property HostedPathAlias: RawUTF8 read fHostedPathAlias write fHostedPathAlias;
      property IsDefault: Boolean read fIsDefault write fIsDefault;
      property DisplayMaintenancePage: Boolean read fDisplayMaintenancePage write fDisplayMaintenancePage;
  end;

  // 150
  TSQLProductSubscriptionResource = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fSubscriptionResource: TSQLSubscriptionResource;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPurchaseFromDate: TDateTime;
      fPurchaseThruDate: TDateTime;
      fMaxLifeTime: Double;
      fMaxLifeTimeUom: TSQLUom;
      fAvailableTime: Double;
      fAvailableTimeUom: TSQLUom;
      fUseCountLimit: Double;
      fUseTime: Double;
      fUseTimeUom: TSQLUom;
      fUseRoleType: TSQLRoleType;
      fAutomaticExtend: Boolean;
      fCanclAutmExtTime: Double;
      fCanclAutmExtTimeUom: TSQLUom;
      fGracePeriodOnExpiry: Double;
      fGracePeriodOnExpiryUom: TSQLUom;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property SubscriptionResource: TSQLSubscriptionResource read fSubscriptionResource write fSubscriptionResource;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PurchaseFromDate: TDateTime read fPurchaseFromDate write fPurchaseFromDate;
      property PurchaseThruDate: TDateTime read fPurchaseThruDate write fPurchaseThruDate;
      property MaxLifeTime: Double read fMaxLifeTime write fMaxLifeTime;
      property MaxLifeTimeUom: TSQLUom read fMaxLifeTimeUom write fMaxLifeTimeUom;
      property AvailableTime: Double read fAvailableTime write fAvailableTime;
      property AvailableTimeUom: TSQLUom read fAvailableTimeUom write fAvailableTimeUom;
      property UseCountLimit: Double read fUseCountLimit write fUseCountLimit;
      property UseTime: Double read fUseTime write fUseTime;
      property UseTimeUom: TSQLUom read fUseTimeUom write fUseTimeUom;
      property UseRoleType: TSQLRoleType read fUseRoleType write fUseRoleType;
      property AutomaticExtend: Boolean read fAutomaticExtend write fAutomaticExtend;
      property CanclAutmExtTime: Double read fCanclAutmExtTime write fCanclAutmExtTime;
      property CanclAutmExtTimeUom: TSQLUom read fCanclAutmExtTimeUom write fCanclAutmExtTimeUom;
      property GracePeriodOnExpiry: Double read fGracePeriodOnExpiry write fGracePeriodOnExpiry;
      property GracePeriodOnExpiryUom: TSQLUom read fGracePeriodOnExpiryUom write fGracePeriodOnExpiryUom;
  end;

  // 151
  TSQLSubscription = class(TSQLRecord)
    private
      fDescription: RawUTF8;
      fSubscriptionResource: TSQLSubscriptionResource;
      fCommunicationEvent: Integer;
      fContactMech: TSQLContactMech;
      fOriginatedFromParty: TSQLParty;
      fOriginatedFromRoleType: TSQLRoleType;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fPartyNeed: Integer;
      fNeedType: TSQLNeedType;
      fOrderId: TSQLOrderItem;
      fOrderItemSeq: Integer;
      fProduct: TSQLProduct;
      fProductCategory: TSQLProductCategory;
      fInventoryItem: TSQLInventoryItem;
      fSubscriptionType: TSQLSubscriptionType;
      fExternalSubscription: Integer;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fPurchaseFromDate: TDateTime;
      fPurchaseThruDate: TDateTime;
      fMaxLifeTime: Double;
      fMaxLifeTimeUom: TSQLUom;
      fAvailableTime: Double;
      fAvailableTimeUom: TSQLUom;
      fUseCountLimit: Double;
      fUseTime: Double;
      fUseTimeUom: TSQLUom;
      fAutomaticExtend: Boolean;
      fCanclAutmExtTime: Double;
      fCanclAutmExtTimeUom: TSQLUom;
      fGracePeriodOnExpiry: Double;
      fGracePeriodOnExpiryUom: TSQLUom;
      fExpirationCompletedDate: TDateTime;
    published
      property Description: RawUTF8 read fDescription write fDescription;
      property SubscriptionResource: TSQLSubscriptionResource read fSubscriptionResource write fSubscriptionResource;
      property CommunicationEvent: Integer read fCommunicationEvent write fCommunicationEvent;
      property ContactMech: TSQLContactMech read fContactMech write fContactMech;
      property OriginatedFromParty: TSQLParty read fOriginatedFromParty write fOriginatedFromParty;
      property OriginatedFromRoleType: TSQLRoleType read fOriginatedFromRoleType write fOriginatedFromRoleType;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property PartyNeed: Integer read fPartyNeed write fPartyNeed;
      property NeedType: TSQLNeedType read fNeedType write fNeedType;
      property OrderId: TSQLOrderItem read fOrderId write fOrderId;
      property OrderItemSeq: Integer read fOrderItemSeq write fOrderItemSeq;
      property Product: TSQLProduct read fProduct write fProduct;
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property InventoryItem: TSQLInventoryItem read fInventoryItem write fInventoryItem;
      property SubscriptionType: TSQLSubscriptionType read fSubscriptionType write fSubscriptionType;
      property ExternalSubscription: Integer read fExternalSubscription write fExternalSubscription;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property PurchaseFromDate: TDateTime read fPurchaseFromDate write fPurchaseFromDate;
      property PurchaseThruDate: TDateTime read fPurchaseThruDate write fPurchaseThruDate;
      property MaxLifeTime: Double read fMaxLifeTime write fMaxLifeTime;
      property MaxLifeTimeUom: TSQLUom read fMaxLifeTimeUom write fMaxLifeTimeUom;
      property AvailableTime: Double read fAvailableTime write fAvailableTime;
      property AvailableTimeUom: TSQLUom read fAvailableTimeUom write fAvailableTimeUom;
      property UseCountLimit: Double read fUseCountLimit write fUseCountLimit;
      property UseTime: Double read fUseTime write fUseTime;
      property UseTimeUom: TSQLUom read fUseTimeUom write fUseTimeUom;
      property AutomaticExtend: Boolean read fAutomaticExtend write fAutomaticExtend;
      property CanclAutmExtTime: Double read fCanclAutmExtTime write fCanclAutmExtTime;
      property CanclAutmExtTimeUom: TSQLUom read fCanclAutmExtTimeUom write fCanclAutmExtTimeUom;
      property GracePeriodOnExpiry: Double read fGracePeriodOnExpiry write fGracePeriodOnExpiry;
      property GracePeriodOnExpiryUom: TSQLUom read fGracePeriodOnExpiryUom write fGracePeriodOnExpiryUom;
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
      fSubscription: TSQLSubscription;
      fAttrName: RawUTF8;
      fAttrValue: RawUTF8;
      fAttrDescription: RawUTF8;
    published
      property Subscription: TSQLSubscription read fSubscription write fSubscription;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property AttrValue: RawUTF8 read fAttrValue write fAttrValue;
      property AttrDescription: RawUTF8 read fAttrDescription write fAttrDescription;
  end;

  // 154
  TSQLSubscriptionFulfillmentPiece = class(TSQLRecord)
    private
      fSubscriptionActivity: TSQLSubscriptionActivity;
      fSubscription: TSQLSubscription;
    published
      property SubscriptionActivity: TSQLSubscriptionActivity read fSubscriptionActivity write fSubscriptionActivity;
      property Subscription: TSQLSubscription read fSubscription write fSubscription;
  end;

  // 155
  TSQLSubscriptionResource = class(TSQLRecord)
    private
      fParentResource: TSQLSubscriptionResource;
      fDescription: RawUTF8;
      fContent: TSQLContent;
      fWebSite: TSQLWebSite;
      fServiceNameOnExpiry: RawUTF8;
    published
      property ParentResource: TSQLSubscriptionResource read fParentResource write fParentResource;
      property Description: RawUTF8 read fDescription write fDescription;
      property Content: TSQLContent read fContent write fContent;
      property WebSite: TSQLWebSite read fWebSite write fWebSite;
      property ServiceNameOnExpiry: RawUTF8 read fServiceNameOnExpiry write fServiceNameOnExpiry;
  end;

  // 156
  TSQLSubscriptionType = class(TSQLRecord)
    private
      fParent: TSQLSubscriptionType;
      fHasTable: Boolean;
      fName: RawUTF8;
      FDescription: RawUTF8;
    published
      property Parent: TSQLSubscriptionType read fParent write fParent;
      property HasTable: Boolean read fHasTable write fHasTable;
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read FDescription write FDescription;
  end;

  // 157
  TSQLSubscriptionTypeAttr = class(TSQLRecord)
    private
      fSubscriptionType: TSQLSubscriptionType;
      fAttrName: RawUTF8;
      fDescription: RawUTF8;
    published
      property SubscriptionType: TSQLSubscriptionType read fSubscriptionType write fSubscriptionType;
      property AttrName: RawUTF8 read fAttrName write fAttrName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 158
  TSQLSubscriptionCommEvent = class(TSQLRecord)
    private
      fSubscription: TSQLSubscription;
      fCommunicationEvent: TSQLCommunicationEvent;
    published
      property Subscription: TSQLSubscription read fSubscription write fSubscription;
      property CommunicationEvent: TSQLCommunicationEvent read fCommunicationEvent write fCommunicationEvent;
  end;

  // 159
  TSQLMarketInterest = class(TSQLRecord)
    private
      fProductCategory: TSQLProductCategory;
      fPartyClassificationGroup: TSQLPartyClassificationGroup;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductCategory: TSQLProductCategory read fProductCategory write fProductCategory;
      property PartyClassificationGroup: TSQLPartyClassificationGroup read fPartyClassificationGroup write fPartyClassificationGroup;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 160
  TSQLReorderGuideline = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fParty: TSQLParty;
      fRoleType: TSQLRoleType;
      fFacility: TSQLFacility;
      fGeo: TSQLGeo;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fReorderQuantity: Double;
      fReorderLevel: Double;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Party: TSQLParty read fParty write fParty;
      property RoleType: TSQLRoleType read fRoleType write fRoleType;
      property Facility: TSQLFacility read fFacility write fFacility;
      property Geo: TSQLGeo read fGeo write fGeo;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property ReorderQuantity: Double read fReorderQuantity write fReorderQuantity;
      property ReorderLevel: Double read fReorderLevel write fReorderLevel;
  end;

  // 161
  TSQLSupplierPrefOrder = class(TSQLRecord)
    private
      fName: RawUTF8;
      fDescription: RawUTF8;
    published
      property Name: RawUTF8 read fName write fName;
      property Description: RawUTF8 read fDescription write fDescription;
  end;

  // 162
  TSQLSupplierProduct = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fParty: TSQLParty;
      fAvailableFromDate: TDateTime;
      fAvailableThruDate: TDateTime;
      fSupplierPrefOrder: TSQLSupplierPrefOrder;
      fSupplierRatingType: TSQLSupplierRatingType;
      fStandardLeadTimeDays: Double;
      fMinimumOrderQuantity: Double;
      fOrderQtyIncrements: Double;
      fUnitsIncluded: Double;
      fQuantityUom: TSQLUom;
      fAgreement: TSQLAgreementItem;
      fAgreementItemSeq: Integer;
      fLastPrice: Currency;
      fShippingPrice: Currency;
      fCurrencyUom: TSQLUom;
      fSupplierProductName: RawUTF8;
      fCanDropShip: Boolean;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property Party: TSQLParty read fParty write fParty;
      property AvailableFromDate: TDateTime read fAvailableFromDate write fAvailableFromDate;
      property AvailableThruDate: TDateTime read fAvailableThruDate write fAvailableThruDate;
      property SupplierPrefOrder: TSQLSupplierPrefOrder read fSupplierPrefOrder write fSupplierPrefOrder;
      property SupplierRatingType: TSQLSupplierRatingType read fSupplierRatingType write fSupplierRatingType;
      property StandardLeadTimeDays: Double read fStandardLeadTimeDays write fStandardLeadTimeDays;
      property MinimumOrderQuantity: Double read fMinimumOrderQuantity write fMinimumOrderQuantity;
      property OrderQtyIncrements: Double read fOrderQtyIncrements write fOrderQtyIncrements;
      property UnitsIncluded: Double read fUnitsIncluded write fUnitsIncluded;
      property QuantityUom: TSQLUom read fQuantityUom write fQuantityUom;
      property Agreement: TSQLAgreementItem read fAgreement write fAgreement;
      property AgreementItemSeq: Integer read fAgreementItemSeq write fAgreementItemSeq;
      property LastPrice: Currency read fLastPrice write fLastPrice;
      property ShippingPrice: Currency read fShippingPrice write fShippingPrice;
      property CurrencyUom: TSQLUom read fCurrencyUom write fCurrencyUom;
      property SupplierProductName: RawUTF8 read fSupplierProductName write fSupplierProductName;
      property CanDropShip: Boolean read fCanDropShip write fCanDropShip;
  end;

  // 163
  TSQLSupplierProductFeature = class(TSQLRecord)
    private
      fParty: TSQLParty;
      fProductFeature: TSQLProductFeature;
      fDescription: RawUTF8;
      fUom: TSQLUom;
      fIdCode: RawUTF8;
    published
      property Party: TSQLParty read fParty write fParty;
      property ProductFeature: TSQLProductFeature read fProductFeature write fProductFeature;
      property Description: RawUTF8 read fDescription write fDescription;
      property Uom: TSQLUom read fUom write fUom;
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
      fProductPromo: TSQLProductPromo;
      fContent: TSQLContent;
      fProductPromoContentType: TSQLProductContentType;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
    published
      property ProductPromo: TSQLProductPromo read fProductPromo write fProductPromo;
      property Content: TSQLContent read fContent write fContent;
      property ProductPromoContentType: TSQLProductContentType read fProductPromoContentType write fProductPromoContentType;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
  end;

  // 166
  TSQLProductGroupOrder = class(TSQLRecord)
    private
      fProduct: TSQLProduct;
      fFromDate: TDateTime;
      fThruDate: TDateTime;
      fStatus: TSQLStatusItem;
      fReqOrderQty: Double;
      fSoldOrderQty: Double;
      fJob: TSQLJobSandbox;
    published
      property Product: TSQLProduct read fProduct write fProduct;
      property FromDate: TDateTime read fFromDate write fFromDate;
      property ThruDate: TDateTime read fThruDate write fThruDate;
      property Status: TSQLStatusItem read fStatus write fStatus;
      property ReqOrderQty: Double read fReqOrderQty write fReqOrderQty;
      property SoldOrderQty: Double read fSoldOrderQty write fSoldOrderQty;
      property Job: TSQLJobSandbox read fJob write fJob;
  end;

implementation

uses
  Classes, SysUtils;

end.

