/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/8 16:39:01                            */
/*==============================================================*/


drop table if exists ZHY_ADDRESS_TABLE;

drop table if exists ZHY_ASSOCIATOR_TABLE;

drop table if exists ZHY_GOODS_CATEGORY_R_TABLE;

drop table if exists ZHY_GOODS_CATEGORY_TABLE;

drop table if exists ZHY_GOODS_D_TABLE;

drop table if exists ZHY_GOODS_STORE_R_TABLE;

drop table if exists ZHY_GOODS_TABLE;

drop table if exists ZHY_GOODS_VIEW_D_TABLE;

drop table if exists ZHY_GOODS_VIEW_P_TABLE;

drop table if exists ZHY_ORDER_D_TABLE;

drop table if exists ZHY_ORDER_P_TABLE;

drop table if exists ZHY_STOCK_D_TABLE;

drop table if exists ZHY_STOCK_TABLE;

drop table if exists ZHY_STORE_TABLE;

drop table if exists ZHY_USERINFO_TABLE;

/*==============================================================*/
/* Table: ZHY_ADDRESS_TABLE                                     */
/*==============================================================*/
create table ZHY_ADDRESS_TABLE
(
   ZAT_ID               varchar(6) not null,
   ZAT_PARENT_ID        char(6) not null,
   ZAT_NAME             varchar(50) not null,
   ZAT__MERGERNAME      decimal(10,6) not null,
   ZAT_SHORTNAME        decimal(10,6) not null,
   ZAT_MERGERSHORTNAME  char(6) not null,
   ZAT_LEVEL            char(6) not null,
   ZAT_CITYCODE         char(6) not null,
   ZAT_ZIPCODE          varchar(200) not null,
   ZAT_PINYIN           char(10) not null,
   ZAT_JP               char(10) not null,
   ZAT_FIRSTCHAR        char(10) not null,
   ZAT_LONGITUDE        char(10) not null,
   ZAT_LATITUDE         char(10) not null,
   primary key (ZAT_ID)
);

/*==============================================================*/
/* Table: ZHY_ASSOCIATOR_TABLE                                  */
/*==============================================================*/
create table ZHY_ASSOCIATOR_TABLE
(
   ZAT_ID               varchar(11) not null,
   ZAT_NAME             varchar(50) not null,
   ZAT_BIRTHDAY         date not null,
   primary key (ZAT_ID)
);

/*==============================================================*/
/* Table: ZHY_GOODS_CATEGORY_R_TABLE                            */
/*==============================================================*/
create table ZHY_GOODS_CATEGORY_R_TABLE
(
   ZGCRT_ZGCT__NO       varchar(32) not null,
   ZGCRT_ZGT_ID         varchar(32) not null,
   primary key (ZGCRT_ZGCT__NO, ZGCRT_ZGT_ID)
);

/*==============================================================*/
/* Table: ZHY_GOODS_CATEGORY_TABLE                              */
/*==============================================================*/
create table ZHY_GOODS_CATEGORY_TABLE
(
   ZGCT_ID              varchar(32) not null,
   ZGCT__NO             varchar(10) not null,
   ZGCT_NAME            varchar(50) not null,
   ZGCT_PARENT_NO       varchar(50) not null,
   ZGCT_LEVEL           bit not null,
   primary key (ZGCT_ID)
);

/*==============================================================*/
/* Table: ZHY_GOODS_D_TABLE                                     */
/*==============================================================*/
create table ZHY_GOODS_D_TABLE
(
   ZGDT_ZGT_ID          varchar(32) not null,
   ZGDT_DETAIL          text not null,
   primary key (ZGDT_ZGT_ID)
);

/*==============================================================*/
/* Table: ZHY_GOODS_STORE_R_TABLE                               */
/*==============================================================*/
create table ZHY_GOODS_STORE_R_TABLE
(
   ZGCRT_ZST__ID        varchar(32) not null,
   ZGCRT_ZGT_ID         varchar(32) not null,
   primary key (ZGCRT_ZST__ID, ZGCRT_ZGT_ID)
);

/*==============================================================*/
/* Table: ZHY_GOODS_TABLE                                       */
/*==============================================================*/
create table ZHY_GOODS_TABLE
(
   ZGT_ID               varchar(32) not null,
   ZGT__NO              varchar(10) not null,
   ZGT_NAME             varchar(100) not null,
   ZGT_PRICE            decimal(10,2) not null,
   ZGT_ASSOCIATOR_PRICE decimal(10,2) not null,
   ZGT_SALE_FLAG        bit not null,
   ZGT_ALBUM_URL        varchar(200) not null,
   ZGT_COVER_URL        varchar(200) not null,
   ZGT_CREATTIME        datetime not null default CURRENT_TIMESTAMP,
   ZGT_GOODS_SPEC       decimal(10,2),
   primary key (ZGT_ID)
);

