-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Education Details
-- =====================================================================
CREATE OR ALTER   PROCEDURE [RB].[GetEducationDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		EducationDetailID,
		Education,
		School,
		StartDate,
		EndDate,
		City,
		IsActive
	FROM RB.EducationDetails
	WHERE UserID = @UserID AND IsActive = 1

END
