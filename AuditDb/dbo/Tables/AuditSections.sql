CREATE TABLE [dbo].[AuditSections]
(
    SectionId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    AuditId INT NOT NULL FOREIGN KEY REFERENCES Audits(AuditId),
    Title NVARCHAR(50) NOT NULL,
    OrderInAudit INT NOT NULL,
    HasQuestions BIT NOT NULL,
    IsArchived BIT NOT NULL
)