/*==============================================================*/
/* Table: ZHY_GOODS_VIEW_D_TABLE                                */
/*==============================================================*/
create table ZHY_GOODS_VIEW_D_TABLE
(
   ZGVDT_ID             varchar(32) not null,
   ZGVDT_ZST_ID         varchar(32) not null,
   ZGVDT_ZGT_ID         varchar(32) not null,
   primary key (ZGVDT_ID, ZGVDT_ZST_ID, ZGVDT_ZGT_ID)
);

/*==============================================================*/
/* Table: ZHY_GOODS_VIEW_P_TABLE                                */
/*==============================================================*/
create table ZHY_GOODS_VIEW_P_TABLE
(
   ZGVPT_ID             varchar(32) not null,
   ZGVPT_NAME           varchar(50) not null,
   primary key (ZGVPT_ID)
);

/*==============================================================*/
/* Table: ZHY_ORDER_D_TABLE                                     */
/*==============================================================*/
create table ZHY_ORDER_D_TABLE
(
   ZODT_ZOPT__ID        varchar(32) not null,
   ZODT_ZGT_ID          varchar(32) not null,
   ZODT_COUNT           int not null,
   ZODT__PRICE          decimal(10,6) not null,
   primary key (ZODT_ZOPT__ID, ZODT_ZGT_ID)
);

/*==============================================================*/
/* Table: ZHY_ORDER_P_TABLE                                     */
/*==============================================================*/
create table ZHY_ORDER_P_TABLE
(
   ZOPT_ID              varchar(6) not null,
   ZOPT_ZST_ID          varchar(32) not null,
   ZOPT_COUNT           int not null,
   ZOPT__PRICE          decimal(10,6) not null,
   ZOPT_ORDER_FLAG      bit not null,
   ZOPT_PICK_FLAG       bit not null,
   ZOPT_ZAT_ID          varchar(11) not null,
   ZOPT_STARTTIME       datetime not null default CURRENT_TIMESTAMP,
   ZOPT_ENDTIME         datetime not null,
   primary key (ZOPT_ID)
);

/*==============================================================*/
/* Table: ZHY_STOCK_D_TABLE                                     */
/*==============================================================*/
create table ZHY_STOCK_D_TABLE
(
   ZSDT_ID              varchar(32) not null,
   ZST_ZST_ID           varchar(32) not null,
   ZST_ZGT_ID           decimal(10,2) not null,
   ZST_TOTALCOUNT       int not null,
   primary key (ZSDT_ID)
);

/*==============================================================*/
/* Table: ZHY_STOCK_TABLE                                       */
/*==============================================================*/
create table ZHY_STOCK_TABLE
(
   ZST_ID               varchar(32) not null,
   ZST_ZST_ID           varchar(32) not null,
   ZST_ZGT_ID           varchar(32) not null,
   ZST_TOTALCOUNT       int not null,
   ZST_SPEC_TOTALCOUNT  decimal(10,2) not null,
   primary key (ZST_ID)
);

/*==============================================================*/
/* Table: ZHY_STORE_TABLE                                       */
/*==============================================================*/
create table ZHY_STORE_TABLE
(
   ZST_ID               varchar(32) not null,
   ZST_NO               char(6) not null,
   ZST_NAME             varchar(50) not null,
   ZST__LONGITUDE       decimal(10,6) not null,
   ZST_LATITUDE         decimal(10,6) not null,
   ZST_PROVINCE         char(6) not null,
   ZST_CITY             char(6) not null,
   ZST_AREA             char(6) not null,
   ZST_ADDRESS          varchar(200) not null,
   primary key (ZST_ID)
);

/*==============================================================*/
/* Table: ZHY_USERINFO_TABLE                                    */
/*==============================================================*/
create table ZHY_USERINFO_TABLE
(
   ZUT_ID               varchar(32) not null,
   ZUT_NAME             varchar(50) not null,
   ZUT_PASSWORD         VARchar(32) not null,
   ZUT_STORE_NO         char(6) not null default '0',
   ZUT_ACCESSTOKEN      varchar(32) not null,
   ZUT_EXPIRETIME       datetime not null,
   primary key (ZUT_ID)
);

