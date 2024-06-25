CREATE PROCEDURE [dbo].[spTemplate_ArchiveTemplate]
	@TemplateId INT
AS
BEGIN
	UPDATE Templates
	SET IsArchived = 1
	WHERE TemplateId = @TemplateId
END
