USE [db_ResumeBuilder]
GO

/****** Object:  Table [RB].[HobbyDetails]    Script Date: 04-04-2023 20:31:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [RB].[HobbyDetails](
	[HobbyDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[HobbyName] [varchar](1000) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_HobbyDetails] PRIMARY KEY CLUSTERED 
(
	[HobbyDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RB].[HobbyDetails]  WITH CHECK ADD  CONSTRAINT [FK_HobbyDetails_UserDetails] FOREIGN KEY([UserID])
REFERENCES [RB].[UserDetails] ([UserID])
GO

ALTER TABLE [RB].[HobbyDetails] CHECK CONSTRAINT [FK_HobbyDetails_UserDetails]
GO


