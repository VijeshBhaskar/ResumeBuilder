USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[GetEducationDetails]    Script Date: 19-03-2023 15:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Education Details
-- =====================================================================
ALTER   PROCEDURE [RB].[GetEducationDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		EducationDetailID,
		Education,
		School,
		StartDate,
		EndDate,
		City
	FROM RB.EducationDetails
	WHERE UserID = @UserID

END

