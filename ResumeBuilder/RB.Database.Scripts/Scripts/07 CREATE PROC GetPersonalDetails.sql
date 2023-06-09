
-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Personal Details
-- =====================================================================
CREATE OR ALTER PROCEDURE [RB].[GetPersonalDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		PersonalDetailD,
		FirstName,
		LastName,
		Email,
		PhoneNumber,
		Address,
		Summary,
		JobTitle
	FROM RB.PersonalDetails
	WHERE UserID = @UserID

END

