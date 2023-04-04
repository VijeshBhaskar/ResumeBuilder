USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[InsertLanguageDetails]    Script Date: 04-04-2023 20:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert Language Details
-- =====================================================================
ALTER    PROCEDURE [RB].[InsertLanguageDetails]
	@LangTableType AS RB.TT_LangDetails READONLY,
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT
AS
BEGIN
	SELECT * INTO #Tmp_Table FROM @LangTableType

	DELETE FROM RB.LanguageDetails 
	WHERE LanguageDetailID NOT IN(SELECT ISNULL(LanguageDetailID,0) FROM #Tmp_Table) 

	DELETE LD
	FROM RB.LanguageDetails LD
	INNER JOIN #Tmp_Table TMP ON LD.LanguageDetailID = TMP.LanguageDetailID
	WHERE TMP.IsActive = 0

	UPDATE LD
	SET  LanguageName = TMP.LanguageName,
		 IsActive = TMP.IsActive,
		 ModifiedOn = GETDATE()
	FROM RB.LanguageDetails LD
	INNER JOIN #Tmp_Table TMP ON LD.LanguageDetailID = TMP.LanguageDetailID

	INSERT INTO RB.LanguageDetails
		(UserID,
		LanguageName,
		IsActive,
		CreatedOn)
	SELECT
		@UserID,
		TMP.LanguageName,
		1,
		GETDATE()
	FROM #Tmp_Table TMP WHERE TMP.LanguageDetailID IS NULL AND TMP.IsActive = 1

	SET @Message='Success'
	
	
END

