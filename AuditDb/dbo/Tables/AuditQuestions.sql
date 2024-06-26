CREATE TABLE [dbo].[AuditQuestions]
(
    QuestionId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AuditSectionId INT NOT NULL FOREIGN KEY REFERENCES AuditSections(SectionId),
    QuestionText NVARCHAR(255) NOT NULL,
    QuestionInfo NVARCHAR(300),
    OrderInSection INT NOT NULL,
    IsArchived BIT NOT NULL
)
