USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[GetExperienceDetails]    Script Date: 16-04-2023 15:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Experience Details
-- =====================================================================
-- Revision : 01
-- Modified Date: 16-04-2023
-- Modified By: Developer 
-- Description: Added description in select
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
		IsCurrentlyWorkingCompany,
		IsActive,
		Description
	FROM RB.ExperienceDetails
	WHERE UserID = @UserID AND IsActive = 1

END

