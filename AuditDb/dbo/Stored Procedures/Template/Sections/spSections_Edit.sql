CREATE PROCEDURE [dbo].[spSections_Edit]
    @SectionId INT,
    @Title NVARCHAR(50),
    @OrderInAudit INT,
    @HasQuestions BIT
AS
    BEGIN
        SET NOCOUNT ON;
        
        BEGIN TRY
            BEGIN TRANSACTION;
            UPDATE Sections
            SET Title = @Title,
                OrderInAudit = @OrderInAudit,
                HasQuestions = @HasQuestions
            WHERE SectionId = @SectionId;
            COMMIT TRANSACTION;
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION;
            THROW;
        END CATCH
END