CREATE TABLE [dbo].[DimCustomerMatchkey]
(
[ID] [int] NOT NULL,
[DimCustomerID] [int] NOT NULL,
[MatchkeyID] [int] NOT NULL,
[MatchkeyValue] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDate] [datetime] NULL,
[UpdateDate] [datetime] NULL
)
GO
