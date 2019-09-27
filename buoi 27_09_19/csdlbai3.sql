CREATE DATABASE QUAN_LY_SACH
GO

USE QUAN_LY_SACH
GO
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     27/09/2019 9:27:39 AM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BAN') and o.name = 'FK_BAN_BAN_SACH')
alter table BAN
   drop constraint FK_BAN_BAN_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BAN') and o.name = 'FK_BAN_BAN2_HOADON')
alter table BAN
   drop constraint FK_BAN_BAN2_HOADON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADON') and o.name = 'FK_HOADON_LAP_NHANVIEN')
alter table HOADON
   drop constraint FK_HOADON_LAP_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KESACH') and o.name = 'FK_KESACH_DAT_THELOAI')
alter table KESACH
   drop constraint FK_KESACH_DAT_THELOAI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KESACH') and o.name = 'FK_KESACH_QLY_CATRUC')
alter table KESACH
   drop constraint FK_KESACH_QLY_CATRUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAP') and o.name = 'FK_NHAP_NHAP_PHIENHAP')
alter table NHAP
   drop constraint FK_NHAP_NHAP_PHIENHAP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAP') and o.name = 'FK_NHAP_NHAP2_SACH')
alter table NHAP
   drop constraint FK_NHAP_NHAP2_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIENHAP') and o.name = 'FK_PHIENHAP_GHI_NCC')
alter table PHIENHAP
   drop constraint FK_PHIENHAP_GHI_NCC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH') and o.name = 'FK_SACH_THUOC_THELOAI')
alter table SACH
   drop constraint FK_SACH_THUOC_THELOAI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRUC') and o.name = 'FK_TRUC_TRUC_NHANVIEN')
alter table TRUC
   drop constraint FK_TRUC_TRUC_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRUC') and o.name = 'FK_TRUC_TRUC2_CATRUC')
alter table TRUC
   drop constraint FK_TRUC_TRUC2_CATRUC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BAN')
            and   name  = 'BAN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index BAN.BAN2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BAN')
            and   name  = 'BAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index BAN.BAN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAN')
            and   type = 'U')
   drop table BAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATRUC')
            and   type = 'U')
   drop table CATRUC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADON')
            and   name  = 'LAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADON.LAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOADON')
            and   type = 'U')
   drop table HOADON
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KESACH')
            and   name  = 'QLY_FK'
            and   indid > 0
            and   indid < 255)
   drop index KESACH.QLY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KESACH')
            and   name  = 'DAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index KESACH.DAT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KESACH')
            and   type = 'U')
   drop table KESACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NCC')
            and   type = 'U')
   drop table NCC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHANVIEN')
            and   type = 'U')
   drop table NHANVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAP')
            and   name  = 'NHAP2_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAP.NHAP2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAP')
            and   name  = 'NHAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAP.NHAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHAP')
            and   type = 'U')
   drop table NHAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIENHAP')
            and   name  = 'GHI_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIENHAP.GHI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIENHAP')
            and   type = 'U')
   drop table PHIENHAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SACH')
            and   name  = 'THUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index SACH.THUOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SACH')
            and   type = 'U')
   drop table SACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THELOAI')
            and   type = 'U')
   drop table THELOAI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRUC')
            and   name  = 'TRUC2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRUC.TRUC2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRUC')
            and   name  = 'TRUC_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRUC.TRUC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRUC')
            and   type = 'U')
   drop table TRUC
go

/*==============================================================*/
/* Table: BAN                                                   */
/*==============================================================*/
create table BAN (
   MASACH               varchar(20)          not null,
   STTHD                int                  not null,
   SOLUONG              int                  null,
   constraint PK_BAN primary key (MASACH, STTHD)
)
go

/*==============================================================*/
/* Index: BAN_FK                                                */
/*==============================================================*/
create index BAN_FK on BAN (
MASACH ASC
)
go

/*==============================================================*/
/* Index: BAN2_FK                                               */
/*==============================================================*/
create index BAN2_FK on BAN (
STTHD ASC
)
go

/*==============================================================*/
/* Table: CATRUC                                                */
/*==============================================================*/
create table CATRUC (
   STTCATRUC            int                  not null,
   GIOBD                datetime             null,
   GIOKT                datetime             null,
   constraint PK_CATRUC primary key nonclustered (STTCATRUC)
)
go

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON (
   STTHD                int                  not null,
   MANV                 varchar(20)          not null,
   NGAY                 datetime             null,
   SOLUONG              int                  null,
   DONGIA               money                null,
   THANHTIEN            money                null,
   TONGTIEN             money                null,
   constraint PK_HOADON primary key nonclustered (STTHD)
)
go

/*==============================================================*/
/* Index: LAP_FK                                                */
/*==============================================================*/
create index LAP_FK on HOADON (
MANV ASC
)
go

/*==============================================================*/
/* Table: KESACH                                                */
/*==============================================================*/
create table KESACH (
   MAKE                 int                  not null,
   STTCATRUC            int                  not null,
   MATHELOAI            varchar(20)          not null,
   TENKE                varchar(50)          null,
   constraint PK_KESACH primary key nonclustered (MAKE)
)
go

