USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[GetPersonalDetails]    Script Date: 19-03-2023 15:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Personal Details
-- =====================================================================
ALTER PROCEDURE [RB].[GetPersonalDetails]
	@UserID BIGINT = 0
AS
BEGIN
	
	SELECT 
		PersonalDetailD,
		FirstName,
		LastName,
		Email,
		PhoneNumber,
		Address
	FROM RB.PersonalDetails
	WHERE UserID = @UserID

END

