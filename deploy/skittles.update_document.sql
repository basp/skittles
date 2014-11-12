USE [sandbox]
GO

/****** Object:  StoredProcedure [skittles].[update_document]    Script Date: 12-11-2014 16:37:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [skittles].[update_document]
	@id UNIQUEIDENTIFIER,
	@data XML
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [skittles].[documents]
	SET 
		[data] = @data, 
		[etag] = NEWID(),
		[updated] = GETUTCDATE()
	WHERE [id] = @id
END

GO

