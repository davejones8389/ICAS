CREATE PROCEDURE [hr].[sp_get_employee_manager]
(
    @employee_id INT
)
AS
SELECT *
FROM [hr].[employee]
WHERE [employee].[Id] =
(
    SELECT [employee].[Id]
    FROM [hr].[employee]
    WHERE [employee].[Id] = @employee_id
)