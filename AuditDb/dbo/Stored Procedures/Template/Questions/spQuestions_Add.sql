CREATE PROCEDURE [dbo].[spQuestions_Add]
    @SectionId INT,
    @QuestionText NVARCHAR(255),
    @QuestionInfo NVARCHAR(300),
    @OrderInSection INT,
    @HasSelectBoxes BIT,
    @NewQuestionID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Questions (SectionId, QuestionText, QuestionInfo, OrderInSection, HasSelectBoxes, IsArchived)
        VALUES (@SectionId, @QuestionText, @QuestionInfo, @OrderInSection, @HasSelectBoxes, 0);

        SET @NewQuestionID = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END