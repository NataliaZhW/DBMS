USE PD_318_DML;
GO
--DELETE FROM DaysOFF WHERE [date] BETWEEN '2024-02-20' AND '2024-03-15';
SET DATEFIRST 1;
--EXEC sp_NewYearsDaysFor 2024; 
--EXEC sp_MayHolidaysFor 2024;
--EXEC sp_SummerHolidaysFor 2024;
--

EXEC sp_SetDaysOffFor 2025;

SELECT 
[date], 
DATENAME(WEEKDAY, [date]),
holiday_name
--FROM DaysOFF, Holidays WHERE holidey = holidey_id
FROM DaysOFF JOIN Holidays ON(holiday = holiday_id)
;
--SELECT * From Holidays;