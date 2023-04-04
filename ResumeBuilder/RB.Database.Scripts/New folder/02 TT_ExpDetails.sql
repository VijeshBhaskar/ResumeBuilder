USE [db_ResumeBuilder]
GO

/****** Object:  UserDefinedTableType [RB].[TT_ExpDetails]    Script Date: 31-03-2023 13:58:39 ******/
CREATE TYPE [RB].[TT_ExpDetails] AS TABLE(
	[ExperienceDetailsID] [bigint] NULL,
	[JobTitle] [varchar](1000) NULL,
	[Employer] [varchar](1000) NULL,
	[City] [varchar](1000) NULL,
	[Country] [varchar](1000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCurrentlyWorkingCompany] [bit] NULL,
	[IsActive] [bit] NULL
)
GO


