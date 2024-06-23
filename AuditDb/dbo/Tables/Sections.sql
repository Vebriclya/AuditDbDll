﻿CREATE TABLE [dbo].[Sections]
(
	SectionId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TemplateId INT FOREIGN KEY REFERENCES Templates(TemplateId) NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	OrderInAudit INT NOT NULL,
	HasQuestions BIT NOT NULL,
	IsArchived BIT NOT NULL
)
