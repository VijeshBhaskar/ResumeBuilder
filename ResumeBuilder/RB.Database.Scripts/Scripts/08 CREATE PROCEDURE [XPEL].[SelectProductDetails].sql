USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[SelectProductDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[SelectProductDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 05-11-2021
-- Created By: Developer 3
-- Description: To Select Product Details
-- =====================================================================
CREATE PROCEDURE [XPEL].[SelectProductDetails]
	@ProductID BIGINT = NULL
AS
BEGIN
	IF(@ProductID IS NULL OR @ProductID = 0)
	BEGIN
		SELECT
			PD.ProductID,
			PD.RoleID,
			PD.ProductNameID,
			PDN.ProductName,
			PD.BatchNumber,
			PD.MaterialQuantity,
			PD.InstallerID AS InstallerDetailsID,
			PD.Warranty,
			PD.CreatedDate,
			PD.ModifiedDate
		FROM XPEL.ProductDetails PD
		LEFT JOIN XPEL.ProductName PDN
			ON PDN.ProductNameID = PD.ProductNameID
		WHERE PD.IsActive = 1
	END
	ELSE
	BEGIN
		SELECT
			PD.ProductID,
			PD.RoleID,
			PD.ProductNameID,
			PDN.ProductName,
			PD.BatchNumber,
			PD.MaterialQuantity,
			PD.InstallerID AS InstallerDetailsID,
			PD.Warranty,
			PD.CreatedDate,
			PD.ModifiedDate
		FROM XPEL.ProductDetails PD
		LEFT JOIN XPEL.ProductName PDN
			ON PDN.ProductNameID = PD.ProductNameID
		WHERE PD.ProductID = @ProductID AND
			PD.IsActive = 1
	END
END
