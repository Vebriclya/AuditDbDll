CREATE PROCEDURE [dbo].[spSections_Add]
    @TemplateId INT,
    @Title NVARCHAR(50),
    @OrderInAudit INT,
    @HasQuestions BIT,
    @NewSectionID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Sections (TemplateId, Title, OrderInAudit, HasQuestions, IsArchived)
        VALUES (@TemplateId, @Title, @OrderInAudit, @HasQuestions, 0);

        SET @NewSectionID = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END