USE [db_XPEL]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [XPEL].[ProductDetails](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleID] [bigint] NOT NULL,
	[ProductNameID] [bigint] NOT NULL,
	[BatchNumber] [varchar](500) NOT NULL,
	[MaterialQuantity] [decimal](18, 2) NOT NULL,
	[AvailableMaterialQuantity] [decimal](18, 2) NOT NULL,
	[InstallerID] [bigint] NOT NULL,
	[Warranty] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_XPEL.ProductDetails] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [XPEL].[ProductDetails] ADD  CONSTRAINT [DF_ProductDetails_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
