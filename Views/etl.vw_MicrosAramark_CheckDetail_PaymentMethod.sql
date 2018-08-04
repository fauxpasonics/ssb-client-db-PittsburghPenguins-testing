SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_MicrosAramark_CheckDetail_PaymentMethod]
AS 

WITH FirstStep
AS (
	SELECT DISTINCT GuestCheckID, RecordName PaymentType
		, CASE WHEN recordName = 'TicketInfo' THEN 'STM Discount'
			WHEN recordName LIKE 'Stadis%' THEN 'Gift Card'
			WHEN recordName = 'Cash' THEN 'Cash'
			ELSE 'Credit Card' END AS PaymentGroup
		, referenceInfo AS ReferenceInfo
	FROM ods.Aramark_CheckDetail
	WHERE detailType = 4
		AND recordName IN ('TicketInfo', 'Mastercard', 'Amex', 'Discover'
			, 'Visa', 'Stadis Tier 1', 'Stadis Tier 2', 'Cash')
)

SELECT LTRIM(RTRIM(a.GuestCheckID)) GuestCheckID
	, LTRIM(RTRIM(a.PaymentType)) PaymentType
	, LTRIM(RTRIM(a.PaymentGroup)) PaymentGroup
	, LTRIM(RTRIM(a.ReferenceInfo)) ReferenceInfo
	, LTRIM(RTRIM(ccname.CCName)) CCName
	, RANK() OVER(PARTITION BY a.guestcheckId, a.PaymentGroup ORDER BY a.PaymentType, a.ReferenceInfo) xRank
FROM FirstStep a
LEFT JOIN (
		SELECT DISTINCT a.guestcheckId
			--, a.referenceInfo CCName
			, CASE WHEN a.referenceInfo LIKE '%/%' THEN
					CONCAT(
							  LTRIM(RTRIM(REVERSE(LEFT(REVERSE(a.referenceInfo), CHARINDEX('/', REVERSE(a.referenceInfo))-1))))
							, ' '
							, LTRIM(RTRIM(LEFT(a.referenceInfo, (CHARINDEX('/', a.referenceInfo)-1))))
						)
					END CCName
		FROM ods.Aramark_CheckDetail a (NOLOCK)
		LEFT JOIN (
				SELECT FirstStep.GuestCheckID, FirstStep.PaymentGroup, COUNT(DISTINCT FirstStep.ReferenceInfo) RecordCount
				FROM FirstStep
				GROUP BY FirstStep.GuestCheckID, FirstStep.PaymentGroup
				HAVING COUNT(DISTINCT FirstStep.ReferenceInfo) > 1
			) dupes ON a.guestcheckId = dupes.GuestCheckID
		WHERE detailType = 5
			AND referenceInfo LIKE '%/%'
			AND a.referenceInfo <> '/'
			AND dupes.GuestCheckID IS NULL
	) ccname ON a.guestcheckId = ccname.guestcheckId
		AND a.PaymentGroup = 'Credit Card'
			




GO
