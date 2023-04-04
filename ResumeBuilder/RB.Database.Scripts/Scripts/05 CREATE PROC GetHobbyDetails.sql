USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[GetHobbyDetails]    Script Date: 04-04-2023 20:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Hobby Details
-- =====================================================================
ALTER     PROCEDURE [RB].[GetHobbyDetails]
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

