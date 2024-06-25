CREATE PROCEDURE [dbo].[spSections_Archive]
 @SectionId INT
AS
BEGIN 
    SET NOCOUNT ON;
    
    BEGIN TRY 
        BEGIN TRANSACTION;
        UPDATE Sections
        SET IsArchived = 1
        WHERE SectionId = @SectionId;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END