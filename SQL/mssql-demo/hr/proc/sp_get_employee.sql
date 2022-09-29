CREATE PROCEDURE [hr].[sp_get_employee]
(
    @employee_id INT
)
AS
SELECT *
FROM [hr].[employee]
WHERE [employee].[Id] = @employee_id