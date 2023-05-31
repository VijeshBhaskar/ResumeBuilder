
CREATE TYPE [RB].[TT_ExpDetails] AS TABLE(
	[ExperienceDetailsID] [bigint] NULL,
	[JobTitle] [varchar](1000) NULL,
	[Employer] [varchar](1000) NULL,
	[City] [varchar](1000) NULL,
	[Country] [varchar](1000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCurrentlyWorkingCompany] [bit] NULL,
	[Description] [varchar](max) NULL,
	[IsActive] [bit] NULL
)
GO


