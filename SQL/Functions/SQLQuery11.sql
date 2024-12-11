USE PD_318_DML
GO

--SELECT * From  Disciplines

-- Declare the variables to store the values returned by FETCH.  
DECLARE @discipline_id SMALLINT, @discipline_name NVARCHAR(150), @number_of_lessons SMALLINT--, @report_type TINYINT ;  
 PRINT('Contact Name: ') 
DECLARE contact_cursor CURSOR FOR  
(SELECT discipline_id, discipline_name, number_of_lessons FROM dbo.Disciplines)  --, report_type 
  
OPEN contact_cursor;  
  
-- Perform the first fetch and store the values in variables.  
-- Note: The variables are in the same order as the columns  
-- in the SELECT statement.   
  
FETCH NEXT FROM contact_cursor  
INTO @discipline_id, @discipline_name, @number_of_lessons--, @report_type;  
  
-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
WHILE @@FETCH_STATUS = 0  
BEGIN  
  
   -- Concatenate and display the current values in the variables.  
   PRINT(@discipline_id);
   PRINT(@discipline_name);
   PRINT(@number_of_lessons);
   --@report_type  
  EXEC sp_SetScheduleForStacionar N'PV_318', @discipline_name, N'������','2023-11-01';

   -- This is executed as long as the previous fetch succeeds.  
   FETCH NEXT FROM contact_cursor  
   INTO @discipline_id, @discipline_name, @number_of_lessons;  
END  
  
CLOSE contact_cursor;  
DEALLOCATE contact_cursor;  
GO  


SELECT 
		[����] = [date],
		[���� ������] = DATENAME(WEEKDAY, [date]),
		[�����] = [time],
		[������] = group_name,
		[����������] = discipline_name,
		[�������������] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name,'')),
		[���� �������] = [subject],
		[������] = IIF(spent = 1, N'���������', N'�������������')	
FROM Schedule, Groups, Disciplines,Teachers
WHERE		[group] = group_id
			AND discipline = discipline_id
			AND teacher = teacher_id