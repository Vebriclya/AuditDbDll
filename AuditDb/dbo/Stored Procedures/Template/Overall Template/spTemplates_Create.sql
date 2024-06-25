CREATE PROCEDURE [dbo].[spTemplates_Create]
	@TemplateName NVARCHAR(50),
	@NewTemplateId INT OUTPUT
AS
        BEGIN
            SET NOCOUNT ON;
            BEGIN TRY
                BEGIN TRANSACTION;

                INSERT INTO Templates (TemplateName, IsArchived)
                VALUES (@TemplateName, 0);
                SET @NewTemplateId = SCOPE_IDENTITY();

                COMMIT TRANSACTION;
            END TRY
            BEGIN CATCH
                ROLLBACK TRANSACTION;
                THROW;
            END CATCH
        END