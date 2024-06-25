CREATE PROCEDURE [dbo].[spAudits_BeginAudit]
    @TemplateId INT,
    @AuditDate DATETIME2,
    @AuditType NVARCHAR(50),
    @NewAuditId INT OUTPUT
AS
BEGIN 
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION; 
    
        INSERT INTO Audits(TemplateId, AuditDate, AuditType, IsCompleted, IsArchived)
        VALUES (@TemplateId, GETDATE(), @AuditType, 0, 0);
        
        SET @NewAuditId = SCOPE_IDENTITY();
        
        INSERT INTO Responses(AuditId, QuestionId, SectionId, Score, ResponseText, IsArchived)
        SELECT @NewAuditId, Questions.QuestionId, Questions.SectionId, 0, '', 0
        FROM Questions
        JOIN Sections ON Questions.SectionId = Sections.SectionId
        WHERE Sections.TemplateId = @TemplateId;
        
        INSERT INTO Responses(AuditId, QuestionId, SectionId, Score, ResponseText, IsArchived)
        SELECT @NewAuditId, NULL, Sections.SectionId, 0, '', 0
        FROM Sections
        WHERE Sections.TemplateId = @TemplateId
        AND Sections.HasQuestions = 0;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END