USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[DeleteInstallerDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[DeleteInstallerDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 29-10-2021
-- Created By: Developer 3
-- Description: To Delete Installer Details
-- =====================================================================
CREATE PROCEDURE [XPEL].[DeleteInstallerDetails]
	@InstallerDetailsID BIGINT
AS
BEGIN
	UPDATE XPEL.InstallerDetails
	SET [IsActive] = 0
	WHERE InstallerDetailsID = @InstallerDetailsID
END
GO