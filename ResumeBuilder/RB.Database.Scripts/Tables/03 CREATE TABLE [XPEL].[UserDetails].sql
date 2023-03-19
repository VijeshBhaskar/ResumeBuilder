USE [db_XPEL]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [XPEL].[UserDetails](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](500) NOT NULL,
	[Address] [varchar](1000) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[VIN] [varchar](500) NOT NULL,
	[RegistrationNumber] [varchar](500) NOT NULL,
	[InstallerID] [bigint] NOT NULL,
	[RoleID1] [bigint] NOT NULL,
	[Warranty1] [int] NOT NULL,
	[ConsumedQuantity1] [decimal](18, 2) NOT NULL,
	[RoleID2] [bigint] NOT NULL,
	[Warranty2] [int] NOT NULL,
	[ConsumedQuantity2] [decimal](18, 2) NOT NULL,
	[IsExpired] [bit],
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [XPEL].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_InstallerDetails] FOREIGN KEY([InstallerID])
REFERENCES [XPEL].[InstallerDetails] ([InstallerDetailsID])
GO

ALTER TABLE [XPEL].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_InstallerDetails]
GO
