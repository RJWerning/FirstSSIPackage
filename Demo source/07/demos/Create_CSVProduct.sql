USE [AdvWrk17]
GO

/****** Object:  Table [dbo].[ProductsCSV]    Script Date: 5/13/2020 7:36:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CSVProduct](
	[ProductID] [varchar](50) NULL,
	[ProductName] [varchar](100) NULL,
	[SupplierID] [varchar](50) NULL,
	[CategoryID] [varchar](50) NULL,
	[QuantityPerUnit] [varchar](50) NULL,
	[UnitPrice] [varchar](50) NULL,
	[UnitsInStock] [varchar](50) NULL,
	[UnitsOnOrder] [varchar](50) NULL,
	[ReorderLevel] [varchar](50) NULL,
	[Discontinued] [varchar](50) NULL
) ON [PRIMARY]
GO


