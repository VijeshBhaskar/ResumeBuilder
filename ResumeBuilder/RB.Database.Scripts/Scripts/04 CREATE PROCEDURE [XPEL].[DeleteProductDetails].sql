USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[DeleteProductDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[DeleteProductDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 05-11-2021
-- Created By: Developer 3
-- Description: To Delete Product Details
-- =====================================================================
CREATE PROCEDURE [XPEL].[DeleteProductDetails]
	@ProductID BIGINT
AS
BEGIN
	UPDATE XPEL.ProductDetails
	SET [IsActive] = 0
	WHERE ProductID = @ProductID
END
GO