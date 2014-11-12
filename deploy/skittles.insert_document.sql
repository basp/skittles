USE [sandbox]
GO

/****** Object:  StoredProcedure [skittles].[insert_document]    Script Date: 12-11-2014 16:37:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [skittles].[insert_document]
	@data XML
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [skittles].[documents] ([id], [data], [etag], [created])
	VALUES (NEWID(), @data, NEWID(), GETUTCDATE())
END

GO

