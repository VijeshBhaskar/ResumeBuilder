USE [db_ResumeBuilder]
GO

/****** Object:  Table [RB].[TemplateDetails]    Script Date: 19-03-2023 15:51:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [RB].[TemplateDetails](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](100) NULL,
	[TemplateHtml] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[TemplateImgPath] [varchar](max) NULL,
	[ExperienceHtml] [nvarchar](max) NULL,
	[EducationHtml] [nvarchar](max) NULL,
	[SkillsHtml] [nvarchar](max) NULL,
 CONSTRAINT [PK_TemplateDetails] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


