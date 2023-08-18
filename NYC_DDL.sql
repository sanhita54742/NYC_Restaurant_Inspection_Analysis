/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYC_DM.DM1
 *
 * Date Created : Sunday, June 18, 2023 20:42:38
 * Target DBMS : Microsoft SQL Server 2019
 */

USE NYC_Food
go
/* 
 * TABLE: DIM_Com 
 */

CREATE TABLE DIM_Com(
    CommunitySK            char(10)        NOT NULL,
    Community_Board        int             NULL,
    Community_Districts    nvarchar(30)    NULL,
    Census_track           int             NULL,
    NTA                    nvarchar(20)    NULL,
    BIN                    int             NULL,
    BBL                    int             NULL,
    BORO                   varchar(20)     NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (CommunitySK)
)

go


IF OBJECT_ID('DIM_Com') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Com >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Com >>>'
go

/* 
 * TABLE: DIM_CriticalFlag 
 */

CREATE TABLE DIM_CriticalFlag(
    CriticalFlagSK        char(10)         NOT NULL,
    CriticalFlag          char(10)         NULL,
    DI_CreateDate         date             NULL,
    DI_WorkFlowDiagram    nvarchar(256)    NULL,
    DI_WorkFowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (CriticalFlagSK)
)

go


IF OBJECT_ID('DIM_CriticalFlag') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_CriticalFlag >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_CriticalFlag >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DateSK                  int              NOT NULL,
    FullDateAK              date             NULL,
    DayNumberOfWeek         int              NULL,
    DayNameOfWeek           nvarchar(10)     NULL,
    DayNumberOfMonth        int              NULL,
    DayNumberOfYear         int              NULL,
    WeekNumberOfYear        int              NULL,
    MonthName               nvarchar(10)     NULL,
    MonthNumberOfYear       int              NULL,
    CalendarQuarter         int              NULL,
    CalendarYear            smallint         NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFLowDirectory    nvarchar(10)     NULL,
    DI_WorkFlowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (DateSK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geography 
 */

CREATE TABLE Dim_Geography(
    GeoSK                   int                NOT NULL,
    Longitude               decimal(15, 10)    NULL,
    Latitude                decimal(15, 10)    NULL,
    Street                  nvarchar(150)      NULL,
    Boro                    nvarchar(25)       NULL,
    ZipCode                 nvarchar(10)       NULL,
    DI_CreateDate           date               NULL,
    DI_WorkFlowDirectory    nvarchar(256)      NULL,
    DI_WorkFlowFileName     nvarchar(256)      NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (GeoSK)
)

go


IF OBJECT_ID('Dim_Geography') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geography >>>'
go

/* 
 * TABLE: DIM_Inspection_Grade 
 */

CREATE TABLE DIM_Inspection_Grade(
    GradeSK                 int              NOT NULL,
    Grade                   char(10)         NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    DI_WorkFlowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (GradeSK)
)

go


IF OBJECT_ID('DIM_Inspection_Grade') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Inspection_Grade >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Inspection_Grade >>>'
go

/* 
 * TABLE: Dim_InspectionType 
 */

CREATE TABLE Dim_InspectionType(
    InspectionKeySK         char(10)         NOT NULL,
    InspectionType          nvarchar(150)    NULL,
    Action                  nvarchar(80)     NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    Di_WorkFlowFIleName     nvarchar(256)    NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (InspectionKeySK)
)

go


IF OBJECT_ID('Dim_InspectionType') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_InspectionType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_InspectionType >>>'
go

/* 
 * TABLE: Dim_Restaurant 
 */

CREATE TABLE Dim_Restaurant(
    RestaurantKeySK         nvarchar(10)     NOT NULL,
    Phone                   int              NULL,
    Building_Name           nvarchar(40)     NULL,
    CAMIS_ID                nvarchar(20)     NULL,
    DBA                     nvarchar(100)    NULL,
    BuildingNo              char(40)         NULL,
    Cuisine                 char(40)         NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    DI_WorkFlowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (RestaurantKeySK)
)

go


IF OBJECT_ID('Dim_Restaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Restaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Restaurant >>>'
go

/* 
 * TABLE: Dim_Violation 
 */

CREATE TABLE Dim_Violation(
    ViolationKeySK          char(10)         NOT NULL,
    ViolationCode           char(20)         NULL,
    ViolationDescription    nvarchar(250)    NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    DI_WorkFLowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (ViolationKeySK)
)

go


IF OBJECT_ID('Dim_Violation') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violation >>>'
go

/* 
 * TABLE: Fact_Inspection 
 */

CREATE TABLE Fact_Inspection(
    InspectionSK                          int              NOT NULL,
    DI_WorkFlowDirectory                  nvarchar(256)    NULL,
    DI_WorkFlowFileName                   nvarchar(256)    NULL,
    DI_CreateDate                         date             NULL,
    Score                                 char(10)         NULL,
    InspectionKeySK                       nvarchar(10)     NULL,
    RestaurantKeySK                       nvarchar(10)     NOT NULL,
    GeoKey                                int              NOT NULL,
    Dim_InspectionType_InspectionKeySK    char(10)         NOT NULL,
    InspectionDateSK                      int              NOT NULL,
    RecordDateSK                          int              NOT NULL,
    GradeDateSK                           int              NOT NULL,
    ViolationKeySK                        char(10)         NOT NULL,
    CommunitySK                           char(10)         NOT NULL,
    GradeSK                               int              NOT NULL,
    CriticalFlagSK                        char(10)         NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (InspectionSK)
)

go


IF OBJECT_ID('Fact_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Inspection >>>'
go

/* 
 * TABLE: Fact_Inspection 
 */

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Restaurant14 
    FOREIGN KEY (RestaurantKeySK)
    REFERENCES Dim_Restaurant(RestaurantKeySK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Date8 
    FOREIGN KEY (InspectionDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Date9 
    FOREIGN KEY (RecordDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Date10 
    FOREIGN KEY (GradeDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Violation11 
    FOREIGN KEY (ViolationKeySK)
    REFERENCES Dim_Violation(ViolationKeySK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_InspectionType12 
    FOREIGN KEY (Dim_InspectionType_InspectionKeySK)
    REFERENCES Dim_InspectionType(InspectionKeySK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Geography13 
    FOREIGN KEY (GeoKey)
    REFERENCES Dim_Geography(GeoSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDIM_Com15 
    FOREIGN KEY (CommunitySK)
    REFERENCES DIM_Com(CommunitySK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDIM_Inspection_Grade16 
    FOREIGN KEY (GradeSK)
    REFERENCES DIM_Inspection_Grade(GradeSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDIM_CriticalFlag17 
    FOREIGN KEY (CriticalFlagSK)
    REFERENCES DIM_CriticalFlag(CriticalFlagSK)
go


