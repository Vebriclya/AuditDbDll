CREATE PROCEDURE [dbo].[spTemplates_Clone]
    @ExistingTemplateId INT,
    @NewTemplateName NVARCHAR(50),
    @NewTemplateId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY 
        BEGIN TRANSACTION;
        
        INSERT INTO Templates (TemplateName, IsArchived)
        VALUES (@NewTemplateName, 0);
        
        SET @NewTemplateId = SCOPE_IDENTITY();
        
        INSERT INTO Sections (TemplateId, Title, OrderInAudit, HasQuestions, IsArchived)
        SELECT @NewTemplateId, Title, OrderInAudit, HasQuestions, 0
        FROM Sections
        WHERE TemplateId = @ExistingTemplateId;
        
        INSERT INTO Questions (SectionId, QuestionText, QuestionInfo, OrderInSection, HasSelectBoxes, IsArchived)
        SELECT s.SectionId, q.QuestionText, q.QuestionInfo, q.OrderInSection, q.HasSelectBoxes, 0
        FROM Questions q
        INNER JOIN Sections s ON q.SectionId = s.SectionId
        WHERE s.TemplateId = @ExistingTemplateId;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END