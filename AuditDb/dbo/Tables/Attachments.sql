CREATE TABLE [dbo].[Attachments]
(
	AttachmentId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AuditId INT FOREIGN KEY REFERENCES Audits(AuditId),
	QuestionId INT FOREIGN KEY REFERENCES AuditQuestions(QuestionId),
	SectionId INT FOREIGN KEY REFERENCES AuditSections(SectionId),
	AttachmentName NVARCHAR(100),
	FileType NVARCHAR(50),
	FileData VARBINARY(MAX) NOT NULL,
	IsArchived BIT NOT NULL
)
