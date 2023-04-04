USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_EducationDetails]    Script Date: 31-03-2023 13:58:09 ******/
CREATE TYPE [RB].[TT_EducationDetails] AS TABLE(
	[EducationDetailID] [bigint] NULL,
	[Education] [varchar](1000) NULL,
	[School] [varchar](1000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[City] [varchar](1000) NULL,
	[IsActive] [bit] NULL
)
GO


