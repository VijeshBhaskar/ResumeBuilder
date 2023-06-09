

-- =====================================================================
-- Created Date: 15-11-2021
-- Created By: Developer 3
-- Description: To Login User
-- =====================================================================
CREATE OR ALTER PROCEDURE [RB].[LoginUser]
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
