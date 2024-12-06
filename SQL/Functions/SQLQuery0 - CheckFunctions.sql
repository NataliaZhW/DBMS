USE PD_318_DML;
GO

EXEC sp_SetScheduleForStacionar N'PV_318', N'%ADO.NET', N'Ковтун', '2024-12-02';
EXEC sp_ScheduleForGroup N'PV_318', N'%ADO.NET';
--PRINT(dbo.CountLessonsForGroup(N'PV_318', N'%MS SQL Server'));