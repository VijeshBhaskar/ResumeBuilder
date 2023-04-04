USE [db_ResumeBuilder]
GO

/****** Object:  Table [RB].[LanguageDetails]    Script Date: 04-04-2023 20:31:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [RB].[LanguageDetails](
	[LanguageDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[LanguageName] [varchar](1000) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_LanguageDetails] PRIMARY KEY CLUSTERED 
(
	[LanguageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RB].[LanguageDetails]  WITH CHECK ADD  CONSTRAINT [FK_LanguageDetails_UserDetails] FOREIGN KEY([UserID])
REFERENCES [RB].[UserDetails] ([UserID])
GO

ALTER TABLE [RB].[LanguageDetails] CHECK CONSTRAINT [FK_LanguageDetails_UserDetails]
GO


