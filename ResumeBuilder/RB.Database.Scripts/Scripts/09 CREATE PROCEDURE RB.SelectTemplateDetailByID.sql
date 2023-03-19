USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[SelectTemplateDetailByID]    Script Date: 19-03-2023 15:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 11-03-2023
-- Created By: Developer
-- Description: To Select Template Details
-- =====================================================================
ALTER PROCEDURE [RB].[SelectTemplateDetailByID]
	@TemplateId INT = NULL,
	@UserID BIGINT = NULL
AS
BEGIN
	
	Declare @TemplateHtml nvarchar(max) = NULL,
	@FirstName varchar(500) = NULL,
	@LastName varchar(500) = NULL,
	@Email varchar(100) = NULL,
	@PhoneNumber varchar(50) = NULL,
	@Address varchar(1000) = NULL,
	@ExperienceHtml nvarchar(max) = NULL,
	@ExperienceBasicHtml nvarchar(max) = NULL,
	@EducationHtml nvarchar(max) = NULL,
	@EducationBasicHtml nvarchar(max) = NULL,
	@ExpTableID int = NULL;

	SELECT 
	@TemplateHtml = TemplateHtml,
	@ExperienceBasicHtml = ExperienceHtml,
	@EducationBasicHtml = EducationHtml
	FROM [RB].[TemplateDetails]
	WHERE TemplateId = @TemplateId AND IsActive = 1

	SELECT * into #tmpExp FROM [RB].[ExperienceDetails]
	WHERE UserID = @UserID 

	SELECT * into #tmpEdu FROM [RB].[EducationDetails]
	WHERE UserID = @UserID 

	SELECT @FirstName = FirstName,
	@LastName = LastName,
	@Email = Email,
	@PhoneNumber = PhoneNumber,
	@Address = Address
	FROM [RB].[PersonalDetails]
	WHERE UserID = @UserID 

	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$FirstName$>', ISNULL(@FirstName,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$LASTNAME$>', ISNULL(@LastName,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$Email$>', ISNULL(@Email,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$PhoneNumber$>', ISNULL(@PhoneNumber,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$Address$>', ISNULL(@Address,''))
	

	WHILE EXISTS (SELECT * FROM #tmpExp)
	BEGIN
		SELECT @ExpTableID = (select top 1 ExperienceDetailsID
		                   from #tmpExp
		                   order by ExperienceDetailsID asc)

		SET @ExperienceHtml =  CONCAT(@ExperienceHtml, @ExperienceBasicHtml)
		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpEmployer$>', 
		ISNULL((SELECT TOP 1 Employer FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpCity$>', 
		ISNULL((SELECT TOP 1 City FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpStartDate$>', 
		ISNULL((SELECT TOP 1 StartDate FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpEndDate$>', 
		ISNULL((SELECT TOP 1 EndDate FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpJobTitle$>', 
		ISNULL((SELECT TOP 1 JobTitle FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpJobDesc$>','')

		delete #tmpExp
		where ExperienceDetailsID = @ExpTableID

	END

	--edu---
	WHILE EXISTS (SELECT * FROM #tmpEdu)
	BEGIN
		SELECT @ExpTableID = (select top 1 EducationDetailID
		                   from #tmpEdu
		                   order by EducationDetailID asc)

		SET @EducationHtml =  CONCAT(@EducationHtml, @EducationBasicHtml)
		SET @EducationHtml = REPLACE(@EducationHtml,'<$EduSchool$>', 
		ISNULL((SELECT TOP 1 School FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		SET @EducationHtml = REPLACE(@EducationHtml,'<$EduCity$>', 
		ISNULL((SELECT TOP 1 City FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		SET @EducationHtml = REPLACE(@EducationHtml,'<$EduStartDate$>', 
		ISNULL((SELECT TOP 1 StartDate FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		SET @EducationHtml = REPLACE(@EducationHtml,'<$EduEndDate$>', 
		ISNULL((SELECT TOP 1 EndDate FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		SET @EducationHtml = REPLACE(@EducationHtml,'<$Education$>', 
		ISNULL((SELECT TOP 1 Education FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		--SET @EducationHtml = REPLACE(@EducationHtml,'<$ExpJobDesc$>','')

		delete #tmpEdu
		where EducationDetailID = @ExpTableID

	END

	--------

	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ExperienceHtml$>', ISNULL(@ExperienceHtml,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$EducationHtml$>', ISNULL(@EducationHtml,''))
	drop table #tmpExp
	SELECT @TemplateHtml
END

