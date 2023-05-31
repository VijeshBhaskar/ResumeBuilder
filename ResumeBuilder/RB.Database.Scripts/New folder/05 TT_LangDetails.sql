USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_LangDetails]    Script Date: 31-05-2023 21:19:56 ******/
CREATE TYPE [RB].[TT_LangDetails] AS TABLE(
	[LanguageDetailID] [bigint] NULL,
	[LanguageName] [varchar](1000) NULL,
	[IsActive] [bit] NULL
)
GO


