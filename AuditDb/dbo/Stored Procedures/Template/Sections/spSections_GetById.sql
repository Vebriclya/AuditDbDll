CREATE PROCEDURE [dbo].[spSections_GetById]
    @SectionId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT TemplateId,
           Title,
           OrderInAudit,
           HasQuestions,
           IsArchived
    FROM Sections
    WHERE SectionId = @SectionId
      AND IsArchived = 0;
END