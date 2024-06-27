CREATE PROCEDURE [dbo].[spAudits_AddAttachment]
    @AuditId INT,
    @AttachmentName NVARCHAR(255),
    @BlobUrl NVARCHAR(500),
    @AttachmentId INT OUTPUT
AS
    BEGIN 
        SET NOCOUNT ON;
        
        BEGIN TRY 
            BEGIN TRANSACTION;
            INSERT INTO Attachments (AuditId, SectionId, QuestionId, AttachmentName, BlobUrl, IsArchived)
            VALUES (@AuditId, NULL, NULL, @AttachmentName, @BlobUrl, 0);
            
            COMMIT TRANSACTION;
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION;
            THROW;
        END CATCH;
END