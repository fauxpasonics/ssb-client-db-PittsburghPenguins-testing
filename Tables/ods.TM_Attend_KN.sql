CREATE TABLE [ods].[TM_Attend_KN]
(
[id] [bigint] NOT NULL,
[InsertDate] [datetime] NULL,
[UpdateDate] [datetime] NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HashKey] [binary] (32) NULL,
[acct_id] [bigint] NULL,
[event_id] [int] NULL,
[section_id] [int] NULL,
[row_id] [int] NULL,
[seat_num] [int] NULL,
[scan_date] [datetime] NULL,
[scan_time] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[barcode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
