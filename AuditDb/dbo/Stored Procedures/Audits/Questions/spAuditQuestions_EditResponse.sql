CREATE PROCEDURE [dbo].[spAuditQuestions_EditResponse]
    @QuestionId INT,
    @Score INT,
    @ResponseText NVARCHAR(750)
AS
BEGIN 
    SET NOCOUNT ON;
    
    BEGIN TRY 
        BEGIN TRANSACTION;
        
        Update Responses
        SET ResponseText = @ResponseText,
            Score = @Score
        WHERE QuestionId = @QuestionId;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH 
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END