CREATE PROCEDURE dbo.sp_add_new_employee 
(
    @forename nvarchar(100)
    , @surname nvarchar(100)
    , @gender char(2)
)
as
insert dbo.employee
values(@forename, @surname, @gender)