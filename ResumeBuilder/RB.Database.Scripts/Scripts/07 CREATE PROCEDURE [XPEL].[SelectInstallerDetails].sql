USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[SelectInstallerDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[SelectInstallerDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 29-10-2021
-- Created By: Developer 3
-- Description: To Select Installer Details
-- =====================================================================
CREATE PROCEDURE XPEL.SelectInstallerDetails
	@InstallerDetailsID BIGINT = NULL
AS
BEGIN
	IF(@InstallerDetailsID IS NULL OR @InstallerDetailsID = 0)
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
		WHERE InstallerDetailsID = @InstallerDetailsID AND
			IsActive = 1
	END
END
