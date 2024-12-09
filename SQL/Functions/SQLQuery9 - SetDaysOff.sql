USE PD_318_DML;
GO

--CREATE PROCEDURE sp_SetDaysOffFor @year AS INT
ALTER PROCEDURE sp_SetDaysOffFor @year AS INT
AS
BEGIN
	EXEC sp_NewYearsDaysFor @year;
		
	IF NOT EXISTS (SELECT day_off_id FROM DaysOFF WHERE [date] = DATEFROMPARTS(@year, 02,23))
		BEGIN
			INSERT DaysOFF ([date], holiday)
			VALUES (DATEFROMPARTS(@year, 02,23), (SELECT holiday_id FROM Holidays WHERE holiday_name LIKE N'23%'));
			PRINT(DATEFROMPARTS(@year, 02,23))
		END

	IF NOT EXISTS (SELECT day_off_id FROM DaysOFF WHERE [date] = DATEFROMPARTS(@year, 03,08))
		BEGIN
			INSERT DaysOFF ([date], holiday)
			VALUES (DATEFROMPARTS(@year, 03,08), (SELECT holiday_id FROM Holidays WHERE holiday_name LIKE N'8%'));
		END
	EXEC sp_MayHolidaysFor @year;
	EXEC sp_SummerHolidaysFor @year;

END
--SELECT * From Holidays;