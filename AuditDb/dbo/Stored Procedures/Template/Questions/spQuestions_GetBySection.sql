CREATE PROCEDURE [dbo].[spQuestions_GetBySectionId]
    @SectionId INT
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
        WHERE q.SectionId = @SectionId
        AND q.IsArchived = 0
        ORDER BY q.OrderInSection;
    END