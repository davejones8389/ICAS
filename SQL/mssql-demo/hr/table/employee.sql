CREATE TABLE [hr].[employee]
(
	[Id] INT NOT NULL PRIMARY KEY,
    [FirstName] NVARCHAR(20) NOT NULL,
    [Surname] NVARCHAR(30) NOT NULL,
    [ManagerId] INT
)
