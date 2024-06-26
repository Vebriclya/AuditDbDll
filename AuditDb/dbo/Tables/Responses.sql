CREATE TABLE [dbo].[Responses]
(
	ResponseId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AuditId INT FOREIGN KEY REFERENCES Audits(AuditId),
	QuestionId INT REFERENCES AuditQuestions(QuestionId),
	SectionId INT References AuditSections(SectionId),
	Score INT, 
	ResponseText NVARCHAR(750), 
	IsArchived BIT NOT NULL
)
