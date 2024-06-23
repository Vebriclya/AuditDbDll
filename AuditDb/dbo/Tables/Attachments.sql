CREATE TABLE [dbo].[Attachments]
(
	AttachmentId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AuditId INT FOREIGN KEY REFERENCES Audits(AuditId),
	QuestionId INT FOREIGN KEY REFERENCES Questions(QuestionId),
	SectionId INT FOREIGN KEY REFERENCES Sections(SectionId),
	[FileName] NVARCHAR(100),
	FileType NVARCHAR(50),
	FileData VARBINARY(MAX),
	IsArchived BIT NOT NULL
)
