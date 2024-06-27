CREATE PROCEDURE [dbo].[spAuditSections_EditResponse]
    @SectionId INT,
    @Score INT,
    @ResponseText NVARCHAR(750)
AS 
BEGIN 
    SET NOCOUNT ON;
    
    BEGIN TRY 
        BEGIN TRANSACTION;
        UPDATE Responses
        SET ResponseText = @ResponseText,
            Score = @Score
        WHERE SectionId = @SectionId
        AND QuestionId IS NULL;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END