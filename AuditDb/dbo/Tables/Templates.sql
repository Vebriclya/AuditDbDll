﻿CREATE TABLE [dbo].[Templates]
(
	TemplateId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TemplateName NVARCHAR(50) NOT NULL,
	IsArchived BIT NOT NULL
)
