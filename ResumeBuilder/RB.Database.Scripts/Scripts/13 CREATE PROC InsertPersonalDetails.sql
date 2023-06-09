
-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert and Personal Details
-- =====================================================================
CREATE OR ALTER PROCEDURE [RB].[InsertPersonalDetails]
	@PersonalDetailD BIGINT = 0,
	@FirstName VARCHAR(500) = NULL,
	@LastName VARCHAR(500) = NULL,
	@Email VARCHAR(100) = NULL,
	@PhoneNumber VARCHAR(50) = NULL,
	@Address VARCHAR(1000) = NULL,
	@UserID BIGINT = 0,
	@Summary VARCHAR(MAX) = NULL,
	@JobTitle VARCHAR(100) = NULL,
	@Message VARCHAR(100) = NULL OUTPUT,
	@PersonalID BIGINT = NULL OUTPUT
AS
BEGIN
	

	IF EXISTS(SELECT 1 FROM RB.PersonalDetails WHERE UserID=@UserID )
	BEGIN
		UPDATE RB.PersonalDetails
		SET FirstName=@FirstName,
		LastName = @LastName,
		Email = @Email,
		PhoneNumber = @PhoneNumber,
		[Address] = @Address,
		Summary = @Summary,
		JobTitle = @JobTitle,
		ModifiedOn = GETDATE()
		WHERE PersonalDetailD=@PersonalDetailD

		SET @PersonalID = @PersonalDetailD
	END
	ELSE
	BEGIN
		INSERT INTO RB.PersonalDetails
			(UserID,
			FirstName,
			LastName,
			Email,
			PhoneNumber,
			[Address],
			Summary,
			JobTitle,
			CreatedOn)
		VALUES
			(@UserID,
			@FirstName,
			@LastName,
			@Email,
			@PhoneNumber,
			@Address,
			@Summary,
			@JobTitle,
			GETDATE()
			)

	    SET @PersonalID = SCOPE_IDENTITY();
	END
		SET @Message='Success'
	
END

