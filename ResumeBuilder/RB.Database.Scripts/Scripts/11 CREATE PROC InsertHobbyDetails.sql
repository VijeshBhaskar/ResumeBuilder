
-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert Hobby Details
-- =====================================================================
-- Revision : 01
-- Modified Date: 16-04-2023
-- Modified By: Developer 
-- Description: Modified Update query
-- =====================================================================
CREATE OR ALTER    PROCEDURE [RB].[InsertHobbyDetails]
	@HobbyTableType AS RB.TT_HobbyDetails READONLY,
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT
AS
BEGIN

	SELECT * INTO #Tmp_Table FROM @HobbyTableType

	DELETE FROM RB.HobbyDetails 
	WHERE HobbyDetailsID NOT IN(SELECT ISNULL(HobbyDetailsID,0) FROM #Tmp_Table) 
	AND UserID = @UserID

	DELETE HD
	FROM RB.HobbyDetails HD
	INNER JOIN #Tmp_Table TMP ON HD.HobbyDetailsID = TMP.HobbyDetailsID
	WHERE TMP.IsActive = 0 AND UserID = @UserID

	UPDATE HD 
	SET  HobbyName = TMP.HobbyName,
		 IsActive = TMP.IsActive,
		 ModifiedOn = GETDATE()
	FROM RB.HobbyDetails HD
	INNER JOIN #Tmp_Table TMP ON HD.HobbyDetailsID = TMP.HobbyDetailsID

	INSERT INTO RB.HobbyDetails
		(UserID,
		HobbyName,
		IsActive,
		CreatedOn)
	SELECT
		@UserID,
		TMP.HobbyName,
		1,
		GETDATE()
	FROM #Tmp_Table TMP WHERE TMP.HobbyDetailsID IS NULL AND IsActive = 1

	SET @Message='Success'
	
	
END

