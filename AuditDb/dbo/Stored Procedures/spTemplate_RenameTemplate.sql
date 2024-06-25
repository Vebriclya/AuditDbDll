CREATE PROCEDURE [dbo].[spTemplate_RenameTemplate]
    @TemplateId INT,
    @TemplateName NVARCHAR(50),
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Templates
        SET TemplateName = @TemplateName
        WHERE TemplateId = @TemplateId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END