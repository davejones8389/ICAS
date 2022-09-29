CREATE TABLE [dbo].[employee]
(
	[id] int identity(1,1)
	, [forename] varchar(100) NOT NULL  
	, [surname] varchar(100)  NOT NULL  
	, [gender] char(2) NOT NULL  
)
