CREATE PROCEDURE [dbo].[spAudits_GetAllAudits]
AS 
BEGIN 
    SET NOCOUNT ON;
    
    SELECT a.AuditId,
           a.TemplateId,
           a.AuditDate,
           a.AuditType,
           a.IsCompleted,
           a.IsArchived
    FROM Audits a
    WHERE a.IsArchived = 0
    ORDER BY a.AuditDate DESC;
END