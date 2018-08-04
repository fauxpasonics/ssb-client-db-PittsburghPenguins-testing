CREATE TABLE [ods].[Aramark_CheckDetail]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Aramark_C__ETL_C__56E8E7AB] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Aramark_C__ETL_U__57DD0BE4] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Aramark_C__ETL_I__58D1301D] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemID] [int] NULL,
[SiteID] [int] NULL,
[SystemPOSID] [int] NULL,
[locationID] [int] NULL,
[revenueCenterID] [int] NULL,
[revenueCenterPOSRef] [int] NULL,
[guestcheckId] [int] NULL,
[guestCheckLineItemID] [int] NULL,
[businessDate] [datetime] NULL,
[transdatetime] [datetime] NULL,
[detailType] [int] NULL,
[recordPosRef] [int] NULL,
[recordName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[priceLevel] [int] NULL,
[voidflag] [bit] NULL,
[genflag1] [bit] NULL,
[lineCount] [int] NULL,
[lineTotal] [decimal] (11, 2) NULL,
[reportLineCount] [int] NULL,
[reportLineTotal] [decimal] (11, 2) NULL,
[referenceInfo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[referenceInfo2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[doNotShow] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[masterPosRef] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[daypartid] [int] NULL,
[reasoncodeposRef] [int] NULL,
[reasonName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[majorgroupPosRef] [int] NULL,
[majorgroupname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[familygroupPosRef] [int] NULL,
[familygroupname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax1total] [decimal] (11, 2) NULL,
[tax2total] [decimal] (11, 2) NULL,
[tax3total] [decimal] (11, 2) NULL,
[tax4total] [decimal] (11, 2) NULL,
[tax5total] [decimal] (11, 2) NULL,
[tax6total] [decimal] (11, 2) NULL,
[tax7total] [decimal] (11, 2) NULL,
[tax8total] [decimal] (11, 2) NULL,
[dscMenuItemPosRef] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[revenueCenterName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uwsid] [int] NULL
)
GO
ALTER TABLE [ods].[Aramark_CheckDetail] ADD CONSTRAINT [PK__Aramark___7EF6BFCD715E4F61] PRIMARY KEY CLUSTERED  ([ETL_ID])
GO
CREATE NONCLUSTERED INDEX [IX_ETL_UpdatedDate] ON [ods].[Aramark_CheckDetail] ([ETL_UpdatedDate] DESC)
GO
CREATE NONCLUSTERED INDEX [IX_Key] ON [ods].[Aramark_CheckDetail] ([guestcheckId], [guestCheckLineItemID]) INCLUDE ([ETL_DeltaHashKey])
GO
