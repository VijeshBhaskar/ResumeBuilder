USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_HobbyDetails]    Script Date: 04-04-2023 20:40:56 ******/
CREATE TYPE [RB].[TT_HobbyDetails] AS TABLE(
	[HobbyDetailsID] [bigint] NULL,
	[HobbyName] [varchar](1000) NULL,
	[IsActive] [bit] NULL
)
GO


