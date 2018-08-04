CREATE TABLE [dbo].[DimCustomerPhone_KN]
(
[ID] [int] NOT NULL,
[CreatedDate] [datetime] NULL,
[UpdatedDate] [datetime] NULL,
[DimCustomerID] [int] NULL,
[Source_DimPhoneID] [int] NULL,
[DimPhoneID] [int] NULL,
[PhoneType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
