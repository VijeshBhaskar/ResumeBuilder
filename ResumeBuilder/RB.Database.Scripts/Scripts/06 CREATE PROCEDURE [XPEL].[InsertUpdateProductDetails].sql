USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[InsertUpdateProductDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[InsertUpdateProductDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 05-11-2021
-- Created By: Developer 3
-- Description: To Insert and Update Product Details
-- =====================================================================
CREATE PROCEDURE [XPEL].[InsertUpdateProductDetails]
	@ProductID BIGINT = 0,
	@RoleID BIGINT = 0,
	@ProductNameID BIGINT = NULL,
	@BatchNumber VARCHAR(500) = NULL,
	@MaterialQuantity DECIMAL(18,2) = NULL,
	@InstallerDetailsID BIGINT = NULL,
	@Warranty INT = 0,
	@IsActive BIT = 0,
	@CreatedDate DATETIME = NULL,
	@ModifiedDate DATETIME = NULL
AS
BEGIN
	IF(@ProductID IS NULL OR @ProductID = 0)
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM XPEL.ProductDetails WHERE RoleID=@RoleID) 
		BEGIN
			INSERT INTO XPEL.ProductDetails
				(RoleID,
				ProductNameID,
				BatchNumber,
				MaterialQuantity,
				AvailableMaterialQuantity,
				InstallerID,
				Warranty,
				IsActive,
				CreatedDate,
				ModifiedDate)
		OUTPUT inserted.ProductID
		VALUES
				(@RoleID,
				@ProductNameID,
				@BatchNumber,
				@MaterialQuantity,
				@MaterialQuantity,
				@InstallerDetailsID,
				@Warranty,
				@IsActive,
				@CreatedDate,
				@ModifiedDate)			
		END
		ELSE
		BEGIN
			SELECT -2
		END
	END
	ELSE
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM XPEL.ProductDetails WHERE RoleID=@RoleID AND ProductID!=@ProductID)
		BEGIN
 			UPDATE XPEL.ProductDetails
			SET RoleID = @RoleID,
				ProductNameID = @ProductNameID,
				BatchNumber = @BatchNumber,
				MaterialQuantity = @MaterialQuantity,
				InstallerID = @InstallerDetailsID,
				Warranty = @Warranty,
				ModifiedDate = @ModifiedDate
			OUTPUT inserted.ProductID
			WHERE ProductID = @ProductID
		END
		ELSE
		BEGIN
			select -2
		END
	END
END
GO
