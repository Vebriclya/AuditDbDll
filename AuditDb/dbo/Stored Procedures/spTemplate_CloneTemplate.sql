--CREATE PROCEDURE [dbo].[spTemplate_CloneTemplate]
--	@ExistingTemplateId INT,
--	@NewTemplateName NVARCHAR(50),
--	@NewTemplateId INT OUTPUT
--AS
--BEGIN
--	SET NOCOUNT ON; 
--	BEGIN TRY
--		BEGIN TRANSACTION;

--		DECLARE @SectionMapping TABLE (OldSectionId INT, NewSectionId INT);
--		DECLARE @NewSectionId INT; 

--		INSERT INTO Templates (TemplateName, IsArchived)
--		VALUES (@NewTemplateName, 0);

--		SET @NewTemplateId = SCOPE_IDENTITY();

--		INSERT INTO Sections (TemplateId, Title, OrderInAudit, HasQuestions, IsArchived)
--		OUTPUT INSERTED.SectionId, INSERTED.Title into @SectionMapping
--		SELECT @NewTemplateId, Title, OrderInAudit, HasQuestions, 0
--		FROM Sections
--		WHERE TemplateId = @ExistingTemplateId;

--		INSERT INTO Questions (SectionId, QuestionText, QuestionInfo, OrderInSection, IsArchived)
--		SELECT sm.NewSectionId, q.QuestionText, q.QuestionInfo, q.OrderInSection, 0
--		FROM Questions q
--		JOIN Sections s ON q.SectionId = s.SectionId
--		JOIN @SectionMapping sm ON s.Title = sm.Title
--		WHERE s.TemplateId = @ExistingTemplateId;

--		COMMIT TRANSACTION; 
--	END TRY
--	BEGIN CATCH
--		ROLLBACK TRANSACTION;
--		THROW;
--	END CATCH
--END