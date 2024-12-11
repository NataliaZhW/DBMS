USE PD_318_DML
GO

DELETE FROM Schedule
--WHERE [group]=(SELECT group_id FROM Groups WHERE group_name=N'PV_318');
GO
EXEC sp_ScheduleForGroup N'PV_318', N'%MS SQL Server'