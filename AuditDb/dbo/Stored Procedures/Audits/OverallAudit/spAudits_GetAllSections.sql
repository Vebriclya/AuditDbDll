CREATE PROCEDURE [dbo].[spAudits_GetAllSections]
    @AuditId INT
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
    WHERE AuditId = @AuditId
      AND IsArchived = 0
    ORDER BY OrderInAudit;
    
END