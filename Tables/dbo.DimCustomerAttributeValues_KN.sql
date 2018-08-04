CREATE TABLE [dbo].[DimCustomerAttributeValues_KN]
(
[DimCustomerAttrValsID] [int] NOT NULL,
[DimCustomerAttrID] [int] NULL,
[AttributeName] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeValue] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
