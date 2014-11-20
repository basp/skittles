USE [sandbox]
GO

/****** Object:  Table [skittles].[documents]    Script Date: 20-11-2014 16:50:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [skittles].[documents](
	[id] [nvarchar](128) NOT NULL,
	[data] [xml] NOT NULL,
	[etag] [nvarchar](128) NOT NULL,
	[created] [datetime2](7) NOT NULL,
	[updated] [datetime2](7) NULL,
	[id_cs] [int] NOT NULL,
 CONSTRAINT [PK_documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

