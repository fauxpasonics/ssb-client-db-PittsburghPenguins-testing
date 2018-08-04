SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
  
  
CREATE VIEW [dbo].[vw_dimcustomer] AS     
SELECT [DimCustomerId]    
      ,[BatchId]    
      ,[ODSRowLastUpdated]    
      ,[SourceDB]    
      ,[SourceSystem]    
      ,[SourceSystemPriority]    
      ,[SSID]    
      ,[CustomerType]    
      ,[CustomerStatus]    
      ,[AccountType]    
      ,[AccountRep]    
      ,[CompanyName]    
	  ,[CompanyNameIsCleanStatus]  
      ,[SalutationName]    
      ,[DonorMailName]    
      ,[DonorFormalName]    
      ,[Birthday]    
      ,[Gender]    
      ,[MergedRecordFlag]    
      ,[MergedIntoSSID]    
      ,[Prefix]    
      ,[FirstName]    
      ,[MiddleName]    
      ,[LastName]    
      ,[Suffix]    
      ,[NameDirtyHash]    
      ,[NameIsCleanStatus]    
      ,[NameMasterId]    
      ,[AddressPrimaryStreet]    
      ,[AddressPrimaryCity]    
      ,[AddressPrimaryState]    
      ,[AddressPrimaryZip]    
      ,[AddressPrimaryCounty]    
	  ,zp.CBSA_Name AS AddressPrimaryCBSA  
      ,[AddressPrimaryCountry]    
      ,[AddressPrimaryDirtyHash]    
      ,[AddressPrimaryIsCleanStatus]    
      ,[AddressPrimaryMasterId]    
      ,[ContactDirtyHash]    
      ,[ContactGUID]    
      ,[AddressOneStreet]    
      ,[AddressOneCity]    
      ,[AddressOneState]    
      ,[AddressOneZip]    
      ,[AddressOneCounty]    
      ,z1.CBSA_Name AS AddressOneCBSA  
      ,[AddressOneCountry]    
      ,[AddressOneDirtyHash]    
      ,[AddressOneIsCleanStatus]    
      ,[AddressOneMasterId]    
      ,[AddressTwoStreet]    
      ,[AddressTwoCity]    
      ,[AddressTwoState]    
      ,[AddressTwoZip]    
      ,[AddressTwoCounty]    
      ,z2.CBSA_Name AS AddressTwoCBSA  
      ,[AddressTwoCountry]    
      ,[AddressTwoDirtyHash]    
      ,[AddressTwoIsCleanStatus]    
      ,[AddressTwoMasterId]    
      ,[AddressThreeStreet]    
      ,[AddressThreeCity]    
      ,[AddressThreeState]    
      ,[AddressThreeZip]    
      ,[AddressThreeCounty]    
      ,z3.CBSA_Name AS AddressThreeCBSA  
      ,[AddressThreeCountry]    
      ,[AddressThreeDirtyHash]    
      ,[AddressThreeIsCleanStatus]    
      ,[AddressThreeMasterId]    
      ,[AddressFourStreet]    
      ,[AddressFourCity]    
      ,[AddressFourState]    
      ,[AddressFourZip]    
      ,[AddressFourCounty]    
      ,z4.CBSA_Name AS AddressFourCBSA  
      ,[AddressFourCountry]    
      ,[AddressFourDirtyHash]    
      ,[AddressFourIsCleanStatus]    
      ,[AddressFourMasterId]    
      ,[PhonePrimary]    
      ,[PhonePrimaryDirtyHash]    
      ,[PhonePrimaryIsCleanStatus]    
      ,[PhonePrimaryMasterId]    
      ,[PhoneHome]    
      ,[PhoneHomeDirtyHash]    
      ,[PhoneHomeIsCleanStatus]    
      ,[PhoneHomeMasterId]    
      ,[PhoneCell]    
      ,[PhoneCellDirtyHash]    
      ,[PhoneCellIsCleanStatus]    
      ,[PhoneCellMasterId]    
      ,[PhoneBusiness]    
      ,[PhoneBusinessDirtyHash]    
      ,[PhoneBusinessIsCleanStatus]    
      ,[PhoneBusinessMasterId]    
      ,[PhoneFax]    
      ,[PhoneFaxDirtyHash]    
      ,[PhoneFaxIsCleanStatus]    
      ,[PhoneFaxMasterId]    
      ,[PhoneOther]    
      ,[PhoneOtherDirtyHash]    
      ,[PhoneOtherIsCleanStatus]    
      ,[PhoneOtherMasterId]    
      ,[EmailPrimary]    
      ,[EmailPrimaryDirtyHash]    
      ,[EmailPrimaryIsCleanStatus]    
      ,[EmailPrimaryMasterId]    
      ,[EmailOne]    
      ,[EmailOneDirtyHash]    
      ,[EmailOneIsCleanStatus]    
      ,[EmailOneMasterId]    
      ,[EmailTwo]    
      ,[EmailTwoDirtyHash]    
      ,[EmailTwoIsCleanStatus]    
      ,[EmailTwoMasterId]    
      ,[ExtAttribute1]    
      ,[ExtAttribute2]    
      ,[ExtAttribute3]    
      ,[ExtAttribute4]    
      ,[ExtAttribute5]    
      ,[ExtAttribute6]    
      ,[ExtAttribute7]    
      ,[ExtAttribute8]    
      ,[ExtAttribute9]    
      ,[ExtAttribute10]    
      ,[ExtAttribute11]    
      ,[ExtAttribute12]    
      ,[ExtAttribute13]    
      ,[ExtAttribute14]    
      ,[ExtAttribute15]    
      ,[ExtAttribute16]    
      ,[ExtAttribute17]    
      ,[ExtAttribute18]    
      ,[ExtAttribute19]    
      ,[ExtAttribute20]    
      ,[ExtAttribute21]    
      ,[ExtAttribute22]    
      ,[ExtAttribute23]    
      ,[ExtAttribute24]    
      ,[ExtAttribute25]    
      ,[ExtAttribute26]    
      ,[ExtAttribute27]    
      ,[ExtAttribute28]    
      ,[ExtAttribute29]    
      ,[ExtAttribute30]    
      ,[SSCreatedBy]    
      ,[SSUpdatedBy]    
      ,[SSCreatedDate]    
      ,[SSUpdatedDate]    
      ,[CreatedBy]    
      ,[UpdatedBy]    
      ,[CreatedDate]    
      ,[UpdatedDate]    
      ,[AccountId]    
      ,[AddressPrimaryNCOAStatus]    
      ,[AddressOneStreetNCOAStatus]    
      ,[AddressTwoStreetNCOAStatus]    
      ,[AddressThreeStreetNCOAStatus]    
      ,[AddressFourStreetNCOAStatus]    
      ,[IsDeleted]    
      ,[DeleteDate]    
      ,[IsBusiness]    
      ,[FullName]    
      ,[ExtAttribute31]    
      ,[ExtAttribute32]    
      ,[ExtAttribute33]    
      ,[ExtAttribute34]    
      ,[ExtAttribute35]    
      ,[AddressPrimarySuite]    
      ,[AddressOneSuite]    
      ,[AddressTwoSuite]    
      ,[AddressThreeSuite]    
      ,[AddressFourSuite]    
      ,[customer_matchkey]    
      ,[PhonePrimaryDNC]    
      ,[PhoneHomeDNC]    
      ,[PhoneCellDNC]    
      ,[PhoneBusinessDNC]    
      ,[PhoneFaxDNC]    
      ,[PhoneOtherDNC]    
      ,[AddressPrimaryPlus4]    
      ,[AddressOnePlus4]    
      ,[AddressTwoPlus4]    
      ,[AddressThreePlus4]    
      ,[AddressFourPlus4]    
      ,[AddressPrimaryLatitude]    
      ,[AddressPrimaryLongitude]    
      ,[AddressOneLatitude]    
      ,[AddressOneLongitude]    
      ,[AddressTwoLatitude]    
      ,[AddressTwoLongitude]    
      ,[AddressThreeLatitude]    
      ,[AddressThreeLongitude]    
      ,[AddressFourLatitude]    
      ,[AddressFourLongitude]    
      ,[CD_Gender]    
      ,[contactattrDirtyHash]    
      ,[extattr1_10DirtyHash]    
      ,[extattr11_20DirtyHash]    
      ,[extattr21_30DirtyHash]    
      ,[extattr31_35DirtyHash]    
      ,[matchkey_updatedate]    
	  ,[FuzzyNameGUID]    
  FROM [dbo].[DimCustomer] a  
  LEFT JOIN dbo.ZipCode zp WITH (NOLOCK) ON a.AddressPrimaryZip = zp.ZipCode  
  LEFT JOIN dbo.ZipCode z1 WITH (NOLOCK) ON a.AddressOneZip = z1.ZipCode  
  LEFT JOIN dbo.ZipCode z2 WITH (NOLOCK) ON a.AddressTwoZip = z2.ZipCode  
  LEFT JOIN dbo.ZipCode z3 WITH (NOLOCK) ON a.AddressThreeZip = z3.ZipCode  
  LEFT JOIN dbo.ZipCode z4 WITH (NOLOCK) ON a.AddressFourZip = z4.ZipCode  
GO
