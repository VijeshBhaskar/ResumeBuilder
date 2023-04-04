USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_SkillDetails]    Script Date: 31-03-2023 13:59:23 ******/
CREATE TYPE [RB].[TT_SkillDetails] AS TABLE(
	[SkillDetailID] [bigint] NULL,
	[SkillName] [varchar](1000) NULL,
	[SkillRating] [int] NULL,
	[IsActive] [bit] NULL
)
GO


