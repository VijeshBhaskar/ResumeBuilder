USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_SkillDetails]    Script Date: 04-04-2023 20:41:36 ******/
CREATE TYPE [RB].[TT_SkillDetails] AS TABLE(
	[SkillDetailID] [bigint] NULL,
	[SkillName] [varchar](1000) NULL,
	[SkillRating] [int] NULL,
	[IsActive] [bit] NULL
)
GO


