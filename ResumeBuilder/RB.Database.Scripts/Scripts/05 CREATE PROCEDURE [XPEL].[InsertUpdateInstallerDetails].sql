USE [db_XPEL]
GO

IF (OBJECT_ID('[XPEL].[InsertUpdateInstallerDetails]', 'P') IS NOT NULL) 
BEGIN
  DROP PROCEDURE [XPEL].[InsertUpdateInstallerDetails];
END;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Created Date: 29-10-2021
-- Created By: Developer 3
-- Description: To Insert and Update Installer Details
-- =====================================================================
CREATE PROCEDURE XPEL.InsertUpdateInstallerDetails
	@InstallerDetailsID BIGINT = NULL,
	@InstallerName VARCHAR(500),
	@Address VARCHAR(500) = NULL,
	@Email VARCHAR(50) = NULL,
	@MobileNumber1 VARCHAR(50) = NULL,
	@MobileNumber2 VARCHAR(50) = NULL,
	@CreatedDate DATETIME = NULL,
	@ModifiedDate DATETIME = NULL,
	@IsActive BIT = 0
AS
BEGIN
	
	IF(@InstallerDetailsID IS NULL OR @InstallerDetailsID = 0)
	BEGIN
		IF EXISTS(SELECT 1 FROM  XPEL.InstallerDetails WHERE InstallerName= @InstallerName )
			BEGIN
				SELECT -2
			END
		ELSE
			BEGIN
					INSERT INTO XPEL.InstallerDetails
							([InstallerName],
							[Email],
							[MobileNumber1],
							[MobileNumber2],
							[Address],
							[IsActive],
							[CreatedDate],
							[ModifiedDate])
						OUTPUT inserted.InstallerDetailsID
						VALUES
							(@InstallerName,
							@Email,
							@MobileNumber1,
							@MobileNumber2,
							@Address,
							@IsActive,
							@CreatedDate,
							@ModifiedDate)
		  END
	END
	ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM  XPEL.InstallerDetails WHERE InstallerName= @InstallerName  AND InstallerDetailsID!=@InstallerDetailsID)
				BEGIN
					SELECT -2
				END
			ELSE
				BEGIN
						UPDATE XPEL.InstallerDetails
							SET [InstallerName] = @InstallerName,
								[Email] = @Email,
								[MobileNumber1] = @MobileNumber1,
								[MobileNumber2] = @MobileNumber2,
								[Address] = @Address,
								[ModifiedDate] = @ModifiedDate
							OUTPUT inserted.InstallerDetailsID
							WHERE InstallerDetailsID = @InstallerDetailsID
				END

		END
END
