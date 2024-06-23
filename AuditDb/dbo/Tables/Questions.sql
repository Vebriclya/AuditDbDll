CREATE TABLE [dbo].[Questions]
(
	QuestionId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SectionId INT FOREIGN KEY REFERENCES Sections(SectionId) NOT NULL,
	QuestionText NVARCHAR(255) NOT NULL, 
	QuestionInfo NVARCHAR(300), 
	OrderInSection INT NOT NULL, 
	IsArchived BIT NOT NULL
)
