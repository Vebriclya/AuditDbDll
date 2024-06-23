CREATE TABLE [dbo].[Responses]
(
	ResponseId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AuditId INT FOREIGN KEY REFERENCES Audits(AuditId),
	QuestionId INT REFERENCES Questions(QuestionId),
	SectionId INT References Sections(SectionId),
	Score INT, 
	ResponseText NVARCHAR(750), 
	IsArchived BIT NOT NULL
)
