CREATE PROCEDURE [dbo].[spQuestions_Archive]
    @QuestionId INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        UPDATE Questions
        SET IsArchived = 1
        WHERE QuestionId = @QuestionId;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END