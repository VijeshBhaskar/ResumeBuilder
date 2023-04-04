USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_LangDetails]    Script Date: 04-04-2023 20:41:19 ******/
CREATE TYPE [RB].[TT_LangDetails] AS TABLE(
	[LanguageDetailID] [bigint] NULL,
	[LanguageName] [varchar](1000) NULL,
	[IsActive] [bit] NULL
)
GO


