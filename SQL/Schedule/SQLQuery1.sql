USE PD_318_DML
GO

--INSERT Groups
DECLARE @start_date		AS DATE		= '2024-10-25'
--SET @date = @start_date

DECLARE @time			AS TIME		= '18:30'
DECLARE @group			AS INT		= (SELECT group_id FROM Groups WHERE group_name = 'PV_318')
DECLARE @discipline		AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE ('%MS SQL Server'))
DECLARE @teacher		AS INT		= (SELECT teacher_id FROM Teachers WHERE first_name = N'Юыху')

PRINT(@group)
PRINT(@discipline)
PRINT(@teacher)

DECLARE @date			AS DATE		= @start_date
DECLARE @number_of_lessons	
						AS SMALLINT	= (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline)
PRINT(@number_of_lessons)

DECLARE @number_of_lesson	
						AS SMALLINT	= 0;
WHILE(@number_of_lesson<@number_of_lessons)
BEGIN
SET @number_of_lesson =@number_of_lesson+1;
PRINT(@number_of_lesson)
--INSERT Schedule	([date],[time],[group],discipline,teacher,spent)
--VALUES			(@date, @time, @group, @teacher, IIF([@date]<GETDATE(),1,0))
END;