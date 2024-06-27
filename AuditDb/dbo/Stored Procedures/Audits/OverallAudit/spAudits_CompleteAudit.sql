CREATE PROCEDURE [dbo].[spAudits_CompleteAudit]
    @AuditId INT
AS
BEGIN 
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE Audits
        SET IsCompleted = 1
        WHERE AuditId = @AuditId;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END