USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[GetExperienceDetails]    Script Date: 19-03-2023 15:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Experience Details
-- =====================================================================
ALTER PROCEDURE [RB].[GetExperienceDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		ExperienceDetailsID,
		JobTitle,
		Employer,
		City,
		Country,
		StartDate,
		EndDate,
		IsCurrentlyWorkingCompany
	FROM RB.ExperienceDetails
	WHERE UserID = @UserID

END

