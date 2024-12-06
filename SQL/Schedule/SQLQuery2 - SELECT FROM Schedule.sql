USE PD_318_DML
GO

SELECT 
		[Дата] = [date],
		[Время] = [time],
		[Группа] = group_name,
		[Дисциплина] = discipline_name,
		[Преподаватель] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name,'')),
		[Тема занятия] = [subject],
		[Статус] = IIF(spent =1, N'Проведено', N'Запланировано')	
FROM Schedule, Groups, Disciplines,Teachers
WHERE [group] = group_id
			AND discipline = discipline_id
			AND teacher = teacher_id
			AND	[date] = '2024-10-25'
;
EXEC sp_ScheduleForGroup 'PV_318', '%MS SQL Server'  --