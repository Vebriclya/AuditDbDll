CREATE PROCEDURE [dbo].[spAudits_GetSectionAttachments]
@SectionId INT
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
    WHERE SectionId = @SectionId
      AND IsArchived = 0;
END