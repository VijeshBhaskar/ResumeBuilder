
-- =====================================================================
-- Created Date: 11-03-2023
-- Created By: Developer
-- Description: To Insert User Details
-- =====================================================================
CREATE OR ALTER PROCEDURE [RB].[InsertUserDetails]
	@Email VARCHAR(100) = NULL,
	@Password nvarchar(max) = NULL,
	@Message VARCHAR(100) = NULL OUTPUT,
	@IsSuccess BIT = NULL OUTPUT
AS
BEGIN
	
	IF EXISTS(SELECT 1 FROM RB.UserDetails WHERE Email = @Email)
	BEGIN
		SET @Message = 'User Already Exists';
		SET @IsSuccess = 0;
	END
	ELSE
	BEGIN
		INSERT INTO RB.UserDetails
		(
			[Email],
			[Password],
			[IsActive],
			[CreatedDate]
		)
		VALUES
		(
			@Email,
			@Password,
			1,
			GETDATE()
		)
		SET @Message = 'User Created Successfully';
		SET @IsSuccess = 1;
	END
END
