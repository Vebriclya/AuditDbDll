CREATE PROCEDURE [dbo].[spAudits_GetQuestionById]
    @QuestionId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT q.QuestionId, 
           q.AuditSectionId, 
           q.QuestionText, 
           q.QuestionInfo, 
           q.OrderInSection, 
           q.HasSelectBoxes, 
           q.IsArchived
    FROM AuditQuestions q
    WHERE QuestionId = @QuestionId
      AND IsArchived = 0;
END