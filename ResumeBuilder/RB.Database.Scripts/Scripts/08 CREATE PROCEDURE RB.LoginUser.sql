USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[LoginUser]    Script Date: 19-03-2023 15:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 15-11-2021
-- Created By: Developer 3
-- Description: To Login User
-- =====================================================================
ALTER PROCEDURE [RB].[LoginUser]
	@Email VARCHAR(100),
	@Password nvarchar(max) = NULL
AS
BEGIN
	SELECT
		UserID,
		Email,
		[Password],
		CreatedDate,
		ModifiedDate
	FROM RB.UserDetails
	WHERE Email = @Email
		AND [Password] = @Password AND IsActive = 1
END
