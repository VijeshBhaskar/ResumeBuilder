USE [db_ResumeBuilder]
GO

/****** Object:  Table [RB].[ExperienceDetails]    Script Date: 04-04-2023 20:30:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [RB].[ExperienceDetails](
	[ExperienceDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[JobTitle] [varchar](1000) NULL,
	[Employer] [varchar](1000) NULL,
	[City] [varchar](1000) NULL,
	[Country] [varchar](1000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCurrentlyWorkingCompany] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_ExperienceDetails] PRIMARY KEY CLUSTERED 
(
	[ExperienceDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [RB].[ExperienceDetails]  WITH CHECK ADD  CONSTRAINT [FK_ExperienceDetails_UserDetails] FOREIGN KEY([UserID])
REFERENCES [RB].[UserDetails] ([UserID])
GO

ALTER TABLE [RB].[ExperienceDetails] CHECK CONSTRAINT [FK_ExperienceDetails_UserDetails]
GO


