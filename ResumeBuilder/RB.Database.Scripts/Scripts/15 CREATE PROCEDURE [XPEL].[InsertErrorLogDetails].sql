USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[InsertErrorLogDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[InsertErrorLogDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 02-04-2022
-- Created By: Developer 3
-- Description: To Select Product Names
-- =====================================================================
CREATE PROCEDURE [XPEL].[InsertErrorLogDetails]
	@CustomMessage NVARCHAR(MAX) = NULL,
	@ErrorMessage NVARCHAR(MAX) = NULL,
	@StackTrace NVARCHAR(MAX) = NULL,
	@CreatedDate DATETIME
AS
BEGIN
	INSERT INTO XPEL.ErrorLogs
		(CustomMessage,
		ErrorMessage,
		StackTrace,
		CreatedDate)
	VALUES
		(@CustomMessage,
		@ErrorMessage,
		@StackTrace,
		@CreatedDate)
END
