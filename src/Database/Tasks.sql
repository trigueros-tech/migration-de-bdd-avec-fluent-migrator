﻿CREATE TABLE [dbo].[Tasks]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Description] NVARCHAR(255) NOT NULL, 
    [State] INT NOT NULL DEFAULT 0, 
    [Priority] INT NOT NULL DEFAULT 0
)
