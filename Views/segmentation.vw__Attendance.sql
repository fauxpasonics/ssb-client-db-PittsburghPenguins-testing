SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [segmentation].[vw__Attendance]
AS

------------------------------------------------------------------------------- 
-- Author name:		Kaitlyn Nelson
-- Created date:	2018-07-30
-- Purpose:			Prep TM attendance data for use in SSB's segmentation tool
-- Copyright © 2018, SSB, All Rights Reserved 
------------------------------------------------------------------------------- 
-- Modification History -- 
-- MODIFYDATE: MODIFYBY 
-- CHANGEDESCRIPTION 
-------------------------------------------------------------------------------
    ( SELECT    ssbid.SSB_CRMSYSTEM_CONTACT_ID
              , DimCustomer.AccountId AS Archtics_Acct_Id
              , CAST(1 AS BIT) AS Attended_By_Originator
              , DimSeasonHeader.IsActive AS Season_Is_Active
              , DimSeason.SeasonName AS Season_Name
              , DimEventHeader.EventName AS Event_Header_Name
              , DimEvent.EventCode AS Event_Code
              , DimEvent.EventName AS Event_Name
              , DimEvent.EventDesc AS Event_Desc
              , DimEvent.EventClass AS Event_Class
              , DimEvent.EventDate AS Event_Date
              , CAST(DimEvent.EventTime AS NVARCHAR(30)) Event_Time
			  --, DimEvent.MajorCategoryTM
		      --, DimEvent.MinorCategoryTM
              , DimEventHeader.EventHierarchyL1 AS Event_Hierarchy_L1
              , DimEventHeader.EventHierarchyL2 AS Event_Hierarchy_L2
              , DimEventHeader.EventHierarchyL3 AS Event_Hierarchy_L3
              , DimSeat.SectionName AS Section_Name
              , DimSeat.RowName AS Row_Name
              , DimSeat.Seat AS First_Seat
              , CAST(CAST(fa.ScanDateTime AS TIME) AS NVARCHAR(30)) Scan_Time
              , dsg.ScanGateName AS Scan_Gate
              , dstp.ETL__SSID_TM_channel_ind AS Channel
      FROM      ro.vw_FactAttendance fa WITH (NOLOCK)
                INNER JOIN ro.vw_DimEvent DimEvent WITH ( NOLOCK ) ON DimEvent.DimEventId = fa.DimEventId
                INNER JOIN ro.vw_DimSeason DimSeason WITH ( NOLOCK ) ON DimSeason.DimSeasonId = DimEvent.DimSeasonId
                INNER JOIN ro.vw_DimSeat DimSeat WITH ( NOLOCK ) ON DimSeat.DimSeatId = fa.DimSeatId
                INNER JOIN dbo.dimcustomer DimCustomer WITH ( NOLOCK ) ON DimCustomer.AccountId = fa.ETL__SSID_TM_acct_id
                                                              AND DimCustomer.CustomerType = 'Primary'
                                                              AND DimCustomer.SourceSystem = 'TM'
                INNER JOIN dbo.dimcustomerssbid ssbid WITH ( NOLOCK ) ON ssbid.DimCustomerId = DimCustomer.DimCustomerId
                INNER JOIN ro.vw_DimEventHeader DimEventHeader WITH ( NOLOCK ) ON DimEventHeader.DimEventHeaderId = DimEvent.DimEventHeaderId
                INNER JOIN ro.vw_DimSeasonHeader DimSeasonHeader WITH ( NOLOCK ) ON DimSeasonHeader.DimSeasonHeaderId = DimEventHeader.DimSeasonHeaderId
				INNER JOIN ro.vw_DimScanGate dsg ON dsg.DimScanGateId = fa.DimScanGateId
				INNER JOIN ro.vw_DimScanType dstp ON dstp.DimScanTypeId = fa.DimScanTypeId
	 WHERE DATEDIFF(YEAR,DimEvent.EventDate, GETDATE()) <= 2
    )

GO
