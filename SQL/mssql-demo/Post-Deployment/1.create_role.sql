IF NOT EXISTS (
    SELECT * 
    FROM sys.database_principals 
    WHERE name = 'db_executor' 
        and type = 'R'
        )
BEGIN 
    CREATE ROLE [db_executor]
END
GO