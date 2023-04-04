USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_LangDetails]    Script Date: 31-03-2023 13:59:05 ******/
CREATE TYPE [RB].[TT_LangDetails] AS TABLE(
	[LanguageDetailID] [bigint] NULL,
	[LanguageName] [varchar](1000) NULL,
	[IsActive] [bit] NULL
)
GO


