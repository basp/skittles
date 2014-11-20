USE [sandbox]
GO

/****** Object:  UserDefinedFunction [skittles].[get_document]    Script Date: 20-11-2014 16:49:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [skittles].[get_document]
(
	@id NVARCHAR(128)
)
RETURNS 
@documents TABLE 
(
	[id] NVARCHAR(128),
	[etag] NVARCHAR(128),
	[data] XML
)
AS
BEGIN
	DECLARE @id_cs INT
	SET @id_cs = CHECKSUM(@id)

	INSERT INTO @documents
	SELECT [id], [etag], [data]
	FROM [skittles].[documents]
	WHERE [id_cs] = @id_cs
	AND [id] = @id
	
	RETURN 
END

GO

