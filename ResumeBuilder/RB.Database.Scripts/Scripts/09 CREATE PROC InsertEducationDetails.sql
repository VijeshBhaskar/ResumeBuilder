

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert Education Details
-- =====================================================================
-- Revision : 01
-- Modified Date: 16-04-2023
-- Modified By: Developer 
-- Description: Modified Delete query
-- =====================================================================
CREATE OR ALTER   PROCEDURE [RB].[InsertEducationDetails]
	@EduTableType AS RB.TT_EducationDetails READONLY,
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT
AS
BEGIN

	SELECT * INTO #Tmp_Table FROM @EduTableType

	DELETE FROM RB.EducationDetails 
	WHERE EducationDetailID NOT IN(SELECT ISNULL(EducationDetailID,0) FROM #Tmp_Table) 
	AND UserID = @UserID 

	DELETE ED
	FROM RB.EducationDetails ED
	INNER JOIN #Tmp_Table TMP ON ED.EducationDetailID = TMP.EducationDetailID
	WHERE TMP.IsActive = 0 AND UserID = @UserID

	UPDATE ED
	SET  Education = TMP.Education,
		 School = TMP.School,
		 StartDate = TMP.StartDate,
		 EndDate = TMP.EndDate,
		 City = TMP.City,
		 IsActive = TMP.IsActive,
		 ModifiedOn = GETDATE()
	FROM  RB.EducationDetails ED	
	INNER JOIN #Tmp_Table TMP ON ED.EducationDetailID = TMP.EducationDetailID

	INSERT INTO RB.EducationDetails
		(UserID,
		Education,
		School,
		StartDate,
		EndDate,
		City,
		IsActive,
		CreatedOn)
	SELECT 
		@UserID,
		Education,
		School,
		StartDate,
		EndDate,
		City,
		1,
		GETDATE()
	FROM #Tmp_Table TMP WHERE TMP.EducationDetailID IS NULL AND IsActive = 1
		
	SET @Message='Success'
	
	
END

