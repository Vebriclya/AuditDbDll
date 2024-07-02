﻿CREATE PROCEDURE [dbo].[spAudits_GetAllCompleteAudits]
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
    AND a.IsCompleted = 1
    ORDER BY a.AuditDate DESC;
END