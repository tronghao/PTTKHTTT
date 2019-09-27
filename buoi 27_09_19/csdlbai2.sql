CREATE DATABASE SO_BAN_NGANH
GO

USE SO_BAN_NGANH
GO
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     27/09/2019 9:17:53 AM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BAOCAO') and o.name = 'FK_BAOCAO_LAP_DONVI')
alter table BAOCAO
   drop constraint FK_BAOCAO_LAP_DONVI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DONVI') and o.name = 'FK_DONVI_QUAN_LY_SOBANNGA')
alter table DONVI
   drop constraint FK_DONVI_QUAN_LY_SOBANNGA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DONVI') and o.name = 'FK_DONVI_THUOC_NGANHKTQ')
alter table DONVI
   drop constraint FK_DONVI_THUOC_NGANHKTQ
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BAOCAO')
            and   name  = 'LAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index BAOCAO.LAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAOCAO')
            and   type = 'U')
   drop table BAOCAO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DONVI')
            and   name  = 'THUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index DONVI.THUOC_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DONVI')
            and   name  = 'QUAN_LY_FK'
            and   indid > 0
            and   indid < 255)
   drop index DONVI.QUAN_LY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DONVI')
            and   type = 'U')
   drop table DONVI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NGANHKTQD')
            and   type = 'U')
   drop table NGANHKTQD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SOBANNGANH')
            and   type = 'U')
   drop table SOBANNGANH
go

/*==============================================================*/
/* Table: BAOCAO                                                */
/*==============================================================*/
create table BAOCAO (
   QUY                  smallint             not null,
   NAMBC                int                  not null,
   MADV                 varchar(10)          not null,
   TONGLD               int                  null,
   SOLDNU               int                  null,
   LDBQ                 int                  null,
   LUONG                float                null,
   THUNHAPKHAC          double precision     null,
   THUNHAPBQ            double precision     null,
   constraint PK_BAOCAO primary key nonclustered (QUY, NAMBC)
)
go

/*==============================================================*/
/* Index: LAP_FK                                                */
/*==============================================================*/
create index LAP_FK on BAOCAO (
MADV ASC
)
go

/*==============================================================*/
/* Table: DONVI                                                 */
/*==============================================================*/
create table DONVI (
   MADV                 varchar(10)          not null,
   MACQ                 varchar(10)          not null,
   MANGANH              varchar(10)          not null,
   TENDV                varchar(30)          null,
   DIACHI               varchar(50)          null,
   constraint PK_DONVI primary key nonclustered (MADV)
)
go

/*==============================================================*/
/* Index: QUAN_LY_FK                                            */
/*==============================================================*/
create index QUAN_LY_FK on DONVI (
MACQ ASC
)
go

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on DONVI (
MANGANH ASC
)
go

/*==============================================================*/
/* Table: NGANHKTQD                                             */
/*==============================================================*/
create table NGANHKTQD (
   MANGANH              varchar(10)          not null,
   TENNGANH             varchar(20)          null,
   constraint PK_NGANHKTQD primary key nonclustered (MANGANH)
)
go

/*==============================================================*/
/* Table: SOBANNGANH                                            */
/*==============================================================*/
create table SOBANNGANH (
   MACQ                 varchar(10)          not null,
   TENDVCQ              varchar(30)          null,
   CAPQL                varchar(10)          null,
   constraint PK_SOBANNGANH primary key nonclustered (MACQ)
)
go

alter table BAOCAO
   add constraint FK_BAOCAO_LAP_DONVI foreign key (MADV)
      references DONVI (MADV)
go

alter table DONVI
   add constraint FK_DONVI_QUAN_LY_SOBANNGA foreign key (MACQ)
      references SOBANNGANH (MACQ)
go

alter table DONVI
   add constraint FK_DONVI_THUOC_NGANHKTQ foreign key (MANGANH)
      references NGANHKTQD (MANGANH)
go

