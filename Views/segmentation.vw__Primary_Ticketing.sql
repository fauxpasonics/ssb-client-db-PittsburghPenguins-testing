SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE     VIEW [segmentation].[vw__Primary_Ticketing]
AS

------------------------------------------------------------------------------- 
-- Author name:		Kaitlyn Nelson
-- Created date:	2018-07-30
-- Purpose:			Prep TM primary ticket sales data for use in
--					SSB's segmentation tool
-- Copyright © 2018, SSB, All Rights Reserved 
------------------------------------------------------------------------------- 
-- Modification History -- 
-- MODIFYDATE: MODIFYBY 
-- CHANGEDESCRIPTION 
-------------------------------------------------------------------------------

SELECT    ssbid.SSB_CRMSYSTEM_CONTACT_ID
              , fts.ETL__SSID_TM_acct_id AS Archtics_Acct_ID
              , CAST(DimDate.CalDate AS DATE) AS Order_Date
              , ISNULL(DimSeasonHeader.SeasonYear, DimSeason.SeasonYear) AS Season_Year
              , DimSeasonHeader.IsActive AS Season_Is_Active
              , DimSeason.SeasonName AS Season_Name
			  , DimTeam.TeamFullName AS Opponent_Team_Name
			 -- , DimTeam.TeamShort AS Opponent_Team_Short_Name
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
              , DimPriceCode.PriceCode AS Price_Code
              , DimPriceCode.PriceCodeDesc AS Price_Code_Description
              , DimPriceCode.PriceCodeGroup AS Price_Code_Group
              , DimPriceCode.PC1 AS PC1
              , DimPriceCode.PC2 AS PC2
              , DimPriceCode.PC3 AS PC3
              , DimPriceCode.PC4 AS PC4
			  , SUBSTRING(DimPriceCode.PriceCode,2,4) PRICE_TYPE
		--, DimClassTM.ClassName
		--, DimClassTM.ClassCategory
		--, DimClassTM.ClassType
              , DimSaleCode.SalesCode AS Sales_Code
              , DimSaleCode.SalesCodeName AS Sales_Code_Name
		--, DimSaleCode.SalesCodeDesc
		--, DimSaleCode.SalesCodeClass
              , DimPromo.PromoCode AS Promo_Code
              , DimPromo.PromoName AS Promo_Name
              , DimItem.ItemCode AS Item_Code
              , DimItem.ItemName AS Item_Name
              , DimItem.ItemDesc AS Item_Description
              , DimItem.ItemClass AS Item_Class
			  , DimPlan.PlanName AS Plan_Name
			  , DimPlan.PlanCode AS Plan_Code
              , DimTicketType.TicketTypeCode AS Ticket_Type_Code
              , DimTicketType.TicketTypeName AS Ticket_Type_Name
              , DimTicketType.TicketTypeDesc AS Ticket_Type_Description 
              , DimPlanType.PlanTypeCode AS Plan_Type_Code
              , DimPlanType.PlanTypeName AS Plan_Type_Name
              , DimPlanType.PlanTypeDesc AS Plan_Type_Description
              , DimSeatType.SeatTypeCode AS Seat_Type_Code
              , DimSeatType.SeatTypeName AS Seat_Type_Name
              , DimSeatType.SeatTypeDesc AS Seat_Type_Description
              , fts.IsHost AS Is_Host
              , fts.IsComp AS Is_Comp
              , fts.IsPremium AS Is_Premium
              , fts.IsDiscount AS Is_Discounted
              , fts.IsPlan AS Is_Plan
              , fts.IsPartial AS Is_Partial_Plan
              , fts.IsSingleEvent AS Is_Single_Event
              , fts.IsGroup AS Is_Group
              , fts.IsBroker AS Is_Broker
              , fts.IsRenewal AS Is_Renewal
              , fts.TM_comp_code AS Comp_Code
              , DimSeat.SectionName AS Section_Name
              , DimSeat.RowName AS Row_Name
              , DimSeat.Seat AS First_Seat
              , fts.QtySeat AS Qty_Seat
              , fts.TM_pc_ticket AS Pc_Ticket
              , fts.TM_purchase_price AS Pc_Price
              , fts.TM_pc_other1 AS Pc_Other_1
              , fts.TM_pc_other2 AS Pc_Other_2
              , fts.TM_pc_tax AS Pc_Tax
              , fts.TM_pc_licfee AS Pc_License_Fee
              , fts.RevenueSurcharge AS Pc_Surcharge
              , fts.TM_block_purchase_price AS Block_Purchase_Price
              , fts.PaidStatus AS Paid_Status
              , fts.PaidAmount AS Paid_Amount
              , fts.OwedAmount AS Owed_Amount
              , AccountRep.ETL__SSID_TM_acct_id AS  AccountRep_ID
              , AccountRep.FirstName  AS AccountRep_FirstName
              , AccountRep.MiddleName  AS AccountRep_MiddleName
              , AccountRep.LastName  AS AccountRep_LastName
			  , AccountRep.FullName Archtics_AddUser
      FROM      ro.vw_FactTicketSales fts WITH ( NOLOCK )
                INNER JOIN ro.vw_DimPriceCode DimPriceCode WITH ( NOLOCK ) ON DimPriceCode.DimPriceCodeId = fts.DimPriceCodeId
                INNER JOIN ro.vw_DimTicketType DimTicketType WITH ( NOLOCK ) ON DimTicketType.DimTicketTypeId = fts.DimTicketTypeId
                INNER JOIN ro.vw_DimPlanType DimPlanType WITH ( NOLOCK ) ON DimPlanType.DimPlanTypeId = fts.DimPlanTypeId
                INNER JOIN ro.vw_DimSeatType DimSeatType WITH ( NOLOCK ) ON DimSeatType.DimSeatTypeId = fts.DimSeatTypeId
                INNER JOIN dbo.DimCustomer DimCustomer WITH ( NOLOCK ) ON DimCustomer.AccountId = fts.ETL__SSID_TM_acct_id AND Dimcustomer.CustomerType = 'Primary' AND DimCustomer.SourceSystem = 'TM'
                INNER JOIN ro.vw_DimRep AccountRep WITH ( NOLOCK ) ON AccountRep.DimRepId = fts.DimRepId
                INNER JOIN ro.vw_DimDate DimDate WITH ( NOLOCK ) ON DimDate.DimDateId = fts.DimDateId
                INNER JOIN ro.vw_DimSeason DimSeason WITH ( NOLOCK ) ON DimSeason.DimSeasonId = fts.DimSeasonId
                INNER JOIN ro.vw_DimEvent DimEvent WITH ( NOLOCK ) ON DimEvent.DimEventId = fts.DimEventId
                INNER JOIN dbo.dimcustomerssbid ssbid WITH ( NOLOCK ) ON ssbid.DimCustomerId = DimCustomer.DimCustomerId
                INNER JOIN ro.vw_DimSeatStatus DimClassTM WITH ( NOLOCK ) ON DimClassTM.DimSeatStatusId = fts.DimSeatStatusId
                INNER JOIN ro.vw_DimSalesCode DimSaleCode WITH ( NOLOCK ) ON DimSaleCode.DimSalesCodeId = fts.DimSalesCodeId
                INNER JOIN ro.vw_DimPromo DimPromo WITH ( NOLOCK ) ON DimPromo.DimPromoID = fts.DimPromoId
                INNER JOIN ro.vw_DimSeat DimSeat WITH ( NOLOCK ) ON DimSeat.DimSeatId = fts.DimSeatId_Start
                INNER JOIN ro.vw_DimItem DimItem WITH ( NOLOCK ) ON DimItem.DimItemId = fts.DimItemId
                INNER JOIN ro.vw_DimEventHeader DimEventHeader WITH ( NOLOCK ) ON DimEventHeader.DimEventHeaderId = DimEvent.DimEventHeaderId
                INNER JOIN ro.vw_DimSeasonHeader DimSeasonHeader WITH ( NOLOCK ) ON DimSeasonHeader.DimSeasonHeaderId = DimEventHeader.DimSeasonHeaderId
				INNER JOIN ro.vw_DimTeam DimTeam  WITH ( NOLOCK ) ON DimEventHeader.DimTeamId_Opponent = DimTeam.DimTeamId
				INNER JOIN ro.vw_DimPlan DimPlan WITH ( NOLOCK ) ON DimPlan.DimPlanId = fts.DimPlanId

GO
