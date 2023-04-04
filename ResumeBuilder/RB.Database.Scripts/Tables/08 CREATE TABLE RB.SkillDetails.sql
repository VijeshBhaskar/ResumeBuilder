USE [db_ResumeBuilder]
GO

/****** Object:  Table [RB].[SkillDetails]    Script Date: 04-04-2023 20:31:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [RB].[SkillDetails](
	[SkillDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[SkillName] [varchar](1000) NULL,
	[SkillRating] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SkillDetails] PRIMARY KEY CLUSTERED 
(
	[SkillDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RB].[SkillDetails]  WITH CHECK ADD  CONSTRAINT [FK_SkillDetails_UserDetails] FOREIGN KEY([UserID])
REFERENCES [RB].[UserDetails] ([UserID])
GO

ALTER TABLE [RB].[SkillDetails] CHECK CONSTRAINT [FK_SkillDetails_UserDetails]
GO


