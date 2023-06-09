USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[SelectTemplateDetailByID]    Script Date: 16-04-2023 15:42:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 11-03-2023
-- Created By: Developer
-- Description: To Select Template Details
-- =====================================================================
-- Revision : 01
-- Modified Date: 16-04-2023
-- Modified By: Developer 
-- Description: Modified Update query
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
	@JobTitle varchar(100) = NULL,
	@Summary varchar(max) = NULL,
	@ExperienceHtml nvarchar(max) = NULL,
	@ExperienceBasicHtml nvarchar(max) = NULL,
	@EducationHtml nvarchar(max) = NULL,
	@EducationBasicHtml nvarchar(max) = NULL,
	@SkillsHtml nvarchar(max) = NULL,
	@SkillsBasicHtml nvarchar(max) = NULL,
	@HobbyHtml nvarchar(max) = NULL,
	@HobbyBasicHtml nvarchar(max) = NULL,
	@LanguageHtml nvarchar(max) = NULL,
	@LanguageBasicHtml nvarchar(max) = NULL,
	@ExpTableID int = NULL;

	SELECT 
	@TemplateHtml = TemplateHtml,
	@ExperienceBasicHtml = ExperienceHtml,
	@EducationBasicHtml = EducationHtml,
	@SkillsBasicHtml = SkillsHtml,
	@HobbyBasicHtml = HobbyHtml,
	@LanguageBasicHtml = LanguageHtml
	FROM [RB].[TemplateDetails]
	WHERE TemplateId = @TemplateId AND IsActive = 1

	SELECT * into #tmpExp FROM [RB].[ExperienceDetails]
	WHERE UserID = @UserID AND IsActive = 1

	SELECT * into #tmpEdu FROM [RB].[EducationDetails]
	WHERE UserID = @UserID AND IsActive = 1

	SELECT * into #tmpSkills FROM [RB].[SkillDetails]
	WHERE UserID = @UserID AND IsActive = 1

	SELECT * into #tmpHobby FROM [RB].[HobbyDetails]
	WHERE UserID = @UserID AND IsActive = 1

	SELECT * into #tmpLang FROM [RB].[LanguageDetails]
	WHERE UserID = @UserID AND IsActive = 1

	SELECT @FirstName = FirstName,
	@LastName = LastName,
	@Email = Email,
	@PhoneNumber = PhoneNumber,
	@Address = Address,
	@JobTitle = JobTitle,
	@Summary = Summary
	FROM [RB].[PersonalDetails]
	WHERE UserID = @UserID 

	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$FIRSTNAME$>', ISNULL(@FirstName,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$LASTNAME$>', ISNULL(@LastName,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$EMAIL$>', ISNULL(@Email,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$PHONENUMBER$>', ISNULL(@PhoneNumber,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ADDRESS$>', ISNULL(@Address,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$JOBTITLE$>', ISNULL(@JobTitle,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$SUMMARY$>', ISNULL(@Summary,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ISDISPLAYEXP$>',CASE WHEN NOT EXISTS (SELECT 1 FROM #tmpExp) THEN 'display:none;' ELSE '' END)
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ISDISPLAYEDU$>',CASE WHEN NOT EXISTS (SELECT 1 FROM #tmpEdu) THEN 'display:none;' ELSE '' END)
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ISDISPLAYSKILLS$>',CASE WHEN NOT EXISTS (SELECT 1 FROM #tmpSkills) THEN 'display:none;' ELSE '' END)
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ISDISPLAYHOBBY$>',CASE WHEN NOT EXISTS (SELECT 1 FROM #tmpHobby) THEN 'display:none;' ELSE '' END)
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ISDISPLAYLANG$>',CASE WHEN NOT EXISTS (SELECT 1 FROM #tmpLang) THEN 'display:none;' ELSE '' END)

	WHILE EXISTS (SELECT * FROM #tmpExp)
	BEGIN

		DECLARE @IsCurrentlyWroking BIT = NULL;

		SELECT TOP 1 @IsCurrentlyWroking =  IsCurrentlyWorkingCompany FROM #tmpExp
		SELECT @ExpTableID = (select top 1 ExperienceDetailsID
		                   from #tmpExp
		                   order by ExperienceDetailsID asc)

		SET @ExperienceHtml =  CONCAT(@ExperienceHtml, @ExperienceBasicHtml)
		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpEmployer$>', 
		ISNULL((SELECT TOP 1 Employer FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpCity$>', 
		ISNULL((SELECT TOP 1 City FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpStartDate$>', 
		ISNULL((SELECT TOP 1 FORMAT (StartDate, 'MMM dd yyyy') AS date FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpEndDate$>', 
		CASE WHEN @IsCurrentlyWroking = 1 THEN 'Present' ELSE 
		ISNULL((SELECT TOP 1 FORMAT(EndDate, 'MMM dd yyyy') AS date FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),'')END) 

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpJobTitle$>', 
		ISNULL((SELECT TOP 1 JobTitle FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

		SET @ExperienceHtml = REPLACE(@ExperienceHtml,'<$ExpJobDesc$>',ISNULL((SELECT TOP 1 Description FROM #tmpExp WHERE ExperienceDetailsID = @ExpTableID),''))

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
		ISNULL((SELECT TOP 1 FORMAT(StartDate, 'MMM dd yyyy') AS date  FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		SET @EducationHtml = REPLACE(@EducationHtml,'<$EduEndDate$>', 
		ISNULL((SELECT TOP 1 FORMAT(EndDate, 'MMM dd yyyy') AS date FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		SET @EducationHtml = REPLACE(@EducationHtml,'<$Education$>', 
		ISNULL((SELECT TOP 1 Education FROM #tmpEdu WHERE EducationDetailID = @ExpTableID),''))

		--SET @EducationHtml = REPLACE(@EducationHtml,'<$ExpJobDesc$>','')

		delete #tmpEdu
		where EducationDetailID = @ExpTableID

	END

	--------
	--skills---
	WHILE EXISTS (SELECT * FROM #tmpSkills)
	BEGIN
		SELECT @ExpTableID = (select top 1 SkillDetailID
		                   from #tmpSkills
		                   order by SkillDetailID asc)

		SET @SkillsHtml =  CONCAT(@SkillsHtml, @SkillsBasicHtml)
		SET @SkillsHtml = REPLACE(@SkillsHtml,'<$SkillName$>', 
		ISNULL((SELECT TOP 1 SkillName FROM #tmpSkills WHERE SkillDetailID = @ExpTableID),''))

		delete #tmpSkills
		where SkillDetailID = @ExpTableID

	END

	--------
	--hobby---
	WHILE EXISTS (SELECT * FROM #tmpHobby)
	BEGIN
		SELECT @ExpTableID = (select top 1 HobbyDetailsID
		                   from #tmpHobby
		                   order by HobbyDetailsID asc)

		SET @HobbyHtml =  CONCAT(@HobbyHtml, @HobbyBasicHtml)
		SET @HobbyHtml = REPLACE(@HobbyHtml,'<$HobbyName$>', 
		ISNULL((SELECT TOP 1 HobbyName FROM #tmpHobby WHERE HobbyDetailsID = @ExpTableID),''))

		delete #tmpHobby
		where HobbyDetailsID = @ExpTableID

	END

	--------
	--language---
	WHILE EXISTS (SELECT * FROM #tmpLang)
	BEGIN
		SELECT @ExpTableID = (select top 1 LanguageDetailID
		                   from #tmpLang
		                   order by LanguageDetailID asc)

		SET @LanguageHtml =  CONCAT(@LanguageHtml, @LanguageBasicHtml)
		SET @LanguageHtml = REPLACE(@LanguageHtml,'<$LanguageName$>', 
		ISNULL((SELECT TOP 1 LanguageName FROM #tmpLang WHERE LanguageDetailID = @ExpTableID),''))

		delete #tmpLang
		where LanguageDetailID = @ExpTableID

	END

	--------

	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$ExperienceHtml$>', ISNULL(@ExperienceHtml,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$EducationHtml$>', ISNULL(@EducationHtml,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$SkillsHtml$>', ISNULL(@SkillsHtml,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$HobbyHtml$>', ISNULL(@HobbyHtml,''))
	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$LanguageHtml$>', ISNULL(@LanguageHtml,''))

	drop table #tmpExp
	drop table #tmpEdu
	drop table #tmpSkills
	drop table #tmpHobby
	drop table #tmpLang

	SELECT @TemplateHtml
END

