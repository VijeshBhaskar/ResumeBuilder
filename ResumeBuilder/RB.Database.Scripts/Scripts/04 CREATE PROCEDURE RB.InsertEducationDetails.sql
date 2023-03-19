USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[InsertEducationDetails]    Script Date: 19-03-2023 15:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 12-03-2023
-- Created By: Developer 
-- Description: To Insert Education Details
-- =====================================================================
ALTER   PROCEDURE [RB].[InsertEducationDetails]
	@EducationData As [RB].[EducationDataType] Readonly,
	@UserID BIGINT = 0,
	@Message VARCHAR(100) = NULL OUTPUT
AS
BEGIN
	
	SELECT * INTO #TEMPDATA FROM @EducationData 

	UPDATE ED
	SET Education = EDTMP.Education,
	School = EDTMP.School,
	StartDate = EDTMP.StartDate,
	EndDate = EDTMP.EndDate,
	City = EDTMP.City,
	CreatedOn = GETDATE()
	FROM RB.EducationDetails ED 
	INNER JOIN #TEMPDATA EDTMP ON ED.EducationDetailID = EDTMP.EducationDetailID

	INSERT INTO RB.EducationDetails
			(UserID,
			Education,
			School,
			StartDate,
			EndDate,
			City,
			CreatedOn)
	OUTPUT INSERTED.ID INTO TMP.EducationDetailID
	SELECT 
			@UserID,
			TMP.Education,
			TMP.School,
			TMP.StartDate,
			TMP.EndDate,
			TMP.City,
			GETDATE()
	FROM #TEMPDATA TMP
	WHERE TMP.EducationDetailID IS NULL
		
	SET @Message='Success'

	SELECT * FROM #TEMPDATA
	
END

