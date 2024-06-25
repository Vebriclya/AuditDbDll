CREATE PROCEDURE [dbo].[spTemplates_Rename]
    @TemplateId INT,
    @TemplateName NVARCHAR(50)
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