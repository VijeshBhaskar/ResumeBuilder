USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[SelectWarrantyByRoleID]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[SelectWarrantyByRoleID];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 13-11-2021
-- Created By: Developer 2
-- Description: To select warranty 
-- =====================================================================
CREATE PROCEDURE [XPEL].[SelectWarrantyByRoleID]
	@RoleID BIGINT = 0
AS
BEGIN

DECLARE @CreatedDate DATETIME  
DECLARE @Warranty int=0
DECLARE @ExpiryDate DATETIME
DECLARE @UserID BIGINT

	SELECT TOP 1 @UserID = UserID FROM [XPEL].[UserDetails] WHERE RoleID1 = @RoleID OR RoleID2 = @RoleID ORDER BY UserID DESC
	SELECT @CreatedDate = CreatedDate, @Warranty = Warranty1 FROM [XPEL].[UserDetails] WHERE RoleID1 = @RoleID AND UserID = @UserID
	
	IF(@Warranty = 0)
	BEGIN
		SELECT Top 1 @CreatedDate = CreatedDate, @Warranty = Warranty2 FROM [XPEL].[UserDetails] WHERE RoleID2 = @RoleID AND UserID = @UserID
	END

	SET @ExpiryDate=DATEADD(year, @Warranty, @CreatedDate)
	
	IF (CAST(GETDATE() AS DATE) > CAST(@ExpiryDate AS DATE))
	BEGIN
		 SELECT -2
	END
	ELSE IF EXISTS (SELECT 1 FROM  XPEL.ProductDetails WHERE RoleID=@RoleID)
	  BEGIN
		SELECT Warranty FROM XPEL.ProductDetails WHERE RoleID=@RoleID AND IsActive=1
	  END
	ELSE
	  BEGIN
	    SELECT -1
	  END
END
GO

