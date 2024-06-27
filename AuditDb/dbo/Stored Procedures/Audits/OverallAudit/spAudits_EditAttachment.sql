CREATE PROCEDURE [dbo].[spAudits_EditAttachment]
    @AttachmentId INT,
    @AttachmentName NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY 
        BEGIN TRANSACTION;
        UPDATE Attachments
            SET AttachmentName = @AttachmentName
            WHERE AttachmentId = @AttachmentId;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END