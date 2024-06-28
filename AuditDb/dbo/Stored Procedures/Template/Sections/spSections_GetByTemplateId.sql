CREATE PROCEDURE [dbo].[spSections_GetByTemplateId]
    @TemplateId INT
AS
BEGIN 
    SET NOCOUNT ON;
    SELECT s.SectionId, 
           s.TemplateId, 
           s.Title, 
           s.OrderInAudit, 
           s.HasQuestions, 
           s.IsArchived
    FROM Sections s
    WHERE s.TemplateId = @TemplateId
    AND IsArchived = 0
    ORDER BY s.OrderInAudit;
END
    