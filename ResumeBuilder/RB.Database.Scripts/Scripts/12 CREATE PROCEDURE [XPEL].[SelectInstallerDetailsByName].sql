USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[SelectInstallerDetailsByName]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[SelectInstallerDetailsByName];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================
-- Created Date: 14-11-2021
-- Created By: Developer 3
-- Description: To Select Installer Details By Name
-- =====================================================================
CREATE PROCEDURE XPEL.SelectInstallerDetailsByName
	@InstallerName VARCHAR(500)
AS
BEGIN
	IF(@InstallerName = '%*%')
	BEGIN
		SELECT
			InstallerDetailsID,
			InstallerName,
			[MobileNumber1],
			[MobileNumber2],
			[Email],
			[Address],
			CreatedDate,
			ModifiedDate
		FROM XPEL.InstallerDetails
		WHERE IsActive = 1
		ORDER BY InstallerName
	END
	ELSE
	BEGIN
		SELECT
			InstallerDetailsID,
			InstallerName,
			[MobileNumber1],
			[MobileNumber2],
			[Email],
			[Address],
			CreatedDate,
			ModifiedDate
		FROM XPEL.InstallerDetails
		WHERE InstallerName LIKE @InstallerName
			AND IsActive = 1
		ORDER BY InstallerName
	END
END
