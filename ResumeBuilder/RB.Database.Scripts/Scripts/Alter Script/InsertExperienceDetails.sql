USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[InsertExperienceDetails]    Script Date: 16-04-2023 16:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert and Personal Details
-- =====================================================================
-- Revision : 01
-- Modified Date: 16-04-2023
-- Modified By: Developer 
-- Description: Modified Delete query
-- =====================================================================

ALTER PROCEDURE [RB].[InsertExperienceDetails]
	@ExpTableType AS RB.TT_ExpDetails READONLY,
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT
AS
BEGIN

	SELECT * INTO #Tmp_Table FROM @ExpTableType

	DELETE FROM RB.ExperienceDetails 
	WHERE ExperienceDetailsID NOT IN(SELECT ISNULL(ExperienceDetailsID,0) FROM #Tmp_Table) 
	AND UserID = @UserID

	DELETE ED
	FROM RB.ExperienceDetails ED
	INNER JOIN #Tmp_Table TMP ON ED.ExperienceDetailsID = TMP.ExperienceDetailsID
	WHERE TMP.IsActive = 0 AND UserID = @UserID

	UPDATE ED
	SET JobTitle = TMP.JobTitle,
	Employer = TMP.Employer,
	City = TMP.City,
	Country = TMP.Country,
	StartDate = TMP.StartDate,
	EndDate = CASE WHEN TMP.IsCurrentlyWorkingCompany=1 THEN NULL ELSE TMP.EndDate END,
	IsCurrentlyWorkingCompany = TMP.IsCurrentlyWorkingCompany,
	Description = TMP.Description,
	IsActive = TMP.IsActive,
	ModifiedOn = GETDATE()
	FROM RB.ExperienceDetails ED
	INNER JOIN #Tmp_Table TMP ON ED.ExperienceDetailsID = TMP.ExperienceDetailsID

	INSERT INTO RB.ExperienceDetails
		(UserID,
		JobTitle,
		Employer,
		City,
		Country,
		StartDate,
		EndDate,
		IsCurrentlyWorkingCompany,
		Description,
		IsActive,
		CreatedOn)
	SELECT 
		@UserID,
		JobTitle,
		Employer,
		City,
		Country,
		StartDate,
		EndDate,
		IsCurrentlyWorkingCompany,
		Description,
		IsActive,
		GETDATE()
	FROM #Tmp_Table TMP WHERE TMP.ExperienceDetailsID IS NULL AND TMP.IsActive = 1

	SET @Message='Success'
END

