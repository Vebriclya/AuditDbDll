CREATE PROCEDURE [dbo].[spAudits_GetById]
    @AuditId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Get Audit details
    SELECT a.AuditId,
           a.TemplateId,
           a.AuditDate,
           a.AuditType,
           a.IsCompleted,
           a.IsArchived
    FROM
        Audits a
    WHERE a.AuditId = @AuditId
      AND a.IsArchived = 0
    
    -- Get Audit Sections
    SELECT
        s.SectionId,
        s.AuditId,
        s.Title,
        s.OrderInAudit,
        s.HasQuestions,
        s.IsArchived
    FROM
        AuditSections s
    WHERE s.AuditId = @AuditId
      AND s.IsArchived = 0
    ORDER BY s.OrderInAudit;
    
    -- Get Audit Questions
    SELECT
        q.QuestionId,
        q.AuditSectionId,
        q.QuestionText,
        q.QuestionInfo,
        q.OrderInSection,
        q.HasSelectBoxes,
        q.IsArchived
    FROM
        AuditQuestions q
            INNER JOIN
        AuditSections s on q.AuditSectionId = s.SectionId
    WHERE s.AuditId = @AuditId 
      AND s.IsArchived = 0
      AND q.IsArchived = 0
    ORDER BY
        s.OrderInAudit,
        q.OrderInSection;
    
    -- Get Section Responses
    SELECT r.ResponseId,
           r.AuditId,
           r.SectionId,
           r.QuestionId,
           r.Score,
           r.ResponseText,
           r.IsArchived
    FROM Responses r
    WHERE r.AuditId = @AuditId
      AND r.SectionId IS NOT NULL
      AND r.QuestionId IS NULL
      AND r.IsArchived = 0;
    
    -- Get Question Responses
    SELECT r.ResponseId, 
           r.AuditId, 
           r.SectionId,
           r.QuestionId,
           r.Score,
           r.ResponseText,
           r.IsArchived
    FROM Responses r
    WHERE r.AuditId = @AuditId
      AND r.QuestionId IS NOT NULL
      AND r.IsArchived = 0;
    
    -- Get Audit Attachments
    SELECT att.AttachmentId, 
           att.AuditId,
           att.SectionId,
           att.QuestionId,
           att.AttachmentName, 
           att.BlobUrl, 
           att.IsArchived
    FROM Attachments att
    WHERE att.AuditId = @AuditId
      AND att.IsArchived = 0;
    
    -- Get Section Attachments
    SELECT att.AttachmentId,
           att.AuditId,
           att.SectionId,
           att.QuestionId,
           att.AttachmentName,
           att.BlobUrl,
           att.IsArchived
    FROM Attachments att
    WHERE att.SectionId IN (SELECT SectionId FROM AuditSections WHERE AuditId = @AuditId)
      AND att.IsArchived = 0;
    
    -- Get Question Attachments
    SELECT att.AttachmentId,
           att.AuditId,
           att.SectionId,
           att.QuestionId,
           att.AttachmentName,
           att.BlobUrl,
           att.IsArchived
    FROM Attachments att
    WHERE att.QuestionId IN (SELECT QuestionId FROM AuditQuestions WHERE AuditSectionId IN (SELECT SectionId FROM AuditSections WHERE AuditId = @AuditId))
      AND att.IsArchived = 0;

END
    
    