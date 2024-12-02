USE PD_318_DML
GO

SET DATEFIRST 1;--устанавливаем первый день понедельник

DECLARE @start_date		AS DATE		= '2024-10-25'
DECLARE @time			AS TIME		= '18:30'
DECLARE @group			AS INT		= (SELECT group_id FROM Groups WHERE group_name = 'PV_318')
DECLARE @discipline		AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE ('%MS SQL Server'))
DECLARE @teacher		AS INT		= (SELECT teacher_id FROM Teachers WHERE first_name = N'Олег')

--PRINT(@group)
--PRINT(@discipline)
--PRINT(@teacher)

DECLARE @date			AS DATE		= @start_date
DECLARE @number_of_lessons	
						AS SMALLINT	= (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline)
--PRINT(@number_of_lessons)

DECLARE @number_of_lesson	
						AS SMALLINT	= 0;
WHILE(@number_of_lesson<@number_of_lessons)
	BEGIN
		--PRINT(@number_of_lesson)
		PRINT(@date)
		PRINT (DATENAME(WEEKDAY, @date));
		IF (DATENAME(WEEKDAY, @date)='Monday' OR DATENAME(WEEKDAY, @date)='Wednesday' OR DATENAME(WEEKDAY, @date)='Friday')	
			BEGIN
				--PRINT(@date)	
				PRINT (DATEPART(WEEKDAY, @date));
				PRINT (DATEPART(DW, @date));
					PRINT(@time)	
				INSERT Schedule([date], [time], [group], discipline, teacher,  spent )
				VALUES			(@date, @time, @group,@discipline, @teacher,  IIF(@date<GETDATE(),1,0))
				SET @number_of_lesson =@number_of_lesson+1;
					PRINT( DATEADD(MINUTE, 90, @time))	
					INSERT Schedule	([date],[time],[group],discipline,teacher, spent )
					VALUES			(@date, DATEADD(MINUTE, 1, @time), @group,@discipline, @teacher, IIF(@date<GETDATE(),1,0)) --?? +1,5 Часа
				SET @number_of_lesson =@number_of_lesson+1;
			END;	
		--INSERT Schedule	([date],[time],[group],discipline,teacher,spent )
		--VALUES			(@date, @time+minute , @group, @teacher, IIF(@date<GETDATE(),1,0))
		SET @date = DATEADD(DAY, 1, @date) 

		--SET @date =
	END;