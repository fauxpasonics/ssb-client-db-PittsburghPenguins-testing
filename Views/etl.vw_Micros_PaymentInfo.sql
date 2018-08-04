SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Micros_PaymentInfo]
AS

SELECT a.guestcheckId
	, a.checkTotal

	-- Ticket Info --
	, CASE WHEN stm.IsSTM IS NOT NULL THEN 1 ELSE 0 END AS IsSTM
	, CASE WHEN TRY_CAST(t.ReferenceInfo AS BIGINT) >= 400000000 THEN CAST(t.ReferenceInfo AS BIGINT) - 400000000
		WHEN TRY_CAST(t.ReferenceInfo AS BIGINT) < 400000000 THEN t.referenceInfo
		ELSE NULL END AS ArchticsID
	, dc.FirstName AS ArchticsFirstName
	, dc.MiddleName AS ArchticsMiddleName
	, dc.LastName AS ArchticsLastName

	-- Cash Info --
	, CASE WHEN ISNULL(c.PaymentType, '') = 'CASH' THEN 1 ELSE 0 END AS IsCashBuyer
	
	-- Credit Card Info --
	, CASE WHEN p1.PaymentGroup = 'Credit Card' THEN p1.PaymentType END AS CreditCardPrimaryType
	, CASE WHEN p1.PaymentGroup = 'Credit Card'	THEN p1.ReferenceInfo END AS CreditCardPrimaryLast4
	, CASE WHEN p1.PaymentGroup = 'Credit Card'	THEN p1.CCName END AS CreditCardPrimaryName

	, CASE WHEN p2.PaymentGroup = 'Credit Card'	THEN p2.PaymentType END AS CreditCardTwoType
	, CASE WHEN p2.PaymentGroup = 'Credit Card' THEN p2.ReferenceInfo END AS CreditCardTwoLast4
	, CASE WHEN p2.PaymentGroup = 'Credit Card' THEN p2.CCName END AS CreditCardTwoName

	, CASE WHEN p3.PaymentGroup = 'Credit Card' THEN p3.PaymentType END AS CreditCardThreeType
	, CASE WHEN p3.PaymentGroup = 'Credit Card' THEN p3.ReferenceInfo END AS CreditCardThreeLast4
	, CASE WHEN p3.PaymentGroup = 'Credit Card' THEN p3.CCName END AS CreditCardThreeName

	-- Gift Card Info --
	, CASE WHEN g1.PaymentGroup = 'Gift Card' THEN g1.PaymentType END AS GiftCardPrimaryType
	, CASE WHEN g1.PaymentGroup = 'Gift Card' THEN g1.ReferenceInfo END AS GiftCardPrimaryNumber

	, CASE WHEN g2.PaymentGroup = 'Gift Card' THEN g2.PaymentType END AS GiftCardTwoType
	, CASE WHEN g2.PaymentGroup = 'Gift Card' THEN g2.ReferenceInfo END AS GiftCardTwoNumber

	, CASE WHEN g3.PaymentGroup = 'Gift Card' THEN g3.PaymentType END AS GiftCardThreeType
	, CASE WHEN g3.PaymentGroup = 'Gift Card' THEN g3.ReferenceInfo END AS GiftCardThreeNumber

--SELECT COUNT(*)
FROM ods.Aramark_CheckHeader a
LEFT JOIN ( -- STM Discount
		SELECT DISTINCT guestcheckId, recordName IsSTM
		FROM ods.Aramark_CheckDetail
		WHERE detailType = 2
		AND recordName = 'Season Ticket Member'
	) stm ON a.guestcheckId = stm.guestcheckId
LEFT JOIN ( -- Payment Info, Rank 1
		SELECT DISTINCT GuestCheckID, PaymentType, PaymentGroup, ReferenceInfo, CCName
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentGroup = 'Credit Card'
			AND xRank = 1
	) p1 ON a.guestcheckId = p1.GuestCheckID
LEFT JOIN ( -- Payment Info, Rank 2
		SELECT DISTINCT GuestCheckID, PaymentType, PaymentGroup, ReferenceInfo, CCName
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentGroup = 'Credit Card'
			AND xRank = 2
	) p2 ON a.guestcheckId = p2.GuestCheckID
LEFT JOIN ( -- Payment Info, Rank 3
		SELECT DISTINCT GuestCheckID, PaymentType, PaymentGroup, ReferenceInfo, CCName
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentGroup = 'Credit Card'
			AND xRank = 3
	) p3 ON a.guestcheckId = p3.GuestCheckID
LEFT JOIN ( -- Payment Info, Rank 1
		SELECT DISTINCT GuestCheckID, PaymentType, PaymentGroup, ReferenceInfo, CCName
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentGroup = 'Gift Card'
			AND xRank = 1
	) g1 ON a.guestcheckId = g1.GuestCheckID
LEFT JOIN ( -- Payment Info, Rank 2
		SELECT DISTINCT GuestCheckID, PaymentType, PaymentGroup, ReferenceInfo, CCName
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentGroup = 'Gift Card'
			AND xRank = 2
	) g2 ON a.guestcheckId = g2.GuestCheckID
LEFT JOIN ( -- Payment Info, Rank 3
		SELECT DISTINCT GuestCheckID, PaymentType, PaymentGroup, ReferenceInfo, CCName
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentGroup = 'Gift Card'
			AND xRank = 3
	) g3 ON a.guestcheckId = g3.GuestCheckID
LEFT JOIN ( -- Archtics ID
		SELECT GuestCheckID, PaymentType, ReferenceInfo
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentType = 'TicketInfo'
			AND xRank = 1
	) t ON a.guestcheckId = t.GuestCheckID
LEFT JOIN ( -- Cash Buyer
		SELECT DISTINCT GuestCheckID, PaymentType
		FROM etl.vw_MicrosAramark_CheckDetail_PaymentMethod
		WHERE PaymentType = 'Cash'
			AND xRank = 1
	) c ON a.guestcheckId = c.GuestCheckID
LEFT JOIN dbo.DimCustomer dc (NOLOCK)
	ON (CASE WHEN TRY_CAST(t.ReferenceInfo AS BIGINT) >= 400000000 THEN CAST(t.ReferenceInfo AS BIGINT) - 400000000
		WHEN TRY_CAST(t.ReferenceInfo AS BIGINT) < 400000000 THEN t.referenceInfo END) = dc.AccountId
		AND dc.CustomerType = 'Primary'
		AND dc.SourceSystem = 'TM'

GO
