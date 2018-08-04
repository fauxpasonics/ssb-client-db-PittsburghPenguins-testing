SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [ro].[vw_TicketTaggingLogic]
AS

SELECT ttl.ID, ttl.DimSeasonID, ttl.TagType, ttl.TagTypeTable, ISNULL(CAST(ttl.TagTypeTableID AS NVARCHAR(50)), 'N/A') TagTypeTableID
	, COALESCE(tt.TicketTypeName, pt.PlanTypeName, tc.TicketClassName, st.SeatTypeName, ttl.Config_Location) TagTypeName
	, ttl.Logic, ttl.ETL__CreatedDate, ttl.ETL__UpdatedDate
FROM etl.TicketTaggingLogic ttl (NOLOCK)
LEFT JOIN dbo.DimTicketType_V2 tt (NOLOCK)
	ON ttl.TagType = 'TicketType'
	AND ttl.TagTypeTableID = tt.DimTicketTypeId
LEFT JOIN dbo.DimPlanType_V2 pt (NOLOCK)
	ON ttl.TagType = 'PlanType'
	AND ttl.TagTypeTableID = pt.DimPlanTypeId
LEFT JOIN dbo.DimTicketClass_V2 tc (NOLOCK)
	ON ttl.TagType = 'TicketClass'
	AND ttl.TagTypeTableID = tc.DimTicketClassId
LEFT JOIN dbo.DimSeatType_V2 st (NOLOCK)
	ON ttl.TagType = 'SeatType'
	AND ttl.TagTypeTableID = st.DimSeatTypeId

GO