/*==============================================================*/
/* Index: DAT_FK                                                */
/*==============================================================*/
create index DAT_FK on KESACH (
MATHELOAI ASC
)
go

/*==============================================================*/
/* Index: QLY_FK                                                */
/*==============================================================*/
create index QLY_FK on KESACH (
STTCATRUC ASC
)
go

/*==============================================================*/
/* Table: NCC                                                   */
/*==============================================================*/
create table NCC (
   MANCC                varchar(50)          not null,
   TENNCC               varchar(50)          null,
   DT                   varchar(10)          null,
   DIACHI               varchar(100)         null,
   constraint PK_NCC primary key nonclustered (MANCC)
)
go

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN (
   MANV                 varchar(20)          not null,
   HOTEN                varchar(200)         null,
   GIOITINH             varchar(5)           null,
   DIACHINV             varchar(200)         null,
   DTNV                 varchar(10)          null,
   constraint PK_NHANVIEN primary key nonclustered (MANV)
)
go

/*==============================================================*/
/* Table: NHAP                                                  */
/*==============================================================*/
create table NHAP (
   STTPHIEU             int                  not null,
   MASACH               varchar(20)          not null,
   SLNHAP               int                  null,
   GIANHAP              money                null,
   constraint PK_NHAP primary key (STTPHIEU, MASACH)
)
go

/*==============================================================*/
/* Index: NHAP_FK                                               */
/*==============================================================*/
create index NHAP_FK on NHAP (
STTPHIEU ASC
)
go

/*==============================================================*/
/* Index: NHAP2_FK                                              */
/*==============================================================*/
create index NHAP2_FK on NHAP (
MASACH ASC
)
go

/*==============================================================*/
/* Table: PHIENHAP                                              */
/*==============================================================*/
create table PHIENHAP (
   STTPHIEU             int                  not null,
   MANCC                varchar(50)          not null,
   NGAYNHAP             datetime             null,
   DOTNHAP              int                  null,
   constraint PK_PHIENHAP primary key nonclustered (STTPHIEU)
)
go

/*==============================================================*/
/* Index: GHI_FK                                                */
/*==============================================================*/
create index GHI_FK on PHIENHAP (
MANCC ASC
)
go

/*==============================================================*/
/* Table: SACH                                                  */
/*==============================================================*/
create table SACH (
   MASACH               varchar(20)          not null,
   MATHELOAI            varchar(20)          not null,
   TEN                  varchar(100)         null,
   TACGIA               varchar(100)         null,
   NXB                  varchar(100)         null,
   GIABIA               money                null,
   constraint PK_SACH primary key nonclustered (MASACH)
)
go

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on SACH (
MATHELOAI ASC
)
go

/*==============================================================*/
/* Table: THELOAI                                               */
/*==============================================================*/
create table THELOAI (
   MATHELOAI            varchar(20)          not null,
   TENTHELOAI           varchar(100)         null,
   constraint PK_THELOAI primary key nonclustered (MATHELOAI)
)
go

/*==============================================================*/
/* Table: TRUC                                                  */
/*==============================================================*/
create table TRUC (
   MANV                 varchar(20)          not null,
   STTCATRUC            int                  not null,
   NGAYTRUC             datetime             null,
   constraint PK_TRUC primary key (MANV, STTCATRUC)
)
go

/*==============================================================*/
/* Index: TRUC_FK                                               */
/*==============================================================*/
create index TRUC_FK on TRUC (
MANV ASC
)
go

/*==============================================================*/
/* Index: TRUC2_FK                                              */
/*==============================================================*/
create index TRUC2_FK on TRUC (
STTCATRUC ASC
)
go

alter table BAN
   add constraint FK_BAN_BAN_SACH foreign key (MASACH)
      references SACH (MASACH)
go

alter table BAN
   add constraint FK_BAN_BAN2_HOADON foreign key (STTHD)
      references HOADON (STTHD)
go

alter table HOADON
   add constraint FK_HOADON_LAP_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table KESACH
   add constraint FK_KESACH_DAT_THELOAI foreign key (MATHELOAI)
      references THELOAI (MATHELOAI)
go

alter table KESACH
   add constraint FK_KESACH_QLY_CATRUC foreign key (STTCATRUC)
      references CATRUC (STTCATRUC)
go

alter table NHAP
   add constraint FK_NHAP_NHAP_PHIENHAP foreign key (STTPHIEU)
      references PHIENHAP (STTPHIEU)
go

alter table NHAP
   add constraint FK_NHAP_NHAP2_SACH foreign key (MASACH)
      references SACH (MASACH)
go

alter table PHIENHAP
   add constraint FK_PHIENHAP_GHI_NCC foreign key (MANCC)
      references NCC (MANCC)
go

alter table SACH
   add constraint FK_SACH_THUOC_THELOAI foreign key (MATHELOAI)
      references THELOAI (MATHELOAI)
go

alter table TRUC
   add constraint FK_TRUC_TRUC_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table TRUC
   add constraint FK_TRUC_TRUC2_CATRUC foreign key (STTCATRUC)
      references CATRUC (STTCATRUC)
go

