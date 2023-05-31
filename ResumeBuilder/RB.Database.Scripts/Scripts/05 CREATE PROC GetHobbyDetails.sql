
-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Hobby Details
-- =====================================================================
CREATE OR ALTER     PROCEDURE [RB].[GetHobbyDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		HobbyDetailsID,
		HobbyName,
		IsActive
	FROM RB.HobbyDetails
	WHERE UserID = @UserID AND IsActive = 1

END

