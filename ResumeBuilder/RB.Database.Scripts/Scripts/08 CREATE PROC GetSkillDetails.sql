USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[GetSkillDetails]    Script Date: 04-04-2023 20:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Skill Details
-- =====================================================================
ALTER     PROCEDURE [RB].[GetSkillDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		SkillDetailID,
		SkillName,
		SkillRating,
		IsActive
	FROM RB.SkillDetails
	WHERE UserID = @UserID AND IsActive = 1

END

