CREATE PROCEDURE [dbo].[spAudits_GetQuestionAttachments]
    @QuestionId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT AttachmentId, 
           AuditId, 
           QuestionId, 
           SectionId, 
           AttachmentName, 
           BlobUrl, 
           IsArchived
    FROM Attachments
    WHERE QuestionId = @QuestionId
      AND IsArchived = 0;
end