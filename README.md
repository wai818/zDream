# zDream 追梦
**一个基于mORMot和Lazarus的中台架构验证系统，理论上也支持Delphi，支持Windows、Linux等跨平台编译。**

---

## 中台的原理

烟囱式系统架构，各个系统以数据孤岛、应用孤岛的形式存在；为实现系统间交互，各系统又以API等接口形式，向其它系统提供服务交互能力；当这样的系统多到一定程度，系统间形成蜘蛛网式的互联结构，数据一致性成为问题；这时，大家又开始采用ESB总线，解决蜘蛛网架构，但数据一致性仍然无法保证。

造成这些困惑的根本原因，个人认为还是数据孤岛问题，每个应用都有自己的数据库，自己的数据定义。

### 数据核心

系统设计的一个基本原则就是将多处存在的相似代码抽象为更基础的公共代码，即常说的“抽取相似逻辑，形成公用组件，服务化”；如果将诸如机构、人员、产品、订单、装运、用户、角色、权限等每个应用均需要的数据结构抽象为一个公共的数据核心，以数据服务的形式开放给其它应用调用，就可以实现数据在各应用中的共享，保证数据一致性，达到**数据治理**的目的，也可以让各业务系统更专注于业务设计，在大型IT项目中可以显著降低综合开发成本。

未来，企业将会以数据为核心，摒弃原来以业务系统为核心的传统路子，真正实现业务数据化，数据资产化。从有效提升治理手段与效能的角度看，构建行业数据核心，从行业内机构抽取数据，对数据进行分析，横向比较，可以快速发现差距、定位问题。

### 遗留系统

这样的架构，对于存在大量存量遗留系统的企业，则可以按照新建项目基于新的公共数据核心进行建设，而存量遗留系统则基于公共数据平台进行接口重构，重新定义基于公共数据平台的服务接口，并作为新的接口标准提供服务，形成基于数据核心的遗留系统的服务镜像，服务调用的结果会在公共数据平台生成唯一的用户、产品、订单等ID，最后调用遗留系统的接口，真正完成服务处理，并将遗留系统的相关数据ID与公共数据平台数据ID相关联，达到数据治理的目的。

### 外部系统

对于外部系统的对接，也将其视为与内部遗留系统一样，基于公共数据平台对外部系统提供的接口进行代码重构，重新定义基于公共数据平台的服务接口，加入新的业务处理逻辑，形成基于数据核心的外部系统的服务镜像。本质上讲，内部遗留系统也好，外部系统服务引入也罢，站在本系统架构的角度来看，都是外部系统，都按照相似的方法进行处理，并视业务需要增加新的业务处理逻辑。其实，我们平时接入外部系统时，也就是这么做的，唯一不同的就是不再重复设计机构、人员、产品、订单、装运、用户、角色、权限等表结构，而是直接对接数据核心的数据服务能力，或在数据核心的表结构不支持的情况下，继承扩展出专用的表结构，仅此而已。

### 服务治理

在重新定义基于公共数据平台的服务接口的过程中，对于一些新建系统、遗留系统中相似的接口服务可以进行整合性包装，以条件分支的形式分别跳转各系统完成实际的业务处理，这样就可以只提供一个标准的服务接口，而无需提供多个服务接口，保证业务逻辑的一致性，达到服务治理的目的。

*后来，外出学习交流的过程中，我才知道江湖将这种架构称之为中台架构，或者姑且将上述架构设想理解为我个人理解的中台架构的基本原理吧。*

## zDream架构设计

zDream架构验证系统为四层微服务架构，1st_core是数据核心层，2nd_business是业务系统层，3rd_app是应用横切层，4th_client是前端渠道层。

### 1st_core

数据核心层，仅提供公共数据服务，后续层需要用到的专用数据结构，应在公共数据核心的表结构上继承扩展，以保证子表ID与数据核心父表ID的一致性。该层设计参考了《数据模型资源手册》一书，按照灵活、可配置化的模式，生成一个公共的数据服务核心，由于需要同时满足多个业务系统的数据结构要求，所以工作量比较大，但对于大型业务系统，这样的开销是值得的，当然，小型系统可能就得不偿失了。

该层用于交易的数据核心，可以通过mORMot的数据同步复制能力，生成一个或多个用于查询或数据统计分析目的的数据应用核心。

为保证高并发性，数据核心可以调用mORMot的数据切片能力，将数据模型分成Party、Product、Order、Shipment、Workeffort等多个物理数据库，并在DB层混合使用Sqlite、Postgresql、Mysql等数据库系统；mORMot还支持读写分离、批量延迟写等技术，以最大限度提升数据核心的高并发能力。详细内容可参考[mORMot-Learning](https://github.com/wai818/mORMot-Learning)项目中相关文档。

*按照《数据模型资源手册》建设的灵活、可配置化的数据核心，原来大家称之为用户中心、产品工厂、订单中心......，又孤陋寡闻了，哈。*

### 2nd_business

业务层，新建的业务系统，或遗留系统的服务接口二次包装，都在这一层实现。遗留系统的接口在该层进行二次包装，对后续层级的服务提供，均由新接口统一提供，达到服务治理的目的。

### 3rd_app

应用层，将业务层暴露的服务进行全流程的业务整合，实现跨系统、跨渠道的业务协同服务能力，提供诸如产品从浏览、下单、支付、收货确认、评价的全生命周期管理（好像大家叫流程编排），并将业务能力提供前端（Web或APP）进行呈现和使用。

### 4th_client

表现层，基于应用层整合的服务能力，提供内部员工或交付客户使用的Web或APP前端产品。

## 数据核心实现

*目前正在实现1st_core数据核心。*

## 业务系统实现

尚未实现。

## 应用系统实现

尚未实现。

## 前端渠道实现

尚未实现。

### 内部管理端

### 

## 随笔感言

从93年买到《FreeBSD手册》一书，开始进入奇妙的开源世界，也一直愧疚于没有回馈开源世界，[mORMot-Learning](https://github.com/wai818/mORMot-Learning)及本项目算是了了一桩心愿。

一直在接触FreeBSD、PostgreSQL、lazarus、mORMot等优秀的开源项目，目前基本工作在Deepin环境，对鸿蒙也抱着强烈的期待；其它优秀开源项目还有Ruby、FreeSwitch、Grass等等，精力不济啊。

作为一个老掉牙的Delphi时代的程序员，因为后来更多从事业务工作，所以也就没有跟上Java、Javascript的潮流，但作为一个性能偏执狂，后来自然也就喜欢上了Lazarus，以及基于Pascal的mORMot多层微服务架构。

一直很懒，属于君子动脑不动手的类型，mORMot的学习曲线又很高，但终于在去年还是下定决定，初步完成了部分内容的学习，并形成了[mORMot-Learning](https://github.com/wai818/mORMot-Learning)项目；今年，在坚定理想信念的基础上，终于完成了多年来关于数据核心概念的部分代码落地，形成了现在的[zDream](https://github.com/wai818/zDream)项目。

关于中台的起源，江湖上流传着一种说法，2015 年中，阿里拜访了位于北欧的芬兰游戏公司Supercell，这家创造了年税前利润15亿美元的公司，只有不到200名员工，传说就是“中台”的鼻祖。



wai81@foxmail.com，于中国·昆明。

