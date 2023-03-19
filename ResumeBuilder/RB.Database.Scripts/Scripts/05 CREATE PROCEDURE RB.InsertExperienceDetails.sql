USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[InsertExperienceDetails]    Script Date: 19-03-2023 15:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert and Personal Details
-- =====================================================================
ALTER PROCEDURE [RB].[InsertExperienceDetails]
	@ExperienceDetailsID BIGINT = 0,
	@JobTitle VARCHAR(1000) = NULL,
	@Employer VARCHAR(1000) = NULL,
	@City VARCHAR(1000) = NULL,
	@Country VARCHAR(1000) = NULL,
	@StartDate DATETIME = NULL,
	@EndDate DATETIME = NULL,
	@IsCurrentlyWorkingCompany BIT = NULL,
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT,
	@ExpID BIGINT = NULL OUTPUT
AS
BEGIN
	
	DECLARE @id int
	DECLARE @insertedTable table (id int)

	IF EXISTS(SELECT 1 FROM RB.ExperienceDetails WHERE ExperienceDetailsID = @ExperienceDetailsID)
	BEGIN
		UPDATE RB.ExperienceDetails
		SET JobTitle = @JobTitle,
		Employer = @Employer,
		City = @City,
		Country = @Country,
		StartDate = @StartDate,
		EndDate = CASE WHEN @IsCurrentlyWorkingCompany=1 THEN NULL ELSE @EndDate END,
		IsCurrentlyWorkingCompany = @IsCurrentlyWorkingCompany,
		ModifiedOn = GETDATE()
		WHERE ExperienceDetailsID = @ExperienceDetailsID
	END
	ELSE
	BEGIN
		INSERT INTO RB.ExperienceDetails
			(UserID,
			JobTitle,
			Employer,
			City,
			Country,
			StartDate,
			EndDate,
			IsCurrentlyWorkingCompany,
			CreatedOn)
		OUTPUT inserted.ExperienceDetailsID into @insertedTable
		VALUES
			(@UserID,
			@JobTitle,
			@Employer,
			@City,
			@Country,
			@StartDate,
			CASE WHEN @IsCurrentlyWorkingCompany=1 THEN NULL ELSE @EndDate END,
			@IsCurrentlyWorkingCompany,
			GETDATE()
			)
	END
		SET @Message='Success'
		SET @UserID = SCOPE_IDENTITY();

		SELECT TOP 1 @ExpID =id from @insertedTable
	
END

