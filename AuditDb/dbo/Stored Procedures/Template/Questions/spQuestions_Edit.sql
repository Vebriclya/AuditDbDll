﻿CREATE PROCEDURE [dbo].[spQuestions_Edit]
	@QuestionId int,
    @QuestionText nvarchar(255),
    @QuestionInfo nvarchar(300),
    @OrderInSection int
AS
BEGIN
    SET NOCOUNT ON;
        
    BEGIN TRY 
        BEGIN TRANSACTION;
            
        UPDATE Questions
        SET QuestionText = @QuestionText,
            QuestionInfo = @QuestionInfo,
            OrderInSection = @OrderInSection
        WHERE QuestionId = @QuestionId;
            
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END