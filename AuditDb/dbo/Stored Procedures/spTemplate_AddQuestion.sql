CREATE PROCEDURE [dbo].[spSection_AddQuestion]
    @SectionId INT,
    @QuestionText NVARCHAR(255),
    @QuestionInfo NVARCHAR(300),
    @OrderInSection INT,
    @IsArchived BIT,
    @NewQuestionID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Questions (SectionId, QuestionText, QuestionInfo, OrderInSection, IsArchived)
        VALUES (@SectionId, @QuestionText, @QuestionInfo, @OrderInSection, 0);
        
        SET @NewQuestionID = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END