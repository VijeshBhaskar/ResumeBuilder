USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[InsertSkillsDetails]    Script Date: 16-04-2023 16:38:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert Skills Details
-- =====================================================================
-- Revision : 01
-- Modified Date: 16-04-2023
-- Modified By: Developer 
-- Description: Modified Delete query
-- =====================================================================

ALTER    PROCEDURE [RB].[InsertSkillsDetails]
	@SkillTableType AS RB.TT_SkillDetails READONLY,
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT
AS
BEGIN
	SELECT * INTO #Tmp_Table FROM @SkillTableType

	DELETE FROM RB.SkillDetails 
	WHERE SkillDetailID NOT IN(SELECT ISNULL(SkillDetailID,0) FROM #Tmp_Table) 
	AND UserID = @UserID 

	DELETE SD
	FROM RB.SkillDetails SD
	INNER JOIN #Tmp_Table TMP ON SD.SkillDetailID = TMP.SkillDetailID
	WHERE TMP.IsActive = 0 AND UserID = @UserID 

	UPDATE SD
	SET  SkillName = TMP.SkillName,
		 SkillRating = TMP.SkillRating,
		 IsActive = TMP.IsActive,
		 ModifiedOn = GETDATE()
	FROM RB.SkillDetails SD 
	INNER JOIN #Tmp_Table TMP ON SD.SkillDetailID = TMP.SkillDetailID

	INSERT INTO RB.SkillDetails
		(UserID,
		 SkillName,
		 SkillRating,
		 IsActive,
		 CreatedOn
		)
	SELECT 
		 @UserID,
		 SkillName,
		 SkillRating,
		 IsActive,
		 GETDATE()
	FROM #Tmp_Table TMP WHERE TMP.SkillDetailID IS NULL AND IsActive = 1

		
	SET @Message='Success'

END

