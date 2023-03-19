USE [db_ResumeBuilder]
GO

/****** Object:  Table [RB].[EducationDetails]    Script Date: 19-03-2023 15:52:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [RB].[EducationDetails](
	[EducationDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[Education] [varchar](1000) NULL,
	[School] [varchar](1000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[City] [varchar](1000) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_EducationDetails] PRIMARY KEY CLUSTERED 
(
	[EducationDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RB].[EducationDetails]  WITH CHECK ADD  CONSTRAINT [FK_EducationDetails_UserDetails] FOREIGN KEY([UserID])
REFERENCES [RB].[UserDetails] ([UserID])
GO

ALTER TABLE [RB].[EducationDetails] CHECK CONSTRAINT [FK_EducationDetails_UserDetails]
GO


