USE [db_ResumeBuilder]
GO

IF (OBJECT_ID('[RB].[SelectTemplateDetailByID]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [RB].[SelectTemplateDetailByID];
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
CREATE PROCEDURE RB.SelectTemplateDetailByID
	@TemplateId INT = NULL
AS
BEGIN
	
	Declare @TemplateHtml nvarchar(max) = NULL;
	SELECT 
	@TemplateHtml = TemplateHtml
	FROM [RB].[TemplateDetails]
	WHERE TemplateId = @TemplateId AND IsActive = 1

	SET @TemplateHtml = REPLACE(@TemplateHtml,'<$FirstName$>', 'Vijesh')
	SELECT @TemplateHtml

END

