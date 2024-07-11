CREATE PROCEDURE [dbo].[spAudits_GetAttachments]
    @AuditId INT
AS
BEGIN 
    SET NOCOUNT ON;
    SELECT att.AttachmentId, 
           att.AuditId, 
           att.QuestionId, 
           att.SectionId, 
           att.AttachmentName, 
           att.BlobUrl, 
           att.IsArchived
    FROM Attachments att
    WHERE att.IsArchived = 0
    AND (att.AuditId = @AuditId
        OR att.SectionId IN (SELECT asec.SectionId
                             FROM AuditSections asec
                             WHERE asec.AuditId = @AuditId)
       OR att.QuestionId IN (SELECT aq.QuestionId
                             FROM AuditQuestions aq
                             JOIN AuditSections asec ON aq.AuditSectionId = asec.SectionId
                             WHERE asec.AuditId = @AuditId))
END
