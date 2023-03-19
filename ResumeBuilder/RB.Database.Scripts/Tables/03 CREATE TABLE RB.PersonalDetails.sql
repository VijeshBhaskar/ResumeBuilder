USE [db_ResumeBuilder]
GO

/****** Object:  Table [RB].[PersonalDetails]    Script Date: 19-03-2023 15:51:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [RB].[PersonalDetails](
	[PersonalDetailD] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[FirstName] [varchar](500) NULL,
	[LastName] [varchar](500) NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Address] [varchar](1000) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_PersonalDetails] PRIMARY KEY CLUSTERED 
(
	[PersonalDetailD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RB].[PersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetails_UserDetails] FOREIGN KEY([UserID])
REFERENCES [RB].[UserDetails] ([UserID])
GO

ALTER TABLE [RB].[PersonalDetails] CHECK CONSTRAINT [FK_PersonalDetails_UserDetails]
GO


