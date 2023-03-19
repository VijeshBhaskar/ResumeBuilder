USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[SelectProductNames]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[SelectProductNames];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 28-11-2021
-- Created By: Developer 3
-- Description: To Select Product Names
-- =====================================================================
CREATE PROCEDURE [XPEL].[SelectProductNames]
AS
BEGIN
	SELECT
		ProductNameID,
		ProductName,
		CreatedDate,
		ModifiedDate
	FROM XPEL.ProductName
	WHERE IsActive = 1
END
