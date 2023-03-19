USE [db_ResumeBuilder]
GO

IF (OBJECT_ID('[RB].[SelectTemplatesDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [RB].[SelectTemplatesDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 11-03-2023
-- Created By: Developer
-- Description: To Select Template Details
-- =====================================================================
CREATE PROCEDURE RB.SelectTemplatesDetails
AS
BEGIN
	
	SELECT 
		TemplateId,
		TemplateName,
		TemplateImgPath
	FROM [RB].[TemplateDetails]
	WHERE IsActive = 1

END

update  [RB].[TemplateDetails] set  TemplateImgPath='/dist/img/Templates/Resume1.png'