CREATE TABLE [mdm].[ForceMergeIDs]
(
[winning_dimcustomerid] [int] NULL,
[losing_dimcustomerid] [int] NULL,
[ForceMergeID] [int] NOT NULL IDENTITY(1, 1),
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__ForceMerg__Creat__3A4CA8FD] DEFAULT (getdate()),
[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__ForceMerg__Updat__3B40CD36] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriorGrouping] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
WITH
(
DATA_COMPRESSION = PAGE
)
GO
ALTER TABLE [mdm].[ForceMergeIDs] ADD CONSTRAINT [PK_ForceMergeID] PRIMARY KEY CLUSTERED  ([ForceMergeID]) WITH (DATA_COMPRESSION = PAGE)
GO
ALTER TABLE [mdm].[ForceMergeIDs] ADD CONSTRAINT [UK_Loser] UNIQUE NONCLUSTERED  ([losing_dimcustomerid]) WITH (DATA_COMPRESSION = PAGE)
GO
ALTER TABLE [mdm].[ForceMergeIDs] ADD CONSTRAINT [UK_Pair] UNIQUE NONCLUSTERED  ([winning_dimcustomerid], [losing_dimcustomerid]) WITH (DATA_COMPRESSION = PAGE)
GO
