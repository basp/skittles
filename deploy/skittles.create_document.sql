USE [sandbox]
GO

/****** Object:  StoredProcedure [skittles].[create_document]    Script Date: 20-11-2014 16:49:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [skittles].[create_document]
	@id NVARCHAR(128),
	@etag NVARCHAR(128),
	@data XML
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @id_cs INT
	SET @id_cs = CHECKSUM(@id)

	IF EXISTS(
		SELECT * FROM [skittles].[documents] 
		WHERE [id_cs] = @id_cs AND [id] = @id)
	BEGIN
		UPDATE [skittles].[documents]
		SET 
			[data] = @data, 
			[etag] = @etag,
			[created] = GETUTCDATE(),
			[updated] = NULL
		WHERE [id] = @id
	END
	ELSE
	BEGIN
		INSERT INTO [skittles].[documents] ([id], [data], [etag], [created], [id_cs])
		VALUES (@id, @data, @etag, GETUTCDATE(), @id_cs)
	END
END

GO

