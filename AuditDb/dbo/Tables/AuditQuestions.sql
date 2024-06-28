CREATE TABLE [dbo].[AuditQuestions]
(
    QuestionId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AuditSectionId INT NOT NULL FOREIGN KEY REFERENCES AuditSections(SectionId),
    QuestionText NVARCHAR(255),
    QuestionInfo NVARCHAR(300),
    OrderInSection INT NOT NULL,
    HasSelectBoxes BIT NOT NULL,
    IsArchived BIT NOT NULL
)
