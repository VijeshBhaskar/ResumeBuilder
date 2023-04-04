USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[GetLanguageDetails]    Script Date: 04-04-2023 20:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Get Language Details
-- =====================================================================
ALTER     PROCEDURE [RB].[GetLanguageDetails]
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

