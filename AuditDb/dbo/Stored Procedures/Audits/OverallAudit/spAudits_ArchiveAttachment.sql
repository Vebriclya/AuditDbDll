CREATE PROCEDURE [dbo].[spAudits_ArchiveAttachment]
    @AttachmentId INT
AS
BEGIN 
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        UPDATE Attachments
            SET IsArchived = 1
            WHERE AttachmentId = @AttachmentId;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END