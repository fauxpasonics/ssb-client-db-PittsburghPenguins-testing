CREATE TABLE [dbo].[DimPhone]
(
[DimPhoneID] [int] NOT NULL,
[CreatedDate] [datetime] NULL,
[UpdatedDate] [datetime] NULL,
[Phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneLineTypeCode] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneCleanHash] [binary] (32) NULL
)
GO
