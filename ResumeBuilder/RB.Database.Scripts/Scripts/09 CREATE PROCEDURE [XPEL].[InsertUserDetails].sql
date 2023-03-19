USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[InsertUserDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[InsertUserDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 13-11-2021
-- Created By: Developer 2
-- Description: To Insert and User Details
-- =====================================================================
CREATE PROCEDURE [XPEL].[InsertUserDetails]
	@UserName VARCHAR(500),
	@Address VARCHAR(1000),
	@PhoneNumber VARCHAR(50),
	@Email VARCHAR(100) = NULL,
	@VIN VARCHAR(500) = NULL,
	@RegistrationNumber VARCHAR(500) = NULL,
	@RoleID1 BIGINT = 0,
	@Warranty1 INT ,
	@ConsumedQuantity1 DECIMAL(18,2) = NULL,
	@RoleID2 BIGINT = 0,
	@Warranty2 INT =0,
	@ConsumedQuantity2 DECIMAL(18,2) = NULL,
	@InstallerID BIGINT = NULL,
	@CreatedDate DATETIME=NULL,
	@UserID BIGINT = 0 OUTPUT,
	@Message VARCHAR(100) =NULL OUTPUT
AS
BEGIN
	DECLARE @RegisterDate DATETIME  
	DECLARE @IsWarrantyAvailable BIT=0
	DECLARE @Warranty int
	DECLARE @ExpiryDate DATETIME
	DECLARE @IsExpired BIT

	IF EXISTS(SELECT 1 FROM XPEL.UserDetails WHERE VIN=@VIN )
	BEGIN
		SELECT @RegisterDate=CreatedDate,@Warranty=Warranty1,@IsExpired=IsExpired FROM [XPEL].[UserDetails] WHERE VIN=@VIN 
		SET @ExpiryDate=DATEADD(year, @Warranty, @RegisterDate)

		IF (CAST(GETDATE() AS DATE) > CAST(@ExpiryDate AS DATE))
		BEGIN
			UPDATE [XPEL].[UserDetails] SET IsExpired=1 WHERE VIN=@VIN 
			SET @IsExpired=1
		END

		IF (@IsExpired =0 OR CAST(GETDATE() AS DATE) <= CAST(@ExpiryDate AS DATE))
		BEGIN
			SET @IsWarrantyAvailable=1
		END

		IF (@IsWarrantyAvailable=1)
		BEGIN
			SET @Message='User already exists';
			SET @UserID= -2;
			return;
		END		
	END

	IF(@ConsumedQuantity1>(SELECT AvailableMaterialQuantity FROM XPEL.ProductDetails WHERE RoleID = @RoleID1 AND IsActive = 1))
	BEGIN
		SET @UserID= -1
		SET @Message='Consumed Quantity ' + CAST(@ConsumedQuantity1 AS varchar(1000)) + ' is greater than available quantity';
		return;
	END
	ELSE IF(@ConsumedQuantity2>(SELECT AvailableMaterialQuantity FROM XPEL.ProductDetails WHERE RoleID = @RoleID2 AND IsActive = 1))
	BEGIN
		SET @UserID= -1
		SET @Message='Consumed Quantity ' + CAST(@ConsumedQuantity2 AS varchar(1000))  + ' is greater than available quantity';
		return;
	END
	ELSE
	BEGIN
		INSERT INTO XPEL.UserDetails
			(UserName,
			Address,
			PhoneNumber,
			Email,
			VIN,
			RegistrationNumber,
			InstallerID,
			RoleID1,
			Warranty1,
			ConsumedQuantity1,
			RoleID2,
			Warranty2,
			ConsumedQuantity2,
			IsExpired,
			CreatedDate,
			ModifiedDate)
		VALUES
			(@UserName,
			@Address,
			@PhoneNumber,
			@Email,
			@VIN,
			@RegistrationNumber,
			@InstallerID,
			@RoleID1,
			@Warranty1,
			@ConsumedQuantity1,
			@RoleID2,
			@Warranty2,
			@ConsumedQuantity2,
			0,
			@CreatedDate,
			@CreatedDate)

		
		UPDATE  XPEL.ProductDetails
		SET AvailableMaterialQuantity=(AvailableMaterialQuantity-@ConsumedQuantity1)
		WHERE RoleID=@RoleID1

		IF (@RoleID2>0)
		BEGIN
			UPDATE  XPEL.ProductDetails
				SET AvailableMaterialQuantity=(AvailableMaterialQuantity-@ConsumedQuantity2)
			WHERE RoleID=@RoleID2
		END

		SET @Message='Success'
		SET @UserID = SCOPE_IDENTITY();
	END
END

