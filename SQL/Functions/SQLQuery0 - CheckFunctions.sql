
USE PD_318_DML;
GO

EXEC sp_SetScheduleForStacionar N'PV_318', N'%MS SQL Server', N'Ковтун','2024-10-25';
EXEC sp_ScheduleForGroup 'PV_318', '%MS SQL Server' 

EXEC sp_SetScheduleForStacionar N'PV_318', N'%ADO.NET', N'Ковтун', '2024-12-02';
EXEC sp_ScheduleForGroup N'PV_318', N'%ADO.NET';

EXEC sp_SetScheduleForStacionar N'PV_318', N'Системное%', N'Ковтун', '2024-12-02';
EXEC sp_ScheduleForGroup N'PV_318', N'Системное%';
--EXEC sp_ScheduleForGroup N'PV_318%', N'%';

--DELETE FROM Schedule
--WHERE [group]=(SELECT group_id FROM Groups WHERE group_name=N'PV_318')
--AND discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%ADO.NET');
--AND discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'Системное%');

--PRINT(dbo.CountLessonsForGroup(N'PV_318', N'%MS SQL Server'));
--GO
--EXEC PriPrintScheduleForFroup N'PV_318';

--SELECT * From Schedule WHERE [group]=(SELECT group_id FROM Groups WHERE group_name=N'PV_318')