CREATE TABLE [ods].[TM_PayScheduleMOP_KN]
(
[id] [bigint] NOT NULL,
[InsertDate] [datetime] NULL,
[UpdateDate] [datetime] NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HashKey] [binary] (32) NULL,
[payment_Schedule_id] [int] NULL,
[seq] [int] NULL,
[acct_id] [int] NULL,
[payment_plan_id] [int] NULL,
[payment_percentage] [decimal] (18, 6) NULL,
[payment_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_mask] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_exp] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
