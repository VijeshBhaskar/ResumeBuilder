USE [db_XPEL]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [XPEL].[InstallerDetails](
	[InstallerDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[InstallerName] [varchar](500) NOT NULL,
	[Address] [varchar](500) NULL,
	[Email] VARCHAR(50) NULL,
	[MobileNumber1] VARCHAR(50) NOT NULL,
	[MobileNumber2] VARCHAR(50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_InstallerDetails] PRIMARY KEY CLUSTERED 
(
	[InstallerDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [XPEL].[InstallerDetails] ADD  CONSTRAINT [DF_InstallerDetails_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO


