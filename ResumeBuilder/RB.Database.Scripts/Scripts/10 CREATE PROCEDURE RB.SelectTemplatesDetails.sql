USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[SelectTemplatesDetails]    Script Date: 19-03-2023 15:56:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 11-03-2023
-- Created By: Developer
-- Description: To Select Template Details
-- =====================================================================
ALTER PROCEDURE [RB].[SelectTemplatesDetails]
AS
BEGIN
	
	SELECT 
		TemplateId,
		TemplateName,
		TemplateImgPath
	FROM [RB].[TemplateDetails]
	WHERE IsActive = 1

END

