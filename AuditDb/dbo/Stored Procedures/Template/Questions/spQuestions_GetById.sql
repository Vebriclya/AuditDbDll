CREATE PROCEDURE [dbo].[spQuestions_GetById]
    @QuestionId INT
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
    WHERE q.QuestionId = @QuestionId
    AND q.IsArchived = 0;
END