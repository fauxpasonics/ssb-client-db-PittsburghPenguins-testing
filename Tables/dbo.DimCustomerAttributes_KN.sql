CREATE TABLE [dbo].[DimCustomerAttributes_KN]
(
[DimCustomerAttrID] [int] NOT NULL,
[DimCustomerID] [int] NULL,
[AttributeGroupID] [int] NULL,
[Attributes] [xml] NULL,
[CreatedDate] [datetime] NULL,
[UpdatedDate] [datetime] NULL
)
GO
