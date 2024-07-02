CREATE PROCEDURE [dbo].[spTemplates_GetAll]
AS 
BEGIN 
    SET NOCOUNT ON;
    
    SELECT t.TemplateId,
           t.TemplateName,
           t.IsArchived
    FROM Templates t
    WHERE t.IsArchived = 0
    ORDER BY t.TemplateName;
END