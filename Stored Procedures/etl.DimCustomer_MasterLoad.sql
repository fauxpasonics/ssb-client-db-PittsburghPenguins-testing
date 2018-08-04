SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]
AS
BEGIN


-- TM
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Ducks', @LoadView = 'ods.vw_TM_LoadDimCustomer', @LogLevel = '2', @DropTemp = '1', @IsDataUploaderSource = '0';



END;












GO
