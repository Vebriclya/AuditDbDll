CREATE PROCEDURE [dbo].[spAudits_GetSectionById]
    @SectionId INT
AS
BEGIN
    SELECT a.SectionId, 
           a.AuditId, 
           a.Title, 
           a.OrderInAudit, 
           a.HasQuestions, 
           a.IsArchived
    FROM AuditSections a
    WHERE a.SectionId = @SectionId
END