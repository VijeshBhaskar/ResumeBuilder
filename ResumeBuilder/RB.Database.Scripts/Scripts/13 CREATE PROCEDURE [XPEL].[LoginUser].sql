USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[LoginUser]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[LoginUser];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 15-11-2021
-- Created By: Developer 3
-- Description: To Login User
-- =====================================================================
CREATE PROCEDURE XPEL.LoginUser
	@Email VARCHAR(100)
AS
BEGIN
	SELECT
		UserID,
		Email,
		[Password],
		CreatedDate,
		ModifiedDate
	FROM XPEL.AdminDetails
	WHERE Email = @Email
		AND IsActive = 1
END
