--ALTER ROLE [db_executor] ADD MEMBER [prepostscripttesting]
--GO

declare @dynamic nvarchar(200) = 'ALTER ROLE [db_executor] ADD MEMBER ' + quotename(db_name())

exec (@dynamic);