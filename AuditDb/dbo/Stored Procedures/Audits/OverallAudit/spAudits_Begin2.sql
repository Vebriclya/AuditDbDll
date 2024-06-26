CREATE PROCEDURE [dbo].[spAudits_Begin]
    @TemplateId INT,
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

-- INSERT Sections into AuditSections
        INSERT INTO AuditSections(AuditId, Title, OrderInAudit, HasQuestions, IsArchived)
        SELECT @NewAuditId, s.Title, s.OrderInAudit, s.HasQuestions, 0
        FROM Sections s
        WHERE s.TemplateId = @TemplateId
          AND s.IsArchived = 0;

-- INSERT Questions into AuditQuestions
        INSERT INTO AuditQuestions (AuditSectionId, QuestionText, QuestionInfo, OrderInSection, IsArchived)
        SELECT ase.SectionId, q.QuestionText, q.QuestionInfo, q.OrderInSection, 0
        FROM Questions q
                 JOIN Sections s ON q.SectionId = s.SectionId
                 JOIN AuditSections ase ON s.SectionId = ase.SectionId
        WHERE s.TemplateId = @TemplateId
          AND s.IsArchived = 0
          AND q.IsArchived = 0;

-- INSERT Dummy Responses
        INSERT INTO Responses (AuditId, QuestionId, SectionId, Score, ResponseText, IsArchived)
        SELECT @NewAuditId, aq.QuestionId, asec.SectionId, 0, '', 0
        FROM AuditSections asec
                 LEFT JOIN AuditQuestions aq ON asec.SectionId = aq.AuditSectionId
        WHERE asec.AuditId = @NewAuditId;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END