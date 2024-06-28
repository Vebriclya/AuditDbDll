CREATE TABLE [dbo].[Questions]
(
	QuestionId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SectionId INT NOT NULL FOREIGN KEY REFERENCES Sections(SectionId),
	QuestionText NVARCHAR(255), 
	QuestionInfo NVARCHAR(300), 
	OrderInSection INT NOT NULL,
    HasSelectBoxes BIT NOT NULL,  
	IsArchived BIT NOT NULL
)
