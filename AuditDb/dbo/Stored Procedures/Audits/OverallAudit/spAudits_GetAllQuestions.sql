CREATE PROCEDURE [dbo].[spAudits_GetAllQuestions]
    @AuditId INT
AS 
BEGIN 
    SET NOCOUNT ON
    
    SELECT q.QuestionId, 
           q.AuditSectionId, 
           q.QuestionText, 
           q.QuestionInfo, 
           q.OrderInSection, 
           q.HasSelectBoxes, 
           q.IsArchived
    FROM AuditQuestions q
    INNER JOIN AuditSections s on q.AuditSectionId = s.SectionId
    WHERE s.AuditId = @AuditId
      AND s.IsArchived = 0
END
            