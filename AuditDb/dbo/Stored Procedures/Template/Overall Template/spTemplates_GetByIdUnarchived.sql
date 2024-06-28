CREATE PROCEDURE [dbo].[spTemplates_GetByIdUnarchived]
    @TemplateId INT
AS
BEGIN 
    SET NOCOUNT ON;
    
    SELECT
        t.TemplateId,
        t.TemplateName,
        t.IsArchived
    FROM 
        Templates t
    WHERE t.TemplateId = @TemplateId
      AND t.IsArchived = 0

    SELECT
        s.SectionId,
        s.TemplateId,
        s.Title,
        s.OrderInAudit,
        s.HasQuestions,
        s.IsArchived
    FROM 
        Sections s
    WHERE s.TemplateId = @TemplateId
      AND s.IsArchived = 0
    ORDER BY s.OrderInAudit;
    
    SELECT
        q.QuestionId,
        q.SectionId, 
        q.QuestionText,
        q.QuestionInfo,
        q.OrderInSection,
        q.HasSelectBoxes,
        q.IsArchived
    FROM
         Questions q
    INNER JOIN
             Sections s on q.SectionId = s.SectionId
    WHERE 
        s.TemplateId = @TemplateId
      AND s.IsArchived = 0
    ORDER BY
        s.OrderInAudit,
        q.OrderInSection;

END
    