USE [db_ResumeBuilder]
GO
/****** Object:  StoredProcedure [RB].[InsertUserDetails]    Script Date: 19-03-2023 15:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 11-03-2023
-- Created By: Developer
-- Description: To Insert User Details
-- =====================================================================
ALTER PROCEDURE [RB].[InsertUserDetails]
	@Email VARCHAR(100) = NULL,
	@Password nvarchar(max) = NULL
AS
BEGIN
	
	INSERT INTO RB.UserDetails
	(
		[Email],
		[Password],
		[IsActive],
		[CreatedDate]
	)
	VALUES
	(
		@Email,
		@Password,
		1,
		GETDATE()
	)
END
