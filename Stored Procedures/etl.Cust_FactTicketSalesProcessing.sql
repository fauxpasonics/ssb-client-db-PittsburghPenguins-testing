SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
(
	@BatchId NVARCHAR (50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

-------------------------------------------------------------------------------

-- Author name:		Kaitlyn Nelson
-- Created date:	May 2018
-- Purpose:			Set DimTicketType, DimPlanType, DimTicketClass, DimSeatType
--					values in FactTicketSales

-- Copyright © 2018, SSB, All Rights Reserved

-------------------------------------------------------------------------------

-- Modification History --

-- 2018-06-25:		Kaitlyn Nelson
-- Change notes:	Removed @@ROWCOUNT variable that wasn't working correctly,
--					replaced it with @RecordCount

-- Peer reviewed by:	Keegan Schmitt
-- Peer review notes:	It looks good to me, pulled lots of results.
-- Peer review date:	2018-06-25

-- Deployed by:
-- Deployment date:
-- Deployment notes:

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

AS

DECLARE @Query NVARCHAR(MAX)
DECLARE @RecordCount INT

IF EXISTS (SELECT * FROM dbo.sysobjects
			WHERE name = 'TicketTagging_WorkingTable'
			AND xtype = 'U')
DROP TABLE etl.TicketTagging_WorkingTable


SELECT TagUpdateScript, TagTypeRank, TagTypeTableID
INTO etl.TicketTagging_WorkingTable
FROM etl.vw_TicketTaggingLogic
ORDER BY TagTypeRank, TagTypeTableID

SET @RecordCount = (SELECT COUNT(*) FROM etl.TicketTagging_WorkingTable)


WHILE 1 = 1
BEGIN
	IF @RecordCount = 0
		BREAK
	ELSE
		BEGIN
			--DECLARE @Query NVARCHAR(MAX)
			SET @Query = (SELECT TOP 1 REPLACE(TagUpdateScript, 'dbo.FactTicketSales_V2', 'stg.TM_FactTicketSales') TagUpdateScript
			FROM etl.TicketTagging_WorkingTable
			ORDER BY TagTypeRank, TagTypeTableID)
			;
			
			EXECUTE sp_executesql @Query
			;

			DELETE
			FROM etl.TicketTagging_WorkingTable
			WHERE REPLACE(TagUpdateScript, 'dbo.FactTicketSales_V2', 'stg.TM_FactTicketSales') = @Query
			;

			SET @RecordCount = (SELECT COUNT(*) FROM etl.TicketTagging_WorkingTable)
			;
		END
		;

	CONTINUE
	;

END
;

DROP TABLE etl.TicketTagging_WorkingTable
;
			


BEGIN

/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/

UPDATE f
SET f.IsComp = 1
FROM stg.TM_FactTicketSales f (NOLOCK)
JOIN dbo.DimPriceCode_V2 dpc (NOLOCK)
	ON dpc.DimPriceCodeId = f.DimPriceCodeId
WHERE f.TM_comp_name <> 'Not Comp'
	  OR PriceCodeDesc = 'Comp'
	  OR f.RevenueTotal = 0
	  OR f.DimPlanTypeID = 4


UPDATE f
SET f.IsComp = 0
FROM stg.TM_FactTicketSales f (NOLOCK)
JOIN dbo.DimPriceCode_V2 dpc (NOLOCK)
	ON dpc.DimPriceCodeId = f.DimPriceCodeId
WHERE NOT (f.TM_comp_name <> 'Not Comp'
			OR PriceCodeDesc = 'Comp'
			OR f.RevenueTotal = 0)
	OR f.DimPlanTypeID <> 4

UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 0
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM stg.TM_FactTicketSales f
WHERE DimTicketTypeId IN (1, 2) 



UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 1
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM stg.TM_FactTicketSales f
WHERE DimTicketTypeId IN (3, 4, 5, 6, 7) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 1
FROM stg.TM_FactTicketSales f
WHERE DimTicketTypeId IN (8, 9)
	AND DimPlanTypeID IN (11, 12) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 0
FROM stg.TM_FactTicketSales f
WHERE DimTicketTypeId IN (8, 9)
	AND DimPlanTypeID NOT IN (11, 12) 

UPDATE f
SET f.IsPremium = 1
FROM stg.TM_FactTicketSales f
INNER JOIN dbo.DimSeat_V2 dst (NOLOCK)
	ON f.DimSeatID_Start = dst.DimSeatID
WHERE Config_Location LIKE '%Premium%'


UPDATE f
SET f.IsPremium = 0
FROM stg.TM_FactTicketSales f
INNER JOIN dbo.DimSeat_V2 dst (NOLOCK)
	ON f.DimSeatID_Start = dst.DimSeatID
WHERE Config_Location NOT LIKE '%Premium%'



UPDATE f
SET f.IsRenewal = 1
FROM stg.TM_FactTicketSales f
INNER JOIN dbo.DimPlanType_V2 dpt (NOLOCK)
	ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID = 2


UPDATE f
SET f.IsRenewal = 0
FROM stg.TM_FactTicketSales f
INNER JOIN dbo.DimPlanType_V2 dpt (NOLOCK)
	ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID <> 2

END

GO
