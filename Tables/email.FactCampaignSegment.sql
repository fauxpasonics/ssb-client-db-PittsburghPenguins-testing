CREATE TABLE [email].[FactCampaignSegment]
(
[FactCampaignSegmentId] [int] NOT NULL IDENTITY(-2, 1),
[DimCampaignId] [int] NULL,
[DimSegmentId] [int] NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactCampa__Creat__550B8C31] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__FactCampa__Creat__55FFB06A] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactCampa__Updat__56F3D4A3] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__FactCampa__Updat__57E7F8DC] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[FactCampaignSegment] ADD CONSTRAINT [PK__FactCamp__1324ECD537F81915] PRIMARY KEY CLUSTERED  ([FactCampaignSegmentId])
GO
CREATE NONCLUSTERED INDEX [idx_FactCampaignSegment_DimCampaignId] ON [email].[FactCampaignSegment] ([DimCampaignId])
GO
CREATE NONCLUSTERED INDEX [idx_FactCampaignSegment_DimSegmentId] ON [email].[FactCampaignSegment] ([DimSegmentId])
GO
ALTER TABLE [email].[FactCampaignSegment] ADD CONSTRAINT [FK__FactCampa__DimCa__59D0414E] FOREIGN KEY ([DimCampaignId]) REFERENCES [email].[DimCampaign] ([DimCampaignId])
GO
ALTER TABLE [email].[FactCampaignSegment] ADD CONSTRAINT [FK__FactCampa__DimSe__5AC46587] FOREIGN KEY ([DimSegmentId]) REFERENCES [email].[DimSegment] ([DimSegmentId])
GO
