/*IF NOT EXISTS (select 1 from sys.schemas where name = 'HR')
    BEGIN
        --declare @create nvarchar(100) = 'CREATE SCHEMA [hr]'  exec(@create)
       CREATE SCHEMA [hr]
    END
GO
*/
CREATE SCHEMA [hr]