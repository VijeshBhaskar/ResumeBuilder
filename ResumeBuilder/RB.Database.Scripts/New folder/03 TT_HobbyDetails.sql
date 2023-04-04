USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_HobbyDetails]    Script Date: 31-03-2023 13:58:52 ******/
CREATE TYPE [RB].[TT_HobbyDetails] AS TABLE(
	[HobbyDetailsID] [bigint] NULL,
	[HobbyName] [varchar](1000) NULL,
	[IsActive] [bit] NULL
)
GO


