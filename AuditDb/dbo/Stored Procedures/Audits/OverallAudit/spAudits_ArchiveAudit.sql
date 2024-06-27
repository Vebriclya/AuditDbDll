CREATE PROCEDURE [dbo].[spAudits_ArchiveAudit]
    @AuditId INT
AS
BEGIN 
    SET NOCOUNT ON;
    
    BEGIN TRY 
        BEGIN TRANSACTION;
        
        UPDATE Audits
        SET IsArchived = 1
        WHERE AuditId = @AuditId;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END