USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[InsertPersonalDetails]    Script Date: 19-03-2023 15:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert and Personal Details
-- =====================================================================
ALTER PROCEDURE [RB].[InsertPersonalDetails]
	@PersonalDetailD BIGINT = 0,
	@FirstName VARCHAR(500),
	@LastName VARCHAR(500),
	@Email VARCHAR(100) = NULL,
	@PhoneNumber VARCHAR(50),
	@Address VARCHAR(1000),
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT
AS
BEGIN
	

	IF EXISTS(SELECT 1 FROM RB.PersonalDetails WHERE PersonalDetailD=@PersonalDetailD )
	BEGIN
		UPDATE RB.PersonalDetails
		SET FirstName=@FirstName,
		LastName = @LastName,
		Email = @Email,
		PhoneNumber = @PhoneNumber,
		[Address] = @Address,
		ModifiedOn = GETDATE()
		WHERE PersonalDetailD=@PersonalDetailD
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
			CreatedOn)
		VALUES
			(@UserID,
			@FirstName,
			@LastName,
			@Email,
			@PhoneNumber,
			@Address,
			GETDATE()
			)
	END
		SET @Message='Success'
		SET @UserID = SCOPE_IDENTITY();
	
END

