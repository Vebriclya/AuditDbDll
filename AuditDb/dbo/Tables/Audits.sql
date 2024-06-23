CREATE TABLE [dbo].[Audits]
(
	AuditId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TemplateId INT FOREIGN KEY REFERENCES Templates(TemplateId) NOT NULL,
	AuditDate DATETIME2,
	AuditType NVARCHAR(50),
	IsArchived BIT
)
