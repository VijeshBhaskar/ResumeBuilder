
-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Skill Details
-- =====================================================================
CREATE OR ALTER     PROCEDURE [RB].[GetSkillDetails]
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

