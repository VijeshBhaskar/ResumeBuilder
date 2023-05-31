

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Language Details
-- =====================================================================
CREATE OR ALTER     PROCEDURE [RB].[GetLanguageDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		LanguageDetailID,
		LanguageName,
		IsActive
	FROM RB.LanguageDetails
	WHERE UserID = @UserID AND IsActive = 1

END

