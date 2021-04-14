/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/**/
SET IDENTITY_INSERT Tasks ON
MERGE INTO Tasks AS Target
USING(VALUES
(1, N'Créer un article sur les migrations de BDD', 1, 5)
) AS Source (Id, Description, State, Priority)
ON Target.Id = Source.Id
-- update matched rows
WHEN MATCHED THEN
UPDATE SET
    Description = Source.Description,
    State = Source.State,
    Priority = Source.Priority
-- insert new rows
WHEN NOT MATCHED BY Target THEN
INSERT(Id, Description, State, Priority)
VALUES (Id, Description, State, Priority);
-- delete rows that are in the target but not the source
-- WHEN NOT MATCHED BY Source THEN
    -- DELETE; in our case, we do nothing
SET IDENTITY_INSERT Tasks OFF