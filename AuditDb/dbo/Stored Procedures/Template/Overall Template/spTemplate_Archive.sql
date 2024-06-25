CREATE PROCEDURE [dbo].[spTemplate_Archive]
    @TemplateId INT
AS
BEGIN
   SET NOCOUNT ON;
   
   BEGIN TRY
       BEGIN TRANSACTION;
       UPDATE Templates
       SET IsArchived = 1
       WHERE TemplateId = @TemplateId;
       COMMIT TRANSACTION;
    END TRY
   BEGIN CATCH
       ROLLBACK TRANSACTION;
       THROW;
   END CATCH
END