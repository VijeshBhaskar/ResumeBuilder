USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[CheckWarranty]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[CheckWarranty];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 14-11-2021
-- Created By: Developer 2
-- Description: To select warranty details
-- =====================================================================
CREATE PROCEDURE [xpel].[CheckWarranty]
	@VIN varchar(100) = null,
	@PhoneNumber varchar(20) = null
AS
BEGIN

DECLARE @CreatedDate DATETIME  
DECLARE @IsWarrantyAvailable BIT=0
DECLARE @Warranty int
DECLARE @ExpiryDate DATETIME
DECLARE @IsExpired BIT

SELECT Top 1 @CreatedDate=CreatedDate,@Warranty=Warranty1,@IsExpired=IsExpired FROM [XPEL].[UserDetails] WHERE VIN=@VIN AND PhoneNumber= @PhoneNumber  order by UserID desc
SET @ExpiryDate=DATEADD(year, @Warranty, @CreatedDate)

IF (CAST(GETDATE() AS DATE) > CAST(@ExpiryDate AS DATE))
BEGIN
	UPDATE [XPEL].[UserDetails] SET IsExpired=1 WHERE VIN=@VIN AND PhoneNumber= @PhoneNumber
	SET @IsExpired=1
END

IF (@IsExpired=0 OR CAST(GETDATE() AS DATE) <= CAST(@ExpiryDate AS DATE))
BEGIN
	SET @IsWarrantyAvailable=1
END

SELECT Top 1 UserName,
	   UD.Address,
	   PhoneNumber,
	   UD.Email,
	   VIN,
	   RegistrationNumber,
	   InstallerID,
	   ID.InstallerName AS InstallerName ,
	   RoleID1,
	   RoleID2,
	   ConsumedQuantity1,
	   Warranty1 As Warranty,
	   @IsWarrantyAvailable IsWarrantyAvailable,
	   @ExpiryDate WarrantyExpiryDate
	FROM [XPEL].[UserDetails]  UD
	JOIN [XPEL].[InstallerDetails] ID ON UD.InstallerID=ID.InstallerDetailsID
		WHERE VIN=@VIN AND PhoneNumber= @PhoneNumber order by UserID desc

END
