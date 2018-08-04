CREATE TABLE [ods].[TM_Donation_KN]
(
[id] [bigint] NOT NULL,
[InsertDate] [datetime] NULL,
[UpdateDate] [datetime] NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HashKey] [binary] (32) NULL,
[cust_donation_id] [int] NULL,
[name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last_first_mi] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[company_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [int] NULL,
[order_num] [int] NULL,
[order_line_item] [int] NULL,
[order_line_item_seq] [int] NULL,
[donation_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[donation_type_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fund_id] [int] NULL,
[fund_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[qual_for_benefits] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drive_year] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fund_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_id] [int] NULL,
[campaign_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gl_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_id] [int] NULL,
[solicitation_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_category_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pledge_used_for_mg] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[soft_credit_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[soft_credit_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gift_in_kind_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gift_in_kind_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[original_pledge_amount] [decimal] (18, 6) NULL,
[pledge_amount] [decimal] (18, 6) NULL,
[donation_paid_amount] [decimal] (18, 6) NULL,
[total_received_amount] [decimal] (18, 6) NULL,
[owed_amount] [decimal] (18, 6) NULL,
[external_paid_amount] [decimal] (18, 6) NULL,
[payment_schedule_id] [int] NULL,
[donor_level_amount_qual] [decimal] (18, 6) NULL,
[donor_level_amount_not_qual] [decimal] (18, 6) NULL,
[anonymous] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comments] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_9] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_10] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_11] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_12] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_13] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_14] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_15] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_16] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_17] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_18] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_19] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_donation_info_20] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[patron_listing_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[expected_payment_date] [date] NULL,
[matching_gift_corp_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[matching_gift_comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[corp_donation_match_used_amount] [decimal] (18, 6) NULL,
[thank_you_letter_id] [int] NULL,
[thank_you_letter] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[thank_you_letter_datetime] [datetime] NULL,
[tax_form_sent_datetime] [datetime] NULL,
[matched_acct_id] [int] NULL,
[matched_order_num] [int] NULL,
[matched_oli] [int] NULL,
[matched_olis] [int] NULL,
[renewal_date] [date] NULL,
[points] [decimal] (18, 6) NULL,
[orig_cust_donation_id] [int] NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [datetime] NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [datetime] NULL,
[donation_paid_datetime] [datetime] NULL,
[merchant_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ledger_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_name_full] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pledge_datetime] [datetime] NULL,
[donation_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_name_id] [int] NULL,
[donor_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[donor_name_full] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stock_symbol] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stock_num_shares] [int] NULL,
[stock_cert_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stock_transfer_datetime] [datetime] NULL,
[stock_transfer_date_low_price] [decimal] (18, 6) NULL,
[stock_transfer_date_high_price] [decimal] (18, 6) NULL,
[stock_transfer_date_avg_price] [decimal] (18, 6) NULL,
[stock_sales_amt] [decimal] (18, 6) NULL,
[stock_broker_fee] [decimal] (18, 6) NULL,
[assoc_cust_donation_Id] [int] NULL,
[suggested_amount] [decimal] (18, 6) NULL,
[apply_to_email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apply_to_acct_id] [int] NULL,
[claim_datetime] [datetime] NULL,
[in_memory_of_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[matching_gift_contact_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[matching_gift_contact_email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[matching_gift_contact_phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[donor_level_amount_qual_apply_to_acct] [decimal] (18, 6) NULL,
[donor_level_amount_not_qual_apply_to_acct] [decimal] (18, 6) NULL,
[owner_name_apply_to_acct] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unclaimed_credits] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apply_to_acct_id_display] [int] NULL,
[owner_name_apply_to_acct_display] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pledge_expiration_date] [datetime] NULL,
[waive_benefit_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[donor_level_set_id] [int] NULL,
[donor_level_set_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[donor_level_calculated_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apply_to_name_First] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apply_to_name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[language_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
