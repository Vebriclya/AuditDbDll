CREATE PROCEDURE [dbo].[spAudits_GetSectionById]
    @SectionId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT a.SectionId, 
           a.AuditId, 
           a.Title, 
           a.OrderInAudit, 
           a.HasQuestions, 
           a.IsArchived
    FROM AuditSections a
    WHERE a.SectionId = @SectionId
    AND a.IsArchived = 0;
END