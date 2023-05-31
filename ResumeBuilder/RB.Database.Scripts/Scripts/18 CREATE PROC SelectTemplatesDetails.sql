
-- =====================================================================
-- Created Date: 11-03-2023
-- Created By: Developer
-- Description: To Select Template Details
-- =====================================================================
CREATE OR ALTER PROCEDURE [RB].[SelectTemplatesDetails]
AS
BEGIN
	
	SELECT 
		TemplateId,
		TemplateName,
		TemplateImgPath
	FROM [RB].[TemplateDetails]
	WHERE IsActive = 1

END

