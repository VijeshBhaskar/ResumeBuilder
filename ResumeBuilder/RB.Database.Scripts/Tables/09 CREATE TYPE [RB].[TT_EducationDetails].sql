USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_EducationDetails]    Script Date: 04-04-2023 20:39:59 ******/
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


