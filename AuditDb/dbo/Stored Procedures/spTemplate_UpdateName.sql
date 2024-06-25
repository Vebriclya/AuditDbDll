CREATE PROCEDURE [dbo].[spTemplate_UpdateName]
	@TemplateId INT,
	@TemplateName NVARCHAR(50)
AS
BEGIN
	UPDATE Templates
	SET TemplateName = @TemplateName
	WHERE TemplateId = @TemplateId
END
