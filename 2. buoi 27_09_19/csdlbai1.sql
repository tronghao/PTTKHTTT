CREATE DATABASE NHANKHAU
GO

USE NHANKHAU
GO
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     27/09/2019 8:09:10 AM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHANKHAU') and o.name = 'FK_NHANKHAU_CO_SOHOKHAU')
alter table NHANKHAU
   drop constraint FK_NHANKHAU_CO_SOHOKHAU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHUONGXA') and o.name = 'FK_PHUONGXA_THUOC_QUANHUYE')
alter table PHUONGXA
   drop constraint FK_PHUONGXA_THUOC_QUANHUYE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SOHOKHAU') and o.name = 'FK_SOHOKHAU_QUAN_LY_PHUONGXA')
alter table SOHOKHAU
   drop constraint FK_SOHOKHAU_QUAN_LY_PHUONGXA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHANKHAU')
            and   name  = 'CO_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHANKHAU.CO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHANKHAU')
            and   type = 'U')
   drop table NHANKHAU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHUONGXA')
            and   name  = 'THUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHUONGXA.THUOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHUONGXA')
            and   type = 'U')
   drop table PHUONGXA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('QUANHUYEN')
            and   type = 'U')
   drop table QUANHUYEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SOHOKHAU')
            and   name  = 'QUAN_LY_FK'
            and   indid > 0
            and   indid < 255)
   drop index SOHOKHAU.QUAN_LY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SOHOKHAU')
            and   type = 'U')
   drop table SOHOKHAU
go

/*==============================================================*/
/* Table: NHANKHAU                                              */
/*==============================================================*/
create table NHANKHAU (
   STT                  int                  not null,
   SOSO                 int                  not null,
   HOTEN                varchar(30)          null,
   GIOITINH             varchar(3)           null,
   NGAYSINH             datetime             null,
   constraint PK_NHANKHAU primary key nonclustered (STT)
)
go

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/
create index CO_FK on NHANKHAU (
SOSO ASC
)
go

/*==============================================================*/
/* Table: PHUONGXA                                              */
/*==============================================================*/
create table PHUONGXA (
   MAPHUONGXA           varchar(10)          not null,
   MAQUANHUYEN          varchar(10)          not null,
   TENPHUONGXA          varchar(20)          null,
   constraint PK_PHUONGXA primary key nonclustered (MAPHUONGXA)
)
go

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on PHUONGXA (
MAQUANHUYEN ASC
)
go

/*==============================================================*/
/* Table: QUANHUYEN                                             */
/*==============================================================*/
create table QUANHUYEN (
   MAQUANHUYEN          varchar(10)          not null,
   TENQUANHUYEN         varchar(20)          null,
   constraint PK_QUANHUYEN primary key nonclustered (MAQUANHUYEN)
)
go

/*==============================================================*/
/* Table: SOHOKHAU                                              */
/*==============================================================*/
create table SOHOKHAU (
   SOSO                 int                  not null,
   MAPHUONGXA           varchar(10)          not null,
   HOTENCHUHO           varchar(30)          null,
   SONHA                varchar(10)          null,
   TENDUONGPHO          varchar(20)          null,
   KHUPHOAP             varchar(20)          null,
   constraint PK_SOHOKHAU primary key nonclustered (SOSO)
)
go

/*==============================================================*/
/* Index: QUAN_LY_FK                                            */
/*==============================================================*/
create index QUAN_LY_FK on SOHOKHAU (
MAPHUONGXA ASC
)
go

alter table NHANKHAU
   add constraint FK_NHANKHAU_CO_SOHOKHAU foreign key (SOSO)
      references SOHOKHAU (SOSO)
go

alter table PHUONGXA
   add constraint FK_PHUONGXA_THUOC_QUANHUYE foreign key (MAQUANHUYEN)
      references QUANHUYEN (MAQUANHUYEN)
go

alter table SOHOKHAU
   add constraint FK_SOHOKHAU_QUAN_LY_PHUONGXA foreign key (MAPHUONGXA)
      references PHUONGXA (MAPHUONGXA)
go

insert into QUANHUYEN values(1, 'Cau Ke')
insert into QUANHUYEN values(2, 'Tieu Can')
insert into QUANHUYEN values(3, 'Chau Thanh')
insert into QUANHUYEN values(4, 'Duyen Hai')

insert into PHUONGXA values(1, 1, 'Phong Thanh')
insert into PHUONGXA values(2, 1, 'Phong Phu')
insert into PHUONGXA values(3, 2, 'Hieu Trung')
insert into PHUONGXA values(4, 2, 'Hieu Tu')
insert into PHUONGXA values(5, 3, 'Phuoc Hao')
insert into PHUONGXA values(6, 3, 'Luong Hoa')
insert into PHUONGXA values(7, 4, 'Long Toan')
insert into PHUONGXA values(8, 4, 'Long Khanh')

insert into SOHOKHAU values(1, 1, 'Vo Le Khanh Duy', '257/12', 'Phong Thanh', 'Ca Chuong')
insert into SOHOKHAU values(2, 2, 'Nguyen Huynh Cong Minh', '256/12', 'Phong Phu', 'Chau Dien')
insert into SOHOKHAU values(3, 3, 'Nguyen Minh Thu', '255/12', 'Hieu Trung', 'Cay Gon')
insert into SOHOKHAU values(4, 4, 'Duong Quoc Tuan', '254/12', 'Hieu Tu', 'Ap Cho')
insert into SOHOKHAU values(5, 5, 'Do Trong Hao', '253/12', 'Phuoc Hao', 'Hoa Hao')
insert into SOHOKHAU values(6, 6, 'Pham Huynh Viet Tu', '252/12', 'Luong Hoa', 'O Chich')
insert into SOHOKHAU values(7, 7, 'Doan Thi Yen Nhi', '251/12', 'Long Toan', 'Long Dien')
insert into SOHOKHAU values(8, 8, 'Thach Visal', '250/12', 'Long Khanh', 'Long Vinh')

insert into NHANKHAU values(1, 1, 'Vo Le Khanh Duy', 'Nam', '05/25/1999')
insert into NHANKHAU values(2, 2, 'Nguyen Huynh Cong Minh', 'Nam', '03/30/1999')


select * from QUANHUYEN 
select * from PHUONGXA
select * from SOHOKHAU
select * from NHANKHAU