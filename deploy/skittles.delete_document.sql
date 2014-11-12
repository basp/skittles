USE [sandbox]
GO

/****** Object:  StoredProcedure [skittles].[delete_document]    Script Date: 12-11-2014 16:37:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [skittles].[delete_document]
	@id UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [skittles].[documents]
	WHERE [id] = @id
END

GO

