CREATE PROCEDURE [dbo].[spAuditQuestions_AddAttachment]
    @QuestionId INT,
    @AttachmentName NVARCHAR(255),
    @BlobUrl NVARCHAR(500),
    @AttachmentId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        INSERT INTO Attachments (AuditId, SectionId, QuestionId, AttachmentName, BlobUrl, IsArchived)
        VALUES (NULL, NULL, @QuestionId, @AttachmentName, @BlobUrl, 0);

        SET @AttachmentId = SCOPE_IDENTITY();
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END