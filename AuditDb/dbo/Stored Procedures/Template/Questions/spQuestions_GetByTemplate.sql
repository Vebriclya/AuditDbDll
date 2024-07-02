CREATE PROCEDURE [dbo].[spQuestions_GetByTemplate]
@TemplateId INT
AS
BEGIN 
    SET NOCOUNT ON;
    SELECT q.QuestionId, 
           q.SectionId, 
           q.QuestionText,
           q.QuestionInfo, 
           q.OrderInSection, 
           q.HasSelectBoxes, 
           q.IsArchived
    FROM Questions q
    INNER JOIN Sections s ON q.SectionId = s.SectionId
    WHERE TemplateId = @TemplateId
      AND IsArchived = 0
    ORDER BY s.OrderInAudit, q.OrderInSection;
end